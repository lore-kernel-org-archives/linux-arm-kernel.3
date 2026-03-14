Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964EA10706CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 12:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7Y9t++NNOJq3agD5vjYxbV76eAP4kQBlUcc26o3ps0=; b=h7V5hn+Y1F2w/54zgHkZ3lAHl4
	E8g0DSapqyeQYHGpO/luQp2FUymgIBN7YYHefjy85tO4a/NRcFFUIolNdbzNZJB4WAIA6iMGXS89Z
	KWPJhS1Qd2BesZvHVPXHqiBr9gHRtuTfZ64bxRsJ9z8Z7sJEUTUWxtniUFx4EB/oGlkrnn+TA6Cnq
	IsxCRoXVT87XR8DGqmbZ1lINYA/flJKhLuapTdv8zy5H/3sL0gt4m/gK+vmWKLJNj9mVIH+Hx0tsW
	CLMSk5goBBl4XjxOH0VObldWDYwsC/ls7M1Jbs5s6CpZTsuWpzwT0aC/HUDKHZ6vNLPBaVtoayKjp
	c6rcrHsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Nke-00000001o2S-3y6C;
	Sat, 14 Mar 2026 12:05:52 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1NkV-00000001nrR-2AU9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 12:05:46 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RXtwaM93YzttKW1+beFaFJbZa90ImY/pz53cbPnrQlak0ANQXuqQIBrSU1y9cxx8TK9vkEG6/2HERBnR57lxqHWfWxGL/AGwxkBJSHYB5eRxP/lSUgTsE+UpvUjXAup4AXIbALisBlbcVUzv323HNF7sNt/wMbrnYhv2/nUWJvIDxf4tgpugS/ueRVvhyaks10IWIcPzchABMXphOmM4gNneTNYG4VySOxpAA3iAKdKxGZlPdZR/is0u49GIuWmTN/m5KmxjayGSogOkQN9GeX9qNsDmZaC1txjbUd68OTHCXqh45zsJZruLjtYUcSduz2HPDe47V4flPUjmvVGvTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7Y9t++NNOJq3agD5vjYxbV76eAP4kQBlUcc26o3ps0=;
 b=nQ3ff9xaBqLvCHBfeUaPjvWKUpQCfXgZNUxZa2KybqqEz9IWioSjxtevGJohuZTqK364/09/zFOIJPeNRUQ8Wj1v5DWKVsuihKWQaGhB99dap/G51lDCbbCt4dw0KIoMGUbx7MWPiD184oaegvSkWY3xl9duVNlrxVjtZkTdIFHlH+dMqLzj0nimH19FCNAPC46/pIZ92bGVKavZ0m86wZ8NjkWCWIzfUZasO+5X3mAzecfcLt9sjJRmK+hIvagqW7+sya44V2FsHmsUOK1wYBYmuwSS1V5z/RkH+FM0FRhqQF5K3v3fbHAYX8DP+DHVsGUtzoDF9OcLKTJ2ktpDZQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7Y9t++NNOJq3agD5vjYxbV76eAP4kQBlUcc26o3ps0=;
 b=XTYZ4P2iNLdQ93A1X8jbaS1UI87ynWAAmAk6FNgCBnF/dhkQZz8AZjyCmx+D0czfhwS1hiATT3ywfXYAZLW3IDCjfBv47E7ItJFGEKAUuoJYTeMyPCiQWWqnZ3jduZmr18D9g7yAdUP2S/OSFoL/FQe9HUUIeC9j31CEKQGEMa0=
