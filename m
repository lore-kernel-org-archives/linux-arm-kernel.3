Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08D410706D5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 12:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQGPTZrxYtULJbF4eL0hjyM0JlawXtgzoEXDxSoc2j4=; b=pbma4UaIniDK07QVbo9FSLFs9X
	guTHVTtgrTIVYJgjvEVN7xZnzcymbU3jljXzzvu7WJMvxqBMuoY68C+Co15tX0MaDvx72h//TExCN
	3EhdqgN235yEVKGSHgd1Lo757BiOssfmplYdAFtwE3bQKRqld12CQF4pZsD3MbJhgu5pYPPcXJvkT
	6vnrBvO4L2NjavHzCB0NLvQnZqaqhTdsEOTIOQAuaqDFsA/8OaG6pO+TFHd/5RJrgPJHJ75bAZXgi
	9XfqdWzixFDP+PYofaQ20nsvMuZCf+wmPwGmQB7alsxOaSNGxaPvxfxCG3ffVYBI3Pu4anGK0Fw/D
	qYJdGESQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1NkY-00000001nuJ-2fBX;
	Sat, 14 Mar 2026 12:05:46 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1NkQ-00000001noa-0oT2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 12:05:40 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ch47P3f+xOvLYua71oD3lfuD4mN+FQHyk/wXVhJxTEgdxbyB7aUF5QJhyGrhy7lElpRH5gCL5bipBNfMTtll8gfu2EZLTY1INvhD+9VXfZJwE9iFHZclW+evVLZqSnX7YP5UtYO4CWE+BJ7YC0n4RG0hB8ySvYOhkwxh8likoabZaoPHFsin2n5ClPypejA7yMw/RoVb5vsM7KV42hlVERp3i6dfr6NH59x/kPVE+rL4zZaqx4EZEF0WYrgiq9zD+lo43esYdq0uW0zzqZpYivFE7T9UVQKZDWgd7zJY6eORGoPJoW9QUTRZV1FQ2fKd5jVuqZlqxO9T/y2bU/OyLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQGPTZrxYtULJbF4eL0hjyM0JlawXtgzoEXDxSoc2j4=;
 b=Qc1ilCvPeY5iwABis/xPg2Ar/gFnLvYb8p1WtAKVDLOXEL6Nckkbg3DVy/LEu/b4ogY6fjjipspTLNjQI6nUKezPd0t4XcerG0uwPeVvOGchbwrd57tl2vx3y5hwpJ6f4pofYcOxE0NZPVbdvYiPtSx6oc99KUsri3JkMTovRseUuy1r3hZYCmaUfzqD+xJo8hP2/wb3okXPfJwfcPa2Tj2UNwszR4nMt7dWfctmV7m08Ry32NoSYfkC7KQPBsHaJEmTNZum2KtG2HMnmWEi3mZ4h0A2+ZbvEy2+a0/R51nSXNRU6bxDZeI4H4+oSyadLp+OYplyvhiNy2gJ2NjnMw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQGPTZrxYtULJbF4eL0hjyM0JlawXtgzoEXDxSoc2j4=;
 b=ki5ElxCMLXOJsxwHliQgTo3x5DzrfBOIWEKP3mP1HEnT1djzAVSoM/UzyIdeRKjHsORDPVhskwHeWUKEbWkkjgPWlP+odmJKuAkRmN0fdU69rB67AA4wd1Lhqbk+3ZIjMw1JF4h1R8UMO48zHsrxGOdoER7fjYuAvVwNU4r+j8I=
Received: from AS4P195CA0029.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5d6::19)
 by DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Sat, 14 Mar
 2026 12:05:17 +0000
