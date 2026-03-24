Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6471AD58CC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9x4gd21zwJhTxuplowVO7XSAtzwxo/ttbSogkT3hYcU=; b=OD/VPXWI9xyTu+tjwe0UFJmPqO
	FeZQCgsmVfxEUSMJbRnvb2f0mcx+dW0JYYckUqsK7s1z+EVOqIqrfjBMF0GmptSjC7/ATs6I/bbma
	A2sXj4qbrfRLiQL+Cu7wMZWN5UBq1D0H9Olj0Ugi1C1MJh+wWtvrNW2V1EqqATt843VVoOyUHsEeC
	ThZSIiYabYFgxrBezrhbvjUZmZaa1T4v5PaMM0KbXhhAP5/PGkM1FqsQL4dXAGktbiKV0KS4guo9n
	eQp83LpPKypIlyjCahK8g2m6RZEPjkA5WtOtWXovz+FzID8emNXewCtqhhA+/CkTGD+nx0TDvvLiq
	oHxhXfGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w515H-00000001PE1-1r2y;
	Tue, 24 Mar 2026 12:42:11 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w514r-00000001OvY-3rbo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:41:47 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rotl+Eaa9po5OzLsggPoVRuGsHuqtnw1FV5FrohyesW2hjyYpvvXz+A5JnUcCMTaEk4jpgqlmjOezeZ9kCkKd5K3JZQvvIWEMMixirADfdN19KAkQzJ8UsUg6cgNCxTwnGKWzsP7pRnXjiVsAT/KiyzKHqLau+8Xo1K8zmA7DIXHoFs5fifyV8nQMFkyXwBuINQC/tJXVIc1r+66l9Bj7Bx9IUoq8Mau4MFc28K9V4CH7Pfs7Ghlc5uGif2UNY3g+Ct52+nqvzP3tuXuN1Hdko3EnC3gxLqwV+izv947MHnQ846ZkSEhI3/n7MnbJWANE20M6kiBnm70RKbGH/bVhw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9x4gd21zwJhTxuplowVO7XSAtzwxo/ttbSogkT3hYcU=;
 b=fYNswUavD0zbgc8GdADF3DenUV7FbO13rNSf4g7t789VRt+t8+1GfL46q/Z38khk7fT21mlpjLHhDTuxdIbd2N5b6kHWrCjTqr3Yff8kcjeFvjKYXh6EL8U/m2Oozf9RdEfo5fxCgmRj7OqqrNI3SP/cdV1tGdByvDhtykf65prm5EHyhcjw7l0I9RwVuD/3yHi1YNnzFvMxoS+bWwrkZMEuHz6lgkQC92fvni7cQUsSYo26QG9hCrTvse4jeg4Dr22nBZXuubipZmMnPMYaM/ykEMKolNo9Z9jnYdWsTyntxDWCYTxMYzlrEW3JWMuCW5/xodXrrC1UF/m95VRWwg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9x4gd21zwJhTxuplowVO7XSAtzwxo/ttbSogkT3hYcU=;
 b=WYWazd5xbZl4YpzHI6ybURvoJnkPkbNrzKuL1/03GcHUpMDZau+W97Abu7o8bxpJx+OXvd7pQmGtCbiWPDrjtM2iedx+MdsPndJkM9RoMv44vhsysG4OLyOowEqLa123X3Vf4DYd/R/4KAdXqNyn3pQ0fTPxdF2qcw1hIq5B9oA=
