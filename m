Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C00C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 08:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Umudae46qma0rLnaRVWxf7e3jia6FAzRnuS7p9TokA=; b=H1iC5cPObdaNEO5Syfb6Bo/IUC
	ljRCRG3yq/UHZ4cc5cYUCgxxK8gC0QGGhNoGwr00iVpPI4M3eees3A12iQ0qsL7UpqSppl7uQHNvk
	Xcl6njieLKAHDlFNxxvXgh5Wbcd1OcOPSNwg6AmS8qpgoDjOb/hcxa0XKEB7AGBXsY726Muqz8PtR
	a0Dv2TQeUSO783gdisFnCGBxQdJGWcrpLRq+T01SP1UzeufJIbQ7gVl8nszQM7Yfoqs0se95vu5c8
	hPv8DcFuZ1HKaXPIEp33d0Zcsrxvm6MbqZe9nab95vu59NuGxTUmeH8o0c6WufcxRkzaRLeBhjyu7
	u+V/Mc8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCde-00000002r34-17uO;
	Wed, 26 Feb 2025 08:19:30 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCNa-00000002nfQ-17cm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 08:02:56 +0000
Date: Wed, 26 Feb 2025 00:02:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740556969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Umudae46qma0rLnaRVWxf7e3jia6FAzRnuS7p9TokA=;
	b=LEbWlcYA/kwL0+Fm2RuHPUtbPKnbItPI79RipLsu1pS47dqdSjSQ8gDnqkxvtplo2or/RV
	UKoKrt4pplEDmiZdQKHI5fTY5qgtqGvgeJS13Qe/ruKny/tsNRY2r/xPswD0QLCnj+zM4c
	SjqUw5T+7KalbBZl3ANYvDz9+kL2uS0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH] KVM: arm64: Drop mte_allowed check during memslot
 creation
Message-ID: <Z77Kox18iINqlp6L@linux.dev>
References: <20250224093938.3934386-1-aneesh.kumar@kernel.org>
 <Z7xSfVME4z2ComUm@arm.com>
 <86ldtvr0nl.wl-maz@kernel.org>
 <Z7yElHKrJGn8XuPS@arm.com>
 <86jz9fqtbk.wl-maz@kernel.org>
 <yq5aseo3gund.fsf@kernel.org>
 <86ikozqmsl.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ikozqmsl.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_000254_805260_8AFC6F31 
X-CRM114-Status: GOOD (  17.80  )
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

On Mon, Feb 24, 2025 at 05:23:38PM +0000, Marc Zyngier wrote:
> On Mon, 24 Feb 2025 16:44:06 +0000, Aneesh Kumar K.V <aneesh.kumar@kernel.org> wrote:
> > What if we trigger a memory fault exit with the TAGACCESS flag, allowing
> > the VMM to use the GPA to retrieve additional details and print extra
> > information to aid in analysis? BTW, we will do this on the first fault
> > in cacheable, non-tagged memory even if there is no tagaccess in that
> > region. This can be further improved using the NoTagAccess series I
> > posted earlier, which ensures the memory fault exit occurs only on
> > actual tag access
> > 
> > Something like below?
> 
> Something like that, only with:
> 
> - a capability informing userspace of this behaviour
> 
> - a per-VM (or per-VMA) flag as a buy-in for that behaviour
> 
> - the relaxation is made conditional on the memslot not being memory
> (i.e. really MMIO-only).

I pretty much agree with you here but I think the flag ought to be a
per-memslot thing (rather than VMA or VM). Rather than open up the
entire memory attributes space to userspace we could just have a flag to
prevent cacheable mappings for the memslot.

Similar to how MTE is enforced today, we can have a shared check between
memslot creation && the abort path that'd require VM_MTE_ALLOWED for any
'cacheable memslot'. Failing memslot creation still is the clearest
signal of misuse to the VMM, IMO.

Thanks,
Oliver

