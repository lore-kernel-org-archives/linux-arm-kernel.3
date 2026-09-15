Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5E9C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 21:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66ubbzJl4c69XQqqRt/gtfVFfPDfN4J8QJ7sR4DjUog=; b=fc0sMf3fm1O9qXhRbcFTdVLYAh
	pmdM2/9/X0jCmQOi/EzWl0zKrCdEAtFwe+H3GbPo5zaCjnYVq5fcJDc77T+UYuLOG63D6+9mVstGl
	ri9CYa0I7Bav+AjamRkwUq3Hmf2OR+tjTDtWlQpw1lJSAPldRQ7wAflKgNIwl//sMgig0BKUP0pty
	Z4vj/RXaZBBfXzQP9sbHyujsLQK/tK9hNzhbGjw1Zl/aJL+t6xtEvCvy3sWfT6rEX8cwlfCAvAAkm
	amltmSH4HDkDxbXNOB+kekxFSxlfKD8xuXi+pqbZYQ/KJGrj81YApGdvvU++vZpsNCogXAtQ4gSEX
	PBFd/22w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6b5h-00000007zBn-2uHp;
	Tue, 15 Sep 2026 21:53:25 +0000
Received: from mail-southcentralusazon11021126.outbound.protection.outlook.com ([40.93.194.126] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6b5f-00000007zBM-2lIm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 21:53:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=heFwRz+k+iIjchJ0nRBZTBVyOBeAsaYAnMTu+8cfPyB+SYjajDj6lP52qVFdE/CTzYkzxY641EGqZweZyd+k/0URmE18hEhlVOacPzviLoc72Kf85Y9BqyhKrhA39eGAQN9OPNHp+nccZWBvSqeRGoRm5/SfIShjrNhRMYNni5mEtg3NvdYwLqSM2RFtGOxsWmMwAjFKuOCmxYbl6IYjk9B8gGGeMdxTNQgf0K+1rzEimXR38fwI/rfqHwJ4dnuJvzJO6DxetBv2qHTNSo3Hr7cFKnFbd9YCmr5MRU4MQ2AsThliNtJrnp/PbRzGXXIAs9a9ovKpivFncwm5DhUJEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66ubbzJl4c69XQqqRt/gtfVFfPDfN4J8QJ7sR4DjUog=;
 b=vn9BZyHC7/mrBbuI+2sj26NL+FXiLIcmk+QBWy1h1mESZ+U3HDLu+mj1XD9C+bJ9PSQY94VcT088j6UXoXZ/LgVEXisDVeRY8sVRy3YmeUf+3B/ADRwISKmUku4rwN7bxE1Rfs1YWevwAkAJZox6/RTiN/GgcvKsuSq9PzhRSJQDtG1O49skWnSQCxFSusCx6K68/7aNsr0+ujMBUymE33w+WaxOns64NiAZC9vZyJ+Cl18+m/9qgz0fuqIquo0Ypn0F8TdUbNE0Wpmcyv2+wEmYHKMtKvjmppO/zTIc3zpXcv++OPtR17DojxaRiRtiImp3uQ1wxDIce7ljGEyNAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66ubbzJl4c69XQqqRt/gtfVFfPDfN4J8QJ7sR4DjUog=;
 b=FiZRzkUcm4kA1TrsSRRbPqz5k5qYnTatt7OAmGlRZrTGErqeetu9qDvdRaVCE/7DvrA27usy/qhUV95h5yYS9ZpI+POx/7/RkJ8q0Qv0hYjzY3AQH8D1VmRhi/Tf57o0xusw6btgTO7WNi9nZy/TKzDE/Mdr2i4d9OXITHdFuQU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MN2PR01MB5615.prod.exchangelabs.com (2603:10b6:208:11c::29) by
 CH3PR01MB8315.prod.exchangelabs.com (2603:10b6:610:173::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.11; Tue, 15 Sep 2026 21:53:06 +0000
Received: from MN2PR01MB5615.prod.exchangelabs.com
 ([fe80::996f:e4f2:dbd8:120e]) by MN2PR01MB5615.prod.exchangelabs.com
 ([fe80::996f:e4f2:dbd8:120e%6]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 21:53:06 +0000
Date: Tue, 15 Sep 2026 14:53:02 -0700 (PDT)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Robin Murphy <robin.murphy@arm.com>
cc: will@kernel.org, mark.rutland@arm.com, ilkka@os.amperecomputing.com, 
    leo.yan@arm.com, linux-perf-users@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] perf/arm-cmn: Fix multi-filter encoding
In-Reply-To: <03f15158e4c0a036f41cb4ab34c138a265c0730c.1789408253.git.robin.murphy@arm.com>
Message-ID: <8ff2b533-ed68-753e-170d-a49488484516@os.amperecomputing.com>
References: <03f15158e4c0a036f41cb4ab34c138a265c0730c.1789408253.git.robin.murphy@arm.com>
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: MW4PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:303:b6::32) To MN2PR01MB5615.prod.exchangelabs.com
 (2603:10b6:208:11c::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR01MB5615:EE_|CH3PR01MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c9287d3-e0b3-48af-e477-08df1373b925
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|18002099003|22082099003|55112099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: jBNglqFNLc4Grq1axvgTNsBdhwrPbnGjjgXfrkseMPpCVoav8BInUZmwDzN/J0+uZyHjkgke1Tj16HkMdHGPa9fBdW/LdS3VxKW2Nh1HzpsFOmcl91K0H4hBkwgwf4uk3qS2kCPPiJvzX5NN5FhHU6Ee1QeM23zYfjV0tbd6PVYYrrnCRFMt0/EBheaZ2sgBQVNtbXcLbTZGKYxCTVM0vlI2UfR6Mez9M1SPS+LBE6kdaJ29moVtZW84NJULz1FK05+2HaOXQaEX2pMhHJpf+d8KYcxF/IUWclPhKHzylG86lavKBceM+TAJ4JSRfpMrMf+mx0IOBEKmK5/mJKVH9ZQODZfvBi++RIivYtHz1aWRh6Qt7bXRZ5hjghvdZoCG6x31syoZeeANRX/BjdxPttqKiPaQTGe1nprcwclCtdecDW6pIEvJzPJcoxVpj5jQleLvQzK+CnRQUWMfG5Vuu8BMoDtRafSkdIQ0ulPC/G5nHPBEhrZNYo22zjJTfETu1VsoLBrnfDV8fyMBs7hVCQBHpLSc6a2bNFHMCYIRj88RKaL4a+494bPZzkPVZdvXrlQLV7C/A8EghDp1M4ZVE/YENUPKU8GUiZOXZLj3NnIIFRl0d32ievtff/h4ZhOQlKjOdxpCAhIRV04Wk9lL4PkmE+MhITChsFm6MiheA0M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR01MB5615.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(18002099003)(22082099003)(55112099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ngQCKq+d5tMIGmkEhtcQahRrDdTbMll0YLDPKtLYngY3zteh/eQPnuPiXmn3?=
 =?us-ascii?Q?L56YsZEVZ74/zjjU2N+jAO6+6KgoipTYGg0XmwLowy3TU+/Xfa5VS8d8tGC9?=
 =?us-ascii?Q?pTU66eVZRG0o2tVef8CIz7mXt9b3qK/jzC2xea3UhGoJ3hzW708kJA68hu6V?=
 =?us-ascii?Q?S2zZn1ltqm+zFNiKs3ITp8Ba23MGcHohU3XN2qNhfcZpz5IFWvtVxs5nhiVu?=
 =?us-ascii?Q?3LZvt4OMEpyNR38vwBxLw43jJRdSULem3r8pxa9PZmK1GL/ejXoS17L/3w2X?=
 =?us-ascii?Q?AItG2p89A9RbyLvgrewz13UheqEQwj/SXKOBbGp30/IXva10pRIRC5/je6sT?=
 =?us-ascii?Q?ASZpSwjXXBGyCAdWZjBPwTNk9mKmc0TeWlPeqqTyWNeT2zNBifOadS7MD4NS?=
 =?us-ascii?Q?/zu8k7OewcjfV6/e2AuPjBBU4n+G0nTMVFJL9QSjg9CQnil1g3oYapOeaKkl?=
 =?us-ascii?Q?uuJ13n2y02HBsMu2LpwNhBD3FeapDr4Pp1KtIgI6vZH8bIwxM+imWeLAlHeI?=
 =?us-ascii?Q?njCO75qeJJu74tnP4gn+kaaLvYdZXHPyds7wV/VOKw4f5XpJCqeUFlVCVff5?=
 =?us-ascii?Q?lS2B4YqizOr50tckEEE1mx4MTMXp3rIAO7RnOcwDrBnl0YzwDoj5ibcaJ3og?=
 =?us-ascii?Q?/tllL9rf9gSiFsFXvFEIvthltGSS4tECLAmqihzqXyKxbHGj7QmDDfcJtZe9?=
 =?us-ascii?Q?4HICwYNtzAPfLiLPnVYdYlltjzY2NdIlJayKu/fEew5sTB2ex3H29JJffdQZ?=
 =?us-ascii?Q?JoDTRh14ChKPdMOeaIr7AJ8Cn/NGXiHVAfwgl3aqTANS0Oq5dcGBxjcAE9/e?=
 =?us-ascii?Q?hOCceLiKBLjuoN5ltbTop2CxQ9tV5YyOWz0WzO8pfm0cyBsmJd6FLiQ56GgS?=
 =?us-ascii?Q?pkwX+ey5vMl4cTbTQqB5wD4tXf5SCpbuYjsJxb458SnnmbrCpqLKmHUNcBlM?=
 =?us-ascii?Q?vg0DD9aLSUswSjcoQIrC5D6TECZaH2zL/nJqQaABF/0dVRZOqw2q3pgPrNtV?=
 =?us-ascii?Q?Hq5SdRvLwMgBYkL6b9FBvm0knMAIfWy3j6n/kgO7IvTvdAqcNQ/1pifKjYBH?=
 =?us-ascii?Q?8WOS8iL7emjpnvleE+0RQWkPy26NmA5P/ZKAp2/6jYc2MyWjIUxmsapTvxSU?=
 =?us-ascii?Q?kkqQ3ZOFIz/Yu8/2hlO0Mo1YAWBUfw/o/112eGoo46ZTevXZdvzNXBL2hEGo?=
 =?us-ascii?Q?rR9Xu+woYXRBg47IVBkNCoGm4Rkiy9S0s/+e7w7QdLANcortbh3tHiAdwZ5e?=
 =?us-ascii?Q?W9/aupVvpGhFeE88VDU49T6aVgIcUVgiDsRa830FOs4vJBV0bfoIUXYB7E2d?=
 =?us-ascii?Q?9CYbWzSR/cOT4+FIFEQcR8hh2BSfPxxe3wm62xoOCykQsa1K0ycx0VVhB702?=
 =?us-ascii?Q?XaY1uN39DTFGECtxt+VIfGDrda5Fxp0mCpl2mrtvSM5tsjJSaC214MiknUsY?=
 =?us-ascii?Q?SvAre9tISdEx0M15Qs9Pb17PCH0fxfS3CNIyApp9lTnwGbmhcTGyO91ZNniC?=
 =?us-ascii?Q?SyXZTNPYRaQH7QQA6qINY+g3E5HkjSdXMErWFNcp6C8cuh+qSWanlUjQsZ/7?=
 =?us-ascii?Q?ABrdTMNKLjBvcG09Y+Gr68R3eBdppKrANk4TwQmgmZ/EgfKJedQvbyNe0CGi?=
 =?us-ascii?Q?yBWzqmD5C8BW33oavwCva18fq16Xz7MINp/MYs+XGXMDcq/U8ykLsEzNJyVC?=
 =?us-ascii?Q?MkSD8msqR2GUlFzR/tSWvPCw3Q979iSHEv95TsKIumCddPGV9OiCfcWycmsR?=
 =?us-ascii?Q?dKw1ean5rbosgNVKdNEr2BhN+AMcQ+g=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9287d3-e0b3-48af-e477-08df1373b925
X-MS-Exchange-CrossTenant-AuthSource: MN2PR01MB5615.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 21:53:06.0742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LNFQVZDWreO7AsF8Z2irVSyDNsSqWB2N8wu5tKuWvtDuFo+7ubAKPRPXEBuirvCmK7XjKtFJuzgGH/405QjhsuXCtyERHmnMbD4ZMNCmqg+4ck5q/yTIvTxqIYVXv4r4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR01MB8315
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_145323_712235_C64AB0EE 
X-CRM114-Status: GOOD (  22.34  )
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



On Mon, 14 Sep 2026, Robin Murphy wrote:
> The current special-case for EVICT_STATE_SEL filtering effectively
> assigns the "filter" and "filter2" controls in the opposite order from
> how the CMN S3 r2 TRM states "Filtering is programmed in pmu_hbt_lbt_sel
> and pmu_evict_state_sel". On reflection, not only does this seem
> unnecessarily non-obvious to users, but it's also likely to be a problem
> for scaling to a full multi-filter abstraction in future. There is a
> logical order to filters based on their bitfield positions in the
> pmu_event_sel register, which the TRM descriptions allude to, and the
> cmn_filter_select enum already (almost) follows, so let's fix the UABI
> to follow suit while it's still unreleased.
>
> Fixes: 09178f536bb9 ("perf/arm-cmn: Plumb in new filter types")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Looks reasonable,

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>

> ---
> drivers/perf/arm-cmn.c | 54 ++++++++++++++++++++++++------------------
> 1 file changed, 31 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> index b162de3d9d16..6464b815bd3b 100644
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
> @@ -305,9 +305,9 @@ enum cmn_filter_select {
> 	SEL_NONE,
> 	SEL_OCCUP1_ID,
> 	SEL_CLASS_OCCUP_ID,
> -	SEL_CBUSY_SNTHROTTLE_SEL,
> 	SEL_HBT_LBT_SEL,
> 	SEL_SN_HOME_SEL,
> +	SEL_CBUSY_SNTHROTTLE_SEL,
> 	SEL_SNP_VC_SEL,
> 	SEL_ENHANCED_HBT_LBT_SEL,
> 	SEL_EVICT_STATE_SEL,
> @@ -978,10 +978,14 @@ static umode_t arm_cmn_event_attr_is_visible(struct kobject *kobj,
> 	_CMN_EVENT_HNS(_model, _name##_all, _event, _sel, 0),		\
> 	_CMN_EVENT_HNS(_model, _name##_hbt, _event, _sel, 1),		\
> 	_CMN_EVENT_HNS(_model, _name##_lbt, _event, _sel, 2)
> -#define _CMN_EVENT_HNS_HBT2(_model, _name, _event, _fsel1, f1)		\
> -	_CMN_EVENT_HNS(_model, _name##_all, _event, _fsel1, f1, SEL_HBT_LBT_SEL, 0), \
> -	_CMN_EVENT_HNS(_model, _name##_hbt, _event, _fsel1, f1, SEL_HBT_LBT_SEL, 1), \
> -	_CMN_EVENT_HNS(_model, _name##_lbt, _event, _fsel1, f1, SEL_HBT_LBT_SEL, 2)
> +#define _CMN_EVENT_HNS_EVICT(_model, _name, _event, _fsel1, f1)			\
> +	_CMN_EVENT_HNS(_model, _name##_all, _event, _fsel1, f1, SEL_EVICT_STATE_SEL, 0), \
> +	_CMN_EVENT_HNS(_model, _name##_eu, _event, _fsel1, f1, SEL_EVICT_STATE_SEL, 1), \
> +	_CMN_EVENT_HNS(_model, _name##_en, _event, _fsel1, f1, SEL_EVICT_STATE_SEL, 2), \
> +	_CMN_EVENT_HNS(_model, _name##_su, _event, _fsel1, f1, SEL_EVICT_STATE_SEL, 3), \
> +	_CMN_EVENT_HNS(_model, _name##_sn, _event, _fsel1, f1, SEL_EVICT_STATE_SEL, 4), \
> +	_CMN_EVENT_HNS(_model, _name##_mu, _event, _fsel1, f1, SEL_EVICT_STATE_SEL, 5), \
> +	_CMN_EVENT_HNS(_model, _name##_mn, _event, _fsel1, f1, SEL_EVICT_STATE_SEL, 6)
>
> #define CMN_EVENT_HNS_OCC(_model, _name, _event)			\
> 	CMN_EVENT_HN_OCC(_model, hns_##_name, CMN_TYPE_HNS, _event),	\
> @@ -1014,13 +1018,9 @@ static umode_t arm_cmn_event_attr_is_visible(struct kobject *kobj,
> 	_CMN_EVENT_HNS(CMNS3R2, _name##_ccglcn, _event, SEL_ENHANCED_HBT_LBT_SEL, 5), \
> 	_CMN_EVENT_HNS(CMNS3R2, _name##_ccgrn, _event, SEL_ENHANCED_HBT_LBT_SEL, 6)
> #define CMN_EVENT_HNS_EVICT(_model, _name, _event)			\
> -	_CMN_EVENT_HNS_HBT2(_model, _name##_all, _event, SEL_EVICT_STATE_SEL, 0), \
> -	_CMN_EVENT_HNS_HBT2(_model, _name##_eu, _event, SEL_EVICT_STATE_SEL, 1), \
> -	_CMN_EVENT_HNS_HBT2(_model, _name##_en, _event, SEL_EVICT_STATE_SEL, 2), \
> -	_CMN_EVENT_HNS_HBT2(_model, _name##_su, _event, SEL_EVICT_STATE_SEL, 3), \
> -	_CMN_EVENT_HNS_HBT2(_model, _name##_sn, _event, SEL_EVICT_STATE_SEL, 4), \
> -	_CMN_EVENT_HNS_HBT2(_model, _name##_mu, _event, SEL_EVICT_STATE_SEL, 5), \
> -	_CMN_EVENT_HNS_HBT2(_model, _name##_mn, _event, SEL_EVICT_STATE_SEL, 6)
> +	_CMN_EVENT_HNS_EVICT(_model, _name##_all, _event, SEL_HBT_LBT_SEL, 0), \
> +	_CMN_EVENT_HNS_EVICT(_model, _name##_hbt, _event, SEL_HBT_LBT_SEL, 1), \
> +	_CMN_EVENT_HNS_EVICT(_model, _name##_lbt, _event, SEL_HBT_LBT_SEL, 2)
>
> #define CMN_EVENT_HNSR0_HBT(_name, _event)				\
> 	_CMN_EVENT_HNS_HBT(CMN700 | CMNS3R01, _name, _event, SEL_HBT_LBT_SEL)
> @@ -1856,10 +1856,12 @@ static void arm_cmn_val_add_event(struct arm_cmn *cmn, struct arm_cmn_val *val,
>
> 		val->dtm_count[dtm]++;
>
> +		if (sel == SEL_EVICT_STATE_SEL) {
> +			val->filter[dtm][sel] = CMN_EVENT_FILTER2(event) + 1;
> +			sel = SEL_HBT_LBT_SEL;
> +		}
> 		if (sel)
> 			val->filter[dtm][sel] = CMN_EVENT_FILTER(event) + 1;
> -		if (sel == SEL_EVICT_STATE_SEL)
> -			val->filter[dtm][SEL_HBT_LBT_SEL] = CMN_EVENT_FILTER2(event) + 1;
>
> 		if (type != CMN_TYPE_WP)
> 			continue;
> @@ -1910,14 +1912,17 @@ static int arm_cmn_validate_group(struct arm_cmn *cmn, struct perf_event *event)
> 		if (val->dtm_count[dtm] == CMN_DTM_NUM_COUNTERS)
> 			goto done;
>
> +		if (sel == SEL_EVICT_STATE_SEL) {
> +			if (val->filter[dtm][sel] &&
> +			    val->filter[dtm][sel] != CMN_EVENT_FILTER2(event) + 1)
> +				goto done;
> +			sel = SEL_HBT_LBT_SEL;
> +		}
> +
> 		if (sel && val->filter[dtm][sel] &&
> 		    val->filter[dtm][sel] != CMN_EVENT_FILTER(event) + 1)
> 			goto done;
>
> -		if (sel == SEL_EVICT_STATE_SEL && val->filter[dtm][SEL_HBT_LBT_SEL] &&
> -		    val->filter[dtm][SEL_HBT_LBT_SEL] != CMN_EVENT_FILTER2(event) + 1)
> -			goto done;
> -
> 		if (type != CMN_TYPE_WP)
> 			continue;
>
> @@ -2077,16 +2082,19 @@ static void arm_cmn_event_clear(struct arm_cmn *cmn, struct perf_event *event,
> static int arm_cmn_set_event_filter(struct arm_cmn_node *dn, struct perf_event *event)
> {
> 	enum cmn_filter_select fsel = to_cmn_hw(event)->filter_sel;
> +	bool evict_state = fsel == SEL_EVICT_STATE_SEL;
> 	int ret = 0;
>
> +	if (evict_state) {
> +		ret = arm_cmn_set_event_sel_hi(dn, fsel, CMN_EVENT_FILTER2(event));
> +		fsel = SEL_HBT_LBT_SEL;
> +	}
> 	if (fsel)
> 		ret = arm_cmn_set_event_sel_hi(dn, fsel, CMN_EVENT_FILTER(event));
>
> -	if (fsel == SEL_EVICT_STATE_SEL && !ret) {
> -		ret = arm_cmn_set_event_sel_hi(dn, SEL_HBT_LBT_SEL, CMN_EVENT_FILTER2(event));
> -		if (ret)
> -			dn->filter[fsel].count--;
> -	}
> +	if (ret && evict_state)
> +		dn->filter[SEL_EVICT_STATE_SEL].count--;
> +
> 	return ret;
> }
>
> -- 
> 2.54.0.dirty
>
>

