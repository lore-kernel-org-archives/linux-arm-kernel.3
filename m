Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF1FEB7EA0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qHcEmB7+KBoX7+wwRjaxdeWRSdmt/2X8gg+/mUZox9A=; b=A7mDWKmJ3m6/V2kGA118SKj0Rj
	zNNGfUfdIx1LzvStQpbJSpZUF+lLNl812zIbcf2bbp1w1lW6aRZf9P6rKTb3fDzdAzNhaldQEdZmA
	P1StUmnYKeDLEBqqSQP02sny8xitb/IudiXk9Fbysweyt35tRQSL9v1A8jiXk0LQUwoJA3ZWZ3GNA
	TFKX3oXgF1JUsfdhxPsP6bZ/cJCIKKbqj3/g1q6A4f+BTKByk/dl/oDfC6kOh4+dlSkKOffyF3PqF
	jcFwJ2rK0Psb9aMvOPjthBz1UdQgndrDNU3UUWZikdwDUQVeSS5AXRFm1PFOY0zNHtx+v1+Jl+2GR
	d283IRyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhLR-0000000GiVf-1eX3;
	Wed, 04 Mar 2026 08:12:37 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhLP-0000000GiV4-1ChT;
	Wed, 04 Mar 2026 08:12:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWM6H64GwYAIHhKyIHWUR5D26YKv1fNocqVU7SR7n3dF5am4w2tRJn1ahdT73rtNwxGZUumHsjyZa2oM4d1FnCg5WDv2ppjGE2Gu4WVLGsnrcaTOXZTd0EHYiOIHXTGrFcjLF7Gr/M/mGri3ozT0uZP+YGTi9cfL5M+Q+lCk4GJjSXPsyhF9bTxS3mJGDuzHQDRYrdu7lUjO+zlt1q9gJgWNE4u1VnDwC1FudhT/IMZ5e6wU0yKiypjhXrpzYIq9VaEEGCVnEkKF1mpl+ecwCcsYCuKYEYoBBUbo1JTY/Qi2p/GWdUBu0tCOUxxZByUCGXz6kp/vygwUBn9M3jxfbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHcEmB7+KBoX7+wwRjaxdeWRSdmt/2X8gg+/mUZox9A=;
 b=lt1T5mISxS9PIbwRob+T+tQCqX0kGbsaelfyERbGfarI3QUZWpBTRvNu4h0voIx/sYKyRynSxdAx3WdI7iB9NQvWIIcZ6Zi0fYbgCjLQNudqmfG9bO4YOPg2/pM8DI20/cCpOCHYMeyFtVUJ/FQCLzZN/qEZYy0QSbvmVZmNVDNR3isn8ofaBELFjwK/EiddPAvDAYVin47Q2TNW1q50mH4dUnkLUGOrr4S/mm5fmkTD1S9j4IYiwXP6+nKbBgh/xzBV9dLUqkrNjVsRXOGYPfVP2XIkstnSPzN6GnuIz38n2kBx5rsUY+tReOEf635sEM96o9a9HO+PEbzGSZiKJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHcEmB7+KBoX7+wwRjaxdeWRSdmt/2X8gg+/mUZox9A=;
 b=YKTDpEmG13lNzmGp5Wsi5zrrFJOEnLYXbewmb+vZmNqcwseFdX8CeIsix2lkjZhJHZC6ROZ2cdkdEB0YSpjHhYgRXks1qXrm54fxLJN/xp7QWJIp0NpHsv0cHEbpLxM5gIZwB50p3zkLjqASy9H1HXOb92JSVF6O/g3NHr2HLj1PG4+RExsez9j99T0y1nfAnnjcnCcJloyQErz2WSzhTlWHf5UhX6XldvQON6swwSrngNvJ4+IGlnLRgzuKiiIqVFQxpg5M/9g74hH7Te72bXAiKQUsD3FaVLjJjhDhTYr+xnPCKIJ/wy3kZKgSgBUrakz40wGyEAy4wKxOobfrpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by AS8PR04MB8689.eurprd04.prod.outlook.com (2603:10a6:20b:428::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 08:12:30 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 08:12:30 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: daniel.lezcano@linaro.org,
	tglx@kernel.org
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com,
	walter.chang@mediatek.com,
	jstultz@google.com,
	amergnat@baylibre.com,
	aisheng.dong@nxp.com,
	jindong.yue@nxp.com,
	xuegang.liu@nxp.com
Subject: [PATCH v4 0/4] clocksource: Add module support for timer drivers
Date: Wed,  4 Mar 2026 17:12:03 +0900
Message-Id: <20260304081207.4030882-1-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) To AS8PR04MB8420.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fd::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|AS8PR04MB8689:EE_
X-MS-Office365-Filtering-Correlation-Id: f550065b-1b27-4893-0e65-08de79c5c7ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: qxYI7mwsbRq14d9ZGbzHIw8akIMwRF/iHIacrAwPk0pGvqSfqhHCuz42foAh7icuozoBKRtZkYnv65ewxiI9YLgx6k8LXcuS0U3miEfOEamK6luw70250IpBl95xxlsUNftEMe6OF3lgF0N/YxOKEMzInInpFO6V3Ln9Rjx2LFeQQJWSehtyCMHAD3c6UPux2HOHq4nK/ksKbE88vm/tN5pFe5Ppw7iLIZvTSZGtgjINyWCnkX82g+PGaCFp74zHg3gzcZTaF3UDlFdVuHmnwXEFb83tC416y3Tt3ILmZLMVx9RG86dwmxbrApJYovP73zD89V4hL2wN71dqj9tSR/gXHkTveHnGq8OAsYx3eWnZjv/UKDr+kuGxuoU8fJneq0KnmkoZ0X98ulUyPQHtsZXlDOvkM3ZvOXTWEgO2xSbC3cDGWUnx3a6JmuOsMG7T3SgmcB0GJUDCmbpp1vWTsWPoeYhmj9zi+aOTY0dt09LiCSVBcSCH+//jnFxc+HLzzbNzyi5ubKy5KupW1l4qsE4O9B44ebP2vtm+Bsz5WshpBHXIyowZtHRH4DmqkW4vEHUTFDgVOoDpR6HJ9qzAQ2JhUyiRmIH/QxAFXPS2/JSuB/eUJ9q1gtN6xdHkUYeM0MxqratKzk4mLH2G8fY+h7vmi1QxhiE5cAGe7BZX88tjvVDh7y3bYcFLoZocw29Gf2V4lSpbcvuJo6tP38lGznl8q8KLw7Z2yxt8Kl27QnMQoxIwZ0z7wg2HQ2zJA7K6Ri+LrE65t9sqNuJEqtsfBrZsVAEWBp97N7H8CJhs0bo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qEkH7I9oogm14kfVeRmdeVpGrk7JTm8t2X+SBB+w91pSOY2X1oOa+JIwor6U?=
 =?us-ascii?Q?fyqmnywpocbdl1Rfzqr15d7DA8c2duXAa9viZBubTjiDNjtwAKj41Cdi+Wld?=
 =?us-ascii?Q?oFqYYu1JM+TDqsMgw3VWkrBkBxG6FgN8X2BVZ5XswQS/kign41fkiwxelS5o?=
 =?us-ascii?Q?3eMBhvRKuXjqzGx0kvXTwxhFy90I7WeQCzEmkum9d+c9AynxCxJUT8IofCDd?=
 =?us-ascii?Q?GTY9oeHgqZQJXuAV5SM5PDZE+ierTV47+9Z5awDWfIgPkMNmL1y7058Y6fOb?=
 =?us-ascii?Q?rkYVERJL0MYsMZ2LQcLOuB3HhD4WtVR7Xg6kQZk6V3aRXH+A3pc5B0IbMupF?=
 =?us-ascii?Q?h1zbdg+47VkxejId09Pzb/7aef3pDXeSKxvzp2rr01uqrdkcgq/oDtlkh8Z7?=
 =?us-ascii?Q?ZIHSBS+l+6E9aajgMoOAMwO6ieUHBrBUQNnZm9M9ykv0I5FV7V5A2Vf6iAuq?=
 =?us-ascii?Q?Tm/oivhdx5CRmX8PoLF7QS/g7ZzlTJfL8qfxq4EdQILlts5e2a6frlaL8zt5?=
 =?us-ascii?Q?R4n5NoKOtCElx0eLElXb6AKdrcM/ttSWuFoGf41jYrgx2Tw4B5h77xKVP7bW?=
 =?us-ascii?Q?AA7Yve7KiZeFBbVgliguqrrB+iiZHhuwVONy8o19D572fV+JenasKZlIyPVL?=
 =?us-ascii?Q?HTQglk6X8Q6w8wu/0HStiWfV1kNJVYRbr107RqFWeoN27ZwycN67FuRsMNns?=
 =?us-ascii?Q?SFv4wMKCZs31/v+wIdkXm4kZIDXJkuASDZ19Lbhep8Ii+YbnG8176lQJxIzS?=
 =?us-ascii?Q?WGLupk5Kp52ioAroVx6MxOiipn7SmnMcPY1RGvcZcmDvKK4fn5HHGZHOPDku?=
 =?us-ascii?Q?s4XrPVEmewwGKhxQZ8yt6Q+UuZDoMZtcKfvijX1cKPv01SH9MHmGylKh4hry?=
 =?us-ascii?Q?Pd5toKjfnpEtanUE9K+yGhEdNTeBibwdSW1ZfSYCyNacY62X/bt9wL8Vvcpv?=
 =?us-ascii?Q?subJLnl1D240rbqldMCbqj5uuEhIIYYWv/hZyFLSHR323nYYSna1wfNElf/I?=
 =?us-ascii?Q?HF1W5ttV4CkdQGSP3KgPCli4KiDDLGSLHXzOoZ7Yb6gnDmIl+cQ3gdpaUdyX?=
 =?us-ascii?Q?4DCSiQkkrKYGFXkqHT0CqE+8TPGMz2jQiMDnJ1ZvDW+Ru5e97N+4rLo1MGxu?=
 =?us-ascii?Q?BpGCO6UDYgms4lN5pDGV1muiCNwum7WxObJypfJt/oICZ2QOFTbXFHFaSFmf?=
 =?us-ascii?Q?iTxFwoeI4xqE3z8xCqf3tA2Yt1j9ixSc50X8hY2TpjV+haFgqtf8iDf6SWJ1?=
 =?us-ascii?Q?UBF2obcbAFdFUotszr/vHnL81VcAY0Rus79eekTeNEhELWCvO9EkP1Ikha87?=
 =?us-ascii?Q?yjCvz6/BUDZuE6dOA5U8ktX/wyMnviysOur/BQADifdGRGmz+p315KeRiKeA?=
 =?us-ascii?Q?ibxwYHpr3EbzHs+9e8knF8FN7GR1wZDlHZpJEw/z5N43NdTDaV8hWMvjfz48?=
 =?us-ascii?Q?4aZxOa1CdsdixgHUnEuEpVmNQVCGmWCs0rgDskJXXVQnWpixTVGMAVDspYuI?=
 =?us-ascii?Q?7WwQVMDdUKVVvFQrv/9pu4NS/Y+NpwvwoIbS+QtKek5ohWaQ9KXUs+cUQl0j?=
 =?us-ascii?Q?9ZXzhMQGyA4wKpS5XENIYZPuc/w8j+6ChiEsZ9ptizIEFWvkBUt0+ZhoNM36?=
 =?us-ascii?Q?5UMQeidwbLePP4uT98hXoXIzqfnG6Kt9wYxnrQLpjrTQ18+ugZu/lsrpcMho?=
 =?us-ascii?Q?ml9UKiMWyhNUeYdZk2fhBqOkEfpCHlCql+TODsbRn/LrAmQkFcu+8PKKCBpU?=
 =?us-ascii?Q?Yjt6pHCNXA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f550065b-1b27-4893-0e65-08de79c5c7ca
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 08:12:30.2330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yag3VdJvNBsFr+bmOdYPxe3IGyw/CwM6COVdqaZj6jtBWwi6B1TYUwbX7Guiyfdo/t66jNFQVM6ZM20TMv5yxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8689
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_001235_343142_66117BEF 
X-CRM114-Status: GOOD (  12.18  )
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

