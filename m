Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41E9D58CCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CLupcN7qU2goi7o2LzvkzQGTYCMeAZry5InsPLazgI8=; b=ujluFEAzoGegsfT1TUW3SdByet
	H21J6z7RwzcdpJlSVLjNN4PIpeMh1e4V+nfzRGsFLonL6JgU3laVHvf1xOc63gHGfsOdKyU/nkf7G
	9CJ7dR7Rc4p+ToP4MxhOvskKJxYz25xtKpLnJQP65VY1AYQdlQaLXO7sJ3yGk2beT/s+jl7Wxw2oP
	wYmEWFeLwm7yCsvRSEHJ+QtKdEJsfz9ek88BFZAkPqbDHOz3fS7bynCVXIprQZi5XOCsWKjboVNVe
	inhMfAUDm8AogBnSmgsB0ZiFGcy80rwMckK+HhL0Dt97tAGlOV4HMhMIlaeBO9Z7WJ4iznM34pzDp
	gmDww00g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w515H-00000001PDf-0YH9;
	Tue, 24 Mar 2026 12:42:11 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w514q-00000001Ouu-1e5w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:41:46 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=P7XLsijg3dTyLXjKEBp006a3mZdBx7Rjf1baW5S8Gkblorqdu/HQNxuIZF29o9ApgoY++Mu39gyLGUWTrvlAY25PAR1rW0XMMLyluypcY41HDybm0ByZJzp7Dilwj7JD+ymjbHXGvkAmAe8+9NRujSBLP3wI9Hivcf7XzmK3htqiIomEvE3NVS2CzzDFZDeCIhGe8Im/fE6pbfC1ANbRL9Jrc9DkNyh9iOkuPAWkyGQ/joqLxr5fBGne7XEI8wezfqzy5eeT3pV088+4YiEMST4JMGmLzNEQdelakXVYCT0RKnTl5gtuT0DchX5bq5Jl8AfMjyWLpBtdZ3YJvIbDSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLupcN7qU2goi7o2LzvkzQGTYCMeAZry5InsPLazgI8=;
 b=Ec0V9ih1EoyJt3S21+E8pf9qUOmqaCc5A/YF2/MBXBiZS5IqLqM1DNCf4LbKRRVffYO7/FlAbI/GJKNvZD8sd5EUVpxMdYAB8cIEpdAL9wacbJo7ezwVnQn9mVwX6XAmFRUkkdocXBICXYIoyIMrPkspPOBzhZoBF8VNC0bw0wMT2dCLgj1+BbnpRLErc/e+5VGaLgpq4tFq5df5IsJM582K4GV6qJ/7ezYuJD6O7CZCUyCRw/X5xBeEn4FW/Ooa0QWZGfsSN5gpI8WjNMG0Vl915EIwZn7MOwXdy9UDPOeHJ2C/t0RWmhHjmR0XuhdcJKtCD2nr0SnkSEwdQxrlqw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLupcN7qU2goi7o2LzvkzQGTYCMeAZry5InsPLazgI8=;
 b=MhWF3noDFLbZCiPFtqr+fGuNXrX/eYM1PZ/qMMmHVb2kDhPVIcv8+O/NTliRj48j+XFewj9nte6afwnSOqraYbpYtslFnIR0kjad5mz6AQiuebZccUZn2inppcmEpQq5zbPFWCViT5gSrz9wSk2xOYDnbw3yb7GHiOG9+mqhnDQ=
