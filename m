Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7E4D7494D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 23:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mM2+t26yi1lNLcTeoYH6Trl38RhTdZUs6NLhgQOqrw=; b=ljTzAtUbdssMtbOmN46rWuDGsz
	C7TUzaoKS3cKBi6a07EGp6Kei/hEpSNkkVyXrdw2+24B7Zd7iiHLOk4XiF42byKsFVG6BetK1OF1z
	uDeHMY1SJpQp6gRG4D1jMOW3Uf1ezldFaVQz7wXoqRYPjskRUmwKqRuq3EeOZVrdrMUnOh4gh+m3P
	ntYMHVwGdIC8bAJ92c7hpiNMLW9xrnXN8HgQoihOQw31UnOI5qYny6KlzaeFPRFvQS4+U59vF/Q6Y
	XUQISpYTeSflIfPLwPbGwLKl/6dCjSGajHAu/v2ZULHDeWGr1vsvaud190McL7AtgTjy2BN7WiNK1
	B3/gFTMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vN7-0000000G87a-3k3h;
	Tue, 29 Oct 2024 23:11:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vLS-0000000G81I-00Ck
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 23:09:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2A6A5A40902;
	Tue, 29 Oct 2024 23:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05CEEC4CEE3;
	Tue, 29 Oct 2024 23:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730243388;
	bh=zye+wNRL8G23aZqii/unX0c97dPTkeNuEax9eXdHRRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W0udmcPM0lt/uRUN2hO5OXCF8Jqu411MxWWC3X7r1XUA6LfxlfzVFSzNvdZLV8N/1
	 wUhYdMJz9JIGQ1dqfBANpSp75LnewD2GmrWH4PKmj7d6HbP0G6dt9+s/z8viCGDTP+
	 6aYMleLjU51Oqx/rQRoaRpq8s77wCpxwOo38sPc1xQfvmCGbZV9R5Oc8EG8snOBJ2U
	 ZlTtbtUYql4DUl3XQq6SHH6MbBh0KSapV9uTSsR5e1JvW+1D5Pq2u3iFDuLGC4PBuv
	 HU1lSV0BEo5pDzA+sCV8w8HWTXZIg++UlbFhoz65QhRoSqy6DHRLDF8NRT2vFX8Ys0
	 qdMxwJ20oXUgg==
Date: Tue, 29 Oct 2024 16:09:46 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Graham Woodward <graham.woodward@arm.com>, acme@kernel.org,
	mark.rutland@arm.com, jolsa@kernel.org, irogers@google.com,
	james.clark@linaro.org, mike.leach@linaro.org, leo.yan@linux.dev,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, nd@arm.com
Subject: Re: [PATCH v1 0/4] perf arm-spe: Allow synthesizing of branch
Message-ID: <ZyFrOo7K1qmjtaV5@google.com>
References: <20241025143009.25419-1-graham.woodward@arm.com>
 <Zx--dTqaZPjeWA2I@google.com>
 <20241029170346.GB24446@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241029170346.GB24446@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_160953_399638_424C8C43 
X-CRM114-Status: GOOD (  20.20  )
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

Hi Leo,

On Tue, Oct 29, 2024 at 05:03:46PM +0000, Leo Yan wrote:
> Hi Namhyung,
> 
> On Mon, Oct 28, 2024 at 09:40:21AM -0700, Namhyung Kim wrote:
> > 
> > Hello,
> > 
> > On Fri, Oct 25, 2024 at 03:30:05PM +0100, Graham Woodward wrote:
> > > Currently the --itrace=b will only show branch-misses but this change
> > > allows perf to synthesize branches as well.
> > >
> > > The change also incorporates the ability to display the target
> > > addresses when specifying the addr field if the instruction is a branch.
> > >
> > > Graham Woodward (4):
> > >   perf arm-spe: Set sample.addr to target address for instruction sample
> > >   perf arm-spe: Use ARM_SPE_OP_BRANCH_ERET when synthesizing branches
> > >   perf arm-spe: Correctly set sample flags
> > >   perf arm-spe: Update --itrace help text
> > 
> > It doesn't apply to perf-tools-next cleanly.  Can you please rebase?
> 
> I confirmed this series can apply cleanly on the branch [1] with the
> latest commit 150dab31d560 ("perf disasm: Fix not cleaning up
> disasm_line in symbol__disassemble_raw()"):
> 
>   [1] https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git
>       branch: perf-tools-next
> 
> If you are suggesting for the branch:
> 
>   [2] https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools.git
>       branch: perf-tools
> 
> You can see it misses some Arm SPE patches which have been picked up
> in the repo [1].
> 
> Please kindly suggest what is right thing to do.

Sorry, my bad.  It works ok.  I'll add it to tmp.perf-tools-next branch
and run some tests.

Thanks,
Namhyung


