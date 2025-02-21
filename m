Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E99BC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 21:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMspdVUID6YpFhR6lZsL9nRqlXIvo/zWTU47664Awlc=; b=MYUdG3JVmihDUF4Mzpp/0sSDQh
	/KcwfYjxQwaZ5dkNFB+bkL145pFQoeAYTN69qcyoqjXhwrACt3yJCWAaqHnwfsy81K4ORrdqbodRf
	QKaf6Q7aOf8c1lt41DsN7MsGmiJNiZEn2Y2zTPWja4bi1AaGtjhjKpAnMx/7d+ZS+E8TcECJ9EjOy
	3ckiuqoRy5gbVjZImnoKeUzieaoNAA2fkmncrTVBgy+fHUaTeNJBPSzW1OxbcbLEQXcZvfvGlJ2gc
	TyQ0ulHroY1OrYIWe0hFsy3aKfmd+M5Lc7mCcTbM+CRBo8WkyT7XvWbwqe15zmd8cYB1rVI3f7+Qn
	ImYD02gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlaQi-00000006uFq-2Z9I;
	Fri, 21 Feb 2025 21:19:28 +0000
Received: from mail-vi1eur03on2061b.outbound.protection.outlook.com ([2a01:111:f403:260c::61b] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlaNo-00000006tpb-40eb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 21:16:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjJi9EwNVgeucL0nCaQVCEZU0FB3tagXoFaCsmP3cdDgp9664XCUZm/bE5WWXd6FdW42n7j5ylKLj9MFELWK8YErjNjgBk+AeWyas88d/A3492TO/OD6loiAVwtCwn13qyOpysKNmjlUrgeJXHuXgflec+lmRh10BFWc9S36us5E4KWPHETbzTNUQ0+SnJhEXvi+rCGrCM1/7RVgQeEyeoV+rGwxSVN/7DyjYo5VCPlrY5Ff7YLnWIncZiVVN1hCYf+h3mMguAgnsOu/VvovFvvhQdeXu5Wnf6+Tcb4BY2XEQ9mjI0RmfYRB5WGGiyzlIkzQOKiy90oIFdGVYe3BGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMspdVUID6YpFhR6lZsL9nRqlXIvo/zWTU47664Awlc=;
 b=qAqelT5Zoa9/Bwf0y4s23GpOIz2+MZcZv6ENqsazCLtjaG5l4Bc+B5H6bU1WzDOtKRA93FjgkrTYoz3GQLTWDej2j6NB0QhiczyKnMFc8l+V6Nw5aVqqYP7+mFT3BQ7xs5F+/IY2DcPwHufAMRs2bIRyO/BR9QQZW0nDrwzZDveLtyLlDLiVsSLQlt5Pq/t20zEQPsoKZTHvsKOCSofnTzw3/C/YxAExCBJdA8m9ibUodGx1i/rdCxaPGO2Z6676NQgNp+I79Ju+4aKZvZ/sssEC9ZFUrX8NQzz5ipO50C0eSxNS5cIV/DxMjFRrA0hg4kv9UtTrImOTUd87at+Rew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMspdVUID6YpFhR6lZsL9nRqlXIvo/zWTU47664Awlc=;
 b=Oy+6Mypk6hFe1HV0OGMglFtm56VGj08iLqX1TDFJcyDb8AGjhsq9CHLxIrnBrjB0C4peiflW2PCZEQZxvoSX/Y1YL8DIXAfCmO3uR27EACwUR0txQ5yW+L3gSMf7uTu4vrPMYpsCMVteMyqtZlzb9MUibz+bJasJr84uYfEASh39moPGLYuPzHKqUS95vkQ1ZZIepmsoS2YiHj9/eF8AUWlH+Trn1blwMywUsQ90AtEfhh/hRO19SLpXxjqkQULMzDGu4MXwZG4cGh0lBwAccD4Q1QM9AhYo1O+Rs1aEi4jBPas3PFO5KWPY6oUAADh00OciKg+oLqsNQegpG0Lmmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8925.eurprd04.prod.outlook.com (2603:10a6:102:20c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Fri, 21 Feb
 2025 21:16:24 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 21:16:24 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 21 Feb 2025 16:15:57 -0500
Subject: [PATCH v4 1/4] dt-bindings: arm: fsl: add i.MX95 15x15 EVK board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-imx95_15x15-v4-1-385ee8e03dfd@nxp.com>
References: <20250221-imx95_15x15-v4-0-385ee8e03dfd@nxp.com>
In-Reply-To: <20250221-imx95_15x15-v4-0-385ee8e03dfd@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740172577; l=862;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=FVvImlBnCwvuHh5+StqcL0YkcOOu0IjY04TLSO9qmJs=;
 b=v6TcNhTBjEE90D4C7YRkfyuggo+bLmqHslGGaaIBSyLoAPHFFRWvMgTWvQ86uwMpAd7lsh5K6
 5WMRnT8PHHwAie1DqR/3nYOz7+1H0OAtkYyvZvu0pfBc1LAkmG7Sfu1
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR05CA0093.namprd05.prod.outlook.com
 (2603:10b6:a03:334::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8925:EE_
X-MS-Office365-Filtering-Correlation-Id: cbdbbcff-4216-4d24-bda7-08dd52bcfeca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTRkNTl1clpnUzNBaTFkeFIwWU1qOEhNcmdqNjFOZUhIZElxekFDbS9NbER1?=
 =?utf-8?B?TS9vNlY3akNJWFBCZllUd2VDMnZsV3pBbDdGU2l1MzlEOU1aUEVzbW12Nldk?=
 =?utf-8?B?R0hRQXdMM05vWGtXdXdXenJad3FmVEdmRnBuTXVoak5xL1RMcXZZa2tpSjNl?=
 =?utf-8?B?OStrbXRmMElSZ3EveStMUFM5aGhXeWpVYlJ3WmVkMktPVHVXcHdYSXZoU0E0?=
 =?utf-8?B?OWxpRWh2MW1BZHkvWHFiMFBWSGplRFU3VjZJem5sSHJQSEpNdUhIQ1hMTU51?=
 =?utf-8?B?amNjS0M4Z3RhSVgvajlBQThrMEFyWEc1djdHYytQV1pOTGQyUWtNK3UvMFAr?=
 =?utf-8?B?SmdtNytyRnZVOG5UaFY3MkYwSDBra0JodlJVMFBOZ1ZnSHhacDkyelo2Tkk4?=
 =?utf-8?B?TUcycHA0U2kvZG1xNndjQVZuVGJwL29vZzV0VlZoajhsZ3RFM09qekRNNklO?=
 =?utf-8?B?RFRWZ2tIOHhDNzVVdXRRczZWY0JpalozeWtZSFhRODNzS3pseFg3RzhVYXBh?=
 =?utf-8?B?S0V1TG52Tm0rb3g4aUwwYkZoNGY0cVYrREREOStzZ3Q4MjlBWldMSWlBeHFX?=
 =?utf-8?B?dmpYTG1QZ01ML2psL3k4bFdlMmF0dEc0Mm80VjlDZGV0a3lrTXJ0bTlKYlhD?=
 =?utf-8?B?ekNKRmFuajc3dVFEcG00KzdIVGVQRno5c3A2QWw3NTNGaW11d1JMODRpdnlk?=
 =?utf-8?B?eEdheGxRd1hlNmo2dVdWTDZqQnJ0aVJiNXZqT2d4WEJBMGd2aGhIWEpuSGpu?=
 =?utf-8?B?YmdDYUdZcDc2RWUrNHFNNlY0bUtUQ0MrZzByN1dDdDVKSENHUWJYRk9xeFZK?=
 =?utf-8?B?WFBQL1owQnorZTd0Sy8wakdWWTVmVThNVDVVQzFwVUVMZnNWT1krdE9FQ0pT?=
 =?utf-8?B?NHhFSnNIMnB5YWo5LzNNOXNlSWtMZlliRWxRZDZOUXplenkwaTZNdTh2OFA1?=
 =?utf-8?B?Mit4bUFoY0RPUWczSTRRNWhHOS9ZUkZ1L01uSWtvcUQxUlpYYzQrRDRFNWJt?=
 =?utf-8?B?SmFxQUdFbS94SFhzMjR4bUZlWUg0eFdrQ0FsZm92QjRLcHFGaGZLK3RQeTBF?=
 =?utf-8?B?TEN4NDFMbnJadFE3NnNRd0I0Vkx2cW1EdElOOW1pa0REWXRGaEMyb3V4dWZ3?=
 =?utf-8?B?M3VXL1BJeDlHYS95VWxVMEswRVJDTW40R3BJNUxWUmhPK2pOVmN6dHVCVVNq?=
 =?utf-8?B?SG11cHVpWGZGZnlyYTBQeUVSdzdiUVcwOEtSQkwyM2E2THo0MnR4bktnS0hY?=
 =?utf-8?B?c3J4OTJDeDN6NzJsdXMzRlg0RUc4VXd0OEwrMnZSSjVheU1ZOFBici92WkVv?=
 =?utf-8?B?ajNsSzh3QTkya05HMmxEdVlhdnFOaGszNEdXdmdTWG9wWGw0VmJWSWVYekZj?=
 =?utf-8?B?Q3RubkVLOFlnNGhJVGhUSjNXb05TSTlHbnYzOGR0SGJZTDB1cmE0aFJ6ejk3?=
 =?utf-8?B?MXNXYXVlbThVbTRSOVhGRkxCcituL3RUR2c3eGZFTWNDcHhUbEpTcEE0REFk?=
 =?utf-8?B?eDF3cFB0U0Y4a2FnRWdyMERHcW9mTm1XK2wzeHFVQzNGSEFoNitwVytQRWUx?=
 =?utf-8?B?bFB5UDV3N00reVFZT3ExdDZtZWg0cmJoSlJQeVBQejh0UGRKYzluTStyVFRV?=
 =?utf-8?B?c0JlQ2xOcEU5QTNwVUFaemxHcXA2cmh0dFZMSWdnelM4djNUMi9PSVJEbjFU?=
 =?utf-8?B?WVJvVkljWDdraVdBMHdySjlXRUI0a3RnbGtPZHVmYTZxNDlqYWtBaVc1VjlF?=
 =?utf-8?B?NHFQZlEva0FlNSs3UFArUVVIanh0V0lNcFRHMW5jY0ZIUGhaV2RFZE1oN1A5?=
 =?utf-8?B?N3RvY25RKy9mZlo5VTdQV3BmR3RsRXFqZ0FLbERDSmtDaTVvQ1FWT3A3Z2ZO?=
 =?utf-8?B?YzNXTmUwSXc2LzFOUXVjYzVaaVorYTF1amwvdXhzeG1uUm1SNVZvRmR0K1Jh?=
 =?utf-8?Q?TT6uuFsifRns9f55D3+W4bnx2wsispWH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2ROUkdDSVg1elBiYS80TlF5bnpBQkVadzE2dWN6cG1mdWJoRXIrQUgvQUYz?=
 =?utf-8?B?YkErcDF3aE5ja1h4L1ZvWk94TGZkeER2R0hPTGZoVHdJd29EdU8xbHJneWFi?=
 =?utf-8?B?QitacVNCMVp5NDl1dEZDenc2SkROZkJaKzA2NStnQ1FOTHUyU1JDdlpsRjE4?=
 =?utf-8?B?RjZkQnhhcllUd2IvY3l4WC9UWWxPaDJUUFJHelF3cmdzd0FmZHpyT2ZLSld3?=
 =?utf-8?B?bW11VG9XcGwxamU5ZmlBVnhCQVpOWk0wNnlBK243b1dQaU9yYjF1QnpNN1Ev?=
 =?utf-8?B?M041MjF1ak42MjlEWWkrRjZ5bDBZMC9ZbW5XZ2ExVzdUdGpsQm5hR2ZKMlRI?=
 =?utf-8?B?S0lFNm9LY1NUbyt2aGt6VHBQS051VVhBekxlSjZaS0hlVzdHTkxxc2IrSFNo?=
 =?utf-8?B?bXd3UkUvTVpmeDRIOWk0WEtUWVRCNE00ZGFWYkxwN3NvU0VpUmNDZ0dQT2Zy?=
 =?utf-8?B?Smc4K0pjOFJYTndVc3FHU1VPVGZHUUZkR1FoWWhPNDFKYy9GUDZtRXY5Y0Za?=
 =?utf-8?B?elNTN3VwRTRjMERFTkRlNXV6L2pIOUxHbWRBWHc0UU5BUEE4cmFjNEJlMG1F?=
 =?utf-8?B?clppZ21Yd01PNWFzSnVhNFVSUGUzU1FxN0llQ3M1bVorak5OMEZzSzFBeUQx?=
 =?utf-8?B?MFdsenI3NXFXeFl6Q1ZCR0RrM212ZXRnL2ZudXJNRUMvNE1WeSt5cWRCT1JU?=
 =?utf-8?B?alZOUFlUMm9ld1NlR3VOZEwyS0VDZkROZ3JiZGdLSE9yUzQwVkJtOEVaMTQ5?=
 =?utf-8?B?aFBNeHlHNjg5ZGNCMk0rTGdiMjBIK09BMHVneHdobzZYeU11UWVHanR2c1RF?=
 =?utf-8?B?dTF6Wk5CUUpBeWZxL3JhQzZjVjVBN3d3TDkzQXE3NGEvZ2xaVi9MbHRZYk9T?=
 =?utf-8?B?dmVYdmIxZ2ltTk1LMTg2L2MySWJ3Mm10ZjVHNmN3cEtHa1JkVEhtamlOVysx?=
 =?utf-8?B?YzN6eTRQN0ZSd0h5T0FoWWVSVS9DaXNMOFp5aXg5M0l2WjRYQzExcVg1NEpQ?=
 =?utf-8?B?WVAzZzhmSER6Y2J2ME9MK2Vwbm9UaVViblcyeGU5YTd3NzQzOTlhOGhjaDFM?=
 =?utf-8?B?WGUxQnFVemxBM3FIV2h1cGlUdjBoYzd1T0RrQkNEZXcvaEpFdUlWaitXb0Ey?=
 =?utf-8?B?QjlhZ0RRTFRHMFplODZkai9Gcm5RNlY0Lzd2T2U1aEg2Nm8vYjBKSENNeERx?=
 =?utf-8?B?N3FhUVYwK0NvUlBtc25vUUUrcmlCb0k1RDUvT21QNEhMdzNqd1lEL2ZxeUd6?=
 =?utf-8?B?aVNvaVNXVDhaSk9LNkhlNmRYV3V6bmtCbERiYjd1RXVxZld6UlV1bkhTVDc2?=
 =?utf-8?B?cDA0S0U2WlZLV1huZmxITDdTR1YrdFlBSERHWXhrbmd1OVIySDYwQlN4cEJx?=
 =?utf-8?B?ampVZjN5RzcvR3UxTXhrYUNXRzIzeWRPbE9oOFRMaVBTU1JJQ1BtNmFvUHk1?=
 =?utf-8?B?czZZQ0M0b24xSkk2MGg5RCtjU0tSRXk2U3kwbHpqcXY3WkpUVkttek1PemVn?=
 =?utf-8?B?MFQrdTFFNFRNZ3ZZWmNZL05JZXZXVUFpTlNkS3Y0SGxtRHMzdFF3dVUxaXh0?=
 =?utf-8?B?LzR0cnVYT3ZtR05TS2xoUWNjQjhmMDNST09SejZDSmwrbTJVbElEamcyYlQ1?=
 =?utf-8?B?RXNrVU56aDZyZ2NTekxBUFdzeC9xSlhoT2VzeUQxMWpNZkpMdWg3bXJERWtj?=
 =?utf-8?B?d2RhT0R1bFFPbGY1V3hNeDdPQ2lQN1NhVjJkWGt2eHpOT1NzRHNOMi80WSs5?=
 =?utf-8?B?d2NGK2VtZ1FtUFpnc24vYzY3ZC91ZGNIeVlUdkFMZCtxb0JhckFFdG81RVpy?=
 =?utf-8?B?V1dSaGcvbjhkQ05WOXhvR2VxNGUrTEZNTTZKRnMyK1UzLzhPck95VEJRcGU1?=
 =?utf-8?B?SGdZd0pKekpWd04zVHhqRysrSkhyeEk0UlJFb2NaU1c3RW1MYXFmRHMydHdS?=
 =?utf-8?B?OEFiakhNT21ublBSaDFobWxrVmJCU2IvTjJyNlN5cGh0cTFBVzd3NE1OY2k1?=
 =?utf-8?B?V3BLSkNISnZMS1dyQXNrWXRoQytKUXhqd1R0L244LzFZd2xKRFZTNndITDdq?=
 =?utf-8?B?U2NvNWszQnhrZmpsUWdUYVFCOWF0RHNPZE1yc0xndUhwV2tMMElXeldBN3VL?=
 =?utf-8?Q?HgBuJgJdaPwhzE8u9T1/7Elos?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbdbbcff-4216-4d24-bda7-08dd52bcfeca
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 21:16:23.9692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YV4Z6bF1VIG8FxpxDNUsQ/NziHSy6kY5TVmb1JqIQ9+GEWJatQGt8sUkwgdvZcmYW9N6jL8bt8Jh7wRtthg67g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8925
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_131628_989129_3020AC97 
X-CRM114-Status: UNSURE (   8.68  )
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

Add DT compatible string for NXP i.MX95 15x15 EVK board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index db781d3156981..a3a0d8a0e1296 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1356,6 +1356,7 @@ properties:
       - description: i.MX95 based Boards
         items:
           - enum:
+              - fsl,imx95-15x15-evk       # i.MX95 15x15 EVK Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
           - const: fsl,imx95
 

-- 
2.34.1


