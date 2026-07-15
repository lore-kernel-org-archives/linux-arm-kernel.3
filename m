Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECA9C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vlMmABHURfgFO/daGhOyDVSFyXjuWEBaxvTIUoqfyqk=; b=mJuWG89YSzbh4CkwdM2qAaCkEA
	c7p/ShSHYjYXCsBZ3twV0gDBfowAPOOHgjQ14QwERsayZk+b2F/Tfi+EJxrTvFX4WClRASf4kQyY1
	6jketbysWkZyKH9zh4DInmmbdyRb/iJIA8+XlGqV508PJVqH3O69dDiQOUoCaL69I962HCuTzSKWt
	ArWNdtto4K+urqehEyBFqOWKYlHUfFEN8XldvFs0PaJmjl0TjiCwLwEubrMcA1xza+zqMi9n0ftMJ
	ETh4tP2rbnELMqmB7d9HJotdKmyxO0vkOkzPF/R0HoQKz3IhzBzlzKMcevMGLLxnw9tiCRUZATPrf
	lUKoXhpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk00y-0000000EzpZ-2fUn;
	Wed, 15 Jul 2026 13:51:08 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk00w-0000000EzoJ-03qU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 13:51:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhg92KCR1F3Z24btjoUy/GsxCHijjhazg8xvIFeVDfz3ADV7YYouc0SCmEd8piNPfuG3cGT/7WUCnLTQdPxoVmw0dKwFiRwpOyMe/Gf0thoniPipTpTkRWVgMwGLvhPkYWSJUW1Pzye8aTTKVmDhAUkjbHOJsOgCd7R0739dKMxsCvj1pBw2hs7h5EjEwLA8gTG41LXR0F2Zho5aangRfQftO314RBAdbJSYXZnH2aT2SgtYTvFilOSnodw1yS3ctS1QE31BrGKr9scdbxMYZwJlIHQmwq6dF5kjSUWMx5euDQDuXy13PMqoN3EUm9rUH0Jtszrc2VyNVF6KwBqjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlMmABHURfgFO/daGhOyDVSFyXjuWEBaxvTIUoqfyqk=;
 b=r9bn0jWDQn61UiuulCyf5mv0f3I/fKamu1J2Px9wvwB4pamJ2EEVNK3s+50olamdfDpYgm8JDOQ0lKvQSGtYQU+DyY4V2Hpv0HpVS1wvxoNBCHQd+YZE2iUMXAC6dEQoI5+evFTS4vdIpQlbWzA0bEZ9AA9tH6KybSiNNYaiJBua1ZRvMGXLlZBWSvo0A9sYutKR09Fp4B9BMIn3ukcg8pCz88E/Gy0zjzlKoU2eDxq7yMH66ijIRFd8phGf9QCnDyOeoRMvX5CFsQDQ0y1NeXquGawBYWAtQWdVZkRFFNM4J7si7hsGht3EwpFj605cPfchvgMkLddOkE5T+h4JOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlMmABHURfgFO/daGhOyDVSFyXjuWEBaxvTIUoqfyqk=;
 b=B+9HWO8WN4fyw9iefG+O7hBGAwvA8PPVQM5hxV07VVRAbtHqmNizOHZ4cxnMZ3cSdy2v6AhtQSJ44i5vUW5wgW+DsGstE3aFLJQpGnIF/6MNSjVFsPeJZEAdXnILdZZtyoPtelArEKYQx47LmRcHRJPHt6gyXiAzeAKkXgFEPdKxyjqC+r49TyjcEPB+tzmZrXgsYFEY5Pqef3+0oSKY/paHBK42b2rkFJkffA6CWi1bbkA1tZlxF+MpeUxHPi9+utE7LBoaBBFztiLBtVfIjRVxqLUfMuGMUxaaead960SlNFH6l96XAzWM9S6lLi5es0IlMSnEBdCQScs1rq4nzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SI3PR06MB8658.apcprd06.prod.outlook.com (2603:1096:4:2a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 13:50:44 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 13:50:44 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	William Breathitt Gray <wbg@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Julien Panis <jpanis@baylibre.com>,
	David Lechner <david@lechnology.com>,
	linux-iio@vger.kernel.org (open list:COUNTER SUBSYSTEM),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-omap@vger.kernel.org (open list:TI ENHANCED CAPTURE (eCAP) DRIVER)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 0/3] counter: Remove redundant error messages on IRQ request failure
