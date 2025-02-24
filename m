Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C35C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 15:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T6W5ZMpXaDdvfRap/6NIAL55MOOCeVq3QJ0xPOvFRkQ=; b=xdBpLwEBjke4pd+ZPkpl+H3D6a
	z0/HP+HmOaT6CXbH8cogBpDhEMr4TQMvN+Q8ZloLm60req7nplCsE+ZoWxikrR02B6WTevOsRqfmr
	ch4ZJJumMNQGW9+wTuJG0PKaS8Ll7LIKCrxjoN8WB9mqINEaK2pq80wTx77uvOnw1fFi5H+q8U7ya
	m4tQYVPvr4i3KpK6UrBymgcinwELIkzRTM+dOSYUx0QBg+1jLHK+zwV+Dqx7zcTptxfDzzHgEK5BE
	dCP7suE8F1pPu+c481rMo/NPC2d9bN9AJgM9QwQlYbZIxR5cJwH6F1scP1GA8AWfibWHx1VrybkfF
	RWYI02MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaDO-0000000EG0C-2PNt;
	Mon, 24 Feb 2025 15:17:50 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZwZ-0000000ECZH-0Lzs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 15:00:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740409227; x=1771945227;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=T6W5ZMpXaDdvfRap/6NIAL55MOOCeVq3QJ0xPOvFRkQ=;
  b=JSJCrmddb1ewxEIwrA0Y7GpOSgYsDmQxEIGoWSQcjDEZ/0rfAo0ehXe0
   z1Tw5yst9qVn4uU808eU5hYJe1cZOeByHS7zRj1uzEp6UJJ+uiaRi0Mwb
   dvh4Qog+ETvOXyvxVim/g5KUbBZZpPrhndmHHgKPhzwMI5g07OG0Xbp8Z
   gdYuBrvD9O8ut7WYHJMZo7o5Y2GzRGIcRfzscFejKI31IcqTieqSwgKve
   l0E6otPcDRaBwnmhpXOzPG0v/VDHrGrHm86EPBuW1yii7XjA34LLMdHwl
   KpkLGzXq0oA85M0WVGUH22Odjo0eSI3lCJoEQuywfBMLiYJmoqhtg7cvV
   Q==;
X-CSE-ConnectionGUID: lvFkyRSJSjyP0h7uqar+0g==
X-CSE-MsgGUID: fM+2bR44QEOqxtSh2K96uQ==
X-IronPort-AV: E=Sophos;i="6.13,309,1732575600"; 
   d="scan'208";a="42043004"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Feb 2025 16:00:24 +0100
X-CheckPoint: {67BC8988-21-C21CC984-D1047F1F}
X-MAIL-CPID: C40F4806809927EB72D8AB495A33CC91_5
X-Control-Analysis: str=0001.0A002117.67BC8987.00BB,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A61D016798B;
	Mon, 24 Feb 2025 16:00:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740409220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T6W5ZMpXaDdvfRap/6NIAL55MOOCeVq3QJ0xPOvFRkQ=;
	b=KBJvqddd7Fo+MyVSzXw/Tg1rWwnj/aVyFzMT45gg9ZcLAMoxBoEzuPGyESCuNI3SsyYyVJ
	cOIqIrzIVVpHNnH6PTq1iH7gF4u0fbWapn7sbxIP8qabLDZbZ3zBAeH6NPYAOCo02NlfwA
	zQau4MhcsDYUx8fXYNpmMqsMvGeuu6W/BTtbOa/+oFtKYwPQCH/u9Uz6ARQpGoNmoq99sw
	aDPAave9zUomXQi7VAUPj8CBDnqJRKIeJRjNHMX3eN7MjcVVX2erH0ruIjMt4t4dknKmpI
	LA4RjQ84x8NBhTW5MJpuj71d1JCiro1jC6zprU0ty/5jHm/t8IFUVb7pYsDAdA==
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
Subject: [PATCH v2 1/2] arm64: dts: imx8mp-tqma8mpql-mba8mpxl: change sound card model name
Date: Mon, 24 Feb 2025 16:00:14 +0100
Message-ID: <20250224150016.499055-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_070027_418023_B654DD82 
X-CRM114-Status: GOOD (  12.55  )
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
use the same model name for the sound card. This allows sharing a default
asound.conf in BSP over all the kits.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Rebased to next-20240224
* Remove dependency on local patch

 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index ae64731266f35..23c612e80dd38 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -234,7 +234,7 @@ linux,cma {
 
 	sound {
 		compatible = "fsl,imx-audio-tlv320aic32x4";
-		model = "tq-tlv320aic32x";
+		model = "tqm-tlv320aic32";
 		audio-cpu = <&sai3>;
 		audio-codec = <&tlv320aic3x04>;
 	};
-- 
2.43.0


