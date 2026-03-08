Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3E7F55134
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 06:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9EUtHOwPZ+AhaBRS+tyPj8l9Ae1+JBLJrSOTEwuX73g=; b=u6o4g+5PzovCqQ2Bk7Xr/SP/Be
	DHZWAQqKzumemjYxDuScIqzLwgJ1MjvitOnw4GE9iyIq+wT1/VDP2xNQQYq7L3hkxcHOClbqRxx+R
	7KjsV0AjA6NkkK9cZTTmqVJIGEMBoRv+5pwTPywEELBwowix3riMDyzFgreVX5UbCFwstzWOqMB5s
	mShbg0pQNs0Bql2p3Hc0v2pkkhb+5dzzBpmPCA8MPwOzFDeVfx4cflvNLj82+K+TNlggqAz2IKxk1
	zy6KwqiddIGZkv5iX/ReJzejeuS5OmJuK4OCp6WiY5BOgNRl2T7qlYdXRrXQbO0a+rYpou5cU/kUD
	h8ldRbDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz7BM-00000005jyj-0mHk;
	Sun, 08 Mar 2026 06:00:04 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz7BJ-00000005jy8-2CkA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 06:00:03 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c6e3e4e7388so4230480a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 22:00:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772949600; cv=none;
        d=google.com; s=arc-20240605;
        b=XVGzf0r7qU1RVNB/F6W67sXNISt5LBlI8GODKJ7HSnM6jm3cvJtWU6FPcjALCYRssy
         r0lbdfFVpfiFyeHH0VsEAXJE9zT45vnx9HLIR4cO3EU4FVxYiEhUV0Lm+bjvEmBaekmL
         SK4uB17k9VpV09LcwbPxyFIKiNAzf3e56aCR0uSSYWyIZY6CHhbWxcOCIuAeRakcvc07
         drtniHUpG/UHjFI54oIlK/dbg+mvXpgUWVfXFBnQhiRtmgl6iMbj6LtTRy/bP3x0EsZZ
         1Ulb0jC8BWinjt2ryfRyszSJujLE5DXDSG4FkfiB7cPkl46GxUVqfyBiqldZSxusN+xi
         0w3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9EUtHOwPZ+AhaBRS+tyPj8l9Ae1+JBLJrSOTEwuX73g=;
        fh=Tyg+wiY3NGaoIlP8HbRaVMDPtjHKqA6MSb/bn9wyONA=;
        b=DdRLF729lV94DQqVA/joFCc4wzHHZ541sj1GqzHmJecSFhfcAVkn7+FD4YJt9dbqjn
         /4SIfCIIZkDEX2cKEopM6RPK1eCUXHtdD7MEJnwm5+Mu+JbCCCfsW82jZiTpS4Lz/xM4
         yUL/VABHMut1uNXc2ywufaitiVekNIZcmUZP/7sduhW3XtEg16w4lklKem83k+C3j4Rj
         BWvkFyjVvmbICAJA9MGx+QuOa/nrKPb1rN79oPVxZ7ANo9T5No0hK9ZbEc7Ytr6FXBRP
         3L659dVl9HU9xt/mSkqM+/3bcQ2XxSPXRTREi7SvdO7FYNPHMqNEEk75oUSOoth4Se77
         1B6A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1772949600; x=1773554400; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9EUtHOwPZ+AhaBRS+tyPj8l9Ae1+JBLJrSOTEwuX73g=;
        b=QFrfZMBMSnU8SOjwg64aHkjXSZX+orBz3d+8WT43PePeHnIkxkUJJzqf1B7bF7dN3H
         ytO3huTVo6TH2fCLYEM5XOBBLb5WtBcXn0Ko6zt0H+v3u29LvKgIz5mKqEs7l0SWG8ag
         gxW3BVJkLD3sVIaGYRcu8OEb8jYpQH5LMw2Vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772949600; x=1773554400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EUtHOwPZ+AhaBRS+tyPj8l9Ae1+JBLJrSOTEwuX73g=;
        b=k9XIq/f+zaxDUau5zsjY6vPVv5jWAljbmSNaEhwq6032BNi8FQVBCIqy6xyCOXvx2v
         R9ctDBcelq+1G3PZEqhLpo96rx7x35koVt2QxAuOXu9qoGw/dykQxi+DguPkBCSfkKcS
         uGiGtI0lLFKPbAaGyKJiQQQQbmhSFLvuqwduREcqrRq+m0BoO++UqgYRxRfhgHXBKumg
         sIPCbNQKG432K2YyfUuKY/vAhuathV+yFHKPidZpS3XnswrFXFWw4ZNAZHhVwKAXJZjE
         vcpzNxpYZxnpdVKEOmVoifjTdsc1Nef0mv1MNJgatDcxix8926AeZMbe6m7+nFgRSu6/
         EfKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVblhwFze4YcsR1F5lR0PjzalLwJ4DXUKpwNx9gXSJ2qg3XMsyjVyXhPplMfCwRgwwaPxcSIvBEmuYeFCtRFZiH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4YTMoJ4HhoIkhbdtFNLnsxEkbeNP/AVPnlUOWvwCjk4ThJtz7
	zoNYA5qtxwLNiZAozmIP7ujPBaIu66bAS9O6K8fmInQHsmwJ8OJ2xsjVgzcub3l48u5J5Re7lT+
	3wO0kOv0C2wEvrFSZGEB48p5lIyYZwEaqWeXQW3IKUg==
X-Gm-Gg: ATEYQzyyxtbQ0k8YmzDdV6pMhWWfLIAj1tpvrPzQ0pbIxm4IkQnU8vnLzdSqWpyGOUQ
	GJC7hcF7H0T/GVkISB+Y/QTckdbcWgxI/zFmJ4NPibhE9fadafgGC52K27INHsDQIRWzxZMQ+gQ
	vOTaRJvnHl/EbPgtqJ6fU9NF7pj8RzOgcnGrMbKVfeRObs/aofmtXSRt30mUop1/YA0d2Sby7QQ
	+IIiSXfd40lVZwzUmCZi7nx3BgntN4/So9uJTy/VTpP/mG6cORHn9HFg06kmP8xxd42Ue8YHXF+
	cBHnOUsiyQ==
X-Received: by 2002:a05:6a21:3b4a:b0:398:7796:ddb8 with SMTP id
 adf61e73a8af0-3987796e0a2mr2084371637.60.1772949599725; Sat, 07 Mar 2026
 21:59:59 -0800 (PST)
MIME-Version: 1.0
References: <20260308021535.48098-1-rosenp@gmail.com>
In-Reply-To: <20260308021535.48098-1-rosenp@gmail.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Sun, 8 Mar 2026 14:59:48 +0900
X-Gm-Features: AaiRm510gP8H23l1I4hc-O8_tv8pfmPKaxxv5LtBLQP8FXFHqw0aA7QhpFGe49M
Message-ID: <CAFr9PX=Aey-NJwKZkfsUKFWbQqj63eK68qAoLW_dXmPAnUw1KQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: msc313: remove kcalloc
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
	gustavoars@kernel.org, Romain Perier <romain.perier@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	"moderated list:ARM/MStar/Sigmastar Armv7 SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_220001_891712_3D346394 
X-CRM114-Status: UNSURE (   8.21  )
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

Hi Rosen,

On Sun, 8 Mar 2026 at 11:15, Rosen Penev <rosenp@gmail.com> wrote:
>
> Use a flexible array member to combine kzalloc and kcalloc.

Thanks for the patch. This looks good to me. If I get time I will
build and test this but I can see why it shouldn't work.

Acked-by: Daniel Palmer <daniel@thingy.jp>

