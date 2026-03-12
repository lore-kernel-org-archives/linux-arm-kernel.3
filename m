Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C38106ACDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FN0iLvgqSyaZiDl0c3ZhPpZly7Om5f6dGlIUMbmjzk0=; b=QWyCd2RSJAuarOAqdjz5YCOncU
	rLJRtJuVLhSKEnua4lTjoTJrXNy01iMJRubGKsoyqPUgOxn/ZIFJ5cMmFk1iANbBPLH9g57qptT/L
	uMcNIY2rBoxlW5wPZ3mGwFqScmX2T3+Qxlhro5tRXy+n+ZwAtFBh76Kn4ZlIUG7YAOGBMkJBDUZtr
	U1MpAS+WXgmyqXwJAwq8qPTBDre1UQk+kOH67Oh8SnUqiwrAaPULo8n+Ly4vQEtzdjqc3jxtYi+Go
	m1pxYGAXTReY17d6WpLU97GAm+EPlUEfR1aOtttwZ/fEJ7HZ5W5T7xkAEkNgPkO+VWJ+4r3G+G4zb
	22ab7o/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYy-0000000F42X-2C75;
	Thu, 12 Mar 2026 19:19:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYw-0000000F400-3dYz;
	Thu, 12 Mar 2026 19:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FN0iLvgqSyaZiDl0c3ZhPpZly7Om5f6dGlIUMbmjzk0=; b=Rjyu4ApzIxwhbYaBKr9aLMN4mW
	wTQ5fY8ljYeOKQc85LselN817PPUcLQiZnw97paxa4NL5iWGghfHegh39Deoj+qWIq2HdAv8sAMfH
	IcT17lT5ywum3IO3s5G2+QJvj9/NtREj4AT7qGXtcmb1Tw5DMZQqeaDUTXFoJIIC55JdndywOcrrG
	sYypCCcg+6yLStBRJbTcEtHOMkVFumuTUtQK9Q6sPq49nYZsfMmZvqgWAjw170kHjPYvcXcj1UHEJ
	aRyi0B6j9b/cGT2ha/Jzw4IDlAkQXOgpJN66Y7aNCZlFWvC4KO7wHGGxMGk/bkxkit1waypSaE7lH
	gZ3B46Bw==;
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYp-00000001rHE-2ImK;
	Thu, 12 Mar 2026 19:19:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCUFLp1CvJedzR4MwF9yFcypz3w/fRljMwPR99hW+f+U7XDRkZ6FpiKgGBxYxa2pWSEddIK1XwqGtuXqESYN7MYtojSFVa8sI4wl3ZVfPHTTGe9WQROeDrfL0N0MiC4URoME16Nkw9y1K1jkQgbhuj/kiUZh1fp3iNj11J+v5yVgzslCJ/Y1eiWChStqTWHP3jI3V/qYxSNrZVoyfhOfE0WpzEgFigEH2TgIjfvtYdcWwnVFbYqClEeLac9k1UeunXcC+7B+U2/hUErxk6lzD9H53IDN72KTuD7tIXQqlUrHUELxyea0yR5F+XbECB6b0f82KNYX1o7eQ6Uj5qy1lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FN0iLvgqSyaZiDl0c3ZhPpZly7Om5f6dGlIUMbmjzk0=;
 b=nYmrgWbeDOnanGnfeKHbiE/oFq4QPy4UnfpuWtGbj2D6s+0mma0d7BMz0cPWkasqhsyFS73mbGe40RvDqOdBmy0+wTc1NnJBak7zgkPYGiNGdeXnrlewxV49vr+VBuvgbPRzWUrBbB88pqfIIja0Dyk+mAY4/HkzrgFzlCrsI+Zjbg90zCWSJ875lGBhMlIyoIwMrA5fRNvkBblaAAtwH7p/0gNKByMyfGlyJmdjsMxQqgrmk2/GSu1VcEHvyEaeBp9BBPZHkUxuiNspCo6cfW++U6E67WRHQuCHivZbFmTYF4Z+u+lc6zhtHSSyE5fK4Nv/hn4TSBL8ns57c+wSjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FN0iLvgqSyaZiDl0c3ZhPpZly7Om5f6dGlIUMbmjzk0=;
 b=QrxtgTzx0Cnj8qBJ1Q2jyXHdsGOnSCKfICLEb97i7JpV7WR/GcJ5+aNaFRkj/0gZNPuVOb3w+ep0UKEpF5FWgyrDHs/tQvhcG70SBi4l6n17vEXi1YSI2jnF4sVodag1NA61iAP0dPxSXJY3DMzKOCD7xJ3eGOKZGtIU4nvlTj8x7ivoKd1GWPVxw1/cyew4sMnuVBeob5+ghUTw9kxI2vuJzhRDnLkq9w5tjNmv/GQ9ZH00OV3yveHgmQj+EFuh5mOBee9ERw9KB8DzHYAu6KdTZA+vNk7G8przGn6shkaDZif30Ac3CZax0XvfvkuDYzfh/9Yav50EnbVl+OY9oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9124.eurprd04.prod.outlook.com (2603:10a6:102:22f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 19:19:01 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 19:19:01 +0000
From: Frank Li <Frank.Li@nxp.com>
To: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	broonie@kernel.org
Cc: Frank Li <frank.li@nxp.com>,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH 13/17] spi: stm32: Use helper function devm_clk_get_enabled()
Date: Thu, 12 Mar 2026 15:18:47 -0400
Message-ID: <20260312191849.3483369-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d239cda51bb3dcc84da4a7194a30f3be82422f70.1773306858.git.xiaopei01@kylinos.cn>
References: <d239cda51bb3dcc84da4a7194a30f3be82422f70.1773306858.git.xiaopei01@kylinos.cn>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0050.namprd11.prod.outlook.com
 (2603:10b6:806:d0::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9124:EE_
X-MS-Office365-Filtering-Correlation-Id: cafe27e4-5d9f-4509-b351-08de806c3757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|52116014|38350700014|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3aEIg0x714ONy/TGnss+dpNElwUBDBOtqtjeVADmFEq4l2NmUWF0QuFTOp25HCtLDclVsqiZtduHVdhyrUSEr3xKmoo/eLTv86w4eLVq7zDhwKeA3mqX7vKmHS6yMcfz58ustb6/IpI56s/28yE8/r1TFJVZgRh0BWwhzPjxY0DIrm26HcPxKlH9v3SUh/4Lzed8XUJiJkQ8TemnhEttYpclV9ibjW/iY4JkZxzKpuonSXPdsxJbGePB4tEO0FI9CYD1zY4br4prOKCM9V46mFGLYcuscnceOPkri1RM3YTPJ+1rg9s9OSO58Ke21bcoMZBA0HMSG0xK3BXBbkDiANdvSxLye8ruSZ5q00Q/E8grzKI3n2j5Tc+QpF9hkb8PrIbvPguody9XOSQxgpcyOMpmv8BdeLFXgqXTUQUC9anMDKus3lVsa7d4vjO5zDnz0kxdh4UoMseunbkYujGHfC9z7Biowl7mk8E3PQIr6+LxbmarNSrLCTEn2YuGGEoAPZULSCcLJRVa5NS+jzed6v2HR1pnSjSP6vbbkIphm3RGbrUXLJNRe/4DIDHRCHlxObaBr64rUHh4nm/sCON0yyQ5cMVddXF6+glzHo1uaiPONNkSJKRkQCV2T7YlrlOc/ey3op/gc7cp9d4o3wuTFBzvnw0dAlYNIbQE6UlM8ar5FVMpP5qwRENJd82JzOkgBph+SGiW3pFjnPaC+Dhl0E2AXQgSjLRQCho4qkWlZ120ycbmRajd8o3h2mkS/Nnuk323fi7fXOMCRuvUvJVwzTvFnkTmPU4sla0HY1PoPFtzG1gCb0g9UUtlGp2kK1es
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tW+A9EX5RZ5EsqzQUPb05l1LZf2iFbW9gwYEfg3lDMd0RF0RhGMDnR1ezXae?=
 =?us-ascii?Q?V3pY3SBygXvaXs663Rjs6TLluyjyi1M7/zLWwYKy16FHMBpznQ57QaLsK7+w?=
 =?us-ascii?Q?QuDBU/wG1RLyrH+HjRtYdTRC9iD9SpALFwEP/DQ98HTqYNvzsWDT+SOsgQjc?=
 =?us-ascii?Q?KCGau/PTBaKVI+vmdp2ugichMSpsUNtPHlsHMwD9Ej4bPFwDP9QRScRQ5v3Z?=
 =?us-ascii?Q?QEEato9CO/gOgWoG1Jwzwd/imbBt6jqOouC/OeiFKynQuMATpoYGFhZUO05W?=
 =?us-ascii?Q?EtPbzNhc4HfRAG3Yv/YCwgVwq4Pz1RozCupHlRKp83+de55oSb2UqRwP7uAL?=
 =?us-ascii?Q?rEA4YuixPVMRP90KuyRjav6HiOcUfcU+4hwuIxqTO31dKDaGcH9e1qFlrdlc?=
 =?us-ascii?Q?EosJ6jWv08/KRfZU8jHCfww6gnUpLfmkd8xeOjWHeJJdVifri9/FEluMBQPn?=
 =?us-ascii?Q?c4n7+mIzTI/tfDiMceK3QFlqIbqIaZKHGXq7wXRkwcmCKqItw+R69fSO8R2O?=
 =?us-ascii?Q?3DnEGjVCp2tkQma+fkOkwLmnxuxkE1NkFLvT7B4/zDI2kVBtROx8CapZf5ZR?=
 =?us-ascii?Q?RhYNqPaxu36JtgsPz3hotwDA1VjABGFEl3Uc1yw2FyHysXX6+WpOWFXqT7mn?=
 =?us-ascii?Q?a8pul+rLAM8whnAzcHRI7+TVbe21MeMpdqxuU4wjK5X2b6kGW8dYwBDku9kF?=
 =?us-ascii?Q?83nniHbh0YQet6lMfRKAeYhTm78Nv6YogMreyUNdbQ2OfFZb2XyflL8W8ZDF?=
 =?us-ascii?Q?TASs9owrvQ0r89+sQ1owEqR/qDF9293ZGNlu74isQh5mUI1s/h9/vZHhB9mp?=
 =?us-ascii?Q?ybuG4pjXngaPao0OEwdhitUUARggDJmI8P7lNei4DKNi7Ou+dEWev5kOG4/E?=
 =?us-ascii?Q?q3DLT+XZMmTdWsPs9xPhYY8u3YiiqzrVVHdFfVGADWwhS7/1lDCggtsoPG7U?=
 =?us-ascii?Q?1Hz5YS8s/jVwnT3bnG+3sW22Gh9O54upq9aCxP5B/CfIq9NF0280dXlUNGuL?=
 =?us-ascii?Q?WYWi5PfQX3POpWT81ltQIJ/4eFBbLZK7FD6klSxpBC/xurtzJ6J1TZs+PFkm?=
 =?us-ascii?Q?qIkVw55NSTXRQ41MWOHZJBioAko0F9D5GiP+FK6x+lkyC000UgzUE5U8Vof8?=
 =?us-ascii?Q?rLSZic0DR2UITPOjZkioBz9SV5gNSjfryJJuZGQU5hw3HFFgvWN7vOz6AmXf?=
 =?us-ascii?Q?eDmDOPTKxgCDllAjvos7ZX1g5/TiehY29vHMgR4s+UhVKJgJun/TLMziugx5?=
 =?us-ascii?Q?hcfT4C88eU7DS9zJFP0EjKWITniDL3QuB4+5/iE3GArHJSuvgFXpLVCnR9s/?=
 =?us-ascii?Q?2iPf9AALVoMQAhXrXY+e2aH3VJC3ELFeYXKnLA46WlXcl8ZwkqN6/Bzi7bOi?=
 =?us-ascii?Q?Cdzzi2+LAjjimV3er1LEK3/S0ySXb/NmWnn9oMPd3eTNrqtN+ITImWnp2Wex?=
 =?us-ascii?Q?asXFG7/5ILsiUszPCAsIvj4rggy04hqD0xrP+Mv5HKpa1mbEXuYTa/dYsxZj?=
 =?us-ascii?Q?GjUWUOtcqr7F6q3lMLhYTKebtI/xTQ1wk90AX6/eJk3jo6x8aMQ5DXaEoSPb?=
 =?us-ascii?Q?sIgUhsFaiKyoR4jsH8bq61PuwAIguf4b8txUQKFIV8QBUu7jY8a7qDZa0p2m?=
 =?us-ascii?Q?urGnCJWXNXBBBJGiHpDANAesntuofba0atN0wUIerSsMldX5c2N2jYEomY6S?=
 =?us-ascii?Q?w3mjHjZPQ3p4xJpr+P9ps7EvbJk3Hx9LkvwWgKxqDU8KHa0j?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cafe27e4-5d9f-4509-b351-08de806c3757
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 19:19:01.2102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLSmNN5PTAZaNj78b1rum8bHuxMH5RZQei+ffR0AoGypPT06GaMvb9FJFI7l0IQ8+Rgq9MqW5ibtnVrP+DxCzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_191907_653025_54A4AB09 
X-CRM114-Status: UNSURE (   5.99  )
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

From: Frank Li (AI-BOT) <frank.li@nxp.com>

> +	spi->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(spi->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(spi->clk), "clk get failed: %d\n", ret);

AI: Bug: format string references undefined variable 'ret'. Should use
PTR_ERR(spi->clk) directly or remove the %d format specifier.

> +	if (ret)
> +		return dev_err_probe(&pdev->dev, "controller configuration
> +				     failed: %d\n", ret);

AI: Missing error code argument to dev_err_probe(). Should be:
return dev_err_probe(&pdev->dev, ret, "controller configuration failed\n");

Frank

