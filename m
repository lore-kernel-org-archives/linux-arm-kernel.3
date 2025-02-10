Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E04DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 15:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ge7e4daqj3rc2Cti9GJ90KErDXMeTsvoJh1lEpBu6Ew=; b=TJDk8aJxGxrPYyQZbeHJw5FLO+
	XGFatVwqaamE9FFiB4+vRqwwHAUae0Bcw6xmHq0Oy4uenFBQTzYIhATDkPBmTak4we/D3I6CrRiuc
	kP2qoAne6qKucJjTp2cSOxXbjZz4PON3FJg+KwOC4X1Dr/z9PlEeai+NQURHOyUBOtg10pwnqx/OJ
	ranwqptwEZOZdKCMiOptLAZAazS/ZfZjGpzPuVbS0f4ROoBlSrixejc/VzKhvOhFr6q8r/VtmMmLK
	YdGq1fu35UCvkh7aKxI8MtVys9cfxwZLdNjGL61pmZ4TOWtgw1cJ4VhCWHAxo2951NgrppsTkg35a
	TwEDlCQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thVNZ-00000000FLN-1L7F;
	Mon, 10 Feb 2025 15:07:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thVM9-00000000F9T-3DmJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 15:05:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 93B995C589D;
	Mon, 10 Feb 2025 15:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66CEFC4CED1;
	Mon, 10 Feb 2025 15:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739199952;
	bh=P/ctmUMjn+LOgAtQLjjXfPgljir4CfZIfvWihq/RQb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XKVbmOEI+9xMj+B/ZBdUanCUsJXeJ+tf3xSjizF7XHiidiI0oCjKLm1rvsiVJfmks
	 Y+6YTMM7M0nndvs4nmZXPvP4HUWANgBQkZNsObDuJRCfbenFYz8Q//TKwEnMDzZK/u
	 2H3xt80ZZq//MaB+IQAEY1QziAYcQHDKFz4Ee9Y/D4zUll2Uoy9RRiom8xNjJxRu7D
	 eU5jyozckEhcyirSm81+Hqxlofaj1+qKdZUIc5iELmVgvi+hTb31STOnmu2m4cH4Ng
	 C9n2T00pSwv+yycAYqQIrwLjASQbVHKThshzOtyZt7uYt/dyskcF/CQdS2pgiXFjB/
	 z+lg2fAIgYl1A==
Date: Mon, 10 Feb 2025 15:05:47 +0000
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, eauger@redhat.com, eric.auger@redhat.com,
	fweimer@redhat.com, jeremy.linton@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, pbonzini@redhat.com, stable@vger.kernel.org,
	tabba@google.com, wilco.dijkstra@arm.com
Subject: Re: [PATCH v2 1/8] KVM: arm64: Unconditionally save+flush host
 FPSIMD/SVE/SME state
Message-ID: <20250210150546.GB7568@willie-the-truck>
References: <20250206141102.954688-1-mark.rutland@arm.com>
 <20250206141102.954688-2-mark.rutland@arm.com>
 <20250207122748.GA4839@willie-the-truck>
 <Z6YI6IvG_N4txgz7@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6YI6IvG_N4txgz7@J2N7QTR9R3>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_070553_890295_7AF1ABCB 
X-CRM114-Status: GOOD (  29.70  )
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

On Fri, Feb 07, 2025 at 01:21:44PM +0000, Mark Rutland wrote:
> On Fri, Feb 07, 2025 at 12:27:51PM +0000, Will Deacon wrote:
> > On Thu, Feb 06, 2025 at 02:10:55PM +0000, Mark Rutland wrote:
> > > There are several problems with the way hyp code lazily saves the host's
> > > FPSIMD/SVE state, including:
> > > 
> > > * Host SVE being discarded unexpectedly due to inconsistent
> > >   configuration of TIF_SVE and CPACR_ELx.ZEN. This has been seen to
> > >   result in QEMU crashes where SVE is used by memmove(), as reported by
> > >   Eric Auger:
> > > 
> > >   https://issues.redhat.com/browse/RHEL-68997
> > > 
> > > * Host SVE state is discarded *after* modification by ptrace, which was an
> > >   unintentional ptrace ABI change introduced with lazy discarding of SVE state.
> > > 
> > > * The host FPMR value can be discarded when running a non-protected VM,
> > >   where FPMR support is not exposed to a VM, and that VM uses
> > >   FPSIMD/SVE. In these cases the hyp code does not save the host's FPMR
> > >   before unbinding the host's FPSIMD/SVE/SME state, leaving a stale
> > >   value in memory.
> > 
> > How hard would it be to write tests for these three scenarios? If we
> > had something to exercise the relevant paths then...
> >
> > > ... and so this eager save+flush probably needs to be backported to ALL
> > > stable trees.
> > 
> > ... this backporting might be a little easier to be sure about?
> 
> For the first case I have a quick and dirty test, which I've pushed to
> my arm64/kvm/fpsimd-tests branch in my kernel.org repo:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/
>   git://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
> 
> For the last case it should be possible to do something similar, but I
> hadn't had the time to dig in to the KVM selftests infrastructure and
> figure out how to confiugre the guest appropriately.
> 
> For the ptrace case, the same symptoms can be provoked outside of KVM
> (and I'm currently working to fix that). From my PoV the important thing
> is that this fix happens to remove KVM from the set of cases the other
> fixes need to care about.
> 
> FWIW I was assuming that I'd be handling the upstream backports, and I'd
> be testing with the test above and some additional assertions hacked
> into the kernel for testing.

The backporting for Android will probably diverge slightly from upstream,
so if I'm able to run your tests as well then it would really handy.
Thanks for sharing the stuff you currently have.

The patch looks fine:

Acked-by: Will Deacon <will@kernel.org>

Will

