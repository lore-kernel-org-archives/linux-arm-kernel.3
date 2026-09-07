Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B44C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 09:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWHVT75pGnhpvj3X3lQw/eBdgSe3XynMCwLjPXFUTew=; b=B4H6DMcQi2TTIo1j44n79ekLYN
	ff1w2vMOx+79u9NZuxzSSoJXi7yh2v5Q6M6b2Kt7oKu/z+EjxXOT2Ia+MJuuJfPZXayhj0me6Yh94
	M1P2iJv9+Xp/twhc1oVtsmEZ+eRwaWCHZEob+u429QJ99mfMgNoOBA/BageZ0P5M5/dyqlwLXIta4
	8BesadDBUd8jrxCLKywZm75PtEbps8hqUsemgyrlRyrrySUI2kLrSF7jsQaS2evS8paCQWsaPXCZu
	oTPx9UPc7fQA3+lIVSIj7BYINWnOIfKaQ/cYzowtH7JHrpQZPeV2TCoCVvcSneN97ilYT7dARYrQI
	YAv3bj9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W03-00000006Oba-2kxL;
	Mon, 07 Sep 2026 09:50:51 +0000
Received: from mail-northcentralusazon11010070.outbound.protection.outlook.com ([52.101.193.70] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W00-00000006OaY-1wsQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 09:50:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ex4zYaxEE39lduk/kmq396E50IVUPTOhegGybW1JxQMHGvjxuo6maSK0JXWz3CsjQzGr6/jOYaPU8uGOgBBqLUL9Y6hXs8tYaimxmROuOtbGjZoLqAkTXFvlG2V6gXwo/WHDGJeR71ZtFDwZ34dDe0KRsPpNcPsM2guDsCaizDwz29fIBpazwXfjGWDc4JVafavuiHJDUnauC/90ux47gbfue9Js05ckjg1cOEyn5FA2XblPDSniK1a/i6hVHYlmZ2KslBHBM51RxTiZCsw30zardkp8CFoOLIsmkM/H/CUC0QdiG4VwQxfwjVFwMzsTrxvslPhqHO8CunxjaemE3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWHVT75pGnhpvj3X3lQw/eBdgSe3XynMCwLjPXFUTew=;
 b=FiN/nZNzXSbOy57/cFaV7iEBxhhLLQQ5laAl+jhyKfjptVGMcm+F5VMyQQFKJhnAZMolnpbotyv/XlnpS5bZusTw6w2iLzP6WxqfNuwfnrgn8j35G1O0HuSWTHNZdXHYqL+Xt1adPe9qHTl4buFLYcwXLndW5MjQ9rzDbheCOk3RwY46h0atAkrLhPtzqBP5M4L7dDtM8py2Y0SXzGUS+6mB3/zwslunoqPIe5ngwZ1sAScVxAE0ellFWGeiJ1lXz33qKSG+kjwxiNTbwJXihCTbuFDcGgTVWDQkIbTrqp/jjlXf3Bt4O5UI7EYASfgIhC8HtHni3vkHdSPSlq/W/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWHVT75pGnhpvj3X3lQw/eBdgSe3XynMCwLjPXFUTew=;
 b=U7P8px7kqIc8HJ1r8dXiU8ysfh6O5qWqDLhr9sdnv0t6uZnZzm4NxqQth/wzqluyWBK+nri0Sb6unt4oDAG2tCSJsPf5/U+x3M5fbr7+kQ0uo567SdZ663SIIQCT+lxICVQHxMZNGgshbNpougwh5jkRZG/D3MkfPpPhitfV8w2t8wg0AmXFk4L8e/VkwHJbr6aUTfR1cQeCxkp/wT4MidBtrd/I+oZznTj+BXhqyq3SmLYCb3NYZoUiCJpaoA4n/GzcUTSUZGDtoWn8oVQ2ak4643J2WCqCtFFFHBF460WVUVpowa+3lb4ho5XOITT6522jnSBh08+KrrZCWxn/Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by CH3PR12MB8709.namprd12.prod.outlook.com (2603:10b6:610:17c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 7 Sep
 2026 09:50:40 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 09:50:40 +0000
Date: Mon, 7 Sep 2026 11:50:31 +0200
From: Andrea Righi <arighi@nvidia.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sched/fair: Honor asymmetric SMT priority in idle
 selection
Message-ID: <ap6I55W7x_p0I1FE@gpd4>
References: <20260904091838.3617894-1-arighi@nvidia.com>
 <20260904091838.3617894-3-arighi@nvidia.com>
 <ff6763c9-f279-47d2-a279-58c54ab37ee6@amd.com>
 <ap5_3R2H80WsD1R5@gpd4>
 <83b58943-f2ff-4bc5-84b7-a40f03d3c3bd@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83b58943-f2ff-4bc5-84b7-a40f03d3c3bd@amd.com>
X-ClientProxiedBy: MI2PEPF00000B86.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::408) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|CH3PR12MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: e12a1b9f-71be-46f4-2087-08df0cc57972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|23010399003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Kv8diuLoHdsywn3r7l/nZqWwdb6RZ/yqFzDfhgtBTDUF36MKtwalIeNf+1+YjN3ddcHaRynjUasO3Txx919JSwuP70q7V99YgZTBbheZrMCtttXPEhqUDjd09Pows0r/Ep181MMd9Z/MRCv8T4mL/fNu9311Ay+2PYhRnTIOjOUqiVd+jQbsTXpHWdUbUWFFHmKG5FHt6GmK2vvosec51gFs3DQVqKcP27NhvWizE0nf8LF1mxqWLrFbSZhNqW6lPRyTv9rKfc0982udKTsfSxk2HNSw6nX4I7QiYntpQG8sa1MVjJAWjocolilv7YjJr7d5ZtEsrAD1TBVi8jmZryx/GyoyEP+RPcecSKVbMqCxVP6hRUjK8Bx87NN7ckGwTQ4/P7qzHy3xDzFZVGZAJODOEpCxC9+w0S4GeFiHWf2sHn6lhqI5Edchbt5t1jyq9x8Q8JGuusfsf09bwSfrJr3Bvj73l6RMEhgAVhR6DKkABfeq5skYJ6FNYgLx/96rXDBNLWdEOn6WfKgo8AgYsXBYjRxHTlI1zoEMqZf0KT42Ocvvx17SdVmIRKzkLP7Qyibim9ZgRdmc+AY3ZkkckYljAofMh6n+mBAvMJ4XIuLk5mXqigDUarqNmR+ggmlrmaOLeH8rxxFvJnDUHmQXn0ovFv6fUBflihP0A11OPyE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GlahPkYHrexxWwBSHJ8toTdvl8k+eeGT57D0HcNTlrqS0uv+yk/LIP0bP8S+?=
 =?us-ascii?Q?eXmeUBS/lCrVYgjlM8mtwvnVa1nvBjZEiWJLppZoJTdZQHkWk2LJhe4Qn0mO?=
 =?us-ascii?Q?ZW4yDWBHoCiUQS4e0bA9Uwwq99Y3FPWVI7Go3Q454BhIflP8VDdQm6ySBHDh?=
 =?us-ascii?Q?uE5y0vPkAVbnm9K8HSpO0GLLnTQhBjHMIYu5nFv1IcshSrOB76/OxnRicFkL?=
 =?us-ascii?Q?r67Dkv1kjkcCj4iPvCfwi9gZQ8NmFT+G4Jmu02L32MAx2ZXSIJwsbJIAYT33?=
 =?us-ascii?Q?vjH3mGi52i27uVPWm9v7BrMKWI3y0HmX+k2i48GQfKyNhfzwB/paWyxho21R?=
 =?us-ascii?Q?5QoXN9uq3DL4l77rdd4WzF+qChcSp11YtRzfIZLeS2woP0AFLV2rrrETNFMN?=
 =?us-ascii?Q?pJZA470O2pniskpAY4Pu/8Z8iaROgu37LWM3t3UHjZ7cwNmLomqu0zpo2zna?=
 =?us-ascii?Q?YYwobSaX3tN1D1B9m62Vx5yirVtNeyQ8isq2gOKGKeNpI00L+/GmQ5K4cUhu?=
 =?us-ascii?Q?3dB09NEOc/WSgh8V8nrGIIrtyo7cziMGeDCqrT8l4q6enJ4N9/Oy8zUaHT7T?=
 =?us-ascii?Q?HccO0jE7l10PoSLCgY3wMgKmXW5IjseoQrPo1D74gRMboKVNi70Bug1kRtlV?=
 =?us-ascii?Q?gQ/27IODArFz75lJ33GvXX1ALMG3uDsm1nSdid6TcLDS5Ek1czqzvjdAeBiI?=
 =?us-ascii?Q?Iyj9s9KJlmItjvonZBcvPAz+77M7V3K7twnm3PSIpXO013uKmVv3TNM1VVn7?=
 =?us-ascii?Q?jf0MuxN+kH9r2xaDTIXwwMSlbSZvZ1shCoL3tjLCczgufy0gkiqdviaXzxGO?=
 =?us-ascii?Q?VWhS4ZKM1aUyyjnV3+yPG9Za19nKGs2VtySaIMslg1c0VwCm0sl8gDSHBIuK?=
 =?us-ascii?Q?+AnnoIwfmEohv8PAl6dbxYWOyIBgCY/AwFSTtDnNU2NOhmhowNOzX21bbq1W?=
 =?us-ascii?Q?x8YdoFRlAb8L5ymXou7U/k+lbsUuUKupXunZ45l6xx6wDiGKVK1ttV5rEyrc?=
 =?us-ascii?Q?XfTjTSOdlrH+ktGZeIhL7KRoa9zvaXYHIl0I1a4X0RHshFa49wxt17Nl66Ae?=
 =?us-ascii?Q?WVhL86Xqe8GVAqRyXjmIp7w9LCUhytO9kIDRFA+WnaaAWSYHzwL3bqfHBjfr?=
 =?us-ascii?Q?KHXm4euDrOo/KT+ClHmQInFA5yPzmaRQ6zEyH8WMQdJSh/M5s6yPTt0El5Pb?=
 =?us-ascii?Q?tbt2SCYs/bF18MlgE27GIbEKKdHkWis1SvvRnofQebOdSly5KeeXdGl/vpPM?=
 =?us-ascii?Q?CvQJvBWhSK2GMk0Gfdvm4UW3IDLjThixvGKsyQ3KpEoLAZm9UtKfhe3cDLW4?=
 =?us-ascii?Q?bXDZA6eWyU+QHDFS/KhjMA2Uu47lXLGmo+q701/GZUfXXOCNIMD7UyDoHvug?=
 =?us-ascii?Q?pgbgWTcwbIJDc4mkBZctgIHwgUtmQea7aqNTZq27e3UPxxd/DqnYTOSJ+xFQ?=
 =?us-ascii?Q?0z40Pwl9QGSORtirf41lPP+o3Z+nk7zgInLD96iaiplHH0AMOXhp8HCjiNIO?=
 =?us-ascii?Q?XUegtYveeI4t08R9yyoe4a7Dn5StU5UcsoM2qNxNELTQDca9pTI5Bb94H3V6?=
 =?us-ascii?Q?yL0MISkQvXeL81uYJHpln7/thOrI3u9t3GPElPcP918Zjlstiwql+AKwRP4S?=
 =?us-ascii?Q?UdZCszSdBGX8PaH4XTQK0Maujp4nR0hYZwy5aoK6h2oelBtIOwCWEIGJLwAY?=
 =?us-ascii?Q?VJVIAjMU1gUQH3g7dXGGUjkHjhKvA5pbwXRu5uBWmQk93M02mZPfgYZY8D1U?=
 =?us-ascii?Q?mq6kf5H7Hw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e12a1b9f-71be-46f4-2087-08df0cc57972
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 09:50:39.9189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wDxscAySzWK3FEeXUlCIYfVSal+EseWPDBaW/4EKmcSHL0DcxFIgJ/ochvS7KOG126+75gnvQ0Hk//pvtj03Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8709
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_025048_507931_25206EA7 
X-CRM114-Status: GOOD (  24.53  )
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

On Mon, Sep 07, 2026 at 03:10:00PM +0530, K Prateek Nayak wrote:
...
> >> @@ -9043,27 +9049,31 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
> >>  
> >>  		if (!has_idle_core && cpus_share_cache(prev, target)) {
> >>  			i = select_idle_smt(p, sd, prev);
> >> -			if ((unsigned int)i < nr_cpumask_bits)
> >> -				return i;
> >> +			if ((unsigned int)i < nr_cpumask_bits) {
> >> +				target = i;
> >> +				goto out;
> >> +			}
> >>  		}
> >>  	}
> >>  
> >>  	i = select_idle_cpu(p, sd, has_idle_core, target);
> >>  	if ((unsigned)i < nr_cpumask_bits)
> >> -		return i;
> >> -
> >> +		target = i;
> > 
> > Not sure about this final fallback. Is it worth doing an additional
> > select_idle_smt_priority() after idle scan failed or stopped because the
> > SIS_UTIL scan budget was exhausted?
> 
> I see what you mean! We'll end up doing a:
> 
>   select_idle_smt_priority(p, target)
> 
> at the end which might indeed be wasteful.

Exactly.

> > 
> > It seems better to jump to out only when one of these paths has actually
> > selected a candidate:
> > 
> > 	i = select_idle_cpu(p, sd, has_idle_core, target);
> > 	if ((unsigned int)i < nr_cpumask_bits) {
> > 		target = i;
> > 		goto out;
> > 	}
> > 
> > The prev_aff and recent_used_cpu fallbacks can jump to "out" as well, since they
> > were already verified as suitable candidates. If none of those paths succeeds, I
> > think the existing final "return target" should remain unchanged.
> > 
> > Does that make sense?
> 
> Correct me if I'm wrong but you are suggesting to keep the current
> return intact and put out label after it like:
> 
>     /* If no suitable target was found */
>     return target;
> 
> out:
>    if (!sched_smt_asym_active())
>        return target;
> 
>    return select_idle_smt_priority(p, target);
> ---
> 
> That makes sense to me!

Correct, I'm going to run some tests with this and will send a v3 later.

Thanks!
-Andrea