Received: from CWLP123CA0259.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1d5::7)
 by DB9PR04MB9963.eurprd04.prod.outlook.com (2603:10a6:10:4ec::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:41:31 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:400:1d5:cafe::4e) by CWLP123CA0259.outlook.office365.com
 (2603:10a6:400:1d5::7) with Microsoft SMTP Server (version=TLS1_3,
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
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Tue, 24 Mar 2026 12:41:36 +0000
Received: from emails-8946962-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-81.eu-west-1.compute.internal [10.20.6.81])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id B0A7A8071D;
	Tue, 24 Mar 2026 12:41:36 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue Mar 24 12:41:29 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OleVrXmIOoybGUIqx//RnuUsm4mdX4NeV5/mB8wBDvumF3Ht/w+fuIpoDx/D9r0EYeN/VkdQKYmoiaIoYe/M4wPc8UYWyAFOFPJy68xyBToEXMBwHLXxyiyCQI7jJilCIvo25LSInxPjWs/OqNrWI8ojfH+W3cee13psKpYdwfC6h0WYPuJ81OoFd1NyliPhHNdiOSJ6JPhHMQ/scSWnyTB/XHhEVMEhvqGyeKm1ZEbUUr9soiqBB8GwylKh2B8FC26XEK8SoRNtBmy84g6Buz2gcFECqUgiiLNxpcj3NbxSIVRNFENIqx3oBkLs58BiYyaNNbaLt1z/tpxpnSr1Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLupcN7qU2goi7o2LzvkzQGTYCMeAZry5InsPLazgI8=;
 b=cFEm1Ij+sgpUZPF0H2b6yyx9Thcg6UjL/YxzuwswnpVI8NvImEYeSp1RIq8p8ePTIDm5P+Mmyvdsoi+YAY74VSAAc9w/IuVNBEPkL+MvF/pJLvIDwFYlUO3kJ15D6F+Ruc/qVUFuw99CUsnrow1qo0Ws3FFIbF08AzZ4DG1RshkHLG7nIP39ltP7Cc+Lcl0MEILJSxmPzNp920I18OqKRy0CwkemhJBHaG7hRE44hspPraj6IwakkFGx20gbr5Uh0UxPfYG1xziTzLg+2F0EEe49CibKw5AuzGy/Onb6a/L5JT8lUK9iqskh2NYXThCAZ6BjOdtsL4eQEKGGACUowA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLupcN7qU2goi7o2LzvkzQGTYCMeAZry5InsPLazgI8=;
 b=MhWF3noDFLbZCiPFtqr+fGuNXrX/eYM1PZ/qMMmHVb2kDhPVIcv8+O/NTliRj48j+XFewj9nte6afwnSOqraYbpYtslFnIR0kjad5mz6AQiuebZccUZn2inppcmEpQq5zbPFWCViT5gSrz9wSk2xOYDnbw3yb7GHiOG9+mqhnDQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DB9PR04MB9722.eurprd04.prod.outlook.com (2603:10a6:10:4c7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:41:22 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 12:41:06 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 24 Mar 2026 13:41:01 +0100
Subject: [PATCH v6 07/10] arm64: dts: lx2160a: complete pinmux for rcwsr12
 configuration word
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-lx2160-sd-cd-v6-7-8bf207711848@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|DB9PR04MB9722:EE_|AM3PEPF00009B9F:EE_|DB9PR04MB9963:EE_
X-MS-Office365-Filtering-Correlation-Id: a19784a2-08b0-4474-3afc-08de89a2b067
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: ybvYC7DeAWU/kqoYe0fhv8vlcG/ZsrAA+TljUqfhnPsyxNDTIkWtS4tEFninKPPUtsNLI/HXM2EKL9xm0XEkgiDte95cgZazseH9/8yI8dveY2N62RhOujvJFte5K0+lLX6MFfUDGBbcKryCSr7HmZQLxXesbuQitcprUrMSo2yrwn2C7NcyA1MYlVU+zcjbO+4ov8Mpaxgg7NLD3P6rbuilJQiH9fHQ5EksE1v5wLVlq5drSXcD+Nbm2emVeaTMsR2jloee0FEJ0T1GFZEvBos2UAjKnsUPk6fpWSf37aWFDLSCj+4zdHMrbOs0P9qwxGeZlu7DdEk3CcCoGkg7azxBGvQiJAPYD50+5m3PoyTK9UnrV8BufrjpIFby/V/oHWoVbdUHPeret7qv6Z+Vrf9eatmR/sP76BV+w5Q3NFuR+yQ17Ql3vNSTN6E0f3h5eGZkN2c4wTwirTnyprdz09PmYK+fNKNDn7+nQHIhWXB6VExoh72xJWsUrdQuyw7+JhQY2Zkg6KR2aQNedLTSmpP3/sgx5C11BT38ScIjKLI6K81Saab+66ibTMSrjNEU/IsZwZ/jE/R0TG1+Tl6BhWGLGTp1Z6mgRpmRz6EwZgRQ6e928/eqCvqPxgCKIUGqPvD8Vkq8uI86p7asHKKjBE/JYqFWU5Fz9g/u9LREB8QqeCBJPluFgFEtk87zBnVD3nOyXGZYHZSW2C3/tJUlFqJEXbf5mMeGin9cUibo4J3dzukleLNMPDTTr4auMnrjCTaOBAks+m5Jx6fziGdyFQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: dS9j1fHXAx+CEjgTCCdihqElnyc/TvYzOISD8PFD0ZY+zf34frlVdVkEYhYIpwYx289Do2EBCvcdlqNv7ob61bOl2en9eCQlbJxdYIfjH+bBsDbpGqMaC1BTbqIL3GTrlLTgEPxliTkXn0IAr67JJweA8dvF9w6nXDi06H30PQWSmLkuKPk8B4haj3YZkWj4lsXm4nqxgo154fAbHLVoIy3z/3rsM7zYgTIGXEX9h6OCRhG2a69znRIpPsP/F+9hdBPHODoY4EUM2oVlQ+SK9yoq4Rge3x8Ea1dBrh44Q5iTVnOOQ+ZKDipLQhFLhdqBUYhxIwX8fCCCEaZVLU8nWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9722
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 82442f22f0864c1c9755db9f3b944308:solidrun,office365_emails,sent,inline:b9e026b2ce894d6ae84a8479915fad54
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 96286769-91f5-4175-3d42-08de89a29dcd
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|36860700016|82310400026|1800799024|376014|14060799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1Du5N1CMwGnzOl7lh4cbfx65cn46dUQidUnubG6jIqtu/Tqcw9yavvigl97v2l6yzifw94/UyD0YvkznBNyvaUnGf18xfJLxhVUOwM+5ENUvwTInVqjFi8KHZw8tNeibjmIHZ9zgsOHVg37Z7UjwTLG3yhP6chGo7y837qN0aDdj3/2EnTBG+dX6MkZ+yR1TKlQd7TmYWzHetNE1jtnVK2QaQhJS4PTtuwOJofCsXguTIZGsR/wT0G7NEUn9wvmGQvTcou9KfLmg9PPHaiGPcY596UNm864kcvh969LrpTZHP2clQKET4Bglna1gp7pBdULgedt55Yn3O0nNDJURyAYBlzjL+YWKFlzyJk5cpPQC1DiO8Y1iLZTHJUc9CukwkCRIntHe1+RltpZnQnuy8FHWQs58hIiGkhWwWvVm5YU8yPrqYqnxzeOH14vhKw2Z8QPWprh1ORF6WpuBJ1YDaU3wnLSmnD8gXDwH9R/DTAUIIy28XHwsozi5ggaGVOYUSul+JaQezG42A/nPo67WKG2S9l0eIHYltdDnKdQsd8nI8pZU8zctXqzI/0ua+1hPfA9k0FGp3+CGQU4J+DVXOHsCiued2SRUF3tqwcxFzvAh08wSeZtJzKQTDMig6plVrGUObaSbXpx6Wn+iASsBvEP6Q/qThE7+hJ7XrB3lwwrK4nYFn7WKS6UKxMOvlIdCM0AnYl9i+tdScXiNGnlC9dyO8I/B9z4cNXfsvYOaSm0FAroUkbZNdhENIWQV1uY67nAFr5BMkQEsNlQI9KuxfA==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700016)(82310400026)(1800799024)(376014)(14060799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rhYirb5EC+BI7Kbx3V1Q712Z5E4NDrr8ZoXSyRJu5Z8UkXlPGVl0rHKVx62gnoSMizSFGKi2LUyrrCQqz1rz/5izZTmw+KBfsOJ0EfHzNyeC+kXc9u8sIVnhFW4Yzws6BNYns5h274vOCWIUpIpN3aqNPGEXSS0sTzmIa0SxIp4tmYHknMhbsd5D7LdvUjo6fS704DPCC5dplg/PN3NROnUvulFyKgOoBUrt1rgzqvN8hO3TuX5hzn0xW0W2ZLnvOX32SLf+hyWKS0rNMEAClCqlSDEoN90NXjFGjHvlbenH35gpBV3Lm69miftTymJ+lEtuwSkc7BpCGpWnm0TzgueO9Duc6ya5PDGQ0ciJ6DfyWgJlwpWmfbNowBm7mhH9N7O6fwTLbAdm/DbJgi5wtX2vMSwrU6G4Ibb+4NWf0kSM3+gu7qqI12345cIbAsoE
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:41:36.9444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a19784a2-08b0-4474-3afc-08de89a2b067
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9963
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_054144_862856_BD342596 
X-CRM114-Status: UNSURE (   9.51  )
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

Commit 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to
support bus recovery") introduced pinmux nodes for lx2160 i2c
interfaces, allowing runtime change between i2c and gpio functions
implementing bus recovery.

However, the dynamic configuration area (overwrite MUX) used by the
pinctrl-single driver initially reads as zero and does not reflect the
actual hardware state set by the Reset Configuration Word (RCW) at
power-on.

Because multiple groups of pins are configured from a single 32-bit
register, the first write from the pinctrl driver unintentionally clears
all other bits to zero.

Add description for all bits of RCWSR12 register, allowing boards to
explicitly define and restore their intended hardware state.

This includes i2c, gpio, flextimer, spi, can and sdhc functions.

Other configuration words, i.e. RCWSR13 & RCWSR14 may be added in the
future for boards setting non-zero values there.

Fixes: 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 75 ++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index d266bf96e2c6a..479982948ee53 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -1721,6 +1721,7 @@ pinmux_i2crv: pinmux@70010012c {
 			pinctrl-single,register-width = <32>;
 			pinctrl-single,function-mask = <0x7>;
 
+			/* RCWSR12 */
 			i2c1_pins: iic2-i2c-pins {
 				pinctrl-single,bits = <0x0 0x0 0x7>;
 			};
@@ -1729,6 +1730,10 @@ gpio0_31_30_pins: iic2-gpio-pins {
 				pinctrl-single,bits = <0x0 0x1 0x7>;
 			};
 
+			ftm0_ch10_pins: iic2-ftm-pins {
+				pinctrl-single,bits = <0x0 0x2 0x7>;
+			};
+
 			esdhc0_cd_wp_pins: iic2-sdhc-pins {
 				pinctrl-single,bits = <0x0 0x6 0x7>;
 			};
@@ -1741,6 +1746,14 @@ gpio0_29_28_pins: iic3-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 3) (0x7 << 3)>;
 			};
 
