Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4EAF4613F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGe8mSvPIhJAzRQimPetINqtWP0+rFxYzcwSSR4mE78=; b=eB2IWwn9lJOShub9zOzNnE3pDe
	f+yVxPiHjupNq+6Wu3lfK5HC5eFxmXLBDFcET8cRAhbXcnNlKK8+4262WbjSUDTuruqs5zYpY5jmH
	ttt/EdLQK9DfeqN+l6G0VTbPIkIxxG7hKXggQWdMHzu2so1SDX3A7Lo23peLdbdfH9ceJIl5GMp7T
	d41DZi5AEPDxITVbd56DKliqWtXhk5tXvTQZPrHrrlAxBV5A3Fgc2Fa/0vQ5lQmaM0I03s3W/Sdbq
	9F//5FNIQqWR/IKrvvZ+QY1Vpo/5Gyexe7c9eMrLc5tTpmekgUpHM9m7YAgZONmGVFemBYyepeEFD
	2zqFOMdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w515H-00000001PEL-3Fq5;
	Tue, 24 Mar 2026 12:42:11 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w514r-00000001Ova-46Pf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:41:47 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Ws1+is8sZ94SD2qotO6pegtTPomXrf4hAdkGgahiG8TCwx6GBDAKfzvWU2BcD5PP74pPBz6emjuvdudcqLDSns2s/4fotya3+fYhYvZ7oxyLsQjx62LFM0BJmpxcHKA47LC6X0u7GltF5JRtSTSgnvRdGBap1ztZtuBrgOg2bGYnrqQ5Vz3XiSCxLI+nlEnvsMfWKDiWkJprWPjL4q+PJUcjiMtERITLt6BSckY96JjYJ6uCQj26pK0Ov9h4pw3G5pqu0PYlVZwqpPEnixjZ3sbQMZGm19JVn0XQ8ekecdLeofHYnfENj5mbdMLhXhNgGMyqthsPDhboNHSxpnCaMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGe8mSvPIhJAzRQimPetINqtWP0+rFxYzcwSSR4mE78=;
 b=PsYGvjz1+kTwD4Wy4g5pWgvHIVQRhbx6RCqYpKLz6c2Gdsa0qyCEmAAENlmacJzLcwAw7yLFcgZtZkGrqmyyoEwJLTl8D+MY6JbqU5JgRgwa55IM+jrb3N+NO5QJ/PzCGsaxOQj9yMM+O55Az09pkOAaoY7P8Ql+F482QXSbN/UgerM0zJ3+qHnln3lcN0CPqW3mCpBc+K7mg1XwbbcRjcl6faHohbafVIZlF7lwDuJy/fs+XPw3HlXJy13xnGLrNvgHFpmLe/wJgpo+fF+QHpdpTYPI2HO94yh41zI/Cx4F2T6PJzCwzhc2astIwRp5NXr0YZXr8qKw0PEfY4KgKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGe8mSvPIhJAzRQimPetINqtWP0+rFxYzcwSSR4mE78=;
 b=ORxKyADI8w4s9f4UZaPkCKz944JczqMjwaVUvnzaq0mBLteLhyelXLyc52b8wNI06UfjMMewlbuQGQQsMzn7p4br393W6tsaL1u4o8x24MOFyZvXe+229p6ury6fOTEcvHQQZ4epgCsoH6BATh+gApuCBb9TIfbdoyB6liNUy4w=
