Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D21A606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qQHztx9A;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ynon53Hc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XzXbFa9dhaHcA5InRfsQcpgxHEo38p/rPjsetoAUqnI=; b=qQHztx9Au16NRt
	VtHRTCD0+MrPHGBNBILiuwbaVDw2tg2IfEWI1+VK6dE67ZitoxbH8LdK/QClDbQRGvmv53QFSoBzj
	EVhx+axwxBDp/KbN6i99mEgICPtTaIsCx7pTMOfdm3i5zMwaxrTrwqNgtvPfUE3dZFFzy4rhDIjUX
	kA3dY2GGl3W9ohewLq0LpAc2mwibQdYO6OD/IR6jzfDhK8yQurGBWgoCu1ejpInTyggZa/mSYy4DR
	QOhCdmZQFy5W/mnhqREyarFLmyFRFDjkmESsKHuFu/2NwlH4NJR9hmdBSOWsYJYB9gWW1u5Do/BOi
	ako7Ha+WNcPB0/Sh77ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoei-0000000G4wp-1Vq0;
	Mon, 02 Nov 2026 09:48:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoeY-0000000G4rA-2kEE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:48:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E4CA1595;
	Mon,  2 Nov 2026 01:48:30 -0800 (PST)
Received: from [10.57.66.79] (unknown [10.57.66.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E03B3F59E;
	Mon,  2 Nov 2026 01:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793612913; bh=egNufJ8Fs17VQdSUqK9Yn8uet05avqZAAkBSvGK+45M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ynon53HcE64fp/Me7zZFgCGztnBBDUBW2GmC+Sf0pi8kPLH8QE/kKP57h0JRrEBB2
	 1vC78ArVZuvu+b0nB3+ViqwkWzHLr+ImoxH8RD00O18DKfY/qipoYKFE9sbFOfdk/G
	 cKmlmZZY59kGB9LXU/LSMpUJNexVZvouUd7nWaTs=
Message-ID: <2458da32-5235-4dfb-a817-7557230b9885@arm.com>
Date: Mon, 2 Nov 2026 09:48:30 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] KVM: arm64: Clear the VM's feature bitmap when
 kvm_setup_vcpu() fails
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Jack Thomson <jackabt@amazon.com>,
 Congkai Tan <congkai@amazon.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261102075843.2556018-1-fuad.tabba@linux.dev>
 <20261102075843.2556018-2-fuad.tabba@linux.dev>
 <07d0afa8-1b9a-4991-a419-9840cf629d57@arm.com>
 <CA+EHjTwNSxBa8-_0Q6zmgqW0RGyVhpUU3xnFg3-sqqmsdL4s8A@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTwNSxBa8-_0Q6zmgqW0RGyVhpUU3xnFg3-sqqmsdL4s8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_014834_750857_EEDBE1E7 
X-CRM114-Status: GOOD (  14.00  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02/11/2026 09:42, Fuad Tabba wrote:
> Hi Suzuki,
> 
> On Mon, 02 Nov 2026 09:24:15 +0000, Suzuki K Poulose
> <suzuki.poulose@arm.com> wrote:
> [...]
>>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> [...]
>>> @@ -1856,8 +1856,13 @@ static int __kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
>>>           bitmap_copy(kvm->arch.vcpu_features, &features, KVM_VCPU_MAX_FEATURES);
>>>
>>>           ret = kvm_setup_vcpu(vcpu);
>>> -        if (ret)
>>> +        if (ret) {
>>> +                /* Clear the bitmap if setup fails on the first vCPU to be initialized. */
>>> +                if (!test_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags))
>>
>> Is this check necessary ? We go into kvm_setup_vcpu() only if the bit is
>> cleared and we do this under the config_lock mutex. The flag is only set
>> after we have finished the kvm_setup_vcpu() successfully, later down.
> 
> It is. An INIT on a second vCPU with the same features also calls
> kvm_setup_vcpu(), with the flag already set, and
> kvm_vcpu_init_nested() can return -ENOMEM there.


Sorry, my bad. I missed the second condition after the flag check
in.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>



/me Where's coffee!

> 
> Thanks,
> /fuad


