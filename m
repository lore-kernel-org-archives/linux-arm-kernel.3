Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C31CCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 14:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jn9rjZ7auH6k2Tiv9JWt/UdV9cmEs1gB2wZE8cBVyJM=; b=acVzbf/m6Nidt1k2/spBqSPK0q
	tXa26HGR4o+uKjouueNoCMVtH1j8Q6lYd91YXJT8hM9jwRvOV7co9GBSfFcFaumzM1OVMNqL0XPv0
	vgB6lddDfdv53nAjBcnnd3JRoNKagbFo3txIxofCFSEYVO+GdN/uWt5xaA/SflA+BT6bQ97AaPuwp
	jEDwXQto+zmqAeeJJTXhisZyt6ZzfbOOjSVjNIv7i6BncWvZ6XoPYsBq4wLhmbPb6ZtqQXgABmf89
	McOlNmdV0lir4DwPYDKxihJqscIeGgox1lZigCsxFGQGsWvjQPKh1yGTVSw6vFk0KtLhBQFPJK0A0
	1GMOLd2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRseW-000000029hu-0Hiw;
	Tue, 26 May 2026 14:21:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRseS-000000029hE-30w6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 14:21:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A69B169C;
	Tue, 26 May 2026 07:20:53 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D58D33F7B4;
	Tue, 26 May 2026 07:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779805258; bh=oKeqOBlOW8Be2H98W+ENHlID/l7YbOJiPsGt4yqgS+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F14nbYYPYB2LN8COACBdN+twjwuAYIeYGM2J8IXo78QE4ABzj31FapUzVEAbdR68/
	 vp89J59Lbka/24fD+2rVIhuJpEKbpJxb6Or8JQDk7VkpomwibdibkkRcNe87C/CqSW
	 6o4tvmW4yUVy510uaZnZh+LaHy1N+NcMfmkLyvic=
Date: Tue, 26 May 2026 15:20:52 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 02/30] arm64/fpsimd: Update FA64 and ZT0 enables when
 loading SME state
Message-ID: <ahWsRNb9uZhf46hG@J2N7QTR9R3>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-2-43f7683a0fb7@kernel.org>
 <ahWWqU51Zffmhlo5@J2N7QTR9R3>
 <d8074c6b-9bc9-496e-8a74-94ac18ce9a55@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8074c6b-9bc9-496e-8a74-94ac18ce9a55@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_072100_857862_694E0467 
X-CRM114-Status: GOOD (  26.09  )
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

On Tue, May 26, 2026 at 02:25:56PM +0100, Mark Brown wrote:
> On Tue, May 26, 2026 at 01:48:41PM +0100, Mark Rutland wrote:
> > On Fri, Mar 06, 2026 at 05:00:54PM +0000, Mark Brown wrote:
> 
> > > We provide a helper which does the configuration as part of a
> > > read/modify/write operation along with the configuration of the task VL,
> > > then update the floating point state load and SME access trap to use it.
> 
> > > +		if (fa64)					\
> > > +			__new |= SMCR_ELx_FA64;			\
> > > +		if (zt0)					\
> > > +			__new |= SMCR_ELx_EZT0;			\
> 
> > I'd strongly prefer that we make it the caller's responsiblity to track
> > all the bits within SMCR, rather than requiring each caller to pass a
> > bag of booleans.
> 
> I was explicitly going for the opposite of that in order to make it
> harder for someone implementing a future extension to miss a place where
> an update is required, having the callers independently constructing the
> register values feels like it's asking for trouble.

I didn't say callers should *construct* the value independently, and I
showed how to centralize the construction in a __task_smcr() function.

I think callers should pass the entire value around rather than a
collection of discrete booleans: constructing a collection of discrete
booleans is functionally equivalent to construction the entire value,
and we can more easily manage the construction and passing of the entire
value.

> > 	unsigned long __task_smcr(const struct task_struct *tsk)
> > 	{
> > 		unsigned long vq = sve_vq_from_vl(task_get_sme_vl(tsk));
> > 		unsigned long smcr = vq - 1;
> 
> I agree that's a better pattern for the main kernel - we could also do
> something similar with a task_set_smcr() which wraps the explicitly
> specifed version.

I don't think a task_set_smcr() function would gain much vs
using sysreg_cond_update_s(). I expect that we'd use the SMCR value as
the source of truth (and hence that would need to be generated outside
of task_set_smcr()), at which point either task_set_smcr() would be a
thin wrapper that just hides the register name, or it would generate the
value independently and obscure the connection.

I expect that what we should have eventually is something like:

	unsigned long smcr = __task_smcr(task);

	sysreg_cond_update_s(SYS_SMCR_EL1, smcr);

	if (za) {
		__sme load_za(sme_state);
		if (smcr & SMCR_ELx_EZT0)
			__sme_load_zt(sme_state);
	}

... or:

	const unsigned long smcr = __task_smcr(task);
	const bool zt0 = smcr & SMCR_ELx_EZT0;

	sysreg_cond_update_s(SYS_SMCR_EL1, smcr);

	if (za) {
		__sme load_za(sme_state);
		if (zt0)
			__sme_load_zt(sme_state);
	}

... where in either case it's clear at the function level that the value
programmed into SMCR matches what we're using for boolean decisions, and
it's clear at a higher level that functions are consistent given
consistent usage of __task_smcr().

> That would I think avoid most of the issue you're seeing?

I'm not sure what you mean here.

I don't think we need task_set_smcr(), and I'd prefer what I suggested.

Mark.

