Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E648D33990
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3Ap0dCDGyTIaFljWEI2grCUam1dPoRNwXaJnbcWcrE=; b=EG2I8gRAaIB7m1J5EYu4uPf9eK
	2ICRB9ighayw3Mz7nKCvZwTcpnNTghF23U1DG70KAk8C6SB7gf1z33teZOMHcXHwFd8r2eo11i++N
	AjqLPmoKR7wzUCojXjeKqY0Yq65cY7Z4MYK7JZLSdR3sk0KYvujWunQlnhehf0PW43m0IO22hc35+
	O/DjFikW1QTOqE+1qJ/y4OCX9oacUYNv8nCwpNcvgaVkb4eMNXZPASWgVNFy14OpURMYTREHCgiZn
	1QbBpGOFDvtvMIZ+qV05MwuZspm5Zw8ik/4fUoc25VFfQJ0OdRZ1u7yOmix09dLuOQ/uFvy9VGWof
	G2dojyUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RUU-0000000BHJF-45lR;
	Mon, 28 Oct 2024 15:17:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5R6I-0000000BCPZ-2TXP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:52:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 84585A42658;
	Mon, 28 Oct 2024 14:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48140C4CEC3;
	Mon, 28 Oct 2024 14:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730127129;
	bh=JxzWDVYM+b2LhEZUyWIHfG18ytG3bPimVRQv+jNrqHI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PxxrqyDpaqsMe+Dtc4+nDeIvAerpiO96NLXQ07zW1jdyUIGIRSJ0Jl6IBSLI2FGvj
	 wt9gD7xkR+4nXUhHtCTuFQzrAvKWy3it5zikjLCCAIZgtcg4E5L6IgxWjI5rhh0P2V
	 j+/98LH65OzRuH9SBQCbYgHOylAE/Mzw4uIjzq4Nww6bpFY/sLf1Ub84DJvNpHxflw
	 EqDwxau4Og5rq+dCwsuNPVG4QMjgx6rlnxdrDnxIAJMMCoql6r9nxzm2ZwUaPE7nNi
	 8PfmkoIY0UDbM+Vinds3PT178Cv9sPMU6ykhBocjdTXNTtww81fEe3Eactlruvl6eI
	 ZjDk/YOIUuc3w==
X-Mailer: emacs 31.0.50 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 4/4] arm64: mte: Use stage-2 NoTagAccess memory
 attribute if supported
In-Reply-To: <Zx-jWyF7xvFS-Vs6@linux.dev>
References: <20241028094014.2596619-1-aneesh.kumar@kernel.org>
 <20241028094014.2596619-5-aneesh.kumar@kernel.org>
 <Zx-jWyF7xvFS-Vs6@linux.dev>
Date: Mon, 28 Oct 2024 20:22:02 +0530
Message-ID: <yq5amsiocmb1.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_075210_761494_95AADD6E 
X-CRM114-Status: GOOD (  17.42  )
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


Hi Oliver,


Thanks for reviewing the changes.

Oliver Upton <oliver.upton@linux.dev> writes:

> On Mon, Oct 28, 2024 at 03:10:14PM +0530, Aneesh Kumar K.V (Arm) wrote:
>

> NOTE: We could also use KVM_EXIT_MEMORY_FAULT for this. I chose to
> add a new EXIT type because this is arm64 specific exit type.
>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---

I have used KVM_EXIT_MEMORY_FAULT as part of the initial prototype.

>> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>> index 637efc055145..a8268a164c4d 100644
>> --- a/include/uapi/linux/kvm.h
>> +++ b/include/uapi/linux/kvm.h
>> @@ -178,6 +178,7 @@ struct kvm_xen_exit {
>>  #define KVM_EXIT_NOTIFY           37
>>  #define KVM_EXIT_LOONGARCH_IOCSR  38
>>  #define KVM_EXIT_MEMORY_FAULT     39
>> +#define KVM_EXIT_ARM_NOTAG_ACCESS 40
>>  
>>  /* For KVM_EXIT_INTERNAL_ERROR */
>>  /* Emulate instruction failed. */
>> @@ -446,6 +447,12 @@ struct kvm_run {
>>  			__u64 gpa;
>>  			__u64 size;
>>  		} memory_fault;
>> +		/* KVM_EXIT_ARM_NOTAG_ACCESS */
>> +		struct {
>> +			__u64 flags;
>> +			__u64 gpa;
>> +			__u64 size;
>> +		} notag_access;
>
> Can you please look into reusing the memory fault exit infrastructure?
>
> The entire point of that is for KVM to tell the VMM it cannot make
> forward progress because of ${SOMETHING} unexpected at the specified
> GPA. You can add a new flag that describes tag access.
>

The only reason I dropped the change was because the flag will be very much
arm64 specific. Based on your feedback, I will switch to
KVM_EXIT_MEMORY_FAULT in the next update.

-aneesh

