Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B0DCD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 13:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zpv2TmTzdFxNvV/Syz0JHeH3XKDxENYLHHPlZ6j+hVc=; b=huhzdMVmsXvpd+NoQVIjucaMkw
	lRSUwylwN8Xs3qg9anebTrQ/2udbiXHtiiZwaLS6uio+znB84hvcAAHg1tUxCB1M9l38tRy4IVOSR
	a8D2LP6sTvquWVIUngQqk0rHlNRHceabolnha1qnnf+/YYH9XQyenkY5IrdGmdLsh/J7ftK4c64J5
	KnGeN8g0geqQvHMWzOmke/uanEPTgs+7jIZNB7EzBgWcPOh7X/SbBIs04oPO4B4QQrlNZEOTImI6G
	FzbH4TRcn2SwmeYHFqIT0Vp7SWSyIUJyCgeQSOADm+UFEb5NZSWsUMJr8f5r+C1V9v+9G08oPSxsO
	ZO6S+NWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIsn-00000007lJY-1Sl1;
	Wed, 10 Jun 2026 13:22:13 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIsl-00000007lFm-15Kk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 13:22:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kaYW5GjIbA23TG3NSy+wN7UlKxm2cYOZ8PosBkv88paWJruBWsYmXdF3XrXmo1npYlb5zk4DuG8+rLUZrKSoeI+nI9ulhkIDGaQ8HjHZxtvIZz5cWxpfEHh0CAts6WuxH5Kd3rSQmHtW1yTL5zGQqIR1KxowvzFmTksYb9WI7kqw/69D05+4OhtHK2M4jf0HvkTtHGsmdWYvvViLzDzh/dA9mqfylD/eMDTdtIfFe8wkV5JC295Ex0Gz/pqYNt/NwSUU84KVPNkd3rlMtUNCfdptkaXTGksZOprKLvlluNeCu+LVFMP9BVkWLabC9QBFgLAlHwnOy1nCuv0tv3yWxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zpv2TmTzdFxNvV/Syz0JHeH3XKDxENYLHHPlZ6j+hVc=;
 b=d+fruV+XkPDqNiLfY3jlRtBiQHRds+TYRNm5tRpx081M9/da2ienxvInCrvCAcvv8YJFw5WNV/lh/YJXAXzr3Boj2FsldwcVFPdC04ok8IUNTFJHuxSyM4M0zC8mR4urlhdSy2HcaQ0IU53ZhEOJ11QdCtpfFG1ahPZmu8BI+TDa5SbzmSlmJ27Lhz7kH23Y7tv/P23oVsX0ZjNWS9AMZPLz8BbH2kGf66a8MQ4Ist06F6YHRQDK5YXa0hYEMf4jrghzUOR5aK1gZk3ahzBIGpag3lJse9d+Wsg+2C3ZCJrBKq1p+Xe4KrbP3hZo3634tPnLiauhPuAlIVSUweDkYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zpv2TmTzdFxNvV/Syz0JHeH3XKDxENYLHHPlZ6j+hVc=;
 b=OYbYfqv89dgfpdpBZnu1aRu1ytizvdfHqLikw+ZTg2nL0Q+Lk7kOOV7wzsBQ+8jclIyrzJWkb/aTcyVnMSaidl7DkC397S8vbbqgbzGSl59rxer5UXEWs4ZV4+JGKIL/vfNUA4+8CB1LSAqRIvXEDwXh5WIeKIvh9Rgx4lBtdfQduSrytxSVHnMe87wIsvgwdjUtltLNbtksyNiDf2ufOQucJAXM6I69yMw22ff4URv7QZswqR143VYaVlQgnUnCg7Plafyw66avwrhtEd4cJLy3TLSh27a59q7MCGF7zAn8mfmdmjW7sMnXshwcKcrYHAYibPT1SN+Jtqodygz//w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by DU0PR04MB9658.eurprd04.prod.outlook.com (2603:10a6:10:31f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 13:22:03 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 13:22:02 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v4 0/2] pmdomain: imx: Fix i.MX8MP VC8000E power up
 sequence