Received: from AM0PR10CA0021.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::31)
 by AM9PR04MB7651.eurprd04.prod.outlook.com (2603:10a6:20b:280::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Sat, 14 Mar
 2026 12:05:28 +0000
Received: from AMS0EPF000001AD.eurprd05.prod.outlook.com
 (2603:10a6:208:17c:cafe::2) by AM0PR10CA0021.outlook.office365.com
 (2603:10a6:208:17c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17 via Frontend Transport; Sat,
 14 Mar 2026 12:05:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001AD.mail.protection.outlook.com (10.167.16.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Sat, 14 Mar 2026 12:05:37 +0000
Received: from emails-3033242-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-17.eu-west-1.compute.internal [10.20.6.17])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 7CB4A802C2;
	Sat, 14 Mar 2026 12:05:37 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sat Mar 14 12:05:32 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4gSox9RwRPf/s66JEV5dmLKLh9XOfeqr9Z5ln8mY9P0/VpMD9at4kSsgV8cB+HxOs9nMb/6wScwcwCx4E+G/QwVBF4aUPSmPi1oUcfajypNvviuEkmoX9zLoD+d0bk3zBnwCXBzgyJXJdHQI+KwvnWU3hkUCmQAS2XGkOxWgZC8G8HmSZK1JWNfQkmZMAT9AAt/GkeyR6skKbp8sDvaVY6n5dAYehFJILqfYxlG5ivPkp0BEodln1SyO5/soL0CEVd9B9BK+HWBEYmwaePP7Whl51NS4trkw+UQqm35R5b80MWny15XX9LAZuoqDikGahvukKRwh+EwzH9GjejQxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7Y9t++NNOJq3agD5vjYxbV76eAP4kQBlUcc26o3ps0=;
 b=EINVlZu3PWQvZZ9VZgoQz23Pyv8wHzBr1yJSA5P3vSrTImW5JvokQ4Bv+ryYww272iAb1+xPN6to0o1nG0ZCJrzAMvEkAw2jjjltHO1zn3jsENFzOWc1i7lhYk/QvRTa3srGKJyj91xRf2foOjSI5N6h1GvYfDq0KbEWFFp6Ezilv18oFkMsCelkn3q9fWoBU6fjmnffrVgwpIGlqdyDd1mNE8GX03pH34kzdCTWiCEgC0U+FF3xNdEdkM0/Djt5ex+vB9TTwsuFk9n4GmPMRHIq6SbjlWGrz1SO7V9Lz3Lb4R/iupfMKmceehzhyT/WB8SiuLeu1ghrQFT29DHe+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7Y9t++NNOJq3agD5vjYxbV76eAP4kQBlUcc26o3ps0=;
 b=XTYZ4P2iNLdQ93A1X8jbaS1UI87ynWAAmAk6FNgCBnF/dhkQZz8AZjyCmx+D0czfhwS1hiATT3ywfXYAZLW3IDCjfBv47E7ItJFGEKAUuoJYTeMyPCiQWWqnZ3jduZmr18D9g7yAdUP2S/OSFoL/FQe9HUUIeC9j31CEKQGEMa0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM7PR04MB6805.eurprd04.prod.outlook.com (2603:10a6:20b:dc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Sat, 14 Mar
 2026 12:05:05 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.015; Sat, 14 Mar 2026
 12:05:05 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sat, 14 Mar 2026 13:05:18 +0100
Subject: [PATCH v5 08/10] arm64: dts: lx2160a-cex7: add rtc alias
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-lx2160-sd-cd-v5-8-83de721585e3@solid-run.com>
References: <20260314-lx2160-sd-cd-v5-0-83de721585e3@solid-run.com>
In-Reply-To: <20260314-lx2160-sd-cd-v5-0-83de721585e3@solid-run.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Carlos Song <carlos.song@nxp.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 Rabeeh Khoury <rabeeh@solid-run.com>, Frank Li <frank.li@nxp.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::19) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM7PR04MB6805:EE_|AMS0EPF000001AD:EE_|AM9PR04MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: e4b4820a-0cad-4378-6139-08de81c20143
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original: /wLBlDKKN3wcYv0uPVrpKx2o4X5203aIAZkZQcSk4jHIYbLboWUOQ8ebnOycb3hD7DIN2FckrrH0UY5JEqEhouTf6rYApGbN1q4UHoEAm8+b7ISxoRx2NOK+nnA7Uxb6+GGvdejrPGCj81/CcNuriK6h/Zq0EyXNsoSEsMUpzsKmWgckhetkWwqTnGJqJKXxNkNKjHTP3XiKZISWJj4wFsReNxS1DymUXT9KwYTnWtgUVR4ZbW4+36HrvvvunmTZaD0IptYp+DoqDpJH1NUGaR6GZ4+t8OfHljkATRi+BNB82P8xboal66gsCSgus1GcsL8xbjF51HcJt9kEIoIpU/+dLaaTL3hIlAU3WRhmw8Nfy/HlgOz6JZWfvT0LQJSE4WBTLXUhNgCMcw1S+GmZbXhZey0DGHW4jpf4iNwjmo/q7go1ZQ3RrhtwbtkrBnYzkcvUEl86nEcxnzHPoKkF+YQ0CrdrFTqHIRVt8pwazgWne+NttyRcNAC2WpQXeMSdLO1G45Zy8uIRUI3znecHgr1EIuhqrJLPMoxGZnz6c5gifj4OUfYGFplIXbCiMpo+p8ZHi8qZlbnhx9Rask2BxYsHpJkk3VuDiBVtNUN0vz5wEwi1fAPhD7EOHLfUBGsXtTATkkvPF1BF1fJ/JklYGafokBGnv6TLywBn8UCJ0U2jSlWLb1+g2lfmpF1ZD6fMtgSP1u+0d+JpqRCah/xyVFs00sSy3cmvHYbqj22kVKpy0NJ6s7Sb4ap1wZ7BDOFEZgbvRIDMIUzj5/GlZbTKfT5s3yERswwJ83ngpMI5jVI=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: Qu04MQ3mYysVlxD9mZDD31QU9FlyBILvoZWDflWf0Nd6MXLzZqG0bL+mxIGeraX2qyRkJkMMRycS3rE3v/5eUbjSlgtnNEhkIbtMS/XyR3jkSj3RJQycMVifSBXD+/WPVuYf8uUQzgZPmonqC7GXHQVV/5XdXdpGTq7O2U6xi+P/MEa0yYDCe4iHO1RUAnEZaoywr5J5StFoO8w/zG8Ts5E0tWfKdK9rOUb3dF91CMdC8iW+CFDm6v9IRmKmj+vnYX8Jo2bdNHX3RyE1ipUz2ii9vjgwQHaIjvWXWP99p1FeBbwTOI/0SsY/4Ndm/AuOReJXkuH2gXxchtLp0pE78g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6805
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: fc48fda2bd8445e1a548e6fa8dd330e8:solidrun,office365_emails,sent,inline:e8a71b8ecf121745cfe4398c998083a7
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3420ac90-3e90-42dd-2bd9-08de81c1edb1
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|14060799003|36860700016|82310400026|376014|35042699022|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: x0nPi7U9ZqwQlL2f1nQucQDTP1rWhDYm3LLrENq9c33hIDp+YzI3L6KuAdRwF1vE1L9GikAJn9f9hUZgPvgKIGIBGAUlKp/p4ys+VPifny4oFnc34SbzDIU6/+Mhx9qdpMh1VoaRZTJVUa+1PjmgJUXlfEGJW0YJT1z1mWozTOX8i5NR8pFRA3tyt7/BpVNAAN9p6BmuT8rVnat6xIY0I4u/2kYx3B2MHNYDkE0MoIKtzJVyhX5w74KTNjCbjSXPLoxtWQka7sgk7c4ZfiulxV7Pu4/LSv1ukudGdUa0Rb3bpGtxgAl2eppsGZlcmIuggjwrbhzZ/x8dHdwQsKYgG4+KOlL5xW4aOJykH3o2LCPEBUD9JMnWkqdceffZMm+bMTn7L8BKwtEjrTg1cOD0ERuy4YDOiUgRRzFsQxVSBM80LZXC4TneoaZls6IGVcjqSv1F8gpFgfji4gtdbfQU1vbGuT2JSiWOV/VOccEmd8EQs9D/hXs11ZQMCX7lms3Wd5B2wW5hmtpqJev5uTk6cylv+YUqx9DxmVAjqkTdVKjzUOQnMNbhlv86VVvvpvbAh+hVI4rJSSe6EUB4mhCyRUU0pYXgDxtO76pFyiNSyXAAJG39Z/JaQnH/EX5Ib1TFBw1vd4jMOUiIUTR4bTQads84qvlMWuaLqhvCwY4EdRsc3i3cpGpGkmScosyvLNdewD3/8uWOf9ErNmWjmPxsPx7l005fKATVksqkM9mNmTTooIKDf7YuDgWDGVL4wRdQKzCLgbQqBqebEj8+9OWvYw==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700016)(82310400026)(376014)(35042699022)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: W6evysmx6pPFo2vSUauhGTXH16YTV7ciOtzm4QHG9dC4J2RugjeqMzxTZ6p3X545ArPufXzS3S+n9Td/yzfYGb+xXcJY3q5GI7wZLpuqloBsRrnYv2nzGIaSKF71wJa07WEQBHXFOL3GWRBSuQuqKWltyVRNZpCQHWdhNP1Kz3dqYrOShdAZol4uG+/dqAsZHR8AOc+ItZ9GA5tqGSm/zfScvDMJrsu6JTlK4e63xa5VSuzb7D4NCib4gMl6jSDaWYWRwAZ3ogD62wKsDT1/KngjsnjsHl7kgCvY4xyw76ADwGURzuAxlyViNUZIYVtmfab/Bslz+sWk6URbO8DHqmyVq8ySVM1gurC/zouP6N3HalYIRxP138UDswaCmEVdSXMxZm1omqzIrrYlvfYAM6gEZZWJANV/ycF/ftp2Falq7FPigMPkY+CAywfbgQb0
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:05:37.7024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b4820a-0cad-4378-6139-08de81c20143
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7651
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_050543_569539_81A61CB6 
X-CRM114-Status: UNSURE (   8.83  )
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

Add alias for rtc0 ensuring that on-COM RTC is assigned first index.

Note that fsl-lx2160a.dtsi already defines an alias for rtc1 which
implicitly achieved the same result.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
index 7f6e39e27ce5c..90956ffb8ea9a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
@@ -14,6 +14,7 @@ / {
 
 	aliases {
 		crypto = &crypto;
+		rtc0 = &com_rtc;
 	};
 
 	sb_3v3: regulator-sb3v3 {
@@ -154,7 +155,7 @@ &i2c2 {
 &i2c4 {
 	status = "okay";
 
-	rtc@51 {
+	com_rtc: rtc@51 {
 		compatible = "nxp,pcf2129";
 		reg = <0x51>;
 		interrupts-extended = <&gpio2 8 IRQ_TYPE_LEVEL_LOW>;

-- 
2.51.0


