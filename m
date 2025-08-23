Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEC9CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 19:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dARcHoCM4HyMpVSyowxjeXYn0ojHi6T9vKH/YSmCFB4=; b=DrH3dqpFHi3zhVKJTH8tENoE32
	PK0JQUk3b+ZcSaiqBDR1K/lI1haU1oeI8qYTjfAEH7NE81pOrbksnFCrn56+N2+bvlXD30S1uzTlN
	OhddB2f/AOiTjwYGQxbXA+i0Ja2xtG9UjXRnvrqOxxjj3/Zjb9jVLT4MzM5yXCV0MFxT4VaGM/mxc
	b/Jn/EUZFfBeRl9nzjymmrHiRbYN+tLUGDj7vn1DOCZXgDW8lzblWmyfVw8kizM8vDiOTOiglLMcr
	Lh95NOM6bPoOsqluhwtGR2cXn8X6ttFJA+7/CDK7IVy/9/gLF3LYmQFgwKXF6KHPyuser+eqxDrRc
	h7r6T8NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uptWU-00000005CvK-2aGy;
	Sat, 23 Aug 2025 19:03:30 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqgT-00000004xj4-3NMy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 16:01:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvxbKZ97ne0YFOFhrzjwBuP+zmJ8vMyQGmgDHtI5v0VTWJiAyNls1cX3crQUl6bcuhCePeW8poumSaY7JZS1jyNQ3XkQQKBJZygDC4i1Z5l1Y3CrKReMXn4nK5hR/s4fS91HPIKJ2/FpLg8SDFTWlsFgXCbBnl20I0FFSfqidLWsaqz3Zcozf0SI2oOiuWbrUDIw5Uq606sCcfHxEIpkYVvR0uFaEASdgY4LBNWCuYW7K5Gz7PjpExPS83bdCTUdxVm9AXkBBCl5zmodfn2ThfB6MrpJr4cUhNZfU5nW9/wY9kvE+EzD1E+RG+D6vR0s0bktbrd604fszj6XqVNrqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dARcHoCM4HyMpVSyowxjeXYn0ojHi6T9vKH/YSmCFB4=;
 b=iy5EvxUqtmUVC1MA4iRj59NZ9b1jW7XZwtqCEpKTcyq3TxT0MQWrdVS9G5n3CpEjQPhVIjF6LxKcaHAoTuRe32hUiweDq8k53QoAojXccaIRG8tOPzvhrX7zbW/8kNTZPdOkrS6xJwrNgvCwlRe11oe5qwWJ/e9Z6RlDFlNIXizzNwwzHC+LqVqDG5EGgy/jNUuL/ZcJwWHwRLW/3lk+mZM/k3fkhbDVIpUbxYAkxSwvA0wN/Hp50RPGs2ahcFQUEhI24QIPmui755k6xDBYLDpLBE2zHjOJQV6Gz+OMxpfkbawre5265oPdXKXDAfMnFXZ4U1AxmrHM1uJLNnpNwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dARcHoCM4HyMpVSyowxjeXYn0ojHi6T9vKH/YSmCFB4=;
 b=Uvvc4nQnM/GvSlLuSecLTk2FSFWuJtfhiOj473wsO2SPTnXZCCO880A+8dV8CKY3nLUIun+3Fj4d5D5EzYFkNZbszImhIJEafqNZyWpEYjeoZMJExtKuSPyXyZr5derWAgbzWAThyquMNDwG+kPh9nKaOHVczZd9bk+zT8fCOv9bm8U53cj5RaUmoxxbVdKZGd2vMf7dgyOrMbccRz/LchTTzSEkDT9xVWNSkqDqSTAGAha4zwsvdN5QvIs+/tUnnDM377Xc7DWOCtDcbEqhm5L3HfBx6x+qZBz8Fb1roTmZWi9tg9VkrF8qGdPRrdCns6HbgAu9yvmZCVJo/sKkmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DU0PR08MB7519.eurprd08.prod.outlook.com (2603:10a6:10:321::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Sat, 23 Aug
 2025 16:01:26 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9031.018; Sat, 23 Aug 2025
 16:01:26 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v5 02/13] spi: airoha: remove unnecessary restriction length
