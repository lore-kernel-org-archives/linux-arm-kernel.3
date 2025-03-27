Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F224FC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 15:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Agk6G4Qe6WwsjySeUa6mfUkT13vP+MVDVQKCnG8WQPI=; b=VXrgbQ0XI7BoqdxFeJvO+Nbt3A
	6F1Lh7ULurjDIMC3bZEcxNQ4ANcqOwsG+a1axUWoG3VrvZvrvIlZLM/qSdxY0eLKcnVd9AkqsSr1I
	fI/d+pNCaMCA9LLIyxx/vsZ9GANq08Mmuk5nHsYn0MydlUCQGgOLEm32PEDhPbQgWvcMemymysIof
	6OzxVd1XkiIYJQ//kex7uGD1JgW/sL5/02qs5UcRPI3kbeDWHJrOSjgDaGH7/GNgODkgyqV1Z/srU
	0EYdF2YaL/dmJq5yi2nLma8zn5YNCAwzK+ySoQKy2AJqs/9s7lijBB6l6x39mh+fABg8uYXLA4wbp
	BRmZVS9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txpIJ-0000000BNTT-2SEL;
	Thu, 27 Mar 2025 15:37:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txpGZ-0000000BNCp-3I1B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 15:35:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 890D91063;
	Thu, 27 Mar 2025 08:35:40 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E98CF3F694;
	Thu, 27 Mar 2025 08:35:34 -0700 (PDT)
Date: Thu, 27 Mar 2025 15:35:30 +0000
From: Leo Yan <leo.yan@arm.com>
To: Tanmay Jagdale <tanmay@marvell.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	john.g.garry@oracle.com, leo.yan@linux.dev, will@kernel.org,
	acme@kernel.org, adrian.hunter@intel.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, coresight@lists.linaro.org,
	linux-kernel@vger.kernel.org, sgoutham@marvell.com,
	gcherian@marvell.com
Subject: Re: [PATCH V3 1/2] perf: cs-etm: Fixes in instruction sample
 synthesis
Message-ID: <20250327153530.GF604566@e132581.arm.com>
References: <20250327111149.461012-1-tanmay@marvell.com>
 <20250327111149.461012-2-tanmay@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327111149.461012-2-tanmay@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_083535_914829_04FBED67 
X-CRM114-Status: GOOD (  38.79  )
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

Hi Tanmay,

On Thu, Mar 27, 2025 at 04:41:48PM +0530, Tanmay Jagdale wrote:
> The existing method to synthesize instruction samples has the
> following issues:
> 1. Branch instruction mnemonics were being added to non-branch
>    instructions too.
> 2. Branch target address was missing
> 
> To fix the issues, start synthesizing the instructions from the
> previous packet (tidq->prev_packet) instead of current packet
> (tidq->packet). This way it's easy to figure out the target
> address of the branch instruction in tidq->prev_packet which
> is the current packet's (tidq->packet) first executed instruction.
> 
> Since we have now switched to processing the previous packet
> first, we need not swap the packets during cs_etm__flush().
> 
> Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
> Reviewed-by: James Clark <james.clark@arm.com>

I saw James's reviewed tag.  However, I have several comments.

Sorry I jumped in too late.