+			can0_pins: iic3-can-pins {
+				pinctrl-single,bits = <0x0 (0x2 << 3) (0x7 << 3)>;
+			};
+
+			event65_pins: iic3-event-pins {
+				pinctrl-single,bits = <0x0 (0x6 << 3) (0x7 << 3)>;
+			};
+
 			i2c3_pins: iic4-i2c-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 6)>;
 			};
@@ -1749,6 +1762,14 @@ gpio0_27_26_pins: iic4-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 6) (0x7 << 6)>;
 			};
 
+			can1_pins: iic4-can-pins {
+				pinctrl-single,bits = <0x0 (0x2 << 6) (0x7 << 6)>;
+			};
+
+			event87_pins: iic4-event-pins {
+				pinctrl-single,bits = <0x0 (0x6 << 6) (0x7 << 6)>;
+			};
+
 			i2c4_pins: iic5-i2c-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 9)>;
 			};
@@ -1757,6 +1778,14 @@ gpio0_25_24_pins: iic5-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 9) (0x7 << 9)>;
 			};
 
+			esdhc0_clksync_pins: iic5-sdhc-clk-pins {
+				pinctrl-single,bits = <0x0 (0x2 << 9) (0x7 << 9)>;
+			};
+
+			dspi2_miso_mosi_pins: iic5-spi3-pins {
+				pinctrl-single,bits = <0x3 (0x2 << 9) (0x7 << 9)>;
+			};
+
 			i2c5_pins: iic6-i2c-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 12)>;
 			};
