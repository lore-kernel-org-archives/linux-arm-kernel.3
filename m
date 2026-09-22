Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E9EC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 07:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqxCE2d5GztTR3HjBlRXysS6u8eaq1wh4DF+uFgkQhQ=; b=BAXIPrUN0AfGEbSvW1O9YurvCL
	tfOIHe2CXLE7LlCdREa+R/L1nx7k+PJ59oz/blFN/9j67cUBRrIx1rlncNqHoXCPLZmniNOzafKgF
	3IYle4kv4Ik64/RZaWq2JR3xNJCWtDyPczpEE8w0HiDH/vVqOvU1KOTWUbIeT9RA1iHOn1spoG7R3
	e+fbym9yhCwGJoS0mC4oPRHxRRa5mCIVBQu5A+Wm5KcwvK5wZswYMcdPJBp2jvMRI3kpSIwhQFJWX
	/2JPKSB/UcF9g7hoLyiAMpWqs+QF/L30Mc7zdNkhf904XJKyFR2zTnjzxYLcToVI4eCAkmlhmrZp8
	Rq1Q3O+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8v15-00000004WqT-1uXd;
	Tue, 22 Sep 2026 07:34:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8v0e-00000004WVQ-3hgV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 07:33:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GqxCE2d5GztTR3HjBlRXysS6u8eaq1wh4DF+uFgkQhQ=; b=mvHvQLum8yze2p9hCcBe/gWlpx
	iwTVm3zIPO2btcpFmbmj/CDHc2ZPyoLqTjkbotiutbOsMdR7E1cMgMqJ+fd0m+RhY2D3BPYLTQbvo
	HJg8pNLO4cqdOc41MPJXK3+GE5DrePomchiGZxV/Uh/Hx0Mc57WKw+MmJUQA/6JuVvdVaRBMtZM3W
	sZPwOpV8RT+dP6TN8APOzZ6ncczqGgerPj566OS9TRsTfBPpvTJ1KvFa8rvR3EJoBYc1YPWYKracQ
	RTXvOT3tOgC5aDMka5oDJQpi403Ftn8dZmfXx4/fp5Au+4qQ3WD0kT8awPL0GA4FhOFzPU2gKf8N8
	KK2DXKQg==;
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8v0c-0000000DDKn-0TCU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 07:33:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ln9T/xXvMJ7blqrxk1nRG+kYnTIVxDuUd3rlWjKBZhGDVefk/rMfsczxhZirKkEfXIVetPFGRbdzTuyUrSbP5Sj0h2Xr3bNJe+lGt6fGF5upIBt1YgjOwIUhIdQ3u0CGLckq16pp+ai+KeI+oFni9jK5G4Sk+ZmtfnEJkJmyP40OCKeiFyDcYWOIyrh5CABgjZZ49NZ6PAc1cDOAC8OXrP2XJIwju9XyEX+QPLIX4xjzObCeYn3K3jPdXBhEVdYH9JSEEzRgIx9aVuE34O8m7VfqXog2czzl3MOsTNn4nbys4EahGkcSVyeEoExAhC4/jyOTUAECMhSgdLihmdG8AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqxCE2d5GztTR3HjBlRXysS6u8eaq1wh4DF+uFgkQhQ=;
 b=iWAFG0OrY6WSPgUl5VEJGbV5qoAU7nItrCN6O1Jl3NdwaCPQf1rcxrZSjKp9iYFUF6pGcZE16f0J8gYdDe2V7WMHFeHax3tZq1NbC6QA3KErsVcPPxuNPHgfCFSOCGlXLJLSsBJjV6MZtYTbiD9AMtc/p3mLTCqxMxfUegqCPsTNhT1QbjwAIPZBpfsmTJWXqPxPvGjVQhSp0xk4rGKY8djUMZdJqzdsk2yp4/rn29Df9FSxJrYsw/Dj97ZRVmLmcf+9jy09phKmQy2fIbP/4O/Y7XGdXQD7JmuslPCTZhQsbo1VuS88oZ5zsPIgRBxUAilMS2UH+omw5kPAB8Q7sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqxCE2d5GztTR3HjBlRXysS6u8eaq1wh4DF+uFgkQhQ=;
 b=Xt/9CtRQtO5V1/3hFnVcBcGeAEqQ8HUr8cBMPHLtsaLHiJZAGazCTjR9+rBRXD9YlDdFUOhPyTjA3hi2ROFu16UcWuL/KJiHcNV0JKozeJq8kwDL4dA0O5GoZvjsSufda7d8KIGLzauPLZ+PWp5mS+cDu1hciQSdkn8Q6gYSlROVPniuwPqlf30w+k/uH5cwj0PRFGG4AnUsB/99DqWG8CHYM9h9pndAEOFLwzW7AoqY32P0Zn58FF69I1SYP9HLmSvYmF3v7etgWlr7p9IQk/nhVVfgMqgomTz5ZSgcKGpmabNj76N/4Z5GbLtl7hZkf9fERDhVJefF8Mxzn3AFOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10) by MMZPR04MB213195.eurprd04.prod.outlook.com
 (2603:10a6:190:4f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 07:33:32 +0000
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49]) by GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 07:33:32 +0000
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
Subject: [PATCH v5 10/12] arm64: dts: freescale: s32n79: Add UFS host controller
Date: Tue, 22 Sep 2026 09:30:07 +0200
Message-ID: <20260922073009.1449688-11-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922073009.1449688-1-larisa.grigore@oss.nxp.com>
References: <20260922073009.1449688-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0P309CA0026.EURP309.PROD.OUTLOOK.COM
 (2603:10a6:20b:28f::7) To GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12558:EE_|MMZPR04MB213195:EE_
