Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F0FC54F52
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 01:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYQg/ilolQrVxlqTAnt4MAsteh/Y6Eph4WmYwLcGQd8=; b=AX6+xlzVacjlVMX4Sus37Uaodi
	cY4U7gmzDua8jLQRuCMI7aiEZupJwIlsFBA+7J7MeF57qPjHIOh3w0MMPWIgMkjTz/Bl459gUzXY8
	wTbWJHBUXGWcXcUhhrUP7VPJb7CFxFt4TPhyYWrs9ZiOtklpiG3fKYRdKk3MYc4FJOs7tmwP2/3nq
	lQdcaHkUIVVo0va7UP/c3zSl7718j/1kR4Y/n4h1MpU408EA42J0YlrMB4i4nV7RcFDbrFH4BO4Fr
	b247Fizv/5ql977oM+Gmcq+mmMKJ1D83qc/tLQQbpvhyjh2pn5QABAltdlGQr9zYEBIL1ewWLwXxX
	5nMAjlpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotTq-00000006dLv-3Oh0;
	Wed, 29 Jul 2026 01:53:10 +0000
Received: from mail-eastus2azon11010022.outbound.protection.outlook.com ([52.101.56.22] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotTf-00000006dHQ-1l1A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 01:53:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vFETkXlFu4vXja83w5jJOJr3P1yr5IT3RNzQnY2f/LHUHG6JqPpvxTvACTzhLvEZcNR2S5EvO9uP5XJuEn1y0Sx48ZikJXOSp04dn+Q9BoUAyORpdTiSmzCRZ0/mt+HILoq43FjGv5gTwv2xZ3ui6s2jhYES+sjcyqJQB1pVS+8/htsMoB1MSlk9lsUYgsipVqfOcjdd0BIw7Kub2sglMgPIFo3UiSyW+hS2TsDsXNPSnpMngQ01iEOWk0DSyMhANw6gSv2a2e+9Kb52czKVBrsUhxJhk+QbcrYCC4Q4WuUE+xCE01hjUyyeKCrwWWvN7N2G35whGzu9ApY1+CPbFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYQg/ilolQrVxlqTAnt4MAsteh/Y6Eph4WmYwLcGQd8=;
 b=kUwtyo9bAm8TprsAyPCYUXjlhM8yrukCcFlxHGYTxm0Yd6h52x2dp8C5tigQyzkF7phOv1PvK09KmAT1fhCYHW2Nzqjd+DB0dDFH3VboPRPmvF2tWMXJhRFZstmVC+bjsolZx2AJp0BecHTjezpgDvLhjYBxk+P2wg1NnTXYEOnpgSRNZHJUTPAwxLO7TMK7RXKZfgNIht8mPy5AQNGBgeJW9NtHdL13VGGdVft3STwNTDO43A2FHPWzquuUmYc2sCUFLxf8zC3pTJmlqAvPUFT3H0xB0kzxmuPdo0tl2p+qGEplUtXrb5KAbWP+5QGpmfaAtBMlKtuhP4j2fSTO+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYQg/ilolQrVxlqTAnt4MAsteh/Y6Eph4WmYwLcGQd8=;
 b=UmsBzhrVSXjTI+qjqocZzUIqhOuLwLmf9wFIm6Nzed4CSfZodVUs+pIhH+wuqNeqjf3aKTgYNM4jvFwiZrA9+vi84sl/ZsGLLghvoDmf00sjq1lwC43LOnEo+EQ/HTIIEsMQxddjy7Xkc3Xk10BBYgLteMXnqZmZ2O8gWyA3y2xMJ72Lsnx2SOF4GKx+7MwqOS32Gho7F89l/yaR0M7EL0T06gB8jbApLAEIk6CcfzOpPK2rD5gCqkT/qb5ci6UOPHlzkuMbK81XK87q98zB5z0Jq3RetoeJpjFzmfVV+JRkuwMcbLsl5TmnR3gn+hUFjpZEEgPWnWft6UWWXPNX2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by MN6PR03MB7550.namprd03.prod.outlook.com (2603:10b6:208:4f0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 01:52:52 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 01:52:52 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/3] net: stmmac: fpe: Add missing return in stmmac_fpe_init()
Date: Tue, 28 Jul 2026 18:52:46 -0700
Message-ID: <20260729015247.25774-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260729015247.25774-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260729015247.25774-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0045.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::14) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|MN6PR03MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c569368-a1f9-4f4d-02ab-08deed14199c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|6133799003|56012099006|11063799006|55112099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: R4yMJtgTwajTYlAhYUcudGY8BHPtrW+HoxapPp4f0dixVnm7klIxJqnv6f9gQ6hZgH3Whvf46nukbzRCnqw3UzsqBVKvabWQitrjh8p2U8R53zwqiWnHg2ZrfLP1LL/AYiC5iXUSnpuRmyeQ7IS6DtcnsPkJEvvfnQXLnYg7Ni87sidh9ahC2L+VSirfQF0hXndhxUgeLYeg4EnWzfcaYu2cKCPh1nPktRFhKe1b7DQj0z8MsRmwyv9YNXsRSLQjSfatwWlfTkpAEfttG23BYDdGth2JJLRerdScnPlJQseKaQ7mIY2qBhgA55y3clwxkMxqnmSPZ3EppF/L/GdCgSWhgHHIfgpESeq1CPrnzSifcy9xseBddMU8ctyDxB3Q5F0wrWAvi3WxQYcDMwWboTmf3Yg5MIlu5h1MSU5b9Q9MItbYaJ1KUFDuToFm8VsShKttXDpDIEce8um3w1EIJ0QDw4agTmtvKZPV1O/+nMLeNPmIezmaTVp4GG3VRonf+aDJmABI4O9D42UziqjNTl3DWWQMkeqSo7wMDOT05KNwxbrIsN+jTBHQp0XA75qJ612NWPkw67o7CAauy+8yOndwJfntGzqhXFxNxtwL/3JFFsJd89bEr0/SkngcbLhGp/bQEqyNokOjGpFxfINy1+Stwo8mpEZ3FMPWJQ8u8ho=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(11063799006)(55112099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8+y5GvvF6tmCo8MrVJgjKIPO85WdAuxigCDV/PkgP0j66BdZKZgh7Jwq0ilw?=
 =?us-ascii?Q?kOZ2IDR5Ks4crH/T0jtxV22YreaXJXRKYB5d6pmNQ7qtTjjMWLmOS9mG8l9O?=
 =?us-ascii?Q?/29sENrdZt4DPbORuntbRJLQ1lSirmbvpuRTtAhcg+oCRJHYxgAoGRHZdes5?=
 =?us-ascii?Q?qMjF98QkMFPPn2pDYVDUi7huJH/ZnvH8GF6qnfh3pi7gCUzP/XUvyMUkzcqF?=
 =?us-ascii?Q?tArgXxHZly2L+9ms7YizQb9QouxtPrieIxmJh+cM2dGGmf2R19CEsZYPuKel?=
 =?us-ascii?Q?9ZWjH4467b61laMMVwiP5FN5lk/2hfBDqVfqgJwSplK3aNvWebUygf3Iujtq?=
 =?us-ascii?Q?sIGvlI9JIV0HU8KQ7N7cDV6hhSIEmh6TDeDxftdgQCzLq4HrZy4JqwTMpOPX?=
 =?us-ascii?Q?whVb1F2lc8k3fw5Mdr1pklpcksSV9SEgGP76XsZUsXeZ7xnp2hWwETqTLUlP?=
 =?us-ascii?Q?OABI2BwIDKTlEx7w1uMZyaYERXj1YbWvsPX8knWuDs7DpzglCu9THVT3EIPj?=
 =?us-ascii?Q?zXj6QHMYHlxFe2zLefn6G5yx5TV2dzMGZ82CDxEq6VCndqko3Ys0w99Docb5?=
 =?us-ascii?Q?lDnqQQINr55C2FjmRprYG2PafppwZ9pOHEuu1v+czGUh5ObKkFzUSlIpQN3p?=
 =?us-ascii?Q?m6tjdj/tXEU2x4hp+t/CEa3lc9UBxksukCnenMW+IDpsz8T8lAc5BxeQ3DbP?=
 =?us-ascii?Q?/FPKnMDcq3DrhjBA4vAro5f4aM5U4e+BZqgo18pHl8PpDDefxjVJGirWpoLa?=
 =?us-ascii?Q?UbPKLZyy+86BYUoMS9cRtthBG7y0skNrUxGpnrCxIt4kpDOvmCosOqUgMw9P?=
 =?us-ascii?Q?Y/BnwQkBlAVNHbmufNIhfi8QxCXS3cu41JW2UdMbuUoPrhETNLkjymflYNRu?=
 =?us-ascii?Q?d6JhcXPwZ8oPQSQXiZQtjKFcNKoi2PcXeepfPr//LubwIXzkEmEiWZ7DFdhp?=
 =?us-ascii?Q?4DTwz0VI1HStswiFKpetrU6NllgBJumPXvyfALU9RBhNdxc2lUX6Pi/PEJXo?=
 =?us-ascii?Q?EicNmOLAxGxI8H52Hm2/CvqscfHGhod13IE+g4AuVrZgC1anWfWpOQy1MYaq?=
 =?us-ascii?Q?ToTXKYJA5NfaYl0a/BpHevDj+xf+bMFGlOWq++nnPuEPc8Zzt5U097gCVZRw?=
 =?us-ascii?Q?Cv3XcnoyapEZBT/86qVbMbIIQ9PBMFIcsVPnK0El/RyVxsP+SUhJniHtTaw+?=
 =?us-ascii?Q?kxpkZo7GG48iO7EsEtBL2p6evGJ+ihqJRmxJIcC5bOaJQSTAOxs/G4tqJ6Gu?=
 =?us-ascii?Q?wBwOF+wn/ZRScbRO7GgqnKAJEU8opnI5UIFNCjy+sSHrU0wGtUtxnrIIKRiG?=
 =?us-ascii?Q?+q7onLF33aTeTuV1YdMCGLFY3IMfw0Gh+0iGwqzrwZUniWL89fHeRFMxh2tp?=
 =?us-ascii?Q?tu0LTyYFya22NlwmRA22bMpA/npoB5o7NRtGBja1uF7S2kMripNdH9/O/qLn?=
 =?us-ascii?Q?E82lU4Q9SjY6SxYD7t2J1JkQ/sLeUhlFFFToucwY/u/RlznDYmrRS4xoPLpO?=
 =?us-ascii?Q?sWr6F1sTP71jbB/2lu9qq4Rppg1ESnHbBCOcVD2SxHv1dcLA0am1Y/flSYV6?=
 =?us-ascii?Q?IzqNPrgaNpy2ohuXJY9H7+cKzVlexxEuEgQQolY7SVHjeI18BfivexxwxBRZ?=
 =?us-ascii?Q?sgpKn+kOQw/ACVoO/ggokJVDGebnIBg1bCm4YavIyChEMoLwljTMgogz2/Hq?=
 =?us-ascii?Q?R84NBOygz/O/d4/apq/sKWUm7OwJGF46h/ciSNIfwqeCJgxGIk92SXVtDemN?=
 =?us-ascii?Q?YSS+yToAk8fq5LCD3dIgSt0i1BbciT9lqY7r7QT3RTLSVCjmPUbL1arNO5CC?=
X-MS-Exchange-AntiSpam-MessageData-1: gCXjKRii7/VzLA==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c569368-a1f9-4f4d-02ab-08deed14199c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 01:52:52.2771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0APYYuz7sujc1OfJSCsK9khg0wHjzZgcbKAUQrds1chEduEDeHf6RMDhVQavaEbNMdUGjxUE2SdHbdK+lkyFjK3omfcFkf6i6CpK5dHEWDUHus7LFYPPoEejynRvybimmTRjW8zeeb47Zd7sbnoRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7550
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_185259_461683_E9CA3AE8 
X-CRM114-Status: GOOD (  12.42  )
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

When FPE is not supported by the driver, stmmac_fpe_init() prints a
warning but falls through into the pmac_enabled initialization, which
should only be reached on supported hardware. Add the missing return
to prevent this.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index 2f880c5e35b0..3436e962a238 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -174,8 +174,10 @@ void stmmac_fpe_init(struct stmmac_priv *priv)
 			  &stmmac_mmsv_ops);
 
 	if ((!priv->fpe_cfg.reg || !priv->hw->mac->fpe_map_preemption_class) &&
-	    priv->dma_cap.fpesel)
+	    priv->dma_cap.fpesel) {
 		dev_info(priv->device, "FPE is not supported by driver.\n");
+		return;
+	}
 
 	/* The preemptive MAC in DWMAC is always enabled, so initialize
 	 * pmac_enabled to true to reflect the hardware state.
-- 
2.43.7


