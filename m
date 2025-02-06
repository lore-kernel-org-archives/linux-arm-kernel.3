Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA058C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 22:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSMIqyO7jPzRiaCUYwLv11VSPRxRIhRCwYKl+AeVMXo=; b=ZGUsnRyfLsgNO854XUJX670v6H
	03OjxCGlxkFPgFH4xsHfH9gNJx66FrlK1FcGcqlbuBZ5l1HubiiOBjTfKHxABAd1N3J8AEROL2Py3
	E6zFBDJFi49UYe7gPIDFMspSezhbfatwlAx+jprnWqIz/MCw6OoXToZTBOSdsNVTb1IjZ9ShYwAt/
	m96fVCpufohRUgb7DGYFgSAE2+MEauF6W51PTGVhxVAd7p3fawcj89zYNF88Q82kH0l1tpC38RoL3
	XoRVwGP5KqpqDQEbmS+0H2paizttvyYvMP8v5E/BbBp5FETePVx8Iq++5jr6V87UKpfH4hxv6g5Rd
	84YdO0ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg9x9-00000007dhY-0mmN;
	Thu, 06 Feb 2025 22:02:31 +0000
Received: from mail-westcentralusazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c112::] helo=CY4PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg9vi-00000007dde-1M6y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 22:01:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kov3p7yxbyn51qyST0m4/A6PCXvlRAXjupHrbqgwF58SXrv9ouqlAwIZfBabJUqslN5qBl1NUB74oXRX+Xl19rys6ysQKd+PSLfr6wURPFZf7h6G0ZzXrSJdqkQqmCT91VUF5Eo8UpZFBwzQrNJOIGvtROOx8rKtun5H5JbX6gHrtX3iivQoSFj8jgq7pmg7twnjOYwSd1SiazU+WKHoq2Hr4PBGT2UcRjv8wRprYuxu5a9EQZlCM/FyeCgjByBrH0dTxRQ83GjTSHS5qWiyr4jLwprza60/94Fm5PTfuuUk3KlhA3ZKhxu3lOGI6LLgke577NrvucGsHPM3rCGdoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSMIqyO7jPzRiaCUYwLv11VSPRxRIhRCwYKl+AeVMXo=;
 b=yrQocGdnWxzdDguIdaMLgLX2GlRZeSoQw1ZJjSm1BTAc8+cBQ41XZp51XPzO0ebRgu2vfyGJBbt3GbI4qK2zFoJrQrxuxV2cvQBSVXE7jNA7wArn81CNHcF4Kk6BcqZEmclpm71G06HKILJhlnR/faeLLZeGryEevLV5s35qrZ2qpKeFmFp4rnHwfDHB8FTbMIxlpWxjtvqSAmN5VOtoFtDRFKtp1xpwnTOHi9XO3CPCv7scf8qwNO4eaBELiWWpFG5yVpIpHR5vuIdp1XqhN4Yl0wv/Ovdt/hnwxGxJBr+l5DlrYvcuLiiLgIyvdxjOaW+I7OMbRifNw0faRvgAZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSMIqyO7jPzRiaCUYwLv11VSPRxRIhRCwYKl+AeVMXo=;
 b=NPNsUyuH3TgMyYK9nKwIMPAbz+kv3lj4+I7l9m9EMSCqHh4hkItW1X7KqfhFAT8QLZ0RTs9rF7T1z4DpcOoYTOythxjN+zK7VpgVDr3QAzUJkueI6T+r7b3ougA1Ud/LKRk/wwPduIA80wMi8iZi1u3xIuaIyO1d6q9gTSd2lkk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 SA6PR01MB8760.prod.exchangelabs.com (2603:10b6:806:40a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.11; Thu, 6 Feb 2025 22:00:51 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 22:00:50 +0000
Date: Thu, 6 Feb 2025 14:00:37 -0800 (PST)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Robin Murphy <robin.murphy@arm.com>
cc: will@kernel.org, mark.rutland@arm.com, 
    linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
    ilkka@os.amperecomputing.com
Subject: Re: [PATCH] perf/arm-cmn: Minor event type housekeeping
In-Reply-To: <ef46a47fc4ab909093f14b2b4289a4835836ab6c.1738851844.git.robin.murphy@arm.com>
Message-ID: <60ad53bb-5672-b2f6-ed25-6f1e748de151@os.amperecomputing.com>
References: <ef46a47fc4ab909093f14b2b4289a4835836ab6c.1738851844.git.robin.murphy@arm.com>
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: SN1PR12CA0061.namprd12.prod.outlook.com
 (2603:10b6:802:20::32) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|SA6PR01MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f9e211f-ca54-4499-cdac-08dd46f9b823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0/gD2bGVHpCB+Fu3qehuycmO1NXR+HsCw6a+TjvF5g6kZtjAgelhx93JZdUa?=
 =?us-ascii?Q?r4RDCyTcRPjm2p4tJvpOjsEFa8PgID70B0MckjPXtmOGD4EH0nAExwfEFfOe?=
 =?us-ascii?Q?hVaGrZCGuPOGyY45k1sT0fJ04JsTwcP/2Xv66YGE4jji1cfv2WDO1tlNGIEn?=
 =?us-ascii?Q?/T+2XTPIguSEGknOO8355449HwpsG8JMEml3CfzrOYFYeso/9CVOxzkhvtU+?=
 =?us-ascii?Q?qZEewuLKYjTKtVluZTFpwBB8nO+5VsSHSfmDYQ0uRw/O5G7ILjlhu3TMtwip?=
 =?us-ascii?Q?vjOrE35fxdkkpX2SrVizvxvX6IFyp5I7oMzQB8b9GV/sAQAvP9fhxpwM/cha?=
 =?us-ascii?Q?Hyah3Z2K2RtEgR51h4aCH9eIuuSCxtJtcZT+lZGQ74coZp5r+63ecNVRiQ99?=
 =?us-ascii?Q?P+qvqfYIbIzOoq2LGvtnXuBMW/3bzla4Me2vgMKAwev+4kRZAMHIF/GFLmOe?=
 =?us-ascii?Q?pBC16WARBDsrs+9C3v+1PGpDQPM/plprAH8omRFoVVGyU7wMCBBq2woQM4zq?=
 =?us-ascii?Q?2NPlkCO4aft2Al4FxuqRVERoxQiR/SyaW39E/GHv8wFCizS6tlsffu2MjEvw?=
 =?us-ascii?Q?LaYFo7se78hxlugkv0EGBN1EOMYsBe9E96B1mojf2g5jI9Y3bKqU/NMJzY0P?=
 =?us-ascii?Q?hcFuysdaln641K7wr1UeriH3OtN9Puj7vTfnUIx9nXcE/ZvXBu6Opmj3VH4Z?=
 =?us-ascii?Q?j4rpPZidipq5oJDmC1SdGM0tvoxkv9X3hxVqWPSn0E4jpZIhNEuHgj0VhgCf?=
 =?us-ascii?Q?leNSNj8Wyphygk9A7ZuYcFL6tq9plHZQX0kqPolr+Oe+3EXVpO6SnqurVs/c?=
 =?us-ascii?Q?hwSkJaJkyNH73t9KzF1LOedO46gqMgSvReDSehc3uky+q28w0qhQjw13mkjj?=
 =?us-ascii?Q?uu8y+z8pMtjPFXojcK1WhS+2iYGAHvx8GGYLWE06BZ7DT/umn4fXIx9Hp5+X?=
 =?us-ascii?Q?Pc7JCxCzDSMOrB4fNnAgVcoVloAbDHSdSuOhyQabMRagfc0Q4IlSf2b5IIZC?=
 =?us-ascii?Q?kG612N4pfYWnyGq6zletXHC0sD6ryDb0CAonmTXcpsLRtKXJ5hiilunR3qFt?=
 =?us-ascii?Q?N5MUbDFcWvYAtDfPJYAWrnalkJLeZbzVKzi4JSUHCyh7b2uRf55GBKoHi5vD?=
 =?us-ascii?Q?HMAJoW0j8oIJ7uEP6m7bl5wL1HNcPKXUaQYVmaOUktto3DEVDA7v0fP6ItOV?=
 =?us-ascii?Q?1rsg8bkjx2hfRN7HFYhOYqozym++Kmjgt+8OQp0xcwQlSG2VAr/AdONtn3WU?=
 =?us-ascii?Q?7SeeG6M2F3JH+bg8rD6Lzz3P8mvrIoMZfHEjpn9LICvA6RqJXBHE3zt0JVHr?=
 =?us-ascii?Q?eTkXNKb3IO5Rv1vRe5cgy9fUIkm+6DCytDDwTdcu4FRlJSfGWV9gcKmzLvZs?=
 =?us-ascii?Q?od8sTZPBUEfwpu31fiTfqf0Hg5rI12Hf3lIK4m7LsVJg/VO+nLsGoIWghZaB?=
 =?us-ascii?Q?UH1VgqjdLr3OLfj/ve6M97HIVIwhjQl3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P43kLNud2uIgedjVOSU/WDbnp4r2Zv6glDBdGFqOr3V/P4DGgcX9w6nFipoR?=
 =?us-ascii?Q?xyWiTzeDPi1P6jNTuuOroY5pyCn0PRWMy2PbJ2udCHS3IyeCQH8U69x1k8hv?=
 =?us-ascii?Q?rS8A64Sbo4HzZus8TqbpF8dITErLnbJBoi58bt8+G16dYfhrwxOEV71I2mov?=
 =?us-ascii?Q?WQirCL4ZugN1frcoUAjziafsYk9DooxMpj81Fmf1iyCfl4JQYXho45jVLJfU?=
 =?us-ascii?Q?QpwU1k9Uv5L1k6/qs6X4Fh+TTW8dBKOgtbxSIpEpCmLQF7WmP7w3mtiX0Mwo?=
 =?us-ascii?Q?k5lzC8BsL1OI9Giti+K6C1TIdVPfnwwtSB1aJT+DFHOjmAdKmua5T0gZSSTR?=
 =?us-ascii?Q?t3tYlXyGNduXfDo4rvHDY87DH1A0BH3AkN0TLA+T5gvXtZh+X1VLsxPsN+TP?=
 =?us-ascii?Q?hJcvAyzj9jQx77logT+ZiauUTjPtsFTR5lyYzryNBS49ytNsW2cOinDPXtUu?=
 =?us-ascii?Q?NiW3V3X+eWXHjKdiqaDG8LtAI8/LiC7aQZ9fZVAsPSGO6xTwb5R4rXAL1nIp?=
 =?us-ascii?Q?3dOhscM/PeTdICkQR1XaRJjrclUJF38Fr2LFKOtOL5fiqZMh68yQRC1nzyH7?=
 =?us-ascii?Q?SsXKjt8FvY/6iIM6zl57Cl+6VJOXf8/a0hfufO1CvmOh98/xajIJlk6/Ysa4?=
 =?us-ascii?Q?2Nj7QhlPiZIVKZaKv4U+ZJZGxzkAZmySAV/oUnA6ZDlANrrLJWfQzhkKwpqD?=
 =?us-ascii?Q?wvTcqksZe4BRIhmorNrwxQVY8n0ID4xxjH++XCTK/hbpSY/dpIXqI7bLlu5k?=
 =?us-ascii?Q?GIn4M4ttuZX5sl+VDh/1NrdpQMbPNgtAKbBmgJGuTq+brPX58tXpMN2RzM2o?=
 =?us-ascii?Q?mclqzTOh2/D9fXAd3KbfE8Kkg+6LGjGRfT40D3bsP55mc90IJwY6x0Dxb9yM?=
 =?us-ascii?Q?/qogk4+oiUS98ge/ySNAlEWRFuh/7kZY1SrTYrLkdby/xKIqZAYT6wRvpnif?=
 =?us-ascii?Q?YlwSM7WrXw7q4gIig5aB8wYpqVwMxZ2F91GHPBpKwIuQ+MXZKSQ8/WaAcHl2?=
 =?us-ascii?Q?CdzvvsxPpFMRSFeUyU1TEQBO48bIqG7T0vZ+S4DKCNrwtsxOYrvBxa79DnFT?=
 =?us-ascii?Q?/ZvjactqIY7oSAo9CF5L78UYHgVpVvTcXjghnec6pGSfOYOlmLmQRUpNeCpX?=
 =?us-ascii?Q?YzlW/wYriSnyQzk0XbWxILIEiVDAvwFEqXR3apfqfrNMJX8PycF4XDrcqfWG?=
 =?us-ascii?Q?lqmABGhKO0LR/6m4n0t2z1PmJCpdsQqlO8ogDBwWFzfk90KP2brnNmqj/EZ1?=
 =?us-ascii?Q?BcZIQ/r4ogK/TnQ3i0K1hHkHR5wtzBIEO8TtdH8So6pSlezYD1VvcFfqHKJW?=
 =?us-ascii?Q?v8kod7mj+prIdyvXtdSoRl3rDRhjZWmwsjtdVaXpPUa0lhNdyGynfvn4tNDQ?=
 =?us-ascii?Q?/JR+WnXjXWSGHhSw1KnyHNza6zDLI25aZUwBkbQ+/5Zgl9MVBNytvkbPX7y/?=
 =?us-ascii?Q?34GhwGDEfpMkRUxdbTBC1sdQtgH3/pPN/OksLTQ3bH3VKLZwDW/aggZQoxOP?=
 =?us-ascii?Q?F09Hr1Ut1cqEkWDc7GYTKVSI5Xdyg+eB6i4ZDCLfXLdN3BbyB7ooDTf0J7VN?=
 =?us-ascii?Q?M8Ov3QKRURGl6Tiw1CGJhC+nfAph07nVYiM59Vb/Eemx7uC9iIj34mj++kFV?=
 =?us-ascii?Q?zB2oaC3CkXm+TuGZAtQ+PAw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9e211f-ca54-4499-cdac-08dd46f9b823
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 22:00:50.7936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ipr9t9Wjb5u6izVGjOqagnQcVJutYLNxYEIj422pGgaRGRxLXta8gw4dPkzm+bRgQElSWT6DJCJ5sIOeh9dF6znzjvSGa79yv3/XxkGaaqCcCe7Jdh2/k5lrwJlD2Qt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR01MB8760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_140102_376835_96038C07 
X-CRM114-Status: GOOD (  20.09  )
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



On Thu, 6 Feb 2025, Robin Murphy wrote:

> While handling RN-D nodes under the functionally-identical RN-I type
> works fine for perf tool users using the "rnid_" event aliases, and that
> is the documented and expected ABI, there's little reason not to be
> permissive and accept the actual RN-D type as an additional encoding for
> the same events as well. This may be convenient for other tooling
> generating event configs directly from its own topology data.
>
> In the RN-I event mood, it also seems as good a time as any to clean up
> a forgotten macro for CCLA_RNI events which ended up being unnecessary.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>


Looks good to me.

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>

> ---
> drivers/perf/arm-cmn.c | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> index ef959e66db7c..d4fe30ff225b 100644
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
> @@ -802,8 +802,6 @@ static umode_t arm_cmn_event_attr_is_visible(struct kobject *kobj,
> 	CMN_EVENT_ATTR(_model, ccha_##_name, CMN_TYPE_CCHA, _event)
> #define CMN_EVENT_CCLA(_name, _event)				\
> 	CMN_EVENT_ATTR(CMN_ANY, ccla_##_name, CMN_TYPE_CCLA, _event)
> -#define CMN_EVENT_CCLA_RNI(_name, _event)				\
> -	CMN_EVENT_ATTR(CMN_ANY, ccla_rni_##_name, CMN_TYPE_CCLA_RNI, _event)
> #define CMN_EVENT_HNS(_name, _event)				\
> 	CMN_EVENT_ATTR(CMN_ANY, hns_##_name, CMN_TYPE_HNS, _event)
>
> @@ -1798,6 +1796,9 @@ static int arm_cmn_event_init(struct perf_event *event)
> 	} else if (type == CMN_TYPE_XP &&
> 		   (cmn->part == PART_CMN700 || cmn->part == PART_CMN_S3)) {
> 		hw->wide_sel = true;
> +	} else if (type == CMN_TYPE_RND) {
> +		/* Secretly permit this as an alias for "rnid" events */
> +		type = CMN_TYPE_RNI;
> 	}
>
> 	/* This is sufficiently annoying to recalculate, so cache it */
> -- 
> 2.39.2.101.g768bb238c484.dirty
>
>
>

