Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B93CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HAFQuoEKspwLRd/H9Kd3b5OWJp44kKNa44M7zP9QiWg=; b=yXKKOMS0S1ya0Pblj0iJxyDTFn
	XfxSnd0sfKvX8Q1ZoQLl+34ZKX53GqzYgJFEouM26BjLfsfr2ZWvKbts9jFwjG0GdOdgJfudwj4S4
	FKa78BHW1No8TQ+Nf5o47TDHjOvg70NILPo3cDMSo9F490mOh8bXAvc+85vKDHtCJWib/q3++KCHC
	af7fj/uLCcGTWxlG0q+HWdOCe6iRlN1RwEErRAJJHfHBeCpYWBSF1Y1hFBC/7lF4iDO75k0G/Xwn8
	iQQfdEeKY/nFS06zFkmRgA5G+YYZCdxlpUXe9xf58KY0nvX5QK5Ya/5qZRcNqVfkBKXW6wUPG7uLA
	BDwB4dGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw27W-000000096tC-1EWM;
	Tue, 09 Sep 2025 17:27:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1l0-00000008jDr-1G6J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 17:03:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AEB5260224;
	Tue,  9 Sep 2025 17:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D7AC4CEF4;
	Tue,  9 Sep 2025 17:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757437429;
	bh=0ePioIJRedWiKF0fn+IJE4meuWisJGQBNojm9/VTE8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3+ngas/LmfCKgPZgS169nXNhfUMi1tMAVKGAMExa9X/38EsL7MfulBUMkwfZZoTe
	 EF6V/mhI34Ox2QTO9s9jc+vlIXF1iuc7UwoqLnxIiQguFuweWprRw9rDy817jTfk4M
	 +22dYEsWWFJ4SmAw6+NxxjrOaTJgppaHnzoQ6sq0bZ0+t4O/hmpBdDCb7sk0blDggh
	 GMPw7BByEmf61rxXpP8B25vPJW51PtIaDk4RgueiveFEskvx7pnKkwrWw3TkkflV8B
	 JJxHYM0pcgdmUCgJCUMDnq5/i3ijSytnVEEweecUgcNsdSmlPYQcO2xSxFkJcaRF+c
	 0HJX8bWWEnw5w==
Date: Tue, 9 Sep 2025 18:03:44 +0100
From: Will Deacon <will@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	alim.akhtar@samsung.com, Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: [PATCH] soc: samsung: exynos-pmu: Fix for CONFIG_DEBUG_PREEMPT
Message-ID: <aMBd8NT78_Svcy71@willie-the-truck>
References: <20250905162446.88987-1-smostafa@google.com>
 <19a6f296-eb40-49cf-9571-2d7964cd3313@kernel.org>
 <aLshJ11k3c2T-MRs@google.com>
 <84332e77-cfd2-4090-a3c0-114a9eb5422a@kernel.org>
 <aL_-N43BTtQynMS_@willie-the-truck>
 <52222467-4fc0-4a53-9682-a935ec8f1a44@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52222467-4fc0-4a53-9682-a935ec8f1a44@kernel.org>
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

On Tue, Sep 09, 2025 at 05:43:16PM +0200, Krzysztof Kozlowski wrote:
> On 09/09/2025 12:15, Will Deacon wrote:
> > Krzysztof,
> > 
> > On Sat, Sep 06, 2025 at 09:07:02AM +0200, Krzysztof Kozlowski wrote:
> >> On 05/09/2025 19:43, Mostafa Saleh wrote:
> >>>>>
> >>>>> As this value is only read once, it doesn't require to be stable, so
> >>>>
> >>>> Why it does not need to be stable? Onlining wrong CPU number is not
> >>>> desired...
> >>>>
> >>>>> just use "raw_smp_processor_id" instead.
> >>>>
> >>>> You might be just hiding some other real issue, because above stacktrace
> >>>> is from gs101_cpuhp_pmu_online() which IRQs disabled and preemption
> >>>> disabled. Provide analysis of the warning, instead of just making it
> >>>> disappear.
> >>>
> >>> Not sure I understand, how is preemption disabled? that wouldn't fire
> >>> in that case.
> >>
> >> Because there is explicit preempt_disable().
> > 
> > Where do you see that?
> 
> I did look at the code.
> 
> All the calls I saw (including calltrace from commit msg) were under raw
> spinlock and raw spinlock does:
> 
> preempt_disable();

The backtrace doesn't contain a raw spinlock. As Peter subsequently
pointed out, the reported issue has been fixed in linux-next and there's
a raw spinlock there but since the report is from vanilla -rc4, it
doesn't have that fix.

Will

