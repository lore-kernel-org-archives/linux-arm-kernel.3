Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE12C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 13:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0UCDrBfwlTgT8eepnw8Z/wuSz0WDcHCOI0NGV60Kok=; b=uNKHGHkjr4mLN4kBlIF4M7oksK
	sSPx3W6CqK2H6RkY1W3Xxhu7W6JLp0Cy/oQlS36GJeXbHJ2hUhW4tNUYuluKZV080EGiwn1krWdyM
	DiO8U7Adm7MShddR5TNE9jFqOybbaPnRGOl/qmpIO9OYCZSZIK/Zxk1JJBrzpuOU9bmP9TFHVuLc5
	XuYpPdcSTeaT4r6LejipDPnWfZXGwmXLELeEzEUxMNg+9j/m+Zb5krNa4oKMYvA3eBZ3Em0C+thYa
	NgCQEcI2vvrDCgz5z/FZs2E9H2/kK2MX88dd7uVuYOhDLI5KyRzCEDGmh8LJIm+AYd7Kr4o1ZGTiG
	KHfj939Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2Nq-00000006V8H-13Ow;
	Thu, 06 Feb 2025 13:57:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1zQ-00000006Rmg-1yKY
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Feb 2025 13:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=f0UCDrBfwlTgT8eepnw8Z/wuSz0WDcHCOI0NGV60Kok=; b=QK8lLsA6rahf6S0jcHzEPxoVcQ
	mOwP/GJ5RlnVoFx+jeghJjkZMIAmip/elB6dLNtQkZzr5qWsS0upTqtM/2BW68iaN2ppwr1juCvmk
	diJ2cHJTrIJkd+KXCfa6HJTgTBnp6dgavXlr6wOcLzSYjazwyuNPmecMpdaU+jtox5JyLtCusfGmr
	c3x/6OMnZ9JhkKuPSXOcaLfe+M8UbkpDQmrQ8qtyeIS/jHynA4QJQkzKnXq6WMo6Ayezh51pBJv16
	O124vHZJblChIzMErD+e+2ka8GgJEIU5BhFmcB9/nuCvvSBAIdr7pHTsdHm+lC5HkuIGTsJ+i8sVJ
	eHej5zBQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1zN-0000000Gx6K-0Y0X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 13:32:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6E8DFEC;
	Thu,  6 Feb 2025 05:32:36 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 063D93F5A1;
	Thu,  6 Feb 2025 05:32:10 -0800 (PST)
Date: Thu, 6 Feb 2025 13:32:05 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, eauger@redhat.com, fweimer@redhat.com,
	jeremy.linton@arm.com, oliver.upton@linux.dev, pbonzini@redhat.com,
	stable@vger.kernel.org, tabba@google.com, wilco.dijkstra@arm.com,
	will@kernel.org
Subject: Re: [PATCH 7/8] KVM: arm64: Mark some header functions as inline
Message-ID: <Z6S5rAYd5dfibJhd@J2N7QTR9R3>
References: <20250204152100.705610-1-mark.rutland@arm.com>
 <20250204152100.705610-8-mark.rutland@arm.com>
 <b76803b7-c1b3-426b-a375-0c01b98142c9@sirena.org.uk>
 <Z6SJAkogWN9D7ZKf@J2N7QTR9R3>
 <86seortkve.wl-maz@kernel.org>
 <Z6SVGbr7cvrVnNMz@J2N7QTR9R3>
 <86r04btfyd.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86r04btfyd.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_133217_367963_048EA8DE 
X-CRM114-Status: GOOD (  22.86  )
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

On Thu, Feb 06, 2025 at 12:28:42PM +0000, Marc Zyngier wrote:
> On Thu, 06 Feb 2025 10:55:21 +0000,
> Mark Rutland <mark.rutland@arm.com> wrote:
> > 
> > On Thu, Feb 06, 2025 at 10:42:29AM +0000, Marc Zyngier wrote:
> > > On Thu, 06 Feb 2025 10:03:46 +0000,
> > > Mark Rutland <mark.rutland@arm.com> wrote:
> > > > That said, I'm going to go with the below, adding 'inline' to
> > > > kvm_hyp_handle_memory_fault() and using CPP defines to alias the
> > > > function names:
> > > > 
> > > > | static inline bool kvm_hyp_handle_memory_fault(struct kvm_vcpu *vcpu,
> > > > |                                                u64 *exit_code)
> > > > | {
> > > > |         if (!__populate_fault_info(vcpu))
> > > > |                 return true;
> > > > | 
> > > > |         return false;
> > > > | }
> > > > | #define kvm_hyp_handle_iabt_low         kvm_hyp_handle_memory_fault
> > > > | #define kvm_hyp_handle_watchpt_low      kvm_hyp_handle_memory_fault
> > > > 
> > > > I think that's clearer, and it's more alisnged with how we usually alias
> > > > function names in headers. Other than these two cases, __alias() is only
> > > > used in C files to create a sesparate exprted symbol, and it's odd to
> > > > use it in a header anyhow.
> > > > 
> > > > Marc, please should if you'd prefer otherwise.
> > > 
> > > Nah, that's fine by me.
> > > 
> > > My only issue was with marking functions as inline, and yet storing
> > > pointers to these functions. But it looks like the compiler (GCC 12.2
> > > in my case) is doing a good job noticing the weird pattern, and
> > > generating only one function, even if we store multiple pointers.
> > 
> > That's fair -- I'm fairly certain that we do this elsewhere too, but I
> > can switch to __maybe_unused if we're worried that might bite us in
> > future?
> 
> Sure, that'd be equally fine.

Looking around, we don't seem to do that elsewhere for functions in
headers, so I'll stick with inline for now unless anyone has a strong
opinion.

I'll send out v2 shortly.

Mark.

