Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D43CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 10:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hF3nTCFLMDnJEx4BIfPA06NvPZ3H8hF9ORRPLqvPvTU=; b=bKeygAYiqVphfaFkNXVcgMtmCe
	zPUG8I34aFIEVvphWoSN9h4L6U4Tz+oXKkqkQ8Bsgjy/fbUoC8tQncXdhabJdWXZAcpSGVyqLLUwh
	hbMBgzB/LqCOgLcEe5Ob23f8NDFXLWZfi4BSnD5QXuhlnekye15auQlQoJAOdZTeZ4dHzkOlJCh5L
	wOnWouErqY/5xaohAoqSNFD6eWbE83SlU9sWMWdw3RQZUEvYuk2aibxT47N4QYh9hlzPcf7auG/TL
	xc9CD76QYVBuLac2wykoWNw5wHPeoQv5RyRcJ1Lw2QhUXEtFv5ZgCR7AGpbLcdsV9eYWWlV6wC3Gk
	4PX62UiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZnS-0000000Ca5w-0YXf;
	Tue, 13 Oct 2026 10:31:50 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZnA-0000000CZmD-3gpN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 10:31:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKhdAh8IPDOJND6zB25NZzfceeCmUE9ERmaC4L5gdgKBgv/Tpmcn/CI+0SEnAmSdYGBEauRrnp6s8W91QhPb8L+SgmCbWgu2KK/4MOsbX8D32ik3y4o0CcRnqqkZ+h+eLczrY4njh0oIdwFaz99t/cFMCUpdl7zvK7naq7ZFY0hvjt2Olrj/mGZ1uBEd5Juh8Rj+4ZR4KqrOo/0QdAqcNmg3yXAZlO6X4/Ru6g5EDEg3olBUKJTokfxHFfif9htG/aRq6kh5OSrRSqBT7ASo7d13g/M4IuzwMl1KL6bh71m2dWv2kLNonXQPq7BaKht2pv/HaGjjAHGUqNKWId9sPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hF3nTCFLMDnJEx4BIfPA06NvPZ3H8hF9ORRPLqvPvTU=;
 b=VKpEajVuJVNPMEuwrMTZ2CA/mK9Bd+7xnxHMueg6Rt2+rU113F/KCPE5SIH0r5l0pzBLrlXjuaCrvYqeDhEllzulnK6VWTg1DGQNbiXTB51ImOCgbvO/+/RIt4UewtgLrzmE7VwG9ib9QSIY/6rqN5iBbqplDEBP6faUMN9OyL/ecyu89sB4/gPo3vYmgEvlbIhlnYGZOsjVG+dWgrcw/Cy8tSvYl4nQRjB+hGEiNTNTIwmCGdc4MW4o0nngnPLwSqhllHIuE2U6p94Yb81ULy0JSb0ILbn6p/MB42qS2yr/TY0kAR/g9hFFpdJmwKyMCjKtDDMJowG9VFDJ3XHDdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hF3nTCFLMDnJEx4BIfPA06NvPZ3H8hF9ORRPLqvPvTU=;
 b=p6I+9Jy+YB6ZY4kBu3/OCvDixkQVgSZtsbO7Yij9XVng5XzT/kIWkzSXM2bFdgtRnezD+M1v8not7Fy1lC/CgK+WlFt/wgndWmnj/7uly/Ykpqo4K26vkJGITq0kIEymaeUGFyK3Qw1IfTZTPsFbHbzRZE+5P2PMopsYy5aXjZhYy6s5ve1hnosuRiRxRlIZZpDG1SSk5RwUd9ZlZ0XmIV9L17qQx4GUfZOtbbfMzwuk2AJg540doxai8020wfnH7nDSXfKY2XW9oqO8SPNYXTLezcMpawpPC+LZGkHSMSvr2Qm3qij6Gs4izgBxyhOPbxdOqyDR6eUGLnpMF7dg1w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10) by VI1PR04MB7133.eurprd04.prod.outlook.com
 (2603:10a6:800:126::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 10:30:45 +0000
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49]) by GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49%6]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 10:30:45 +0000
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
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Ajay Neeli <ajay.neeli@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Pedro Sousa <pedrom.sousa@synopsys.com>,
	Hannes Reinicke <hare@suse.de>,
	Joao Pinto <Joao.Pinto@synopsys.com>
