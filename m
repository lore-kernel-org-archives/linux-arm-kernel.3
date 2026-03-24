Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30566F54ADA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 17:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Dr0GpnUNITyZBOBHu86Bnwll7iUD4gxejYlRP6vt8U=; b=ZyjbV2rE4csyvlyRUHU1X/D71H
	D7EVdYGtnWCjq/HV23EYkwoJDvYl1cW2mE/ou7a/kpOQL8+BrAT7qVfpdGkZcOSVufChOqeh3IgzG
	H1oUE2iIGbYvgI5/wRfq3PMfJe8gzBgTL1zNxdC8wr/4W/Qlj573EtxXvplaJRgq+eKE9P0itQdj2
	Fk66EWOcBEo22fje8vhnh6ixvXc0C7wvS45AMKUQctEXx1r70S18HvzolosH7mTU26hDT6eY0yD2v
	0mVyeb5ItJ95jq8u4T8jyg8zk/e+tjqo/gjn5AYmxunrvF30+lyL5vqtwTiY9rAlpNSF58z7YWphP
	otsUeoFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55GT-00000001yhX-3OEk;
	Tue, 24 Mar 2026 17:10:01 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55GR-00000001ygq-2TKw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 17:10:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNNJX2jhOvK/p4L8ZbN1Z1fnD+y+Xw7whRKdJqqZllJuFYrLA8dFVPRZOPkjCAYosoo3IAsDhArC1WEhYmiVTjTixh97cWFM6m0xe1PgyUpZqbeGkplQvPFI7i5scjYvP7YBXS46HRKODrxZGpmiNIzyKpQmxvobJHMC6g9FefZh7XFlFFroUPBxhAWR4othhhVJw2BTBjTxhd8Px5sg11DsvwQkddD5cg1pcOmTPjYf0jHP4JrdCaSTlaQXV0gNTg8mRkYXSuLCwE8tXX+NoiYkaGfzkYtgZL9roAOlUHZHH3qXNdpMaxrof4nXFcMSGoMSkQOyLgsAL6sBssv0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Dr0GpnUNITyZBOBHu86Bnwll7iUD4gxejYlRP6vt8U=;
 b=jp929suzQhT3eDE67FkxA6ObY74goiQITILa1BSisQwyqqgRp7GDwihEy5FzgRHeE8jQG3ZcxoPwgR3pQyPeZyqQ6Az/LkCCrNJANqAJPBFnw4nYQRXsSd2Qvxos6jomw2M7yTRSX82O2G2N86NM/3nSMSIyYosatzj+GsF0qL+YiAUH7eqKChDw2bO7v43PIFX9IAYSdCSV1WZzhRBfQ+SNcKr62/+e9b5w6p2g95SCTZmFw64djvIT4yyWoQXRD58LHjAhQwYfBFql2Da1Yt+gUcoAumoswQDy9o01xVJm3fAZy2+Imgy3JJqFctsmRPwDt27QMwb2VcXHaoTGzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Dr0GpnUNITyZBOBHu86Bnwll7iUD4gxejYlRP6vt8U=;
 b=JJezbaCxj4KfprI1qeeWqwrjCRCN3ldi6BD4JjcHgaT4zqEMRi3Y8FLlOwQIJ76pfxY6QwBwcjynSJLg+mMtRThxlUqIAEmOIFjzceQCz3vfuowuI3c7jSCIwxOHzANjFCb4gRrGuodCTE0ssT1xzfeYTmyt83/fYa9+H9WaqFz0NGnCrCxOgeFYZaxo2HmFd1kHymfp/Jtb5mbwQaxXRAN9H3eputKy1e4/Yoymwq2CsPzMPKcgnz0JPY8w0fnhVFbw6EuFdZLeXnE/PHO8C7LjxkGF8pQD/RqV9CUFfKRvJF6SR0+XR1Y7VGfx/d9rrAaEmFTJ/6mNKTkpwBRjjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8681.eurprd04.prod.outlook.com (2603:10a6:20b:43c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 17:09:54 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 17:09:46 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: imx8mm: Explicitly set DSI_PHY_REF clock as a child of CLK_24M
Date: Tue, 24 Mar 2026 13:09:35 -0400
Message-ID: <177437208819.2180776.16989434703618891645.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313071027.587992-1-alexander.stein@ew.tq-group.com>
References: <20260313071027.587992-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P223CA0022.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8681:EE_
X-MS-Office365-Filtering-Correlation-Id: d216e127-41c9-47ae-1e64-08de89c82653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|52116014|19092799006|7416014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: hnxG5+nY9T3ZqJvvSlnkS6Ne4zgfIqpqhi7uHlXU+JJuOM0GC+gCiQmBG0wFf5GOnAwhbVwYbWln0GbvUyTafgeUViJuoYTagnOBbxUEZDqemjaBKShU6Yuye0rfw6iwIvylYFhXBpkSvBJ8elqdH+yymb5FeYYpGXJQZL610tR5nzf6u8lWerDpTI8ewEmWQ4Mm0XFJ8dVUrJ5F7rfB9q3m6pryCA78eFh0LCHpOUf9lkhU2WD3z7ljU1XZ/F8EciZJXitVV3SyYMPu0xx5klW59aspC+SBewtgrZriERjODXTrYGgybIgCyqsmjzrW7eO+xV0OZyYLDf2LEQ5nn+zJ13uSuIQO/goq8nZrstPkXWL5KG7AXlHAZebAX57ke0B3fO871ELXdfcj+LSBuD79Fh9GpToGqIElYI0neCeo2HNp8+00OMO8dsPw2dYu2CPLXxEQHSl+8dfwpTdnzpxTLf3snwMM00U/RZ3IqqJRq97uELuQ99iEXdalfalYVAbAvMxoxOPU2mA+MhX7/A1FAePaJZJ1REzZRXmowlf5TbvnFf93NANOLo7RHbL8PWMSX+P/1x9aIteOR1siN9Rp1lC/dBdBMFdzlRYvpNZZmUBUiv4FXvp2MiJR/V64YOfuFwmLVKiQPaU9Srid4fk0A3IKrfnztz1fJq0BthF7pVyHoK/o5SNH+9HhPSKpN9DhCCw6iF617k9r18hKtCFlMZTtelI3T3Pnp865BToWamJbtsINVkiEk9fRljBnhO5IZXTDsN10auWU2ZP+i/QHsxsC1+lA9G3w8FX234k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(19092799006)(7416014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d01VaEtoeUREOEhpaGdhaDhMdC9lZWhBVXVCOGNnR1BTOUtpQVdxODBieDJH?=
 =?utf-8?B?Z1dKWFVGd0ZrMDhtQ1R3MHljczVaUkloZ1pMbkYybXB0dGJCVmptWklNS1FG?=
 =?utf-8?B?Nk9wVS9BVWtsQ0h1dENJUkFPR2pSVXlkU2loeWlLSnhGcm9EemJ1OHpOSjJ0?=
 =?utf-8?B?Ni9QUWxSK28yNFZtMlVNMXAwR01rUmxoK2w1bmJhMVE5ckp5MEQ2RjJXRnpm?=
 =?utf-8?B?NGthUUMyU1hSVjdnVEpYNW44TE40QVdWMHVrT1c3T3dwTWZYZEI5MW5tLzNo?=
 =?utf-8?B?bWNBNFBFeWVTcFgxQXBaUjdYb0FqeVV3eDdKdDVkUDFFZmYrU3RxbzZndFEr?=
 =?utf-8?B?ZnNYcmlHUUtINEt6c090eWxZTzNQSk15Z1RtZWZhbHVEV2syMzZEVFBsZ2w1?=
 =?utf-8?B?b2FOU2FPOXFoZFRJOEJjQy8yd2IwQ3Nwa2NDVWRMMXNRTFZoVytORWI0WUpO?=
 =?utf-8?B?bjUvN2xsQ3BzWVZRUk5oSEtVT0RnVlBJMWZjU2pGSmFrK1NVQUs2ZndUVjNa?=
 =?utf-8?B?VXIrL2QyOVZqQVdwOE0zS1pCYWt6cHlNbmRsVDNsZEhCc0kzN3I1ZzBPbmFD?=
 =?utf-8?B?eXMzWjg0Ykw5eDBYVzM5MWJLL3JNcGRHMktXTnBrKy9zNFRwemxQUHVmdlpG?=
 =?utf-8?B?RzdVSCs1emFDSk5BZHhkbHVkamJjbXJITGg2QlJpbE9QbllpVERiUGlGZWZT?=
 =?utf-8?B?bDFmWll0bWlpSjQxYWtNTjdRbzlma2gwRWIvYUNJanEzN3E0Ti96cHpHdlJS?=
 =?utf-8?B?R0pLODNwWkRvZ3dIY3FkSGlkdG82bmRwS3FHUXZWK3VTUjI3WWYyOS9SVGp6?=
 =?utf-8?B?Q0wvMmErMFVsYzIxVjIxRkRvTWJXQlJCTlZuRFJGUVpEeVZmWEJ4aWdkV1NX?=
 =?utf-8?B?M3ZYMHViQmtFMlNvWldZZkhBdFZqdUp5VmNxb1ZrdVVMZk9pVURDVmN1dEEz?=
 =?utf-8?B?N2YxQVk0ZHlvOVA3aGlvMTJaZmNtWU1EUTdvL3cvSW4wdjQwV2tXWlRTTnNS?=
 =?utf-8?B?TjVlVlozQXJjanloeGRqUjlxV2F5UHh6UnRFdE9tOXJsQWx4ZFZyaVM0Nk9P?=
 =?utf-8?B?RWpOSmxoaitLRlpzNUpMVFZOcURvMHlXcVM5QmhyZHNXaWU1cm9LaEQ3U3Fj?=
 =?utf-8?B?K3d0dURjTFVLejNzbHV6VHV5cmE1aWhHRWJKVWVVN3Fjckh4RGU0QWxZampP?=
 =?utf-8?B?T2VyelRPQXRpUERvV0RvK3FqWDExSzNYRkUramhWbWtHQXpkMStucXhEK3F6?=
 =?utf-8?B?dkRGL2xnRWRGdm1WcmdqOVBXMGJGNW1EUXkxakpzNXd1VnZETWxqcUxSU0sy?=
 =?utf-8?B?ZENuTWZleTBSREU5eExhaFpNSG9MTTlNMmRaN2lLWTdMQ0N3L1hwVFNaK0p1?=
 =?utf-8?B?OWhwbmQ2K09BMTJlWTNoWnY5Tm1oU0daYVhhRkdpVy96bE43QllnWmFCLys3?=
 =?utf-8?B?UXc2VTJMRjBCUEoybWZnZ3RmTmNScWFKeStobndFOHFTN3lQanR5MTcrN1ZZ?=
 =?utf-8?B?OTNIQmphSHlUbnMvZENZRkxoUVFJQ1Z2QnBJRWZ4RjEvWGtTdW9ib2F0bFdD?=
 =?utf-8?B?dENZci9rS21qUTIyS2FLNXY2VytYeGF5eUxnbFNaTkt5MDh1STFjNlJsVnZq?=
 =?utf-8?B?cDhKTmhZcDE4MndFY2xnN2VmZ2d2M3pNTVpjSXhpWHNNOUxZYjl0MU52blU4?=
 =?utf-8?B?NCszZGhEaGZIcktGVGtwVy9wdjdXUTZrcXZNdCtubEFwNTM1dzlrYnJnUWhn?=
 =?utf-8?B?SWRjUzEzWGc0WGhQNFJWU1VvU0JybUluV3hhc1hsT1dzdWlGK0xUWDZEQURy?=
 =?utf-8?B?MVA0MEhZYXhEQTBsN01OZE1wTEE1VW1kU2xGTHhHVnBlSEpIQUMwbWVuVTZR?=
 =?utf-8?B?dHhCSjRzay9hRWI1OWlQWlVMNmFRR3g4ZVk4enREMEdVeWdDYjliZ3Q2RW9o?=
 =?utf-8?B?VGJkSmpzTm1GUjU5V0grK2RaUGFGVm1Hanl2YnlsTFBxOGxUZGFZdi9JdW1W?=
 =?utf-8?B?eWFubXVycC9vMWZ6QjdCb1YxVTFwZUFielBTeU1JRTNpUklFTTFnUEZ3aVc5?=
 =?utf-8?B?dW9GQVdlREFyWUJVc3EwUER3M20ya1FHMEdKSUlPTmZLZXptU0d2Z1h3M2Q1?=
 =?utf-8?B?UnorVUJqRDRtVlBNV1NzSndORlJQZTFNWWhKZkhRTTg5akZyRGdWUTVpYnEv?=
 =?utf-8?B?YkNqa0VsZlZqT0dBU2VtQk9VQVpvWUtlUUp3d2pFSm5HaDJsSHhmbWd2ZElX?=
 =?utf-8?B?WnA4eWw1UXJuekgyS1ZpcnJ3OFB5alUxeSsvaHZWK0tLK1pHYUJObTB3Nis1?=
 =?utf-8?B?MEdUWk5ReE5sU21PTTVsbDA2TVJBRUZsaU81d2VHWllhYUtDQXZkZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d216e127-41c9-47ae-1e64-08de89c82653
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 17:09:46.5504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avLxX+4flzWAiHIo9LjNUx5AlCKa+1gr90yf8jeJgHCJAnSYZwjKOse142hA2G7Qv1pdyyfx3Opr3OLUV/6prg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8681
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_100959_631978_D7943A4E 
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


On Fri, 13 Mar 2026 08:10:23 +0100, Alexander Stein wrote:
> Since commits a0deedcc0cf0 ("arm64: dts: imx8mm: Slow default video_pll1
> clock rate") and 5fe6ec93f10b0 ("clk: imx8mm: Let IMX8MM_CLK_LCDIF_PIXEL
> set parent rate") VIDEO_PLL1 is dynamically programmed by CLK_LCDIF_PIXEL.
> On imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso this results in a
> VIDEO_PLL1 frequency of 68.2 MHz and DSI_PHY_REF of 17.05MHz (1/4).
> Instead use the 24 MHz clock as parent for DSI PHY reference clock.
>
> [...]

Applied, thanks!

[1/3] arm64: dts: imx8mm: Explicitly set DSI_PHY_REF clock as a child of CLK_24M
      commit: 5cb939a70e052948ffb05f1c02e7c83dea5b2426

Fix checkpatch error. since commits ... -> since commit ...

[2/3] arm64: dts: imx8mm-tqma8mqml-mba8mx: LVDS overlay: Reduce DSI burst clock to 600Mhz
      commit: 3a96ba67dfd4d88a342c61b229e139598a20734a
[3/3] arm64: dts: imx8mn-tqma8mqnl-mba8mx: LVDS overlay: LVDS overlay: Reduce DSI burst clock to 600Mhz
      (no commit info)

Remove duplicate "LVDS overlay",

Add empty line between paragraph

Best regards,
--
Frank Li <Frank.Li@nxp.com>

