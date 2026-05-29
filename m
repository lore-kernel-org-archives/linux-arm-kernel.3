Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808F2CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 06:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0uIOdmH2gf4n0/FdjEI3JVnme1HnFWdBnkUzUk34F7o=; b=qimpk5SlWiuqyPm0LKiPxLDSoC
	3WkiPemzbDPERvr3OlNsgTkazElLtM9oMdEb1i+u66xW9+yV8sPPDjYZKTZB4H5RcmcEIwPrZcG/a
	neAYcTI2rO8tboPO8fHWpyKxIx9NJ6ra+McjXK2t21Cg91VmOs18z9XFtX/9t7lgMRzuLVsfHP5M9
	t9Lt7bH8e2zjlm8OnzKrYS/q95oSsEMe8Xbm0sATBxsOhoM3H/FHFqiMefWiUUCTtSd70PQFqVDxM
	riEozPxBXUx0hl1vcumLCauH4QVMrst/j23g6vw96p9hKgDUJyuz+RI49Q0de+hS67F/NS0K7LNUd
	UnmJ0i4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqzt-00000006puM-0D1k;
	Fri, 29 May 2026 06:47:09 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqzq-00000006ptx-3JXV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 06:47:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ueM2Vl6rjt1YixRLl9sAtCbJOKQ8ZMqyQb7kCAYlxHVr/1Z1/mfv4Cz5k3l80zE2ZxxgAPzAeq0qg5xCLVaNCkh+u8tXvYLSwpe8iJYtMme0WVMaLlYjTOHkeEKqksfHXvmSqegBX0sxcHRgOAoVmHX6+gufbqhWe5UJ2w9X5eh6kyNu/ijx6wjkDkXl9jry9UhQQVpXeSQSisXXywNLcW66uWqvep0K6nJMG8RSnAaTNTEL94FY2Mw3uVi1znM8UjZtW+2LW5POTBMfyyrpdcPppwyFUyAnDL0GY5SvYP/gG1FYOtAjpDygde5+sHirBmwb6Vr8ziwdj1MK9XmlYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uIOdmH2gf4n0/FdjEI3JVnme1HnFWdBnkUzUk34F7o=;
 b=T4CW5kiURcurrOn8d9TJqc/CjyC0K3zaHSpaES2S4GvNmfMGFVkDQDJD2/uRL6GudZ3tAQGMHDT4RYJKgXH7na2YO2sTf2FmH2B4ANGv2W4wmWtdKBqqKnje9nfxUgePTWBiXGCU10FxHXdCPK8eJjj5MFgW6VJZ9vpzg4ux1fhCThva2pfVeTWpTyLxJrCEFHPpDArtftIHzc9DnnrpjZRAufkd2l9dnZRTLL80VPtGgIoevlSmS61Xl64fAppsEaD4VMxKilqwExJ0ZcOGRqphWDADTv6G/vp2RaWcYzunu9s5pzCYbZrkbH7yn/Ae8aPd/seUk0PMvFGO784EOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uIOdmH2gf4n0/FdjEI3JVnme1HnFWdBnkUzUk34F7o=;
 b=LQGfoe+Fjhg53Z0QWYoI+hx9/MbmFruj9EEONSoLZmasUPcjI8k5cLmll7Bd1buWGzfxsT3iLswoLRnYMrYT0sUEVEt4EwZWMOTQDe1lENLS8jzSVhqzKUS+E4D9+U2/+BEYAm9PDCETXSmCcc7d9JExmTwVhICrDpCGgWsELxM1h/8CXEr749NzdZvjms/cQFnhQmp7iftnZdhe78I7YNSP3t2kTuXpKpJU7YKDFAgh/Y9zPqOdE9n+ggE0lmCg8EgUI9KPFLbcI+FOQ5BEiOyIvQ1tv+xSnd2e6RQobha7JJZZj8ccTvB2Qsf5d3UeB1UVv8CFhOytIjIzLbWE5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by DS0PR03MB8200.namprd03.prod.outlook.com (2603:10b6:8:293::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 06:47:01 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 06:47:01 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] net: stmmac: Improve Tx timer arm logic further
