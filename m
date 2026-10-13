Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B62CC6B10
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 10:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UOWV9fRxUwt8l0WY2hoefG5eR2DygWkQFZDWhOqVZ0=; b=bChU+3zArkBZxccE2gJexq3jsD
	ADYEOsxe1kGoPKhMRQLOl4RxXuF1SJY/FUSAa65OQ2XFTLSuILd93zWni/5bm7d0efe8thgHsb5oO
	VI73G7cAkL7Pce6NrRDMTTXmYFI6/N8Sy45DcURJrG6c0zcNPctphtCbzRK2+EXi8eQ3iL7tI7Np9
	PJkz7b/+zdZCP8UrLT2mMWQpyHleCk5FMKs2IVZWXL7G5XG3ubEyXMU02gnjFum4hPQhcI86XsR9l
	6qfPm5iGL/QzEzVjKzlQQ5dLhN0iLMmnq06QwJsXxf5F/SWOVE67/hNlH1QDstfiVA35h0kRlFhVz
	BN966/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZnS-0000000Ca78-3H8U;
	Tue, 13 Oct 2026 10:31:50 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZnL-0000000CZiw-1UlI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 10:31:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3cihoy32urtMPt/IBs8uL/XcWM/cwK5N45lZJh8q/UHPmiG3MpMjmGKTck+P/k5kFgZymU8yUNrDmChssuHuWguDbXrq7L7rLOH0fViT8w4GX7K74j/uCJ64UD+A3lflK1ZQG84SMCoGK2V6eP5QooQfxsACb+20EgDHChafTRHNfU1jvOshzCHU95kgU1zSjRmYHp2xIYp5WKenLYO3w4MW7jDsBpgsTptsImxv6IimzqJczJpER1FmvgjfJZrVVjQfJpQSeMqJbasR2P96lph2U35mrRF8c7lk3a4BGpPcBe1/zdpytXEDQF5RomyOHPz/9Af37RJEk2SkLlcnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UOWV9fRxUwt8l0WY2hoefG5eR2DygWkQFZDWhOqVZ0=;
 b=jP6esPOHLTuRCsuWfZyMIs2qnHfJIQlQEczHtYCMY31OxWS+pPypCdccchSj4kVZ6bS8FHf/DfYFvuVn3OKSFO09Pwbi23hw/SR2O5sOwnIXXRS/f4uV0fva/PooDP4QZTR/gRY5bmHjf2Ul4DSS3Fp3ExhEF9QVHvzxwxFBZ0dFEOHMuoE6Re8BhDwRqKq4gxsm9lnSK3bZ3oxOHz7JEKSXXWvF6M3vLmrhR9gWEqkBRNF91bGfh4BC4gO3CUIEzLC4fzDq5rKK3LVA1bYdgV66/lG7RcGHN4ncahva26PTTe0YuGXUQFNoMvEIHlXgivCWB7IHUXkPI2+HnaiBQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UOWV9fRxUwt8l0WY2hoefG5eR2DygWkQFZDWhOqVZ0=;
 b=uv4AuIQxwQkVTaYeNtou8TxOeSTZjCFkXaMfFjzKz9tQnJGYH7zpWxe8Cx0ZmetBbJVus06eoyBEJlk+UvkLU3rzKfl1zwt+4wJtI/nF8qx2w3IG7UicTFx4GpObo1t1GOdRguStdti+jzGqUJ5p3XKI7tWXj29AEd0uEmzwvHqv1b/I40uBY0BZfjuuyyI8KP+HssBhG08NEBNjzZ6qhIQ92gR03pxrgI6TMIE7VAKA/cgY68iaWwLm7fOXpzxsV8vye0GVHwIpnuNSHSRfFd9GXopz1Z5QSpeARHRbf9dv1anxwjURqGXBrCbhoTfVUVD3kpxmxl+sgnr2UDOAhw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10) by VI1PR04MB7133.eurprd04.prod.outlook.com
 (2603:10a6:800:126::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 10:30:48 +0000
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49]) by GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49%6]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 10:30:48 +0000
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
Subject: [PATCH v8 11/12] arm64: dts: freescale: s32n79-rdb: Enable UFS
Date: Tue, 13 Oct 2026 12:30:02 +0200
Message-ID: <20261013103003.373156-12-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013103003.373156-1-larisa.grigore@oss.nxp.com>
References: <20261013103003.373156-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P250CA0029.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::34) To GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12558:EE_|VI1PR04MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 264d5819-43c6-4656-c31b-08df29150be9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|7416014|1800799024|376014|366016|22082099003|10067099003|18002099003|921020|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 0AgPuVmRAFeffW2UO/QVqdDK4Q/nPRdY3X0eKlWzj/1ExnlLhaqZ0WJpcCzKCgTQPa3ZZTDnkn+DSvMgmZKYX9IktUrOsmvHRKhKq/2qwRibkt24GBOFcjt1PnY9/gSpxRJ4AJB1d5r0VOnkxbqMnsJA0QF/p4VBtC/zsvPDILnRJVtdpF/HYCcuyC7AP7vHcZ0uZj/AO6mMmoLYRkDwFfRUHn6QBDEgb501zVBCwKIQ+bJ0Mn7DbrAMo0eAep7/L0uRFbM6Zj1HNsX5+PDpU4nIFescuUtMpwtuKiAD0Zv6XlX3LuAh4S0M6/FenW+OZMF42IBr2zPdTBshBz9uEg0JP2ZywuL8nIcU2vmvXPLpJcEn8DEPK0aDCCDrN/B/N6nNVOXCDkkaJCJ+FxMfGc7Akfj/roKdgG7MIV5xFiWqxkSHmBxLk+PlsZDnuiHYyD5Dq1zuK2pnu2thw5V7w5rmJGcVsbl6u0jj60lK453ClyqtH8w8umLrwSmNFSDiZDl/lf+ei3IZfZ2FGGkUJgkQuiYmmmdfrHb4ZcZdFEH+NfX9wykEpFML93QXCgjsqQlqi/lkA59Ua/ZDvwG3941KLi5WzAcirrPhUwApcndDg2jAX5rbGPvR5GfhuAWIw8bca5/aS0hKnZyOI+9ax/bhYKldGEk2Wi1U7Ws8olYlRWrgwTwlyQP9PqnCxqsQOevUsUjoLnZCb02qAQS0Aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12558.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(1800799024)(376014)(366016)(22082099003)(10067099003)(18002099003)(921020)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzYvMlMzK3V2RStqZzliT2Y4N202QjVVZ2JJVUI4NmRZSzhTNnNXMmtJSGdq?=
 =?utf-8?B?Skx5TUF2NTNmZ3ltUGFYNmQ2b2VGRVg3N2o2SjBOdC8vY09uWWRhT1BWOW5R?=
 =?utf-8?B?TkNYaGhCUUdnNTNieEpEWVREc0JBbDlLRXVxaTdJRU0wNFI5TnhFdEtreURC?=
 =?utf-8?B?YjJacnVsd3o4dWhNQjg1b0t1Z3RaTzEzY0NWNTgrVldLOFhWQW8yb0JYOHI3?=
 =?utf-8?B?QXNwY1hPb1RBN2h6RFVnQWlZVjRrS2I3aXJ6RldNOTk2QUN2NmhrTmZ2NHoy?=
 =?utf-8?B?VnNrQlpHdVJ6WldYNVhTc2lHdENOVGljeEgyV01PVkhiemdkMG9ET0Iyd0kr?=
 =?utf-8?B?WmxkdThpWnpSZlp4UVFUUUZCTk1zMkpSQ0kycWRvbUUzakM3YkxrbDlvNkJE?=
 =?utf-8?B?SUdaSjhuaDl6T2ZQWjVBNE5nTGZOeng4VTRBUitlMzVOUmJKblp3eTdPaDc4?=
 =?utf-8?B?K0NHMDA4dWliQXRLMHRtVk04dEdXeU1pTFlYY0d1NUZxZGpLK0Fxb1BpV1Uy?=
 =?utf-8?B?MklKMjRVRVl5TGNybEdLTFRFTkxwM2FTbDJBVjZwa0d5MmJzNTlNVk5uM3lH?=
 =?utf-8?B?QlNnSmpCUXRLcVVIcjVRbmkraWJzVVJSN3BZSDluVzh4blZLWTE0akMrcFBi?=
 =?utf-8?B?akJOcTdRZWhWVDh4VDNYZWxFK0lqbzRnVnFCRldmQi81T0s5YjRJVWV2cVpj?=
 =?utf-8?B?WWVEL05McitCRFc3ZmRnUW5yZDhhSHhXcEVzMCtqRXpTZzdkdGc3a21MZDZs?=
 =?utf-8?B?NVFkQnErWGpzN2p4STJwQlJpdWtNcHh2YjgrU01ONWgrVHhBd2pybTF1Snkz?=
 =?utf-8?B?azVrUlVybTB5dFU5dmFYSEkxWW9rU1VZNWdNSHVvRTdHdXAyR0E3Vm1sM1J5?=
 =?utf-8?B?ODBXVk1YZzk0NWVwSjhLUWRMMG5tUEw5RSs3SWJiWVNEYTZiRjRPamFCVk1j?=
 =?utf-8?B?YnRiMzNzcUpOdkJzYko0QXB1TmJTSWpQODRRYlFWY2RJQ010ZFZqdjJ5YkVH?=
 =?utf-8?B?OHJ4bXRTYzVjWkY3R2t1cjhtRTlMdGFzY0hLNDI1b0E2V1FHWmt3V05zVGtN?=
 =?utf-8?B?QVYzNUZsZmwyTkZKSDNjNmJXMS8zM0NWdFRsNlFGVjRXSzJPMzVrdkhEY1lL?=
 =?utf-8?B?bGpHUUFPbEVFR081K08wVW4weXNjNlJZbmc0QVNodnpHQnB6SS8zWmExcWw4?=
 =?utf-8?B?ek9RMWQ5K2hOVjcwV0hMTjVnM3FYZWJxTkQ0SDdrWTBzUTAyaTEydVNVY0lF?=
 =?utf-8?B?U0FpaUZaNHlCUlBqWUt5U0xKTXQrRmlyTURxS3lGSU85REIrQmFFSElPOWtG?=
 =?utf-8?B?dTZjYm1paDJqOCt5YWNCeHo3ZFhLeEk0ZUxPSDhZOTdVaWJSZnFEeTI5eW95?=
 =?utf-8?B?ZHREakN2c1k5aFVmSUhrZDErRE1jU3NLTTVCY2h4WS9PRGl3bnNIeGxWQm9L?=
 =?utf-8?B?VkNJZ1VlaytqVGVLUjJsRVlpOWJRVVhvdndieFM4L2EvcFhiQk1OVGhqSEkv?=
 =?utf-8?B?ZkNqQ01KOWhxSmdmRGxMcDBudS9LU3A0NnNyRUFiYWpwT001UTJNRXhMak1i?=
 =?utf-8?B?VDdkU0NDZk0wL1V0c0tIMTRlMnZJK3dHYVQ0cExaSTBFTGZWeHdoNmlVT3Jy?=
 =?utf-8?B?RjN1d2ZkWHMya21XVnM5RTFNdC84ZStxMmRKZWNQYlFpcUloTXhHa25DUGZn?=
 =?utf-8?B?MmNmT0daeUQrTzBnVmxEL1diMHlKeWFZNFVucnBCNTdodVdNYWI3dWFzUDdO?=
 =?utf-8?B?NmpUNFNYUy9qSEZaUEhPUGNkdzVkM2tJQ25mL0VsOEVXeEZpaEd2V09JbTN2?=
 =?utf-8?B?RjRQUll3L1lNaFpxYmNkS3BBZmpONmh2ZkdFUGhGcWQzSlM3RVlOVHpUNTV3?=
 =?utf-8?B?bGF1WkZxMUdROG9oM3BVQnBjYngvWmtjeGZSQ0ZrYTQ0TlV4UmY1RHJzQnh5?=
 =?utf-8?B?SGhYQ2lSZVhrSEFCVTN1UnpybXB5UFdCK2VGN0dIekNTZE1YVmorUCt0UmRZ?=
 =?utf-8?B?bGQxUElBMmZQb1U0Y1M1NjJwT1BhdTg3c0F2SllibjhaZTUxQW9Ia3Z3WWxR?=
 =?utf-8?B?b0xvWVkyUzFPM0txcTZ5TnFveFVsU2ZYYWNrbkNlNFNiM2dMa010UDV4MlVP?=
 =?utf-8?B?ZFprSWU3eUNFT2E3d1hQQ2tIdUI5TmpaeVo5Nkd3VjY4UDhpVVlxNDlpSVB6?=
 =?utf-8?B?S05raEkyUWFUWFp4c0tMUVZ6d0tPSGkzbE00dEIwaUdTTzUyeW5YbHlKNEJZ?=
 =?utf-8?B?dFZDT0Yrd1RXZkNsMGdFMXpYNHBjVjh2MTNpcUxsaE1EYWdhQ0N2M3NPVkht?=
 =?utf-8?B?d0hUNmJEVUt3aGpxdFU1TGNLK0I0YmFmTXhSb3UxRG5rTWg4NUFKZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 264d5819-43c6-4656-c31b-08df29150be9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12558.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 10:30:48.1557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PoC1lxKS3IDkh5kjB+reHTJiPv3ktilhVTOaHuDeldoi5VWbC0UyhIGWPnA4AeUL/sS6+4p5gl653++JKZ8OyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_033145_549423_F2D0DD8E 
X-CRM114-Status: UNSURE (   9.05  )
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


