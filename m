Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D090BC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 10:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v2MRv4culIsa2bXRmpNcWw+iI8lxtL+i0PKMVTAUUMA=; b=TdXlLseEDUx9253Y+6+1/bXgRl
	2T6PJNFYJ+wTXPcr2y8+XRuRtlyQBpBrcvcSld+l9uLOznqpaQyta2+88qkIxdC1iXuqenIuevAfa
	Ivzpss6zKrRytEA9nCSG1wSqUvkDtUsEvXzcJtMChHIaybErOfVyb9eWoHZ/QqvpUJgvBU1ePLP5Y
	odpowLiRkOilj6PctTQVVdeZ//lhDzcbvfhitNJe7MLsgdY7S1Ns3QGBNRaBw7LoNHDsAm3Y4TZuS
	nGqREmq0I4BbxklXs1WDbbu+wAq/1f+vZLaj3yraHFlZURlzFMlkvFslK66OQ4aE2DCSvsi2+qtrO
	CW6Oeo0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfSE-00000001uql-23ri;
	Fri, 17 Jul 2026 10:06:02 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfSB-00000001upv-0azc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 10:06:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tF6XrG5mUn0m/PRAdchFSbd36fuNGZP44hje8OWcSI2EUo7fKr/BHoJ5OLd8PP6ak49CqCUud3qw3z0bsoV2US6g/sCaUw2ZO3uxkddKxokf7qFwctM/SF/dc2b1TOzT2QdN+Hugr2WwtK2i7OKoNFh+FzcFDlnU/yaSxpYESYxvH1YE1Z0JHYm45+ccvo3GK0NP8egdwDBhgrHVIMzl85Tj2SfRQ32Qbae/Z+938WXUvDl1DREjQAI5PJYRPPaxVSL78aBvhGRaj9WcesJI1Oqdm1Qz1Jorqji/BcHuXhQ7L4O7Rtdjn9ednfIhWMhtjix+wxoexcnlQ8ZE64v9Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2MRv4culIsa2bXRmpNcWw+iI8lxtL+i0PKMVTAUUMA=;
 b=DV29btHCwzGL419fsXC67RguxADlMNAwPNN8SmYIFoGabR/FqjPG9nFR3PzJ394rNcQjolFLRWeYHDAirrVOdAVZNnYpfeYvJsAR66zvg8pqMjmkqbXiV48JdV/PhKsTcMd3zB3hh+oSZzgFp/uulIuSYp+/EgklWux68ep86557A8mQ9EYtkEsUCHWKoqSZKsvypGCtKhOuC2hjQu+RtLn6YfY0531VzCuhgn0zo0doUXShCKLqOBt8g2HU/jOHluaDDic1Bi4khpRPKhyaNlSCNkI8o5+N5kmDHQZP5flLTWSI9qYcUPs7tuUhb6BU/vY0GDiHG6wlL10U5zE/5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2MRv4culIsa2bXRmpNcWw+iI8lxtL+i0PKMVTAUUMA=;
 b=foShODZ909sexqfQvyFiff2So841Yoi65Y0Ln5cXFmJMvhodL4iPxtjEL7cel56Dy3AHYgSvX3i4WsX9dhtRvh2DjeXb7XGMD4keof2D7Kbxwg0W3TUDrQEnHwgMDMSDfiMIHxjj7Usfxr5Ja3D4xdcNssgsIec6YlQHtvClpBzpMr1Fi34Hlyb5+Zi1nHSWBdVaRQINNJe1FNHODDXhF5UyDdvwALpxQ+85t/yN1D4Nk2y3+7HtiTe9iSsLRdgCcZFPJpr5RgO+dCnL9lrcbeD5Q8IOJgmeMZmr/MDyAXX5HpnI5A84Swop0ZI0qTDTLPdXaarb9UoUhqCyb11uBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by KU2PPFBE3986883.apcprd06.prod.outlook.com (2603:1096:d18::4ac) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 10:05:45 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 10:05:44 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Scott Branden <scott.branden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Vamsi Attunuru <vattunuru@marvell.com>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 0/3] misc: Remove redundant error messages on IRQ request failure