X-MS-Office365-Filtering-Correlation-Id: c53779ba-34bc-4ec7-43df-08df187bcdd0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|23010399003|366016|921020|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: cTf3ofYVvVT4O0WUqLct0yI6WKRrFeXlfQdp6SVB2pv/7zvmGsxu1BM/jHahdWhFhKnNGSLpPP7auJZXpGOU5/PdMPnbcm8S7nzh9gMzbLo/Gn152ggvsvUMhgfEtU8mnoq96cVvz6s/iX0WIGLcIOFbLKKV72Ngz+7+Z/qYi46DLtdkMXikbx9/iNuMPh4CyebQBd63vPF1gk4wehkgUZNoawjfZCruqVTvZyvCPnRjz9sm/mTZ7UVTKzCa9TgjU6eQAGz5N+7u9asaed4UjgTx5mdyGYeH5pZ2Xp8v7/e2xeC07rK1q3CyMz900NJQZojw0IqRlSuLNtG7PHcdeoKpZlPNOCqGnRamDeQmwp/1Xi/k7Sq+6ToeZHPcH4vOCeYlfjbvM3q1gTrYsgK/A/IrIPdTqvh4hD8OQBqC5Pw7xSZVdLSu/Ru/Z2Hptsz1X6eA4Wdof5U2tbDyRrruSZ325Edea9Mnoj7zPMgaRackgDkG1sSSuggPilRs/0rH7vOX6T6mi89UHm8qHigSShCtRO9UGczuj9vvL+KqpGEYpgqnhoZwbZyuSF4wJXuica8+CRqmsDRA2H2kpAX6BQJb17/QdspeHJiOfrX7tvY4yacN9EAJIeKNG3wqVy/qJZEgTowXxOjDLQYK3hXxpIcx4db/w6hLvL9lfN+ab13edNYouLrhH+yJqyL/PbfFFnW89iGRjP5M8rY/U2WxjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12558.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(23010399003)(366016)(921020)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGdkL3ZZY1hGaTUvTTlHMyt1OFRrb3V4ZW1RNW5rNnVEcFFjZlkvTkYwOWJr?=
 =?utf-8?B?dDY3bk12QXZvZnBqZ0UrRTI0TXU4S0NtQkw4TGg5RCtCU2xwOTZnMmtpd0Zo?=
 =?utf-8?B?OTZndjI4SUNsSEVkUlc1RUhmR1pGWWFMWmp3eU5HUWFwRmlSTXEzei94S0Zs?=
 =?utf-8?B?TStGZG9wZFJQc051aVo2MFF6ejJQWS80ZHBpUkd6WkhYYlBuR2N1bjJFT3lw?=
 =?utf-8?B?cHhWUFVrc0JVWEJxRHdTTkJ5cHRMMVZEUmc1eStDR21wL3dSNVYyeXpscTAz?=
 =?utf-8?B?U1ZWdjNReTY2alhiUU9vZWNJUVNJRWdKNUtNTmswQlROVVFuSGV5NTdyQXNv?=
 =?utf-8?B?OWRZcG1qcGR1eDZvRWV6b09zM2pVTVUxOUlWNzIrUXZWTjIveVFQQWVsay9v?=
 =?utf-8?B?bDZyM3lMMVgyWG5zaXVCLzBYWjVtaGVnQmpXOHFSa2lmcWUxbVVSMkNIbkw2?=
 =?utf-8?B?ODZsY2JhSnRkelRoNzNlK0J4djZhcGVuZCt1UENKWmJOSmd5NGJqanRiZnJI?=
 =?utf-8?B?aXZLL3Z3ZEJKSjVIaDZkWVJFNUtucU5kZ05GVnIxbmJ2Y2dMcU1LNVFXNEhU?=
 =?utf-8?B?YzVDbDZLY1hRQ0ZsMTFjUFdhRVV3b3lZSm41WS9xekRSRDQyWVk1QW5GUU1s?=
 =?utf-8?B?YUZWLytnUjZ3eGV2dkxCNHpyVEhBSTZNcEwxWC9WcUlESGM0VEkxUWc5RDl3?=
 =?utf-8?B?QlVCM3ZDYzJWamZnR2I3WmtSQXFuMVJRMlNkWjA5OHhyMDBPTDVPNzF6clc0?=
 =?utf-8?B?Tk1IcUxvRzNheUIrc3FhTkhGT1FNSk9zTHVGRGVIUlRyakVuMGRVRFYrMUxB?=
 =?utf-8?B?NklycnpyY3ZGQjQ0R1piZFJ6YVFuQ3h5cWJCa0VDdUdzUGNobkFWWk9xaXJI?=
 =?utf-8?B?RXd2anZvQ1NjN0l3N2RLR2FRM3RabTY2TmdibDJaYUp5K1JlRFJOM2VKYkxp?=
 =?utf-8?B?UjNlQ1E0bXhhQVdaMDhUUkFDMExjNmtQZDZLZzVGYWZUVXFSOExtc0VJVU5H?=
 =?utf-8?B?eWpnSlNWcjd3R2RjZDBqSG5idWoraXJnak5HZFBLTWdUVFdTNzR4TGRSQUhV?=
 =?utf-8?B?OFdIemlrRzN5QUEyRForUXhsa2t5TEQ4WDlKUlliTEFEM0FQVWNNcEY1OWtq?=
 =?utf-8?B?djA4ZitpZVJ2SnVSTnpKVUNPS3hqSEJVTEdyaldhOVVrOVQybGppcS84cWJk?=
 =?utf-8?B?aXJOc2JuWFV4bG1hc2VVMWQ1ZEpOdHpSTmExV3ZYdEJCRUtWazRMbE5HOHo1?=
 =?utf-8?B?K2tTdFplWFJJOWNiMGdwT3plT1dpOWhqT2pQYjB3TFZvcEpFeWJVeEgxWDh5?=
 =?utf-8?B?UzJtd3RFRE9IT3hZdVhtS3lnck9UcWMxWUlQL094dSsyN2VwVjdZSXNZV1E1?=
 =?utf-8?B?NG1EVVJnY2xBRzdwY21GOHJXTmFZVFRwL2t5NFIrVDlZTHE5N3M4emNMdWV6?=
 =?utf-8?B?RWh2SDFlYzBHOVg1aXAweHFhZ3p4MTYwancxK1lxTTk4OXoyeFZTYzFmbm5J?=
 =?utf-8?B?Wk13NTR1cERQemEvT3BFZzRRS0FVZ1BNY2tBcG1reThJd1pwT092YkRtRUpv?=
 =?utf-8?B?TlVMS1FGbURicnVabjU3MnpnTS9lc1lJMjM0TE53VGQ5Ujk4THF1TVdHTFdJ?=
 =?utf-8?B?TmIrd2Y4L0hHUTdpcEtPaWM4NERPLy9FUFhBR0xvS3ZqaUszL0FjZU5yc28y?=
 =?utf-8?B?V0c0S3FLeEs1MUhyUHFGYlRSMzVOZERIWjhrWktTZUJZZHBwRFlrb1JWS3lD?=
 =?utf-8?B?Z1lnalNqZkh4MTYzY3BLZ0FLaVI2UkMzSmN5dEtRbTkrZk1mc1BhMDI1dC8r?=
 =?utf-8?B?T1JtYzFoTzNtekpJZStmR1JtUDc3dncxbXpZSmF2YlkxeUxSbTRiVjY2OE5C?=
 =?utf-8?B?Y2Q0cGJBYlBiS3ppdVl0bTlINWgwc255ZFhsVGNIYnhOakpHa3NZZExBTHNj?=
 =?utf-8?B?bjBld1Z5d1NUK0h0SEdJUU1BNUVBak5GL3UxQlFzQjNiZVlHQ3I2RjdMV3N3?=
 =?utf-8?B?czFtYS9ON09NaGRuYTZGMmZrMFJnN3pnaXQ5SGRXYXBOQU5va1dOajU0cTVQ?=
 =?utf-8?B?bTBna0ZnbTRlaml6aTNabzlJbUFMbUlZSGlCNld3cGI2eFdQRDFxRXpOOWQ1?=
 =?utf-8?B?NTJRLzRuNENwNTN2ditKZXg4Sy9LVmVGV1pjVmJlNWJrbGtxdDhicVdKUDg3?=
 =?utf-8?B?a2RucThqMmNrL0VxUExZblRHR29YMksxUElVVWdBVm5OenVMQ0ZGY2hUT25E?=
 =?utf-8?B?eGVSa0g2YWdkU1hqRFhvOUNybkJvUzdKZEc0dmRmRC9Xc1BETUY2UU1ndzJ2?=
 =?utf-8?B?VUc3VU0rc1ZoSk9PbEZBQU9jMU9Bb3ZPZWNtbmNoSGJsVlREOXloWGV4a0FO?=
 =?utf-8?Q?zk6kUzydEJ9RnIzM=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c53779ba-34bc-4ec7-43df-08df187bcdd0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12558.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 07:33:32.3699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i6woXJZv8sDgOqUlMnMfz0PlLEgaK5YbF6Skh85pOMGxjfT4TqSPCo2GP9np23X0B89M46lNACD2pBo0nEkHBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB213195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_083346_320520_B9D1B60B 
X-CRM114-Status: GOOD (  10.38  )
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
 arch/arm64/boot/dts/freescale/s32n79.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32n79.dtsi b/arch/arm64/boot/dts/freescale/s32n79.dtsi
index 94ab58783fdc..9f64a7acc3f8 100644
--- a/arch/arm64/boot/dts/freescale/s32n79.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32n79.dtsi
@@ -100,6 +100,16 @@ uart7: serial@4aa40000 {
 			status = "disabled";
 		};
 
+		ufshc: ufs@4ac80000 {
+			compatible = "nxp,s32n79-ufshc";
+			reg = <0x4ac80000 0x1000>, <0x4ac40000 0x1000>;
+			reg-names = "ufshc", "scm";
+			interrupt-parent = <&irqsteer_coss>;
+			interrupts = <211>;
+			clocks = <&clks 0x92>;
+			status = "disabled";
+		};
+
 		irqsteer_coss: interrupt-controller@4ed00000 {
 			compatible = "nxp,s32n79-irqsteer";
 			reg = <0x4ed00000 0x10000>;
-- 
2.43.0


