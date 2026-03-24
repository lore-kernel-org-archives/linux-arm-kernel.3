Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9E4F483CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7Y9t++NNOJq3agD5vjYxbV76eAP4kQBlUcc26o3ps0=; b=ZgqQjxo7LwqiKJUe/jUEs7lI89
	9Jo/IDeSu8XsBQYpHZ5mzTEfi+OY3RiObaYxazazlhl55ecTrCR7ogGB6wkvaGRDTUuE3GEMHAWvB
	ETpaS34mef67akl6Zwo6q/j/YBbrljkhGYaliAKuAuj4DLnstWRLrP1ID1P2lAsZZIUXE1Ch8uLRd
	zIqiLYQPYX3B98shld6Xbdrysb5p/YN77zpYglpfn8kCo3Mr6EZep4ZGa5WzxAZCTTGHF1lKX2vgh
	UWBtML5x3NWqWRmiRP+dU/uHYtho/a8ka5wmnZ2G/9IRE9hanu0f+hBKR5h0AkqIVwP0vr0bReTK6
	yNnzFJgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w515I-00000001PFg-3U7X;
	Tue, 24 Mar 2026 12:42:12 +0000
Received: from mail-francesouthazon11021139.outbound.protection.outlook.com ([40.107.130.139] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w514p-00000001Oun-2MRd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:41:44 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BYI9sgg8roQaI1XimTk/xSoWxdPPZmjt7p+X8fbOE+reNuaZTDU9BuzuBwsyxjf28+jCg5qMykA+tqT7l9OV1EByD7S+sizyYCqSWn6vhlV1BgLT6tUF7+HaVNPMg0HpCiZ7UIZl/avi08dEvZ2/9liqvu4IeCKCpnOkOZ8oFmf+dBqqOzHBFSH9pRScIOAMqtRs5NRD8jSLQ+FdCj3G0luj3lLuAr60OIv60LuNgPSbNOQf8ffVtTfE4WjlCNkvOwvqwx3HYgIpmliI+NclyOu+d8UaDlsSCrY7QVpf2M4cNTGjQsSqRwMWm4LRjkrb6KL5Krb7rYkngiMgFFGddw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7Y9t++NNOJq3agD5vjYxbV76eAP4kQBlUcc26o3ps0=;
 b=cjbzTkIensu42GO4lqj/xlUHL8VQibhNr8pmuBEhrXh1KSb+vcyS9ZKU2Q05655D5hLRczlsK5fuh1zEvs46VMkCgPQ9aohEs1k5WU8IzKLQLeAGkm01G3C6uopJYTqevYRakc7Ssv/i1KKKP2v3cADkNZa0RSfcQpJevJ45hVhT1fNQs8VAN+BxEEP/E43RvqgoQGhSzFq++hBJGY4b0IkLYMBKQzgETk9Jej6JZV2do63LJj+5JsSNVImsP9Bem6+cAgAdwewfo9Shq77nsLZSwN64ctZA1Va5x4AD8A6RkzwVXyPrvDdtCiUt8NJqdxjK3/fW/vYfRD/rihibJA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7Y9t++NNOJq3agD5vjYxbV76eAP4kQBlUcc26o3ps0=;
 b=GlvaYa3T23Bk6jrSAgydxlRMJw51im4fHxsyOuR1xqHjXxJeJu9uy+pyEkDedOAGaJTqoyEss8A1bos3qYh1ZX6CIRkhw8y4Ecw9szPiDSTbIwIpZsvFAI+YvlxN+RPs55naYh22Q1TA4OaYpEUP+rxfwf34ccBANWuJxIgYUUw=
Received: from CWLP265CA0431.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::7)
 by DB9PR04MB8346.eurprd04.prod.outlook.com (2603:10a6:10:24d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:41:33 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:400:1d7:cafe::35) by CWLP265CA0431.outlook.office365.com
 (2603:10a6:400:1d7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 12:41:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Tue, 24 Mar 2026 12:41:37 +0000
Received: from emails-5408638-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-76.eu-west-1.compute.internal [10.20.5.76])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 8633E80078;
	Tue, 24 Mar 2026 12:41:37 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue Mar 24 12:41:30 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5PBQ0G24ipJAga8A4O0Y79KoTDVJe4jjZKqtq3KGtJ6BubpfN24G500zZmNFrrt5UCJE5XLMRBR/h0aqE1SbsuVUDbA1vJ6yjCZu7PxkhnHywEvWKClFCdogOIlk+Nd0LeJst+VS2wmWWtFnnwOBYTQt3q6DC2HDPXGc2fiqRUMRCbXaEQPMsSB7gg36lKU5aDmIqeRzLUjaYbtWl8On++39t7WKXKnGJf4vzrWokiRAYLBU7687B64x45a2AzZ/yJtNPbuhxwGCIGtyk9QkE15Xsfhj3/C+ljAn06Asjp+4BX7303NK1/Y6zAKmd4padI0slBwGcVrK1wxZwwznw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7Y9t++NNOJq3agD5vjYxbV76eAP4kQBlUcc26o3ps0=;
 b=Ghgtd4IhEbs6zFPgBcJ9W6pShwYewO7JoiuUNuDxIEHWaCJb+ZjK870L6DaEVr3996w1gck2uKeFm3mInD3y2kFXvnbeXRaDGJtuCi3ft56QbVCeqFIewaWoCFSfqYr5FA+Vz1rEXdtenv4ikc4FI9yhLbrHc98MWYy08y4mV2erzhZIfsrhj4I1iqchr7iDF1eTY43PpNbFWr7sX5Q5jKgG5I+rs0slN1e9EX30/KOpqviIvSy6jA54b6mZYHv1NZTO7z42qnq8dqOe9z/xoM1JZlo/VRiDtncUFeMdAV3ZzUfuhk/k7V56qwOPOq9v7zRgFMrby0OUugFpFkvLgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7Y9t++NNOJq3agD5vjYxbV76eAP4kQBlUcc26o3ps0=;
 b=GlvaYa3T23Bk6jrSAgydxlRMJw51im4fHxsyOuR1xqHjXxJeJu9uy+pyEkDedOAGaJTqoyEss8A1bos3qYh1ZX6CIRkhw8y4Ecw9szPiDSTbIwIpZsvFAI+YvlxN+RPs55naYh22Q1TA4OaYpEUP+rxfwf34ccBANWuJxIgYUUw=
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
Date: Tue, 24 Mar 2026 13:41:02 +0100
Subject: [PATCH v6 08/10] arm64: dts: lx2160a-cex7: add rtc alias
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-lx2160-sd-cd-v6-8-8bf207711848@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|DB9PR04MB9722:EE_|AM3PEPF00009BA2:EE_|DB9PR04MB8346:EE_
X-MS-Office365-Filtering-Correlation-Id: f5780d20-3ac9-4537-e8a9-08de89a2b0e3
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: J7a7py5tVeBQY9btU4FHG4SVjuMCWg/S76szOkjBisfn3f180j8DSydXkQerFSDfQf70wp17y55i75EMJ9H51cWhzrzhSPjmYwrf5AMfb8WA4auE0dqsoB9cI5AQUGkaQbhSvgK5fJWZ8GVNJ6/jn0TqOLsLZPl7uUm6ZVMCBjgUVf5iAYaC90hLfZxre1u6xbdtb5Ss4Kr+0bTn3sA2M4KOB2hgSVIEmQwBZkyRTU9SSCOLzqr/L+k7WKZr2gzgRLygnQAnV20qHQAjQ2zCSeyfhGzEFZpXVWm+tLqOyTwBLdLnXarVEjPG5nkcEkBMuFzm1zGtmdkEYg6lG05t+ItO8X2haN1JzdVkbn6Dpm5OETgNdvMekn0ojmcxhq+6hqnDBGlw2RMS/yil2s2fvbaqJeolJBmZVuVFB9wFB1iQNveu/VzBzCVNbfmo4roc8Ud3Coo0dq9OjlXu8YTQkPDgHlvSA0IXTcWWLryclEJ6oJv0qcr6nurrDfj+WjJy4BmWOlR0SaNiCZbNPFqQndUYKuGye30aWHzOVgX7iqpUIFuXbBBBybUfybh8QFFilNDxHSC5KxvQrmcNGXPhvGoHF8pQ401A4zFTh531kO8o2XlxeSdn6SvNum/e6eMEedpeEhFkHbDXL9vEPJ7ARfz19X+4C0BWtsKs078UH2Dj4AXhobvXQWOX4b7tVqXPlgHOdpStz3syy92Z2gajbi2KWo01+jiwXDqrquY9IgY6JurRg90NwIdkUgmFWglJ/+El1vy+39Ac/UT8QE5Sw+MRZ9RAmJN5UXfdg5k3lLc=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: A/oS9sqILuvKvnsjsILUFWQ+3opAbg5LnIA59jucoZamcse/Iw8zpT5gH61cWGOgR6N5TUOIfwf9yYN0Gu4yJHS7756hy8ANjgx2wIn2sEZibvE0XU5kByqJ5u5SDMV1MqJHGx0tuuxTWY+y3XQijmS0zIKxYD9SHX+8+DW50/VtmSboB4UcZdtrDei0SHI/uaMDM17F7ZoJA+kIGTEsUTMA1JRlmn3xmra1quOWbwe4hSAKFh1L9/PC1BlNmyCz1lg8L7DqvycIJHNi2611+3LrFHzbL/QhD9Az/o6KqSIvCZqC/V2f6rk27cOHtjXukXaom5xWo+gJnUW10CH3Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9722
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 9826f032e9d24d92bad542d1b8b82f71:solidrun,office365_emails,sent,inline:b9e026b2ce894d6ae84a8479915fad54
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 65ddc95e-991b-42be-544c-08de89a29e93
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|35042699022|1800799024|82310400026|36860700016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: hH2bg1vScgFHkdPu5m0oBngWVmAsDIbqh4YDy5dh2fBNkExJs0QeFOTbiUbBY6EhJyBJdCCUIq9YilmQQkqxRN9yUq8wwoahVH68wt+NgeeFGaE467xvZGYL8k2ZG9yoDXPGEK231opN1vQ9dOlnUJbcB0xDbtv9wK/r/YgWwk2IIXUgMuI9SGmETORs4KPC4zI51CVQjcu6h7yReHgQJ7zTqorhjvduwoH1CmmzwvVPxKpFVoQLtLa7ZFnL/EpePtCL6JQjwHjLoD0T7o3E77edeCFKO5SOSuASrdhEsd1sz8b1T2Wvh0gy0wxvO9f/xEfIkKQdGCkZesoQSYGs8y7AD2f3pEg0CL37vuaORq8mjIeyUL+3ON5HCQ5J/pkfs20okn2mk17Jk0TJ1E6aAZGoOD1zp+b4bE2N7BLRU7o0CmQbWOf3TbbmOFy3KQnV8kczEb0CjJvGiPSeu9qC/IADfTn6SlKsPMSDXdVi9Taulziw5KByDHfIrWGBBgs4ci9ZcBr1qsIFKsiTd9lIy1E+UM6oNyfAhD3rDu8MYcni5BITsGYxw3jpv4NT7Bl7gGTQWJYUFHn05XZOogVOMSpJ18efLHTIJpKjkGwRZnb1qD9QDHmOqw7+7RutwKsRy9xgAfXf6uop0l1VTpAaKSWCV5vSatZYM+YpKHBEN8UblilK4jWwvcjjpPtnHzneiUHF9Qj9VTLMRWDnOCrxaOcc5Imwu63kST7++Z+k8e3FPcWE7GmWuGLe607eKMNchbUED+090Bk+Lbzkpst5kA==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KwuMSW5e+DllFDrcP70p3BLlgGD9SvqqwGUXgxlnet1k9H9Dk85czLHyQAxMUwyYUr4UehSs7QF3uvFOjZTkLsy6wUbXd049ZEbF6Qsfehjwv6VgohqGn3w5NelBSFeQwmihd/dT5H5Qy7tE967+JprVXuFr+sI5WsvQTYSWevrBmgZd1rq1EKMQBEkoSSsPmG0x/ESI2o5ZmayY8T49NTaYmcRk95tLw4oUcggFaha7pKTbEntLS/7bRze/I/2/ecnmaP9FqDktDnZgfUK760XlNfv4FycMoY7B7ZCQaLEy/SWKyWAxeMEUlfAUw8bpjS/TLoF+5kTYNyL2ui7M00OK4H561sz3EUjWqxyM62oCBfUeImsKcFv5hMEm8gp4FP/niaGWVwurT10XyemUK1FQlXyBTetNGXmWn3F/iiOyu9WF5sH8Ntb13tUKLtX2
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:41:37.7618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5780d20-3ac9-4537-e8a9-08de89a2b0e3
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8346
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_054143_640486_C1D3C5BD 
X-CRM114-Status: GOOD (  10.06  )
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