Date: Thu, 28 May 2026 23:46:59 -0700
Message-ID: <20260529064659.32287-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0113.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::28) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|DS0PR03MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: ab49e06a-a7fc-40e5-ba3d-08debd4e1626
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|55112099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 9v+2rYosFelVEvr8xa3umopqLUeXAuNwefYGcS9Goxdl2cHpk52DRqcosbKbgzFvfs0qDO8KVISg1GaN7g2PNuG/ku5RLzP/1bZ31+AeEEydB1oPbRiRus7TjjxNisBpLvtn7yL/ab7+BIsXP6omE9Jk5DFZFKCHWIdW569nE211nXbbVLsiAlqQdO0aCSTHadA/uPii06+agLyvFDU2ezPNr0p/V9FvWSf/AcT9u9GyPjQKfNN0xtmzFdTL/sm7qbeEx4+uY7lXlWXaFtQbwYsOuJZu6+wMdvmxbTFeAqPsh1bfb2MOmihQfE1tPCVEHb8B1Pr78LyaFfG3tfKXKPK8vgKzic/tUvY5wYRMz3oswte1XKf+gVJiYcXcQKV/9fWPaDYqkkdUwJEkVqSRxbw0emoVi89SD17v+25gEZtTKukTL9tXz4KmAYfr8BIT1mk3EorSGq2PaZG15y/q+fBbu6DRSeDG7BW6ZwfR9F7RnqxntPMYU9TpC7HS9tlNmxt2bISOEPbDI7BOebJqwLszYrhQRwzxeKfLz4Soo1JZuRskMQyeBySjVdUGX63r/K8UkopetzfofO1aQBUHewXf8gNXun1j8UGXY6BqVhZULSYohD40qO5pjrBgmxswceHF1KA6Tc+LZs+QYjt3AjKDMYP1AhgRkZVnhbajV/ZeGHFuUzCJMIx6mSwl2MOr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(55112099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a0n/XF5LAIhxdTRiuaBSwBJanXkmnmRxg/iHl5H/0Po/4+RIISatR2+EcUrS?=
 =?us-ascii?Q?TSB1g+0FOqIpQkLmPYGRLSmBeCpiQdI97blDzQXDTnMufig7c8WQ37R3EAmM?=
 =?us-ascii?Q?XCcUtMGPxBn+6KwbEmIjd6SY2AIZkrj+DBqgQSCqaF1FmDtje3baEVg0B8/m?=
 =?us-ascii?Q?fIo+95t0WvHv086Al5P2s3vv7CXX9lny/ZuTJD7EyVSjnEI71futxh0o+jLr?=
 =?us-ascii?Q?lvA84eZZIW0vqAaphuOcOSoeAkKZFEuS2lbYo8hMoEjTI65NRO3f4/hYVgDh?=
 =?us-ascii?Q?QndG3A93Bk37GOSQg4IDL5+7+JrK2upeyZyNS3sdQ83Ul4HnM6OPnDZ/JWzV?=
 =?us-ascii?Q?cR5RiRLgRArs5VRLvg9YEufZa64ISmoe9tayo+8bfQ/YxrjVaUr6RvTPykxj?=
 =?us-ascii?Q?AKClYUy4Wn7nVDQnUJ0udiMI0F8TwW9xfULwNqBHVEe+vxi8GsuA+rYlMVLX?=
 =?us-ascii?Q?4OqBeoLvntkgS8wjO23XZKTx9IYumCyeW9n/unMzTWlDS+T/6dzj7PD0rFp2?=
 =?us-ascii?Q?+PogxGs/7Ohj++zji7V7VVmmCYsznHq2c0StxtwC+j4/vi63DsL9bAALVg8T?=
 =?us-ascii?Q?NeHLPVMJo8B7wk8LK3PC7CdrTdDgcQX+4cyl4+27Da4kaP0WF7Lhwxsif4MT?=
 =?us-ascii?Q?C6P9FviyRvi5YMN/khzLskwNzyEyNxLrjFJVMyzZMFGyU9i3E2g5YWkkg5Ia?=
 =?us-ascii?Q?16jo9vw1it9rRzM9a4kcio8nn4H0nDBO6ABwRxS4aup5GVJ1iVphThAc3tyO?=
 =?us-ascii?Q?GUUMzLfw3ojmUHV1NVKB4C6leXBiHg1sKxh3itvjisLVko3ctbkCuYOUn1Bn?=
 =?us-ascii?Q?gBZ9PDkBR1C7fE5d03jhvXT+n2LWckflwO9nKdpe6T6gjqIvqSWbPVeAKmol?=
 =?us-ascii?Q?IkTjIogXFYE/V5DZC7mGFcYR8D/+lrcEANljlAI7iFZ/VseVIlDvoARfukFa?=
 =?us-ascii?Q?XNpgoIycRi3JRO8dOC2buNAKSWyArhD/ZsVvqTwkKatQeE8YgAmDfGxy98BM?=
 =?us-ascii?Q?S3DLAE/lvBZFkAUwzbMefVtzmhY+nvl9c71RgKhZRj+wIqZcXPcY6cmZHVTX?=
 =?us-ascii?Q?RoLf9h/Hg9+QuzCcnZMZTWZ/+gU/R7NRXJI3bAZqp6ur/ub+hLvVG3Tr7bqn?=
 =?us-ascii?Q?HwcQb6zTQ+930Pm+hqxq4RpA5Wa9W3QyxX+5PhEo4I+z2O1jJzwV/B/vsfuW?=
 =?us-ascii?Q?hX1FLuu9KkAu2dWO1lPZf7aF31wVknd9owAMJr/ldNrIwd9HAHmNH61K+eSP?=
 =?us-ascii?Q?/edzNCf6aV08ODEWfcRlhDBXLj04dLj2VjKgfVJHo2P60c+oFLCRfww3hm4J?=
 =?us-ascii?Q?wfVXhB5CLEuEZg5gRuIN6jXFsMWALY/vB71ikd1jMBaIoDs+eNNrPTSJ0HOj?=
 =?us-ascii?Q?f9Sk3jXahpq/ujMXzFdoSZ1KgSbuOgqMcRvZ6zfghKE2ZQmNo13dT95MM024?=
 =?us-ascii?Q?Zsbiw+6Vuaql3O8G9kd690RI2lujNgZHJDC1hSaWDPN5RCD7HWo8Ub9TJA2b?=
 =?us-ascii?Q?xlRLKkhYXi06N00+7he8FA4YvNWhLUMB2+Sw8Y2PvppJ4m5VCAYHAYE/25mi?=
 =?us-ascii?Q?NPVQRYtObCkPCUtkhB+69Znj9e2zwI9H6SJA2NmTiowtGTmuWnUjST9xnJIm?=
 =?us-ascii?Q?ptwosCChJX3PGR6h2MHqzU2scaijYtrKwYH+1PQ4xs/8zWu+Vh7ZNnAa6u92?=
 =?us-ascii?Q?VagfJW3eaTpqTpvKZfD+O1AW3/d0XEWvJpMW2AWfQHLHkiMVhyXrNibgtS7f?=
 =?us-ascii?Q?fAjzXfSAspVOjnWhZo/fg0bLBKNTpoVr0xVSAU3MZln3D9qHiOM2pKj0BbQ2?=
X-MS-Exchange-AntiSpam-MessageData-1: 9RvWgty58n5psw==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab49e06a-a7fc-40e5-ba3d-08debd4e1626
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 06:47:01.2058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RdDJ/d8CS2zvjZWhKuLdWhwvaO/4KLFEl4o1a7uIg0QrEfMMGMXf71naMzzB13tPAd3gKtoufcaxOThB36M1QomGo384shrrKJSevMipEheh98FHaG9qNLb87Z8bTSJBHqMn5zlfe3zHHjB321RkXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_234706_841422_09641BCF 
X-CRM114-Status: GOOD (  13.02  )
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

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Calling hrtimer_start() on an already-active txtimer is unnecessary
and expensive. Skip the restart if the timer is already active by
adding an hrtimer_active() check before hrtimer_start().

Previously, each packet reset the timer to tx_coal_timer in the future,
acting as a sliding window that delayed NAPI under burst traffic. With
this change, an already-active timer is left to fire sooner, scheduling
NAPI within tx_coal_timer of the first packet and freeing TX descriptors
earlier.

There is no race concern: hrtimer_start() is internally serialized and
safe to call on an active timer. In the event of a race between
hrtimer_active() and hrtimer_start(), the worst case is calling
hrtimer_start() on an already-active timer, which is identical to the
pre-patch behaviour.

Performance on Cyclone V with dwmac-socfpga (iperf3 -u -b 0 -l 64):
  Before: ~45200 pps
  After:  ~52300 pps (~15% improvement)

Additionally, ~10% improvement in UDP throughput observed on Agilex5,
with hrtimer CPU usage reduced from ~8% to ~0.6%.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
Changes in v3:
 - Corrected commit message to accurately describe timer behaviour change:
   timer now fires sooner under burst traffic, not "unchanged" (Andrew Lunn)
 - Added Reviewed-by from Jacob Keller

Changes in v2:
 - Expanded commit message to address race condition concern and clarify
   tx_coal_timer semantics (Andrew Lunn)
 - Added performance numbers to commit message (Andrew Lunn)
 - Added Agilex5 performance data with hrtimer CPU usage improvement
 - Added Tested-by and Reviewed-by from Maxime Chevallier
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions()

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3591755ea30b..35da51c26248 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3341,12 +3341,14 @@ static void stmmac_tx_timer_arm(struct stmmac_priv *priv, u32 queue)
 	 * Try to cancel any timer if napi is scheduled, timer will be armed
 	 * again in the next scheduled napi.
 	 */
-	if (unlikely(!napi_is_scheduled(napi)))
-		hrtimer_start(&tx_q->txtimer,
-			      STMMAC_COAL_TIMER(tx_coal_timer),
-			      HRTIMER_MODE_REL);
-	else
+	if (unlikely(!napi_is_scheduled(napi))) {
+		if (unlikely(!(hrtimer_active(&tx_q->txtimer))))
+			hrtimer_start(&tx_q->txtimer,
+				      STMMAC_COAL_TIMER(tx_coal_timer),
+				      HRTIMER_MODE_REL);
+	} else {
 		hrtimer_try_to_cancel(&tx_q->txtimer);
+	}
 }
 
 /**
-- 
2.43.7