This patch series enables SoC-specific timer drivers to be built as 
loadable modules for Generic Kernel Image (GKI). SoC-specific timer 
drivers provide always-on broadcast timers that complement the ARM 
architectural timer.

This series is based on the previous MediaTek timer modularization work:
Link: https://lore.kernel.org/all/20230517022557.24388-1-walter.chang@mediatek.com/

The series includes:
1. Export necessary functions from clocksource/mmio
2. Remove __init markings from timer-of to support modules
3. Convert MediaTek timer driver to support module build
4. Convert i.MX TPM timer driver to support module build

Testing performed:
- Built and tested on i.MX8ULP platform
- Built and tested on MediaTek platform
- Verified both built-in and module configurations
- Confirmed timer functionality in both configurations

Changes in v4:
- Refined the cover letter introduction to clarify that SoC-specific
  timers act as always-on broadcast timers complementing the ARM
  architectural timer.
- Expanded "GKI" to "Generic Kernel Image (GKI)" in commit messages.
- No functional changes to the code.

Changes in v3:
- Reworded summary line for timer-mediatek driver as suggested.
- Improved commit message formatting (line wrapping).
- No functional changes to the code.

Changes in v2:
- Added Signed-off-by from submitter (Zhipeng Wang) to all patches
  as requested by reviewers

Changes in v1:
- Fixed 'unsigned' to 'unsigned int' in clocksource_mmio_init()
- Changed MODULE_LICENSE from "GPL v2" to "GPL" for mediatek driver
- Added i.MX TPM timer driver module support

Chun-Hung Wu (3):
  clocksource/drivers/mmio: Export clocksource_mmio_init()
  clocksource/drivers/timer-of: Remove __init markings
  clocksource/drivers/timer-mediatek: Convert timer-mediatek to a
    loadable module

Jindong Yue (1):
  clocksource/drivers/imx-tpm: Support building imx-tpm driver as module

 drivers/clocksource/Kconfig          |  4 ++--
 drivers/clocksource/mmio.c           |  8 ++++---
 drivers/clocksource/timer-imx-tpm.c  | 36 +++++++++++++++++++++++++---
 drivers/clocksource/timer-mediatek.c | 33 +++++++++++++++++++++++++
 drivers/clocksource/timer-of.c       | 23 +++++++++---------
 drivers/clocksource/timer-of.h       |  6 ++---
 6 files changed, 88 insertions(+), 22 deletions(-)

-- 
2.34.1


