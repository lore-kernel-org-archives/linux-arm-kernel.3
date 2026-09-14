Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3E0C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q/V8HV7Xx1Vai+bIGvEOCgJ04yChhN19onwpdff4Y+Q=; b=BUU0FfMqrID+6c
	JzUQ2SnEFBAcxGm4G/6BQxMi/+h6HQnnsSFpcXLSSCi8wB5Qm8LAiXpi0xqh1wZ2xfi7qwyX+piLw
	R3Kv9xOyXw85fK9DzS57Z/z0oMgZNWnbKv5N6ONvG0X/pGOkJwOS4vRcpq2IMx3PyGT71jjY4zk1x
	X9vHtWSXR9dJSdP1icOwYb1xgm8F6rfQtDphPTiVsnAV0EgbNRTd25I2UZ8nw+xjzFlgpeeNRpWhi
	GdmyEx0iEErtnZ8GT1CkE7ozJlcXb4ss0g5Olz+irsmjifSFT1jr9GlvTyg+iULz1NXlffLt//+lF
	pzXvGeGuH1h+qtB4P+xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60pL-00000002Wzh-2ShR;
	Mon, 14 Sep 2026 07:10:07 +0000
Received: from mail-norwayeastazon11013057.outbound.protection.outlook.com ([40.107.159.57] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60pI-00000002Wyq-3Fol
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:10:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eryKSy5hd8fxzBGtXMM6fE/cpIgVd6AUlhJS8HUoTMIk2Nyk9iFuYt3nOk0KgNu3at7W7v4dvpnb9pArIraLdR/2A8ZJCpDq7qLsxi+QWXzJcevvcKR7VKq74/tn/n/xFxzzpM/GpQ+FBtT2lY3e8JQ8W0sAmHXPr+Q6Eb7FvPH5AeRc6oWcgk7wuV5SGk24fLjUZHCcrZ3J1wxy6keTFPfMtNPTt9+UoMod082Ky66HmymEYh2ZUZeIlySym08sYmkmwYNHzrCQs+LB4XTlZ8jz0ceET/Sk6+kidNvXNM0OMbD+d8ROhiqQyyznSHfRd0oJUgsC9368XA5zrDhKjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/V8HV7Xx1Vai+bIGvEOCgJ04yChhN19onwpdff4Y+Q=;
 b=isgtdHaNZp2yikO6tfvdvfyQUeuuIaw/qtDCtb7rnE0FPjwqu/PErAEvg7FH+Jbo3PvqvAIMnyRZqnp0XM66YCCryYHlKF7+u0M9Xi4vLBaYTeqwl7U27XC9rkoYUaRPQMQXBk0dKWZ3NcZQE4qRbYlhH9MNAKdIaXEozE20N5K1+Z9lr24KzqZUiWwe+sb4eEJMX/3weJWRgL1kncDwfWutS2Y0/sJCwFtTiN2L0Paoe+J/cpgRymvd4dAt/jAWo27Ih/7OSWRLcOWmAinM00wq6z/CgkoBDcUkiJumbXGp0AJaaWwTBzqGam86VfPTTnYrSHKMQY4276XyLBhHXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/V8HV7Xx1Vai+bIGvEOCgJ04yChhN19onwpdff4Y+Q=;
 b=g96cULw+F9o0UsFrZyCrAQ7XAkUjRqN7jgq5pF584quBvibIDjpiKT5CSHCjj5fSgBcyDthdt8B2e3MYynvjxrDdxhIRRU5dKPRoKAxUlwDU3m0BgL6VFQxfBPsOF65DzjBx6aa74ICiSF78RAwCW6h+zBVCrBYf5wo79vQeXzcWxdc6v+dqgRuhWhyAcrd5iBeG06zKITARNRiZJFX6iVDgGYDl775lyZyQq5eRK0NHl58u2XR+lIx9aER45ZnKRLIfNuWTYEsi7aQcpNg4VUS61cV72qP9DcLCDnODbRTARkB/c5AGWmhmOC7g5owm5JNb7Fl4NHZJiZZ3kkhLBg==
Received: from DU7P189CA0006.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::6) by
 AM8PR10MB4113.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1ee::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.12; Mon, 14 Sep 2026 07:10:00 +0000
