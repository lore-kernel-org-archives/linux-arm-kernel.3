Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4673CCC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 10:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mt4MM2b+kEda7XeWiXcjklx11vtEoBsUUQ1dFr4um50=; b=Tcq9QH96Y0ris98elNMrmo/sl1
	YpPIFfBKWdX7S2CV8TPmhtNG0KQNHsS/J+24nKbjs9eAQjMUeMbFIOJw4Cjo8Wcg5RVY7gNQO9wiT
	TxQPtdaEHry2bnsSzz6S1ZsPAcj9oXEtGiP9dffdsuk6sEY70xTdPJpqUZNu/raj2LnL0QoyDxmbH
	JZmyZ/PqeEVtHscr5zDk1h6l7U/4zalcJmRIPBUIB/efnuh/Qw93F2SirWulRQNl8CJmaitKkTdAI
	OUKKwWaI2YRQkNw+Leog12BRa+QR2AXas/ByKwVaS9Kb+GpAm23ibAoEHYdVUvdooh7N8O8JyDr5B
	vo+5mduw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZmg-0000000CZou-2tuN;
	Tue, 13 Oct 2026 10:31:02 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZlz-0000000CZiw-1fE1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 10:30:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vmrn8Kd8E5lpOakNrYxbJxcUA/W6yWsckqB+0Ks7SiMwYSgFIX2NSe9b/u5/UU+fpN2hvSidCRSTKq35YOnQqNNEbW6HFW5WwWnbmObxA95wqP5aIXUHeog2I7DCNDASb6O8BLF8X32kB52y32koZVr8M1W/FQGHFFyI5GGoGI/Kpzxeij8LgmzoADP5jMxs7jZPeTdJgsVv6/luaT8HJxV4lyyYc+QktUZb5jkoCs8mDE0J3Zpe2a98+/t9JN2feUVmoP7ExI7o3dyzJEkYSe3ouN5/2rWsKdAlLEEXc/FT8wBLPRByjxxGMS/KzjnNmDoGRmmiG4Y8slrPaX6MRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mt4MM2b+kEda7XeWiXcjklx11vtEoBsUUQ1dFr4um50=;
 b=G3k19suno15S3FJ25fo9QUof2eVuGmzHRNpQIUk2LLtg3P/O/NxxRrundrfbyphVOECWk/PhYmsTxZ7fC12oM0RgbT6xxCoTTv+OOFLjIJwxjLYpJAVP60BK9OdHQc/77QoKivL9F5AnpOt87/GKQ5c0YMsju8YpSKTsAJnxTThNE7KvucUDcPro66c/RwWh02yQ5PmwEZd+uurXeuSFJsz/4959QvlkWs3+tsQygnwnW99PcuCwZLf9yBNxuboGPV0lBvjKwlAsEeiNla00peSKjGkVuFb7/1zt6xmBEiFBIWRJbV/GZPtYvdsyH3Ii1kqPFCYtsrUx8WNPzrmJOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mt4MM2b+kEda7XeWiXcjklx11vtEoBsUUQ1dFr4um50=;
 b=A4n7nzsjHA2xjhJQrfEimqB/+6sQLN498MzaxuXSUypTkveSg8CX65R9cZxONTdHtY14q8ikWR4B79VeAivdPCDD790JumCNLtLAWTexi4FbpkhqaBXaVmCyk+LDTVFHNvejtjzrp4+jbtGwWMDtn6UVVzzxxfWFQNKwbwHUV2W4G5CoPam+Dt3U1695g03FeN2F9dhPSTeMAl8AWB+NuZwHM/6g/HBZKdhF8JYVhcUKqknp44gmBJ0BtG5uVCKxduBZiZswbr2wG49yXRf7KCHWQ6VXLeX0vwM+kx4LCSxr7dPzpDTfCR6YBqCMX5LWUySqIUSSSBqAmtxejtqe6w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10) by VI1PR04MB7133.eurprd04.prod.outlook.com
 (2603:10a6:800:126::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 10:30:12 +0000
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49]) by GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49%6]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 10:30:12 +0000
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
Subject: [PATCH v8 01/12] scsi: ufs: dwc: Return a negative error if the link is down
Date: Tue, 13 Oct 2026 12:29:52 +0200
Message-ID: <20261013103003.373156-2-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013103003.373156-1-larisa.grigore@oss.nxp.com>
References: <20261013103003.373156-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::7) To GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12558:EE_|VI1PR04MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c8cfee-5ee0-44c4-90e5-08df2914f6a4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|7416014|1800799024|376014|366016|22082099003|10067099003|18002099003|921020|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: V3lMnU/0uLimLfYuxW1KOrw3hnhZfljpOzXfJTYyoobCF2mtaoj1ZhSwMeMcUzHBfKez9vkHS7bOYmQXpWNCzh20dcpGuY1VWmvbBBE7MRTnw3trpa4gvAPdgrTKGvL9SmQM9MwL5XjodZNk76xk1o5ry//EcKEHO91R4XY2ppgo7BG74XuFRUpBfW7ZTNCbHwHgwPm8PslalmMOrDEi5f5XKgKX7PnKMf9PG2wAPN5lTQupSxhKyv8SroA+uWhAbMxH7TCq78mnQ76PzMNxw6xn4h1PaAMXkGscHmrCBZ9VpPpRu6ntVIZ1mFfIaZddfn/5UIcigWxv+Lh32wCLbr2blbRD9XkLAoUqkiZaFp6iKK5qWs6AP/qFoOE/hJX8CP53qag5i3t1XbPbnTOQOQq1Bha6f4pVVUoOtKJ1re3t+smfvXMGcG9x7SWhf+SdA5nIbTv6QXlj8OBC9nSZARAg/kBNEQ36gGVnZxRUW2byUXnx/ANDAK4p2KOaIA10Ajzfm1zt1m4FTj+CV5h/1sfLTciHzJsCdVJnpMd4bkVvMd1PJhEmPSJQ1Lp7DYun7YSg9J9SG1Gj5vz+wHEobvBtmVewAV5JUsuF1yF2Ty3k+IT/zUtNzVlbT9lPG/RnZumULkpnDDAsUfJObX7zmza22h0Fi2b9rTaGN75CoC9H94xu5DORCPOrjWHryqlIogJRXaX3j8Z/jRgCHwOuOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12558.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(1800799024)(376014)(366016)(22082099003)(10067099003)(18002099003)(921020)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzVnMUR0eUVRSGlpcmpCZ0xsbXgweHpTR0tmOXRpc3VTMjNmYXRRTFRGOFcw?=
 =?utf-8?B?RUEzMXN3dlpIOTdJTFFDUVkwTEpCZFB3SCtkMGJrS04zdG9KT2VJSlJ4cy9I?=
 =?utf-8?B?ZEdDeVZwYzVTWThORG1lVGd6d08rWlI1d0dGT0ZsbWdkMDA3V3VyZ0tlNGds?=
 =?utf-8?B?bFFRcjFZVlV5Zy81VktMRGFLMWp2bGtadzlWdG9mTTJuMTlFcmdtK24rdzBN?=
 =?utf-8?B?UDMyaUZZaFVDVjAzNzR0VXZHTTlJSkpKaWhicHJHL1Era3ZQRUFzbVVkNlFt?=
 =?utf-8?B?NkdKNnRrSVlHQWk4MTIxUW5EMzdvMzlNbFZDUk9RQ0hMMnNVU2FxaFJqMVFY?=
 =?utf-8?B?N0ZvOUs2VkR3MjZqK0o0ZHhDZGEwQkZrRVV1MDBvV3lyS1Z2d1JQNEErbGpW?=
 =?utf-8?B?eXlRcWJjNFBnMjlKZW1XaUZOWFlZcUV4ZldHaVUvT1ErTnRUT2ZlT2JSajU3?=
 =?utf-8?B?WFArU1dDYXFKSnJVa24xTlZUMHcrbERVNE9EL1l5b1ZYcFhWaVYxMEIzUkZ5?=
 =?utf-8?B?TUhmTDhTYWM1eWl4VHhqSGFNREVDaVEyb01EL0tVQkR4V3lUTnRSS0lrS0U1?=
 =?utf-8?B?UHk4SVJjUnRLdHhseHF0a3RCNTdjSmlKOHhRYkNjVjJjNXpIbHlCL01sMXox?=
 =?utf-8?B?NVB5dUxWYnZ6L0oxSHhCcEYzZU5kRHFLTk5XS1ZWOTZJcmRLUHAvSXdGekVj?=
 =?utf-8?B?RzVaRStvOEk4d2kwSjFCN1Y3aFRmM29KcVJJVTluWWhwOUdOUmE3RUFsYmVq?=
 =?utf-8?B?WnhUSWY1c2dDNUJaSDV2d1FvdFR6T2IrTmY1NVNCY2R6TGlHc3h2ZVA1TXNo?=
 =?utf-8?B?bkE0d0xISzRrTkxsYURJZ0NLVTlYczZ5akpLOEEwRzYwaUs5WTdGbW1DYk9O?=
 =?utf-8?B?Z0J6TDg4d0xyV0U0VWpxbkQxZ29GUHFqeVFxY2cvdGdyTXBhQ1ZMVFdpelZt?=
 =?utf-8?B?UWRPTWEzSDR0d25va1dROXpPMEczR1M1QXZnYjFmem9wbDRRYThvNEJLbGpJ?=
 =?utf-8?B?VS80cFoxenRscU8zTUh4TmhSTEczQUlYMVVUaWpqN0tqaXFISEdDcnE0emwr?=
 =?utf-8?B?V2VGa1FjSUdXZFlMUURTWTAvalh0NHRnREl6bUk3K3VqZ1VCbDJDRWhaMHRQ?=
 =?utf-8?B?c0owYnp4QjMxRHRJME1kcG1kOHBoWmp6T1hpQitJcEJVYUs5djFxQ1pJVnBV?=
 =?utf-8?B?ejJVbE82ZnRpYlBnaGdmMkttN3Rhb200ZTBSUEsveXkxc0tMemlxekprRE1z?=
 =?utf-8?B?blZ0YjIveHFQR2c5UE9FWTVTWE52WS93aSs3UUlvWnJPT283RzhYM2cxa2RZ?=
 =?utf-8?B?QnR6V0t1d1QyS05jTXRrajZ2VWRmd045d0JWWHdoSUpBM2FLSmRpZUVhSkFE?=
 =?utf-8?B?aGZDTVFMTGJveExYL0Z3dGd4a3NUZE9sSXZkbGE4UGx3WExHWG9UdExXU0Qv?=
 =?utf-8?B?VWVJZjRZQlVmRkxPdi90VVhXYlJTam9UMEhHRm9qTUZNTXpQdGU1Y01VeGhX?=
 =?utf-8?B?c2NGYTdqcEJkbW14YVpHYzd5bWhUT2ZyQ2hneVFid3FuSzFPenFXYUpUQ0dB?=
 =?utf-8?B?c3NDNmJvRkgzRWFNL1hFeDBOOERzaW4ybEpwZFpSSjYybHIyWWd2WC9FZXdP?=
 =?utf-8?B?TmVSbVVudkZ1b2lTam5tSGlXWmRPcUJrK2pleUpSNnlBR1N6clJwK2s5MHhT?=
 =?utf-8?B?MDQ1T096bjhqbnZKY2RDUnJjajF2UjhZSDFDZS8yOTZDeFVuSzFrUXZ3ckdB?=
 =?utf-8?B?QWNRTmxzSGw4VjZvM0QrblhINGU2STZoRnJXSEFmY2M0UGZoeGdDNlJHL0d6?=
 =?utf-8?B?OFFZVU5jOHdJMEVUQlNtSExmV05UcVJuaDUvc2JQOUMzZ3liQUQzSTQ0TjM0?=
 =?utf-8?B?U253dElMTkNBNGNHMWdHcTVPaEpGNGNzRUFla1BJdW41bWxiZDl6bEJ5MmJm?=
 =?utf-8?B?ZzBrMHd6cU4wb2RGOUVEZU90SG9FdTBvS3gwc215SVplaHdoT0QzRGJPMUth?=
 =?utf-8?B?THlob25TaE9zRVVWOGtlSTdkejBsTFpHeXFVWWhtejhHUys2ZFNJR0ZiV0Yw?=
 =?utf-8?B?bEdyZkRRME1UNWFVeEFNSTVvditPNGMwMGR0YWd6RGhiUkJnM2FSYVZ4K2NB?=
 =?utf-8?B?RFdHV3ZyUlNZbWNYaHd6VnB2MWdEK2JNYWFmYS9RWUsvOVJQT2QzcTZvcU5O?=
 =?utf-8?B?Q2thTEVpQ1F2RHJlMFNmQUxHTVNtelQ2akpqd3VvejkvSGlXdzYzMUlSZG9z?=
 =?utf-8?B?NVFJMFVGQjJrTFRReVpHUHE3QmpoUDNWQjFObDd1UTQ5YUdqaW10UDR4YTlx?=
 =?utf-8?B?QndxcFQ5WVQ0M25lV2tNZ0xYRWhOcGJiaTM2YjlHaDd4YVJzREd1Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c8cfee-5ee0-44c4-90e5-08df2914f6a4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12558.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 10:30:12.4636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCY2IaY/UmAlCiYQWO/PFGRJ76312jLlFLtmonV1jycha50UpjIxkxjBWgRmXlkZW/81rTY803XuSOlhugmp0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_033019_864211_46F895E3 