@@ -1765,26 +1794,71 @@ gpio0_23_22_pins: iic6-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 12) (0x7 << 12)>;
 			};
 
+			esdhc1_clksync_pins: iic6-sdhc-clk-pins {
+				pinctrl-single,bits = <0x0 (0x2 << 12) (0x7 << 12)>;
+			};
+
 			fspi_data74_pins: xspi1-data74-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 15)>;
 			};
 
+			gpio1_31_28_pins: xspi1-data74-gpio-pins {
+				pinctrl-single,bits = <0x0 0x1 (0x7 << 15)>;
+			};
+
 			fspi_data30_pins: xspi1-data30-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 18)>;
 			};
 
+			gpio1_27_24_pins: xspi1-data30-gpio-pins {
+				pinctrl-single,bits = <0x0 0x1 (0x7 << 18)>;
+			};
+
 			fspi_dqs_sck_cs10_pins: xspi1-base-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 21)>;
 			};
 
+			gpio1_23_20_pins: xspi1-base-gpio-pins {
+				pinctrl-single,bits = <0x0 0x1 (0x7 << 21)>;
+			};
+
 			esdhc0_cmd_data30_clk_vsel_pins: sdhc1-base-sdhc-vsel-pins {
 				pinctrl-single,bits = <0x0 0x0 (0x7 << 24)>;
 			};
 