Date: Sat, 23 Aug 2025 19:01:05 +0300
Message-ID: <20250823160116.3762730-3-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250823160116.3762730-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250823001626.3641935-1-mikhail.kshevetskiy@iopsys.eu>
 <20250823160116.3762730-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00007568.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3e6) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DU0PR08MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bd61e21-49e5-43cd-e5f5-08dde25e5073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3tpwUUGbXsrWi72gCtepMGwkHGWS9en5U7DR7+LiERZICh7UztkwaHvIo1A2?=
 =?us-ascii?Q?Zl/61l09jWDHhOGPygBq/464yBctCirS0eASGHEKOCQmMyIwPAJ7GlsI58j/?=
 =?us-ascii?Q?7h0KarQYsz8KumTxU6Vf/xz+e5nhZyd7FGhZMeExM8uF1abJPulAMERTtGHs?=
 =?us-ascii?Q?zx/qoUyelB7YrnaTkeOjeAurDYFQ2VHi1qDNiDqMFlNMXPer8Yu4cBwmN3YZ?=
 =?us-ascii?Q?yKx1b31tD8knLQTy4+HFaTcIdXopdQPf2pX4j+L/uZ3WCE3Q38b+0slIFILQ?=
 =?us-ascii?Q?an37GltruLnKjPX6s2Y1WvZDp7EnnbvVC5wquIIaabet1R9djb2TWsnKAPOp?=
 =?us-ascii?Q?2vLDmwjsjhKwfVW/QTjeqQbzk6CeaLXW4/2RGgYJhpusyZndZDGUXL2wZToJ?=
 =?us-ascii?Q?9O0Lhubeqjh5VdmhkqlXNcN1gDZSGlWnDK2Y6KwcFSshajzg7FzBAyljKFpU?=
 =?us-ascii?Q?hnF3GA6RAcECHnXolIW5dmHh1xrsRTeEpBiVHKLJU0g1y2aZqLxiklWpB9fr?=
 =?us-ascii?Q?R1GFj3WAmkttBAZ1hXMFmCEdZgVQ59t/aSu6dmZoALUmxaQimWgXE/7s6Pfx?=
 =?us-ascii?Q?yAlRL3pwi0ISNNp/w/6YsmLiW2zoLFXLXXVfa8+BbiHnvwM/sz4qySTr9/18?=
 =?us-ascii?Q?XaCJvqfaK+vMWPQ0a0LwINIJ4TlReOeB7mfJr08IOfTrP+4gVtM1Uu1/04Nx?=
 =?us-ascii?Q?jXiw6PQCHSMiVD+af6ovcNIqdVJ54idvkQ1WHTEe13zJ5gT1J0QhJHw2IkPW?=
 =?us-ascii?Q?8DwvGxvALUngY+Tw8G6yxGmKTCouVVSuXmwnoLSf7Zw175Ncr1u831CPIc1k?=
 =?us-ascii?Q?DTdWHqIqBfWgip5zKr989DPguFsisgWxLuqxtzxCGu5T9+80hdhY0ErI8fl3?=
 =?us-ascii?Q?zLerUAAlNMdECfbxITvwKuEsMZQE2Ff3saHZXiPrqzIXtuyvv4gxDl/SaRfq?=
 =?us-ascii?Q?45N5F/012S/QDDZGNTRXi2MlGPdm8U2d4fyOiETDVHsAxHfgvjGLOJZBc2qv?=
 =?us-ascii?Q?GWfn2X4QanqX1i3kN5SkjVZ21oeimTxNfLNOb4p+Pex9paBU2npCjMJH3oIw?=
 =?us-ascii?Q?EUHp1+iLnVISeLXlQNsE+k+DQ0UJhZV7ns6UtSG/50XSkGdKn5WnJ/6pHBuX?=
 =?us-ascii?Q?pxj4tZdkvxud3WxMfm2sAV9h0DyCESFS0qJ26LcLvt89W/X/nb+oTX014bkS?=
 =?us-ascii?Q?zhqTpp2a37o5Ueixk8GOcJgpHOTULSf8dLlTFAGYbpChbrDTiFU4++wXMHk0?=
 =?us-ascii?Q?Luw03Xd399N371CkVQcXvr4H8e7RHSljFe/kOnfKjzm3u8dryZbY81LByBmH?=
 =?us-ascii?Q?d9BP1tavz3YwI86mqGHM3upCi54fODX7iWFOAY2+HIl6JiNkwl4/yUhBiZvf?=
 =?us-ascii?Q?R2d6AqWWbMIFiLGFSGOCuGXa5NkP6wXpzqCv4+IeI5u/iNCpRrNs+1gNHoOx?=
 =?us-ascii?Q?MjlEolvELRoMLd1UZc2mvrsYUZhBzka91fx+TbKTmsYaKx7jgUhFwQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?czSYcNDH3NV27tuhZPApN0aTC9G/l+ZH5CEl5gg+GZjnkxrhpzYTdVIm2s5h?=
 =?us-ascii?Q?ehH09krIN627O69CTncd9ZbzMcz1B1Pjp0VVwoL25ecEUNObrsHTguBxs7wn?=
 =?us-ascii?Q?gWprqgXnz9TA2W4sU3oWTf9Y1d2Q4J/bYXFFBZofkP0LeEfe07ed3ZiMAa/R?=
 =?us-ascii?Q?m8HnTkd49YmnFMXOjuUS8dRcKgNl7aqtCg90E+F4Z7MVFGfA2huBlW0shr8w?=
 =?us-ascii?Q?31N0wW3R9IYiGUcPzmMIaAC9+59EEhK1DCUarxDPVYuj4eHakmo7RC3RLw6v?=
 =?us-ascii?Q?nz8q7hLqcRglt8yaYsVQ02aoWF0I/kKUGUTJ4pp6D66BNtyUGc/LD7xDvwHg?=
 =?us-ascii?Q?/CRuEixwjRUglzIfLkRNc6as6+Gh22OIXc7EU3kkpF9bC3+51y3pE1eqlO8Y?=
 =?us-ascii?Q?c/1xRFOuGh3UrHO7/XOitcnshU/XqVmW7brdodOpsU0qKxhtsr6xPS4BO1s9?=
 =?us-ascii?Q?ctxB7XAyU3jGQHpP/oUppRWWCpONf6sT/HAWDpWHNTPO4dCg9N/wcbMRNJ3r?=
 =?us-ascii?Q?tKLEdl0XcT9tH9KbHWLIbdv3gjUrWv7b6VvdIDOvdNQO8+i2A44Q/CwCY0TB?=
 =?us-ascii?Q?AeZyJeiAvAcyl3/d3AiEbpp5wVo48VmB5NU+7FF8Ld1zrC8fQFo8FM9OqZMk?=
 =?us-ascii?Q?Vvu4OyQmgXpuU3HIuqAUgKRWFEvhzgV5kqNrObisNM+NM6x8TTgCOWFqJBH2?=
 =?us-ascii?Q?kyYnWkO3C96vbFg8kXRuqq94iXlNnXZvP1Nd6MNlsvvlJiL4pdPF4ETYa5pW?=
 =?us-ascii?Q?X4pbnOH1eqp/+e+EoImeHwmAQ3eJxnr9n+8CpTIfIAWus+Eir9jeHG0zQ13p?=
 =?us-ascii?Q?BW3l60bJ9U6V3Zl5HupEBsWj95yFVI++Ta0AYC3dmezRFxr+qLnGYpt3hwaT?=
 =?us-ascii?Q?mnABSxirveT3Jr0TuMCqtWxNmvkBGRPugv2eLtGlC5/eZw8PeGV4Gfdj9FoF?=
 =?us-ascii?Q?z9kiNvVVYxT/Te2PILKIHHxKAN11KOpuiwEA830U0oWthcPmJj5gkF/FCr0f?=
 =?us-ascii?Q?JlLm5evDXS0RN3qRF8jUZUQ3u6ssmqg/lnj+S3ouFHEUTc6FdigPJ4Q+3mfT?=
 =?us-ascii?Q?M8ae+MPDV8wSpqHfxFgm/abCaQpk4JH6OMEnjjwT+hpcnQ60rjwsifUrqeYQ?=
 =?us-ascii?Q?tnqt2YqbqhM+1dBbF2CgEoNpmPWQnEPUH4zmkxaaYfWCAogFbu6d+zBQKoUC?=
 =?us-ascii?Q?TZMMYApcoQvcoGuAp6jePzvGybCLqKt1VIero4W7FvMrznlNIpus2RZVoZJh?=
 =?us-ascii?Q?tvuYreLGJzgk+UXFevVWM/niUwyt0/70lzIq+Yh+PNcaB3cvTu17U/RmrbJD?=
 =?us-ascii?Q?rzqQ57N+5K31klFGO4Wpq08/ALkkPDmgEboyxa2QIQfOQA7yYh3V7kNRnG49?=
 =?us-ascii?Q?0f6Cgqb6VoeMcxVLsi2cjuOSjQhDwBGB82TwlIOdYmeRQ9R74/csJGSfN4BF?=
 =?us-ascii?Q?gLSvV5h2vFSiCDKeOSHa+tChIDOsSXgdcfaq1MKRs6WD1fO5o59Gsh82hLpb?=
 =?us-ascii?Q?JzwKYlCGBa8Z6dXbE7dQYrJemc7LysF4AH2zzyolCKOr6nBWdE+bQYUkyNSh?=
 =?us-ascii?Q?0M4ed5Yruu5lLhxewmT8xVhguCBlIchznWEJdwnIhq30RrWoEt5TLxZf9mG9?=
 =?us-ascii?Q?V1hHHwi3JLD0teafj155KLU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd61e21-49e5-43cd-e5f5-08dde25e5073
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2025 16:01:26.2634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxh8PdEja+TuUPQMWlPaM4YY+STabWQ9/RvnO05qTxwmco6k8CIH29RwhQI/gQtKEVTj9dYM4yPiV9osqeKwzhqf+jch50BfOyYS9tcyCRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_090137_847065_B20ECA05 
X-CRM114-Status: UNSURE (   8.38  )
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

The "length < 160" restriction is not needed because airoha_snand_write_data()
and airoha_snand_read_data() will properly handle data transfers above
SPI_MAX_TRANSFER_SIZE.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 043a03cd90a1..bcc464ec9c61 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -579,13 +579,6 @@ static int airoha_snand_adjust_op_size(struct spi_mem *mem,
 
 		if (op->data.nbytes > max_len)
 			op->data.nbytes = max_len;
-	} else {
-		max_len = 1 + op->addr.nbytes + op->dummy.nbytes;
-		if (max_len >= 160)
-			return -EOPNOTSUPP;
-
-		if (op->data.nbytes > 160 - max_len)
-			op->data.nbytes = 160 - max_len;
 	}
 
 	return 0;
-- 
2.50.1


