Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4473D5C0CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5n323UXrPp5uudp6Hu5dvoIoBuE/xHbBKXp9ytYca4=; b=VGGOHrDiNmZcmSWcGpmWSttowY
	DKA90lFWhEWuCC6t3ct/FvQBqGOsg5zM82AWhhonOlVNGGg4q0HDij5BQ6WaYoLKwRZCmRt/9sDRp
	YjD4SRcBIX/epF+8Xb8HuZlT1QKXodtzhju/H7BVVMO0n1mp5DPPk6MUnDvTVtW0voaR3phMbcvnV
	rvS/ecACc1lgYQqXNEmSDh9XgEEldBbSYC7zfiqtfCuOfkYksTpigsE+twspDO3vJeRZn4siV2LZU
	jxHCRY9I6vZhwpKf1HUwyEGic5wOnXGmUZQYrJT/YaXU3bbt9XgHEeSmU02O4impA4aR/bUA727ET
	SA+llTkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PcR-0000000AnFk-15gm;
	Fri, 08 Nov 2024 14:05:47 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PN3-0000000AkVW-1yqm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:49:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1731073793; x=1762609793;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K5n323UXrPp5uudp6Hu5dvoIoBuE/xHbBKXp9ytYca4=;
  b=EOnDrGRZFhUxEubZqBVMbyZSiFw7tUpM4iR/Npn59jcEETCAprgQSfyT
   l/7gk5IBDPMd2BAdkGIt8a7gpRK6mP1T1LYnXemgsiV4o0PE31d3oO60/
   n+gCaCzDC2scrlZ3jsCXMD/JLjEbLLiXwph9n3et/4oER5W+m6v56P2/8
   TtA5ANN/iucEs6b1d+5UpmRkX2MbscHPNkuMTYD3GpZ8Re5Vt6CCHDsTo
   Xbjg1nFUD8jXX+aHmVo7Q4RfOhOfFD72dK/gvHJDNFChO2zTgc08m5j1e
   psIFhqhFVf9qe60YEX6fvkGcRmotsSVfpiTIG/ApJNHv3VCBD7gN8u5xH
   g==;
X-CSE-ConnectionGUID: kI+aj7XnR4C+APTkXdKzqg==
X-CSE-MsgGUID: wnAiSrcLTs6RMK/QnJbJqw==
X-IronPort-AV: E=Sophos;i="6.12,138,1728943200"; 
   d="scan'208";a="39936928"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Nov 2024 14:49:52 +0100
X-CheckPoint: {672E1700-1E-86C05612-CA75E1CA}
X-MAIL-CPID: 98C61AF8CE5227264DCC1B41E75CB408_1
X-Control-Analysis: str=0001.0A682F2A.672E1701.0010,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B63C816528A;
	Fri,  8 Nov 2024 14:49:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1731073788; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=K5n323UXrPp5uudp6Hu5dvoIoBuE/xHbBKXp9ytYca4=;
	b=CLaWFqzbYQhqqkJvBP9b9GlqzyBAOllrLxcKE8UyXS1soo612hpG4eF8DCIm7aR0zQpPCU
	3f54K20btAoC5/06OfMXy1hOyiQoTbCZvbNP/gYWY9+LEFK9mivt7AGplj7yozMaS7gG8A
	efisn+KuZAZXQ9tUIGKgB0f+EMjF0Wl6BJTJPdiaOIRxSROA2XtyTc4YBcDymAVr0X9D+u
	6Y+GnI5y0AqhaU/lWWi20WGvrVhEl0aiGh7unM2RyZm16xpvJuGO/cdFBmLkvgab2HieWE
	kcD8uIW5M6tagjDFVwZRoB7wV8cbts3exQRZ8ojOwWRR37Wl1dZuUvkKcplYag==
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
Subject: [PATCH 3/8] ARM: dts: imx7-tqma7: add missing vs-supply for LM75A (rev. 01xxx)
Date: Fri,  8 Nov 2024 14:49:21 +0100
Message-Id: <20241108134926.1324626-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
References: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_054953_841203_1C527EDE 
X-CRM114-Status: UNSURE (   9.92  )
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

Add missing supply for LM75. Fixes the kernel warning:
  lm75 0-0048: supply vs not found, using dummy regulator

Fixes: c9d4affbe60a ("ARM: dts: imx: tqma7: add lm75a sensor (rev. 01xxx)")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
index 656ab0562695b..aa8f65cd4adf7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
@@ -135,6 +135,7 @@ vgen6_reg: vldo4 {
 	lm75a: temperature-sensor@48 {
 		compatible = "national,lm75a";
 		reg = <0x48>;
+		vs-supply = <&vgen4_reg>;
 	};
 
 	/* NXP SE97BTP with temperature sensor + eeprom, TQMa7x 02xx */
-- 
2.34.1


