Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA99D5C0CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bm+b8lS1YuE0pHFzyn7pTVq208oic1NcidTGM3qudeI=; b=aYNDevUoLusP7NEO90nSnSEJ0W
	Tg9peAqfvCI7B7ftzRepvbqV/M4r9+uS0OaQ1T0ZdIzy0KOM70Wq1/BHkqKceHkDC/F/DvQpDLiJb
	Z3zuiHLbZrhzL1S+twYjyAzQxEjUkZrxrlf6alXWogyEZZ8vQw1GxJZtN/YyGO4WrmnwkHrI0MEM4
	YVCBtXyCB7QiGF5M4yogh5+HRYLkM9B44UNh4+4sgeaoeNbyMhA0UYbfAzRmsjV/8AKVADCK4Gmsf
	IgA5jFGXBPTgQQM1wCrS2v7LZhx9O4+aVOkP0KqYZ7qy//jQy3iYvAQWgAj8//eFXnikYT22JFFO0
	/YyNcOtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Pmq-0000000Aorn-3Ame;
	Fri, 08 Nov 2024 14:16:32 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PNT-0000000AkVW-3chL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1731073819; x=1762609819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bm+b8lS1YuE0pHFzyn7pTVq208oic1NcidTGM3qudeI=;
  b=a+fUTSliFDno7xY0Hi4ODih+gzdQ+rfonRHB17XFSmU3Gee7aKsqI3Zz
   bzLB/0usum7LrvjwvxDF9cmOCx5X1sawbRPRbK1LhFvTAMbkwbKCYTags
   3pOWGG1L5BVX5Hq3LgC8Nmb6jLlHH4JRtPaDRmxuD7uYP0q4QQ5OSazU5
   LNOJFF4ghtQrJW2yQRuKrBn/RtsTyge12/tAU7HVK5Pfi0WGeAUMpe3p2
   Atmtm3dJmysprC6DCRxPpta2pgO9WOYpoa/XxCt2mvxPiqPdpKcJDiFYr
   fkhrzxauJrq6P3MjXgcpg7hcKlZDrUTj8NcGvKLFXtTKpG164hxwRt86g
   Q==;
X-CSE-ConnectionGUID: QfpBNxdrRm2QT6CN6AVLAA==
X-CSE-MsgGUID: xSks1VbqTKueiERFL+35Eg==
X-IronPort-AV: E=Sophos;i="6.12,138,1728943200"; 
   d="scan'208";a="39936937"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Nov 2024 14:50:19 +0100
X-CheckPoint: {672E171B-12-1E10F2A5-CC0651E5}
X-MAIL-CPID: 21C40C5C7855FCB289C7E0CFE8DC1B20_4
X-Control-Analysis: str=0001.0A682F18.672E171B.006D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2439B1655C7;
	Fri,  8 Nov 2024 14:50:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1731073814; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Bm+b8lS1YuE0pHFzyn7pTVq208oic1NcidTGM3qudeI=;
	b=CHvPSIXd6yPKILCsPovot29FuRkCuxO4s7NqYeDbZC0jkl1CqemKWVcDQ6IP02VXvxSmxT
	8Lxlzb0lQEqs3pUcaTyILEaWPeJ2NfPNrOi7NrYnJg4calqyheuL7Y2mfKGhf1V6gqoopj
	ATl3BPanNquXydECDzhPVgoDvlvjxHp70OcflpXwu5mx+qT7LDUq0qJX0tjAb2KmGN7KZo
	iJ45LPrt/ZEc7F+f5HZ+RyWNTRqv+x91TBuz7kgi1MQifgNYcXoRKsf+LnElz2EFTc2QwT
	E+cAN4jIxvHmKe+5gUokd2f7dJ00cYtD1CZzH2Ue0ug/hs6oJJs6HR5PI50W/Q==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?Jo=C3=A3o=20Rodrigues?= <jrodrigues@ubimet.com>,
	Bruno Thomsen <bruno.thomsen@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] ARM: imx_v6_v7_defconfig: enable JC42 for TQMa7x
Date: Fri,  8 Nov 2024 14:49:26 +0100
Message-Id: <20241108134926.1324626-9-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
References: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_055020_227602_8F6279A1 
X-CRM114-Status: UNSURE (   9.08  )
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

TQMa7x uses an JC42 compatible temperature sensor. Enable the
corresponding driver.


Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 0beecdde55f58..5bd07f8dc031c 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -230,6 +230,7 @@ CONFIG_RN5T618_POWER=m
 CONFIG_SENSORS_MC13783_ADC=y
 CONFIG_SENSORS_GPIO_FAN=y
 CONFIG_SENSORS_IIO_HWMON=y
+CONFIG_SENSORS_JC42=m
 CONFIG_SENSORS_LM75=m
 CONFIG_SENSORS_PWM_FAN=y
 CONFIG_SENSORS_SY7636A=y
-- 
2.34.1


