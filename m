Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF87BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXE7lzO8tAK+W+95G0EGctHj7HaDXe4ZOUjtDp40SHU=; b=AI1l2SRgPQ+Sj1baHh5CcJ3eo5
	pR/rjK7kU2AkbcQqkNe4gcTgWbpzAjoOPJRVxFceOfowv8LmQoOfrJtuILcbVcrSqE+XBQqbm1HUf
	hqi8ws4MiHeOUu5CUQ3cI/KFBPPqgG/jFosT2PxQSba3gvSqu7r69SWmeIkbepajku1iiFdtoq0r2
	x2O5Sqm5aHnU55xNSiNFvFOtYGDPRP49pb+hh8FSOqjbE0OXqfgRFGhh3pufad6NI+tvdVBTR8M+D
	02YsWlcgITbuzNvF8YZDHRqrbuxUUmJlh+MlvEJ+1bUvvxzPHcO6ne/+egKR69HR78+XbEhHgM+lh
	d2d9J8mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKTv-00000007fAj-1Pfu;
	Tue, 18 Feb 2025 10:05:35 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKHA-00000007bkp-3Ndo;
	Tue, 18 Feb 2025 09:52:25 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-216513f8104so11345385ad.2;
        Tue, 18 Feb 2025 01:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739872344; x=1740477144; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXE7lzO8tAK+W+95G0EGctHj7HaDXe4ZOUjtDp40SHU=;
        b=MgX7vsIt0XXvMQlvfubgJ/YDdX9vo+yF537yrHrD6BTFnmDZW3PN0uZxBIZQXs+0z5
         HGcYLJIXwIJRJvUMtfIQxkOkxCzq2/Y1ZMswWYoaC/uDwAwk6DY3RKa3CWUwsxDcSRzU
         SdswNohlC0wgBpV8Pk+85BPbmWWiGK9pgg68NV6oyVoDjkP/KmyJfWc6jduGR6V6EGtZ
         JQHJb825jCwl0tnwORFrOBeXIjnzef2+BmflYHFdyRjbu+Hao3AaT6aQh3xdwTpFUErK
         AgyHPXNblBESvvJI2nPG8DX89krXF439IccGZbejoajE2IDss4UZIpmowoBolE33wfsX
         HDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739872344; x=1740477144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXE7lzO8tAK+W+95G0EGctHj7HaDXe4ZOUjtDp40SHU=;
        b=BxLmQhraUaw84YqXBHRomrDUlwwv4Fbor3RTWi8LUwPn/cmk+qlwZFz2JMC5FFJ3d9
         tMpq0Ulrn/LpihiHVyK61B9Kw0p55AqwX8YNF7NRa25RxnaIfZn1G5F88pZuyXtyFoCy
         5dI5Tw+UYlES2JfSaoRxToZk+lBJZpclB7OkMNOIrEj8mh1wuKUrjAKMCIfWe0UCfMBh
         opz24C3RhG4w387j2EV4hsYh/sTYyZTAP4EvdudsobPh+LcGfyq4dHZQ0AGyugG91xqq
         0R+ZfDPcIPL3ly2c1hDUnJUPhAjmtN0ZN7egjlep4Mm0ZKa7tS1gJkwTTVqTLsK/ZQcb
         W4VA==
X-Forwarded-Encrypted: i=1; AJvYcCWr/x63/g/DHntAUNOzUj9CTCmjhvIEiBeXwiRngBSFMtLaD41pczNMFN7IrTd28g+OObbIIlI6l1ecNFMmTSs=@lists.infradead.org, AJvYcCXwX0aIPOexFxlJ2mtb/yMtKiuM+ztYo4vt+L8lGvik/yBWS2JA8Ed+WJFobnvk+CUSoLCgJKwM8cTogJlYi5Ks@lists.infradead.org
X-Gm-Message-State: AOJu0YxHuvYbUfsvJNdGLgT2N5F+lUnzpd85LoVeZ4R6WXuMNZq8RE8q
	ZM/4o930YJEybh7cevjX46TIs8vHPwyC9vX8KQHQlgrY+fV+fYbe
X-Gm-Gg: ASbGncsJeDkMiy01PQ1U913QAlOxZ8NtRFp3LyOIZ3ruCsQ4KX3VTLCKsd0GZi5fUtI
	gVe6ygcgHtJ6U6hOn5+n1WxZEBejoTs6Ft+hghUo3DvBDTolpuvHAiU9ksLuphllAHJLUxLclZE
	zzZC91C4YcGU7+IoZG0KtNVYqcoMkg1xMj+gPZy/Vwl8eZCN9Qey/gKZHn/mePFNZ0+NH7vEt+0
	CMNzhb7IBFXntAzewAL4qD5dEMaKtSRCA7MLe0IcOAKhTvHYcHPPKHPHl4V5ZUZgYHV9eTBjCA1
	Gy3uHK8m3w628XfB9n/N
X-Google-Smtp-Source: AGHT+IHMok0RZ+xEpPKwmA/x6p5MJpbMNsZxQZEpx8+bc1wEOXS9InOWhw+MuPI9x2Y6TY782k+mrw==
X-Received: by 2002:a05:6a21:998d:b0:1ed:ac86:8f94 with SMTP id adf61e73a8af0-1ee8caac786mr8600343637.1.1739872343886;
        Tue, 18 Feb 2025 01:52:23 -0800 (PST)
Received: from rock-5b.. ([221.220.131.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324276171fsm10031640b3a.144.2025.02.18.01.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 01:52:23 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: cristian.ciocaltea@collabora.com
Cc: airlied@gmail.com,
	andy.yan@rock-chips.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	heiko@sntech.de,
	hjc@rock-chips.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source to VOP2 on RK3588
Date: Tue, 18 Feb 2025 17:52:16 +0800
Message-ID: <20250218095216.1253498-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1b3234ce-4526-4735-b9c0-c242e6cc3cf0@collabora.com>
References: <1b3234ce-4526-4735-b9c0-c242e6cc3cf0@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_015224_842606_E3A660D6 
X-CRM114-Status: UNSURE (   8.94  )
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

Hi Cristian,

No matter one or two hdmi ports the rk3588 boards have, most of
devicetrees in mainline kernel only have hdmi0 supported. After applying
this patch their hdmi0 support is broken.

So I recommend moving the vop clk part to board level devicetree.
Then support of hdmi0 won't be broken, and board maintainers can add
HDMI1 PHY PLL clk when they are adding hdmi1 support. I can add support
for orangepi 5 max and armsom w3 for reference by other developers.

Best regards,
Jianfeng

