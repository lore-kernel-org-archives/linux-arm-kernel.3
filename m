Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7CAC44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 20:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+RFPZOmb9xb85e4alcV4C94aMjdFE1tnaWbg5VKzks=; b=q/Ju72fHnU/fNiqWiQVM1MXj+I
	GiVwisubhhH5ZDk3wAnxjvXM62Gt/+rza8dZ6JpMxES5oWi+z/+ABBHhNg4DNRQTgyMedPYAKRxRA
	fgW2i/iEW529reHHQP+73l18ifLdwOu5lOQw2+a94EMdwYqkmjDpcq2wKGvLcPh5G+psXx1ZAt0GM
	uCNnrl727s6tMXxbknFzBcDg0J1tQ1R9ZblaVO8BfKJ050SxZDkCK74cpH50g1Jpn3vH997UMLDXz
	JukIHt/iwjCu3AkIJfpTNgRMoh0GUJUKUjYEPL+RLPsYpvGzcIeAhNxzTRImXevCd/Y6/tOBq6Ziz
	sC9kbYtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whvNv-00000003ZtC-1P34;
	Thu, 09 Jul 2026 20:30:15 +0000
Received: from mail-swedencentralazon11013055.outbound.protection.outlook.com ([52.101.83.55] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whvNr-00000003Zo9-0AEH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 20:30:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4xZH8nYAMks1YQHovY3Jx6OHtoQ4CutPnPy/n2Ljpj0bWiNLxpMaT0cDw+Njdgtx9rObI9lxpaYZPFmF1Vyk7RWgBnMT7WFxbr0L+EcbwrxAbXb7nIE3MwSrvd5Ro3NkNmalUTlD8aycIn5AE+s3BWN/uvJ4TKJqFSnPNyb5XjKxrWBavDuwh2+e3ogPSFWPn0NgGpKGuYdHZDl/Y8UgmSCNBldWf+CiGKga8AXk/Ey4dM/1iV0BomXRAK7ldM9Mk1r3NPvPBj/9C3o5IH5dxhno9Tzn4KuaDrA7Xf+d8B6GiI6ykfm8Ta80ob3SJEItqiG9Eq1+XS5DvKZtNMRbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+RFPZOmb9xb85e4alcV4C94aMjdFE1tnaWbg5VKzks=;
 b=FASUcjZBDy9X+IHLZvTiPdSRJeRdq1ZczsIK9KAplS2bz8r1UWgiSxMsOtVGq0+lH5ZnF2+YlvhJEFZk3vCrXILCReR7xn2HSzOGaii7h9+OcJtUYPWRiEVKInBkvdFuws8Kq8m9bszVNh5NnrIb4VVO5CoartpI6rx22/aMeg8BSF78g3l6srHkEZS9chvwj0yLrRsNUQfA/OSvqw4ILjDbVs4G7aqp0eP9VFd4JfD5D8UnSBRekIBExDACPlHxAOgsBe82rJLzny9j2j33+b5PJbuq2ENTe9Bhe0WDGLsHNOT2EyG8sy5lquoB4PH9dHsPgnxcyoNRoFndDpGsEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+RFPZOmb9xb85e4alcV4C94aMjdFE1tnaWbg5VKzks=;
 b=VQJUrDKrqX+17R7HbbBi/3H+L3m0etO7XkP/QJdYX7y/Cs5grs5Ax38y1K1TvfIMtFmQBs3lozJKPu+vPJ4bKZrEpeA7ZvgcRwqkR5p105nq/eDwC1QWTGbwmUnGPLUvSznokwkUGAD0dt6GFE/e7dVuvbD1x6mUzU+XM6zOYJpw6k72oq3pL65J2z1/koVqeA8vb0wZX73dxt9UE5oRHMA8z8CtHvTOUUooAqEQvMrbadKcVx2hMvNGvHVJjSC8ymm91vLIqipBO+ykGnH/wqG1uYiemxgJPiDkH/ZlpGiTx9ZEva4KgAVgzIrCWXGT8Dxz07dYvixGHOWPxfW9og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11264.eurprd04.prod.outlook.com (2603:10a6:102:4eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 20:30:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 9 Jul 2026
 20:30:04 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 09 Jul 2026 16:29:45 -0400
Subject: [PATCH v2 3/4] arm64: dts: imx8qm-ss-lsio: add lsio mu8 and mu8b
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-qm_dts-v2-3-3ebcce82bb79@nxp.com>
References: <20260709-qm_dts-v2-0-3ebcce82bb79@nxp.com>
In-Reply-To: <20260709-qm_dts-v2-0-3ebcce82bb79@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783628984; l=1289;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=vzzvqghJ0T66l4jxulwrl5RV7bDMa2h8sjVOSukgXzk=;
 b=njV+nbk+w0b7k5m3cw4Pou2wxfIR7FIxGgmX1SCiHmUmqj/9/zidW96khn9PhdK0RDWvqojPY
 3HLaxTRn4uDAShMYL3pqnhVFecJODmAuOfshyiHfOT72AxNdT7zhvTx
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0118.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11264:EE_
X-MS-Office365-Filtering-Correlation-Id: f15c2d75-fdcd-4dea-0996-08deddf8dbd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|23010399003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: B1zQY5pfmEE+tLfLcUXYJ1/SU8NNw+JbM89sEtxABJ0YfZgBzKG194QqssaNMTi9RwJ4qYefdEgokM1Bv7P+W4+sKr21AAJuwTDLrFuoa87Q1jjvX4rO2hSRpk5n1q/NE68eSZdNO6IjWOk6iMLSq6lZEaidzAOF+VNtBRVsYzk9u25LyLr84Gl0nW7H9sUFo88+0cPAUxhYP3kJoLG8c3n4H+iWWN4ESWII7LhwvnF6UhZSih6ocpaQEFlvo5LZHU13YiuH/+tillHX/yEbRvAmtbC1egJUSwF+sq1mzofq5Vs4VH3Hb5h2ebiR+/+2L0oGuZ5SA+4xWv0xisjAnMVqSaOk9Ud0eDxB6uokmKwbIuiRRfaiHBEcaWCzwDA4D1SEKFuLoLxHHPgU0rZG9NBDT65Rh5HPZbOkWY5N2CUzoblwjag8Jku/NP6aa16qB6qvvha4vzj1HYdbEFYswX/1RvD2wZ84g9GNnck2xX5ec8snz9Z9//tl+PGG8i5alCb1Xaxjuer9zl9woeEUBFY5fLCV+vumNYvHDdHMb1GrslTrZmEJ1+9iKUY+UcVgXUdt1jETpHOkByfOAXHBU0XHqg/+FW11+MOcd7GdcbLcOL5hJPhr9IUq6auI5Dsg9DltWxKDU1YSRfi/iLZU+Iq9pZKDq8GaVpT1rpP4q5U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU8weWFnalJqdW9XMWU0bDE5QzFxU2FINVZOczZsSkt2eWxzOWZaNVFKSlFI?=
 =?utf-8?B?cUF4d3A1UFd5TU9MT0szVUlySXRXMEtFVHVvL3Z5R1hwdFZ3MlI3QzU2VFhH?=
 =?utf-8?B?ZVRZZXIyL3dGeDJWNXRJR0FhdzBiTGlqWER0cVJMYnN0eTdPck9IL1lIUzU0?=
 =?utf-8?B?bVI3MG1YbkZhN0tDWDFBc0hSMjhrMVBpTWRDMFl2RE9YVnNLV1l0eHR0UnhY?=
 =?utf-8?B?aGhuTnhwVWIxSmdjRzJjK2Myb0w2ak5CU0NBWjJad2QwWElCdk8wTkMxYW11?=
 =?utf-8?B?cnMzQzZHNW0zQzk2MmJHbTNBbUhBTHE5ODNPamtWM2I0ZS9DNlNraXBITC9y?=
 =?utf-8?B?K0prekRUL2l6ZUJtc1JFMTJod3d6OTlGdXlUOHJzVXpGSzlEendheXRhMFpj?=
 =?utf-8?B?bDlOcll6aGd4L1JYcjlwTnlJWStXRE1iYXN3dHhZVzF6NWN3c0d3bzk3akpO?=
 =?utf-8?B?K2ordktuK0I2Q054dG1kQUl2WjhXRVM3YzBPbldoaXRkSHlpc2lpUEU5REZC?=
 =?utf-8?B?cFlDbjJzZjhtZlpiOUJXMWI5dmI3aGttcXoxb1plY3NRSUdrVjVQNVVYUVRH?=
 =?utf-8?B?b2tWZlRCaXRXOHVWUGl3UkduR2pLcStiWTNDVjFDMVF3eEhWdnRHcUZpeEtZ?=
 =?utf-8?B?R2VjUlVPc2Vmd3Ura1AzQVFOa2UvS1I1RXM3VnUvazJ4TnVxQVduMm5UeEVW?=
 =?utf-8?B?NUdYWktvYm1GeUVwRGlGbGx0RGV4Y0hxUXVXOFlCRkhkaFI1VmpaY3JabjZC?=
 =?utf-8?B?YjdVOWNCR25PK2V4anFVaXp3YWtkZUNzOWhBdHBsMDU5ajZvNjlHMDV4RWFm?=
 =?utf-8?B?RzNQSHJzZHZOZXozZzlOOUJ0ZlNUQUhOUmxDU2FTUnl5YmhGdFByR1pNVVFi?=
 =?utf-8?B?NjZUS0htMWhSNmltODFwMnpvNGgvZ0hsclpUTzBXSWpSMjB1TWN0ZjZFcU9y?=
 =?utf-8?B?eDk0YTlCQ1IvRjVleGhmR1pzSmFnaEJpdnVPRkRHT2ErcS9QdUl4R2dQTkdq?=
 =?utf-8?B?S3JWV1hzY1d6SDYvY0lra3dHMUdSQXFDdWVCNnpTVUwxUzh6NE9acjBQTE5X?=
 =?utf-8?B?ZU8ycmIyQWVSaW85TE9zY1l0UGdwaHU1WkJlM1kvOERObkRZaG5IOE16UGxD?=
 =?utf-8?B?cnVsUUxLVUx6bGdGTGticDJGc0MrQ3ZyNWt5Wjg2WVl0emdUdUNKS2NzZTFp?=
 =?utf-8?B?NkhzUHlTL0xmV1Bxc3E2Z0VUSnAvWVR3MHgvbjdrREZlakpIR3UzNVBUWHdL?=
 =?utf-8?B?Tkt1aVplWlN5UEFxR2FndmpJbndiOXFVS3RaQm5TcHAxOE9WMjk2elZseFUz?=
 =?utf-8?B?V0lBamw5eWx2eWJGd0ovVmlmcXZicVdrcDdXb29KUDE1QXliQVRIZVRyQ3Ja?=
 =?utf-8?B?Y0k1c0taRWl4d0NmemcwQlIxK3R0elprOW9HWVEwczR4QUIvSXF1ejdKcVlN?=
 =?utf-8?B?NTRRZE5IVnlGamtOWjNRUmw3N1ZnbkVPL2VFUWRPODJmd3dZMVN4Q3ZXRzBG?=
 =?utf-8?B?d2NVVXJGQlJjQk1iR3grckZ3cVdsaTd3a2JQdkxFZ2hMKzFkMnhSZnNoL2l2?=
 =?utf-8?B?Y29mUEFDWnRsc2k0aUgvbUpnbWNhdUhFV3hWSWxWREpPRHJaY3drVm5NWkZX?=
 =?utf-8?B?eVEzOHlYWmVKcXh6WkU2aHNlR3REVjMwWFNyMmx2dUd2dkVNZGpad2VnOGZF?=
 =?utf-8?B?Q2wxWVF1ZHFMcGs5K3VXdXA2aUErQ2ROQkxuL0hGSVppS09BQU9ZUHBGUVF4?=
 =?utf-8?B?Zk1xcXlubVhNMG1NMGNvVWd4dmtadlNPY0tEM3EzR1ZjM0JOS3hyZnhUNzFF?=
 =?utf-8?B?M2hlZjNYQTBjNS9teXJqbDh4OXRmVDBpVnRPbmUvVEViWDZiNCtSbDBMQmlJ?=
 =?utf-8?B?VVRua3ZuV09FcnFuTFp3eVZJOXhTYndvZ2JseTFaOXNwdlRNVGZyTFVsRXIv?=
 =?utf-8?B?dFEvSXFDd3J3S20ra1M5T25Fdm5VMis0ZGNlbXNjdjlHdnAxejNKVWtWR1px?=
 =?utf-8?B?eDlGWGYrQzVKRU1jN1dvQ2FsWHdXbTV0N29mNGt1ZS9DNDUxaEdNSGR1OVdJ?=
 =?utf-8?B?ZWZjNjdUS1pXaDFiczFTcUNSSDgrYlZ3d2QxQkdTL0dkSWVJbTBDV3RIcmJB?=
 =?utf-8?B?Y2ZWVTdXOEs4RGtPM29qeE1jMUp0d0JGUmt2dURVQkpYclhQTGpFRVVNRlRa?=
 =?utf-8?B?ODIwUHkzMHJuVWIzK2YvVitPcXF5VHlvQWxsbzVXT29WN0thUkJWUkRMb2hP?=
 =?utf-8?B?K2xJZ0o5b3ViaHo3RSswTkl3a0RWUVZFNS9vUmVrY1lCN1NFbTlLWnQ4MWZ6?=
 =?utf-8?B?SEF5T2k5aWxMR1JvcGd4MFFxMkg0aTVuRVlnb3lhMDRGZHlITVJDTFFDTHkr?=
 =?utf-8?Q?92IuRRNj7/HpkQR1TKuKoXRTInSJCFMZ0l0Rx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f15c2d75-fdcd-4dea-0996-08deddf8dbd8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 20:30:04.4800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGU7c24j1Ut2wPOc+GcBISZURgWUTDIsFDW1iUoGyEvICM/+0XctZK0VWYlU6oOjRJ6DORRb7JghTeCEmkwb36Uu+G9FpECgEaw48kxGlCSnWqaDKWV985Olxx6ZQLBZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_133011_084640_E2487A20 
X-CRM114-Status: UNSURE (   8.92  )
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

Add mu8 and mu8b mailbox nodes.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- remove reduntant mu6, found by sashiko
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi
index b483134f84d18..e055d41f77cb0 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi
@@ -3,6 +3,27 @@
  * Copyright 2019-2020 NXP
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
+&lsio_subsys {
+	lsio_mu8: mailbox@5d230000 {
+		compatible = "fsl,imx8qm-mu", "fsl,imx6sx-mu";
+		reg = <0x5d230000 0x10000>;
+		interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+		#mbox-cells = <2>;
+		power-domains = <&pd IMX_SC_R_MU_8A>;
+		status = "disabled";
+	};
+
+	lsio_mu8b: mailbox@5d2c0000 {
+		compatible = "fsl,imx8qm-mu", "fsl,imx6sx-mu";
+		reg = <0x5d2c0000 0x10000>;
+		interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
+		#mbox-cells = <2>;
+		fsl,mu-side-b;
+		power-domains = <&pd IMX_SC_R_MU_8B>;
+		status = "disabled";
+	};
+
+};
 
 &lsio_gpio0 {
 	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";

-- 
2.43.0


