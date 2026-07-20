Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5101BC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6G/U2cBPYf/NXbhDu6EwwZuiZ9QQJuZ09HHVkuGf3cM=; b=CTXrxkS3Um8qQW0/lvp4sqz6B5
	A4q4U3hnK2pDuggnZ7yls+7MgR29CSBWbSd8poPtW4NUJVa3lh9JRSk37NjiKS1SVsPn5t7IGfdoo
	xVQwG8pzSG1nvWaCA2rC0b1oylapJAwNf40+AzZV/AdM2F95/QAyRPalPozoFseSUyFBCpmgdr3fO
	69AIUzZ+JVHJyx8Tlxzz5oWbY9v7260fKkYf9kMNEfWZ0L9oRzJ6IF04UNo10h9GzQVDdZOyL5O/l
	bGRQE6Ra7Rq03KcGMRkIzbXCqjlXxVPgTehFXzQYaf2lW4bN+5CM1WaaRrhHVZfR1Jj5CWX6g+5b+
	s9cOazCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrGH-00000007Rsu-2oCk;
	Mon, 20 Jul 2026 16:54:37 +0000
Received: from mail-westeuropeazon11010051.outbound.protection.outlook.com ([52.101.69.51] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrGF-00000007Rs7-0acH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:54:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkD3MUWx7Vs4+X4Lls8LcdWXy5euV77mQjMrfSGF8MhLV3/Lrqy0L6UlqgA4EV84xVA+ycN1XjfWyPmfNoY4lNTsdo6FPf5q8rEoeMOfRukGcxMv6bcvDI9FB+P79vr52u0/+/qlSfH2WhTRD8+tcjfhrBvZT9cjMG/G5j1aky2Lo0e3Xsz5ag7NIu72+pp0DJ+CvTdXGd/FxeP4CdeXISFAVoViSVzF0s2I33A+9htbPHDsIvqa+Tb9MU+VIxk6+n5f8KSbfCtyaUwyOADvEsQkmYq2K4CRFdG3oHtCAFeOUt+tSRRd3Ux753RUDHViXRVnpF+zFukwkH2xDXadjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6G/U2cBPYf/NXbhDu6EwwZuiZ9QQJuZ09HHVkuGf3cM=;
 b=plPP6FqMrZkNGXgB84UduTCysty5PxhNUewvSRi7O5OGF+HZbbO/M9MLL9qjh14mL1niFW6RxLjcfLEay6Ci3k8gHP+CH/3K2s4qjE6shjry8L/o8e/EnlTzuEb/dUibOd0G4NSDbI4WF53FZ2dwtTjWN6rRlV7DT6KbcqOgpWZEgdmfPmn3Sb18KjBiXzSopFvmsbXu/ak1AuSDXj9AK3ahrj0KjV2KdPeCW5qS0rfPYQDJ2YL3Kyef74ah1O3vKN8Gmtp6oJU7KQDE4aHjZ+Ko/ME9MdzIvDDVwpMJqCpHhZ5QoerBIR229mXqDPgJvaA0joYusYvTuOv/IE0Rpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6G/U2cBPYf/NXbhDu6EwwZuiZ9QQJuZ09HHVkuGf3cM=;
 b=wbJy/H7tyrkxEiltNPdJe4XJMRwNLTmSVguTmyYlE20OpMaCwT1tB+Evlq5D44LhZ7NbOd9bXo1mC+iL0DKD82fXa7BIn88Htm+s+AwXlDiN/KKySrA+El3oEQJnmzDoQJTHIVWtnsCViIwLEEkh5+5EzWwam5dD3hYXpy+utHcD2qUe8PCdrNMWxsdCvhPUBEuUg2qC5M676k7ywJTo4bP0BFZJR/SZWJm34vZlvQN4fjdCV9ImYIRHstoaXeP600iBDa7GfdS0dpKQgdQvohVYMkjoyWJHKLYeiXTaPmAG4D1GT3CAmGCy7kRq+9Qxy+ZC9cVe2NhbrJN5t26Wcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12) by DU4PR04MB11032.eurprd04.prod.outlook.com
 (2603:10a6:10:58a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 16:54:30 +0000
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953]) by VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 16:54:30 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] arm64: dts: imx8qm: collect some small update and fixes
Date: Mon, 20 Jul 2026 12:53:58 -0400
Message-ID: <178456639599.3786312.14988627093793615017.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709-qm_dts-v2-0-3ebcce82bb79@nxp.com>
References: <20260709-qm_dts-v2-0-3ebcce82bb79@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0028.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::30) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB11784:EE_|DU4PR04MB11032:EE_
X-MS-Office365-Filtering-Correlation-Id: 2940576d-0ae6-4e22-1f51-08dee67f902d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|23010399003|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: IyHC7muuPwS2smihDbEHXWi18wMPYxbF4t3E5q6BtIUWZ18nPTqIqnyoEUqqCrOLxh/QxCWLrSODVcwZivecukuZtdUJrHbeEuiZd6Ql3gv5vq43vV7QMFtQFrfe7chHt9EWvrfX9z0/fKOap1czeL4JIYVEAlwAUlshcXxrfgYE8eE3jKKvOInaRvihJUiFFEY2isAdjsd7Vc6c0mZ+b6cVFIRBxsarcXUZwcgimUtr6Zj6vG3fqIB4Ekb2xrr/2PLby27NGm5oBM8xkvyLQi46evb6qItncK3nJ08jWxI6640qkieWlkecAJTyWChBNFkaPkOSXq5t1NYa2wtAcHUhXXcovSMlAXhj4v1gNYuNOXlIdBLiNgzTc4Cytkt+huoe9VsErlNiyvYzsCvZL8p4mXv3J/9+Zpiv2a9sQMgh9Cs7pqC1WvbhOLPRKdBfdZmkdYCgGn2+lX0vSwIiD2XCkOeVydbTFxaPBd38MPyj6G0AfPgiUuOpraaNLR6LqG3NjPUy2PkvFjwVBUvUz9FfRGwDXijy6VJGXM30UJNNLHdBlerP3d41TFa7Ujyu4pRwNhfkifWzWXds9SgyS9EbvnAUTGYDTtUH9UwhR+xRQ6NPSfzASIZejX53YVDNTB/Q588/Em9WxpmfWLq2aFmg8nJWD01EqfWPghGyQrA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB11784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak1WQmJiWUZBbEhIcGJqUmZMTEhjTHBuWkE0cDhtZnZsenhEUnVNdjA5NkRh?=
 =?utf-8?B?dGV3RGc1cHpRVzdEbWZNcm9yWHNxNC9lRlBhYlM1bEVhc3hNSHp3V0hVR1hp?=
 =?utf-8?B?UEhlb0U3cVJZRmNEbS9WaXR0L1N6eTBlczVxaUVsa0ZOYmxjTFlkeXZoeVBp?=
 =?utf-8?B?MmR6Wlg2ZmF4WEJabWlTNWxLT1BpTWNkVlU4MHBBZEVrTENzNlJLMWxNTnJF?=
 =?utf-8?B?ck1yUXQ2RER4bzJNOTF3OXJtbDYyRE0xQlpmd2ZqUnBBaDRiZWU0RUZLR1JF?=
 =?utf-8?B?bGVsNTlPQW5jdGRSdzkxWVJmLzVEVzlpWExPeEhld21iU1NQdFhWYUEzOXd0?=
 =?utf-8?B?YmdjT2RobEl0cjVGZ1R3c09RdGxUZDlVN2g3bWNWYmlqSWdXRCs5eW01YnRx?=
 =?utf-8?B?Y2RMS0xXeEU1ejZaZTlnZUNRelA1ZFpmRFFOd0l2Vkl4NExiN1NOdjhteDRt?=
 =?utf-8?B?NDczajlhRkJDQk5MSVdBL3NYRzAzV2FQRm9RQzM2VlNERi9BZVdUS0ZaaDJB?=
 =?utf-8?B?NlhQY3N4bXpiaUNZdXJOQUkzcDkwTkV3NWpHbS94bnRUY25OeDExM1VRSVhU?=
 =?utf-8?B?L1A2Y29jWGdUelhNRXJrS2tySXpTMllFZUJ3OURIa2o2SWVCYkpTbmRTSUp1?=
 =?utf-8?B?bmhSTWd2Tno0L05XNysxcVVFNkdHaTAxV1YwTzlpQkRnSVAzY0lsQUQxRlox?=
 =?utf-8?B?aEl3MEdYaFU4cnRodjNPTlpEdEVYNzVFb3dJWUxmSDUrUDMrcnNLaWpEZEM1?=
 =?utf-8?B?OWlGcjZGS09mUjZHa3g3MU5PUU0yKzlObDladWtKblhLdkFCUEc0a1dtQ2dn?=
 =?utf-8?B?TmNZNFVsMjZVZmNBVE96dFQ2NU5RSlVwMkVubTBEMStsbjloV1doVWgxaVNY?=
 =?utf-8?B?cm4wdm95SWE0dzUrRnZIV0Z0ZU1RTXZReTQ3YzF0WXVPTFNGUE5LVFRlY3By?=
 =?utf-8?B?MmwrYWlmNlZXejNENlAyekVZaGp5ZjlPSHN4Z1hyRXJZNG1XaUFsNlM2b242?=
 =?utf-8?B?RURUdEJHQ25icWdHclcxYjVLL1dxMDVnNVE2TmlidXNkU3ZNV09YUXlZbEFw?=
 =?utf-8?B?aE0wVWs1WXFjcm1RK2IvLzJXV0pCRnJrL1dSNWFZWmU1Q3kxYVdkVHIxcGh5?=
 =?utf-8?B?L3FJZjUvVm1qWm5CdW1BR0tHaXhEakNmVENVS1hiRitJdkxCR2FGZ0p5WlVF?=
 =?utf-8?B?dzlLT0FmVEdBeGJ4QUMxRHZ4L29BQmdHRXM5YWZkRFdLdUtxZVJqNlZySWlK?=
 =?utf-8?B?YVNRckY1VWVzQm16Ry9PbmVSUzhKVDducHlwa29HaDVMVjU1TjVUUmx4Ny9G?=
 =?utf-8?B?SDdOY3N2ZlpLZnROR1N4ZUIrZ1pBSTVjRW54NGs0ZjBNS1pCOW9IQmRmZ1ZS?=
 =?utf-8?B?Y1NreDV6VEQ2Zm8vcGxrRW5CM2pkMnFnK0JlalBRMzVkWCtHd2YzSWF6Mkpl?=
 =?utf-8?B?VnMxQ0JFNW85OVd6T3FPWmRqMTdMdVV4SlhqS3grQjF3NTZRL3dRK2IrRXVQ?=
 =?utf-8?B?OVBEdjRxSW9kN3hwL0hUdGJJOFNrenJpU0JQalVFNWUrMG16WGJlWFdNaHc0?=
 =?utf-8?B?a0VRd0RwTDFZTzJMYis1MTQ0azBEeFRURnRkZitVZFRoRkxQMXRheEwrZDQz?=
 =?utf-8?B?RlBHVXV3S3U4WlgxaWVvaUFGYTBaY2NDKzlMck94WUNYeEJ6K0F2WExyeXBG?=
 =?utf-8?B?RjlDRjdTRndEOEVhR1g3SFpJWC9za21Vbko5SDRJaHBNT0tzMGN6eXJ4SGVw?=
 =?utf-8?B?U1N2cUg2bTdpSHJrSktEb1FTS3IxWWlxQS9CdFRHMFhzSDgrczR5NmtINVFU?=
 =?utf-8?B?ZllhV0g3eEN2WXJzdFdUY1Ixc05HS3I0LzZmdlNDQmJEN3MzRVRGejQ2ZEJr?=
 =?utf-8?B?cXJCeDFiZGIvOGx5eE93SjhjbWRMb2lWOVFwdTlobVgwMkFoVFd2Q2lOL25p?=
 =?utf-8?B?TURJR296Y0djQTRYY2Q1NXJ1eUwyZnRaamhrbkZZUlB4bjY2VUZmZk5hdFVo?=
 =?utf-8?B?VW13elBpVnNWTldHZk5uN2YwTnNSeDVZeERkU3ZaODZTODV0WWNtTGVudzFM?=
 =?utf-8?B?ZGpWWGs0cW9RYThVOFBVbCtVVUtvaXZYdXhEbHVTbUI0d1BlMzljczBlMkpj?=
 =?utf-8?B?emUxcHFxK3loNEZ6RmN6NUV1eS9OT1RjRkRvM21mQW9ja2dmVjI5YzY3TUdX?=
 =?utf-8?B?YWRXQndRb1FaRGd6bTNNRGl2WVdVdG9VWnZVc3lkL1YyY0JxeDZRdFZaZ0wv?=
 =?utf-8?B?NWpLMlFKd3JEWExKZjd3eEZoaHpqM09Wa3pncDFUMCsxMmNCMThrY0J6Q0NK?=
 =?utf-8?B?dVlEUXVBamRKZ2hkeEtMNXIzcnZzMmJNRUJENlhOdVFYT1EzZk1jZU1OMmUx?=
 =?utf-8?Q?kP2jU/5pqKHAwSKWIkYZmIR459NmKsiVIU8LA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2940576d-0ae6-4e22-1f51-08dee67f902d
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 16:54:30.1355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7uOKtg3GMgV/Dc52LSH54QsrHYMeBktNkuGyKGftZ+cD6i2HayrHssySKhXcwtG3qg7iknk9cbAekVeHySEJ3K7ywORM/2v0wI8AhobKHm1Qkc3JKcv/gwcwWHIQdJr9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_095435_180644_3CFA7274 
X-CRM114-Status: UNSURE (   6.70  )
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

From: Frank Li <Frank.Li@nxp.com>


On Thu, 09 Jul 2026 16:29:42 -0400, Frank.Li@oss.nxp.com wrote:
> Collect some small update and fixes.

Applied, thanks!

[1/4] arm64: dts: imx8qm-ss-dma: add lpuart4 node
      commit: d879cc948e6f7046af65c867a496bc9cde1da8ef
[2/4] arm64: dts: imx8qm-ss-audio: add spdif1 node
      commit: f57bf4c11d7fa95afaea45a14d91b067406c60f0
[3/4] arm64: dts: imx8qm-ss-lsio: add lsio mu8 and mu8b
      commit: 617bcacbf0905d2ac25c1fe6d2ab45afc4f9fc3c
[4/4] arm64: dts: imx8-ss-audio: Fix LPCG clock indices for ASRC0
      commit: 8563591f76ca02c1a6fd70ce986df1d0dde8d249

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

