Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F9BCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+OMMv4ayOB9XN84RqKkzGwvOckJPEaGej6oVc9CDd28=; b=ORd11ijGRtCRsOmVdgeJrU5MKl
	fVZrRRjIyFWkznMubD7fXDhl1NN8/FOowN0jVNRBZpQRRNC5CwmzRj769jdDCjl1FZORRsFzTRFes
	QYhTxBUHzD4OnkFHgK3oKx5DWfSvPyE4I5LyZadi+1+A59PbgltX1vZNSpLpzZpiu+ieppEr63s4J
	ef8+AIZncpUOpZkyQcLlfYg7xlf90J34rgABosIrXmuQdJrhbCQFTIP1c1eoG7FjmTsb62ZAvx2po
	sPvPMM3Ek0L8nT0NyjHclZr3+E8eBWYAOJ+wwn1UzvFm3r6bkSVg2FTM/MeVYTwxOhopIU+kVVgms
	yJPYEI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBF9c-00000001AFm-2IdT;
	Mon, 28 Sep 2026 17:28:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBF9Z-00000001AEa-0pYu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:28:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4497D1655;
	Mon, 28 Sep 2026 10:28:32 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B4EC3F763;
	Mon, 28 Sep 2026 10:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790616515; bh=NOwlg1fLIhsJpwRRWJEx28YKpYmKtZ7WGDsI1WtfweU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JYxAo8jR8/FlcEOgF0lfNeAhVBe1YM6gGqbAJOGgGoAcD5TwzeszFXE3Luz4YDa0X
	 Ii/FE5eavzr3+dGKMrbQA2TWWA6/IxxcwbgeXhtUiWM9WbdL+yBH7ESoJ6RA3MNwWo
	 qBK3Y8YEHYJu6sms16eIB8qUYi/47RJEbNZY0ywA=
Date: Mon, 28 Sep 2026 18:28:21 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
	Gareth Stockwell <Gareth.Stockwell@arm.com>
Subject: Re: [PATCH v19 4/7] firmware: arm_rmm: Add support for SRO
Message-ID: <arqjteW-Y5u2XX2r@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-5-suzuki.poulose@arm.com>
 <arozNIQ-fQ0XQViI@arm.com>
 <4fabad44-280f-40e6-95bb-49011cd2f185@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fabad44-280f-40e6-95bb-49011cd2f185@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_102837_500698_A0EE92D1 
X-CRM114-Status: GOOD (  29.27  )
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

On Mon, Sep 28, 2026 at 11:13:39AM +0100, Suzuki K Poulose wrote:
> On 28/09/2026 10:28, Catalin Marinas wrote:
> > On Thu, Sep 24, 2026 at 02:51:58PM +0100, Suzuki K Poulose wrote:
> > > +long rmi_sro_memxfer_execute(struct rmi_sro_state *sro, gfp_t gfp)
> > > +{
> > > +	struct arm_smccc_1_2_regs *regs = &sro->regs;
> > > +	bool cancelled = false;
> > > +	unsigned long sro_handle;
> > > +
> > > +	rmi_smccc_invoke(regs);
> > > +
> > > +	sro_handle = regs->a1;
> > > +	while (RMI_RESULT_STATUS(regs->a0) == RMI_INCOMPLETE) {
> > > +		bool can_cancel = RMI_RESULT_CAN_CANCEL(regs->a0) == RMI_OP_CAN_CANCEL;
> > > +		int ret = 0;
> > > +
> > > +		switch (RMI_RESULT_MEMREQ(regs->a0)) {
> > > +		case RMI_OP_MEM_REQ_NONE:
> > > +			rmi_op_continue(sro_handle, RMI_CONTINUE_KEEP_GOING,
> > > +					regs);
> > > +			break;
> > > +		case RMI_OP_MEM_REQ_DONATE:
> > > +			ret = rmi_sro_donate(sro, sro_handle, regs->a2, regs,
> > > +					     gfp);
> > > +			break;
> > > +		case RMI_OP_MEM_REQ_RECLAIM:
> > > +			ret = rmi_sro_reclaim(sro, sro_handle, regs);
> > > +			break;
> > > +		default:
> > > +			WARN_ON_ONCE(1);
> > > +			ret = -ENXIO;
> > > +			break;
> > > +		}
> > 
> > Another thing I came across while looking whether we can defer the
> > activation. It seems that the spec (I_JVYCH) lists some SROs as
> > PE-bound. Nothing here or in rmi_sro_execute() disables migration and
> > the memory allocation paths can even sleep with GFP_KERNEL.
> 
> No, this is not required. I agree this is confusing. I will get it
> clarified.
> 
> So, there are two different sources for the SRO contexts. One is a global
> pool and the other an Object.
> 
> e.g., For an RMI operation on an Object, SRO context can be the object
> itself (e.g., REC_CREATE, REALM_ACTIVATE etc.)
> 
> However, when there is no reliable object for the command (e.g.,
> RMI_GRANULE_RANGE_DELEGATE), the RMM must allocate a context from
> the global pool. Now, the "PE" in there comes from a recommendation
> to the RMM implementations, that the global pool size must depend on
> the number of PEs on the system. This doesn't mean that the SRO
> handles are only bound to those PEs. I will get this clarified
> in the RMM spec.

This part of the spec needs rewriting, not clarifying. No matter how
hard you try, there's no way you can read it as a "global pool". For
example:

D_GZLMRA	SRO context is bound to one of the following:
		  - A PE
		  - An RMM object

And take a random command:

B4.5.2 RMI_DPT_L0_CREATE command
	Create a Level 0 DPT.
	The RMI_DPT_L0_CREATE command may initiate a Stateful RMI
	Operation whose context is bound to the current PE.

"bound to the current PE" pretty clearly shows the intention was to
disable preemption. It also doesn't say what happens when this pool is
exhausted (presumably it returns RMI_BLOCKED).

TBH, that's a pretty significant change for a bet3/4 release, though
arguably it can be seen as a relaxation. Code that relies on disabling
preemption should still work (somewhat, assuming the global pool is at
least the number of PEs and the host plays nicely to complete or cancel
all SROs).

That said, such pool is a limited resource and we need some way to probe
its size if we want to do something smarter in the kernel, like a
semaphore to ensure we don't randomly fail because of an RMM limitation.
I don't really see how the number of PEs is relevant to this global
pool sizing, it's not that we limit the realms we can start to the
online CPUs.

-- 
Catalin