Date: Fri, 17 Jul 2026 18:05:29 +0800
Message-Id: <20260717100533.601899-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0015.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::11) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|KU2PPFBE3986883:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b9e3780-d67b-4e8f-6216-08dee3eaf76f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|23010399003|11063799006|56012099006|6133799003|18002099003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info: SaunmIxeguDl8Cp6ZO3OIEJuoFBfJqa9TIP8QeNTPFy/Qc9kJBOgJ+1yAGBRr3r19LFhEuD03P2ClXlRKY3WV5fMIIwrdLHoY6rSpfCSt4kLnxiTn0ft6QhOzsIO4JxhK/dNWrbT4EOCuU7CCzLQP7WUnwv4OY4q6I860N5U4F/HUvcx299FSUzi15ZdYVMKyozFELPBCxFVzuP7nIhq3lwrnbQPnQDcoJDHmHzIBCFK36N3e/9h2D6uhj3Ahx+/FRPiLbi0L9xLbJ5qWciQFxGk3aVrR+CeWTk3Esk1jSgVajROyHAPozP6trqdipoosoYdB8pOms0JG2dyNd5uM69CsBNQRSQZcEfgv0T+MpgV2uCqd55Iuhwv7frl41EI3X/r7x3bmZDy1Yvem4kqghZTmywumdzJO7vVNuPUC0MpviRDYNJHcxlAMgDlxjx0Xt3/NLorZWfCHXqr0nsnOnl06BvVQFY9boItJWi5kx+EB4aJS0/v1+zcjgkS7/2U9ECmReXjIj0525hzmpU+FCLLvauq5FVGTHBEz7qu9aTG8FZuPde7Zqvct4tqHBbfS4zvVxb+jOI8mG/+gJ/599ozejcymfzSL2ECLWIE5FWl4HwbtTKftc2APF2CzXV1a96wNgN43GcBKkkCDdTurg9tURVU18YOaIpwUyflmWGv1pphqlwpeVkGRoJuiXVNj3yWSQ/N1JS146PUzt7mr1VqV1pkUWEAsm0Yj986VoKRoAuHACs94l94BIj2dKY/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(23010399003)(11063799006)(56012099006)(6133799003)(18002099003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KKRCNbfR+U+2UQ7jEIhf9Eb8kGA0sGRbeRvq9LLFsNcZ4QPbA6W1OVGvrHvF?=
 =?us-ascii?Q?S7fiAkZzmS4/8zdDJj0fuTzrAR6o5wSKgg3cPtpppeLEJJFcmLMdeR/XEX66?=
 =?us-ascii?Q?DkGHUSIfEAeX2bvDQpqC3TR9JsXBe7CxqLIDy6B25PuVwemMr5aauS59PA1u?=
 =?us-ascii?Q?iRQs7BOUOxfV/DfpLMwN7BBgAj8isEZg/dhBfecPGFwFP78DtHrIPGZuywYX?=
 =?us-ascii?Q?kWpYK7SeySUYKDxVc4ZnZ4WHQG2yMOPYHJm5A2/IW5gDrc6g+NkvPRVHlGvK?=
 =?us-ascii?Q?XJeCQx92UX49CLzS7N9QPxYnjxeMu/zcJiPO+g5TF1rYYRU53ZOMFG1D1Xm1?=
 =?us-ascii?Q?noK4qrUKP4hNztwkepH/s+mDH8Av1EeL1KpGeNb+9pweasD6nj5KFU19c2+M?=
 =?us-ascii?Q?bIsgycT1ktCoh2mq9Wpo6l7Z5qmAbVXbWvEFGtCbsTqFq6HRy3p7O4T7omDU?=
 =?us-ascii?Q?oKChTh//00PLghu1xNZtwV2ZvwBPiaC6ItfSU53EI9JE/YdNnvYMeXpFiWzx?=
 =?us-ascii?Q?FCdfoWpQsw5/bgsU7H+YYDIt8+nJomUOouvf15S+6I9PCSmG2i4C9opwQXxf?=
 =?us-ascii?Q?D/IiM3AVTqot6Ycf4TvSU+0TRtPm/XRMQBDxUmZF+n4l+VwBA7nFTZFRx0cA?=
 =?us-ascii?Q?BH7KvCY9Mqir7/Jq5SscRq1O/B1Ng8K50OIq/24XK2jddrZkp7ys808+5nro?=
 =?us-ascii?Q?jjOpXTWF/ny4G4oUsBqhgnvWmBylzLZdwuhK8sVqDd6aq6E8PgmOwJ+mK/Qk?=
 =?us-ascii?Q?djCDALGYlqievJoxJ5aNm+0GyM2vTeqGg8JJTT7gz09O9OkS7u0FBOHK6/IH?=
 =?us-ascii?Q?rkiHn74y8Hv/+/Z76oFVWBRcdWtVL80m6g7s3nHrwmUX5fa0qQ1jtHhKCFIQ?=
 =?us-ascii?Q?a/LWm/7sFxLsfYjimEHG0oU3DfRfKgVUIOTFdkz4g5FeBUk2ha9vWutYfzwe?=
 =?us-ascii?Q?4jCIBjh8bXFj+O7DshdkVU3NBXqQPktRuUwVgs5jVZR3utXWmThfyJHkdat4?=
 =?us-ascii?Q?u/k8iHH7QqhRGg72OqcBAootwhLO8HMBWwb8/GdGTtv8M8iXrUC7+I3/ELpm?=
 =?us-ascii?Q?tJvLbCI1zBXMzhQoIeKlcNyCY92frj6Nk2sM/fEeCTSacORqk4H2jRePor+e?=
 =?us-ascii?Q?n7SA2tBNbtxOyekgSJNSJye6f5Fce26ndY6Yg8UjB37f4AFy5/3PIGx9c8XJ?=
 =?us-ascii?Q?ZFwlaxlNVyG+UATQLdVuniNREJEh85b8w1tP4QNjippwIp9d++ClwOYsKcYt?=
 =?us-ascii?Q?SilHy7xEsAGhY1j8IcY9Zegkcjg9wm7wRbTr8pnccDMyoILhTtEiIvmRei1C?=
 =?us-ascii?Q?So12h/ey6k6J8ws/laxFYaYt3pJl4DlZ1Ft+2pFm7askTqhFQiH3GAuDhTIh?=
 =?us-ascii?Q?BskaTHmaI/Wq1l9aL4vo4BOi0UjUkO475iBV6eHPrWCRd5CO0QCcMPpaC3dU?=
 =?us-ascii?Q?cwO/HZDsllH3vCnz1Fl7QJaFwIpy157J96bTUooXgXk3I/0sp2t0GjVcHnAG?=
 =?us-ascii?Q?jPcf8jIGhHxUAENyXRN2tieDqkK/HmAWQihJzZsBT0bl3hZMmAnymD/nG7fR?=
 =?us-ascii?Q?ZzAcJUWQeipZkk9wMusuf2/OAFRWfM+EeSGx3dJGGcL+Wxqbt0INtVrDsZn/?=
 =?us-ascii?Q?RAJqtJJXhsTloSxe+MN2anUDW/ThxD68W/xxmaF2zvrcx1X7NTw/7ttXQb0g?=
 =?us-ascii?Q?ypgPTvegGNHR/qMT1pFV9kSr3IQkVxETtdyyfa4UPVbOB6DDNaG+c2ksPBaG?=
 =?us-ascii?Q?9Z8OmjXXIg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9e3780-d67b-4e8f-6216-08dee3eaf76f
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 10:05:44.8617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcXS/0xiZA1MbdkEdaE0DW1u4CGa2nlFE1D4oI/j9D83b2jOQAY2g3RM7WkAAV1mJBLxVRcYHcLyyOcCOCBbTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPFBE3986883
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_030559_182748_F40D56B3 
X-CRM114-Status: UNSURE (   7.68  )
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

devm_request_threaded_irq() and devm_request_any_context_irq()
automatically log detailed error messages on failure via
the devm_request_result() helper, which prints device
name, IRQ number, handler functions, and error code.

Since devm_request_irq() is a static inline wrapper around
devm_request_threaded_irq(), it also benefits from this
automatic logging.

Remove the now-redundant dev_err() and dev_err_probe() calls
in misc drivers that follow these devm_request_*_irq()
functions, as the core now provides more detailed diagnostic
information on failure.

Pan Chuang (3):
  misc: bcm-vk: Remove redundant dev_err()
  misc: Remove redundant dev_err()/dev_err_probe()
  mei: Remove redundant dev_err()

 drivers/misc/bcm-vk/bcm_vk_dev.c | 15 +++------------
 drivers/misc/hi6421v600-irq.c    |  5 +----
 drivers/misc/mei/gsc-me.c        |  4 +---
 drivers/misc/mrvl_cn10k_dpi.c    |  4 +---
 drivers/misc/tps6594-esm.c       |  2 +-
 drivers/misc/tps6594-pfsm.c      |  2 +-
 drivers/misc/xilinx_sdfec.c      |  4 +---
 7 files changed, 9 insertions(+), 27 deletions(-)

-- 
2.34.1


