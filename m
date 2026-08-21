Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1006C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 11:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/l/2KawyGNYLCcvJD2Arzy5A9w3xXQ8Pfc3c3ttLJhQ=; b=slbiB3eEZJfEaPOyuihnLvHNv/
	KDi6Pf1PCERTCo+hCvCzK9qZ/PW4sYMLSXkFST7wAPXAZZHJKKf1esubujyHCk5niCx5M/1LL1+xl
	XhMcK9FHphLIehUwPEJZrF6dUwpTupwUHsBSnsK/mqj1sFkFK7HzG5w06hNH/JLLobae5y0n3BxGv
	zXdaT4SnU7TifzRdycMYgTSGvMHDHXeNvc885tnNdS+Ibqui5S4Ky/TmLeqWbT35qXeZp/lO2fTJB
	H37Hvw+FlSi6vjO9nObTHaqd28KFR39cr7OeTFzno8v6uMRZ144h6gwfCySD+qVpVugd6a7xA7p/6
	oFZYNJpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNOG-0000000DBYp-3cxj;
	Fri, 21 Aug 2026 11:26:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNOE-0000000DBYI-2P62
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 11:26:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19B851596;
	Fri, 21 Aug 2026 04:26:20 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D6653F763;
	Fri, 21 Aug 2026 04:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787311583; bh=Bl+hTE7mLTOt5f/k2vBFWuhv1+9Osdu/Tt7Pkm/CsuM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SzGA+SkJNd0Je+3zKJAyGf1m9WfOuDAW1oZfaMXZJEigu/ojNzVCJHcA443IIKDEN
	 94WQTAooNVv3FwPmJpVT6tSwVoUgDyIjAxV2ORk9c/0SHMm44bXbr01TpGfFClX2wk
	 ZqwP8TnJllBLq1SWPM40aYbbwTiiNV4WFktXp/8Q=
From: Leonardo Bras <leo.bras@arm.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v19 03/14] KVM: arm64: Manage GCS access and registers for guests
Date: Fri, 21 Aug 2026 12:26:13 +0100
Message-ID: <aog11Xfjf-tmA4PO@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <hwz52absjxap7n6olwt3lmjakmtgxxaku5gcofsrcfa45zdygh@dqgylcillnud>
References: <aoXamcdKoMynTkpX@LeoBrasDK> <48be9e5d-357a-4863-8682-8b3f34c69723@sirena.org.uk> <aobUGyq8nInJYkdA@LeoBrasDK> <97ad6e83-b22b-4881-b644-66fa99f68d64@sirena.org.uk> <aocOi3wjcliZqoe7@LeoBrasDK> <hwz52absjxap7n6olwt3lmjakmtgxxaku5gcofsrcfa45zdygh@dqgylcillnud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_042626_881333_BAC00462 
X-CRM114-Status: GOOD (  36.17  )
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

On Fri, Aug 21, 2026 at 12:39:08AM +0100, Wei-Lin Chang wrote:
> On Thu, Aug 20, 2026 at 03:28:39PM +0100, Leonardo Bras wrote:
> > On Thu, Aug 20, 2026 at 03:07:14PM +0100, Mark Brown wrote:
> > > On Thu, Aug 20, 2026 at 11:16:59AM +0100, Leonardo Bras wrote:
> > > > On Wed, Aug 19, 2026 at 05:46:00PM +0100, Mark Brown wrote:
> > > 
> > > > > This is just because there isn't a preexisting ctxt_has_tcrx() check
> > > > > already there, FEAT_GCS architecturally depends on FEAT_TCRX and there
> > > > > was a request to make this explicit in the code to try to optimise
> > > > > things a bit.  The compiler should skip over both blocks at once if TCRX
> > > > > isn't there rather than having two separate tests or static branches.  I
> > > > > didn't add new checks where there were none since I expect that to be
> > > > > unhelpful for code generation, you'd get the reverse situation and emit
> > > > > two checks.
> > > 
> > > > Humm, but then why saving GCSPR_EL2 does not depend on TCRX/E2H? Or maybe a 
> > > > better question, why are not GCSPR_EL2 and GCSCR_EL2 saved in the same 'if' 
> > > > clause under ctxt_has_tcrx() (and E2H set), if they are restored in the 
> > > > same 'if' clause?
> > > 
> > > > As you mentioned, GCS depends on TCRX, so it should be fine, but just by 
> > > > reading the code I see:
> > > > - GCSCR_EL2 :
> > > > 	Save if 	GCS=1, TCRX=1, E2H=1
> > > > 	Restore if 	GCS=1, TCRX=1
> > > > - GCSPR_EL2 :
> > > > 	Save if 	GCS=1,
> > > > 	Restore if	GCS=1, TCRX=1
> > > 
> > > > Which looks kind of confusing for the as a first time reader.
> > > 
> > > > Does it make sense?
> > > 
> > > I agree that the current situation is a bit hard to follow, I'd actually
> > > originally written things without the explict dependency because of that
> > > but Marc wanted the optimisation.
> > 
> > Well, I am not against the explicit dependency thing, it just looks odd 
> > to me that some save/restore have a dependency and it's counterpart does 
> > not. As well as the dependencies for both registers being different.
> 
> Hey I feel the question wasn't answered completely :)
> 
> Here is the reason for the asymmetric save restore (besides the tcr2
> part):
> 
> GCSCR
>  If guest E2H == 1:
>  - L1 accesses to GCSCR_EL2 and GCSCR_EL1 have the same intent -> they
>    both mean access the vCPU GCSCR_EL2.
>  - L1 access to GCSCR_EL2 (e.g. msr GCSCR_EL2, x0) traps, KVM updates
>    both the in-memory vCPU GCSCR_EL2, and the hardware GCSCR_EL1 for the
>    the guest. In-memory copy stays up to date.
>  - L1 access to GCSCR_EL1 does not trap -> in-memory vCPU GCSCR_EL2
>    becomes stale if it's a write.
>  - From above, must save on exit.
> 
>  If guest E2H == 0:
>  - Only L1 accesses to GCSCR_EL2 mean access the vCPU GCSCR_EL2.
>  - L1 accesses to GCSCR_EL2 always traps.
>  - In-memory vCPU GCSCR_EL2 always stay up to date.
>  - From above, no need to save on exit.
> 
> GCSPR
>  - Regardless of the guest E2H value, hardware could write to the
>    hardware GCSPR_EL1, making the in-memory vCPU GCSPR_EL2 stale.
>  - From above, must save on exit.
> 
> Restore is trivial, vCPU GCSCR_EL2/GCSPR_EL2 must be written to the
> hardware EL1 registers because someone else could be using it.
> 
> Quite a few other registers are saved only if guest E2H == 1 because of
> the same reason.
>

Ah, makes sense.
Thanks Wei-Lin!