Cc: linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com
Subject: [PATCH v8 10/12] arm64: dts: freescale: s32n79: Add UFS host controller
Date: Tue, 13 Oct 2026 12:30:01 +0200
Message-ID: <20261013103003.373156-11-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013103003.373156-1-larisa.grigore@oss.nxp.com>
References: <20261013103003.373156-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::20) To GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12558:EE_|VI1PR04MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 46fce847-29af-4ffd-cd0f-08df29150a49
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|7416014|1800799024|376014|366016|22082099003|10067099003|18002099003|921020|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: kQ1bYh1ggWwZM1wE3y7koakeO9q1NaWvwwxXzK4IkP0zdfZ/P9UMJ+0+j9jVifUFPrcyBczAW3oo8fPDSUl8glOTwTagHniUFAvZBGXJxbOuEfDI8Jed7dZXqcDjss292sWZtp1i7gYjQwGpidFd+9lqdVd9WkVdwZ5sgLGE6bMTvmRfuwh83jwn5rXWskoydXqmxxqe03fhanFf6NELkEFOdwAOAlOczpl10ZvXgcFJmPxefamzB+pFac0Q/pIetIPuLQyx+4jSZ7AFKOcby2UO8hY0Q9GD22m86bqRrP9lwfJz3cqrH7Dc+If7DbIef0DoVNmlzrPU8uBZUZgbpTcbgL2BEDjr/e1BZBDvzYTmlg9iG5YQCEjqbSaKUgRXIU5JnML34HCaq0Ut70k4RhISVHsmQYa5xuIcaN9sxuy2XIlV03rT7Z9KismHpb2PFdp/2KrcgaiNM7kc9T1ju9mqWCbRp946wc8z5JvZNM1IyTvix0c9xGeIy0d7IC1ZSTkMXvLcBy57UeSa5tTR4QBHuPFO7gy3Ma1fjshhKGju3tgWJL8UcJEsktWFOX1nU/w26yFncL5GXE/ghWgoTR6pDAq9waTGlaYt2y1n/bXY36JrfKEwxjPE7EI3x1z6GnCzSBNEqaA3Add67KZcferUKw516huT+uVWj0QvuczPsOYBi2V4jtVwE0zNIST8Dfi75Uea1oUNcX83S+Tg/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12558.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(1800799024)(376014)(366016)(22082099003)(10067099003)(18002099003)(921020)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1EvelBoSi91ZVhQeG41UzRoODhqaGRHNTJtYjdhd21QTzRjQmRHSDM0N2JM?=
 =?utf-8?B?TXl4SXdxSzRBNkVTRC9uNXZNSlk5YXFqd2l6aHpXWmowcy8xd1hGVlhlZXh2?=
 =?utf-8?B?TXlBWSs5dkN0RWRPVUxBZVpwa2x3aXVBOHVFdVdGcitWR1Y5TmhmUVZUSEc1?=
 =?utf-8?B?MlRMdjArR0hRK25wTnA3TlJyZWo4NzluZC8zdEx2SzRXczU4ZkFwdzlaS0JR?=
 =?utf-8?B?QUlJVHFzY1duWlExSEJTWGJJclBEa0l6TjZTY2lENlpiRExRZC9RZlFNR0k3?=
 =?utf-8?B?L0U3a1FTVEhyTFRpZDZkUGM5L2FIMUpSZHFEcVdZcG5Ec0IybHI1OFBaZDlJ?=
 =?utf-8?B?S05tenRCdDZBQkxjSWt2MHBwb0EySkhseTlRWkJ6NGV5Z01hbDg2NE83QXg4?=
 =?utf-8?B?UkhZdUpxYXdiQ1NqL1dUVXNTVHozdWg0YUt0SVNVZmtZbm9FQXZjd0pqTjJD?=
 =?utf-8?B?czdZQzloaGVkYlBtek1XNjBBZlhuVnpZeU1nSWthWU1IaTlqMjM0Y1JJOS92?=
 =?utf-8?B?N2QrMXcyUmwxN0dBbkZucnNacGw1VXNWZHFMYyt2MGZDTlBMa1g2RDBxUFhp?=
 =?utf-8?B?N1NVN0ErMUtLb2h1NUQzbVY0NnhJOURBNWZ3QWJRS2ZDb1YrSFJXUnpzY1hY?=
 =?utf-8?B?dUwzZGJPaHB2L1AyV25SbnhIdUE2MC9PSUNjT1cwckhSN3NKUWpEdlZ5M3JI?=
 =?utf-8?B?Z2xtcnJCMTRkODhIS0VqNVpxelcrTUtHRmdMMms3cndtSklTakV4MHNvempn?=
 =?utf-8?B?b0hkZHlya1VEVlJacytJWnF2MnZoUzNMTTZaL2V2cC9ZYnc3bjMvd0N3cDNo?=
 =?utf-8?B?M1VVM01rVnZLUTVybHh1VzFwajNqckNjQmdTUHlyNXVQSW9HMmlwNmNBS0VE?=
 =?utf-8?B?bW9ack51aW5kcytudTNRdlNJM1FPb3FqdThPd2kzQXdOVFdTeFZiY1h3YnRw?=
 =?utf-8?B?QURCNm8xcUdOYVgrdGRxYmQ4TWxLOFNVU25lNzNpeGQrOVhFSjlDVVQwcklU?=
 =?utf-8?B?UDRKYi9YZEx3SklIK0FkZWdQVVlsREVlZVhENlBISE5PSHJRQ2xNT1dFcDRm?=
 =?utf-8?B?VDJXUkNOU24rbUw5clRyWUZ0VTZnMm9LODNnc2NDa1ZRSnhjTm5CZGZmS25N?=
 =?utf-8?B?MDZ3N3ZudTl5dGZGUHI4MXhSdTlpYVVFVWxUL3BsZVRaNFBta1FSVTJGdC8z?=
 =?utf-8?B?YlZ0TUk2VGFmbHhPcGpDaGpuNlpzOEpmMFcxZmNGSlNkS0Y1L2wyam02Nno5?=
 =?utf-8?B?M3U1L0lQaGZsbzh2MlZUQ2Y1R3hGeVlNakNOWSsvVWFWTXlwVjA2NjhZQ0dk?=
 =?utf-8?B?NG9jd25HSjA1U3pub2s3Zkd1aDlYajdoVmUrbm1oei9NdlRVc3hGOHVMVDhj?=
 =?utf-8?B?WGNNZ1g1cWs3dmg2MjVkKytOQy81QkFNOVMvRFVwUDh4a0c5QWM1bjdOYVFT?=
 =?utf-8?B?N1NoSWNJdS9kRnFvV1FGRzNTZVFxYWNmRWQySjFKZW1HSUhXVEh6d3N2SEs2?=
 =?utf-8?B?eGRpd2FTRGJodXcyQTQ5VG9wcHI3SzFNM3d5TmlkQy9CeXNlaW1TVDF1M0ZV?=
 =?utf-8?B?R3hJdEFqQVpnK0RUL3NMVzZzNFRQQVZqejZCdWRVNUU5Mkh5K0cwOHUyeURi?=
 =?utf-8?B?dDgxQWw4NWJxY3IyVHlEUCtUV3pqZ1JmblZ5RnVpemtadzJ1Wm1FaTFaWU9S?=
 =?utf-8?B?aUVxd2doWDUrbVozcHBUZFlYU21GUHVkSUJrNTRSa0kzNm1VWkRUUXJhcTFo?=
 =?utf-8?B?UWdtN2ZDeGRsS1NzYTV5RndOTGcvdFpUUXFUbUhWdHdhN0NQQ0VEejMxM0tv?=
 =?utf-8?B?S0FMMnVhY0JtS2NqRkVpSkhjam9LbXVlTkZPYmFlQXI2YlczSUQxMHRoUXBv?=
 =?utf-8?B?QkY2RzVQS280azlHbEt6SC8xUU9qMUFJWlhPNzN2Q0h6MHhLRS9nczJzajJV?=
 =?utf-8?B?N3hiTVZaUG01a083eW1pcTE0bkU1eWZEZHJyOWpHeHZhVUhrNTM2SHlsdUFO?=
 =?utf-8?B?ZHFCU0poYlR6cDZlY3RLMFNMK0pKSkxvVzlJaVVGL3BjZnBkMVQ3Ym0yZDBq?=
 =?utf-8?B?YXJ5SStDT1VXR3FrN1JRNXdEemVQRllTMXhnQWdRcE9aQ2ZVNU9IRGJjSXZL?=
 =?utf-8?B?c1hlN1ZIelRPeUNIbXpVdnJHdER2ZDQxVEJRODRlenM2UGdQODduYkt2T2Na?=
 =?utf-8?B?NGxTL1Q0THFpeUpsbFFyWWVyWlk2NWxRSWNEUW5DZG5pK3VlcnBiRzZZOTV4?=
 =?utf-8?B?Q0pLbS9pa3Nka2p2R0tsc0Rtb0VWZmZNZUNSME95Y0dMYmFhVjdlRUwrT0dP?=
 =?utf-8?B?dW1WeHZpeG1SV1YvM1ViMFJaeEhMNndaWVdDcnJHbFJDTEdiZy9nZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46fce847-29af-4ffd-cd0f-08df29150a49
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12558.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 10:30:45.4409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHMK87nvv10PFxzMSSABkrDHciKpyOqJHUvw7STjGfxAUml9eEoDXPlhDrX9RfJAEGpPEScZLO/ezKjtqivebA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_033133_001531_0F49E820 
X-CRM114-Status: GOOD (  10.45  )
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