Received: from MAD0EPF000008B9.eurprd04.prod.outlook.com
 (2603:10a6:10:552:cafe::85) by DU7P189CA0006.outlook.office365.com
 (2603:10a6:10:552::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:09:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MAD0EPF000008B9.mail.protection.outlook.com (10.167.241.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:09:59 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 14 Sep
 2026 09:16:01 +0200
Received: from localhost (10.252.27.156) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 14 Sep
 2026 09:09:57 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 0/2] arm64: dts: st: add dcmi nodes in stm32mp231 /
 stm32mp251
Date: Mon, 14 Sep 2026 09:09:29 +0200
Message-ID: <20260914-stm32mp2x-dcmi-v1-0-c594e081d21b@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKmdp2oC/yXMyw5AMBBA0V+RWWtCvcKviEUfg5EU6SAS8e+K5
 VncewGjJ2Roogs8HsS0zAFpHIEZ1TygIBsMMpFlUqe54M1l0q3yFNY4EnVvi0pppbE0EKLVY0/
 nN2y737zrCc32XuC+Hz0Tw4tyAAAA
X-Change-ID: 20260914-stm32mp2x-dcmi-9fd57ababe6c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.15.2
X-Originating-IP: [10.252.27.156]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B9:EE_|AM8PR10MB4113:EE_
X-MS-Office365-Filtering-Correlation-Id: 684b9f95-b62e-4d37-9a6e-08df122f306f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: VwhFhTcQJet8tnVIkQD9YijCOogS8/LbdtwoRuhk+KpZxlAkHKu0tNor1l7Zr7n4gj02iNEnFW6GC0fTc2OJJqZ4QPQsOAK8vdlh0qzSwkwKszdqHx1GW3nPulkuJEhlKBVpxYiBMfZWtwJ87rmXJ9heVjdwdVJXitHOeICVih17AckhlJtdI2vcew3oDqbgQPx8q8mp8M1rytVAzyhwtaGzOOUZ8UDVr+9+9Y6WZXrYBVMtNE4edhKXU7b7IVglq3kZaFYxi15EqOpUl0aS7VAAPB3z9In9tpVyyKhqal5YUdkRbevZ0EDLrvZMJxhm6EWnDcFbnIQJs6ORSUUcRD8NhET5DsAeMVB+RiAQ1fNzGkXHycnlXItOcJsussguB34tivGHDzedsvvrz+B4s3UyGxxHm61yrpJUCOBD1I/UVoEZQOodlhRcGij8xicBU/oQ6JNTv2KQHH1iA6E3D9wP1S4qMWVMwDM5FE1wnJAVhJUuhX/aXGhgr9RE8IRJaXRh8NSrh7qPHioy5orhBn7b2OForkccPmkls5RlcyhlIQfbRmQthSd0ajksU0LwU/zDGJ63WX3uz3jWKDzTExCZY+TCtXPHGogP4BoOhSyksR1B5xa1Zg+8x9VkuJaWZKPFFTgcsN8U+6zkFusbiq+yZjR8XCXGNzIlp/JnXl7tEHPQKWPU1x423geiXR6O+0IcyMeym/cCIs9yLJkIiw==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: P9KnAkq1hWBEv3Fa9uMWFWjqK6LFtz7BP09Ax+NY4pbAKF8QOxyzIPmWHP3e8DHGlAjTRQKurw/HVruZXBGeBeSlHRKsf6Tyn3W+kqW7aKKQQ+ez67cxFsYUErmrElvK2x3xmYYnMtuHY+oRsjU2xn1VT9fOqdQZQuidlRG6SwD40oulLAo3EZjqFmwmYlbeNtzXFWpvrrd4D3GdFAsku9ne/UuU/patNvwV0IsyqBXIg8rMWL7wynCUa26DfGtuTI0BfAj18Y2sVmQGVXdYbn5H12xGxqectUEsd7PkUtfjRDR0bPY4wGZR9p92oVIzlWwI7j43nEl0/a5ZLbT5Ymla/5/Gy7R0NhrJtBtKv//2RK5PZeBt2BTV8a+sA144akjQMuOgeTTkYY4REp+DNgoLZxTT2Ani207soMG2ksL48cY+d4v78/sMhSetEoVW
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:09:59.4115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 684b9f95-b62e-4d37-9a6e-08df122f306f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008B9.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_001004_959190_E788310A 
X-CRM114-Status: UNSURE (   5.38  )
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

STM32MP23 and STM32MP25 embed a Digital Camera Interface (DCMI)
block allowing to capture frames via a parallel interface.
Add the dcmi nodes in both stm32mp231.dtsi and stm32mp251.dtsi
describing this HW block.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Alain Volmat (2):
      arm64: dts: st: add dcmi node on stm32mp25x
      arm64: dts: st: add dcmi node on stm32mp23x

 arch/arm64/boot/dts/st/stm32mp231.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 14 ++++++++++++++
 2 files changed, 28 insertions(+)
---
base-commit: 2f92d900f262a16c8ae02daf53ae2910d07185f5
change-id: 20260914-stm32mp2x-dcmi-9fd57ababe6c

Best regards,
--  
Alain Volmat <alain.volmat@foss.st.com>


