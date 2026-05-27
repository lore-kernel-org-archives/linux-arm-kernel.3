Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F82CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 13:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEXnNHs5dg8Xzjf1xUM5GsxBu1PIUT1eTAauIbJ0Ydg=; b=kJg85s3GPH+R6X9lYiVu+nxGcJ
	kdVtaDC5QN6CD5iCBJP9pG1EGmcL4r4MOoITUtoGwEpFi3+P/gMk/ZKjyEOntaiWKrO1rRS5IJEKb
	/jqu/X1zs7QF07DWki1U/1GZzudrKYX8H8JHqdBAeltGecsZ9gjWv+5eGJufxBynXe1Upi93ZAy74
	nTNrqSrcrmKAMz5ZuTt2xqWBclQtgHts/Ix/uGNlwdvw9PWv1YVGshHIgBmJEAAN4r55VMMn72P0W
	rJfsjYc6sy7erIEXFVtOe4e4fzJKDw002xFP1ADzpIk4U6hr61168+nQjs/UkLo/qwOQ4C18FlQxx
	xVIUiRKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEfS-00000004Eo6-1lAj;
	Wed, 27 May 2026 13:51:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEfQ-00000004Eo0-2soj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 27 May 2026 13:51:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cEXnNHs5dg8Xzjf1xUM5GsxBu1PIUT1eTAauIbJ0Ydg=; b=ayAi8KMZOW0cXCg2xKg5jlPHAy
	gdgC2Yse2ojLRD6uDKPyX9unok4r7Gs86FpdrLChi4XCLn2pDLwwaya1hOxJm0vsfqsb8Z9p7BOdZ
	yHEuOfE3/YNOltj5PBmzBrpWcmwKuY5km51IZ9krVJS2b45dd/VRD2Rvfegc/HtcVp9Oo2aXJxiVt
	xUiQz1JHzFHLb+u8R7E8IQeYsUyU4WURpf3ft8wsmphJZ+iXNyxxSdrKrRGJGbgMpqW1vf2hWv2fi
	XLk6Z/uSOICzA+ywvTL8sFwWURFSNlxcym+HhukB6N1TaoJoJt0RD3JKtBPs0yTkrDwvFmOlt58Wu
	8cCXAOEg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEfM-0000000E6BC-2hqH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 13:51:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED6BD1476;
	Wed, 27 May 2026 06:51:16 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF79E3F632;
	Wed, 27 May 2026 06:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779889882; bh=V3HB6iLMVHAA7gn4GBr6f7/tZojBIfmMAzZbcfC/w9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vwat4lPYs2jzHm7qrJLrAOOcOPT/JD6y2gRKek1AMOL1wD2IajIQ4O+CjkLHy6bbK
	 cg9RbjgvugQ5N7hZZ3ZHH8DOekk/cGr3eqc9eMe97umlJmaU9JxKg2maTZAzcO/lFw
	 A2LgmLjExxkKEq12p7lSSWjpyeYjC9ILi8WGER3Y=
Date: Wed, 27 May 2026 14:51:13 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 11/18] arm64: fpsimd: Split FPSR/FPCR from SVE
 save/restore
Message-ID: <ahb20fXkdWI7SljE@J2N7QTR9R3.cambridge.arm.com>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-12-mark.rutland@arm.com>
 <0b72df66-2914-4537-811e-2080e0a7ce6c@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b72df66-2914-4537-811e-2080e0a7ce6c@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_145125_539993_9A30DC91 
X-CRM114-Status: GOOD (  28.77  )
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

On Tue, May 26, 2026 at 05:28:21PM +0100, Mark Brown wrote:
> On Thu, May 21, 2026 at 02:25:49PM +0100, Mark Rutland wrote:
> > Regardless of whether the vector registers are saved in FPSIMD or SVE
> > format, we store FPSR and FPCR in user_fpsimd_state::{fpsr,fpcr}.
> 
> ...
> 
> > Note that the SVE assembly sequence for restoring FPCR uses an
> > unconditional write to FPCR. The plain FPSIMD assembly sequence has used
> > a conditional write to FPCR since 2014 in commit:
> 
> >   5959e25729a5 ("arm64: fpsimd: avoid restoring fpcr if the contents haven't change")
> 
> > ... but this was not followed for the SVE restore assembly implemented
> > in 2017 in commit:
> 
> >   1fc5dce78ad1 ("arm64/sve: Low-level SVE architectural state manipulation functions")
> 
> > ... so I've assumed that this doesn't actually matter in practice, and
> > implemented the C version matching the existing SVE assembly.
> 
> > For the moment, fpsimd_save_state() and fpsimd_load_state() are left
> > as-is with their own logic to save/restore FPSR and FPCR. This will be
> > unified in subsequent patches.
> 
> There is a possibility that it only matters for older, FPSIMD only CPUs
> or just that nobody got round to benchmarking this on physical CPUs with
> SVE and in fact a similar optimisation is also useful there.

All of that might be true, but that doesn't change my assessment that
this doesn't seem to matter in practice, and given that the overall goal
of this series is to *simplify* things, I'd much rather err towards that
than hypothetical performance concerns.

> I'm a bit wary of dropping the optimisation without any verification
> of the performance impact, but equally I'm not aware of a specific
> benchmark that showed the impact or even if there was one in the first
> place.  The changelog sounds like the optimisation might've been
> written based on inspection alone, I don't know if anyone will
> remember more than a decade later.

From what I remember, the changes in commit 5959e25729a5 were made based
on intuition, inspired by a contemporary retrospective change to the
architecture that made FPCR self-synchronizing. Previously the
architecture required a context synchronization event for the write to
take effect, but implementations happened to be stronger.

The conditional write isn't necessarily a win, because the cost of
recovering from a branch mispredict can be much larger than the cost of
micro-architectural mechanisms to ensure that FPCR is
self-synchronizing.

> Having said all that given that a conditional update is simple to
> implement in C it seems safer to add one in the SVE path than to drop
> it from the FPSIMD path.

I agree that if we need to, it would be simple to add this.

For now I'm going to leave this as-is given the rationale I originally
provided. This patch specifically doesn't change the existing behaviour.
I don't think this matters in practice, we haven't consistently applied
this approach to FPCR (or other similar registers), and omitting this
makes the code simpler.

Mark.

