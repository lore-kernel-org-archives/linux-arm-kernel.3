Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C699C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 10:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YypeQYO1BYBUpGsMYWlLoj/BZphfyCseHnz1AZ8JmU=; b=xstkGij9qrQA0z3FRqjGU9YXQa
	bMI/E8BW0WhWV1wgwXoTkgiBReAIbKd6fD0vj0+V5J9I8jOZigNb5C2/tdKDmrhhBv3PJBr7QsDaP
	gsR46IW2kYXDHtBU3FFztZ0SxkvI3B3YZg1u/y7uMDpYlW8swIDQKi52wjoViA+KyOyFdTelLFv7v
	exfMyXVnld32wEDpC4xDDzr7iKSt2MkzAgUkiIW2LAVb6nxJ7MgVbcPw5SGICbKviquf8ENJkZ5iB
	s4LoMO0vNn9PBT46TO0VN3YCTA+zP37MSMt+Waf/8r6UdaT5ugdrCiuy2xoFpMABpMt+BZKuMWK1X
	DN9s+89w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tisX9-0000000EQmg-3nJq;
	Fri, 14 Feb 2025 10:02:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tisPn-0000000EP4X-1Igj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 09:55:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B95C113E;
	Fri, 14 Feb 2025 01:55:38 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43AEF3F6A8;
	Fri, 14 Feb 2025 01:55:17 -0800 (PST)
Date: Fri, 14 Feb 2025 09:55:12 +0000
From: Leo Yan <leo.yan@arm.com>
To: Rob Herring <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v19 10/11] KVM: arm64: nvhe: Disable branch generation in
 nVHE guests
Message-ID: <20250214095512.GI235556@e132581.arm.com>
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
 <20250202-arm-brbe-v19-v19-10-1c1300802385@kernel.org>
 <20250213170316.GG235556@e132581.arm.com>
 <CAL_JsqLG4gu6c6=x_wG6XT0WaCC_ahH5eWHk3K9RcF0ZQrDR=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLG4gu6c6=x_wG6XT0WaCC_ahH5eWHk3K9RcF0ZQrDR=A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_015519_399266_06E52B45 
X-CRM114-Status: GOOD (  26.13  )
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

On Thu, Feb 13, 2025 at 05:16:45PM -0600, Rob Herring wrote:

[...]

> > > +static void __debug_save_brbe(u64 *brbcr_el1)
> > > +{
> > > +       *brbcr_el1 = 0;
> > > +
> > > +       /* Check if the BRBE is enabled */
> > > +       if (!(read_sysreg_el1(SYS_BRBCR) & (BRBCR_ELx_E0BRE | BRBCR_ELx_ExBRE)))
> > > +               return;
> > > +
> > > +       /*
> > > +        * Prohibit branch record generation while we are in guest.
> > > +        * Since access to BRBCR_EL1 is trapped, the guest can't
> > > +        * modify the filtering set by the host.
> > > +        */
> > > +       *brbcr_el1 = read_sysreg_el1(SYS_BRBCR);
> > > +       write_sysreg_el1(0, SYS_BRBCR);
> > > +}
> >
> > Should flush branch record and use isb() before exit host kernel?
> 
> I don't think so. The isb()'s in the other cases appear to be related
> to ordering WRT memory buffers. BRBE is just registers. I would assume
> that there's some barrier before we switch to the guest.

Given BRBCR is a system register, my understanding is the followd ISB
can ensure the writing BRBCR has finished and take effect.  As a result,
it is promised that the branch record has been stopped.

However, with isb() it is not necessarily to say the branch records have
been flushed to the buffer.  The purpose at here is just to stop record.
The BRBE driver will take care the flush issue when it reads records.

I agreed that it is likely barriers in the followed switch flow can assure
the writing BRBCR to take effect.  It might be good to add a comment for
easier maintenance.

> > I see inconsistence between the function above and BRBE's disable
> > function. Here it clears E0BRE / ExBRE bits for disabling BRBE, but the
> > BRBE driver sets the PAUSED bit in BRBFCR_EL1 for disabling BRBE.
> 
> Indeed. This works, but the enabled check won't work. I'm going to add
> clearing BRBCR to brbe_disable(), and this part will stay the same.

Seems to me, a right logic would be:

- In BRBE driver, the brbe_disable() function should clear E0BRE and
  ExBRE bits in BRBCR.  It can make sure the BRBE is totally disabled
  when a perf session is terminated.

- For a kvm context switching, it is good to use PAUSED bit.  If a host
  is branch record enabled, this is a light way for temporarily pause
  branch record for the switched VM.

Thanks,
Leo