Received: from AMS1EPF00000094.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d6:cafe::45) by AS4P195CA0029.outlook.office365.com
 (2603:10a6:20b:5d6::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.19 via Frontend Transport; Sat,
 14 Mar 2026 12:05:33 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000094.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Sat, 14 Mar 2026 12:05:33 +0000
Received: from emails-4228018-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-180.eu-west-1.compute.internal [10.20.5.180])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 9283180140;
	Sat, 14 Mar 2026 12:05:33 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sat Mar 14 12:05:24 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nY3p4KGfhE6WvU9JtXagNUpI1xGP8W+XMfzqcznenRV6O1IYTonaBYskIrnIehmCqTv+wkhuNrbNOI/bz6Xe3rul70XlQzS7VvoFJkkHrUo9osWPLQmGjOEAbIio3SWxGzsKjz0s0G9cT7QZYL93Nnz1Go/eCngLxtvNTy7JlwJyKf/gqdmZgQAAb++g/UX/KKrkdEbEYz8gGpBjZzg/ibAHAe9jClbapLBuMMa0tnXqeicwZUSrjDaD68LFso7EEM4OIbzC2t6Qx5p7zcadygYnpk+06U4UrPElclHAweV85P0LMX8KJj1o+D3GESt83pAlNHOs4f89uOYpBKVRAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQGPTZrxYtULJbF4eL0hjyM0JlawXtgzoEXDxSoc2j4=;
 b=pn3ujt1yMlPJnheiEckaSS8xpTFuYJF8pE0yw+pCDGItM8pNv8UIGg7JLvkoMQMrN/A5N00+cEnP1YrWHAwGUTv5ZprAnM54m3tiAfpcrV+qAdttU1gL+B2e0WMO2Ea8/CdrY5V5eNFtO2N04WfxvfNjSWEEu/R505nXNjweeuL4ct/Q5F6IMr9h6XvxF/q9sgddGao4lSGsaMxJHmcaCcT0pumOxEAkn5MWyleX3g6aoMkoiLfFovsUSpjSOzLwYym2c09LT0lMVgONlRKjTj0XJTophSAaXi2/tSxEC9rvWLt+qwDVV9AXcT9/Je8aew67VoFjxyg05iP0ZF4TyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQGPTZrxYtULJbF4eL0hjyM0JlawXtgzoEXDxSoc2j4=;
 b=ki5ElxCMLXOJsxwHliQgTo3x5DzrfBOIWEKP3mP1HEnT1djzAVSoM/UzyIdeRKjHsORDPVhskwHeWUKEbWkkjgPWlP+odmJKuAkRmN0fdU69rB67AA4wd1Lhqbk+3ZIjMw1JF4h1R8UMO48zHsrxGOdoER7fjYuAvVwNU4r+j8I=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM7PR04MB6805.eurprd04.prod.outlook.com (2603:10a6:20b:dc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Sat, 14 Mar
 2026 12:05:02 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.015; Sat, 14 Mar 2026
 12:05:02 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sat, 14 Mar 2026 13:05:13 +0100
Subject: [PATCH v5 03/10] arm64: dts: lx2160a: remove duplicate pinmux
 nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-lx2160-sd-cd-v5-3-83de721585e3@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM7PR04MB6805:EE_|AMS1EPF00000094:EE_|DB8PR04MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f8909de-1fdf-49ad-4dfa-08de81c1fef6
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original: GEXZBAzPPvR1F1zxlg+HteFSrU5riJ1SVMcecXGCy3zn/mk1wB5G4jtsxMDeAHVuhnByT3FPoGO/QdPHMh4Bfre2+2IUyM/hyX9cvisgH8nynGeCqdkXsORYM1G8BdZVxZZh1GZ0yMF1flskhQgFW40mtPiuLsS9Ir4kVa+PMevbqNZxjHNAV+L2pHxbJXeFgDjRYCs8yME8zoRGnbnaqMGKIomfB9LxVUm95CjGawBu6xNPSSc1OsAXTs2bqxK7fh81b0IjjWAe615PxtXsqvv8T+/axdNhScvNDocjBkD5Kuesz+/NQo3xKmjuQNER/cc7QFkSmUQZAdnmMQS9YtNn3yLGBNXs4se8Y0RtNT5z0AhLs658qTTahQKKLA4F1R5fvY8YReDOmEGIOie6LXQ5paEhF7EWJcQzjpYdBAuGlJ7o6+Hn+8x3lKUuLMurFuHNZj0O1fboBkSnNGy4Vx4iEPFUaXytgfdFuR+5EMZ2yo9fZoLZz4TQJm/0K33nSn+69f+rqPo/lkF3GCxN19mHogVYGo0ECP2Q83D1XfC4IruV4QbxKcfxkgPcM06YuBi3JYYgdfNyMoFc1s2ZouSrW8ScWljVeQD7Aa9qhWIP9kkJVothUsC6OMcCdergP+VZs4YYCTkADYRnO0FOxs0kvjr7qCSvvM30RP2Zkbg9C3UfQgYY8m9hTX8DVZx0jTFPB2AtWlvqHKSQ7x48ouo4MZTc2qbgppuf5vNqV8b+8gAXSgDoQLz4mZsAy6ut5UDXklXzMJD7dF0vUgik133HIbByHA6Wd/8ATNyX1sw=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: A1Smcn1vyHlKW34rqwXs9TcNfAUhKEKi9GSURvXlNSCIbMu3j/pjUzU7fOroi4vjtQ7ZmJZxa8CMDMZKRqXfcUCYUZ3qChj3rTHmb7glXSawhAXNmomMQOglqD0n45LlqMCDr3ZQvOtxFFVqPQSXXX4dYVFNYeVuamDqsvnCj8sZ/8CWd54sao8uxgM/MLV4lnPmXrmWzZ0Ws3hL9TKRCSTwj7l6MIAAp5sVsWsPTcKk2NIsPWuVAbs02+UostDpHhl/0sJebwGKJVBcb29mRRpgzeJTB9HGQcjWWU0UT5+743NgzplBSkaa7YvwU1EGg9mgNVZFx67NewzzZULHcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6805
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 71b259989713488bb50a639d0f65ee24:solidrun,office365_emails,sent,inline:e8a71b8ecf121745cfe4398c998083a7
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000094.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 11e572b8-be1b-4373-c927-08de81c1ebf1
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|14060799003|36860700016|35042699022|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: DjqQ2/RrOYjaomrxgzeAqbxnwbqb9/neK8zjZukLLzI/dO5SfNlrzmMb4IXK9MOE2zLMSpurM3x6UFev+kO3sCeZJ5qS8XCy2edkMOdMmeKsSCnCF9Q55mBzUEqmpKoLXnRp3hpkKt05WDEb/XMFy8OOW1cpQ7IyJZIEXRLZvP70cmVBM/W66g0rIOT27L/93uxh+O/IBFjv7jcTmnR5xtqLwKBK4Du5s7Amw5/X87XZFge8tlrbUFbZynHYx16VS7qBZfdFoskshoOsMQJ7ziiTfdK7K8ICoiTOFkGFFDGyR3HyX/kWlbtk6dZy7QjImfmE2R1zMrUyMCrpTbdRUg6X91fuPrUUdTwcEm2cEnTaueO517AjnBfzzXDF4lLxNpaXz6mfqTH2unnbx1PFVdBh69htLuXHTDaAlu61DlcdnpwKzToFtzn+Ia9HWvVROcFWXhlaE2oSFmctO9uoeblWxkd+s3FqgrUEezHz5NbWI8jYpBeclNctCAnsjFyWNK5/sSFCQPsxkOdJ1O1HPX4Hd3V7+eKMLI9NK0AFa9eLW5zNoFqf9G8g/pOaP274IRpElaWOADzNijyIhyJBA67BGuvsZOLmJyrDJR8tX7FYhiLnlWHKyJsnyUQLBKfCBzEcIZqaxxruhLAl+v6/gbXNe7F8zl5c6mQ7GZQfusQ4S2RzHP24dD66mlPW8qDTtGDfrcXCSYhshMQrPYiRzYgBkSKmgO0phrFDkMmOQxruT7z14Ks6iVmUU3+ufoJEGln2XhFxyPdZJD/7j+Jqgg==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(14060799003)(36860700016)(35042699022)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fOH/rvaoC0YLzf+1wMtGyEHxVrmdELvYdC6Sv2FLzdgxt01rVUq022nEwXM0xouOc97zKnIxoH6bcKRqO1TwtGuDOcjGZP3C1AnrxxyazVqPGMYaEwHhJCBwwEmMvPElCvWnSVm0pFsX5m9gXP4qOCj9zbeFUdRj/f2YRa5eV2J3RjJ1N2UFHU+LrPVnT2VAhfZDOf8x+Yj5oBr6+UbamJbKBmHSIqz0wUOmEln17M63axuksOu2HDLh2IG3P9d9di8kIDdaDcvUaG78WMy1YZ7a7xzFPU5EgO3oH2mxdAyHh4eoDLDueiQxJ8xEOLwMcQKVa32wRGZ8kxA4Fux9qliMfDDplWtvqKjCMhBrB04u6y6qUvOWKRvyNCCMngpy5h40bpBxGeY9VbGINCSJrMOpF9QqC0nBSVcbIbZnsXgS5104Qg8rfpIU4htCJ4Rk
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:05:33.8418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8909de-1fdf-49ad-4dfa-08de81c1fef6
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000094.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6859
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_050538_251039_782799BA 
X-CRM114-Status: UNSURE (   8.02  )
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

LX2160A pinmux is done in groups by various length bitfields within
configuration registers.

The pinmux nodes i2c7-scl-pins and i2c7-scl-gpio-pins are duplicates of
i2c6-scl-gpio and i2c6-scl-gpio-pins, writing to the same register and
bits.

These two i2c buses i2c6/i2c7 (IIC7/IIC8) are configured together in
register RCWSR13 bits 3-0.

Drop the duplicate node name and change references to the i2c6 node.

Fixes: 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index d5bb55df03216..41c9b4253f4a5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -862,8 +862,8 @@ i2c7: i2c@2070000 {
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(16)>;
 			pinctrl-names = "default", "gpio";
-			pinctrl-0 = <&i2c7_scl>;
-			pinctrl-1 = <&i2c7_scl_gpio>;
+			pinctrl-0 = <&i2c6_scl>;
+			pinctrl-1 = <&i2c6_scl_gpio>;
 			scl-gpios = <&gpio1 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
@@ -1785,14 +1785,6 @@ i2c6_scl_gpio: i2c6-scl-gpio-pins {
 				pinctrl-single,bits = <0x4 0x1 0x7>;
 			};
 
-			i2c7_scl: i2c7-scl-pins {
-				pinctrl-single,bits = <0x4 0x2 0x7>;
-			};
-
-			i2c7_scl_gpio: i2c7-scl-gpio-pins {
-				pinctrl-single,bits = <0x4 0x1 0x7>;
-			};
-
 			i2c0_scl: i2c0-scl-pins {
 				pinctrl-single,bits = <0x8 0x0 (0x1 << 10)>;
 			};

-- 
2.51.0