Date: Wed, 15 Jul 2026 21:50:27 +0800
Message-Id: <20260715135030.326290-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0019.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::14) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SI3PR06MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: cb65c303-0a63-46cc-8245-08dee27810d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|52116014|366016|6133799003|56012099006|11063799006|38350700014|921020|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: OEPzfhHfjqVVs3upOUpY0l5DRAJwn5w8z7t412HhAoqqPbNFXeighqAda3mkEez2BpgG76YjQKw+WW8Xln9kjyCtCnykZJJT2mMPRW9A2E38lbqa7Tdh3jOCDZK+wrD30B/fFjnCU1dz5T84yr5wjrjAKarwbtrSO1VoO5DYNcejMJ44mlMh1xZc5dkUATalWSccYK9xLfXKfqoU12yknNgShjV/87YoG8WWA0dkgUNOEguaPhLurXfTV9GJfFUiCqDzimFMGSi0za45cbe6NYmXB2UMgB8O+nLRzCn6lKHB6FBaaPfJ5zAZYkPJ4AhIe3PTnLnS3sHJWXQ7xmyxOxspbh/sXdlpVBCglAh2IRUK4k3Uu2HvmWkM1hjCLrH1ICxyLKNAgvyNbDwr9XGGp0ymxeHiupsqu89wOP08StR76p0alSU1ZtWU9fYTU3sF9e4jcCyMxx5H9MK66uXdWKFyvYw5aHdO0EO6BgVVr7GyouK0NY3qkvZ3mMUtUbp6Vu8Qbd9+0eeO47peazus61ljYbW+smgeuKqfKJwFHY0Dq1Tq6UyjoTYdjIYmG5HesASeLjAzD9mMRJlRSiOI6HXNzZ6MH+DN5YJM2oRHm4+/nXWm45OEV/TeITS/JArwYG1GtCVjsvaArCk0pntbRFUr1gwV1fBcoy1boDRRVl+HEmDSwmgYdu5fW0uyiHS0iFlZd0qMepJb8hrG7coBsCX2N+wqE7PRtO32oqxuuX5akIyto0ITIeXK5qvK4jBn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(52116014)(366016)(6133799003)(56012099006)(11063799006)(38350700014)(921020)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gXMNFWjNA849YJfLfW9RWa/QZfGlo4FgssxusWtxlIkEuG/2orcMnQrauWIo?=
 =?us-ascii?Q?O90cdqEovnQ1/BLMt2HRQeuLVEBVpJI9fdWxqiIurYFDQQ752iemxU7wr3p3?=
 =?us-ascii?Q?qgNfSd5BHxbA7HCevi3ySGmS6+nhQC8UW7cifI7Zja99gO+YfM5Lo3m1Tb+j?=
 =?us-ascii?Q?sx2YXnMTErJRJeQjC48lRbXn74li0L9xS4OIqOpGsPMhMya4q8Y6w/bIX5RK?=
 =?us-ascii?Q?VUboZuYpn7806q4R7xjQr1kLDsmsRop03RSyM1BNVUb0lhwdHn5OK1iBwtfq?=
 =?us-ascii?Q?0jDBlAYQToW9l+AzDVAzAdQEvsHqA1qq/yNNTzvr1log/58VDNjBbEGPpTFq?=
 =?us-ascii?Q?wkyB3R0iBWVB5sxXx4rDBJ3weqJ0LXEw2VCtNXop0AxjtMUtAm8xnMl9fdlm?=
 =?us-ascii?Q?fzh0GWny6mXEWXptTL12tHdp1S93hYG8FbWP2TMzzoavG34FCWW/ALdQhYFN?=
 =?us-ascii?Q?k2ybffXU1g+9eYk0w/0B3C1E29VTMH6VQVLf3L0iLpDJrDweylX2ykwr+pgh?=
 =?us-ascii?Q?2JKxe6IEI2XHMH9ddxjEr1XNGmg9aVKrBmNqDUI/IIOuIyIJYqdkd1+PVFBP?=
 =?us-ascii?Q?TJBWF4Zhw2FMxFMBNIANtk1FumAa0pMYtHr4QMV72W+IbEgTAoXlUTc4y0qX?=
 =?us-ascii?Q?T9QHIB10FVxe0b7Oa7RxkFqkIjb45fmSRsx+Mm+i26p7utTC77IQa1IOPXq2?=
 =?us-ascii?Q?BeFIv7u1JHT+u/IdFA7pfd+aP0Y0e11ySpDM/nl+9cyu1BT8XZgAty3Z5n2y?=
 =?us-ascii?Q?T3JWGb99EQVZpdrH1zgS6qk/QpAhHfTEaOOToxtRETxXAwIHJaLrm3YACi8J?=
 =?us-ascii?Q?sKqtHGUtWyS1Mm68BEOmrFLdsF8mea7o6e6mTNm8x7JS5/KzFe/5BkC7DlLS?=
 =?us-ascii?Q?ieKHgw5TiXakUyHEBpvTySQfnHALxEU12lzfrKbsM4doRg97Smm2q4qiZCJ1?=
 =?us-ascii?Q?PjiumvtyiohvenGhLLB6eZOWaVgf6sA0CX4u180kEv84BJx4bjz4UuJGIWej?=
 =?us-ascii?Q?0+hjV5GiQpZHWQWQFajZ1WPIahYBM6oDqJOZFYsHUEVsGEUQK69jSoymIDpm?=
 =?us-ascii?Q?6mtWabCGvePxy9uN3pVVibWig/YqevCeLMD+8p4hMayyRbnPc7GQUShSFKnw?=
 =?us-ascii?Q?Le/L61OIDMVa0a/nTRwSyszk5HVXeo5SBrsI4KcoCxitNdHM/WyKP1nCKkYs?=
 =?us-ascii?Q?YDJVbSDxhOB+J5EKb+jYAZJKFiukGbSgTe9K/mK5ZarTiexxp3524vlT/qAt?=
 =?us-ascii?Q?SL/A/PbMhkq77fNnGbJKSx/zyYX6wQoez/cWsZID1qMZpTeYojQnhcTrXAZm?=
 =?us-ascii?Q?q1uBR9apWLDAhme6/g6fMc9VHH+MG5HhfWitrdYcsahPShjbG2+qa5ANZM3Q?=
 =?us-ascii?Q?c+mnqRv4hPN1zQOzvTF8dg1QUJI3LCQuN/6pesqGrjqS5rPsW4w08FJ4w39t?=
 =?us-ascii?Q?8rBQ0k8PSVEGDbkiwtCuT/pGVPSMOlrtBGJYbfiy5KJ6vHOsn1H0fHUXVsJn?=
 =?us-ascii?Q?L6QhsvlPYqdIffK2lqu9BVX+C7/SOFNRvKVFxYnWeSF1UTzYBHZAKIRjhetp?=
 =?us-ascii?Q?jK+kjMDjFwQqwMKsiem+njThbuWV1F8dVnmECBU6MHXOnnqjm4eGtoYJyILE?=
 =?us-ascii?Q?C3Us4KtkKMuoxbo5AITnxJWAel13PRTEQZpF+VRTTO15KUVMzHpJsDmSQTES?=
 =?us-ascii?Q?2juheK26sZiZdfrIGF9YHkoz6IirfGj25ww06fFZOpSuFTnlK8puh8mbUW5F?=
 =?us-ascii?Q?rmQCpFK1Jw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb65c303-0a63-46cc-8245-08dee27810d5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 13:50:44.3315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBqmf1z+JkWTxpHWFtVEto1chqMfuB9W79WNK1CLJ6d8fBfYWQ5Ns/o239M7RQ2uHuOscupKNU1BCHCIiRnzqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR06MB8658
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_065106_184275_A6395DB1 
X-CRM114-Status: UNSURE (   7.72  )
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

Commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()") added automatic error logging to
devm_request_threaded_irq() and devm_request_any_context_irq()
via the new devm_request_result() helper, which prints device
name, IRQ number, handler functions, and error code on failure.

Since devm_request_irq() is a static inline wrapper around
devm_request_threaded_irq(), it also benefits from this
automatic logging.

Remove the now-redundant dev_err() and dev_err_probe() calls
in counter drivers that follow these devm_request_*_irq()
functions, as the core now provides more detailed diagnostic
information on failure.

Pan Chuang (3):
  counter: stm32-timer-cnt: Remove redundant dev_err()
  counter: ti-ecap-capture: Remove redundant dev_err_probe()
  counter: ti-eqep: Remove redundant dev_err_probe()

 drivers/counter/stm32-timer-cnt.c | 10 ++--------
 drivers/counter/ti-ecap-capture.c |  2 +-
 drivers/counter/ti-eqep.c         |  2 +-
 3 files changed, 4 insertions(+), 10 deletions(-)

-- 
2.34.1


