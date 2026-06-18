Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70530CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 06:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oYtMNvW9Xw7V4xV8rViwKBHxvNdU5b3bYhK0upuj6Qk=; b=0WFdHgr+YhS6l6mr9N0n+/1xEB
	UTZF0rNqJr6yhLK7wL+WycgZqMPXHEtlZ/eifQofTOilaGc1HEQg32e8jh6iV2JXEpZdCMGZ7XcMN
	sYA5JV5zR8b4CInbHWmEmTtdTfRNnSW1RHYhJVy4qFdIzHzYpICiJaQsWKt0RQaOJAkBF8qFSeEMb
	WHpEP5jR9szTZnw6Y52CBNh45kinRUMWd++ig1GcxNqjx0Cv9ZqfKZUUGdJGMXgOg5SC0CxlWUsGo
	nZ0w6V2hsvVirp4WlHn/GskBz5mUoJ4p89J2N9BQhyraw/Ei+gCmEQFdgsOQg62qMohVAeIk+BEpH
	04vO51NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6WZ-00000000iKg-0XIo;
	Thu, 18 Jun 2026 06:46:51 +0000
Received: from mail-swedencentralazon11013048.outbound.protection.outlook.com ([52.101.83.48] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6WV-00000000iJf-3dgT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 06:46:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IuYu5S3bWp5m5DgPLBdb7zcozW1oAuDamkUV26Pn9r4fN0mroe0R9gNcZ531YE/vDV/DK6pt/ENGO3O23cnyvTzA7uXHEqQt6fGNZT44nIeVA+1mArO+xU/4PXdVGwrmoV/LYE4xBvxDxqUnBTyVZl1rmowXam79uAieFknM+MweJk725yA4JbpYbFxAJoCc8GeYvldP1wqKnPOySC7UVLCeEyRgdkZO4qU02lVCmArPgb4dsMMgrGGprezJvWrLU6MNGvBdw7iFIaAt+GYgj6bfAubv4vSU+QMxlR+SVLeWLWBi0RDg3IDUexnqJbT37lOA/tlqYVXDAiNEfhmMRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYtMNvW9Xw7V4xV8rViwKBHxvNdU5b3bYhK0upuj6Qk=;
 b=e08LOvpUD6hO+lEVLVGPXqQl6bklvddon5sBNedZyQqpB5VFSJG1xjTUS7PbNNizaSolCljfuu8o0oX/18RQg0JmotpYWb64IxacTcfj5pTE/wW3FLjcIRVKU1wHZ5o6JOpTjHNtyh+5ssAh4KjNfhQzuEG8PjfGGYbd7LULmYdQODKmjO6CmeXPYMnwOwFGn7JV6E9BStZ2yRM/ldee9Y40YFbPTTaDgvzjvaF1WVpFRKBL3vLGfu6yPUbQsfLsiJ1Cn4Zgr8leRJgfFsLTwueEbA+3obbv6Kp6fAnmNFCyrdvGyX5PsZckaClA/Qe6HrnlKLt0NqJ7NS/GSSPITA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYtMNvW9Xw7V4xV8rViwKBHxvNdU5b3bYhK0upuj6Qk=;
 b=COt5uV97XsbKb4nG46UxNNilBf68jyQmFj2tpzShciylcN9Q1ou0B/qKNr47A/FIYueiAULzEXgAyVanSn9w/m2DEOc6io4mNpvjFGD11YOmC+tcVFVcnnbQntvSrg1ubUnzMI0NpM4WzguTn40FDmt0eZT7m89xAcplB7F1oeuvWO8YuSyEaMmhOPMkgcnY147Nn8mWAKQynhpKa7Ufy5A90i70sKkKjfdmkWz3n6S7wr1eu9E4PxTH/fmITTHpFUYrvUg/SmetSzNp5tXrQaLI+J0u+x/vsdlDO21jNN9am2o5W/2uuqfjHmcpaoAp1J3QOPLuo+urwdsx7sgAjg==
Received: from CWLP123CA0009.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:56::21)
 by PRAPR10MB5373.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:292::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 06:46:36 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:401:56:cafe::88) by CWLP123CA0009.outlook.office365.com
 (2603:10a6:401:56::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Thu,
 18 Jun 2026 06:46:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Thu, 18 Jun 2026 06:46:36 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 18 Jun
 2026 08:50:40 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 18 Jun
 2026 08:46:35 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 18 Jun 2026 08:46:35 +0200
Subject: [PATCH] dt-bindings: spi: st,stm32-qspi: Add power-domains
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260618-add_power_domain_for_qpsi-v1-1-4d7e57bcfb9a@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAEqUM2oC/yXMTQrCMBBA4auUWRtIsyjRq4iEtDPREUziTP2B0
 rs31eW3eG8BJWFSOHULCL1ZueSG/tDBdIv5SoaxGZx1gx16byJiqOVDErA8IueQioRnVTb+6NH
 RmJxNEVpfhRJ/f+/z5W99jXea5n0I67oB4MGtY30AAAA=
X-Change-ID: 20260618-add_power_domain_for_qpsi-898d2ebf20fa
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Christophe Kerello
	<christophe.kerello@foss.st.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.15.2
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A2:EE_|PRAPR10MB5373:EE_
X-MS-Office365-Filtering-Correlation-Id: e0ad1308-d262-46fd-81b9-08decd0557c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|82310400026|23010399003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: kSh+SqrRy0gt3gCEkr+GLrwCeDKPoVIoZDWPXMIhdl4q97hohyd/fXJvr335b/CLJFPJvgVkoA37gXH81uN+kQlOBqDTMAu093DleuDFZELw1fL+aL6FgPfF+uvpXUaM7+4XcR2VqZl+Zb6wAp1D3VunKAFYt9XDhsKcP11N0qwFNIGRGQyhszRIVZIaoH8nkGK3rL63N5NkR3usAOwX7Z6uPrG/3MTrdJzDIMAb2qfg386BEj/CDiVPHnKCrPnoZr6JgQyxp4RKNLpupXIm7bg6B+DQuUbud/WLjTxiLRP6FmIHXFiWpE1Qr4TyRos7NsRDAbcir9+N9VLmufxCG4t2C/32kX00LkvzOxfgKbkaFTHl4/XbUGMtepWEJiLzKfpvSfmA1JrLGTJahvBpKpaHNwWLp3NkZN28iO03URVQijavkQJ0qIOtuaeKYzdwNHNpO5+nhbtwwst/97Dqbue11us56bAiHD1bA4LfnAU8eSVrZSqCrsRom7kHn7ADQF/a8pN942ixAJ9FgPsxO/aykFIS9isk6pEE9gxr2SGymuH/rtasNMumk3drzRc/4KUjJa9xMkV+fVH1Tqw5jAzohgRNMHpmRrq+5rGx/78bY5Bd2OmF7fYltYrfCsVjiDqXZQno/hce7rPHu5qfmadrc3ZzcaSv+R+a3uN6KiJWJGZmXQdvqMog2yrpmn2GCF2mida4GRfYxj8ebUq90fG8dh1DQ2mXku42ui12MBA=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(82310400026)(23010399003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: w1Bqostu1zbNpdTrNBxl+rEb6XANUMrApRvscbYd5+2gthwMyteZEGbO0fst4H7sc0ysp01VrmpCTkMWBeTmDka0M0biu4qW4u0CuMHoAltEMs6JEQ0dbuvARnXuU//Dg9G4ctcMIB9cmvxtgeTMwqt6T5cH7xQx/RDrz1fy/WvLyBK1JuDxEyxo6vc5XqOpevAgP0piz13rDwUmhxK6PGeYOYlegVtvHhItPqpfbk5ojHiXMCKtYYWAn4ooKx1Bfhih1o2eLBo89/JA43SeeZN1O8tUoLzDwM8VR0WrzAF+/lVsCUv+PWCx2Tq2PMirlQyTXZVcL6x54Ic4Uo8cAoB+Y1cC8SSdwfwyX6NyjhalupQSKYHzzlITlH/uODGfCb4ARd6WoPMXassnCxRuQ12JandcghAsl8nN1WFmJ3RGk7ps2YkrTvF/JithDNT0
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 06:46:36.3322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ad1308-d262-46fd-81b9-08decd0557c3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5373
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_234648_467547_7AECBA26 
X-CRM114-Status: UNSURE (   7.09  )
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

STM32 QSPI may be in a power domain. Allow a single 'power-domains'
entry for STM32 QSPI.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
index 3f1a27efff80..ee57739b73b8 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
@@ -50,6 +50,9 @@ properties:
     minItems: 1
     maxItems: 2
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg

---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260618-add_power_domain_for_qpsi-898d2ebf20fa

Best regards,
--  
Patrice Chotard <patrice.chotard@foss.st.com>