> ---
>  tools/perf/util/cs-etm.c | 32 +++++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 0bf9e5c27b59..ebed5b98860e 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -1576,10 +1576,26 @@ static int cs_etm__synth_instruction_sample(struct cs_etm_queue *etmq,

Seems to me, the problem is cs_etm__synth_instruction_sample() is
invoked from multiple callers.

Both the previous packet and packet are valid fo the flow:
  cs_etm__sample()
    `> cs_etm__synth_instruction_sample()

Only the previous packet is valid and the current packet stores stale
data for the flows:

  cs_etm__flush()
    `> cs_etm__synth_instruction_sample()

  cs_etm__end_block()
    `> cs_etm__synth_instruction_sample()

First, as a prerequisite, I think we should resolve the stale data in
the packet.  So we need a fix like:

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c                
index 0bf9e5c27b59..b7b17c0e4806 100644                                         
--- a/tools/perf/util/cs-etm.c                                                  
+++ b/tools/perf/util/cs-etm.c                                                  
@@ -741,6 +741,9 @@ static void cs_etm__packet_swap(struct cs_etm_auxtrace *etm,
                                                                                
        if (etm->synth_opts.branches || etm->synth_opts.last_branch ||          
            etm->synth_opts.instructions) {                                     
+               /* The previous packet will not be used, cleanup it */          
+               memset(tidq->prev_packet, 0x0, sizeof(*tidq->packet));          
+                                                                               
                /*                                                              
                 * Swap PACKET with PREV_PACKET: PACKET becomes PREV_PACKET for 
                 * the next incoming packet.                                    

>  	sample.stream_id = etmq->etm->instructions_id;
>  	sample.period = period;
>  	sample.cpu = tidq->packet->cpu;

Should we use "prev_packet->cpu" at here?

Even for a branch instruction, as its IP address is from the previous
packet, we should use "prev_packet->cpu" for CPU ID as well.

> -	sample.flags = tidq->prev_packet->flags;
>  	sample.cpumode = event->sample.header.misc;
>  
> -	cs_etm__copy_insn(etmq, tidq->trace_chan_id, tidq->packet, &sample);
> +	cs_etm__copy_insn(etmq, tidq->trace_chan_id, tidq->prev_packet, &sample);
> +
> +	/* Populate branch target information only when we encounter
> +	 * branch instruction, which is at the end of tidq->prev_packet.
> +	 */
> +	if (addr == (tidq->prev_packet->end_addr - 4)) {

  if (!addr && addr == cs_etm__last_executed_instr(tidq->prev_packet))

> +		/* Update the perf_sample flags using the prev_packet
> +		 * since that is the queue we are synthesizing.
> +		 */
> +		sample.flags = tidq->prev_packet->flags;
> +
> +		/* The last instruction of the previous queue would be a
> +		 * branch operation. Get the target of that branch by looking
> +		 * into the first executed instruction of the current packet
> +		 * queue.
> +		 */
> +		sample.addr = cs_etm__first_executed_instr(tidq->packet);

If connected to the change suggested for cleaning up packet in
cs_etm__packet_swap(), when run at here, if "tidq->packet" is a valid
packet, then it will return a branch target address, otherwise, it
will return 0.

> +	}
>  
>  	if (etm->synth_opts.last_branch)
>  		sample.branch_stack = tidq->last_branch;
> @@ -1771,7 +1787,7 @@ static int cs_etm__sample(struct cs_etm_queue *etmq,
>  	/* Get instructions remainder from previous packet */
>  	instrs_prev = tidq->period_instructions;
>  
> -	tidq->period_instructions += tidq->packet->instr_count;
> +	tidq->period_instructions += tidq->prev_packet->instr_count;

A side effect for this change is we will defer to synthesize instruction
samples for _current_ packet, either the packet will be handled after
a new packet incoming, or at the end of a trace chunk.

The problem is for the later one, we can see cs_etm__end_block() and
cs_etm__flush() both only handle the previous packet. As a result, the
last packet will be ignored.

I would suggest we need to firstly fix this issue in
cs_etm__end_block() and cs_etm__flush() (maybe we need to consider to
consolidate the code with cs_etm__sample()).

>  	/*
>  	 * Record a branch when the last instruction in
> @@ -1851,8 +1867,11 @@ static int cs_etm__sample(struct cs_etm_queue *etmq,
>  			 * been executed, but PC has not advanced to next
>  			 * instruction)
>  			 */
> +			/* Get address from prev_packet since we are synthesizing
> +			 * that in cs_etm__synth_instruction_sample()
> +			 */
>  			addr = cs_etm__instr_addr(etmq, trace_chan_id,
> -						  tidq->packet, offset - 1);
> +						  tidq->prev_packet, offset - 1);
>  			ret = cs_etm__synth_instruction_sample(
>  				etmq, tidq, addr,
>  				etm->instructions_sample_period);
> @@ -1916,7 +1935,7 @@ static int cs_etm__flush(struct cs_etm_queue *etmq,
>  
>  	/* Handle start tracing packet */
>  	if (tidq->prev_packet->sample_type == CS_ETM_EMPTY)
> -		goto swap_packet;
> +		goto reset_last_br;
>  
>  	if (etmq->etm->synth_opts.last_branch &&
>  	    etmq->etm->synth_opts.instructions &&
> @@ -1952,8 +1971,7 @@ static int cs_etm__flush(struct cs_etm_queue *etmq,
>  			return err;
>  	}
>  
> -swap_packet:
> -	cs_etm__packet_swap(etm, tidq);
> +reset_last_br:

As said, if we consolidate cs_etm__flush() for processing both
previous packet and current packet, then we don't need to remove
cs_etm__packet_swap() at here, right?

Thanks,
Leo

>  
>  	/* Reset last branches after flush the trace */
>  	if (etm->synth_opts.last_branch)
> -- 
> 2.43.0
> 

