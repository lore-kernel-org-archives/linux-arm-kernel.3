Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FEDC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 00:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrHXGfXq/zm2zKe8cC9mO86sR2J5ITnGUn0IL2hxjQ8=; b=ooqLIx2ZrfoipxjnjSpe1BuRPR
	K/lDHoU51j5pRu1OOpR7wXhwPyM3z58HvCG5Ca7fu8jbg8IJlFzEijiyN1KoeaGqqNkS32ejfpRlq
	2j+/oI4iZa3ygZsw85mbMO7PRiufpyzV00fQ9lb1XqdX+Kwv2dbhdVPjhVRr4DNLoHtP6rrGLJd4j
	39rg+j6yulBPLqiacoqJc93Fq/x/TlOCMIafPIpSAU4SuuUNWdD1IW1m7ANenETsE5Swh1ZH6EEZD
	QdesCiphBWMZ8Rmo2CY8ivRnn3ET4O8MVW7lfTtPwftEErJjLYJy96lcYpOVRtfxvmvgGerDDRX0g
	2KbghQRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCM5-0000000CMOE-4BRj;
	Thu, 20 Aug 2026 23:39:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCM2-0000000CMNW-2ml9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 23:39:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF9CB202C;
	Thu, 20 Aug 2026 16:39:17 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8C753F763;
	Thu, 20 Aug 2026 16:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787269161; bh=N9bzHgTPT7M5yE8AGOin8doDdx+BxPy1gflF77tWeWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PjPN+x0cxlDOswhIzxMCFYv/hiq2OPnMflZZyAmGlXpZI138ae27wQt0tkiIDbEsd
	 qoymqmWY4oFuX5oDW+1M09I8WaO8CCjK4bVluvkOct9CuAx4+dFfNT+J9rB036STEV
	 AWYWdESLhUmNcc5u9Ryl84d1s6h2vct2UnVunHWg=
Date: Fri, 21 Aug 2026 00:39:08 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Leonardo Bras <leo.bras@arm.com>, Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Oliver Upton <oupton@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v19 03/14] KVM: arm64: Manage GCS access and registers
 for guests
Message-ID: <hwz52absjxap7n6olwt3lmjakmtgxxaku5gcofsrcfa45zdygh@dqgylcillnud>
References: <aoXamcdKoMynTkpX@LeoBrasDK>
 <48be9e5d-357a-4863-8682-8b3f34c69723@sirena.org.uk>
 <aobUGyq8nInJYkdA@LeoBrasDK>
 <97ad6e83-b22b-4881-b644-66fa99f68d64@sirena.org.uk>
 <aocOi3wjcliZqoe7@LeoBrasDK>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aocOi3wjcliZqoe7@LeoBrasDK>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_163926_862470_53ACCDCE 
X-CRM114-Status: GOOD (  43.13  )
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

On Thu, Aug 20, 2026 at 03:28:39PM +0100, Leonardo Bras wrote:
> On Thu, Aug 20, 2026 at 03:07:14PM +0100, Mark Brown wrote:
> > On Thu, Aug 20, 2026 at 11:16:59AM +0100, Leonardo Bras wrote:
> > > On Wed, Aug 19, 2026 at 05:46:00PM +0100, Mark Brown wrote:
> > 
> > > > This is just because there isn't a preexisting ctxt_has_tcrx() check
> > > > already there, FEAT_GCS architecturally depends on FEAT_TCRX and there
> > > > was a request to make this explicit in the code to try to optimise
> > > > things a bit.  The compiler should skip over both blocks at once if TCRX
> > > > isn't there rather than having two separate tests or static branches.  I
> > > > didn't add new checks where there were none since I expect that to be
> > > > unhelpful for code generation, you'd get the reverse situation and emit
> > > > two checks.
> > 
> > > Humm, but then why saving GCSPR_EL2 does not depend on TCRX/E2H? Or maybe a 
> > > better question, why are not GCSPR_EL2 and GCSCR_EL2 saved in the same 'if' 
> > > clause under ctxt_has_tcrx() (and E2H set), if they are restored in the 
> > > same 'if' clause?
> > 
> > > As you mentioned, GCS depends on TCRX, so it should be fine, but just by 
> > > reading the code I see:
> > > - GCSCR_EL2 :
> > > 	Save if 	GCS=1, TCRX=1, E2H=1
> > > 	Restore if 	GCS=1, TCRX=1
> > > - GCSPR_EL2 :
> > > 	Save if 	GCS=1,
> > > 	Restore if	GCS=1, TCRX=1
> > 
> > > Which looks kind of confusing for the as a first time reader.
> > 
> > > Does it make sense?
> > 
> > I agree that the current situation is a bit hard to follow, I'd actually
> > originally written things without the explict dependency because of that
> > but Marc wanted the optimisation.
> 
> Well, I am not against the explicit dependency thing, it just looks odd 
> to me that some save/restore have a dependency and it's counterpart does 
> not. As well as the dependencies for both registers being different.

Hey I feel the question wasn't answered completely :)

Here is the reason for the asymmetric save restore (besides the tcr2
part):

GCSCR
 If guest E2H == 1:
 - L1 accesses to GCSCR_EL2 and GCSCR_EL1 have the same intent -> they
   both mean access the vCPU GCSCR_EL2.
 - L1 access to GCSCR_EL2 (e.g. msr GCSCR_EL2, x0) traps, KVM updates
   both the in-memory vCPU GCSCR_EL2, and the hardware GCSCR_EL1 for the
   the guest. In-memory copy stays up to date.
 - L1 access to GCSCR_EL1 does not trap -> in-memory vCPU GCSCR_EL2
   becomes stale if it's a write.
 - From above, must save on exit.

 If guest E2H == 0:
 - Only L1 accesses to GCSCR_EL2 mean access the vCPU GCSCR_EL2.
 - L1 accesses to GCSCR_EL2 always traps.
 - In-memory vCPU GCSCR_EL2 always stay up to date.
 - From above, no need to save on exit.

GCSPR
 - Regardless of the guest E2H value, hardware could write to the
   hardware GCSPR_EL1, making the in-memory vCPU GCSPR_EL2 stale.
 - From above, must save on exit.

Restore is trivial, vCPU GCSCR_EL2/GCSPR_EL2 must be written to the
hardware EL1 registers because someone else could be using it.

Quite a few other registers are saved only if guest E2H == 1 because of
the same reason.

Thanks,
Wei-Lin Chang

> 
> >  There's similar things with other
> > registers in the current code (eg, the PIE and POE registers are in the
> > same situaton as GCSCR_EL2).  One thing I did miss here is some nesting
> > inside the PIE checks for EL2, I'll update for that.
> > 
> 
> Awesome!
> 
> > I think what would help here would be to move to generating more of the
> > save/restore sequences rather than open coding them, we could have lists
> > of registers and then use data about the feature dependencies that the
> > architecture has (hopefully it's already in the MRS, I didn't check) to
> > generate these optimised feature checks rather than having to open code
> > them.  Possibly even list features and generate some of the register
> > lists, though that would need far more special case handling and it's
> > *much* less clear if there could be a benefit.
> 
> Yeah, that would automatize the feature dependency for register loading, 
> but maybe code would not be that clear on how it works? I have questionable 
> taste, though.
> 
> Thanks!
> Leo

