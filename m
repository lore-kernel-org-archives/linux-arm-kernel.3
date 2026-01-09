Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B52D1A632
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 14:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BetIMDp9WVltAxFN7Fr/P2FIKONFdfy3aXJW1YHIhGc=; b=jce1Z9KAdqEKrwYajz1OzZQUeN
	iNY3ie+qvfl3mjnc0EjUg3mmSUrIQ0PLqcxJREwgt2XdxRiiHytaX8Hb9nGRn2YbmgvlkuLSWyVQZ
	4FxtFLo0FJp5B7rHmmOzQOHY5N4BOWOvR/SO44aWyuO0pzXjAzaTEoG/QldwGCVJKSKnPZmM8xHZd
	cCpLDmvIMOijk2DPvKrU4zdfKUKWpuzDviOg7LjYWFwPzbUw3FOarLsy3BKjKSy0QU1W1ZWEs4Phg
	+OlrWF8UOL4WE6tlziNKkFCUaydrl1EQVoIj37gwvRwzWwv5jdq1tnfNVmfDIJvaqRLz05KHaUEKM
	KmwiT2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDVx-00000002Pb1-2wRm;
	Fri, 09 Jan 2026 14:30:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDVu-00000002Pad-2fJf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 14:30:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9478943E91;
	Fri,  9 Jan 2026 14:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2301CC4CEF1;
	Fri,  9 Jan 2026 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767969053;
	bh=WRMdRB0WGfKqmMwZE2T0s3rmNl/KXUBkFrpSMhObnwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SUrPBhq1CEgxQCSYoCG7gEf6kyj7n6NyJdfnTyJYW2KQu+ya+3jlF4/TRpKzqp1/v
	 UI59BPREbt8kFaFuYpqrxwyXLbEMJ5u4o4QqpDfapdnhZZqkebKhWtoxRxFYgCVIFT
	 4zlXLarv/4zOJ+Uhhz3a8r+mdjUaAUs3x1zi5LM7cKwNErcJysuNob3u62rwjF/jF7
	 CHAexiWjjjTugv59dlY83T1XJOhMYfpB18fsD9Rt9HZaDZAyvekYTNl7GfQ127M3lA
	 CVW6Tt/k1mYBloqNkqPu1o8AuiNWy639+k4yVDM6mNrMO6CS6hfiMfrCOCVzKLstlX
	 6AawgeGxb6aNA==
Date: Fri, 9 Jan 2026 14:30:47 +0000
From: Will Deacon <will@kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 10/30] KVM: arm64: Introduce __pkvm_host_donate_guest()
Message-ID: <aWERFx9PwX1yED9H@willie-the-truck>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-11-will@kernel.org>
 <ocpyeygxhp52jt2mcqq4tmdodubrfdwo4xqvbphmr34x4etrkk@f3ag3a7j5fru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ocpyeygxhp52jt2mcqq4tmdodubrfdwo4xqvbphmr34x4etrkk@f3ag3a7j5fru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_063054_699252_5DEF9B9D 
X-CRM114-Status: GOOD (  12.87  )
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

On Tue, Jan 06, 2026 at 02:48:00PM +0000, Quentin Perret wrote:
> On Monday 05 Jan 2026 at 15:49:18 (+0000), Will Deacon wrote:
> > +static void handle___pkvm_host_donate_guest(struct kvm_cpu_context *host_ctxt)
> > +{
> > +	DECLARE_REG(u64, pfn, host_ctxt, 1);
> > +	DECLARE_REG(u64, gfn, host_ctxt, 2);
> > +	struct pkvm_hyp_vcpu *hyp_vcpu;
> > +	int ret = -EINVAL;
> > +
> > +	hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
> > +	if (!hyp_vcpu)
> 
> I guess we should check this is a protected VM here, else a malicious
> host could donate pages to an np-guest. I didn't try to think through
> the implications, perhaps it's fine, but it feels unecessary so I'd say
> let's be restrictive here.

It's definitely harmless to add the check, but it's also hard to justify
in my opinion. Can you think of anything that can actually go wrong it
a malicious host donates memory to a non-protected guest? Generally,
I think the fewer places where we have to distinguish between a
protected and a non-protected guest in the hypervisor, the better.

Will