Date: Wed, 10 Jun 2026 22:39:09 +0800
Message-Id: <20260610-b4-imx8mp-vc8000e-pm-v4-1-v4-0-ea58ce929c84@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA13KWoC/yXMQQqDMBBA0avIrB0YJdroVaQLE6ftFKIhsUEQ7
 260y7f4f4fIQThCX+wQOEmUZc5QZQH2M85vRpmyoaa6pbYiNArFbdp5TFYTEaN3mBRWOHYPbRT
 ZppsIcu8Dv2S738Pz7/gzX7brNYTjOAH7XmqjfQAAAA==
X-Change-ID: 20260610-b4-imx8mp-vc8000e-pm-v4-1-a978b40c59d0
To: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::12) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|DU0PR04MB9658:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d824f8a-a8e4-434b-71c1-08dec6f34275
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|52116014|1800799024|38350700014|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 5Sg0Kp9dMfdG1TyU3ywxv6rK0SUP5vD7TIXq5WtD52p9GM8HWwNNnFPj5F5e+6CQcw11tCBVzaO22sgIFFvYD56nneq8FW0SdxSa2j4znjc7Lr5oXiSKRUtGxLI1D+ls924Rg/l+UunZlntWxUAHHpyLehqR0nvf+8VW58cCtCaQ3dYBxq79p3ZfJCInMt5unpOAm6h0BJuhYoSdU2eboHxXweQKMiFxoXL0EyFioSmiEz1+S+zy0RP4VCWHwDndPnZ2aV/phKyTBPzqiFyzSoX8jahvqHUy9eFVfvcXv7XltbhL6ZQ6mh6qG6xfCK1r2ujPV0DlHFUEVOsO05lslVB9nd6IaGPwYPdU/mxRNrf80oLhssL7YDxFOcRs7QZXBUF9ikt9Y8pznmmMf9X5RUKEYvgSE1VgoJEuwGsbObVvCOpJu1j8iIjIuX6MoZ5IgxJrLq0Jpa+X/4n9l4VyxJ5PA5kBNE0JBm5eKUaHf+9tOvwTZsvrklwpnUAsBOwXPOCS7K9/FRhWxKgfy1n4cw0AoBlLYulta0UD/rdITECN8TeUhnUhlfFOJvPv4xOdZQTilMOgPchDZP3NkMi3tsAR38pqoM8VqxE6fmWi/MbiJVWiRo7ewwQYH2W55nFwHMHsAwMbOhNpwqrHW7+B2ObjRy1sya9qgh5eVzS9WFs89GBPBTC3ysQDvSJaGeWsgfkTJAoRNQbFhyk+ca2GIqBZzYlAbpds6uqOWyOB/etb/q288YxDro28QTYFvCfd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(52116014)(1800799024)(38350700014)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck1VWE9SUnN3QXpwazl5MUV5UlVYMTIra2hHZDBRUUhZaG05Ny9sQkVmMS9C?=
 =?utf-8?B?Ly82b2tidkFMV21rODlLcUsyNTZHQXQ2RFlSb1doeGN4QUxqakk4dVFIb1BD?=
 =?utf-8?B?Mm5zRzh4UW9uSkdISGdvbFJrT1N4ZEV5WHF1a1UyRC9JVGVGZFY2UFNPM09I?=
 =?utf-8?B?MmNuN1RyeDFrbXdzQ3c4UjNmbFhrK0ZQTGFLTmg1Zk02eGpOTTVrSnd1Qkg4?=
 =?utf-8?B?aVN0NW1TeG5XOG8zRkcwN0lHOVB2KytxbE1ndFFHeHFNdXN1SHg3aGp1NXNB?=
 =?utf-8?B?eWVEbmxWQmZ3bEdzREhmQ0tXektVNTVVODR2NFgwWEJ4RndvQ01Nb0tMSmFl?=
 =?utf-8?B?MUdQWjNuL3YxdDZuSk1mdmNXd3cxRUFhMXlKek1RVm5HTVFhMC91ei8vVGVE?=
 =?utf-8?B?MjJBUGRmUnlKUWgzQytiTjV5Y2R6cWlVZ1dnU1N4Z29zWlloRTh6aDlvK0J1?=
 =?utf-8?B?c2tiUFpzNTNCbnhrRWtXYWFpcUFEUUZnUmZuZm8rREJqTldhNEkxc2VRYm12?=
 =?utf-8?B?SS9qMlJyRDl3alczNkE4R1dOMHdpa0xuMUZaVGpLTkJlRXBFOTZFR3IvMDBD?=
 =?utf-8?B?QXQzQ2dCUjJmQXJteURUdUw5dkxrdENqNlpWZFBlRThMaGRSQW45THlKMEt1?=
 =?utf-8?B?b28rUU0rdjFneEF2ZWV4TUJYMW40RHBqOFFwSThKd2dtWUpJNGd3Q2QydC96?=
 =?utf-8?B?b0l2alN5enFQMDc0UmtFZCtuRjViNXBIVzV0N25oREhuL3U3R1p4S3JHQ2s2?=
 =?utf-8?B?dFJmOWFpTEVXS2JlWmY5Qlo5ZldtOUdUTVNaYktoTU1NaHRNQ05Jam1OYjJG?=
 =?utf-8?B?N0xxc0NuQlY0NTFqNzFMSDVqb3lzRlBBTEFNT1RVREx2S1VoMURKT1N1NFFT?=
 =?utf-8?B?cWRCeWx6VXJyU2dqNFVyR1IyZXZqbmVLQW16NGU3OUZPaDA4cGhuRTVjZ01F?=
 =?utf-8?B?RjlXM3NGclU1OTlCeVBDYVRWNzdwWW1hbmQwbGxTbDc1TWlFYzZFSGZ4MkxY?=
 =?utf-8?B?dGNDRjg2ZmhFTDFjaW5RWjZhV2NFaWxVSW9tNGZMUU5KeFRaSDhLdDBSeGJM?=
 =?utf-8?B?eUJvSHZwT2JkYzQvYjNzdGFSMk1nT1hGTmtUYnpYb3dlN29IUTdPVGVRQ1U0?=
 =?utf-8?B?dDdXZjY0cmY1MXFvZ214T0R2RzVUM1JZSFFPU0VOYlp4a2ZBeTJ3Y0RvNVRh?=
 =?utf-8?B?UG5TTmhHS1FDVG83ZHNQN3RtdjJ3UERkZUM3R3RPQlpZV3lYdldBcGhFYXN4?=
 =?utf-8?B?eEUrdXpmVzcybkhoMnRYeUovNEI3WitQay9NOTJEMUd5dmx0VlVWTVhXOWt6?=
 =?utf-8?B?dCtBL1krQ1VTcTVGQTIwUFF0UXRaTDlpMU9Jak5MeXFRbW8zcytBMkdMbDZW?=
 =?utf-8?B?OUY1YTJkNjRWQXB1M3RZUEM4QVVrMFloZDNDcFB3bmtCeTZ4UTNralBEQXMz?=
 =?utf-8?B?aENkdEFIQ0xuTWlDelBTS2ppV0owQzI3YWIwbWFCSU9Wdm9QQU0xQ0JVTWhT?=
 =?utf-8?B?TDJKSWNGclhXZzhRQkVEZFd1bHI4ZXJXMnh3bWtBc0VzVWlCZ2kyL0taSHJn?=
 =?utf-8?B?QkcreXViYWt6dEV6T1VxYmdEMUpYejQvUTBrUXZRRCtNZDRVUE93MTdLZHky?=
 =?utf-8?B?dE84am5XMitSeEp0OTIwYmdBWG5EWmx2ekFwOG9XUTdEUUNpbHRwdkpXRmto?=
 =?utf-8?B?eUIvd0kyOTFDK0xHUTRPelY3TitTZGdVNEQ2ZGcyWUpJeEhiZnFLb05BRmli?=
 =?utf-8?B?Z21nN0pBNFZYeStSdkRnbG9VZkhGTHZnM0FxY0RyUW9UQ2hkemg4R2xwQ0Uy?=
 =?utf-8?B?MHIwN3JDOHdGMUh3bUUwYWE1NDhvT20wc2FDdUtSdmhYWTgyVElyRjZGdVEw?=
 =?utf-8?B?aCtLUS9sZVBBN0NZejZxakVHYklFYy8zTXNtbjY1SDlmbENoN0FJMTF0Rzh4?=
 =?utf-8?B?eGxrN1hrMCtMeVUybzB6SVBlaFdnM0c5TE00VCs0aHdDRTVDNEpIbXJEQVZG?=
 =?utf-8?B?ZnZXQXlINmVRSFVwZXhrRzJqcGlRV0JXUW1vNWlsN1JTMFRaR2FXTTk5TFVN?=
 =?utf-8?B?ZVdwUUZIWlJJYkdYYXZFczhtWlZuQXhBV295QjV6WkFOTVZaZXNaWEE2OEVM?=
 =?utf-8?B?RENxSUw4M3ZTUkloVjZtVnlyNG50YS8xWWlKb3U4NkQ5L3BKZ0JFZGN2Z2NS?=
 =?utf-8?B?bmFycEJHbm1DTEZUeGIvVUo1UnlFZ3hlakRsQWtqRjAzR0Q5aUFuQ3diQUY2?=
 =?utf-8?B?Z2h2VmpwamVkenJsbGJxQlhIK1hxajQ5ODRTbktvN2Z2QmZqWGtpSndZSWY0?=
 =?utf-8?B?U28vU0JOT3J3QjFiVTNBdVkwbVJDRDd5UHRacks2VTEvSmZqWUFkUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d824f8a-a8e4-434b-71c1-08dec6f34275
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 13:22:02.8936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXH+Ny8mpXqe0IRBh5/jJmFp6t/Q78Fb2qi0TIgADxRz/RGAEv8tEPtW4Z5rdpXu+1ts1PgfWR3KxJm9SCg2xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9658
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_062211_304900_26476A19 
X-CRM114-Status: UNSURE (   8.56  )
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