Add the S32N79 UFS host controller node to the SoC dtsi.
The controller remains disabled by default and is enabled by board dts
files as needed.

Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32n79.dtsi | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32n79.dtsi b/arch/arm64/boot/dts/freescale/s32n79.dtsi
index 94ab58783fdc..c74264a3e4b1 100644
--- a/arch/arm64/boot/dts/freescale/s32n79.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32n79.dtsi
@@ -100,6 +100,30 @@ uart7: serial@4aa40000 {
 			status = "disabled";
 		};
 
+		ufshc: ufs@4ac80000 {
+			compatible = "nxp,s32n79-ufshc";
+			reg = <0x4ac80000 0x1000>, <0x4ac40000 0x1000>;
+			reg-names = "ufshc", "scm";
+			interrupt-parent = <&irqsteer_coss>;
+			interrupts = <211>;
+			clocks = <&clks 0x92>;
+			clock-names = "core";
+			operating-points-v2 = <&ufs_opp_table>;
+			status = "disabled";
+
+			ufs_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				/*
+				 * The core reference clock runs at a fixed rate
+				 * set by its parent, so no scaling is performed.
+				 */
+				opp-0 {
+					opp-hz = /bits/ 64 <0>;
+				};
+			};
+		};
+
 		irqsteer_coss: interrupt-controller@4ed00000 {
 			compatible = "nxp,s32n79-irqsteer";
 			reg = <0x4ed00000 0x10000>;
-- 
2.43.0


