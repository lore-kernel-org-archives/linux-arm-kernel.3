Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54ABC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 14:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/i+wfnz4csbIqOFspyRymSD9kSCFdpRJiOKiIAQ2eo=; b=XPK9BHVzr2DXUgmL+2FFah4wb2
	3rRdzth8mCjYu8FzwSWxMsAY0Z8tSmsmAZZqgwGAvnRQvWsAVEa67L+hArlyLspEgbk2BB8ety75j
	gNsCRoOnXjEu7mMzw+8HBlVnJf6psOqtqgc5y6VXX6ldr5TmWtsxc2MYpcsxJiT3rAfkyIeupz/Oz
	Alrr9cSMN/XK04td/JEAUNpEao2XOmneQiHf5kT+x28dWRC9zPJnkXKTz0px/kCmAgyqBqNYDooRU
	KyDE4a9Cw7doCcaNNAoXEMdphSNYBWIfW79E7dgrUHRrCl7J6IKbALiwngfzVL19sE4ajBb/r/5Iw
	cVekz0Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIZb-00000004e4l-44Ib;
	Thu, 02 Jul 2026 14:39:27 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIZZ-00000004e4R-3L1q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 14:39:26 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-474303f3c72so1241646f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 07:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783003163; x=1783607963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/i+wfnz4csbIqOFspyRymSD9kSCFdpRJiOKiIAQ2eo=;
        b=PrTn6+1KGuWUK94AgJxw2f0Q9rmO2y6nNfCgjsoPvLjfw+dcuf7ln4XYtBQTsMzTp1
         KKiOVz9yTIYpHME0D93d8qu4d02dAFo9jkfdsHFhTtaXj1fl6EnrOJu88N68/WkYGtoO
         xlT27Sgvwg41ZY3bSEDz7SEvrHv4iftwQDGJLqgqWQtXoXG3bCLTEltRdBT1oik1HsY3
         xM1SgNiKFg71bsnrGHkVu1dsUJ/4Gz3itsRbMGyrl2FxdvNnKaA+W9LMqXMohIg1D5xZ
         Ma2pTYbhyT56/QKE2k7iHHbPSk1/PXFPVqi827t+BZkokKQfrQRzs1QDHUNdgrtaXn0o
         OtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783003163; x=1783607963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A/i+wfnz4csbIqOFspyRymSD9kSCFdpRJiOKiIAQ2eo=;
        b=OlVi1vFaJZqCuNrvQqe7rEz3duF6u/yYUYdJWDVOvweDcDcLxVj1VkER3q7f71yDTN
         6r9cESach3HpQHtw6EJXiF4VLdDLozm20QSzwL9ApudTvwi/W+s4KOYwu/68PG+L02RP
         cordQIaWpTriEyNn815b7/SLFdQ6B1jLVIuiOVR2aB9aX5lZ7UcTzx3Fyv+w3dobN7V5
         UZXzJ5F/JviG2N/gYvKFX+GdS/VeRQytgeTtN1wAk1m44ASVwaA4eun07CB74q0lxPes
         rRKoY6PlCOZNvwjrXDcTgr6HC24+BMEsf+f93tZJV0VwHxCFJc+wYKj4bVG7Hul6dV5j
         aTfg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5nc3SsVOo1q4bppLQsiBYeloc+T/47fUGzgIU5DNxizdfHs5buPRp3bavrBCXrAQ3GHz8xtN+5InuvbEcHut8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt3tsaGuEh+iGWFOsR6OQkDMfhRyCY8TlZjFp/UXvZ6wGWVtqC
	yuHDLMMOYCh8tQ2DndImmorOpA+MpWi6lh6V+YQoGIaHj9l7zHFlqp6J
