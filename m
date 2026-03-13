Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8094D105F7AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sV6rbGltFVfXg4Q1Nj7QH0Aw8ZLbiB98H6MwDbTJZ/Q=; b=rC8jlvgF5rn4WcXsFpIyzHbFH7
	RyZ4XZ/LARIGwTVb5BJSwoxiOEZaodDp+QKGWKfG0sArjkHOCvvYb9EsBYy13HnUP1cl9QGxuyZp3
	aZ1I5Z3S2JlHCX6/cl7bFxAbceukjcGyrAtVSQ9xcD++akT+GvXRtO7ZdXJ1Y5msQ75LldSwcdGtb
	QkAXl8QUN95Bh/VNzEEQhRg2a+1xe8/wyXZZhnh8hURtGUQKNy9DtTh67WB32lCP4f+K5T4K4TFbr
	YD4VkumZXypMy8KbP7Ef4F1lZ6TczNro0c4JzROheoDIoYlYcnwNPHqS9e/SrgyMidjZJyOXsjTG/
	fUzEpzTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13Ui-00000000O98-2LoL;
	Fri, 13 Mar 2026 14:28:04 +0000
Received: from mail-norwayeastazon11023096.outbound.protection.outlook.com ([40.107.159.96] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13Uf-00000000O8N-2Kpj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:28:02 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gILmZ+yQXn67webVel4+DLEGLrCJKhE1GF7BSGU47noktQZOgQZuX15EGhgYZuMkf1Mdlaxq6CCa/dFr8VLmCUVRYgIq0UIwMpCDK7S0oZN5m6h9jL6AbeHe1rSzGw0geJxqkaXK4fq2BpWzyEXxAgeshCc1QyxQ+lhwOTUUS0PBK8dac4RQg2HeY5xBa1ACp1MdzqAQ2/Qj9W5eTJQD7jKJWj7t5gDYLmL/cvbXf78B+YZiUs8za584KTi0Rb3qr+FHfJRaJwGDbXtqAXmb1Kzs4wkBQx0DbKdFT/47WICCrMmzUxMX6WDruFjHJM0+Sic6uFa7u68oY5N3KJRFmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sV6rbGltFVfXg4Q1Nj7QH0Aw8ZLbiB98H6MwDbTJZ/Q=;
 b=nNxSyqCH57utK0zr1Znir2aXo/q1Pch9ZhLQ7tS4tct9n7rLfnupM8X+O1YvZIcoSJFthyp0SH1HtNy6Mlv3BHLFsMSuHZK8JNH8bNtbJLy+38sLdhLj2WQSrueunreH1Mp7WNQn17kwRXUK69YAK7HeZldl0qOjxaUJbGkDYtHt5R1Bl63mgr2w8F9HH7VdIW7nBAQSPIeX6vxzCjedTrqdSlwrAGvhXEmls4H63/1Q9kDW6t+Ca99jILOtsDQE4ZTF+NCZwpE8fVbQJdlQIrTNc8WFxPS06F+AoSGqDi7QNEifkuYcETfBPB7Jz3h3Fz9hcF0n1MZRbt11UtZRTA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sV6rbGltFVfXg4Q1Nj7QH0Aw8ZLbiB98H6MwDbTJZ/Q=;
 b=LpxxqavOyy7iKDmeiND3Uaa6IP7lt7dMKPKcTp1YS6meI1kbxEI2wW+LTTSw8iKGJ/9J6rVV84IlK1wPpFFDuZAB36Y9CYsj1H2zMtFAokCYn47BhBeOO6cyrIn0agklh47XLk4/7gLhZkNv3H44fOwaWM/epnqsk8Ee2eGhut4=
Received: from AS9PR04CA0035.eurprd04.prod.outlook.com (2603:10a6:20b:46a::18)
 by DBBPR04MB7900.eurprd04.prod.outlook.com (2603:10a6:10:1e8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 14:27:48 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a:cafe::74) by AS9PR04CA0035.outlook.office365.com
 (2603:10a6:20b:46a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Fri,
 13 Mar 2026 14:27:48 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Fri, 13 Mar 2026 14:27:57 +0000
Received: from emails-1804933-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-180.eu-west-1.compute.internal [10.20.5.180])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id F343780C91;
	Fri, 13 Mar 2026 14:27:56 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Fri Mar 13 14:27:49 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sd1vT6KXPNqAuEd1cSPBNlVpFYy/qql1fGU6VByI/Gqds0Q6c4SgyXrqBhx75oeatFUISwl7nWAO8zhBpw9/bye9RoBFNXXwW6Sa+E65ttelsj0u0XbWwjPgo71VY80sBxrzo4BF9U+kGIE0LN8so7GV9/RADjubxbeqwkWs/G+iQ+8MyQvI4QMZ1CVMtk+vLqutog5NXl945Y8znQ0QNsa9famFsvepGXMAdQwWxe3fH2ET6FA8gR/4F4T5F1Tlq3OUhZvKd49kabWlMGvYLoU7yBtfo0MShiAOzZ8WqiHxoZYJHX9IwxzTGInrkkk5h91ghT05y5MtAF/V917/zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sV6rbGltFVfXg4Q1Nj7QH0Aw8ZLbiB98H6MwDbTJZ/Q=;
 b=Ib3lfyinAD0UC5j646OMdDKoDsvqKnsMTkOJlwCPmfA+HZ3M/Dceb/66opd+eenikneUo+PQOfQPeRcVG2NQW4DC08illbpQi94F8jbdAVjiHcJWvlaWTxugvcZ5LxSGTSF+0Y/RJ8Qf85guZJaxYABx9kzaSEjIyBwsP2vHB+C0OkveFIUpTfyiagJEYxN5IuaCT5VUb+VWyXALzMi1E16A6ZtP08Eh8KWaE8Mxws4epFDbn7f28IaeVUmSmbS4XdmoFL2J52MKtSV0x6uT2bnpWk9ACyOpSq353itg21PVAUQaVNd2cp6Ck7pTdDqTAjvG7DjTbf3+C2Cc8PyqKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sV6rbGltFVfXg4Q1Nj7QH0Aw8ZLbiB98H6MwDbTJZ/Q=;
 b=LpxxqavOyy7iKDmeiND3Uaa6IP7lt7dMKPKcTp1YS6meI1kbxEI2wW+LTTSw8iKGJ/9J6rVV84IlK1wPpFFDuZAB36Y9CYsj1H2zMtFAokCYn47BhBeOO6cyrIn0agklh47XLk4/7gLhZkNv3H44fOwaWM/epnqsk8Ee2eGhut4=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by VI2PR04MB10092.eurprd04.prod.outlook.com (2603:10a6:800:22f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 14:27:42 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 14:27:32 +0000
From: Josua Mayer <josua@solid-run.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Carlos Song <carlos.song@nxp.com>
CC: Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady
	<yazan.shhady@solid-run.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 05/10] arm64: dts: lx2160a: add sda gpio references for
 i2c bus recovery
Thread-Topic: [PATCH v4 05/10] arm64: dts: lx2160a: add sda gpio references
 for i2c bus recovery
Thread-Index: AQHcsvSRLBplV/Qtv0qKch8QSpxfWLWshTSA
Date: Fri, 13 Mar 2026 14:27:32 +0000
Message-ID: <2ad26622-5186-4c99-8a30-f6b72d54178d@solid-run.com>
References: <20260313-lx2160-sd-cd-v4-0-aabcf230fbff@solid-run.com>
 <20260313-lx2160-sd-cd-v4-5-aabcf230fbff@solid-run.com>
In-Reply-To: <20260313-lx2160-sd-cd-v4-5-aabcf230fbff@solid-run.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic: PAXPR04MB8749:EE_|VI2PR04MB10092:EE_|AM3PEPF0000A795:EE_|DBBPR04MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d325ad-5ed5-48cc-46b0-08de810cb8c9
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: fhAJ3G/z72QzeFxUrhqA/PZxmHV2lXzDj9OHQCMz1nqjWQAXfupVimkYjycs1YC5KaRNxoMBtxGOQBH5O2rpmOaeyuLuVpB37T2aMYy2Nm8oC1lRK4zcF61+R81ZZeoBS4iBlSgBxWFxBXWZbQT0gRV+OUvtQ0ywx4Ht+uyUmuUYy/Hvs+YwxbTAdSSQTWsItrg4x7SppIme2gA6W7iNDfsGOkBvvyAXdr0JDVxSj6E52TjwsoqGmVh9/IxdXlBzegP09txPRXdlR0Pmhas08nHsfp4yFoC4u1vJJgHTaVUH6dzUorJrtOGqPNe9zvkP9E4/jeKFUuSEN5wO+zXL+cLsom13QQSaFao0NOQA6x9j81VtH3IU08iMgoQDmbOuDEdZHuFr821OhTRNI8XxV1iUDM3QVrYcSbn+64clw9xZzq0HA1Aj9WuasR8hyQRCnRdWJ9EuHCsEyl5FT6fmJii5voznYhfD1gsicty0yc8sMcnG6c/aN12gKd4TF+IpGfmJvezQ8G+E2bPq3ZCitaFYoFb4wuAhXHjV3Dk8nG2YHrOoet9T6yDC2/RTP+Uix0JoBXIT1xkP71dqQ3ZqEOIaOsfkWnrmUzvBsIIWSz/nNNahfYCC+Ek9PnO7WNq+uwy81oGLYcZn/MmnkwFQ57O8k+LRn14DBxXXqW+BieH/mrUppjpa/m52/F49NNhfxFOeK9O0wjYAOVI0e3fFq9XqAZxS6JDWRK3BapMmcT0LtPP0oQC8shjS1W1ukMtUJuIJ9sOY18+HPlGyy3DrZdCol3TH0RgFUmvUE1Rampg=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F45D2C14E5E80478DD92E950C1D00B6@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: cXhx9ODm13RPjMeBbohS2KMC4WZW12WpabB36iyP50gciSusRqmpiIgp45hoYtZ41S6I1irWVtpIF66JCwlz+3kf4G5tZuX2DgWd+UjfX5vXK2STpebahL0QrZeOgNqnUWlbOuRJdMQpNGrsOVOBqBFtMQXELYIi6YJU/Ms5fF8wCmBysXvazNzrwtYvJh4caV6nGwj1geAcCCHocI8HdnXbC5de1SLlZ0qsyoJn0P6F1EwQ30JBdvaVOjMYltYPxo3gkY/c2hSss/AGQ4sFiViB3jz3u9JjvaSFH+Eo8+MDpLAHvYtLPTLbwr9w7gqUhfzdm9LFzkW46pRjHGi4vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10092
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: ad8aa972a37a41098fbf2750fc8a067e:solidrun,office365_emails,sent,inline:e406a2a40cf0329e85a1817db30ac88a
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4efa1a46-4ca4-44bf-801b-08de810ca9de
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|35042699022|1800799024|376014|82310400026|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: nsnP5MRJaQuvxJYviLKaDULMiPWNImj+dxOmHLxhEyJ4ZKHLdoatMh2vzdo2CTd0YERcbXIXzp8fCsv2pwAj90HAw3c0Rrta31ISmm20c6Nusn8L5bhugnEqBy19aod4GHxKqcG6iyrzpMvH3xludf0FQDTNvXSk6qA5CnsyYwnMnVRhFkNDqIrADZSEhy/sx4d9SvzPK80dRLzbCmvsA+e8bGp09GhYUd+r3Ytc+PLoIcjqio0RifCsKkMl8Y/4bySEsejSGkD8MIFYjmEetb07ftymazpEIVozuyuShys02iGuKoPdZinILMUxhm/XnNJwBAIHggRtR0grAMuZocSEXr/tkE95OuWLyrpWy7IaVjC3jCxYkftsMvtmZE6GS/iFRkgLkjDirfBOpMausXbhjJKNj0qTsys94OXPR4E8mvQUBNgLC+b/HGbanBvcyxHTOnjfuTHLLw/Nsq+pH6kuTxeMwPcN7JYPtDVYo4M86NwKeBi4sc4juL1QECrlxdoN2PE74MLxXqo8JSaydL/Kv2FULt3J/PzucMceUUyu+a2u1r8Q/Z48dKzLK7aSG4qyBtlzgURYfuCN0XACAcXZn7Pt/UEXOYE/4fk/ShlY5mtA2hLEi0cp2GqjV2OyRC9KR5VVzh8RqeEcc/9eMvrRxQbXOvo6uQ3Ebw6XnhnxYDSO1irIh6gTKA+80x6PYQx5GuZErZiySN179RS6zjsK2ph0Kndg8VsneTiyJl82xxq2u19767KT7lFAXh8F2KTS7Mrg9cFFcq99QXHvhw==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 08Mao88rEQcqgJmI7xpBzNqvF1W1Umsnt7ooNlN9z+K05SazPll6rCK6sOsZp60twqb9AEs8ActqYCzLdSjBcLF45Y5JWClFv9t1Lidj0w9mXvDhQ7RmMnGdPvn22EnhTeVoLItwyMHw3xblDyMpOYm0C++vZh2in5/ol2zt/CZpOWh+VCt11SPLfl7g8xLt8rGzA3VMh0ZxPvTRWHmSDAMoDdsmpe9UQtO71w/jNBbM1iMMtG1/6hjT4p0yhfox1KuARS2AG0rOLO2UTlePU8zQoExBHiWmOin3bS1zzfQvLolHmNOlRelTzwwb0zikxdzr34MktrC7yQa/o5U3zE748+qHw3gO2+3rYGjomcWroxfWD3cd0pHMC63zEwIUkK4tiHV3Dst7nNtSsxzsLqXLJjaUJEwhCfeEToCVqfLlMYbqczqEUYOtm+wdhGnN
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 14:27:57.2178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d325ad-5ed5-48cc-46b0-08de810cb8c9
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7900
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_072801_756909_C34DA8C8 
X-CRM114-Status: GOOD (  13.88  )
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

QW0gMTMuMDMuMjYgdW0gMTU6MjAgc2NocmllYiBKb3N1YSBNYXllcjoNCj4gTFgyMTYwQSBwaW5t
dXggaXMgZG9uZSBpbiBncm91cHMgYnkgdmFyaW91cyBsZW5ndGggYml0ZmllbGRzIHdpdGhpbg0K
PiBjb25maWd1cmF0aW9uIHJlZ2lzdGVycy4NCj4NCj4gSW4gcGFydGljdWxhciBpMmMgc2RhL3Nj
bCBwaW5zIGFyZSBhbHdheXMgY29uZmlndXJlZCB0b2dldGhlci4gVGhlcmVmb3JlDQo+IGJ1cyBy
ZWNvdmVyeSBtYXkgY29udHJvbCBib3RoIHNkYSBhbmQgc2NsLg0KPg0KPiBXaGVuIHBpbm11eCBu
b2RlcyBhbmQgYnVzIHJlY292ZXJ5IHdhcyBlbmFibGVkIG9yaWdpbmFsbHkgZm9yIExYMjE2MCwN
Cj4gb25seSB0aGUgc2NsLWdwaW9zIHdlcmUgYWRkZWQgdG8gdGhlIGkyYyBjb250cm9sbGVyIG5v
ZGVzLg0KPg0KPiBBZGQgcmVmZXJlbmNlcyB0byBzZGEtZ3Bpb3MgZm9yIGVhY2ggaTJjIGNvbnRy
b2xsZXIuDQo+DQo+IEZpeGVzOiA4YTEzNjVjN2JiYzEgKCJhcm02NDogZHRzOiBseDIxNjBhOiBh
ZGQgcGlubXV4IGFuZCBpMmMgZ3BpbyB0byBzdXBwb3J0IGJ1cyByZWNvdmVyeSIpDQo+IFNpZ25l
ZC1vZmYtYnk6IEpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPg0KPiAtLS0NCj4gIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIxNjBhLmR0c2kgfCA4ICsrKysrKysr
DQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTYwYS5kdHNpIGIvYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEuZHRzaQ0KPiBpbmRleCAyODUwMGU4ODcz
OTA5Li5hN2ZjZmI3MzM5ZjFkIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9mc2wtbHgyMTYwYS5kdHNpDQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJl
ZXNjYWxlL2ZzbC1seDIxNjBhLmR0c2kNCj4gQEAgLTc1Myw2ICs3NTMsNyBAQCBpMmMwOiBpMmNA
MjAwMDAwMCB7DQo+ICAJCQlwaW5jdHJsLTAgPSA8JmkyYzBfcGlucz47DQo+ICAJCQlwaW5jdHJs
LTEgPSA8JmdwaW8wXzNfMl9waW5zPjsNCj4gIAkJCXNjbC1ncGlvcyA9IDwmZ3BpbzAgMyAoR1BJ
T19BQ1RJVkVfSElHSCB8IEdQSU9fT1BFTl9EUkFJTik+Ow0KPiArCQkJc2RhLWdwaW9zID0gPCZn
cGlvMCAyIChHUElPX0FDVElWRV9ISUdIIHwgR1BJT19PUEVOX0RSQUlOKT47DQo+ICAJCQlzdGF0
dXMgPSAiZGlzYWJsZWQiOw0KPiAgCQl9Ow0KPiAgDQo+IEBAIC03NjksNiArNzcwLDcgQEAgaTJj
MTogaTJjQDIwMTAwMDAgew0KPiAgCQkJcGluY3RybC0wID0gPCZpMmMxX3BpbnM+Ow0KPiAgCQkJ
cGluY3RybC0xID0gPCZncGlvMF8zMV8zMF9waW5zPjsNCj4gIAkJCXNjbC1ncGlvcyA9IDwmZ3Bp
bzAgMzEgKEdQSU9fQUNUSVZFX0hJR0ggfCBHUElPX09QRU5fRFJBSU4pPjsNCj4gKwkJCXNkYS1n
cGlvcyA9IDwmZ3BpbzAgMzAgKEdQSU9fQUNUSVZFX0hJR0ggfCBHUElPX09QRU5fRFJBSU4pPjsN
Cj4gIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ICAJCX07DQo+ICANCj4gQEAgLTc4NSw2ICs3
ODcsNyBAQCBpMmMyOiBpMmNAMjAyMDAwMCB7DQo+ICAJCQlwaW5jdHJsLTAgPSA8JmkyYzJfcGlu
cz47DQo+ICAJCQlwaW5jdHJsLTEgPSA8JmdwaW8wXzI5XzI4X3BpbnM+Ow0KPiAgCQkJc2NsLWdw
aW9zID0gPCZncGlvMCAyOSAoR1BJT19BQ1RJVkVfSElHSCB8IEdQSU9fT1BFTl9EUkFJTik+Ow0K
PiArCQkJc2RhLWdwaW9zID0gPCZncGlvMCAyOCAoR1BJT19BQ1RJVkVfSElHSCB8IEdQSU9fT1BF
Tl9EUkFJTik+Ow0KPiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCj4gIAkJfTsNCj4gIA0KPiBA
QCAtODAxLDYgKzgwNCw3IEBAIGkyYzM6IGkyY0AyMDMwMDAwIHsNCj4gIAkJCXBpbmN0cmwtMCA9
IDwmaTJjM19waW5zPjsNCj4gIAkJCXBpbmN0cmwtMSA9IDwmZ3BpbzBfMjdfMjZfcGlucz47DQo+
ICAJCQlzY2wtZ3Bpb3MgPSA8JmdwaW8wIDI3IChHUElPX0FDVElWRV9ISUdIIHwgR1BJT19PUEVO
X0RSQUlOKT47DQo+ICsJCQlzZGEtZ3Bpb3MgPSA8JmdwaW8wIDI2IChHUElPX0FDVElWRV9ISUdI
IHwgR1BJT19PUEVOX0RSQUlOKT47DQo+ICAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiAgCQl9
Ow0KPiAgDQo+IEBAIC04MTcsNiArODIxLDcgQEAgaTJjNDogaTJjQDIwNDAwMDAgew0KPiAgCQkJ
cGluY3RybC0wID0gPCZpMmM0X3BpbnM+Ow0KPiAgCQkJcGluY3RybC0xID0gPCZncGlvMF8yNV8y
NF9waW5zPjsNCj4gIAkJCXNjbC1ncGlvcyA9IDwmZ3BpbzAgMjUgKEdQSU9fQUNUSVZFX0hJR0gg
fCBHUElPX09QRU5fRFJBSU4pPjsNCj4gKwkJCXNkYS1ncGlvcyA9IDwmZ3BpbzAgMjQgKEdQSU9f
QUNUSVZFX0hJR0ggfCBHUElPX09QRU5fRFJBSU4pPjsNCj4gIAkJCXN0YXR1cyA9ICJkaXNhYmxl
ZCI7DQo+ICAJCX07DQo+ICANCj4gQEAgLTgzMyw2ICs4MzgsNyBAQCBpMmM1OiBpMmNAMjA1MDAw
MCB7DQo+ICAJCQlwaW5jdHJsLTAgPSA8JmkyYzVfcGlucz47DQo+ICAJCQlwaW5jdHJsLTEgPSA8
JmdwaW8wXzIzXzIyX3BpbnM+Ow0KPiAgCQkJc2NsLWdwaW9zID0gPCZncGlvMCAyMyAoR1BJT19B
Q1RJVkVfSElHSCB8IEdQSU9fT1BFTl9EUkFJTik+Ow0KPiArCQkJc2RhLWdwaW9zID0gPCZncGlv
MCAyMiAoR1BJT19BQ1RJVkVfSElHSCB8IEdQSU9fT1BFTl9EUkFJTik+Ow0KPiAgCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsNCj4gIAkJfTsNCj4gIA0KPiBAQCAtODQ5LDYgKzg1NSw3IEBAIGkyYzY6
IGkyY0AyMDYwMDAwIHsNCj4gIAkJCXBpbmN0cmwtMCA9IDwmaTJjNl9pMmM3X3BpbnM+Ow0KPiAg
CQkJcGluY3RybC0xID0gPCZncGlvMV8xOF8xNV9waW5zPjsNCj4gIAkJCXNjbC1ncGlvcyA9IDwm
Z3BpbzEgMTYgKEdQSU9fQUNUSVZFX0hJR0ggfCBHUElPX09QRU5fRFJBSU4pPjsNCj4gKwkJCXNk
YS1ncGlvcyA9IDwmZ3BpbzEgMTUgKEdQSU9fQUNUSVZFX0hJR0ggfCBHUElPX09QRU5fRFJBSU4p
PjsNCj4gIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ICAJCX07DQo+ICANCj4gQEAgLTg2NSw2
ICs4NzIsNyBAQCBpMmM3OiBpMmNAMjA3MDAwMCB7DQo+ICAJCQlwaW5jdHJsLTAgPSA8JmkyYzZf
aTJjN19waW5zPjsNCj4gIAkJCXBpbmN0cmwtMSA9IDwmZ3BpbzFfMThfMTVfcGlucz47DQo+ICAJ
CQlzY2wtZ3Bpb3MgPSA8JmdwaW8xIDE4IChHUElPX0FDVElWRV9ISUdIIHwgR1BJT19PUEVOX0RS
QUlOKT47DQo+ICsJCQlzZGEtZ3Bpb3MgPSA8JmdwaW8wIDE3IChHUElPX0FDVElWRV9ISUdIIHwg
R1BJT19PUEVOX0RSQUlOKT47DQpTaG91bGQgYmUgJmdwaW8xLCBxdWV1ZWQgZm9yIHY1IC4uLi4N
Cj4gIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ICAJCX07DQo+ICANCj4=

