Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61987CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 02:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YEVSweRiJIFFM92G7CI5lIVwON7XPQd0EAv/NVq7jo=; b=Ub1wV9IM8G+jo43wjaUKYJ3oQ4
	tlyUPV1mMdRzrmSirPW3KTk/RcWB1U12OHM9pHsEV8RnUEbTvgTAhh+jGbHNEZjFDr96g6RM81W5L
	Itm7foNS95Omh+Dv+XM1Mj5oowKT/TJym8DDun34XUH4e4RsE4ViKBqGlTSqp5jbXq2XB5vQlE+Zu
	vnmQPDHrKXmTEXeqmgtMSx/DmcGe/Q9SSPDG2iF3IhQfGXFGBMU0s6+EGXhez5xtELx8WgHO8APQ8
	b3g+bQZY7f152/4g3vktOsWmUJy+iOt6x69LPUZEFIoGWRfbdEIzNAUvn0YJhRUUe3u0CJrj87Tq3
	LPFtkpsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbkH-0000000E8Mm-0ZRP;
	Wed, 03 Jun 2026 02:54:17 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbkF-0000000E8M8-2JmJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 02:54:16 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-396771119c4so34047531fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 19:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780455253; cv=none;
        d=google.com; s=arc-20240605;
        b=h/vouG8O6/Vt2bY0USqgSo9BGRjqpPWk8fNQnSyV+8xPvH8UmMKgBdpG7fBCd9mnx0
         rKRnr8WDOlGMeo1yVieUgmL5oloHr3pORJYtjbTgLHK/dv4HYRIrlpZFsg8RwGl2IWw5
         qNR59/C52LEjgV1lEz796b6YGHeZs694SCdyQpXxg6odZg1haLfgr8DNQI5lp5mZhUki
         93qSUloaJNg7+63gByKzd/9wa6LMyU5eIfQZLpQ9DQggrs3WGgLwjM4I5MhN6Ursnzz9
         0snIokgyGq0bsNLsaEPBLBdW4db59aJghkXofBSrcqW8heQD6PJfPUb0bpIqtIsmWMih
         SvSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6YEVSweRiJIFFM92G7CI5lIVwON7XPQd0EAv/NVq7jo=;
        fh=EhASGG3a8erxfy4kRajDhfFWtp60pjj0J+3yiH+3UHc=;
        b=bgQF+sPO8jyuVRr41pEcJWZgjDHdvBM0z7ixPNxuI9c+QyEbhZVS7qYKmFPh9B7AKL
         Yvh441u4gi1A0CaD/OVahP4bIbFseU64hLbogh0aSSEgRzI2DiJrPiROL1lBkq4tbpYE
         1xpQTMiEUH9aLmcyCo0/joFqePLDUz2/sttQ3/mCj2uv12v3nq6PY4elVDl23XAPTXB2
         Re07GcQJrGatTS+qid/mXOn1GyGJy0DrZvUcMMjFWtATRDFp3z78VVwgjctsx2y6IBxM
         aCixwwc8oamYXAmn0uALIt1UdwXNewW8TSqbvAW4/uqZioSOGXfhm5OdA9dy7QOh39lU
         4RiQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780455253; x=1781060053; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6YEVSweRiJIFFM92G7CI5lIVwON7XPQd0EAv/NVq7jo=;
        b=o1MTatwoI9HFsHMZgO4fiVd9b98WLdwsOCQn/hv6ijMXxhqko9epSU8AO2g35WW4EU
         dUjwH2tD2pf68Abe9YaFSYM81l2UnjWEK0uZalg1v/pOQioSKNcrkZUNUiRS93PtBHSi
         mG6wDNpPxU6nj4+KArxchy79ilGmPK1EuXTnYfizc1AHYw0AYipuqlzzNS7fl6lnKd2p
         uK71QH7e7aLUDnE0RvW3tX/+Mdce1q5A0DRgodYBqX1ThqMOUs45wsMQkblSZMUYKCyp
         1uFPWUlxRahLpsiSZe/XTJnG7ncurJtf81ZCs5K94Dn6m2g4Ju74bDAq5sg/w07nV1Rz
         qUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780455253; x=1781060053;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YEVSweRiJIFFM92G7CI5lIVwON7XPQd0EAv/NVq7jo=;
        b=asakdP5dFGjH7lHgfWcDwYfWxB2DpWAYb1rHGqhCLuFQP9f9GJKtmzg1FjGp2nRBFp
         N1aMVfMGOamBXeGxpYEQchUVJGymHfgbkRZFClBukEbYY5WGs3a90JTDC9a22Ja48swB
         JmC312qYyViZacRMI801fATuz5kl8Yb82Jf01O4Yi/aL3TQVMPe7hJmrg+cMkO2H40FY
         TmTko0tsaMUCwNdh0drIv98BV4rmx7+wW3Ci5tFBwIsrasaL7lbBLHkCYIerwEHTdcSj
         vxS3A6w9O8TXlEAr7FQKJKYg4Y9e3RiLGVKPh68i8Z0w9aLvcXYwMD2iO7I1vLe7vys4
         M0Gw==
X-Forwarded-Encrypted: i=1; AFNElJ+++1ZIGDffyKiT4gCpRAKjoYDZOjDxeFVmadMeZZmQXcoEYtOL19cCv3mhaHBaKfif/VXhjbEhDfbmVPY8pQd+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3aAaDzYZrOo0cNZZ4qSzQyxxPbAgjG0kn89JhY0phkZFXENzU
	bMljKosTuHtUQmvWXdlYtXLXq/A0x2oEiPks3Z0kydLrgYHsN9gDxAf+kmTmGXlw7mkWPaBrV0g
	V4t8G67ztkBqXFLLxI80EpbJpR92gjRg=
X-Gm-Gg: Acq92OFQAFV0u+0H3CWh8NvTelzbO3l0D0RD+o29iwjc54JhpPClKecxBk2rA0b7gdz
	Wmbt+t6k/7OxhhFjZla2RUqKdSsvHtzcLF6Oy15OuAV1Ibe+HT72B1zDACSv3SO4Jrqtpoy0l19
	xoMaes9Nw0bvBe2nQwqc4bAP+Mkke8T/nZrh0LWTx7IOtTUXP6Gu8slEqsaxn9Dn3bkXF356ZXu
	Wf9MhXSE42QuNOK+oACROP7klmYQw/CVa7Cp3Ss1oxs7yxFOqcjHJV1il8sRN1vpja5HneSYPVi
	Cukn9kaenOFqfd/9
X-Received: by 2002:a2e:b8c1:0:b0:393:ba06:158f with SMTP id
 38308e7fff4ca-396af436647mr2834231fa.16.1780455253043; Tue, 02 Jun 2026
 19:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260504164711.2854116-1-dbgh9129@gmail.com>
In-Reply-To: <20260504164711.2854116-1-dbgh9129@gmail.com>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Tue, 2 Jun 2026 22:54:01 -0400
X-Gm-Features: AVHnY4KNwoXo7QpfYN1PxgSWQeICNocegKeRauPpmBUxYtBRqMrv5QlOe5Fanmk
Message-ID: <CACrCO_Xw+xi1jjNGmVjV3-7v_v=9AZ1Nm_FHGvf_B7gOu6G4Zg@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: OMAP2+: Fix OF node reference leaks in omap_hwmod
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_195415_599607_7D32A642 
X-CRM114-Status: UNSURE (   9.74  )
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

Hi,

Just a gentle reminder regarding this patch.

I would appreciate any feedback when you have a chance to review it.

Thanks for your time.

Best regards,
Yuho Choi

