Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A29C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 16:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k18LaEbxwAGxN8n53OMyFCA5tEmlgwWlPW6S8U1kWcE=; b=TP9iewKnba6eZMrLlvUscPjiZ3
	Uy+DmuzLWGwMwTzPTvR7fv9RH7ZHzFtZjKsF7SEv/02kpbHgjGWyYWtMNu2Wm4ZUPY9rcpzkkDLr/
	6mhk8DtSeSDg4KL+IC9l1G4iAUY2g92fd7r7neCF+FMVgYNxTw7l0YuL+mRy9Pm7w+TOyOdvlDYs2
	/UiiqjOPrygU3NLYgOFhgBADqq50yYI8tCBs1AfiE5M5EXlS0kS9XRVDXIH8KnO6dGZqsTSR+LvL5
	Wlgvhhd+ZnKYXRWGDze6pDnXfZMSwumFqOwB251E+kQsEPU/3m2feBcYLdrjPgKtCTD91FNAdRUiq
	toZXstXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sw8-00000009oT0-3B9D;
	Wed, 16 Sep 2026 16:56:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sw3-00000009oQO-1vLe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 16:56:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 386EA1476;
	Wed, 16 Sep 2026 09:56:33 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE4803FAA1;
	Wed, 16 Sep 2026 09:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789577796; bh=9fSY0YtZszmnwmnH72T2AXZffe4pzVRSX07T/e91g2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vef64xh9KpWL2pmX8x3XXeNP4dknBKucoXLhzKgP8teEasVYgR9XZfcGfJUzoKvj4
	 i0/ODhioxM1eIhQIAitKxdZrFXMdEimBOUh2fwKYciRlYZdBxTX72iTZbsWkTBen4V
	 tdy5aVDJnMqpujftXrCqeSXXJH5WsRVooO60ju9U=
Date: Wed, 16 Sep 2026 17:56:30 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18] arm64: mm: Handle Granule Protection Faults (GPFs)
Message-ID: <aqrKPkMPeHdtCVGg@arm.com>
References: <20260913070459.2547407-1-suzuki.poulose@arm.com>
 <aqrGPK0lFBFXL2qY@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqrGPK0lFBFXL2qY@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_095639_538014_E88AB641 
X-CRM114-Status: GOOD (  11.86  )
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

On Wed, Sep 16, 2026 at 05:39:31PM +0100, Catalin Marinas wrote:
> On Sun, Sep 13, 2026 at 08:04:58AM +0100, Suzuki K Poulose wrote:
> > +static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
> > +{
> > +	if (!user_mode(regs) && !is_el1_instruction_abort(esr) &&
> > +	    fixup_exception(regs, esr))
> > +		return 0;
> > +
> > +	return 1;
> > +}
> 
> We discussed briefly offline. With the latest patches around, would we
> ever end up with private memory mapped in the VMM and hence the GPF? If
> not, I would still keep this handling but add a
> WARN_ON_ONCE(user_mode(regs)).

Actually, even better:

	WARN_ON_ONCE(is_ttbr0_addr(untagged_addr(far)));

to capture uaccess. The user_mode() test you have above can stay the
same.

-- 
Catalin

