Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08A4C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 13:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78hFLxJMZ5BSxXaEi6N8mTluP6Y4p1HUHn9cC/6qaBc=; b=ko4hkj/3hkvF7C2yO2jlj3ybKS
	yCH6dFcMDJGepVvciNNXVEGOoL1CVODtXVrzmRP5/NPVxAJjCByJyk4emlExCX0lu6G6szWNSGaqG
	LnTonllmNoraDBhGRu4UhayZru/QdA9biPBXt3aOePkJxlH9bibS0+XLQbFtLQdQabf2QGIV//jDQ
	aklFXFFHGnkVQDkg68Byr5DziaVKGS1xAjdia8xHFS29dqe3KJ+GHL/RBpaunfdEs7z9CDzUe8pHj
	liMlzR9XxJkThADUKuB0yWnDhFm3RtpIGmxTG5Oqa5VmvjI/vEeJw0YVC8H42mLGYcMFFJxYIE4JW
	CFi6/1OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrq1-00000005fXS-21PP;
	Mon, 20 Jan 2025 13:29:09 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrmN-00000005eob-1fK6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 13:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737379523; x=1768915523;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=78hFLxJMZ5BSxXaEi6N8mTluP6Y4p1HUHn9cC/6qaBc=;
  b=LF4jb8gLxSZtsppvbPmB2Fc6WO274GxgH9UKIAmQzaH76oOBY+zjUxDm
   zwsrSTdDJEAt7xvwFDRQqyyoG63+sit+a+A3EvNTR2ed0ARaPrVbKdOj6
   Dgv0zLEIrJ6qRdnUXJizl2BOGcUwJRkKKHK+Txck5FXgq7QRvV5tzeq5p
   EweiazZJL77+jbznQjmkO/KAHSQDq5FYGIMiOzHEnCdZfjQa4C3B7xjbs
   cWlsoYUcO11vu1v0ap+PqAnqfUzFBiOgnTviyJ9zXcYWLl1Vklwj5KDay
   BEaELE1gfEQIv+8Ds0snu9N2W5+ujbfYtwA3T7PFl/m8WZQBWCODcNle+
   Q==;
X-CSE-ConnectionGUID: ugZyBFbCQE2JwcyEpI2/Pw==
X-CSE-MsgGUID: m/aPMDTATjWPvYTZZlizbg==
X-IronPort-AV: E=Sophos;i="6.13,219,1732575600"; 
   d="scan'208";a="41177844"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 20 Jan 2025 14:25:21 +0100
X-CheckPoint: {678E4EC1-1C-C6D8D88D-F91F9E6B}
X-MAIL-CPID: C69335771B147E5FE6CECFDD8A1952C8_2
X-Control-Analysis: str=0001.0A682F1F.678E4EC1.0075,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8DC141611A2;
	Mon, 20 Jan 2025 14:25:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737379517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=78hFLxJMZ5BSxXaEi6N8mTluP6Y4p1HUHn9cC/6qaBc=;
	b=rZYcPdHn7lTNtJqYHuROVodoq9CyzHhZeP2H1vbEYsNgfhQcb4t4af9YRM0XN52tUB6ePb
	JHSLaeci3MlufGBPuSstyVXgGbXn2lE9/ceIqohLsclwp+BoBYTDNUk2hG9n9LABZpYvPS
	kr8OsGqWbpTtt/Mqfn9yVgb1+q0f7jp8qXK5TiG2sv5p4TpFftDARdMHU0b+jBJb9A+xp6
	XZgEnTOVPkaQcdq5GImVh9Bd+oK3Vz8Stwwy05QsQPOlcviGoLYjSQS3f4DgixEiW3V1nI
	rpQJ1/4g5UqQLBuvnP4cbAi09jr9O+v9Gd5YUslKL1w8Ak2/UINiXuQkFjkvtA==
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
Subject: [PATCH 3/5] arm: dts: mba6ul: change sound card model name
Date: Mon, 20 Jan 2025 14:25:00 +0100
Message-Id: <20250120132503.556547-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120132503.556547-1-alexander.stein@ew.tq-group.com>
References: <20250120132503.556547-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_052523_735825_037D84C2 
X-CRM114-Status: GOOD (  13.16  )
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
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
index 941d9860218e9..67a3d484bc9f1 100644
--- a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
@@ -142,7 +142,7 @@ linux,cma {
 
 	sound {
 		compatible = "fsl,imx-audio-tlv320aic32x4";
-		model = "imx-audio-tlv320aic32x4";
+		model = "tqm-tlv320aic32";
 		ssi-controller = <&sai1>;
 		audio-codec = <&tlv320aic32x4>;
 		audio-asrc = <&asrc>;
-- 
2.34.1