Received: from AS4P191CA0047.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::22)
 by AS5PR04MB11419.eurprd04.prod.outlook.com (2603:10a6:20b:6c4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:41:11 +0000
Received: from AMS1EPF0000004A.eurprd04.prod.outlook.com
 (2603:10a6:20b:657:cafe::ab) by AS4P191CA0047.outlook.office365.com
 (2603:10a6:20b:657::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 12:41:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF0000004A.mail.protection.outlook.com (10.167.16.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Tue, 24 Mar 2026 12:41:39 +0000
Received: from emails-315152-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-76.eu-west-1.compute.internal [10.20.5.76])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 299AD8073A;
	Tue, 24 Mar 2026 12:41:39 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue Mar 24 12:41:32 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3g4rWc+bwYv/ap+7ax2dAJkifeaU5PzcrJGSku9sxqraZL7Nd61tVYfNWx48359/5e8U3ddNOmIpp47woCKRZbQ0D5yLELmvt2SxDkQwcc9KFl/076PTEGASaI1FCue/SCEgyvyujJZFSgnvQCBetmrm8Rfw07E9e37uU5i8GTUBwJ4iiInFxnT2Iwev4ByEbCJPp+gInfFGgkmEnmFJA4FEy3L7hTK5c67f5V9M/MX3ZP6s4CO19CxEWGZU83brwIe6PlZIeXr71U2PcZblYX1QoE+eZC33mX91LyqFtAUgCjFNbKs5AudaMuq137UcBsFV4muircoyhQolv+WBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9x4gd21zwJhTxuplowVO7XSAtzwxo/ttbSogkT3hYcU=;
 b=PUJgC26eLMjxbax8arAehOtD0jSiK2lP4IdQwuigThIxnSSMoiq3eZtp8AGwc8DxxwnJBT26QgVUszEc8eE0sTK1mCV3sL4vN97289x8IDbKf8rtcIao0AbTtHUTa7Str7LdnCMAYbXHiq1Mtsuw+tX2vetn13//XtDQNOFi1gCnfQMZ1g4g1N4SMgjMhVtbL4UQ5DVpOT9WTuiuikhMh1rb09TjKBZP5VDyMg3aYOi0UKAJLBi5trWbu6AEFm4WEDD1D2GPwzSKglGhvNojEBCMaNURYXVzvbBZveAtrILvn5LEaaUfy2dor4Gq4ZnH/UHRPCQCCuB3p0vXz5ZWjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9x4gd21zwJhTxuplowVO7XSAtzwxo/ttbSogkT3hYcU=;
 b=WYWazd5xbZl4YpzHI6ybURvoJnkPkbNrzKuL1/03GcHUpMDZau+W97Abu7o8bxpJx+OXvd7pQmGtCbiWPDrjtM2iedx+MdsPndJkM9RoMv44vhsysG4OLyOowEqLa123X3Vf4DYd/R/4KAdXqNyn3pQ0fTPxdF2qcw1hIq5B9oA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DB9PR04MB9722.eurprd04.prod.outlook.com (2603:10a6:10:4c7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:41:24 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 12:41:08 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 24 Mar 2026 13:41:03 +0100
Subject: [PATCH v6 09/10] arm64: dts: lx2162a-sr-som: add crypto & rtc
 aliases, model
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-lx2160-sd-cd-v6-9-8bf207711848@solid-run.com>
References: <20260324-lx2160-sd-cd-v6-0-8bf207711848@solid-run.com>
In-Reply-To: <20260324-lx2160-sd-cd-v6-0-8bf207711848@solid-run.com>
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
X-ClientProxiedBy: FR4P281CA0400.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::20) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|DB9PR04MB9722:EE_|AMS1EPF0000004A:EE_|AS5PR04MB11419:EE_
X-MS-Office365-Filtering-Correlation-Id: 03a38057-dcee-4afd-9c93-08de89a2b1db
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: e1wcEITRzyF837QeoeSLTZxmCNDJNEgN3cXlXKOL5lKbtcn4JmWXo53zFCCojxTzuPB8Kx/I8vzVZiLm2FsJMjCMsjuRiIGF3kqoelA9dPaEL/AQCV4rMfX5jA0yT1hI6a7G2ldM9jJfuk+Au7nM1iffG60JpG/CJkQQo+RC862B0giZxgkQ4guu2hxsa/P6yAW8mlbhTrLKyiRXxWOg7K4it5xLcoKEBTxCONgd4bQ8hCeU398Nwuke4rN6RgpaTSWS1nq6Yi3F7PWgem+IKHhwkaqaP0teiNHCxei/YmSaxcauCNYURxAuZxViUaLIDM198hjKZaZPIuAyhXOYJEnWJY+1zBQe60GQ4EM2rMANdCs+nE+H5ihIkcOPVqhJK6KPTphb9E2+u7J4+brZxuHsOKNgboVK+7niDjNKWyTZuxPsynWajHT7pZLnN0FP9nEM9zqPkQuTLvjeIr62GhQhhEe0Fc+A8pdlBnYuXz+4U9GHCnRNn6GxDjCYnn2QtsoGdnOtkW94zG0V6ATtQLomRxFTimN6+Iukwbi0tlg+fI2k1Ko7jzaU00fWzbaaMGA+j0GXkqS8gIfmbi/rE10fCHtCd8QWVA/VWLUvDUWoBoVkAgZKqii+nRYlwi1jyX/VN/jKWvmgGES/ifi6OngjKtv5TGx5gc9MbkADSZieNxa4+0wbgTAfBdWC6ejNUE4CJBD0pDpOIvGjsZWjRsi+awC/gJYMt7W4IKjaqub1G7cudqG9cJ2Y8nhZzNqsG+Iz9h/2+/ntNotUTMsUhyVby8rnjotq6yB8zBZn+EE=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: To7pMTWzCMYrFehDR82EpqfydhuVtotW8cLJVDbIzFwKa1kkhGkKqkj7y/+Y65LRcQmFi7XQJ9y+PsoiSIFgPXRGXaJj5q6AUe2UCAHk2IgZDw6wFG/UY5dQ7vZocobaEGVy8nokfGHWvs6B1tAHxkODbZWMcOKBQAeLNMr+I9GPQyTWuMXkv7TcguHnCpJ0/RRNF5xqDsH3DYTikz2iO7a+I+JDOTMR1y/qCf7K/XFFYrhV9O9N4jyrA/d0k40aIQEgC+mbuEuH7Auz4jlynnrslWpRKordaCIHpo2CoZTPANxjxcbGzdMHO2wnPy3DVBmPY5VXFQc1J0kWm+XfeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9722
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 06e337abdf8942dc9afb83b13a0a98a0:solidrun,office365_emails,sent,inline:b9e026b2ce894d6ae84a8479915fad54
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c5a63d40-5186-4e51-4bef-08de89a29f5b
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|1800799024|82310400026|14060799003|376014|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: bNFYsHUQ75Usn8315uGGMMoQF8UHVb7qMyDZwZhG1yr3lnRwMDIPfn4d+A50k5vQuKGUmrgddMq985DP9IDBQdvFqDaM77pTVMhQY58bet2GRq56Rf+ebDO9PUTAQLIBeXZWNsr3t7hWZ0DZPJQf9aSWW9vcQX3456UMPQ6bpp/ys0ABNUrMnYNeEVTxE/TrqgRimevJQQReATwl3eAs/4AJq5im3exyBxCIsf7QIE9r7jd0Wmmv8lhyw5DrbvvkQ/qT/xmIxL0hHdoo366xlXNMEz5xkOqlnoCa2xKDaLgIkkY1MxEdGoW9zleoIPYPz7MyN183jjtVuA1OvJCL0PcmaAm0u4ypcZkkFxW2NpuUS8JnPWbSJxqYLGNLAQbye4ugn8PT+jY4qgIBg51tiOEqLhbu0OMBd0Oc0nXjz6NPGHCp2rrtpNKKSm1lqCsTqxSMc57GdHd4ekP6qxIkeloZ3n/aRFwJ1ftcbPR22qZN4T0y9kK1eOmY5+nqZNjuRAM0mQO93KZWb4wqKnq4bEC30GPHbj5BKj7vDyau6LyfUpGjO5+eyS8tdjZIcLqMItP/+GSMjd3xBX3KDA2m+tX3Scm8MyKpe2RtCMNCuyOB711sJ4wE++jl1KieZ19oicDNUUfECbOCPBrkcurr4KDL0MTG/SAko1oaiHiThk939fFMXXwtu3qiVqWoaDp+RP9qg09C4mQONH2dM6odSs36ZLbxt18uZoEsf8uy9AhrEzZ+07S3ouyYlkLxoOlbPBPmPFUPR6jbu/JL3W8PLQ==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(82310400026)(14060799003)(376014)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +Knwbs07thA6uQc1He1lF15EuPBTHLji0+ueZ4oZZK2fwBGeEV9s+T5BozdfWFuMm31HF7X/+nS4RocXuK8vLIzhGcg7ykfwpbRRiyZb7BwaiojwsaYl3WM6Tms84l7X+LhjcBtuOeQshhtYU0jtMCiaimrt7ulXRF6eUjVnjryR5na/gOYvHKKC1NGv4k/3rBhfhlLrUfnuQ6gbsj+tq3RCfyNd+DLPww/jVy62ogXjUx0n8heXGq/q9H7vALaQRwddPTeKUEK6wu3ZeMIOwRPf/1FGcuPK4rKnwRfMNqffKjCCrwIvqxHXQrzutFLUqUCxVL86MD0pw3Yz9vzJ1S6ZOre8DGwb8Fz6njn5MASmwnTbU9QTTU3a3qz0T0xZZB/3jaWiCdTq6tYiHEvuycDQPIq+knbwwI4kPg3+KxP4aWWVDkHVjIrACqhCY4HL
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:41:39.3823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a38057-dcee-4afd-9c93-08de89a2b1db
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_054145_998670_521D15C8 
X-CRM114-Status: GOOD (  10.38  )
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

Add aliases for crypto accelerator and rtc0 ensuring that on-SoM RTC and
the SoC A72 domain crypto accelerator are assigned first index.

Further set model and compatible strings which are informative but
overridden by actual boards.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2162a-sr-som.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-sr-som.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2162a-sr-som.dtsi
index e1344942eaaee..3ad908d52a18b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-sr-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-sr-som.dtsi
@@ -5,6 +5,16 @@
 // Copyright 2021 Rabeeh Khoury <rabeeh@solid-run.com>
 // Copyright 2023 Josua Mayer <josua@solid-run.com>
 
+/ {
+	model = "SolidRun LX2162A System on Module";
+	compatible = "solidrun,lx2162a-som", "fsl,lx2160a";
+
+	aliases {
+		crypto = &crypto;
+		rtc0 = &som_rtc;
+	};
+};
+
 &crypto {
 	status = "okay";
 };
@@ -77,7 +87,7 @@ variable_eeprom: eeprom@54 {
 &i2c5 {
 	status = "okay";
 
-	rtc@6f {
+	som_rtc: rtc@6f {
 		compatible = "microchip,mcp7940x";
 		reg = <0x6f>;
 	};

-- 
2.51.0


