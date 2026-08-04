Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52A4C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 14:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lalEdXHdmgSURccK4viUARTX5w7QtaU/aD2/B9TE7vM=; b=FesiZPU1OOf1peKCJukY2WYumM
	9eDh8hIEJ7+NI/UtiM5ItzUeh/PLpat57j1IM3fO2SlO0nh9nh26EEuiibWyqFh+jv0c9GXouIe4i
	PFKZQ/lNLmttQFh6R+t/jVaIihttMI9z0SDVmjMKwfxDoh9gv6IMZ74pIfswrK1+GyhRWtuun14HP
	iZIyr9SewGZlJ8icoE7cdoJNLaiZceIedmi7MJWYOXy38/UYVpXu3YrKvb1L2MGeY/FzMB/YlQ9by
	CfzAIgfPS3EJLaZxqvgDfSFlIeyvFfL2rRAI07EtR1cUmk/PUEwstHESYy+Bmjiyh6qg+PnJmifB2
	zTfLXBeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGbx-000000029Qm-3lkD;
	Tue, 04 Aug 2026 14:59:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGbv-000000029QM-459H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 14:59:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B3051476;
	Tue,  4 Aug 2026 07:59:14 -0700 (PDT)
Received: from [10.57.44.180] (unknown [10.57.44.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06CB13F86F;
	Tue,  4 Aug 2026 07:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785855558; bh=jM2dy1jPgBL1qNkC+4PhadiOipaYVgTdH7ArBTEfwHI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nNVIav5DEDiR2UTAwZM5v9LaRsiCTiyK80xUupzMVosPgD9BCL2T19cYcc2SLIQkD
	 F6G5qSTE3K+VwIaJKkkSRpA3BmRaw0+ntT60xn2CrJQKCdID7Jf37/T+d6cyelnsmX
	 4Nn1Gl7QvaAe8Bt/JHbT+GCpb9GQOmJqQYeUPljA=
Message-ID: <039f66ef-85bc-49e0-9843-4b102c94ba76@arm.com>
Date: Tue, 4 Aug 2026 15:59:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 11/45] KVM: arm64: CCA: Check for RMI support at KVM
 init
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>, Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-12-steven.price@arm.com>
 <CA+EHjTwoKj+c-ZS7W4fCAMYWSgrc+15QWBxu_sE-PMECr+8zpA@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTwoKj+c-ZS7W4fCAMYWSgrc+15QWBxu_sE-PMECr+8zpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_075920_053362_710CF53A 
X-CRM114-Status: GOOD (  12.04  )
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

On 04/08/2026 15:55, Fuad Tabba wrote:
> Hi Steven,
> 
> On Mon, 3 Aug 2026 at 14:45, Steven Price <steven.price@arm.com> wrote:
> ...
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>> index bae2c4f92ef5..1a5e15040111 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -27,6 +27,7 @@
>>   #include <asm/fpsimd.h>
>>   #include <asm/kvm.h>
>>   #include <asm/kvm_asm.h>
>> +#include <asm/kvm_rmi.h>
>>   #include <asm/vncr_mapping.h>
>>
>>   #define __KVM_HAVE_ARCH_INTC_INITIALIZED
>> @@ -424,6 +425,9 @@ struct kvm_arch {
>>          /* Nested virtualization info */
>>          struct dentry *debugfs_nv_dentry;
>>   #endif
>> +
>> +       bool is_realm;
>> +       struct realm realm;
>>   };
> 
> Marc suggested at v10 making the pKVM and CCA state here a union,
> given the two are exclusive, and I believe you acked it [1]. Was there
> an issue with it, or did it just get lost across the respins?

Most likely lost in the respins. Will pick this up.

Thanks for spotting.

Cheers
Suzuki


