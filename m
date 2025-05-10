Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FFBC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 01:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sF2Bg8dFphUkCryZWbe4OS7qSU2jUKmCAqLckdO43HE=; b=kbJKNjZEcAl1He4u4eHhc3Wi4i
	bznzYmlI0w7yY6zlXl7F0/NHLnTtViB0GCmLx8YBdW0ISqdQbSg1DFqdMnIgqa9LNI0y6M6XdROhc
	RYqPTK5unqTPJePfBOlzDRz8B9bKQJqBjkjqIwm4llvm0Nmax8R7jDl9XQp2n7sN2y69VWrDTPcj2
	vG6/BzNYg3NK3siWDDyN065DwgMAaloh1noTUwFLvwYm0YXN2YNJXSsrxuNH4DKjinJla+PqmuIiX
	MxhbDMKOwWr8DqR93LiBC8Fx75FFOiaK4j9pkketdwuewZM/WiY7irCNszTx/v/L6jCH/MLua7E7S
	W+35Mf3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDYzH-00000005Fy4-04sJ;
	Sat, 10 May 2025 01:26:47 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDYrd-00000005FFn-1rBx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 01:18:58 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so14167055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 18:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746839932; x=1747444732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sF2Bg8dFphUkCryZWbe4OS7qSU2jUKmCAqLckdO43HE=;
        b=bpcVPWzfGW/KnkHUNAm7At7nkS/SU42SDAi+p3NpqsmdyTkyJb2FGSE5yrEe0en1Km
         U5xeEZF18VTh0GY6AylD5OZIU87SxA/Aeg/N/tzjqs6sZVxdqaIVHR0MGaVKyFlZHJ6U
         fudJKisjyduKsVrqgSFwUaX3mWsFbCuAh31KCpMIadV3dbSNUqA2iex88o5b5VSOcosk
         vnmMrMJrpPK8lXD2eqjZwtE3ieeF47PRzd/z+0AyiTZiXLIsFkNcaxM4gkTdBUCQ+mTs
         XGUZXkA7rA/taKhr5t/9d6owVyYr/BYvtvzQ4vIENfkHXexO3ye9Mn3RHLMMSJrrEgMI
         whiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746839932; x=1747444732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sF2Bg8dFphUkCryZWbe4OS7qSU2jUKmCAqLckdO43HE=;
        b=leWDJCEEcG/lO2XQpBT5mP/CUmWFuVtSj8PxsiCdTAL2TUdOlGcbGZKnBC+pFlaEHP
         GDR4k3djNBc1eDnk/OiWVGbBf/RwFyksP186vyODW/bwgxU59P9rlG/CoC+qnwi4Egop
         gxJhwqdeR5/CEH+IoLv3+/iCYznNaPkO8fXpEPYq2G1Lk6DLoFdgEy4PuUVYO5j4YPQ1
         I31WlMbZo3i8PRo8URwoyWAQA3UWskjoeedqBYZHQ0fmNAD12c5ONHYNS7hMqhyRhtg9
         EYGtfJvyFJ7lIbDUQrGpVdGYEasG4EyXzicj+v3fzciAo8CzKu4o60Sy+iwx6D9Kkl3O
         XwOA==
X-Forwarded-Encrypted: i=1; AJvYcCX45DMHrz0v00E+8RnUxMZXb1MhN62/T4IMqo3BlsvdLBh1GNuVFQM28i5gtMapJG6+eWQmhMjHX1iwjY+WOqRh@lists.infradead.org
X-Gm-Message-State: AOJu0YzLwfzkhtb3eW1GS7tCpRxNSomH+0jDQxIxJoNwSUS4BnCcNI9n
	hDN269wgyYroUwH4lCkgFG3SNnw+YRC/NMpp7l5BiwEeDN5CE5Br
X-Gm-Gg: ASbGncuLT0rm3U4yqOMkdyPcPGmt7SqNj6GbCrgBjpnYSnRzR4qzB09+gGBBIYVCrbQ
	B9dR2nP7xpcnmTISRA53Iy8F3XihHERFwZ+p/GlpwaQJDQffPtZDMk2SG7DEIue4VIjUqQL4Ln3
	ovUoXJ1Lmam3oyu8G5x2Dc5ao09fx+hZHzczePuOI8YsX3dJz4GC7CeYxDtIYsrMCrOVyD83azs
	5WKSAsAqBki+EV03cwJ4VFmQ04TdK0voaZQ62ieoa7x1ywo/1BtJaUwxtS8Gx7d/9VZDTnQ+fKc
	cliR54w+Oh/+QsTLL1uy4b771MZSqcHgSdCcvHULjeyaXsyZTBl9k8IvFJjvlRoNge/qkAI=
X-Google-Smtp-Source: AGHT+IHYdvdXBuzhOXulslg3FcTy7/1wnjTVOQ8CVC6MbjHWdXZlynWwgpVoO+4Ylf2Y6Y2tzQn0Xg==
X-Received: by 2002:a05:600c:1913:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-442d6d3dc11mr49327095e9.13.1746839931663;
        Fri, 09 May 2025 18:18:51 -0700 (PDT)
Received: from localhost.localdomain ([176.206.99.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f0easm86967305e9.12.2025.05.09.18.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 18:18:51 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH 1/3] ARM: imx_v4_v5_defconfig: define CONFIG_ARCH_NXP
Date: Sat, 10 May 2025 03:18:04 +0200
Message-ID: <20250510011806.13470-2-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250510011806.13470-1-benato.denis96@gmail.com>
References: <20250510011806.13470-1-benato.denis96@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_181853_478624_207F3FB2 
X-CRM114-Status: GOOD (  10.61  )
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

Define CONFIG_ARCH_NXP so that CONFIG_ARCH_MXC won't be disabled
as it depends on CONFIG_ARCH_NXP.

Signed-off-by: Denis Benato <benato.denis96@gmail.com>
---
 arch/arm/configs/imx_v4_v5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v4_v5_defconfig b/arch/arm/configs/imx_v4_v5_defconfig
index 875c8cdbada7..19e26b4a9fb7 100644
--- a/arch/arm/configs/imx_v4_v5_defconfig
+++ b/arch/arm/configs/imx_v4_v5_defconfig
@@ -11,6 +11,7 @@ CONFIG_PROFILING=y
 CONFIG_ARCH_MULTI_V4T=y
 CONFIG_ARCH_MULTI_V5=y
 # CONFIG_ARCH_MULTI_V7 is not set
+CONFIG_ARCH_NXP=y
 CONFIG_ARCH_MXC=y
 CONFIG_SOC_IMX1=y
 CONFIG_SOC_IMX25=y
-- 
2.49.0


