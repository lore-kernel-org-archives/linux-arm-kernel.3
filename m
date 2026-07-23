Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E58BC531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 12:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNu4AL/uewkiZtGkh2fpagGZMwP69erarEj4eFG+SJY=; b=PBav0uN0TCJk0WU86ebx24YkWB
	jnAILXeFH4CNUFWliJdFhctR7tlHheFnRob9tHP9G3CykI4GPURYnDBlN4BYTJMvUNY9aCZwMGNjW
	0aJ4bS2tO0h6HUCDME/1oY0+ovdC3g7Bb4qrxScFVK9qOGGEf4G0ofbbwFkGeew1nMwo9jjI8rgjn
	aeJgvMs/sjud05mKf5/7gN3gyYIyzkJantKa1yCvTSfWyeU4FzKgomy4RxQ1UrVYOR8hKzYJIFvD3
	m5r4hTIQnWoa8Pso25PdCDwZv8fW0RCEba90Y64G7D58tWfhmrUzfSuG1yiQg9/NEQ2KvlYq6Fq9P
	PqCQx+sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmspl-0000000EGbj-3bn6;
	Thu, 23 Jul 2026 12:47:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmspj-0000000EGb3-0XlW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 12:47:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51E5B1477;
	Thu, 23 Jul 2026 05:47:21 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4370C3F59E;
	Thu, 23 Jul 2026 05:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784810845; bh=mrznInikKy6iTtOxpPkZv1/eMcCQH6Im1cZaGR2HfOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BU7FQVN1QzAGQumaT96kwn9zDT9Xhs0sS3ZHg5P5MYa0tjPDw39V9AZjJRV/QKzrR
	 LXp02yyo+DVLRpHP0A7hgRfk5aknzMhHQs1eAOwrhNWSeWW9eoWSeyaFtpygjL68Vt
	 N9qLLIM9oEVUS78dbKNnvI96Ws7rXo8Q/A3H4pFQ=
Date: Thu, 23 Jul 2026 13:47:19 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v12 02/29] arm64/fpsimd: Update FA64 and ZT0 enables when
 loading SME state
Message-ID: <amINV-ZyUDXQW3Xg@J2N7QTR9R3.cambridge.arm.com>
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
 <20260709-kvm-arm64-sme-v12-2-d0301d79ef58@kernel.org>
 <ali39DG6qie7XTuD@J2N7QTR9R3.cambridge.arm.com>
 <15a9ae14-395d-472a-a5be-9e46524fb493@sirena.org.uk>
 <3c76650f-ddda-47ae-a676-86016d8e39a6@sirena.org.uk>
 <CA+EHjTw9rGvQyev-4i7zkO5bPPZKGYn858485dCs8iHmCi0t3w@mail.gmail.com>
 <43f21c65-c5ba-44a3-9741-548390df369b@sirena.org.uk>
 <87a4rnqsuu.wl-maz@kernel.org>
 <18229974-b26d-4eed-82f7-7af7e1c26634@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18229974-b26d-4eed-82f7-7af7e1c26634@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_054727_245473_48C11A8C 
X-CRM114-Status: GOOD (  21.99  )
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

On Sun, Jul 19, 2026 at 01:40:21PM +0100, Mark Brown wrote:
> On Sun, Jul 19, 2026 at 09:35:53AM +0100, Marc Zyngier wrote:
> > Mark Brown <broonie@kernel.org> wrote:
> 
> > > I've gone and implemented the first which will suppress the isb() for
> > > current host kernel SME usage, the second two are starting to get more
> > > fiddly than seems sensible to do right now.
> 
> > I really wish you didn't optimise anything at all at this stage.
> 
> > "Optimisation" is exactly what got us into so much trouble over the
> > past two years, and I really don't want SME in KVM to follow the same
> > trajectory.
> 
> > So leave this is a straight ISB, no optimisation. Once you come back
> > with actual data showing that this is a terrible bottleneck affecting
> > real workloads on real HW, we'll look at it. But until then, please
> > keep it as stupid as possible.
> 
> I've already left the KVM hypervisor code like that - I only updated the
> code here in the main kernel since that keeps the end effect for
> existing systems and workloads the same.  I am aware that there has been
> a great deal of attention paid to the barriers we have in the context
> switch path so I am concerned that other people might have a different
> view on adding one.

FWIW, my view is:

(1) We shouldn't make speculative optimizations. Removing unnecessary
    code is fine, within reason, but we shouldn't be adding conditional
    logic.

    To that end, I'd be happier with an unconditional ISB here.

(2) Optimizations should be benchmarked to some extent, such that we can
    decide whether the trade-off is worthwhile.

(3) In this path specifically, if adding an ISB is a problem, then it
    calls the wider approach into question.

Is there anyone in particular that you expect feecback from w.r.t.
barriers in this path?

Mark.

