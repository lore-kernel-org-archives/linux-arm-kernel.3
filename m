Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4478CCD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 10:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHWHch/qko4wao+fS50y7d50pedNNAlWeE+oNJVyWiY=; b=Hy1KBm6gMU9LWZ/cIn68UlwBaN
	ObR3erq2w3mZzR1wQhQ79SIbgCUw5Zwkm/R6bletdK6ATBDQ9bVqWwby2q/EiUDy2kCHotqUcrqgi
	JIT5o18M2AzaDfKFLP3HMEgH9U9svn5ef5oqgiGebVcRoxyQXgey/LoiBdprJ87j5oewUoaEo5pCn
	1vkRD80s0IoAly1GsgVFtbbA8VgMIRH/Mn0bxd9bmS+ajljMwMuayWaYkzhHiwwRfHHJpBS528xwM
	4oYVBg4dgtPPdHqt0mfB/wmpR7SAorFY9xwKvN8dZ0FZ1l0gr7KQog8jofI5F9yJ/2/kQNq19ny3X
	xA6m1ZJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMO3Z-0000000D86z-12oW;
	Mon, 11 May 2026 10:40:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMO3W-0000000D86E-1HBK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 10:40:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75A2E16F2;
	Mon, 11 May 2026 03:40:03 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F384E3F836;
	Mon, 11 May 2026 03:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778496008; bh=qIBIaoZMw/edt0QBmUc5C+O+459IgUULanpiPn179Hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AZqdSIPcNDUt2vsK0aBBMNGq9ftbYQkLtJzZEzpQyfsNIjrAIFSQvILVMNzfskFEI
	 3FSQiqKU+OjtNIqZZdvzkW0W9FwO3XyBsK96xa0zZ+jH7MmqlpmVwr9Vzdo88s+c3e
	 Y04PU7WiXTlkgUqc0fJH/a8rXBHvUWHvl79a6z4o=
Date: Mon, 11 May 2026 11:40:02 +0100
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
Subject: Re: [PATCH v10 01/30] arm64/sysreg: Update SMIDR_EL1 to DDI0601
 2025-06
Message-ID: <agGyAvutI1GOCQkI@J2N7QTR9R3.cambridge.arm.com>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-1-43f7683a0fb7@kernel.org>
 <af4ZYVFsbYlEfdOu@J2N7QTR9R3>
 <af6DH_j7pyEm4HyI@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af6DH_j7pyEm4HyI@sirena.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_034010_434332_E227AAB2 
X-CRM114-Status: GOOD (  21.07  )
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

On Sat, May 09, 2026 at 09:43:11AM +0900, Mark Brown wrote:
> On Fri, May 08, 2026 at 06:12:01PM +0100, Mark Rutland wrote:
> > On Fri, Mar 06, 2026 at 05:00:53PM +0000, Mark Brown wrote:
> 
> > > Update the definition of SMIDR_EL1 in the sysreg definition to reflect the
> > > information in DD0601 2025-06. This includes somewhat more generic ways of
> > > describing the sharing of SMCUs, more information on supported priorities
> > > and provides additional resolution for describing affinity groups.
> 
> > FWIW, these are all in ARM DDI 0487 M.b:
> 
> >   https://developer.arm.com/documentation/ddi0487/mb/
> 
> > Is anything later in the series going to depend on these fields, or
> > would everything behave correctly with the existing RES0 field
> > definitions?
> 
> We're exposing the affinity fields so there's a build time issue.

What I'm asking is what is the rationale for updating these definitions?
e.g.

* Are we planning to use any of the fields in a specific way in the
  *host*?

* Are we planning to use any of the fields in a specific way in the
  *guest*?

* Is this updated just out of habit?

Knowing the rationale would help with review, even if that rationale is
just "it seemed nice to use the latest".

> > > +Field	55:52	HIP
> 
> > Reading the ARM ARM, HIP is arguably a backwards-incompatible change.
> 
> Yes, I belive people are aware.

Ok. Is that considered a problem, or accepted?

Which people are aware?

> > Do we expect to expose that to VMs, or just hide priorities entirely? I
> > suspect we probably want to require that the guest sees
> > SMIDR_EL1.SMPS==0, and not care about any of that.
> 
> Currently we're not exposing priority support to guests so we don't need
> to worry about it yet.

Do we plan to in future?

Mark.

