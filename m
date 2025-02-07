Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4D3C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 13:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIut1vF30iBskdP1qYKWwC1gLNoW9XCGYmwvjuv1dEw=; b=s8/2KqZpl1Q8uqEzQ3+1C/+VHl
	2IOdGTBgv0h1frdrzEN/OaJYJfuqcUTDtaO5+fP+v5CyBXKCvFB+xbvdcgHT61zGpiWQdrluCFuDw
	Su5wLD2DH1EeYE5k1IcO2VJQvoM1XvdsV6fIpwe4Syu8pUtph3U/tY+7r2aPMbXlUBFakaiOInhgq
	54ZLAjjWg2sQO1d6YtDdZxc+zIvngnKrY1OWqWAhQAFaYgN+iaTuJ7fXnNnls+4ClVK6KPZ7Vp4HX
	MkNxwwJYqMu128slj59yLLTaNYp+0SkcDv+sx0G7DDLOmECVyjnTOczP+3cmIy1VCG4Mry3vK/Q+m
	pD2sElag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOKH-00000009dWR-29Gq;
	Fri, 07 Feb 2025 13:23:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOIt-00000009dJ5-1fWP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 13:21:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEB8E113E;
	Fri,  7 Feb 2025 05:22:15 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A0E43F63F;
	Fri,  7 Feb 2025 05:21:50 -0800 (PST)
Date: Fri, 7 Feb 2025 13:21:44 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, eauger@redhat.com, eric.auger@redhat.com,
	fweimer@redhat.com, jeremy.linton@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, pbonzini@redhat.com, stable@vger.kernel.org,
	tabba@google.com, wilco.dijkstra@arm.com
Subject: Re: [PATCH v2 1/8] KVM: arm64: Unconditionally save+flush host
 FPSIMD/SVE/SME state
Message-ID: <Z6YI6IvG_N4txgz7@J2N7QTR9R3>
References: <20250206141102.954688-1-mark.rutland@arm.com>
 <20250206141102.954688-2-mark.rutland@arm.com>
 <20250207122748.GA4839@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207122748.GA4839@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_052155_481584_8ACB9673 
X-CRM114-Status: GOOD (  23.78  )
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

On Fri, Feb 07, 2025 at 12:27:51PM +0000, Will Deacon wrote:
> On Thu, Feb 06, 2025 at 02:10:55PM +0000, Mark Rutland wrote:
> > There are several problems with the way hyp code lazily saves the host's
> > FPSIMD/SVE state, including:
> > 
> > * Host SVE being discarded unexpectedly due to inconsistent
> >   configuration of TIF_SVE and CPACR_ELx.ZEN. This has been seen to
> >   result in QEMU crashes where SVE is used by memmove(), as reported by
> >   Eric Auger:
> > 
> >   https://issues.redhat.com/browse/RHEL-68997
> > 
> > * Host SVE state is discarded *after* modification by ptrace, which was an
> >   unintentional ptrace ABI change introduced with lazy discarding of SVE state.
> > 
> > * The host FPMR value can be discarded when running a non-protected VM,
> >   where FPMR support is not exposed to a VM, and that VM uses
> >   FPSIMD/SVE. In these cases the hyp code does not save the host's FPMR
> >   before unbinding the host's FPSIMD/SVE/SME state, leaving a stale
> >   value in memory.
> 
> How hard would it be to write tests for these three scenarios? If we
> had something to exercise the relevant paths then...
>
> > ... and so this eager save+flush probably needs to be backported to ALL
> > stable trees.
> 
> ... this backporting might be a little easier to be sure about?

For the first case I have a quick and dirty test, which I've pushed to
my arm64/kvm/fpsimd-tests branch in my kernel.org repo:

  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/
  git://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git

For the last case it should be possible to do something similar, but I
hadn't had the time to dig in to the KVM selftests infrastructure and
figure out how to confiugre the guest appropriately.

For the ptrace case, the same symptoms can be provoked outside of KVM
(and I'm currently working to fix that). From my PoV the important thing
is that this fix happens to remove KVM from the set of cases the other
fixes need to care about.

FWIW I was assuming that I'd be handling the upstream backports, and I'd
be testing with the test above and some additional assertions hacked
into the kernel for testing.

Mark.

