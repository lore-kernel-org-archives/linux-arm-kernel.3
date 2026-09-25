Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCEEC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 14:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UOWV9fRxUwt8l0WY2hoefG5eR2DygWkQFZDWhOqVZ0=; b=onKgahVMWIaZKLcpesgAm1/Vnf
	TXYXo9hGmd+7+oi18bLoWln9hek+/LIxHtBD4fXICmczzs+q6r5pW8Ya1O0pbjovJF3Wh1vl4HTuX
	cjJEHqkgxJbrZhDPeoi4n6oi0uXs6oboNEvbMhdNRVB3Q+lfQpT74gkkwFxEe+cFWAh5qZlBGBPXH
	dBjU8/5txJ4B1BalRNV/K65tr4iSsqaALsGo9sU3QO+nKtI3UC8FA54Y4HsCIj2WH2MgObzXhikpj
	sychnNkPV8ByCskNcoRZwIYPB140Gt1n+PqARvxEMIxxrhSA4O8stBfx/a0mQY0BbLQQqkt3NL1Ak
	dhv4vQow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA72C-0000000Dbhr-2Wjq;
	Fri, 25 Sep 2026 14:36:20 +0000
Received: from mail-northeuropeazon11011062.outbound.protection.outlook.com ([52.101.65.62] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA722-0000000DbSh-1HpW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 14:36:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZcRnh87wxk6j4Z58MAn9XPkFbCbY8TP3nbiEDY0SuzuXY7dgqDfKo0RUfYJnQF8BlnwrB6V3w+500mV6cqhCHWbIDf0TqHJt9v2ah0R7R5uPhglowEAnfxLbArMDNab6y+N5CCtL+VKvUtT6Sr7EI4ONHoAklPMXSI/OGvgjDCDdLl0vvtAof87dqsw0ucsUvy9SFB6+7QV7YH3QEMAou2+tMSxIM9GztDW2N/VyKVtxpgdox+/J6BuTPtRnDLHhdDQ6stKIoCBBNrg8HHUqd8shNZ0FryfA3KLLtejz8bn0SJ+Qz7Aw1GiyDSgcz8NQjLs4hfILRWaTpGd9TPx2Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UOWV9fRxUwt8l0WY2hoefG5eR2DygWkQFZDWhOqVZ0=;
 b=rjbmeQOxiQA+D3Nj+NS8UuWHCOoCacY66ddctVLlItFcGJpMTbb0djt7NnzVc8EK2eWIz9/Z/D9GgipV6SeuVovYJbEJdRWgcsluqaX2RhPc/b6D6EEtvGJpCEwCwXi69WEBaVlMgGB7LS9B548DulYaWtNHJygLTPRVLjaAQA7JLfGtIY80SjDbFVeJqgUu6txzkwy7UYAYKxCZt4er2CCCGnlKTUEU+s1V0+4gIhwzBvCSk6DIWJZBKKUZKrmSmtBLvFG09GJj4l/CAJkyeVCNDozl48UsrkkeVL0xECHcsBfxeXsQvQS8T/P+ky0L0UMfNJxguOwKPuoZlmnLYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UOWV9fRxUwt8l0WY2hoefG5eR2DygWkQFZDWhOqVZ0=;
 b=oh6KqmsjM57zLO6SXyWgA6344IxzaYqA+fFq9s4+YQOCCnrY7Pqbqw3o5PGGFI6OWibxU0EkfQV4/M9FiZBJDjU27RESv5T6tLiLXK7DH/m9iMKcM67IS/82mSWgKkDnEzFGuj6CetnEa2/P/ouBjzX02XUL/8vxMSWfRWer9s1tttDMeM8PBWOL6qkuxCzWyRXy49j40XUfWfUgC4KLD/6mCzo+/p/gaLLnxTY7fb7xNgNUaNmKXxWs8dgeldncqprcCy8txPMRDOIJepPdT87LalFjj9KDhND/ko+ehuSUIHWmp9tyYJfZ7Px6sOiMX/m++l12uQhDiFNdN4mDLQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10) by BR2PR04MB800621.eurprd04.prod.outlook.com
 (2603:10a6:2c8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 14:36:05 +0000
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49]) by GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 14:36:05 +0000
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
	Joao Pinto <Joao.Pinto@synopsys.com>,
	Hannes Reinicke <hare@suse.de>
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
Subject: [PATCH v6 11/12] arm64: dts: freescale: s32n79-rdb: Enable UFS
Date: Fri, 25 Sep 2026 16:35:33 +0200
Message-ID: <20260925143534.3298540-12-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925143534.3298540-1-larisa.grigore@oss.nxp.com>
References: <20260925143534.3298540-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::14) To GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12558:EE_|BR2PR04MB800621:EE_
X-MS-Office365-Filtering-Correlation-Id: 66901d35-836d-4b84-5ef0-08df1b1254d9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|19092799006|10067099003|56012099006|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: OXFKsMbfvqFwMbwNEwgHv4/kJeYYPqlZXK9EpqtBeqt3OdnKobwWFsLfDoeUtYY+WoNf4PEg648gd3oHE/pOthFnKXFPtWH4QSnQG5eM/DY/44cIaNBI1fogdlHuWQk+keVnJLWzWK0Bj0hZoiFUM9JrxUVtcZss/ugVZVSYqtNOpzS5/1aImb7fYOlGMVysAF2fSH7fSZA7bs55Vfe68ePz/Ggrr27Rv1YEBvcJh0RDrw8QGjxZalRlbRlXpJB5A0FrtPj2FvBXAZaCmJKz5w9fD/ofDDoQbGZdzkNUn8tVzYLXLQe1aRppzyVWLTNPGDkbla273wNowQUwlqB7ZC6DxNWA7pXSbuzfsR0KRvtG4f/GORrYVIBfa3nXc23t/0OpGn1uxECSwTxyUC71Q3E8/0BkoNu1WUO8qXoCs83ckr8WkQIrIMJ8rRsZ3NPe4x/Srr/C1PvZW+vwfpTroXPkrUgF+giwbPjnczTEz4fv6yQGMFMFX+aGs1oT6mk7dE2WI56XKFOb/3mqcZccWOn9GNDi0g+s4twSamqBr83lhy3WzvXI+3LsD24YjiVGfuUxM3ktNrqjvvfb+x7Ls1mSEXSJ21KhbRREI7V1BQVWElnY1imEZSivbQCejld/92k/T+7B+b2owbp3qwDUkleZ+luC9kB/zJkzrEIpsjFpqFsnclGlKKnPdMBMr4rA4ZnZllu+DevAx3VHBlydWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12558.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(19092799006)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGxNU0R3UHlXTDNmYlpLdGhvdVR2dDlnNTFsQ29yb0tPeWVnU3AydDFuK0NT?=
 =?utf-8?B?YjBXbXNqcUVSaE9YNTFyS0E2UTNLNzJ3STlJRFdEeVJTS0Q5R2lHQ1BMbnlL?=
 =?utf-8?B?ZVFROWZiRFVPVEl5aUQ2ekZaRkVBOE04c0VkeWJWeE5xNjdqbGhiaG00QmZS?=
 =?utf-8?B?eCtCYkdFR2gzUkVRWmw3cXlnV0U2VVdBcjdZdE1QLyt6YytlYUdIWU5Obkhj?=
 =?utf-8?B?eDlIU0JUV1UwZUttUUhBMEpGam10ZWJkN1FpYWxLakZRaWV1VnRWQlNFN2dq?=
 =?utf-8?B?dERqbFZvdHMrc1V2ZFdIMkdvWWJpbnM2d2UySlEyMWt3blA5eGZ6ZXJYUXM2?=
 =?utf-8?B?WmhGUWt4bVVYMWlPelZwbWRGTnpvSDJySnk3M3lySnNuSjdZd204ek4wU1lL?=
 =?utf-8?B?bndzU1JHYjl5RGtER2NmaDNBbmhjdlN2QmZkdkhMbUU1bjcvcUhUTCtrV3Zi?=
 =?utf-8?B?S3lyalM1RGM2ZCtUWk9RM01SbEUxazVVRFVjNGgyOStoamp5cVVwaUFCWVJX?=
 =?utf-8?B?MXhEcEN5cHhqN0pkeFBhUjMzZm5OYU5SVERwVlg2Y1RuM2tBU0grY1JPTkRM?=
 =?utf-8?B?VHhoNU9NNFYvN0MwcjJ3NE0za0FwekxlUHQxdFZERDB1SHpaNDhSOFFxZmNJ?=
 =?utf-8?B?RCtHVkUzMjI4d3I0U1ZMTGZuUlFvZklMMjdhMVhncFg4aTU2UDBHNmVBVzZ5?=
 =?utf-8?B?Y3NpWlBxbE1BblhIUmUyc04rNHNMNE1mOGZENHN5ZUNmdjJLTEFURFlVWWJO?=
 =?utf-8?B?TkFBY2t6TVVWS2lxdTV6UFhSR09RM3haZXU3K2lVaE5wWk5aVmlSczh4RnNq?=
 =?utf-8?B?RXFFcElwMEphRVRIQ21XZDlPWFdvVkdtT1gyTzl2bTlEQWpvN2x6SFBtOFF4?=
 =?utf-8?B?dWRrMzI2YWJIUnYxeHl0Y2dCZ1J0VzYrZFBEQjdpSy9wU1hBajMwaEhiQlZI?=
 =?utf-8?B?bnh4WUlVcTRKaGNDKzM4S3d1S1k5TGFiamUySEd6YmJFVXNwdFR1YUxScnNw?=
 =?utf-8?B?V21LSWFUK0U2d0hGNmtRMDBqbStMSU1OamN3SDVUcG1mWHJLQTRibC9Hcy9Y?=
 =?utf-8?B?N1czNll2cFV4LzBERlgwVnhnRkcyUHR5Umc1WW5NNGZzQmYyQnFBVnJ1eFNx?=
 =?utf-8?B?alA0Tk9YNWxpU2tFTlNCa0RCbW9wOXhacm1NWGd3SWtFVTVtbXVObjM5ZFVU?=
 =?utf-8?B?ekw2bFVFemxnVE41TVlicUliRUFKVXFKTTVlQ0NwZ0czeDhNUTJ4UW1zS2Mz?=
 =?utf-8?B?VDJlYzBCV04zSHhyZ3Bvc3FwYVBjdTFCdmM4V0s1cUFTT3dWSnlzeU5yWHRr?=
 =?utf-8?B?TE1GWHZ3ZTZCSUh6STc5WDFqTklwMUpXUDkvdEtOMUxuUTlGTDR0UThYMFF4?=
 =?utf-8?B?VlBqUU1Pd2pURVNTdjdzN3FMK1JGQjRSQUJPSnhjWmovanZ4M0NRaUJXR3V6?=
 =?utf-8?B?RXN4ekQ1NWoxckc1alVUTUNTR0lPTWwyR2N5QzY3U3Z6enhFaENzSzF0RzBD?=
 =?utf-8?B?SGpJSlRBa05nQWlSVGRaOGZyNERSTHdhQXRHc0JidlFaUUNJWW9QZ3l1T0di?=
 =?utf-8?B?cStxZExlWnR4OVd0UG9YZXh4K01ab0hqelovOE9HOHdNWTF0SEQyQm04Z1Y0?=
 =?utf-8?B?NXVkMTEyTXpGVjVEd0NtdEQxbU15MlllR1NhVkl6TTYrRUxicHpNZDNYMDVa?=
 =?utf-8?B?VWQ4dGRWT2JQR1RJa0dXSnpEdUdxVWpuRUFSaVNnYktzcEFQMWtueExJUGFk?=
 =?utf-8?B?OENja3lCVzdOb1lBMFdkaVRtUGZKUEt6S1JVS1BOLzRVT0pMRG5SS01XNVRR?=
 =?utf-8?B?aDRhM213SFFkUFVISXNWNkVreUh5SWt2NzZLZXZZY2JBZEM1V2pQYVhHVm9t?=
 =?utf-8?B?aTIvMVNSWWxzS3ZHclhPWDUvNVg5YTUvem1EZ3ZYNWwvaThTZlN3RVd3UWpD?=
 =?utf-8?B?ak1MS25CQ2NhMlNnZWdHeTVsRDUvcnJPZVZWTS9YOHVmcXBVN25aemRCOGZE?=
 =?utf-8?B?SU5MNnpobkQxSDR2OHZQSVczYXRyeHpiNE5jMTM3bHExOSt4NjJJdjh4dC9k?=
 =?utf-8?B?K2pEV2NaZFJPalF6b1hxQ2duTzZud1RSZUhReHlsdlRWVkowQ29vaysxYUxD?=
 =?utf-8?B?SU4welk4cXdqbUwySjJyU2F3OWxTaWZmZ1k4K3VsemZKWmFiQ3ZIeFJqY3Jp?=
 =?utf-8?B?OUFERjU3blpTeVVqQlRxTzEwRmdCOEpLWitJVEZHb0VqZVYrTEI5TTRMTE91?=
 =?utf-8?B?WEZqM1lFYm9OV3BoZTF5OXBPNWtrZ3JPVWVQUGgvU2tYMTlkK2wrTWluOEFS?=
 =?utf-8?B?NFE3a2JGbDdmMStxQk81NnpjaHo4L2N2ZVZIN1N0elFnbVVPMTk2UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66901d35-836d-4b84-5ef0-08df1b1254d9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12558.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 14:36:05.7545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /g8iw6qhQKm6bLQjdoi8d9auPn/2dt4LmlV49yajsTBLADpOOGFy54Qn7dMHVWcel/HiCXgAALvUCo03I1XO/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR04MB800621
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_073610_347509_980AAACD 
X-CRM114-Status: UNSURE (   9.63  )
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

Enable the UFS host controller on the S32N79 RDB and configure it for
two lanes per direction.

Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32n79-rdb.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
index 1feccd61258e..38c5699e6d54 100644
--- a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
@@ -63,6 +63,11 @@ &uart7 {
 	status = "okay";
 };
 
+&ufshc {
+	lanes-per-direction = <2>;
+	status = "okay";
+};
+
 &usdhc0 {
 	disable-wp;
 	no-sdio;
-- 
2.43.0


