Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A283ED3A678
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 17:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGgEOByy4ys79A2g4TpvoOefEAcSybxFlZvzIspsfGc=; b=IuiJI1T1WwTdDqO7j69ThbJ7dP
	A8vmVbP6lO3CINaCMDqjhIe4imqtncE3MLb/0pB27DKUz16TN8BrdtI/qz/x6/X3dBEKqPgYMIlQI
	LUm/vAnRBAMhznI9yRrjkarfHSKn8A6M4/PdRDKaV31FZXYKGUEyD/eFxkywTYX34NKos9fgRKkIo
	TBMbfW2FvaeSfGhLXRc0GSh7XhanC6s3fgQ6dLxel5sMGss5Is+mqcaM0bMczzq9f6DDpvRjqiKns
	UUZqnNCfmCt29c+p+hsisnACBVO5XVI5JNeZG0VNoCuZ01Cq7UH31z0vrPZWRVqgLH6zOXpPR6dc9
	hDW5hBbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qHn-0000000FNIF-3kGF;
	Tue, 29 Oct 2024 17:45:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5pdH-0000000FCgG-2idV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 17:03:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CA4E113E;
	Tue, 29 Oct 2024 10:04:20 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 766D33F528;
	Tue, 29 Oct 2024 10:03:50 -0700 (PDT)
Date: Tue, 29 Oct 2024 17:03:46 +0000
From: Leo Yan <leo.yan@arm.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Graham Woodward <graham.woodward@arm.com>, acme@kernel.org,
	mark.rutland@arm.com, jolsa@kernel.org, irogers@google.com,
	james.clark@linaro.org, mike.leach@linaro.org, leo.yan@linux.dev,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, nd@arm.com
Subject: Re: [PATCH v1 0/4] perf arm-spe: Allow synthesizing of branch
Message-ID: <20241029170346.GB24446@e132581.arm.com>
References: <20241025143009.25419-1-graham.woodward@arm.com>
 <Zx--dTqaZPjeWA2I@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zx--dTqaZPjeWA2I@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_100351_749182_226B9C0C 
X-CRM114-Status: GOOD (  15.44  )
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

Hi Namhyung,

On Mon, Oct 28, 2024 at 09:40:21AM -0700, Namhyung Kim wrote:
> 
> Hello,
> 
> On Fri, Oct 25, 2024 at 03:30:05PM +0100, Graham Woodward wrote:
> > Currently the --itrace=b will only show branch-misses but this change
> > allows perf to synthesize branches as well.
> >
> > The change also incorporates the ability to display the target
> > addresses when specifying the addr field if the instruction is a branch.
> >
> > Graham Woodward (4):
> >   perf arm-spe: Set sample.addr to target address for instruction sample
> >   perf arm-spe: Use ARM_SPE_OP_BRANCH_ERET when synthesizing branches
> >   perf arm-spe: Correctly set sample flags
> >   perf arm-spe: Update --itrace help text
> 
> It doesn't apply to perf-tools-next cleanly.  Can you please rebase?

I confirmed this series can apply cleanly on the branch [1] with the
latest commit 150dab31d560 ("perf disasm: Fix not cleaning up
disasm_line in symbol__disassemble_raw()"):

  [1] https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git
      branch: perf-tools-next

If you are suggesting for the branch:

  [2] https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools.git
      branch: perf-tools

You can see it misses some Arm SPE patches which have been picked up
in the repo [1].

Please kindly suggest what is right thing to do.

Thanks,
Leo

