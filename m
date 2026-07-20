Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2842C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 05:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6NVY7nCUOS6eRqN28XA6yLYq6AGh2fODwowWpZd9JU=; b=2nM8qtJ+02akws3wDSFCqVxVnK
	w7KEWRTvS2b19IpHKerfPbnHe32sOgyNBp2+pkQScGodA03IzgSbnE1l3cRbag8eQtqPoqu0lP+WN
	o/zfdtvM/DHlpDsXAYxfGcwdjokyHFxKxEIG0rCvI9GchaHy/mgv9YY/SZw260vSjleYrLv8nFN6j
	aQ48YZSezGFWNGbs41hRKqKnwVyBKGspOuPUVN7fvUHGXfaTwvL5j9NDHRoGxNs53kEXFjXAv93ve
	7mjrrk4U1eSh9kBA3MZY/hkIlcqan/JAJMRB9VM3VRsY552M1sJlbSWq9XNVt/dS85nfEe8E2O/GP
	U7qrUonA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgjd-00000005szX-2Orc;
	Mon, 20 Jul 2026 05:40:13 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgj6-00000005sW0-1fNX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 05:39:41 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5b01cb18515so9285480e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 22:39:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784525978; cv=none;
        d=google.com; s=arc-20260327;
        b=hP7yqFrsAxZJ0c+dlShTwIXElx23w6ILiYFH7ZPyR1r8z6Gt2tVh+j4gDGTOwltPiL
         aH63h7SscPHd0s9fPjQPkXFSx6+G2K1ePnNzkIRINsk8alpNFh7frX8BgNxnhZrqeXXN
         WrIhJG7kgXZGeZL/MrNS7Aq/eczeiHS6uTuTXq7U8jioD5K3uMdyy6yycN3nQLT0lIid
         pBzClSTJZZsRT+0uGfKBgfaDr/EGYI9nNzwHRFyTadTGWsWvSsVj/a0C/UJlhjh7aohT
         ZDED7554jJlXPq05Pal9Yi8V7H1+ZzijRCXOBr5DGgqhAR6KKdPSXPAcmBCbMLUkuoB3
         mS0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W6NVY7nCUOS6eRqN28XA6yLYq6AGh2fODwowWpZd9JU=;
        fh=GWCGC4ayQUrodS59keHYsTKSYuoTqjOIHZ/cnp/cdTc=;
        b=ZW6q3VeXQWbFYlY+rZC1+mgLmLvOZImT57IkM2ofADNZrNQ8qPNgDOCTrx5Ky61AJF
         ILewlVhoELzrbvb3PFA4Gr51LijPNMNwjgWeMDFQNG1oCBBUVG4bwPoeP6ge7yChJxTV
         wtiDhz/wkDpAkEPvqwY96bLs5G92j6Q+SbOlLxkW7Go8wRMpCj9z726T8L9OS6LPPg+6
         /FqcQYJ9gvIgBspE0zVGX9p+hhdvLifW8hYvnyElAeHaEYQdMBfXz/O27sy/roYPWiLm
         qADHNq/A2VuykGwVceJ9lPTZ7m/1sAAsyUEGSNnFo2CftVMX0nBBmqRo4cQ+lF8AFNp0
         zdWg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784525978; x=1785130778; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6NVY7nCUOS6eRqN28XA6yLYq6AGh2fODwowWpZd9JU=;
        b=X5tLQybcce9Lnp67epTNgTPDD9hWWYiw6G2/6SHHe9GnuYHm/LexVp/Z1a0WNvSL9i
         M5HJLFbyjoO8hgTwFMeHFWEbV2Rl9oDTbvz9CEDgZjcmddmtynMuz3Oka56NPwvjsTYY
         7fWIrqKiR0547xNWw6XG3ybOOTryY0NwMIzieThwFnPWsLNaTWOX0Tsz+RqopSl3KG3d
         jOD2zGTpoHK0YZB6rTn7snBdThKgFM19igBRrPzIH1THUL5x9LfgCX50vcQZwn/BYy0o
         IzUMKg04ykqvkrZA/HhcGBatDksL2ywV7yOV5qeRC65vdrq41qnVPJCjy9xbtsuWVZie
         fjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784525978; x=1785130778;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W6NVY7nCUOS6eRqN28XA6yLYq6AGh2fODwowWpZd9JU=;
        b=Hx3PwqisDlqqrywDu+vfRDetcjHJWLaDSv/VaAoL+33gc4+8zL9gk9Ws5a3lwmqEoR
         OK+ME3ceh6mFu3FvcfJFYi0f1W9Yh+HQi0V13ax/mCiX3+xWtWJe1+ygna+Y4hpGdE9U
         AIl+J2o41AuVV13UFgqAAUwRMwzntGfeFjdjF/K5UMfBkmbAH4riS6JFZibvGFCbF8wj
         o0Llo+y398hLPaUHQIfM+OG0llH6ibNC3K81za+JyvZA5CAlIysqP1Wytf5T/ENjaDi+
         02ZXaIS7VGzf3QVYqUo2WTaVY3kk6XheOopU7TGbSml+bs/Rchxnydr5kVs/io+gofKv
         R5Lw==
