Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F78C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 13:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRcssIy0D3wBhtQcXILEIWDG0AtdDcnDWd1hDsno3wA=; b=P7Zv8Zrh8cpnYqaklvgTltwnmO
	JYnhgEWbnW5aBI8cf54yG1Is0ZVb2OpH8PQIAaHaV/AYG95GpXwmuO90/gEX4VhsZjtoopZeCg3Il
	DXdRVgCQwsVR0AsG//TUcbfpayPo66ULP37i7URoWS7+l1U89KBbgjuhGSAI8dsXnd4tZMWoVIoEe
	dvAoYtuKiX6Kepf48vVgGgidfOQ0AcOkcdSnx2kf+TEqR2LYJ5doNUxlmp9kQGtkZynu/ZXbfEIdZ
	lRTGWbT9m0wyZ+Amw3zRG9NuDQxlFqJJr7P4fjBE1ClpUn24N7Nii6xsF3F9ud0cpqo54SF7pdtxD
	UQEqUdBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrsV-00000005ft8-3K8C;
	Mon, 20 Jan 2025 13:31:43 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrmW-00000005eob-3uFE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 13:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737379533; x=1768915533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mRcssIy0D3wBhtQcXILEIWDG0AtdDcnDWd1hDsno3wA=;
  b=W/4ver2DcFh3+G1s1ZsuvQw0pt9b5SrlJZ604AD2sVfJ58bc8SAPA+6Z
   B5wFZzRNHU7SveO+OlS0l0x6jbhh5+Uj3XjgaQ2XDEF0M4RnmLycAQaw8
   FuCN7e8bIKC344YKJ5b8HsJbSanCh9Mhd/SEbfxcAufiL5KQnVrmAuRZo
   b65lQjYqmXR7Ishxy+e3/J2uCZtdsWy6uHUMEBqtCJWhYA9EPxQacOb39
   Uvi/PaSr1JYjG4Ejl8Oe7CbhHezc9sF/GgSG6h4f3M5xWEkMSgDy1X/mX
   bryzRNy3zGCBY+q2Uo+78DfzX0zjeOSrZA2V6oOeGq5bDU+Ljy3KqQrEt
   w==;
X-CSE-ConnectionGUID: iTqurQXYSkyRWVle7byU4w==
X-CSE-MsgGUID: WwKgWIhZTQu0ioHIIgfXMw==
X-IronPort-AV: E=Sophos;i="6.13,219,1732575600"; 
   d="scan'208";a="41177850"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 20 Jan 2025 14:25:32 +0100
X-CheckPoint: {678E4ECC-11-9B2B6168-EB6F31C5}
X-MAIL-CPID: DC5E2AAD34FE55F2E840A13270981609_5
X-Control-Analysis: str=0001.0A682F15.678E4ECC.003B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FAAC16F538;
	Mon, 20 Jan 2025 14:25:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737379527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mRcssIy0D3wBhtQcXILEIWDG0AtdDcnDWd1hDsno3wA=;
	b=lrDuZYiGY7PNHdU/Y0+ppDaxqp3+Z0x36gCZF1AOMNwkxQfeMqTJSLnCxSgnYYPCI3trWq
	kU3phdcTfxZPsVLczcKpWcpJ/nf7eCgGdxhHKXzAzS8vV9cmZpveD7UscTD9zgxogGf0Rm
	camcUTANG6OynMqUbtsYHNBBR/4M9Z1c1soSilnxM7uav1WVcYREVreKKT4CA0OF/jYG2I
	qyDtXfEkSznvGSrDms8Y6gvOdZvkAf9rQLKrzGuQcsKjLU4oJYvzBI3/eU6UYhX6S8LHhG
	G5oLQ/pJ4hK+xGB42yflhx8NQbPao5jQQERE0zMzXC0tgL8Bf0ToMAyWPCJ1iA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 5/5] arm64: dts: mba8mx: change sound card model name
Date: Mon, 20 Jan 2025 14:25:02 +0100
Message-Id: <20250120132503.556547-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120132503.556547-1-alexander.stein@ew.tq-group.com>
References: <20250120132503.556547-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_052533_285226_7C531CC6 
X-CRM114-Status: GOOD (  13.04  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

The card name for ALSA is generated from the model name string and
is limited to 16 characters. Use a shorter name to prevent cutting the
name.

Since nearly all starter kit mainboards for i.MX based SoM by TQ-Systems
use the same codec with the same routing on board it is a good idea to
use the same mode name for the sound card. This allows sharing a default
asound.conf in BSP over all the kits.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/mba8mx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
index 124a2544826c9..0931f680e6875 100644
--- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
@@ -158,7 +158,7 @@ reg_vcc_5v0: regulator-5v0 {
 
 	sound: sound {
 		compatible = "fsl,imx-audio-tlv320aic32x4";
-		model = "imx-audio-tlv320aic32x4";
+		model = "tqm-tlv320aic32";
 		ssi-controller = <&sai3>;
 		audio-codec = <&tlv320aic3x04>;
 	};
-- 
2.34.1


