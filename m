Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58EEC53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 16:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCiFM2lkfNpjL/bvrztHQLqCRN3s1HGLBRknrB8fS3w=; b=stZPzhmI4caEnZL1g/ojDaisQT
	iQm883XXlvnsOBmRhO6HmK0E0SjcvauK8MEb99g4Bx4E4rp00iv6pSFWHNX799oV9CKDf1aOfG7CI
	UDJP1p118VfJNnHiFdkthHM/Jr8TJVnH/DX9lhpjdQeicIRVl5TTIy1LJI5gMvleywi27/Aeiq0cX
	5o8T2K+TioYjXDBnEl6s/8QDIuYYZ5m/6PgvwBU9nxNOSRPMUYSjQELWtzskRtQOBzZhLPGO0bqcV
	yvvNd9qT8LzaI/vlbEaWN6pO1veyZhNIwJXPLbjvu2vGYMNGpqMDZXINS22tzTm0FlsjDnnMRrEpr
	9K34ajPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Gs-00000008Zkh-1Hjq;
	Wed, 29 Jul 2026 16:36:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Gp-00000008Ziu-0fmc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 16:36:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3F021684;
	Wed, 29 Jul 2026 09:36:31 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB8783F66F;
	Wed, 29 Jul 2026 09:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785342996; bh=tvcXzXQti28HxlHlWQJNIDfbNAoPnOK8M4bOGjwwAw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hyI+bd6vl2+Z07rzTz0iR5xyuVsL2EdKpJqN72ssnwQmzDLnSwbLWRI1hRI2iorTw
	 tfjk+FhGzAV6skpFiLOAMXa87pbO0DTF4odlyG0sH53sP/YQAq51TxBHJGD4cAuqkt
	 i5H1kPTA/88DqMb9Pe+8aHpoxzDh1H9fFsbluZmc=
Date: Wed, 29 Jul 2026 17:36:20 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, sudeep.holla@kernel.org,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, d-gole@ti.com,
	jic23@kernel.org, elif.topuz@arm.com, lukasz.luba@arm.com,
	philip.radford@arm.com, brauner@kernel.org,
	souvik.chakravarty@arm.com, subrahmanya.lingappa@oss.qualcomm.com,
	leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
	usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v6 00/22] Introduce SCMI Telemetry support
Message-ID: <amosBNqF8umNmlWm@pluto>
References: <20260724144430.1440170-1-cristian.marussi@arm.com>
 <634717bf-d188-4de1-8465-31e31ea3642e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <634717bf-d188-4de1-8465-31e31ea3642e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_093639_241508_43CC3898 
X-CRM114-Status: GOOD (  17.65  )
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

On Wed, Jul 29, 2026 at 11:12:20AM +0200, David Hildenbrand (Arm) wrote:
> 
> > NOTE THAT from v3 onwards the firmware interface level NOW supports ONLY
> > the latest SCMI v4.0 specification [0].
> > 
> > TODO
> > ----
> >  - [ABI]: add genric events supports -> generation counter/updates
> >  - [ABI]: add Secondary UUID support
> >  - [ABI]: add BATCHED DE_CONFIG and add per-de status to BATCH READS
> >  - [ABI]: more DOCS
> >  - [ABI]: some more dediceate space to grow all around the structures
> >  - (maybe) TLM chardev open-exclusive mode to ease userspace co-ordination
> >  - a few residual sparse to fix... 
> 
> Is this a TODO list as in "must be tackled before this can be merged" or rather
> a "future works" list?
> 
> Especially the "[ABI]: some more dediceate space to grow all around the
> structures" sounds like something we would want before considering merging it?

Hi,

indeed the first two (UUIDs/generation) and the reserved space to grow
were meant to be the bare minimum to have, but indeed the other ABI
stuff is not a big deal to add and so it would be better to have it all
given that they have been asked explictly by the tools team...

...anyway till now I was trying to incrementally add new feats (like the
above) and carry-on SOME cleanup bugfixing following Sashiko reviews mainly...

...so as to simultaneously progress toward a more complete and correct code...

..but, given that the stuff in my TODOs keep getting flagged as "...ehi
this is still missing..." despite being in the cover TODOs (O_o), I will move
away from my incremental approach and I will instead aim at being at first
'feature complete' by the end of this week and then resume cleanup activities
next....

So, IF I'll have a decent feature-complete series by this weekend I will
post such a v7 (to gather more feedback), and postpone final in-deeep cleanups
in next week v8....IF NOT I will go straight for a v7 next week with
full feats AND cleanups...

(... not that I am expecting Sashiko not to find more stuff even in v8... )

Thanks,
Cristian

