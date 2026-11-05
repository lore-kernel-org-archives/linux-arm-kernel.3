Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8ED606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uI/XK9rw;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=I9yJWYMO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IWJD0iHItHJ0ZLICudpIGPh2lKAzMkhjEJ2bZxXwT1g=; b=uI/XK9rw/A+1f8
	zha5/xB87K65kvP9Nj4BiNe3FYQ6vkWIHeJPheZnTQ01tSVOqWyVVbMU/tGbe7qdiytQPmDNGtJOM
	kyZlNE2prCcX3q6FtmnY6k2pYm5c1QR8gAswAMQsEI2j65tUhl2AnbYFdoJZYXk3FgVvzj0Up6pBC
	ctU9N18VJcmjbLc/uP5hGJSy/YZ4AietKMeq8B7E3cjg5SZyfGg/xODBFNq33uBDGIQqHuQZ975BE
	ZN2rmxyLAHN1xUNhCNlQTkMOvVNhoq+rV0deAZclP+qG4VFssXtlqAqQHnfnqwQ59GViYDiJxJ13D
	VhCqh3f20yJNutZVZKhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOz8s-00000009NTI-0veZ;
	Thu, 05 Nov 2026 15:12:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOz8e-00000009NPU-2TFg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 15:12:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E02B16F2;
	Thu,  5 Nov 2026 07:12:24 -0800 (PST)
Received: from [10.0.128.250] (e122027.cambridge.arm.com [10.0.128.250])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D24EC3F628;
	Thu,  5 Nov 2026 07:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793891547; bh=K05vKtM+fPDTzjogjywixfTKzhfzKJwvrbfn/flAQKU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I9yJWYMOEfAXqlqdwyFVq2M5GIwutk5K6psqq9Cpc7QM5j08Mcw18ktYr7AnqST3/
	 GjFIAmD16GvgTjVNYKV0YLBzFCCAvPxZyKsBXJAoSEfd1Vp0+12u1UwKcGhCWb1cWp
	 eDOuw2QPcrF8XLvPwDKHxwX3Bkyl6a8Ir0NoK4TQ=
Message-ID: <e57e8cd0-79eb-4073-87ea-5b0c27122b71@arm.com>
Date: Thu, 5 Nov 2026 15:12:23 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] KVM: arm64: CCA: Check for LPA2 support and SHA-256
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20261102141304.126883-1-steven.price@arm.com>
 <20261102141304.126883-5-steven.price@arm.com>
 <f2cb2959-f56d-414c-b4a5-c0656a44f57d@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <f2cb2959-f56d-414c-b4a5-c0656a44f57d@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_071229_547618_6739AD34 
X-CRM114-Status: GOOD (  21.33  )
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

On 03/11/2026 11:47, Suzuki K Poulose wrote:
> Hi Steven
> 
> On 02/11/2026 14:12, Steven Price wrote:
>> If KVM has enabled LPA2 support then check that the RMM also supports
>> it. If there is a mismatch then disable support for realm guests as the
>> VMM may attempt to create a guest which is incompatible with the RMM.
>>
>> Also check for SHA-256 support in the RMM as to begin with we only
>> support SHA-256 based measurements. This can be relaxed in the future.
> 
> 
> This could be merged with the patch 3.

Makes sense.

> 
>>
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
> 
> 
>> ---
>>   arch/arm64/kvm/rmi.c | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
>> index 9d118768550d..5b07beff8bc9 100644
>> --- a/arch/arm64/kvm/rmi.c
>> +++ b/arch/arm64/kvm/rmi.c
>> @@ -6,8 +6,30 @@
>>   #include <linux/arm-rmi-cmds.h>
>>   #include <linux/kvm_host.h>
>>   +#include <asm/kvm_pgtable.h>
>>   #include <asm/virt.h>
>>   +static bool rmi_has_feature(int reg, unsigned long feature)
>> +{
>> +    return !!u64_get_bits(rmi_feat_reg(reg), feature);
>> +}
>> +
> 
> minor nit: Do we see this useful for others (e.g., DA) ? May be we could
> move this to the include/linux/arm-rmi-cmds.h ?
> 
> May be we could even make the above a macro, something like
> 
> 
> #define rmi_has_feature(reg, feat)
>     u64_get_bits(rmi_feat_reg(reg), RMI_FEATURE_REGISTER_#reg _#feat)
> 

Sashiko pointed out that my use of u64_get_bits() is problematic. So
I'll fix that up and more it to the header file.

Thanks,
Steve

> 
> Cheers
> Suzuki
> 
>> +static int rmm_check_features(void)
>> +{
>> +    if (kvm_lpa2_is_enabled() &&
>> +        !rmi_has_feature(0, RMI_FEATURE_REGISTER_0_LPA2)) {
>> +        kvm_err("RMM doesn't support LPA2\n");
>> +        return -ENXIO;
>> +    }
>> +
>> +    if (!rmi_has_feature(1, RMI_FEATURE_REGISTER_1_HASH_SHA_256)) {
>> +        kvm_err("RMM doesn't support SHA-256 measurements\n");
>> +        return -ENXIO;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   void kvm_init_rmi(void)
>>   {
>>       if (kvm_get_mode() != KVM_MODE_RMM)
>> @@ -16,5 +38,8 @@ void kvm_init_rmi(void)
>>       if (!is_rmi_available())
>>           return;
>>   +    if (rmm_check_features())
>> +        return;
>> +
>>       /* Future patch will enable static branch kvm_rmi_is_available */
>>   }
> 