Received: from AS4P250CA0006.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::8)
 by AS8PR04MB7669.eurprd04.prod.outlook.com (2603:10a6:20b:29b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:41:13 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5df:cafe::b0) by AS4P250CA0006.outlook.office365.com
 (2603:10a6:20b:5df::8) with Microsoft SMTP Server (version=TLS1_3,
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
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Tue, 24 Mar 2026 12:41:38 +0000
Received: from emails-5594358-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-76.eu-west-1.compute.internal [10.20.5.76])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 5222B80710;
	Tue, 24 Mar 2026 12:41:38 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue Mar 24 12:41:31 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxQUbrIY3U2/JJBuUPqcAC+XZTeuDitxSa0LAw1KIJj5oAfyFLhrCDpiJN59fc7RL12uaBE9ajMfq20vtTAZhp5u/o20WeDyFhFE3OmwZ0gxQQA4lCYQqonlHuylTivv0cIOrjkBHPsJvYtOePFam382IzYL+uiXFXTTo6WkN1RmZpLwpypYQTDZWMUkyhouAdvkctSTlUFGqb+2+CqklZwAg1IFZlaJw6nVVNSgEOBjwr22Mq1f2RgpjrBdH2FPmGwNtJDP6tVp1Np4oSPL/AP46vGyFcDmQvtT/2Y94rY3N8HLZH7tgPGLBjt5od/2Mmd0Vq/+sq7f+FwhDvRa0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGe8mSvPIhJAzRQimPetINqtWP0+rFxYzcwSSR4mE78=;
 b=WbNP1ILX+qE9c55w9LsVtRLlPhgMO1FS4FLhP5VxOEjBEYsBGNh9BVOiNyHuBBWcy4jjgHNqGm6mHEh54wYF3+t2VZscd8isaz/M7/wySFr/S7wdSU9qiNhPvk6Be8ZKYi/R9KRIJ/Gt52glyC0Wm+EzU1FF622enrQ8ONezKU1gZ/E7BX4czTGlwh9E+jn6e+m8dY2I/kTxYNSuqqwRdFkz5PC/1QdgpXP4i7tZQ53E2qiRnnsLre9z6hpsaqbMThPXkMLeVJKn+72oCRs3U6VQ1cZ7zngJJyxnQ3MLRBp/V6gCgDCqaNc+mdDZ2BBk93a37yyb0Ha/d5VKe8NoZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGe8mSvPIhJAzRQimPetINqtWP0+rFxYzcwSSR4mE78=;
 b=ORxKyADI8w4s9f4UZaPkCKz944JczqMjwaVUvnzaq0mBLteLhyelXLyc52b8wNI06UfjMMewlbuQGQQsMzn7p4br393W6tsaL1u4o8x24MOFyZvXe+229p6ury6fOTEcvHQQZ4epgCsoH6BATh+gApuCBb9TIfbdoyB6liNUy4w=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM8PR04MB7905.eurprd04.prod.outlook.com (2603:10a6:20b:235::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:41:15 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 12:41:04 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 24 Mar 2026 13:41:00 +0100
Subject: [PATCH v6 06/10] arm64: dts: lx2160a: change zeros to hexadecimal
 in pinmux nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-lx2160-sd-cd-v6-6-8bf207711848@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM8PR04MB7905:EE_|AMS1EPF0000003F:EE_|AS8PR04MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e95839-b155-413f-f26f-08de89a2b15c
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: wTeOH6SUPHfcr+2MWipEgr5nEh/ZcjXG3C/oxTopgMUIaV7wvXriga5X0XzX3lXcMQXYu62LALpGTENVhCvdANo9H7M9XBisq85o0pvsjAGascSN0xp5rUgzMtsV1m78coBD22ibZyMpdlQO2xKqx53l75N+GcmZCoY4HkuaBvwm4Z6ffi49k+UiYEdce6OEPthPqwAO+4ybEpVTyDkOEaZzgzIaA91VCtlxUy9z0dpRzM/VY7UAzDamdb1YgS9G38APfwMF/D6pFOrxIObbWY0fRk3DRSnLPmexZ/CI8J3ya1+5NMbDegfwciOv2t0yO1yS2CuxB7sIgoFnUCgHrCvDh/w/RFjIcToxGDZWDZDY8VavwxNhC52ZEA8T9AsKV2NDXYtbTiCl59zcysAR1B4vMD5fs95LzHjzD52CRyWJtmXXME3JiILALIBN7+6qDRpxYyXXlAAvsfPwJzoeuW49EOX4Yvr9mEEsjYOz5u6juifFQXLIVzjDpDB82nRB/RHT7VBrR/KrlCUfWeal8AwNG3VURMb93qyy6/eLH/T+8QtYjaGaPaQ4pRc75E8tZCl8KNI57CWqYME0CrP7urx2N9jEj9CZJZsy45mDqZxvWwJYSuM7C0aJdOanvyiVEBgNvJKxkc4uGc27r1h2grVcNjKepx8W2sv2ln/cB5A/VZQv0lfky5riL2hb1t/sTw6G1TOLr5aKRm7Ck0NbbV7NTk9zrXXMUyfQI6gYKyXgmqR+yBdqH0bfngEGblfZbuGHZnqu4ANkElVpoksSalSUmsxZs3nviVUqGuWMozg=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: rDmhCT/XPrC9V/Ocxt0E7FgIHsLgpc0Ixtd45L4dqbY3fDlYA/zFIn6ikw2I7oe05DW6Y9eDuaTfv5zWpZxYxKuW1cZTSjxyUb5zcymQ/iqnpxi+yjrnZN11KRIOxOR96qBb86rjMRHJRSDie0DtGYobSuxc2Ht6M3jLG0wx2lIkuYM/NMs8iBTsksd2jsZp4gsNBuXIGhfmrWYB4XtYjJFDJPpuo06YCCKAdObFDI52F0bJat2B8ZiQz+RfzNep1RvkvYaDlv8BXze62+zAbtwdhkcXxG7zGUjTvw9JjpE1gQ8pU4ptEsHCZCSxp+kb5+I0QI0mslVTtlT19RVg5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7905
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 0f95f761cbd24e2dae19dee4ebf49c8a:solidrun,office365_emails,sent,inline:b9e026b2ce894d6ae84a8479915fad54
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 57bca4b5-d9ab-4d99-fc33-08de89a29cc5
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|36860700016|82310400026|1800799024|376014|14060799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: vOOe0LN8q9qBVKipxF0F2m5QmHwvqEdTvaPO16CYtwp7Q+HF5Ht9yTFRPEgVLh4KCon1fFVF2z0nZKf88X0YJ0Q2fQbbl1ML4/YJCUsKzmToEZfl8O7KQ5wj0rmb5KMmeiik+IEvuXLJmDJAYKb51Ct2uYF91QkAbvbi9zT10Z7zhNsS78SD/YQ+Ny/kcT3GEVwiNtxAjI1U1C08xUqDd8tLYknbDsFCxlp9POTKgnpAFH/XSTfn8LMWXJ6ENHHdBVnKN4aYVnsjoAdItx4B1jbmID4Ic17f02N4ssooInZmn6mFoRh9rlBQ/XsHNuShpoekkT/9yNT/S+EJecDQYAP47087d8kHXD641RTM8vCNeerk9E19Xj7FX2j98BsZlHH0XJnY01OjDMsPRD3fTkiNmaRQCa9rR/HUqMhIbuvl3ZHHHeSNA1X9ck9mNTPkbCGZunuqG+wrKWk5AXr3CFSOjImGzxGEwL5v7fRg/vBVuMJhAcX27aGMWGwYzFru7fVvksXTfx8LIT/HV1j/u6ausOvEp0rTg2fus89dD6N5ZNnniu2QR/p7+PtfCbTxasDE3LyoirfuK7WQZx3mj4T7q5zqbKtpVUH1a+DrMm9Tba0Z9M7BA3ycUubfTo8WP8iLO6Plq6IQuzl9mttxS2eTtGV2U9Kt9sGYQFW0xrLHmORCdHDL06A8edgBK2sj337hV2GfPK9TU7Nfk8338iA2mKg1UFLZlAp4NH/7MLX8gziY2w7d4pu/6pqvgx9d5Z8D/oCNN4A3s4/GB8aIfw==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700016)(82310400026)(1800799024)(376014)(14060799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yzj+4r5VA+7aXkE/jWm8T/PUi0/LC+iMmCi/HaaUmEr1aQxftT2Vgx6ZtDYg3CGIGBE4uHlusKKmawb2RUoroHScVHX+AIkUreCSbXMOpdToaVutWmbIp4pzoK4CovAXgSIQxhkCXeaJGJkYxVG60xrRcRbFReWcZO80KAxlFoJAo67xnLr4cPEetvx28HBzh00Tr/5U3Jb8JpUCwZ5TZyGKFcgcB2dgqc3HmMhG0oj+JL8ZetuuGYw3nGA76gnWVuWnmbT6bBc2RNgIeHVsNdc/Udin5RCKx3TXrtCItORaeFRn/6cZczGvayHyL41obHrtC6mBlZlAERQcM3Jbo2DHHeSxRnD2fDVn3U8JXmXKheNiXcKIFb4VtZSZmU7CzI++u8RFudTS0qL/7svi9lxZIFXZGxwS46TlMfTZGIBrzrc7tgr92qEY3zqJNvJO
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:41:38.5529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e95839-b155-413f-f26f-08de89a2b15c
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7669
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_054146_130480_EFDE55FC 
X-CRM114-Status: UNSURE (   9.90  )
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

Replace some stray zeros from decimal to hexadecimal format within
pinmux nodes.

No functional change intended.

Fixes: 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 53b9c5f1f1935..d266bf96e2c6a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -1722,7 +1722,7 @@ pinmux_i2crv: pinmux@70010012c {
 			pinctrl-single,function-mask = <0x7>;
 
 			i2c1_pins: iic2-i2c-pins {
-				pinctrl-single,bits = <0x0 0 0x7>;
+				pinctrl-single,bits = <0x0 0x0 0x7>;
 			};
 
 			gpio0_31_30_pins: iic2-gpio-pins {
@@ -1734,7 +1734,7 @@ esdhc0_cd_wp_pins: iic2-sdhc-pins {
 			};
 
 			i2c2_pins: iic3-i2c-pins {
-				pinctrl-single,bits = <0x0 0 (0x7 << 3)>;
+				pinctrl-single,bits = <0x0 0x0 (0x7 << 3)>;
 			};
 
 			gpio0_29_28_pins: iic3-gpio-pins {
@@ -1742,7 +1742,7 @@ gpio0_29_28_pins: iic3-gpio-pins {
 			};
 
 			i2c3_pins: iic4-i2c-pins {
-				pinctrl-single,bits = <0x0 0 (0x7 << 6)>;
+				pinctrl-single,bits = <0x0 0x0 (0x7 << 6)>;
 			};
 
 			gpio0_27_26_pins: iic4-gpio-pins {
@@ -1750,7 +1750,7 @@ gpio0_27_26_pins: iic4-gpio-pins {
 			};
 
 			i2c4_pins: iic5-i2c-pins {
-				pinctrl-single,bits = <0x0 0 (0x7 << 9)>;
+				pinctrl-single,bits = <0x0 0x0 (0x7 << 9)>;
 			};
 
 			gpio0_25_24_pins: iic5-gpio-pins {
@@ -1758,7 +1758,7 @@ gpio0_25_24_pins: iic5-gpio-pins {
 			};
 
 			i2c5_pins: iic6-i2c-pins {
-				pinctrl-single,bits = <0x0 0 (0x7 << 12)>;
+				pinctrl-single,bits = <0x0 0x0 (0x7 << 12)>;
 			};
 
 			gpio0_23_22_pins: iic6-gpio-pins {

-- 
2.51.0


