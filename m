Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821A7C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 09:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DNSVoSPbN0xw1Vl35sz6w62zrgvAGm/58iSlaXRrh0A=; b=1eGH7d8RjskAcyFGs50Fcl4L0f
	ALV8QOkh/DNL5hgsBd4zlVKSNhezKorGtXpCAB1Yz+IuOZTzBT0lk4aGIVIszENReGNDk+xGDIhQc
	W+Cs31ReVdohQKI45vcvuNA0mtrWrsi1dS6UX7OatWteDx5F0T261by6Z4CWzQE9IOnQ2sfxIV1Br
	2FWN/DyjR3ycnyPKBGr+qZ6NBIIAojij0TOsLKujeLyd1b3cW5zaM9dNgtrIPQCs5vzBQJc7w/pAz
	3jZjFmFv+2yzn4Cx6E2MArDoGIx9ION0o9IqLwASLGfKsygn7FPOgI9xCNgR2ZLaxgg5+fliuX+ND
	JYejdwww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0Pr-0000000Fs9t-3QGf;
	Fri, 13 Jun 2025 09:09:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzKD-0000000FiIX-3Lyu
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Jun 2025 07:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=DNSVoSPbN0xw1Vl35sz6w62zrgvAGm/58iSlaXRrh0A=; b=kiZTRQ7mASeYY6rE7i7278mSpK
	uzucFo6nwuLwsawy0Oh7b5/j54WaERbpXlzLJHX9CctVZhzvSdcFwXpwScPwbwtgbNNQQU59jZpH8
	e3Oc2WEC7GK+5ZkVS9Zt29ZyhwX2uhnJSpX8EPBfcEDKaMiyXxY4IArR5aYdijIKGinwGdgRKEefT
	r2lX5zDUKHqCwhzwbETbCaFD/ROyN5OGtw6fwld4ZuiRX4wT58znJGrJb/EsWzuNdDkXJt8yB0Cnf
	fU8YZhdF+rH3feRoZ/wcHMtdvgfzzWoQH+sW9ASEqMZ9ZCJtWHZKAwD+oFC6igq1oVdWZYgqTCQDy
	a4ue4HgQ==;
Received: from mx1.tq-group.com ([93.104.207.81])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzKB-00000002uh1-1fTC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 07:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1749801582; x=1781337582;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DNSVoSPbN0xw1Vl35sz6w62zrgvAGm/58iSlaXRrh0A=;
  b=GWGkp0qakMkMGTG3tVcu3oC7msyiGKsRJLGTk0h31wyLuvAxlzxpd7RC
   8Ycu3RKFbii+Y6Kqg44uyue7b5YxBdfWvrBEjnE45te+G3sml0WCKs53o
   XjsuoJSa+1Z59kH51g9LtqYsSsw8LcSBYuZqRqT2TBWWQxtJpYCxKS5og
   1LqO2o8AHY8blrTTMkpwh78S4mPPMXHmx8PIN7UDC3UZnB6/cI7BDgjDL
   a502VdZ+fIr4jngKV0nOET+UgRG54w53hcidRPtN37EUXAQHGW4XskzUi
   mWi5oUHlk37Q8pLtB/7e11Ij1x4V5VFXWjP4SbxiwRXf+kAItXoEGMp6p
   w==;
X-CSE-ConnectionGUID: ohkuIZVGTPSxJQ2LAH775w==
X-CSE-MsgGUID: BXNNdm4PTICTcwQoF0kxSg==
X-IronPort-AV: E=Sophos;i="6.16,233,1744063200"; 
   d="scan'208";a="44619241"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 13 Jun 2025 09:59:37 +0200
X-CheckPoint: {684BDA69-2B-569BE4A0-ECC5EE08}
X-MAIL-CPID: 358E842842ABC3833C4F485B546D080D_3
X-Control-Analysis: str=0001.0A006371.684BDA7B.006E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D85A170669;
	Fri, 13 Jun 2025 09:59:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1749801573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DNSVoSPbN0xw1Vl35sz6w62zrgvAGm/58iSlaXRrh0A=;
	b=KscqKR3XLu8BOQs4LA8yo4NPygiDtQERFHDqqVTaDJv5+58YSJubHPc5DOm+nnFGutkwhZ
	gbwvlTrD2irSOqtzJu1X7SZA3UIHRl3kgx42EYylzJZbiJTNw76F0ViNG+vekOFqSrV9Ro
	6rkUoYitJl8w/dfmXES0lb+lRx+O2S4Ls/R/otX35AdLwJSC3SBT43C0fBTlxMArC++Ut/
	jvyrn1z2Y6vY04qVWIzEtjWWncqH+Dq5cpOR1KvzwsTp7pgTiV7AXOYYsD4cQEDqH7dgLt
	iFazszDIyG/veLC3MVqXvOaqdZ3ZMGd1TmIcyFrW/Ip0czOuN0OoDXPk554h2w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt: bindings: arm: add bindings for TQMLS1012AL
Date: Fri, 13 Jun 2025 09:59:24 +0200
Message-ID: <20250613075927.392499-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_085943_718832_B529452C 
X-CRM114-Status: UNSURE (   6.56  )
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

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

TQMLS1012AL is a SOM using NXP LS1012A CPU. MBLS1012AL is a carrier
reference design.

[1] https://www.tq-group.com/en/products/tq-embedded/qoriq-layerscape/tqmls1012al

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* None

Changes in v2:
* Collected Conor's A-b

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 4fb323fb8ab4f..d828fbd4d988c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1553,6 +1553,12 @@ properties:
               - fsl,ls1012a-qds
           - const: fsl,ls1012a
 
+      - description: TQ Systems TQMLS12AL SoM on MBLS1012AL board
+        items:
+          - const: tq,ls1012a-tqmls1012al-mbls1012al
+          - const: tq,ls1012a-tqmls1012al
+          - const: fsl,ls1012a
+
       - description: LS1021A based Boards
         items:
           - enum:
-- 
2.43.0


