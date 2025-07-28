Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3066AC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WFLoD5AeEBE7Qj2BH06Of7T+sfe4z/h2x41mhO2hk8w=; b=2f89h8DJrlVoDVQnG0rE09muED
	pqEoQpd32J+GggxD3dMIRg+Eg7SnJXS7yy7w52gMAeMJez7Bd5jBrTt/35LwDTFjbLTqswyhrCSPo
	ud8I4JlvZgs9dwCHqZgNthfSZRCXW4fcLpWrkUe3VmR+edtTT9q0z2KsZTEfKHbJUK8hROJcC+wCJ
	E4KjieIUr/Ci+jRtt+mbFBSdkiGUYezcUyPLEohCRowLsveSIoOmZyq3r9emDM0QGDXFpAjvYcTYf
	VUoz4MVWN3Cwsq/v8vcrg5jt9OikWqvlP6j3RGiwAb+jySJnTUJIPr16XZtHOIOulzK8G1iug5JH2
	MH43o5mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTiw-0000000FIJV-3onr;
	Mon, 28 Jul 2025 19:41:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugSKl-0000000FBig-0K4n;
	Mon, 28 Jul 2025 18:12:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2216443ABB;
	Mon, 28 Jul 2025 18:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D3CC4CEE7;
	Mon, 28 Jul 2025 18:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753726342;
	bh=GPXtLxgLQqeIpYw5RDwKxkiReN3KSzF3obIxX1uhxQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iDZY1xT5O0+AUOeaJs9m1W1k/Hmokisrp8wMgM2TdvuE6S6KWgcYGLK06Rc54DIaf
	 ZE549Ut19JH/HWn1GC9kPOcixmcUxaYtqsN1Ts5yQJ8ZkSYG+e0Xl7FMO2MnxcRJkT
	 oR+CbSXKcVaw8Y3MS9etJ/RV/oe3hzARoEkR3x++mTcArWo6myDPKSsUTVaCNAmFge
	 Xy4mNhtCW6yVZjKFLoz4+BlNjh8xLwclIMiL/slzZgcg8siULYMao2tCeVZihGH9Js
	 qnjgrzZHvATGhqnWL9WP4pIZaXcLSb1BeNb0ED5brsQvUBMoGgeCPVqwOG4aPWF43z
	 P7BlRbRb3eUnA==
Date: Mon, 28 Jul 2025 11:12:19 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: "Falcon, Thomas" <thomas.falcon@intel.com>
Cc: "linux-actions@lists.infradead.org" <linux-actions@lists.infradead.org>,
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
	"Biggers, Caleb" <caleb.biggers@intel.com>,
	"Hunter, Adrian" <adrian.hunter@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"irogers@google.com" <irogers@google.com>,
	"kan.liang@linux.intel.com" <kan.liang@linux.intel.com>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"Wang, Weilin" <weilin.wang@intel.com>,
	"mani@kernel.org" <mani@kernel.org>,
	"acme@kernel.org" <acme@kernel.org>,
	"afaerber@suse.de" <afaerber@suse.de>,
	"jolsa@kernel.org" <jolsa@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 00/19] Intel TMA 5.1 metrics and event updates
Message-ID: <aIe9g7lb92XO_1_m@google.com>
References: <20250719034515.2000467-1-irogers@google.com>
 <e09bab119c9fb6b0c2b5bcd39c6f2b508445ca37.camel@intel.com>
 <aIA1YubpL7wpiC0X@google.com>
 <aIVX4RH7llNKQ4Xn@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aIVX4RH7llNKQ4Xn@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_111223_153498_C0EAA1CF 
X-CRM114-Status: GOOD (  17.98  )
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

