Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FACED5C0C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3bOax/iwbQ/EP8te2iWhC8WQNV4+LXp2K8y224vh9c=; b=On9820g7TwqSle+iopf08poZ3F
	+a1EnJqyNeixkydFXK0Svv8TlE0CyqXeEPSG07BKMrZUJorn6r2gIJw+6C57ko+9H8BCOWghWJICm
	N4IADfqkQhJSpGNSl63MOn4xEG3zmiITzqt7HmSWMrNURKrob2PRNqMgobUJ+MBSbqSfWq4MDqku0
	xtjvm8IEXsUUZn+ctxZk6O0Zm6nE6t2c44cMLvzKr22R1GBdxoqFdAk14wAHNi6SuUKDfXLkP4A/B
	x3Bafw6liZwL5qBxoFDiExU9FLHye4o8qqkzKMuepUfRjOn8XVGau14XcB9SzuHmbLoMcqB6ORwCT
	871TvKkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Paf-0000000AmwD-1q3F;
	Fri, 08 Nov 2024 14:03:57 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PMz-0000000AkVW-1zrJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1731073789; x=1762609789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m3bOax/iwbQ/EP8te2iWhC8WQNV4+LXp2K8y224vh9c=;
  b=MYhQIryrgvAKNCHeOJNWrqVpiHbeemjI/yB8cV6xUpypNBwOvOUchg5C
   GZzsIQJCBdMFOnJy5P0Nq+0eGg0nUHWeWAxua5WKZ+RCjGDmCO/aiZ2Xa
   vdTQ7a2qGne/5i7wFAEGdr6tFlJhctk4ZMs4rjRFbI6MKHVcM6aATk16v
   1cUy/dQqFs+wvTXmytwgJIQTelwAw3A0riWHoiIhQ4trFCzpU0lx6Cuv9
   4cHt3g/u6EKcXv/qdAq8+yu4/Xafb0MFTuLlhvsKhUTh7d1wJiQXJAJf7
   /Eb09aKArkV4izGxZf6jYG1qL/SkeRxXbjY2/vr8uVPamb4XrPMFnTELU
   A==;
X-CSE-ConnectionGUID: f9SSM+pjToWPN5eBr3bWCg==
X-CSE-MsgGUID: poFUq83pQgybocnlkYZ4fA==
X-IronPort-AV: E=Sophos;i="6.12,138,1728943200"; 
   d="scan'208";a="39936927"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Nov 2024 14:49:47 +0100
X-CheckPoint: {672E16FB-1D-5736D786-D50827BE}
X-MAIL-CPID: BD1F24A25D10CF92982105AEDCB74FFD_2
X-Control-Analysis: str=0001.0A682F28.672E16FB.0096,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5534F165074;
	Fri,  8 Nov 2024 14:49:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1731073782; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=m3bOax/iwbQ/EP8te2iWhC8WQNV4+LXp2K8y224vh9c=;
	b=tC6ER5QolfygrDfxSSSZ3iMzQXu5jBbvYxhHEyq/Cp/d25Udl02TqA172pGAlflnd/+SMB
	PDRpiV/jbuBgWm1QxUqNxNcjAeZC1B45asEpFTkr/6rLJ1R17gmC9TXD3aLrtqGGudlnOr
	Gi8yxRxTkhvH4ellklKP/VLloLSEbmwlmShBzM1gu1YpFzlFX4axczRrN+DBjbd/rZre5Y
	X0dOhcft9KJTwE/2e9zd+1aviym4WGT1zceOEM9T63BSSYfa2ms3MRpACtQUOaHCme2+A+
	BnfyO0MawcJKDLcZulXMqnhB8FbecF2IlzlRYT7frPJpQM51x0bpYiYkDjw72A==
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
Subject: [PATCH 2/8] ARM: dts: imx7-tqma7: Remove superfluous status="okay" property
Date: Fri,  8 Nov 2024 14:49:20 +0100
Message-Id: <20241108134926.1324626-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
References: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_054949_693989_0B959B86 
X-CRM114-Status: UNSURE (   9.77  )
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

There is no need to specify status = "okay"; for newly created nodes,
remove this property.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
index 028961eb71089..656ab0562695b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
@@ -150,7 +150,6 @@ m24c64: eeprom@50 {
 		reg = <0x50>;
 		pagesize = <32>;
 		vcc-supply = <&vgen4_reg>;
-		status = "okay";
 	};
 
 	at24c02: eeprom@56 {
@@ -158,7 +157,6 @@ at24c02: eeprom@56 {
 		reg = <0x56>;
 		pagesize = <16>;
 		vcc-supply = <&vgen4_reg>;
-		status = "okay";
 	};
 
 	ds1339: rtc@68 {
-- 
2.34.1


