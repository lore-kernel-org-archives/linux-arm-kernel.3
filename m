Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044E9C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 14:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIHBCGmc9sEvZj2GIJYJ/EaEbp+wrFG92+Meyud1dUY=; b=WxqHViKporB9FZUpjTGbLpPXjP
	GoLUB6gdO82TzuQyenmHimzekf197hoUwLgABPR5Hbl7CunpMb+XsHENGwQTW97gZwx23yqKES8Sb
	CKkdQpvwRO1QYktCoO9J679EMQMfgHr/b4B9Qg+v+LMcsKqVdmO633FBKNTzwnW/NKZ93zZ56jd4B
	nNX1KhocfWJo7TPrk3ZwysEDUhlbTvP1XCOcVJah1pfkJYLRrqIu0TFSF+r8BdN4Z9lQeSS9hRPnr
	jCYVCXXgXTuVkAZOJA2XfaJT+wKa7sBKmptp5dibdInMA6eLTFW4HDPr4CiR5GM26Eav+rdk7u1bL
	SoqPo8pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3lD-0000000BhmC-3X8b;
	Thu, 20 Aug 2026 14:28:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3lB-0000000Bhlh-1xVH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 14:28:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABDB0153B;
	Thu, 20 Aug 2026 07:28:40 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F31903F85F;
	Thu, 20 Aug 2026 07:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787236124; bh=j7vXC94xLC094gowguZtlDsLgDSpj+ra95W3BzjDxVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H7CDUD6wGZ5VKrAa+aKPBjAVtsC54NTefYiyFrrhqBatxPHWP1zaZfdQiSbEdTEes
	 YhQnNCiKSRNV/geqiVkxRIY6dxZuDf0fE5e4wr7aYUyEf3qtCf7kU9F15d4vI9hMAt
	 MpI6oNq7/r07ILxe0J+Xnm/z7mldM2NVCf4P+DlA=
From: Leonardo Bras <leo.bras@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
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
Date: Thu, 20 Aug 2026 15:28:39 +0100
Message-ID: <aocOi3wjcliZqoe7@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <97ad6e83-b22b-4881-b644-66fa99f68d64@sirena.org.uk>
References: <aoXamcdKoMynTkpX@LeoBrasDK> <48be9e5d-357a-4863-8682-8b3f34c69723@sirena.org.uk> <aobUGyq8nInJYkdA@LeoBrasDK> <97ad6e83-b22b-4881-b644-66fa99f68d64@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_072849_661128_96B85245 
X-CRM114-Status: GOOD (  35.29  )
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

On Thu, Aug 20, 2026 at 03:07:14PM +0100, Mark Brown wrote:
> On Thu, Aug 20, 2026 at 11:16:59AM +0100, Leonardo Bras wrote:
> > On Wed, Aug 19, 2026 at 05:46:00PM +0100, Mark Brown wrote:
> 
> > > This is just because there isn't a preexisting ctxt_has_tcrx() check
> > > already there, FEAT_GCS architecturally depends on FEAT_TCRX and there
> > > was a request to make this explicit in the code to try to optimise
> > > things a bit.  The compiler should skip over both blocks at once if TCRX
> > > isn't there rather than having two separate tests or static branches.  I
> > > didn't add new checks where there were none since I expect that to be
> > > unhelpful for code generation, you'd get the reverse situation and emit
> > > two checks.
> 
> > Humm, but then why saving GCSPR_EL2 does not depend on TCRX/E2H? Or maybe a 
> > better question, why are not GCSPR_EL2 and GCSCR_EL2 saved in the same 'if' 
> > clause under ctxt_has_tcrx() (and E2H set), if they are restored in the 
> > same 'if' clause?
> 
> > As you mentioned, GCS depends on TCRX, so it should be fine, but just by 
> > reading the code I see:
> > - GCSCR_EL2 :
> > 	Save if 	GCS=1, TCRX=1, E2H=1
> > 	Restore if 	GCS=1, TCRX=1
> > - GCSPR_EL2 :
> > 	Save if 	GCS=1,
> > 	Restore if	GCS=1, TCRX=1
> 
> > Which looks kind of confusing for the as a first time reader.
> 
> > Does it make sense?
> 
> I agree that the current situation is a bit hard to follow, I'd actually
> originally written things without the explict dependency because of that
> but Marc wanted the optimisation.

Well, I am not against the explicit dependency thing, it just looks odd 
to me that some save/restore have a dependency and it's counterpart does 
not. As well as the dependencies for both registers being different.

>  There's similar things with other
> registers in the current code (eg, the PIE and POE registers are in the
> same situaton as GCSCR_EL2).  One thing I did miss here is some nesting
> inside the PIE checks for EL2, I'll update for that.
> 

Awesome!

> I think what would help here would be to move to generating more of the
> save/restore sequences rather than open coding them, we could have lists
> of registers and then use data about the feature dependencies that the
> architecture has (hopefully it's already in the MRS, I didn't check) to
> generate these optimised feature checks rather than having to open code
> them.  Possibly even list features and generate some of the register
> lists, though that would need far more special case handling and it's
> *much* less clear if there could be a benefit.

Yeah, that would automatize the feature dependency for register loading, 
but maybe code would not be that clear on how it works? I have questionable 
taste, though.

Thanks!
Leo