On Sat, Jul 26, 2025 at 04:34:00PM -0700, Ian Rogers wrote:
> On Sat, Jul 26, 2025 at 03:34:09PM -0700, Namhyung Kim wrote:
> > On Tue, Jul 22, 2025 at 06:05:38PM -0700, Namhyung Kim wrote:
> > > On Tue, Jul 22, 2025 at 06:14:30PM +0000, Falcon, Thomas wrote:
> > > > On Fri, 2025-07-18 at 20:44 -0700, Ian Rogers wrote:
> > > > > Update events from:
> > > > > v1.31 -> v1.33 for alderlake
> > > > > v1.09 -> v1.12 for arrowlake
> > > > > v1.14 -> v1.16 for emeraldrapids
> > > > > v1.10 -> v1.12 for graniterpaids
> > > > > v1.14 -> v1.17 for lunarlake
> > > > > v1.14 -> v1.16 for meteorlake
> > > > > v1.28 -> v1.30 for sapphirerapids
> > > > > 
> > > > > Update TMA 5.0 to 5.1 removing the slots event workaround as the patch series:
> > > > > https://lore.kernel.org/lkml/20250719030517.1990983-1-irogers@google.com/
> > > > > is assumed.
> > > 
> > > So I'll merge this series after the above patchset.
> > 
> > Now I'm seeing this on my AMD machine.
> > 
> >   Found metric 'tma_info_system_cpu_utilization'                                  
> >   metric expr cpu_atom@CPU_CLK_UNHALTED.REF_TSC@ / msr@tsc\,cpu\=cpu_atom@ for tma_info_system_cpu_utilization
> >   metric expr tma_info_system_cpus_utilized / #num_cpus_online for tma_info_system_cpu_utilization
> >   metric expr cpu_core@CPU_CLK_UNHALTED.REF_TSC@ / msr@tsc\,cpu\=cpu_core@ for tma_info_system_cpus_utilized
> >   found event msr@tsc,cpu=cpu_core@                                               
> >   found event cpu_core@CPU_CLK_UNHALTED.REF_TSC@                                  
> >   Parsing metric events '{msr/tsc,cpu=cpu_core,metric-id=msr!3tsc!0cpu!2cpu_core!3/,cpu_core/CPU_CLK_UNHALTED.REF_TSC,metric-id=cpu_core!3CPU_CLK_UNHALTED.REF_TSC!3/}:W'
> >   event syntax error: '{msr/tsc,cpu=cpu_core,metric-id=msr!3tsc!0cpu!2cpu_core!..'
> >                         \___ Bad event or PMU                                     
> >                                                                                   
> >   Unable to find PMU or event on a PMU of 'msr'                                   
> >                                                                                   
> >   event syntax error: '{msr/tsc,cpu=cpu_core,metric-id=msr!3tsc!0cpu!2cpu_core!..'
> >                                     \___ not a valid PMU or CPU number            
> >                                                                                   
> >   event syntax error: '{msr/tsc,cpu=cpu_core,metric-id=msr!3tsc!0cpu!2cpu_core!..'
> >                                     \___ not a valid PMU or CPU number            
> >                                                                                   
> >   event syntax error: '{msr/tsc,cpu=cpu_core,metric-id=msr!3tsc!0cpu!2cpu_core!..'
> >                                     \___ not a valid PMU or CPU number            
> >                                                                                   
> >   event syntax error: '{msr/tsc,cpu=cpu_core,metric-id=msr!3tsc!0cpu!2cpu_core!..'
> >                                     \___ not a valid PMU or CPU number            
> >   Broken metric tma_info_system_cpu_utilization                                   
> >   ---- end(-1) ----                                                               
> >     9.3: Parsing of PMU event table metrics                            : FAILED! 
> >   
> >   parsing 'tma_info_mem_mix_memload_ratio': '1e3 * cpu_atom@MEM_UOPS_RETIRED.ALL_LOADS@ / cpu_atom@UOPS_RETIRED.ALL@'
> >   parsing 'tma_info_serialization_%_tpause_cycles': '100 * cpu_atom@SERIALIZATION.C01_MS_SCB@ / (5 * cpu_atom@CPU_CLK_UNHALTED.CORE@)'
> >   parsing 'tma_info_system_cpu_utilization': 'cpu_atom@CPU_CLK_UNHALTED.REF_TSC@ / msr@tsc\,cpu\=cpu_atom@'
> >   check_parse_fake failed                                                         
> >   ---- end(-1) ----                                                               
> >     9.4: Parsing of PMU event table metrics with fake PMUs             : FAILED!

> Sorry for this. The parse state says whether fake pmus are used.
> Parse events needs updating for things like get_config_cpu so that
> failing to find a pmu is ignored with fake pmus enabled. Sorry for
> this, it is exposed in the updated metrics but the issue was caused
> by the prior series adding the support in the term.

No problem.  I've removed this series from the tree and we can fix the
issue once you're back.  Then add the metrics later.

Thanks,
Namhyung