X-CRM114-Status: GOOD (  14.40  )
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

ufshcd_dwc_link_is_up() returns 1 when the UniPro link is not up. The
value may propagate through callers that expect failures to be reported as
negative errno values.

Return -ENOLINK when the link is down, and report a failed
ufshcd_dme_get() as a negative errno instead of its positive UIC result.
Declare dme_result as u32 to match the ufshcd_dme_get() parameter type.

Fixes: 4b9ffb5a353b ("ufs: add support for DesignWare Controller")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 drivers/ufs/host/ufshcd-dwc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/ufs/host/ufshcd-dwc.c b/drivers/ufs/host/ufshcd-dwc.c
index 21b1cf912dcc..71433b4d04aa 100644
--- a/drivers/ufs/host/ufshcd-dwc.c
+++ b/drivers/ufs/host/ufshcd-dwc.c
@@ -48,20 +48,23 @@ static void ufshcd_dwc_program_clk_div(struct ufs_hba *hba, u32 divider_val)
  * ufshcd_dwc_link_is_up() - check if link is up.
  * @hba: private structure pointer
  *
- * Return: 0 on success, non-zero value on failure.
+ * Return: 0 on success, a negative errno value on failure.
  */
 static int ufshcd_dwc_link_is_up(struct ufs_hba *hba)
 {
-	int dme_result = 0;
+	u32 dme_result = 0;
+	int ret;
 
-	ufshcd_dme_get(hba, UIC_ARG_MIB(VS_POWERSTATE), &dme_result);
+	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(VS_POWERSTATE), &dme_result);
+	if (ret)
+		return ret > 0 ? -EIO : ret;
 
 	if (dme_result == UFSHCD_LINK_IS_UP) {
 		ufshcd_set_link_active(hba);
 		return 0;
 	}
 
-	return 1;
+	return -ENOLINK;
 }
 
 /**
-- 
2.43.0


