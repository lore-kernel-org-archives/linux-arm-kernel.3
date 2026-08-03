Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF58C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 06:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQ0u9RCRBxphehlJ1yHWTu9jZ9026hEwytYiN383DBo=; b=b+7bkS/lShmhUNQ3IihdeyHkhz
	NX4HXvhxkemZ286/rq92qS7hjQwhKJEu7mCry5ZngjHQwR4UVHZv5IBDDS6ODCYbLoqPeibLQGsNB
	Pa1aYzp7hGbyb7UtSIth6X8jQLruLHUrzQQ9Wmu+k67XSSnHU82wtEMSd+xh/RiSVwEIVbvVkvr9z
	RuBpwK4U1onRAT7rB/4J9m6LTFLshstkMLGWpQnaMrmXFywP3zkadmFXbh9suH0ELC1BiCrqtEaPp
	EtlvDAbfRpX7s+covP8iltGeFVUVp1vQUobsH7KmrryM772/QM8kcwlXuJfGRfF2jgHNuQFXBYxAs
	6gS60Cew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqloy-0000000GPh5-1e59;
	Mon, 03 Aug 2026 06:06:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqlox-0000000GPgy-0PP2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 06:06:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D69FC43AE3;
	Mon,  3 Aug 2026 06:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6ED51F00A3A;
	Mon,  3 Aug 2026 06:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785737202;
	bh=xQ0u9RCRBxphehlJ1yHWTu9jZ9026hEwytYiN383DBo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=QYpu7V/9aoGGqVblJxfLdPmLPkto8elkoTJne92EFdDWcQY9QxnEISShMWCieWU0d
	 W4DPROsoZx0dKWlWL38m3Re+cz4JdItglud/RDmk8AHtzewRqBuvg1HzphOXbiWgMI
	 tkuj2w7hcPjQxABtASsu4UpY+d5wIamtu8eMIwFiJ12CftqniOiluWcuLCc8cbHpYJ
	 Jn3NIGIEyZQfZrttrSlC6BwuLQ0W3OMBkEu1YmzPG2mYdQc8zrgur/KhhRvtjjtpmL
	 SR+kcgKicCIW3PZFnMgGUknqQzl2wOnVAUE1YfbRkFSLdLwD5f/sKpw7Z7c2QpaMpY
	 l6zQNGigishCg==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>,
	Jack Thomson <jackabt.amazon@gmail.com>
Cc: maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com,
	joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	corbet@lwn.net, vladimir.murzin@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	isaku.yamahata@intel.com, Jack Thomson <jackabt@amazon.com>
Subject: Re: [PATCH v5 2/5] KVM: arm64: Add pre_fault_memory implementation
In-Reply-To: <alEXtW7w-rqlNG09@raptor>
References: <20260612162354.73378-1-jackabt.amazon@gmail.com>
 <20260612162354.73378-3-jackabt.amazon@gmail.com>
 <alEXtW7w-rqlNG09@raptor>
Date: Mon, 03 Aug 2026 11:36:33 +0530
Message-ID: <yq5acxvz4u1i.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Alexandru Elisei <alexandru.elisei@arm.com> writes:

> Hi Jack,
>
> On Fri, Jun 12, 2026 at 05:23:50PM +0100, Jack Thomson wrote:
>> From: Jack Thomson <jackabt@amazon.com>

....

>> +		if (kvm_is_error_hva(hva)) {
>> +			ret = -EFAULT;
>> +			goto out;
>> +		}
>> +
>> +		s2fd.hva = hva;
>> +		ret = user_mem_abort(&s2fd);
>
> If is_protected_kvm_enabled(), this function doesn't check if the mapping
> already exists. user_mem_abort() will call **p**kvm_pgtable_stage2_map()
> (emphasis is mine) to create the mapping, and pkvm_pgtable_stage2_map() will
> return -EAGAIN, and keep returning -EAGAIN until the mapping is destroyed, which
> might be some time away.
>
> Same thing happens **without** pKVM, kvm_pgtable_stage2_map() will return
> -EAGAIN if the mapping exists. But that's not such a big issue, when the
> user calls KVM_PRE_FAULT_MEMORY on the remaining range
> kvm_pgtable_get_leaf() will detect the existing mapping. Which you have
> already taken into consideration judging by the comment, so all good here.
>

But both gmem_abort() and user_mem_abort() handle -EAGAIN internally, don't they?

For gmem_abort(), we have:

1692:	return ret != -EAGAIN ? ret : 0;

For user_mem_abort(), the call path is:

user_mem_abort()
  -> kvm_s2_fault_map()
    -> KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, ...)

and kvm_s2_fault_map() does:

2111:	if (ret != -EAGAIN)
		return ret;
	return 0;

-aneesh

