Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814E7C369B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 14:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mr8rthGcqLK7Mf5XXYhtFQ4qJ7aDekEwjv3kA/so2hA=; b=m1GeiUGmjShBh3dIwa5UJISUJB
	7T84ZSGjLaFka45j7lhd2v9vX5bhpabFkyWuPHoa0jm1mBwHud8G63jsVxSFBKYtSmIgeBASRZ1Cc
	i5kn4XZ0p5XjRbhK7Hn3RydAR/N1UkI2fQTRUN6ZEExuOZNtZrFxnFkkXMBs1WTCfP5GMhGnQ0W8v
	T637EWedt4fN8w/ljWFE+IVX3MvDzVyBgeO64c8WwV/con+Gx/LMw5iUe6vOhlgJ4QsRtwkoiZHrT
	FQZa8SNSVvQViH05e/8v2EBozp+YPCQF3VjkL/0/ZILx93JstF+37/qb8K9Mi957s/7S7B0YpLmhd
	JzV0CuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hGr-000000065kP-2mnW;
	Tue, 15 Apr 2025 14:28:17 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ftW-00000005qN6-3N0P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 13:00:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744722006; x=1776258006;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Mr8rthGcqLK7Mf5XXYhtFQ4qJ7aDekEwjv3kA/so2hA=;
  b=SLd3vjKnc6cohGQb98WyA3p3HpeI9+lJHEHHHEeuc/wcrwkU76mbR5Uw
   ptrGJ4ejZwmsbL2J3JcoLJdBufmfrDR7E4ZLDWZSkGZYudOitqUOwePzc
   Y2Ww2A4KOJHdNf4sMuFgFx2AxWzG1pPVbHzglK5bX8kUlRGTgdznu/hAf
   rfr2Q7vvke2kxqdWVZ3Ougqh2hKn6uk9aWvGQMkUg36QdtUHZx4fQbFxb
   gXG3tTb5M9BFameQAbcILi4zLuZwg/bAFQWce5ERJD0itgl2oAY6rfqij
   HkosOyyGiNz1zcz+lwhHZASpudzanwV2DqTn/yynMSdF0KyXzKdO5IKWD
   Q==;
X-CSE-ConnectionGUID: +YsFePFsSjiX9HIhy6CQXQ==
X-CSE-MsgGUID: 0OIt+IaESVWx8+v0BSCwzg==
X-IronPort-AV: E=Sophos;i="6.15,213,1739833200"; 
   d="scan'208";a="43542776"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 Apr 2025 15:00:02 +0200
X-CheckPoint: {67FE5851-4C-903EAEAC-E04C76C8}
X-MAIL-CPID: 3FE6A481E607086DC6325BF8FCEEB780_5
X-Control-Analysis: str=0001.0A006368.67FE585E.0033,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 587F81658C8;
	Tue, 15 Apr 2025 14:59:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744721997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mr8rthGcqLK7Mf5XXYhtFQ4qJ7aDekEwjv3kA/so2hA=;
	b=oibkwhhzz1if3vEMd7zeGUaN5QlCXvsoH1uj54uu/tJSxBkTW9VhsDyV+5uDtnMRQbUUV4
	dDPWznXeaIvD2PuZROqJf1muxZJmR86ALUkVYJ9tmqZtUstrxZTk/h5sT3Tah/IjvIzKk8
	dUlg9GeopnYhgjggrM5+hyovHq0HHHZeJTaulfesGbhLbp0b154mVwiCJlcD3csBbsKLVG
	a4XIWry5zRacrrMmRVopQ8bwjNwi2qbUs15IQWpOR5jzdZ8V3fFHnixm8Z1dGVJgYWXA22
	pKwx9q+3kDY5VAgNzZiQZiMRfJKlOLZtqTAjYecfTCTuAJkkZPnoA2mDCuF7sw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/2] dt-bindings: arm: add MBa91xxCA Mainboard for TQMa93xxCA/LA SOM
Date: Tue, 15 Apr 2025 14:59:44 +0200
Message-ID: <20250415125947.429121-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_060007_337122_2F4901DF 
X-CRM114-Status: UNSURE (   9.45  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Add MBa91xxCA starterkit base board for TQMa93xxCA/LA SOM for
parallel display evaluation.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 0ce2653066e91..a6fd347de03fe 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1374,12 +1374,16 @@ properties:
           All SOM and CPU variants use the same device tree hence only one
           compatible is needed. Bootloader disables all features not present
           in the assembled SOC.
+          MBa91xxCA mainboard can be used as starterkit for the SOM
+          soldered on an adapter board or for the connector variant
+          to evaluate RGB display support.
           MBa93xxCA mainboard can be used as starterkit for the SOM
           soldered on an adapter board or for the connector variant
           MBa93xxLA mainboard is a single board computer using the solderable
           SOM variant
         items:
           - enum:
+              - tq,imx93-tqma9352-mba91xxca # TQ-Systems GmbH i.MX93 TQMa93xxCA/LA SOM on MBa91xxCA
               - tq,imx93-tqma9352-mba93xxca # TQ-Systems GmbH i.MX93 TQMa93xxCA/LA SOM on MBa93xxCA
               - tq,imx93-tqma9352-mba93xxla # TQ-Systems GmbH i.MX93 TQMa93xxLA SOM on MBa93xxLA SBC
           - const: tq,imx93-tqma9352        # TQ-Systems GmbH i.MX93 TQMa93xxCA/LA SOM
-- 
2.43.0


