Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E90CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 12:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nl7xvHrulUAVRRVOEa2k+aOV1+IEWV+1ksRsGNt3f1c=; b=sO6PcFkVvFB2fhr2zmKFmQ0WCv
	75zBcq1njf8Ced1gBbIN1WZVghxb1z7NEc4CnFPxCt/bYG3nxZUPyt4hNdq6bDK/oRYVW1ooWQVCs
	nWRjDEtpCek1ra4eQjayqw4HjWBzc53j31Pn+NvP2uOGGS91ChbpYt5YD8ZLJWMO4j6g9e79D1asm
	9kuwQUXA1UF0SEsZ7amwuTZF1sffTIyDcU1ShQclMMW8/2R6rikGNPM7ahnCZH32O6f+S7Z0IgBKl
	I224hbKbbl4+AT2hWpT79Q7qOSC1pNLf5nuO0+KsITYSQ0oCJb3FIea5jp23a680n1zRJgfZHtPpN
	NNTtq0Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZFg-00000003WhE-3Cj4;
	Mon, 08 Jun 2026 12:38:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZFe-00000003Wgr-1ZKT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 12:38:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D06F32437;
	Mon,  8 Jun 2026 05:38:37 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C5743F632;
	Mon,  8 Jun 2026 05:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780922322; bh=6/wR7/qZ06/YbREpfOLKqB0ZjddthOSRFEKY1wxpGWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fJ6qmE3zggln04xv+1TtzMMr/x6+hGwdVAxCtfAXpyA0Pvelixi7M421phEg9PJTc
	 +ydeHqMeeLAoBaU3Qyw2DLZHMll3uAMLcuNNEFN/p4aU4/D1Xo1UjtT4aA7bIbzdSf
	 1hE3zFtQcQZnZn7STHp1CiS2BIHqxWVu5Kf1Y4RY=
Date: Mon, 8 Jun 2026 13:38:40 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>,
	Paschalis Mpeis <paschalis.mpeis@arm.com>,
	Amir Ayupov <aaupov@fb.com>
Subject: Re: [PATCH v6 3/8] perf cs-etm: Use thread-stack for last branch
 entries
Message-ID: <20260608123840.GN101133@e132581.arm.com>
References: <20260526-b4-arm_cs_callchain_support_v1-v6-0-f9f49f53c9dd@arm.com>
 <20260526-b4-arm_cs_callchain_support_v1-v6-3-f9f49f53c9dd@arm.com>
 <9d1e0448-27d7-42d3-aaa3-2d09489f18d9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d1e0448-27d7-42d3-aaa3-2d09489f18d9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_053846_548313_97F27B77 
X-CRM114-Status: GOOD (  17.64  )
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

On Thu, Jun 04, 2026 at 03:09:26PM +0100, James Clark wrote:

[...]

> > @@ -1798,14 +1746,7 @@ static int cs_etm__sample(struct cs_etm_queue *etmq,
> >   	tidq->period_instructions += tidq->packet->instr_count;
> > -	/*
> > -	 * Record a branch when the last instruction in
> > -	 * PREV_PACKET is a branch.
> > -	 */
> > -	if (etm->synth_opts.last_branch &&
> > -	    tidq->prev_packet->sample_type == CS_ETM_RANGE &&
> > -	    tidq->prev_packet->last_instr_taken_branch)
> > -		cs_etm__update_last_branch_rb(etmq, tidq);
> > +	cs_etm__add_stack_event(etmq, tidq);
> 
> Would it be cleaner to call this whenever a branch sample is generated?

We should not couple stack event and generating branch samples.

The reason is the stack event can be used separately by instruction
samples, e.g., the option "--itrace=i100il64g16". And the branch stack
and call chain must get ready before synthesing samples.

> Seems like the conditions for calling thread_stack__event() and
> cs_etm__synth_branch_sample() are slightly different (ignoring the fact that
> branches are only generated when the user asks for them).
> 
> Maybe the conditions should be different, but maybe a comment why or if
> they're the same, a shared function for the conditions would help.

I can add a helper to check if a packet is taken branch and it can be
used by cs_etm__add_stack_event() and generating samples.

  bool cs_etm__packet_is_taken_branch(struct cs_etm_packet *packet)
  {
      if (packet->sample_type == CS_ETM_RANGE &&
          packet->last_instr_taken_branch)
          return true;

      return false;
  }

Thanks,
Leo

