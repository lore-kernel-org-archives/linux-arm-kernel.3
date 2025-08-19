Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C518CCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 00:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zfg+/0iA7MeX1A93jxyLkNbqcGb7Dk0Q5+FiLHCKrdg=; b=QTJOKn7MzgfxWtSLG3mThhfFGZ
	ikqH43o7G78XjDiHuBOXmY8xIq0aV1SbzmYqLfn1wDt17ICd6buZLwpz8JuuBvHx7VJItZvxbnlyh
	31l/4gbbE2VRQgse+UaP/48gztQpjc7xzQrWYZXrlZ3+ikjesuD2AS8q0vF1UIHVya2Knu9QteYMM
	cWE8i2c3KTrKbvgwCoxoJaVp4EYXIbIBVwSUwRB0r9egItVY8F+ZwXTHS+2haS2K6LI4Znjd3uI/W
	XzPMER1+xYqKuVI/CvXUzfltZP9WmCVont9/VH2RzIN1Q53kAXf1B8vrvzxC+kS9nb3Ptg1agAIUR
	kKNJkOhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoX1n-0000000BzjL-3cCr;
	Wed, 20 Aug 2025 00:50:11 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoVaG-0000000BpgY-2m7K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 23:17:41 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3e66b5492c9so15356775ab.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 16:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755645459; x=1756250259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zfg+/0iA7MeX1A93jxyLkNbqcGb7Dk0Q5+FiLHCKrdg=;
        b=D3uzylp0EnLI224LjUrD6llb7ZIKYfmyL6ysqgsIV3gVVpzsk+GttzYG099gYpdLvA
         NYzU9o8DRat2OMWVrHkpFk87XPrhxd+4Vhx9uX8hk5wMc5TzjbJ7bmBhNkVxTvmX7TXl
         6SpADXvhr29IJ1sNxp+yZTIKhOaHaPOtlGDaZ3ErMuur6PCAtAzC2uFpP7Chg/p/XtJv
         8upjHbD+bTwK6qm6P/8g89RYv84vkySgdSHAgM1y0tqlWHSLhGeCdei9KQzGno/92HqP
         WYGKUISCD/pE9iQN80fu/YMDPg6KvsI4AmVNA2tk+wBYCye0h9ZR63OkjzPrMdiwSdlM
         W9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755645459; x=1756250259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zfg+/0iA7MeX1A93jxyLkNbqcGb7Dk0Q5+FiLHCKrdg=;
        b=mTQ693BhtXw01YtCMvEoQrb6DtjFQ61Ns1yxeVXUlbosry95N0Lb+RMlWOHol2sVOl
         +lHzbVrsSRsmmaqgDcXJIyvPH2SbtYr3wp/P1NNEkRnPPmD1+gcnNuCFWiGGwNZV386o
         rXUjz+zsXGuSY3Ntg8bO6ze1GWwp/iebZpeiLEdWPWsmwcfbUuw6q6f2T7zDHG/rMhqE
         onm1OL6IQyLwMucKqzxZ9CFNXZemp+vntOFT5L1TPZOafmpXiHi+S2ffc60UUSX+KotJ
         Pf7Sm9BTg2MUoGUI1T+9vZf3S3toqSsZVQdAopmstYuejWWhCPsTlSPQHWhFswBe5cZ2
         NkZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWY9/6ZM7SU6Wpm+AZLqNMMM7PX7tUDK+WxLTC/ni61MsjwwPP6pprxhOlB7WfMDivBhjKKI7KUC8S98Uk5sLl@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx5RM64/073ZiVrcC3HBdHmSYrYmj0BoKo227gNVNirvNUTC3d
	tKdqnGnYp4sofVfau+z8buAo0rPQRQMuWh1hyNyKvMYXstDsX8ERFFFO
X-Gm-Gg: ASbGncv6/APa5xjAifkfi49ZlJAGNfxISSd+I4P+yMw4OPGJPWrY8R1YhSH+tZ5lOcH
	vSevJ21rd9QmTcY7lknUpBQpSVg5XnuULoRqqm41siRFE5jTkmOJL6MaM+x2fxxsdkJEV9sM/Mn
	XVmUmEmWv5Zt4TtwTpelYCKwfd13wHkNkHK5E9hrB5SbLgFfhQ2fkpmw60EEJ3n3cXhbVjKHd84
	7yWX9RbCWIDnHTzLVuzd8odtOzz8BH+gMoZVKeXjaGQ7NmHMPPsYeT8p1lJ6s8of365RCemeWcE
	g0FefojwAj5UFpJFQhjojRnwhn9jdPHurgFME0hh6NnPIvzI8c4GtQv4hlVmHGmlRUBVLvMCrrJ
	kRP5ZqdYSuyNG53id84JRjXIUmoRvizkvPOpb92EwBKUO2gEO/+LNr0me5/WmpI9w/Q==
X-Google-Smtp-Source: AGHT+IE26v7IsIWqO9h9jisXac4SVVQQIabrAjtx7a4C9+BQ7EZWbdBQ3yfPd/77Ao+xdaYOz2tglg==
X-Received: by 2002:a05:6e02:1705:b0:3e6:7bb6:74f with SMTP id e9e14a558f8ab-3e67ca88024mr17929785ab.20.1755645459281;
        Tue, 19 Aug 2025 16:17:39 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e57e67da67sm48388365ab.31.2025.08.19.16.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 16:17:38 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Takashi Iwai <tiwai@suse.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT),
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT)
Subject: [PATCH] ARM: defconfig: cleanup orphaned CONFIGs
Date: Tue, 19 Aug 2025 19:16:30 -0400
Message-ID: <20250819231652.15938-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_161740_698921_B55D2343 
X-CRM114-Status: GOOD (  10.00  )
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

Drop CONFIG_ARCH_MSM8X60 and CONFIG_ARCH_MSM8960 which were removed in
commit 99497df59427 ("ARM: qcom: merge remaining subplatforms into sensible
Kconfig entry").

Drop CONFIG_ARCH_MSM8916 and CONFIG_ARCH_MSM8974 which were removed in
commit 85148df36835 ("ARM: qcom: drop most of 32-bit ARCH_QCOM subtypes").

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 4 ----
 arch/arm/configs/qcom_defconfig     | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f2822eeefb95..151f50b3b2d6 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -87,10 +87,6 @@ CONFIG_SOC_AM33XX=y
 CONFIG_SOC_AM43XX=y
 CONFIG_SOC_DRA7XX=y
 CONFIG_ARCH_QCOM=y
-CONFIG_ARCH_MSM8X60=y
-CONFIG_ARCH_MSM8916=y
-CONFIG_ARCH_MSM8960=y
-CONFIG_ARCH_MSM8974=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_INTEL_SOCFPGA=y
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index ec52ccece0ca..aa23a13274f9 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -10,9 +10,6 @@ CONFIG_EXPERT=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_QCOM=y
-CONFIG_ARCH_MSM8X60=y
-CONFIG_ARCH_MSM8960=y
-CONFIG_ARCH_MSM8974=y
 CONFIG_ARCH_MDM9615=y
 CONFIG_SMP=y
 CONFIG_ARM_PSCI=y
-- 
2.44.0.501.g19981daefd7c


