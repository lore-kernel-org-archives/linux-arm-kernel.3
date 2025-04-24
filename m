Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B51C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ziXtyaZN5bmoBDmr/R61NXBEs5KsMcbVvQqVoZIm3Nk=; b=ucWzX6+bywgKP0Iltm5nFzl1Di
	GhSJE4KT7tjpbwOv+GOOfL1e42m3wk7ffPucJeOMb6TTUUN5McWRtgbiLlBr0syQWbDCWylCK5CRp
	g4/LYk0W5fFpahTiLLLnWneJZkAzhAWr01Tqv+OyuElJxJcFTYozXi03JuzFWZ+1MletKyJzKpSfj
	6RuY7EjUw4uW1TqsXE9dg+R6M44GhWRLzRC/8zmLomR0NfPgSzsqtxoxD9JwdLx55G6oZBeOD/LHw
	LLveKDApoPBH0dCK859Jds3NAvcSAkD5BmlfYDt54LuwFxSB6ymPXYEctW68Vtcnbsjd1GwZ4z1pJ
	8dYHpYhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sY9-0000000DS4Y-0Kun;
	Thu, 24 Apr 2025 09:07:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rQw-0000000DGDP-0FwZ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 07:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ziXtyaZN5bmoBDmr/R61NXBEs5KsMcbVvQqVoZIm3Nk=; b=Y74FxvuGsTh8easITSTiMQVIwd
	94Hx1lLSgiPoN+jHZLi3EHwYoUaxL28Q+VRsUyRNxlvFEOZpvUT2h0l29a0nhZVKI+Ab4VVuGwiGl
	A9/tcuqrlE5PYXFk9zH3uqFIgU3+m2Bs5trBqwK5wQxjgEqY1P+LHR0kiHUukgRXOP1aycKMuio9b
	jtIp1ncrya/zZL0uCvVgIewgyhtY2yGCScBL7b2nQA+aISvJBn+gkbOFVwUjarN7FTNxLviygG8Mf
	UBdjBqBHr1B8l3x1DUxLer7ciL7o/HUJlN2b4iCBuS4c5FFCPsJur4brOepq9J/+z9lwYwH8gMTT7
	kphQCTAw==;
Received: from mx1.tq-group.com ([93.104.207.81])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7rQs-0000000BaeQ-46CU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 07:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745481342; x=1777017342;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ziXtyaZN5bmoBDmr/R61NXBEs5KsMcbVvQqVoZIm3Nk=;
  b=pPLKInOLrf4RmfWmllKB4Q1w1WbwE8SnroWnhpvOC8eK68KSyHDK3Yu0
   m0+/31SiOcXc3fM3x73c1sEvS6HKjxEbETZr6ysEDc8fyHk/WFj+jePXL
   nEixDznhBAbmwa1NLFEtiCiW/aH4SjEeOTraaBjdwFBsEwJHN0mo+cOJa
   7WTpKZ8ByrR3N20WqE558dsb5QgBmBPtxJCZR5eUEc6q3YhhByfQ80W56
   f6XBhrkx3o+RZzmNE3bauTxwUmISneOKvJUUtek7PZebTkSzSG1wGOJtF
   RIBPvmOXp4fJE9kt7lpPNd0vbJ4FITmPoGD9d7DWrMZnq5TGwWGjrNxc0
   w==;
X-CSE-ConnectionGUID: 8Fe9Dkv8QgOz+fFRgcfRoA==
X-CSE-MsgGUID: U06klpP9SjavAFBgeWvsbg==
X-IronPort-AV: E=Sophos;i="6.15,235,1739833200"; 
   d="scan'208";a="43691655"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Apr 2025 09:55:41 +0200
X-CheckPoint: {6809EE7D-6-2417938-F0170C2B}
X-MAIL-CPID: 70C2A69BD9BA4968A346425B2DD05DE9_2
X-Control-Analysis: str=0001.0A006371.6809EE7E.0070,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 11AAC16117A;
	Thu, 24 Apr 2025 09:55:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745481336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ziXtyaZN5bmoBDmr/R61NXBEs5KsMcbVvQqVoZIm3Nk=;
	b=pERHcMbugIBYZirMjTG3JOmUw/cYZ9K7rko1CiSmwZZn6eaJQ3RDNXmAvs3gpj7YiR74ws
	SPxXvUkuO7Dg/fcow7b8q1FrnlUzpWvQcsLFVNU3iFoT0eKoAKxX6B7F1+2ZCEQTNm5Jtu
	ECGS0S+MMOZUxdVLmmFxSO29VZWPLlN3iNx6yREJyrqOSAR5ecBO8oWUKOx38wnMa0vNQX
	SFRVpZwtOJA8OTyubF/LugRhcirZpkxPRCz2Xxrq3eOKEN4z7C4OuumsBROvBVs1mH4j1M
	gvUavv4eXCMTrMoyf0wkA9DLeBj5+H/bB6XFdiH37rdl2yQQT1O2exn5klgQYQ==
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
Subject: [PATCH v2 1/2] dt-bindings: arm: add TQMa8XxS boards
Date: Thu, 24 Apr 2025 09:55:29 +0200
Message-ID: <20250424075533.1266435-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_085543_212729_D2403737 
X-CRM114-Status: UNSURE (   7.11  )
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
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v2:
* Collected Rob's A-b

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