There is an errata for i.MX8MP VC8000E:
    ERR050531: VPU_NOC power down handshake may hang during VC8000E/VPUMIX
    power up/down cycling.
    Description: VC8000E reset de-assertion edge and AXI clock may have a
    timing issue.
    Workaround: Set bit2 (vc8000e_clk_en) of BLK_CLK_EN_CSR to 0 to gate off
    both AXI clock and VC8000E clock sent to VC8000E and AXI clock sent to
    VPU_NOC m_v_2 interface during VC8000E power up(VC8000E reset is
    de-asserted by HW)

This patchset is to fix the errata. More info could be found in each
patch commit.

Sorry for sending v4 at 7.1-rc7, no rush for 7.1.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v4:
- Add R-b
- Set is_errata_err050531 to true for vc8000e
- Link to v3: https://lore.kernel.org/r/20260409-imx8mp-vc8000e-pm-v3-0-3e023eaa245b@nxp.com

Changes in v3:
- Separate power up notifier fix into patch 1
- Link to v2: https://lore.kernel.org/r/20260228-imx8mp-vc8000e-pm-v2-1-fd255a0d5958@nxp.com

Changes in v2:
- Add errata link in commit message
- Add comment for is_errata_err050531
- Link to v1: https://lore.kernel.org/r/20260128-imx8mp-vc8000e-pm-v1-1-6c171451c732@nxp.com

---
Peng Fan (2):
      pmdomain: imx: Fix i.MX8MP power notifier
      pmdomain: imx: Fix i.MX8MP VC8000E power up sequence

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 46 +++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)
---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260610-b4-imx8mp-vc8000e-pm-v4-1-a978b40c59d0

Best regards,
--  
Peng Fan <peng.fan@nxp.com>


