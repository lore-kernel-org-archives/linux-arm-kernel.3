Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27679C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTEhBchTLneopez9pbOvyypG5Yj5i0XvkQJ4fytigDE=; b=iEX/SE0vgcBWDlTRRyrZM9fP8d
	Dy6XdgppZ3dorDAo1l79sR42Ra4e9euya6WN93rLiqlZWYZFPg0N6JGypwPibxPhqDfLAeA8s5qht
	i0KFHtK1YKGwf6L+7I6FueV2zVUFc3OPwLvJ/725jGaGMt/VlA5gNzaG7fxo0Qen+Zx5177jgZOwX
	ncvkKnLqbjZ2zzptVUL4u9Xq4JjtKja+SCec5UjGb0zMiikWFP55c1aK2kjvQtz0ASfl6xmP1bXRM
	ptFmLQ6+MzfNQBcMZ+bUUmCcxaCkmwSA6hJ32KLCnRIeIPvdmixdf4IA+ODqUTkgmAZz7FIm82T92
	U9vSoPjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoxG-0000000EQQ7-3Tet;
	Tue, 11 Aug 2026 16:03:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoxE-0000000EQPW-0vOD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 16:03:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAE4D1516;
	Tue, 11 Aug 2026 09:03:44 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D96803F86F;
	Tue, 11 Aug 2026 09:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786464228; bh=e7Z+l/mTt+5Pf3Y1BUH3J9fnuA6QlidiOwjauwgkWhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xxn4tmxRk8DDeLoDWJgLcSjvqgphcHHVSsLy9W3k5A933OGBP25O9NacR3PR0oDK3
	 ukIq7VgR7qCS4RSCWK4DChBI13S4mlFzVtMR+R0w67k3zZwG691gS+zt/F9N80ybn3
	 y48X7w43mZz/dl4gMIp+oztTAkaA7JJMYvorezEE=
Date: Tue, 11 Aug 2026 17:03:43 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Jack Thomson <jackabt.amazon@gmail.com>, maz@kernel.org,
	oupton@kernel.org, pbonzini@redhat.com, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	corbet@lwn.net, vladimir.murzin@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	isaku.yamahata@intel.com, Jack Thomson <jackabt@amazon.com>
Subject: Re: [PATCH v5 2/5] KVM: arm64: Add pre_fault_memory implementation
Message-ID: <antH38FPSmAZ0nrB@raptor>
References: <20260612162354.73378-1-jackabt.amazon@gmail.com>
 <20260612162354.73378-3-jackabt.amazon@gmail.com>
 <alEXtW7w-rqlNG09@raptor>
 <yq5acxvz4u1i.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5acxvz4u1i.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_090352_296728_B1ECCF1F 
X-CRM114-Status: GOOD (  19.72  )
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

Hi Aneesh,

On Mon, Aug 03, 2026 at 11:36:33AM +0530, Aneesh Kumar K.V wrote:
> Alexandru Elisei <alexandru.elisei@arm.com> writes:
> 
> > Hi Jack,
> >
> > On Fri, Jun 12, 2026 at 05:23:50PM +0100, Jack Thomson wrote:
> >> From: Jack Thomson <jackabt@amazon.com>
> 
> ....
> 
> >> +		if (kvm_is_error_hva(hva)) {
> >> +			ret = -EFAULT;
> >> +			goto out;
> >> +		}
> >> +
> >> +		s2fd.hva = hva;
> >> +		ret = user_mem_abort(&s2fd);
> >
> > If is_protected_kvm_enabled(), this function doesn't check if the mapping
> > already exists. user_mem_abort() will call **p**kvm_pgtable_stage2_map()
> > (emphasis is mine) to create the mapping, and pkvm_pgtable_stage2_map() will
> > return -EAGAIN, and keep returning -EAGAIN until the mapping is destroyed, which
> > might be some time away.
> >
> > Same thing happens **without** pKVM, kvm_pgtable_stage2_map() will return
> > -EAGAIN if the mapping exists. But that's not such a big issue, when the
> > user calls KVM_PRE_FAULT_MEMORY on the remaining range
> > kvm_pgtable_get_leaf() will detect the existing mapping. Which you have
> > already taken into consideration judging by the comment, so all good here.
> >
> 
> But both gmem_abort() and user_mem_abort() handle -EAGAIN internally, don't they?

I think you're right, please ignore my comment about an existing mapping with
is_protected_kvm_enabled().

Thanks,
Alex