+			gpio0_21_15_pins: sdhc1-base-gpio-pins {
+				pinctrl-single,bits = <0x0 (0x1 << 24) (0x7 << 24)>;
+			};
+
+			dspi0_pins: sdhc1-base-spi1-pins {
+				pinctrl-single,bits = <0x0 (0x2 << 24) (0x7 << 24)>;
+			};
+
+			esdhc0_cmd_data30_clk_dspi2_cs0_pins: sdhc1-base-sdhc-spi3-pins {
+				pinctrl-single,bits = <0x0 (0x3 << 24) (0x7 << 24)>;
+			};
+
+			esdhc0_cmd_data30_clk_data4_pins: sdhc1-base-sdhc-data4-pins {
+				pinctrl-single,bits = <0x0 (0x4 << 24) (0x7 << 24)>;
+			};
+
+			esdhc0_dir_pins: sdhc1-dir-pins {
+				pinctrl-single,bits = <0x0 0x0 (0x7 << 27)>;
+			};
+
 			gpio0_14_12_pins: sdhc1-dir-gpio-pins {
 				pinctrl-single,bits = <0x0 (0x1 << 27) (0x7 << 27)>;
 			};
 
+			dspi2_cs31_pins: sdhc1-dir-spi3-pins {
+				pinctrl-single,bits = <0x0 (0x3 << 27) (0x7 << 27)>;
+			};
+
+			esdhc0_data75_pins: sdhc1-dir-sdhc-pins {
+				pinctrl-single,bits = <0x0 (0x4 << 27) (0x7 << 27)>;
+			};
+
+			/* RCWSR13 */
 			gpio1_18_15_pins: iic8-iic7-gpio-pins {
 				pinctrl-single,bits = <0x4 0x1 0x7>;
 			};
@@ -1793,6 +1867,7 @@ i2c6_i2c7_pins: iic8-iic7-i2c-pins {
 				pinctrl-single,bits = <0x4 0x2 0x7>;
 			};
 
+			/* RCWSR14 */
 			i2c0_pins: iic1-i2c-pins {
 				pinctrl-single,bits = <0x8 0x0 (0x1 << 10)>;
 			};

-- 
2.51.0