X-Forwarded-Encrypted: i=1; AHgh+RpnWayOKrW+l6YEXSz9SNBE/Qsc9PUTUj2KJrmu0XCG/wVDZPVcySpxYWzT5Xkls2XCidFUZBWya83iBL5+y+L0@lists.infradead.org
X-Gm-Message-State: AOJu0YyfBM9C2PVJkt5usUamTMWs0qySrm/mgo+WBe6QYI8RurzOUeZ2
	sVk/H9360K/KVLaYQFsZKJo8NGyujkcBLYCF7OrJQaKUD3V3RxAZl0QKhoKAA78skzA4ryWTOnm
	nYBcKPsLBT+fvraxXG3gNan6jZDsQ0Vg=
X-Gm-Gg: AfdE7cnHbgUodqoYEfDfVKblcYvj4ZH1UDBZqhtMaJv5SSN2y6bpH5LjtaTUkS0qgKg
	D7T5vdI4xHof4QCXE3sfw+0xpn/g8FUFqrDxsxsEf4QzRJ0jSrhjWVvk1IrNoOvpsOdVu7d4Bxi
	8uvYU13YGwWkB5YwIYkDWfP2ITLBfDlvQZA0U6EwTSOz5k9RcaOI7YKhkIQ8q2+MjNaQ8XQ5HSb
	EAViGDmcHsGxsj88u7ld9Ux2RfpXQC24LA0xNBgC/XLfs13CfxZQOVgEiVG
X-Received: by 2002:a19:f518:0:b0:5ae:bf95:38e7 with SMTP id
 2adb3069b0e04-5b28f87cb15mr1651466e87.10.1784525977505; Sun, 19 Jul 2026
 22:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260717120005.2087386-1-rok@kanardia.eu> <20260717120005.2087386-4-rok@kanardia.eu>
In-Reply-To: <20260717120005.2087386-4-rok@kanardia.eu>
From: Alibek Omarov <a1ba.omarov@gmail.com>
Date: Mon, 20 Jul 2026 10:39:26 +0500
X-Gm-Features: AUfX_mxWr9jRQfWnrNfb652ggdrTJfNDWLizy8QL0xejOpCnF33xEHR31Qj3tRw
Message-ID: <CAKyg=SV2-81VFgr+Tq=-Si5EO-86MA+ZFoQ+DX1fEYdnnLYJng@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/rockchip: lvds: add RK3568 support
To: Rok Markovic <rok@kanardia.eu>
Cc: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Jakob Loeschke <jakob@loe-web.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_223940_468890_4BB57A8C 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> Based on Alibek Omarov's earlier posting [1], with the changes below.

Hi, I'm Alibek Omarov and thanks for picking up my patches. I didn't
had time to finish them and these days I don't work on hardware that
uses any of Rockchip SoCs. However, if I'm not wrong, it's still used
in production and I had report from Jakob Loeschke (added in CC) who
confirmed it worked in their setup as well.

Thanks.

