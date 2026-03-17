Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EE9FD707E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIcaDlgDtYpkew+vGB6X/JduwmTqv7gRZ0/o0A3l86c=; b=RAP1UmU9TQiCjbJNySec1K/thv
	HHJ97+fJXosvByTn0J7dTPbA85IbL6FVJF+IGlmn2x3ewqyLiUHAkI2ezZVsUcT1cjS9Q9dr6ETIV
	cVq5HlndrjfBUMHk3lSH3lCjItTYzSqONAGSt8U1sO94JR/V8cuGScjYjY0te8XwVhsnyQFdlJrHr
	P3jgsO2ghxR7l56FoV84A3D3zbA25unlwtn6EM981PPc2CCVDHbgIpO5K+I87AvPJ1HYNicinNm5s
	d8q+O2s7vUnb57Fhc2zLykAhBBoccSZzb3OJOqpPjYmbi65pWqBrpijCOcQIElV2b93LULPNnOzO+
	1psg0rng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SQQ-000000066by-0Vis;
	Tue, 17 Mar 2026 11:17:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SQP-000000066bF-1jHG
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 11:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QIcaDlgDtYpkew+vGB6X/JduwmTqv7gRZ0/o0A3l86c=; b=UO5ilWXzc7RlFS7drU6PtMOuzp
	LwAjpML9z0BGKBj68MeVOrbpDzYjsWmgpSMxPVXyD1+9XGhH7OmrbuS3asm8XrXVA8O8dw0GWjP+n
	DMQCv9mqBg4APifQhtrsxx09P8t1HsY6vsjIAuw58Z354+J2H9q1pfesSKG4CK1KjCGbVAmh5pzBe
	XHUQ2+O7XcQQVHzgBPTsjhZhBqUi6Z86J1gL64IZdDFzcFGU4mD4AM5Nljhi7bp8PZES9+l2bd7RI
	PpaDZiHEAIML59OCkd5aDha6Xxm6uX7BZI7YzCao4eGGryoqI4yFsCcoO89TQT1AhgI8S50gyKW5W
	pp2Zy7HA==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SQL-00000008nww-3VSC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 11:17:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=QIcaDlgDtYpkew+vGB6X/JduwmTqv7gRZ0/o0A3l86c=; b=IqaLJIht0UCg7c4C2GVMY5qAZl
	BTCDxaKljzm9hz6w6ua2W1JA7DVNZI72R4phxAGanm0nMlcJyDcYdyBeiBBanWMyQ4tyegVlaY8Un
	x3cukG8cze+AWd1f+y+YOesTENefg5gOGvHJfMyIKP2UcXS6StaSs8KjnHrawEfrwBGkwGBX+nq7M
	ZsIeVypJGi2PxswNpiRvMVuCKJ9SmcINv5A1ulOMQzbHWsr+PL/42HaK6XY1948B7Vvk69NlJ2UTj
	N+ISUSWpPhqr7VLucl72EFzPOMhHrs6udKPTuqlpQHj87Zn/n8mFFyz/1gUIjiSmCnnUs5n9a5xSQ
	xXwu1WZw==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2SQK-00092E-1S;
	Tue, 17 Mar 2026 12:17:20 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2SQJ-000MCw-1u;
	Tue, 17 Mar 2026 12:17:19 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/3] dt-bindings: arm: fsl: add MBa93xxLA-MINI
Date: Tue, 17 Mar 2026 12:17:00 +0100
Message-ID: <20260317111704.1075938-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317111704.1075938-1-alexander.stein@ew.tq-group.com>
References: <20260317111704.1075938-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27943/Tue Mar 17 07:24:09 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_111722_053862_24B5B26C 
X-CRM114-Status: UNSURE (   9.12  )
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

From: Martin Schmiedel <Martin.Schmiedel@tq-group.com>

Adds support for the MBa93xxLA-MINI SBC.
https://www.tq-group.com/en/products/tq-embedded/arm-architecture/mba93xxla-mini/

Signed-off-by: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index da2be7114f641..2c86d2381d95a 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1558,11 +1558,14 @@ properties:
           soldered on an adapter board or for the connector variant
           MBa93xxLA mainboard is a single board computer using the solderable
           SOM variant
+          MBa93xxLA-MINI mainboard is a single board computer using the solderable
+          SOM variant
         items:
           - enum:
               - tq,imx93-tqma9352-mba91xxca # TQ-Systems GmbH i.MX93 TQMa93xxCA/LA SOM on MBa91xxCA
               - tq,imx93-tqma9352-mba93xxca # TQ-Systems GmbH i.MX93 TQMa93xxCA/LA SOM on MBa93xxCA
               - tq,imx93-tqma9352-mba93xxla # TQ-Systems GmbH i.MX93 TQMa93xxLA SOM on MBa93xxLA SBC
+              - tq,imx93-tqma9352-mba93xxla-mini # TQ-Systems GmbH i.MX93 TQMa93xxLA SOM on MBa93xxLA-MINI SBC
           - const: tq,imx93-tqma9352        # TQ-Systems GmbH i.MX93 TQMa93xxCA/LA SOM
           - const: fsl,imx93
 
-- 
2.43.0


