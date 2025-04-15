Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4646C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 13:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R2SZvhgWOcXu74APsWOF5IGVz2bjc0yiT34pBzEhPzg=; b=M8RkPV/pCVoYyPeG3NALzn0sxk
	P12gN2OvUWGR58OfOJPuWVu+0jwBRZDkfxrpMRmI0+kPKX/4lgSupTJIVNMSqNeyZtnunGJnjg9t8
	+EaFsNqEAFBmOOz2dY8HhwYLBmjECh3PDhXJDFercanEAkMw4GZcBLpVmiRE5mBz/J3S57Z1/KqE9
	guUE5ZRnYM6mE32OKz1JP6LW5jZGrWaqrb2r/kBEKdBGhkxLukfl4anLD/UH4OoIhrfVE6dh2ejfm
	/8+z0mA6vkfbtMdqZEZGHcJukYAZRyKKsa4hYprASNGJ+e/MlloIYtwGLzG6dd9aAJLNbg/jSPbCc
	0zO8hnlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gTp-00000005wZW-3K38;
	Tue, 15 Apr 2025 13:37:37 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gPa-00000005vQE-1u2d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 13:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744723994; x=1776259994;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=R2SZvhgWOcXu74APsWOF5IGVz2bjc0yiT34pBzEhPzg=;
  b=gzgn44aiSzNNvBQvYpSHdq4KDSbuWFtI0A/la6Jc74q2JExEcnyh9b2y
   FSRu0QXN056mEoM9y2vQTk7MHHAclXC1j2Ve1Xg5E8sCOJw7R7b3ws0Pw
   tzc6Cl8wsPyzzehOoZFfT9aDWdnV5R7Ki/gT02g4MG0tSdRPXRwLOSYHA
   bh6xWlLG8/jDxm7+bHbvKfpQCsaX/yLNNxPHNVY1u2UG5olboSRYeeFkl
   L6pddGHN2vK5QoD753/IVwin6VKzH5YhYmoo0pf01L2IwLwXwYqjGJZW5
   ImOXEn/bCXFIbrobWNnQkwQOoWJ8Er3Cm2jEjmUM0s9vmyqMtu96EuMhF
   g==;
X-CSE-ConnectionGUID: FzvENSeBT/eNc8+aXFsG1Q==
X-CSE-MsgGUID: iKjBA6smT3i4jVEC3eJDkQ==
X-IronPort-AV: E=Sophos;i="6.15,213,1739833200"; 
   d="scan'208";a="43543921"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 Apr 2025 15:33:12 +0200
X-CheckPoint: {67FE6017-19-903EAEAC-E04C76C8}
X-MAIL-CPID: 41A4BAF9440150BB2E011C50814F7D8B_5
X-Control-Analysis: str=0001.0A006397.67FE6014.0029,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 072EA16352A;
	Tue, 15 Apr 2025 15:33:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744723987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R2SZvhgWOcXu74APsWOF5IGVz2bjc0yiT34pBzEhPzg=;
	b=Aye+2S9OSazLcxSrARooQIIqEveTec8F0AuUZg7N0qxWL4N3rFbkLV0m/aKsaWjujxk4KJ
	iVbqYFijDFu5vULgJ3uzsKQI6FeOpEV+cWnb2ocKKBc5EYWUGOftgpoXCUhRPcaDbvOTQ8
	QLsngYPwAJDruKTEh2ffEyatPXO17Cl4Swmi/H9PpurvFivHiuUAWLQ1YwVThexqDYj+EP
	B+z3T+aXfrcaWgSvHxXSrsx/9yHiC8dit59WZCd04ziXxRkpJFSD0cyA5qDAfrAe5ATeFG
	o5cx6e2F+E7h8wbwrElMBJo0vtNblnMYym0EF3LEpGkZefwH9FNGInu1HGsfsA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Markus Niebel <Markus.Niebel@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/2] dt-bindings: arm: add TQMa8XxS boards
Date: Tue, 15 Apr 2025 15:32:58 +0200
Message-ID: <20250415133301.443511-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_063314_979436_54FB693A 
X-CRM114-Status: UNSURE (   7.52  )
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

From: Markus Niebel <Markus.Niebel@tq-group.com>

TQMa8XxS is a SOM series featuring NXP i.MX8X SoC.
They are called TQMa8XQPS and TQMa8XDPS respectively.
MB-SMARC-2 is a carrier reference design.

Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index a6fd347de03fe..1c5fcd69e93e6 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1333,6 +1333,22 @@ properties:
               - const: tq,imx8qxp-tqma8xqp     # TQ-Systems GmbH TQMa8XQP SOM (with i.MX8QXP)
               - const: fsl,imx8qxp
 
+      - description:
+          TQMa8XxS is a series of SOM featuring NXP i.MX8X system-on-chip
+          variants. It has the SMARC-2.0 form factor and is designed to be placed on
+          different carrier boards. MB-SMARC-2 is a carrier reference design.
+        oneOf:
+          - items:
+              - enum:
+                  - tq,imx8qxp-tqma8xqps-mb-smarc-2 # TQ-Systems GmbH TQMa8QXPS SOM on MB-SMARC-2
+              - const: tq,imx8qxp-tqma8xqps         # TQ-Systems GmbH TQMa8QXPS SOM
+              - const: fsl,imx8qxp
+          - items:
+              - enum:
+                  - tq,imx8dxp-tqma8xdps-mb-smarc-2 # TQ-Systems GmbH TQMa8XDPS SOM on MB-SMARC-2
+              - const: tq,imx8dxp-tqma8xdps         # TQ-Systems GmbH TQMa8XDPS SOM
+              - const: fsl,imx8dxp
+
       - description: i.MX8ULP based Boards
         items:
           - enum:
-- 
2.43.0


