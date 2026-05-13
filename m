Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D0CCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2w9rjHTs0iet/rZ6jwqd03mVv1gF87Jcorfz748ksg=; b=HRPGrruCRDedoLgFLLsJITxu01
	SJlePELvw7AeWzEO/uAdxa5pJCy5s6LqvYxAcab6tRjZeK7Hum99G1ddL/6Wl7U1+TsAdnYsESrcC
	Ijq3k+RQGah72zDRgBEUyN/BjtcWbb5qhOBhlt6oApe4MAGePXdkNz4DKHEsRIlDOYvLtwo+f5Rn1
	ILiouAF2QZY3bUsmj/GuhZwc0xP49pEqqSeU4cOvaVRdAyrzzYEiI1WfG5vtop8PlQfXQhJqWYAzc
	59CeFhEY+UDi0FuYt/cAK0P/HEO3PgQHTZhQSksrUytCCXG6GxHoyAuBgicJWnN2qp85EJn3p0bGL
	FgRQo0lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5gA-00000001rvs-0qx2;
	Wed, 13 May 2026 09:14:58 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5g3-00000001ro6-1tLI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:14:52 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so4809986f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 02:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663689; x=1779268489; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n2w9rjHTs0iet/rZ6jwqd03mVv1gF87Jcorfz748ksg=;
        b=udKkciWQEN526OvTnoU8+aQ6ti3uprSJTx5vCaOr/eB2/iOD/0xJEyum4OE8PxbPVN
         aoC86irA4tdJsILvN8eJ+8Vd081z0vd9iMCKbQy54uRRE/uu237yd5udqxv3I8Dhc7UG
         odzNcsReCiLQgUDTPFdjlS8Nqd7lTsfDc/3Sv2El8NAAAe/bW2Ba7TJF7aqWP0eQLCJW
         E7JDsNxhMNL5p9zdShIQnGGcNFzG9NqlDwy9n2EPhgQfSwcyRDzBSokt6+2HLJVEpH38
         LVINB6BFSkulfBsK+YT7xi30KXaRBqbQk+b0Ls9dEGTQVaAw2OqyU+qYBml/1QoOU0aA
         opLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663689; x=1779268489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n2w9rjHTs0iet/rZ6jwqd03mVv1gF87Jcorfz748ksg=;
        b=I8RSnlxvF86CDV9fYtMZ4yrlDjp0iW/qSmZ4dCEk8L31UpiQWHUugqfjLhEHVnsZYS
         gUtL0IzUSeBExjDUV8qI3Vz2RX/F7Fkds7/x0N5WL1z44KMliHS62djjJe1L+gMeaqvk
         tDuyefrdLbXBhscs/viz2vCufOcmd9xdE0lsPrIWHtHEW3giBWWZRSVtSX4h0dA0va/2
         gCo9SELuh/q8yF0rLsU/yWMYzZc3hJITh3jjbBm3DdwX6IaFlU3j61sOS+/3SCwYquZe
         7TESCssANwjNHpOiBZD6qX4Dkh8PiamtjJc0NmG02YuwW8fXBhS8jdYlzIu6qV1ACqNA
         HvCw==
X-Forwarded-Encrypted: i=1; AFNElJ9c0Mbc/66iMyRqNWMDlrmkvkZLtU/7mkuT8dT9spi1+nkHqrJBuZsZ7C+ZJFp7rw7+d90eTVo2Pz5qq7uFwZYU@lists.infradead.org
X-Gm-Message-State: AOJu0YzNhziKYg7aeFbcYAXurmsS3S6zbvtbtBVssnP42VhZrJ//6McN
	3o7cN8nlCT0/M/ZHW9wDT0Rrbr29YS0UiB7XjPBTighsnWNW09sGgvPYGl3auXAZhlI=
X-Gm-Gg: Acq92OEpJHId13vyrgZCaZHOVuzplLzTUllcuYd5ecpfEpYeXiZGuVKMLxFUz1EzSbV
	Bk4mrtDn788raYPajV2U/CZLQIT4vwOS59AUCAwcX1BFQ3WCltWve1W1CT1CITvd/l/wggdZzO/
	QPI/9RAPacVhW1U5a5cspHdZsn+o0faxi4OXj3KEm0Ms4e9d81dk1e2QpU2aub8+gl1UhQv7PRo
	zfJ1/9daEjggbwz9BkLRhqeinSIL1yOz7sjEXWmIepN+0vJxyF4kyA0/QvMmvBxMb3TMZIHiUN7
	KBLcP/cmNnGQTSd8wgqZIYdpJ6GYP3D+xvxQ11eO6U4C1KlrcnOPhptYcuoOO2CXsJwgNzqPMZ1
	X3iMfOkruaYgYFNobERDeUc1npRK8Bi990MJ2BFWXlfSo67O2zOGcPrsQFEDVAkbwyLs5UHPbUU
	OjeEpycxv9+xpFKK4+Xl2NQkanziA1w4A=
X-Received: by 2002:a05:6000:2289:b0:43e:b0f8:e019 with SMTP id ffacd0b85a97d-45c440bcda9mr4275393f8f.7.1778663689569;
        Wed, 13 May 2026 02:14:49 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:49 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:33 +0200
Subject: [PATCH v2 09/11] m68k: stmark2: use ioport.h macros for resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wip-stmark2-dac-v2-9-fcdae50cf51a@baylibre.com>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
In-Reply-To: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_021451_511489_22B1464E 
X-CRM114-Status: GOOD (  11.26  )
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

From: Angelo Dureghello <adureghello@baylibre.com>

Align also other resource declaration using DEFINE_RES_.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/coldfire/stmark2.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index aa2b4d2a8a64..a5b36af8e70a 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -63,21 +63,10 @@ static struct fsl_dspi_platform_data dspi_spi0_info = {
 };
 
 static struct resource dspi_spi0_resource[] = {
-	[0] = {
-		.start = MCFDSPI_BASE0,
-		.end   = MCFDSPI_BASE0 + 0xFF,
-		.flags = IORESOURCE_MEM,
-		},
-	[1] = {
-		.start = 12,
-		.end   = 13,
-		.flags = IORESOURCE_DMA,
-	},
-	[2] = {
-		.start = MCF_IRQ_DSPI0,
-		.end   = MCF_IRQ_DSPI0,
-		.flags = IORESOURCE_IRQ,
-	},
+	DEFINE_RES_MEM(MCFDSPI_BASE0, 0x100),
+	DEFINE_RES_DMA(12),
+	DEFINE_RES_DMA(13),
+	DEFINE_RES_IRQ(MCF_IRQ_DSPI0),
 };
 
 static u64 stmark2_dspi_mask = DMA_BIT_MASK(32);

-- 
2.54.0


