Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A68C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NwRLMYT7rDUlyQ7u/Q9XF8UzXMRdbbqCYUGUbXGyhhE=; b=wFVzMFqfDnnFSQPeCZ7vRNJCKv
	vC2LYtB9HlTAs+QDfblXtb03nTLdkr6oMbHkSZ0pPglJZbLWmMRtCJiDETKK/V3aUsP5/d38qb/L3
	RdpXNArF76cNLYOP73Tt/5AQvABILcQHZouC5ofxCkvCtoJuu6RkBRN+ACzNqX6zkZM5Hr59Jgeg4
	fXwbxGiawLHWgIjbi3lgqK9zzH47vvdffS9gUnncVln3Ff+8aFMPbyaT544lhzwH6NSOVPxK6fwEK
	yFKsFA3YK1XiTKg5VX9ZZhUnD31FoFzI4l0mbreMMD0UpNkoVBQ7HAw2jTBlrp9hDfthV1krEX/b3
	MIuR6izg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPLr-0000000Bnm3-0eLg;
	Mon, 10 Aug 2026 12:43:35 +0000
Received: from mail-westeuropeazon11013009.outbound.protection.outlook.com ([52.101.72.9] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPLo-0000000BnlL-451k;
	Mon, 10 Aug 2026 12:43:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yf0Kv0BjkIL7cIkEXx8gEUlJRbYwDBwaN+VenvGSi2RIVk5J6l82ATINxX3mdtCU2oHkXapf9XhiQmbYV0X6skGJB8n9RhkwUNNJWeQMX5hjEx3ScV7s3RmjzEduvxZqPzTPJvl20Luxkxo29DYxrrmHaKxNKISfD8sZkEjflI1GkpsCL8U/rsj+M+C4LCcPv6LfinBJ5WQ3BmBuxECR6UZtMpfs+7YyeYtDDJSEt2z19nqgLF9scOwfrSUBHeL/Kc/7Ksc60HAGO6zMMcqEldX/sBx9FtarszmB3QPv5pbbNvc/aqs+aZ9RaKRwQQHrJDErzdGA2jxuT/v6epwaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwRLMYT7rDUlyQ7u/Q9XF8UzXMRdbbqCYUGUbXGyhhE=;
 b=ROv5FgkEjQHqWaRDFPY25c7infaHpHVE4Oud3pI/p3xOawsnyW3zaGmUCMq3j2xlfksFKmR+uQd9uPMPNdNI198eZ5pdaz97E16OI4/aA2dYU1ruMSpZmgl2c9SbZkctuanWVkPewlsscInPGvRdzqR32MVBEp8Gds/WJ2x07hFtjNuSvSiEOvexOyxcwSXn0oZwrBaYzKfq9bhm2BK/5auZGJoyRR2LpCiPyJ1EfrxIKRx5WWliZNTFMlLM6scbfkFxjUcOsKx4hj7VidEI89DaF394Pk08co3QtEp0UvmdJpUJT3AIVPome+NrohguVk+LJJLFnMEczDUDzRcUdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwRLMYT7rDUlyQ7u/Q9XF8UzXMRdbbqCYUGUbXGyhhE=;
 b=JR1pk7vy1DMYOfbYGWlmO2r19rJLpov1YSHGyWNMEW9P0WGH1AGHzdAJzETLglp8Aur6MqfOpcom1ljVajGmxP80DqBf9AoPVREwW1/0zwg8EYAQmZvZzGxS149esyirzxsAPhMAL7D4rg3hihHWBpmaZUlQxEZxuwG627pzffdM8fD5VXWmF4DHCkcM4KDhj0YBCEbxklxNtj831/5KumIfByRhWZEge1Q7e2geKwUlNJitUQ7w1Dek86KW8htuk49dHUPT6woAu/onMNHONQS5DvN2KL0khFtTzPygd9P2VT9Kc1ifljnScD0bebpywN9BK5e6qwYABzPs1gRfFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 12:43:25 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 12:43:25 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: [PATCH v9 0/3] PCI prerequisites for PHY consumer/provider split
Date: Mon, 10 Aug 2026 15:43:12 +0300
Message-Id: <20260810124315.433448-1-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P191CA0029.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::12) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|VI1PR04MB6861:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c6f2fdc-5270-4c0d-101f-08def6dcf83f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|19092799006|6133799003|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: i7rfEV4AFaYKci9Hi0m9z4d+8TIurCKXerD12KbO4z28NQZv5Z9VgZAudmhWEVmtcPZtJYsv5M+ufhGoWH0MiVePZC08ASKYLW7pOZR9bNeVJiCmW5+VZUuvkbbX1wSvtDYFhozD8v4jVZLYVnyHybajBF6DFKeVSkRGA9jeqbesvF9XkbVvcaJeLLzR/OCjwoAIERzKnQPz6RCtiCSfjLiZa/qMSTxF6EyguoVNP+h40rt+OTAzNqF5ykCoABx2bxUIU5ODy/rz3E7Uu+bm9bdxIx3YrZQ/tJ7krlyIX/AmUosVGSL2qndbMvh0dqambaq85TLNMayuMfigxQJZ2WM4d/RAdfdNf/EUcngtyvfl45+H3Incbui/Zbaq0wIGYSYrBQmLQo3OwwlwYo/HTBeyTJGTQIbmByZUHZPuwGYHculd4a5jPPB041VfWWATFqslC7ZtJ10T5wBxnSek357bXXUsNmmnxyHDA6TAxroPeHxUp9liNO3q1cTB7tyqsTDvZ24t18ho+e40iSTZwtRo81g3XCMgqE5VRjnvLgNOiRf3qqdeHQHedyvMJUch8jR5HuVpDFWHN9KRzDJAAb86Ab7B6E3G/pilJvpynjJfG53Q/YiV32KHPI04K+v44VHe3YRaAaD6O5ogKxH7rYjR3B978iv23dJYxwTmZQU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(19092799006)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3Z3L3BmenY1VHhrZVhyV1o3SjYzMUNoSG5pNXlFWlM3RkdzL1pWdXRmdUVP?=
 =?utf-8?B?ZjBQNG9USm4xRUR5ckJUUzNDWGt0MkxPcWdFVWo5SDk2WDVDUWhhT21uREtG?=
 =?utf-8?B?Y0lCOGs1anh3MUZ4VkdpMWozL21mYlIzTXRseW1KSjQ4akJMNWRlNGNKaXBD?=
 =?utf-8?B?T0JRdVIwWFBGbk1oaHU3bzA5ZVE4c3RkRXpjUTl5dS9IbTczYnZrUXZYM1ZF?=
 =?utf-8?B?VGxzQm1qZXJnTml1ZHFxcFFVeEJtUUQ0OVN4MVFHSXc5cC9yeFNaQVpHNHND?=
 =?utf-8?B?Zk1PTUhaYm5JSVgvNnlhVVVtZ0ViQmtnbndtU2tsZE9RSHBWZGNhQThBUkxj?=
 =?utf-8?B?MlpCdWNCRndUcXBjaUo2OWFLZ2V6cGczUVcyYS9aUTJWNHJEejN2YmtldVdl?=
 =?utf-8?B?c1lTZ3NUT0F0QXplOU9Dc2Z0cGZ0cHZZcXlraHJqeTA0eVJneDZVTUM2YlZF?=
 =?utf-8?B?M2V5TFZ0REd5clU1VVc3TDFFZGMvWGR2RDhJVyt5WEdlUkJad3dWWTZmSGhw?=
 =?utf-8?B?QkxKUWdNcVRld0NvSWxsTGhRUGNCQ2J6S2F4dGRWTk1EQmszbHh5dE5tRnc5?=
 =?utf-8?B?dXk3ZmVMSGROSTQ0UFpkUk1zaHE1ZERqL1dISDlRdlJkZm5JWDhlZ3ZxSUdL?=
 =?utf-8?B?Y2YvcHVZL3JTVXNaM21XSVAvZ2NOSG5jT2J3T2ZTeDlUM29ESithTkVIN0Fa?=
 =?utf-8?B?Mk1JNWorRzFDdU8wMGYwSFNvV3FSdU1IRTNXSzBMY0tjZktPRFdtblRkdllp?=
 =?utf-8?B?RTI5ZlhsY0JRM1h1U0U1Tzc0YUlCeXlEcVIvUDFiZ0ZKL1lyaWlQRzVaalMw?=
 =?utf-8?B?ZFZEbjkzUVJ2Mmo4TGFZcWtMWUJaTlRRMGN5UWxMdDRnNStyV29TR1ZxWlpV?=
 =?utf-8?B?MVU0VmlkdG81dC9Zd0pxaDRRQ3loeEdnVzU1TFVHeXZ5WWFKbk1lTUlySjFt?=
 =?utf-8?B?bGVCOHdBTkYrWUdXNjlLT2d2WGhrMU9VSmdsclR4QnIrUGdyV1ZkWGcvVThq?=
 =?utf-8?B?ZEJGNlc0VHBUUk5PREVHYmkzZkNZZi8xZHZPUXVnNi9ydkhJVjFmS2J6SHJJ?=
 =?utf-8?B?RUZMOGVJUnRBcWxKdmFqSCtFbHRCaWhNS1p5TC9oQStjMUtjSHNjNGI5SzUv?=
 =?utf-8?B?cUZXTVA1MG8zUGFQVEN3NGk3RWtsbk9VOE9CcmpYRXV5bTRmZnRQNUh0d3U4?=
 =?utf-8?B?VEVUa09KYU1xcDU3VUJ2MnA3OTR2OXVIRFlldjl6YkpmbjlxekpFa1M0N2hu?=
 =?utf-8?B?ZFRQelJvMFFra3VmOHdDbGpUTlJtSWt1aFlUMi92RnBxVjhmK2hBeW5OZTVT?=
 =?utf-8?B?OUxDdzYyc09keXErZGplTC9IRThOa0l0RkY1QTZsNEg0MXI3TWxBUEthSExm?=
 =?utf-8?B?czVZdDR1RkQzczgvQ29UUFc0SStiM1p0dHdxc29Ud0JDd0tnQzlWSmhmSlh6?=
 =?utf-8?B?SXRPMnRibTZIY3pKZEpYSEdkb0lMc0tSeVc0SlpCeDMrTXJPMlQzY3R1a25V?=
 =?utf-8?B?NjVMNTZVeTBURytTdmdXU3NZb2xSbWIxNFVoS3puc1V3eUE5K3BseXRzajk3?=
 =?utf-8?B?cmp4ZVZYbHdITXBGdUhNYlBBTHFXS1VyN1owWU1MMDdPUFl3ZmRIRE5zRTlW?=
 =?utf-8?B?V0M3bGFwTkpsMVJGbkU3TFBYdmpjNzd0NWVRQnN0dzdxRWIyb0hGcjRqcHUv?=
 =?utf-8?B?L3lnM3FjZFlqNWFQM2hRRlovY1pCNTV4dU9oMklqNUU2U0FHR2paWGZEWkFB?=
 =?utf-8?B?ajdaQm9hdXpQSm1YOWZKSk0yc0hZVnVpYjM0Zm1uY1VTYVcrRGt1UmFvR3pO?=
 =?utf-8?B?aFJKUW0waHdub1Vka2VKdm5yOTdJT0ZiWHFJYmpldnBYVUFTOVpmRS9nRHFP?=
 =?utf-8?B?ZlgvckhTaHA2UzJNTzlZY3ZFbnhsY0lwbTZwb3E1bXlqZUkzN3MwdHgvdURL?=
 =?utf-8?B?T1F0SWlHRnVMbldJT2V0SWt2aVpYNVZYem5NWlRWMEdrM0N2K1NoN0RwbldF?=
 =?utf-8?B?SFc5S3RZZlFra3pyMElYdVhrWkYwaWVmSXRrZzBMRGNSbU9GWHBSWlJsZ2ZO?=
 =?utf-8?B?SXVLcHNMcE05WFJOSktzdVB3QWR4ODhXT1QwSWpEWGhMcEM4V2tLd1YvaGFu?=
 =?utf-8?B?TUxNNTc0NngwWU53WGJBdHV2QS9jOFhLYTVCeWdnb2xZMlpQQUV4cEZWWGgv?=
 =?utf-8?B?WmUzNmJBdlFFVDZIVVJqdHJnandIL1gxZ3QzZEpqdU82a0lsdlRGVHR2OXc4?=
 =?utf-8?B?MnBkVUxsQThZQlZNNSs4WWwwQXBZVXhLenBaaHF5WXh0UEMzbTRXdnZ0aEo0?=
 =?utf-8?B?NVBMSVZncGJZbWtHUm05bURZMmZkUjhuSGgybnlTcldOMXh5WUxOQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6f2fdc-5270-4c0d-101f-08def6dcf83f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 12:43:25.3390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnkvNs/KNsWoKPRga0C09HJJ9asp0uKPisxW7x6fvnAjNLFVLkgxOzgSUl2yt+M/k+oAi3EtoHsr7eeQZSmmPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_054333_029849_EC9C4529 
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

