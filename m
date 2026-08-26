Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF9AC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 13:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7eOlcE/MrbQgmawDnbaXovUJ0y1hnFx7/DZQXlzyNY=; b=46DG8QsRfV6MdAmhBF8y4KBgu5
	TYys4qOKgHBhM0weZRTFyayP00T0OqLXM0RaZQ4wpCUCdwFE2ukjmGavZfIIYFyPLjfVENPp7QaML
	QDjvv0X8Kf+5MFd8BD/2HBTkPu72ZVneim2g4ebvH1KkYu8/Qf2A3ltfShS2LuC0YVVRXb9LuwV6n
	CyiCo6GvnxXplhNnPyBqO17lfJBiBdM4zYJWtQ9VEp6pQ7TPmkNEMbxL6xuzpp8YewzxB9jyeMp97
	DpKys1LAwcqMnq7vi337/pQDUivaCEsKbglM7lUZcQxNGL7BMW7rjxwJ6LEpWzxYhBt8Hjs8Qoo3P
	8+fuie/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDsh-00000002Wyx-2tgQ;
	Wed, 26 Aug 2026 13:41:31 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDsX-00000002Wfd-20rn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 13:41:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SntUvktY8FrUy8lu4uGdXdsc/WRRZ84EH/Go4MLLBAebXUeOlFDcqCKDw7F6/SOzFxP4IcgGL7GvpuxzraQD4WXc/jZd4oIooWlUcWLch1gdznBncR3BrHB5KWnThwPWkNg8Dn8UDAr3gtNAJvyfK/z/mX70RIlla4BlP2I6p/DHIxyLM1J7ZBqy7WmgUHeu2rif1LftrMt2uko2/ORPEjZGD7KXU++eIY6mw3fny0xqy0NJPOKj60APXWnFKXABetfKaPVow+ss52LrD+E/AhFwRDuhYYS8cd+OPRIEXoSx21a/O7jayP3zLpgtsIHrHsQwPOtulNOOe38KHuFAVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7eOlcE/MrbQgmawDnbaXovUJ0y1hnFx7/DZQXlzyNY=;
 b=K3O/6eELEX+TQ677AO/SXSRpg8WdXKmCq3w90RYEB43XF23geTlDeN/kep2oWjRHpIDS8fSgLfhHD9Lky3++DFAfxQJgxPYNEPpp/TTQXyuIhb5tmNjgR3So2GNe+PYUpsXzFVpwAiwGtxwcAugsFHwwF1B619IEQ6NCp8X/6XQA4VODmJx5MkHcZsnS702kyTSmzcbTHjrdfETEXtHjEdKOEC7VhbnxWCI+N1g2AoLq/qeRh1D1O4rZwIa1/fUPJLM0rM/s2TANELtbI41D2cX/k6OAPJKqnY3TZvb0jP8RFoCveP3QDXSnJfzZhtEY/cZWL1tqkNgAUU8WqkdFWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7eOlcE/MrbQgmawDnbaXovUJ0y1hnFx7/DZQXlzyNY=;
 b=I6psuXVwm58UzGzHywr5lSFIJ0+u8CBLI4Sx54D5VWIq7s4n4aHF43uiXm2JT+bsVrqR3oEy69S0imRNapOAhb1F9JM4R/QGPCZhebhRNEuyiPa48N2sCpfMvASNf3rgNhbXkxrTVLbk19fKM2GdYk+oI2GvzC0JS47ZHmDpXLYM55PjnOofQbmJoTluveO52cjuG30C5XRCFkM9JLz2Qw+mxgZKPzxpzerGasDdc4qW31yXI6uOuL4t2SspHtZI4pKS+zLNte2kwCyBzUGfT2AGJo1cY5hSevano+GbrPrcBUMKbu2FIxZGQirEL5Qwh23DyKxtCZNP3j0Ld14TPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10) by GV2PR04MB11862.eurprd04.prod.outlook.com
 (2603:10a6:150:2f8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 13:41:10 +0000
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49]) by GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49%6]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 13:41:10 +0000
From: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Ajay Neeli <ajay.neeli@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Pedro Sousa <pedrom.sousa@synopsys.com>,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com
Cc: linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 09/10] arm64: dts: freescale: s32n79-rdb: Enable UFS
Date: Wed, 26 Aug 2026 15:40:47 +0200
Message-ID: <20260826134048.854748-10-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826134048.854748-1-larisa.grigore@oss.nxp.com>
References: <20260826134048.854748-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0426.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::9) To GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12558:EE_|GV2PR04MB11862:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b3aced-ff4b-42bb-237d-08df0377b02d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|19092799006|376014|366016|921020|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: fhAOjpEpR3ve8xwI0zX20eFCYNzI6TDpc1F7aM9o0MQX2Qj0Owp9S+Ye4LeF9YnD7112DeIXh3R5KZa3l+8jk8O3a5xYznp68xZ8jzB4f8T/jidousiYU1iS8pqZ8Z81dy+CYDKeMtJ/7C409TpXYZPZlgHsorTqKQf5oc4eb9sBrlC7we9zYgcyZ49JmhfELWbEvbFWVsjRQC8l8TeV+caz77l+q9Aw0HmQCh45iKMdnYXISfX/e/GjSm/k3ZvLZ4HJ7w+UbuGWfWlaN83hcMEteD+oEGAYBS0c/5/r+NkBC/4QPmRvWGfQjhCwrpmKZlLKKhCaxENAtMEhQ1QfFlzFO7tE63SlRSr9I7g0UQwuoIBGve72O8KY3RSMuOG4dwk9FmXYrc9JiSqm85xbxxgquwofncCSD+0DwjWidVi1CybHT/lNnvryrcYM7EW/Q2ph50BSq1lyvaLBWjOPY5ArbRE0Zd+9f+7JiHcVSI7pa/wUCz6aDF3h8pBisZRTHjSsFtMJxm6V6s/gHSRJG84lVaNAKUSCuggDRQlEmTb1yPnmthsiOjeBBrNvoiqWBNC9+Qc+XRLfTcHMLDVaS/NBnC9eTj+qVrpKZvMa6vE5cakP46g2eji6QkjBSQPvLlzhDXilSqDVX/2PjPyGxluPjn2r/91Xuo4zpJGuaGDvakSRcZrMCUm9kUFzK1wZ2mgXLPYKUPsFABKt40AHww==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12558.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(19092799006)(376014)(366016)(921020)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjdWYnp6cG5xaGNYNXFqTTM5YkxRUkE4QlZtcVNPckE5UkZuUWI2MDR0bUov?=
 =?utf-8?B?NGxZM0FTckFJVlNJYzJXd2dRSk9tT09IOFdkMXBhTm4xSTd0dVZmeHZYM2hY?=
 =?utf-8?B?Nkpod2RYVnFMR044VjV1aE8wQW9kcWk5WDl4RWNMQ05sbThXa3hBZk9kZXJW?=
 =?utf-8?B?bG1yWFJ5NTlLSkFMd2NVQUtmSjB2VUpRbGFDWmFTbDVxeU45NFQrQ3UyNVpV?=
 =?utf-8?B?OU5jQmNwMXFqU3QrU3loUkFnck5TVUc5MWJMaFFiY1IrSHJUMkhDUVBSVVQy?=
 =?utf-8?B?V3oyQ1BMb1VzSDRGMHFRNVpGUHljdTN3YklCRko3Q3VwVVE2WlJwSnBNM2ta?=
 =?utf-8?B?UkFkV0RCb0hRZXJBSlRWMjdUelRSNHB0WkhzQ0N5ZWUvTnp4R29NSkRsTkp5?=
 =?utf-8?B?NnhiRUZjM0lIUHF1RFJiSTlXUzd5QXZCdDJCL1ZJWTljbWRYeE9yMHBXbWR5?=
 =?utf-8?B?RVl1Yk81bU9zVncxMVJhd1l5ZS9vbHdzQ1cxZnJkSCtUN1I3ZGhVR3N1cnlq?=
 =?utf-8?B?UTVwRUwvdVJzTnF6SFdpOXFhbjRqSFJBTGt6VklDQmp6UkREd2NmeGUzU1VM?=
 =?utf-8?B?VVUyRHliYlVaK0F2cTdnVUlVdlZxRC8rVWw5WDBPZytuVEJBV3hrS2RuMko5?=
 =?utf-8?B?eWRlN2ZhUlVMaUZ1MWs4VHM2VFo1MjlGaFRFWUpuSFAzbVNLVDQraERIUU5w?=
 =?utf-8?B?cVZxRHVmMHphREtqeXYzZGxEWHJMOTJtU3VrZXhITmhpbzBOZzZnRlpzeFg1?=
 =?utf-8?B?ekVySEF2cS9vcXBYcHhYWXE4bXo5NndNWGZ2ZWtsZlpRVlIyZWNtTnppcE9Y?=
 =?utf-8?B?UmJBeXdtUGEvL2pEeXhydG5lMmE3dVZwR21xM29valN5eXVQOTQvTHIzNWgr?=
 =?utf-8?B?NmhRLzBRUGxSM0hFMzhpMHFxdDJmR0ZvS3E4Z0x0Q3ZKSU04dGFQVHlCZ2tm?=
 =?utf-8?B?TXJmTWNOOEJ1TExML0ZRQUo0VVRGZjZROFRZVEJkcHdkZnJEbEtNSVkxdjVj?=
 =?utf-8?B?dzlka3NsdUlZSWhNSnJVQ0dwTk15eXBIWlh5STdUbGdWaVUxMnNsVzcyOTNm?=
 =?utf-8?B?Uno0T1J5Umd3R1d0M0FacDNWUDdnL1NhdUQrTjFGUDd3OGxLMG8wQ3NBTm5W?=
 =?utf-8?B?d3FpL1o3d29yUWNPN3d0U0tvaCt2bzZCTjZpcUphenBvQ056azAxTUgybWlO?=
 =?utf-8?B?QzAyRStRdFJnZUlqejJMVHF1WnhBc0U5SnBtaWgwQWFndURCOTd4OWVtV3l6?=
 =?utf-8?B?RXZXRDg0VmM2a2lpMnRFOVl6R3Y3eVowSWF3Skt6cm1uWEpzNTZHUW5XdVRy?=
 =?utf-8?B?bG53dFhOQmdKWndEeG0zb2ZaNTVHTnIyeGZuaHg4MXpIcGZiOVkvUzg1V1BP?=
 =?utf-8?B?MHRwYmt0d2xrbkc0YVo5d3RZUzRLcFlRNzlUZEhqWlZjeWdHTm9jQU1zUitx?=
 =?utf-8?B?ZHlZeHVweFVHaXpWS01NZjFWaXBTSTd2dVM1enVmakZUMitzMisxdm5KRS9p?=
 =?utf-8?B?SHZnRjhtTGFVdmdvUVBKL096Wk1LQis0d1JDa3hYeVNKVjdZRDdYYWlLcjVZ?=
 =?utf-8?B?UlFXRk93YWVSTE1aQTlNMmJCY0VPcDA1UVhlN3NtNHhVcThMOTM0eWdHRjBT?=
 =?utf-8?B?UjhlcjBVZE5XWU5xREQwV3FXZyt0UytubnVmL1NIaWppNmZlVjVmbXJwVzcx?=
 =?utf-8?B?S1NxRzdmTDdHOGRzTXZXTEJsNHZkcE5xM2ZNdW1UdDh6TkEyMTNQUWYrZmd1?=
 =?utf-8?B?eVBNSktrVFZhdkR3RWFIM3JLdjFTeTdjeGt0TGxpOVRHdEZ1Y1c4T1JyMnZF?=
 =?utf-8?B?eHpQV0NqcGE4ekU0MWh0Ykh6ZUl1MGd4UngvZ2R1bklHZ2cxbStoc3YvVXU5?=
 =?utf-8?B?QTV5bFVqa2hnUnFkWDZnTlo1SHNwMW9yd01LWmIxZlhaVFJiVGJXWFFMQkJW?=
 =?utf-8?B?bFNlWWZ4MFkyLzNWNUJQUk9jZURBR0s0TmZiYUJ3Q0c1MDhNdTNUSDlPMkIv?=
 =?utf-8?B?QW9YOWl5Qk42Vkk1NVhqVE9LUmdoN3dCeVU1R3dmNmlDM3FOckJRVzdieTcw?=
 =?utf-8?B?a1FJZ2RQSFE5djZLeThUaFpLdHVvRStoVkd4M2g3cnBTdk9PSEU1eXFpdmlz?=
 =?utf-8?B?VFYvU0g4WGlVcWtJV0hnb1ZmVzM3NStnS0VhUUg5QlpTL0l0K29zVUNxcFhv?=
 =?utf-8?B?MEZHbTk4elhsQ1lPcGVYU2o4U2doZjIxdTQrWGFCUTZQK0JQMnQ4cDU5MGcz?=
 =?utf-8?B?WHlyb1ZZSTA2cVlaRnlETm9pUFRIV2RxbWkrbjBwY0RmM0xrQXE5U0VJZ2RG?=
 =?utf-8?B?VDdWeXBIMHRZYVM5TXI5Nk01dS8xdG1BTFE5U2d0NkNMVEFaOXBvNitsUEVy?=
 =?utf-8?Q?HDZiL4WvDbdYH8B0=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b3aced-ff4b-42bb-237d-08df0377b02d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12558.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 13:41:10.2363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLODwXwTBVcphgvuDh5kmsKJHqaGJ0AZ+p6xPP5/uSTdHiHX37b2Nn/HmhFC1KyAxLQmTyLdi4ohZIxxGjsYvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11862
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_064122_004784_1E0CB3E4 
X-CRM114-Status: UNSURE (   9.95  )
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

Enable the UFS host controller on the S32N79 RDB and select the M-PHY
boot mode. Configure the controller for two lanes per direction.

Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32n79-rdb.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
index 1feccd61258e..ff0c2b638037 100644
--- a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
@@ -63,6 +63,12 @@ &uart7 {
 	status = "okay";
 };
 
+&ufshc {
+	nxp,mphy-boot-mode = "rom";
+	lanes-per-direction = <2>;
+	status = "okay";
+};
+
 &usdhc0 {
 	disable-wp;
 	no-sdio;
-- 
2.43.0