X-Gm-Gg: AfdE7cl9akw/vhIQJLvf1yQmz1ch5uHj5JH5x67tmKSMcdjtYFeTTJy3lyrfw9k1BVh
	HuvHhxUh9WB7a3arBIjG6Y11Axz2P1QnCA96AtPJPoilRpkr8BuV+7VmGhW+auNvp/8ih5snSn0
	lRt3ivoOP1wfhceIZX5Snm6T9JW+NA5Ixa8zt8j5AASTguD/y9fDFxflLEDLEZXhgTVwWXVHtCI
	hblV3pccJniDUE9HV0XrV0HFiccQdWa6eoqXvZ9pgzkifFM9n1d2GQ7RYjNdVCNDiP7avKC3pQS
	GK/ptn/zWTRiKrZWgROqL5ihg3JFAIagnzbRXhowkEdn4E3g/HwCf9Z36L87GhApTwuPCIoyVKF
	nfUDgK8o3/oOHe6EPTDQT3foo2Ap/0VOQa3ACUevQA8mH3BRggEk1a/k/wlT3Mmp0tjaFyn62vC
	siIrcV18lY3Hle/5d2YV/kkR5MtpnEpfjpVYW8y6yI54iWIUe2qlW9Yn9YMSmJ2tVADiT3ipg6U
	0JEDvrLz2Uxk7sPBpCapn6hCBMXD+OxyUEm1HS5vfQKE5xYBLILm8CNeZcF/+is2DiR17kQWLqX
	/Wu0gQkw3dhAcHZPv1XyMMmcjrBdtqe/RgfT6T5+CkNZvqzsF9E8ocE1MZVoH7Rnzsbf9BiZsFn
	OXUM8BDwC/vYt5GsiT9xqiAKns+5FSZWTSWSdaDTY+GLulcvHTojsTWeaeAY2
X-Received: by 2002:a05:6000:200d:b0:475:5454:49f2 with SMTP id ffacd0b85a97d-47757e57dc4mr9598046f8f.24.1783003163301;
        Thu, 02 Jul 2026 07:39:23 -0700 (PDT)
Received: from jernej-laptop.localnet (92-53-159-70.dynamic.telemach.net. [92.53.159.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbc75sm10135277f8f.5.2026.07.02.07.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:39:22 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 Diogo Silva <diogompaissilva@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Remove dependency on DRM simple helpers
Date: Thu, 02 Jul 2026 16:39:20 +0200
Message-ID: <Tm9Bj9tsS_qxKmbhRnECBA@gmail.com>
In-Reply-To: <f3f2320f-dfe7-4728-9cf4-c3eaab33d09e@suse.de>
References: <20260623-sun4i_simple-v1-1-fa6696df1fad@gmail.com>
 <PMdb9FVETQuPUnyh12NM2Q@gmail.com>
 <f3f2320f-dfe7-4728-9cf4-c3eaab33d09e@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_073925_875105_53561645 
X-CRM114-Status: GOOD (  15.55  )
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

Dne ponedeljek, 29. junij 2026 ob 08:51:52 Srednjeevropski poletni =C4=8Das=
 je Thomas Zimmermann napisal(a):
> Hi
>=20
> Am 27.06.26 um 08:55 schrieb Jernej =C5=A0krabec:
> > Dne torek, 23. junij 2026 ob 22:34:40 Srednjeevropski poletni =C4=8Das =
je Diogo Silva napisal(a):
> >> Simple KMS helper are deprecated since they only add an intermediate
> >> layer between drivers and the atomic modesetting.
> >> This patch removes the dependency on drm simple helpers from sun4i
> >> DRM drivers.
> >>
> >> Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
> > This doesn't look as useful change. Is this tree-wide attempt? If so, it
> > should be done in one go in one patch series, coordinated with DRM
> > maintainers.
>=20
> Yes, the interface is supposed to go away because it is fairly useless. =
=20
> It's a low-effort task for beginners. Hence many people send out such=20
> clean-up patches for the various drivers.  If the change is acceptable=20
> to you, it would be appreciated if you could merge it into the driver.

Ok.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