"[PATCH v8 phy-next 00/31] Split Generic PHY consumer and provider API"
https://lore.kernel.org/linux-phy/20260505100523.1922388-1-vladimir.oltean@nxp.com/
became unmanageably large for a single patch series and needs to be
split per subsystem.

Here are the patches pertaining to PCI extracted out of the larger
series.

Change log in individual patches.

Vladimir Oltean (3):
  PCI: cadence: Preserve all error codes in cdns_plat_pcie_probe()
  PCI: Add missing headers transitively included by <linux/phy/phy.h>
  PCI: Remove device links to PHY

 .../controller/cadence/pcie-cadence-plat.c    |  6 +---
 drivers/pci/controller/cadence/pcie-cadence.c | 16 +---------
 drivers/pci/controller/cadence/pcie-cadence.h |  2 --
 drivers/pci/controller/dwc/pci-dra7xx.c       | 16 ----------
 drivers/pci/controller/dwc/pci-keystone.c     | 32 +++----------------
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |  1 +
 drivers/pci/controller/dwc/pcie-histb.c       |  1 +
 drivers/pci/controller/dwc/pcie-qcom-ep.c     |  1 +
 drivers/pci/controller/dwc/pcie-spacemit-k1.c |  3 ++
 drivers/pci/controller/dwc/pcie-tegra194.c    |  1 +
 drivers/pci/controller/pci-tegra.c            |  1 +
 drivers/pci/controller/pcie-rockchip-host.c   |  1 +
 drivers/pci/controller/plda/pcie-starfive.c   |  1 +
 13 files changed, 17 insertions(+), 65 deletions(-)

-- 
2.34.1


