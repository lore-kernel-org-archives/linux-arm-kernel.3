Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4233CCF9F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/YVuoR/OTSIzOWCw1FBpoI+86hxduWJuGEuu6DL5h4=; b=ZrN/0RlV2P3JmidUFe8niXaz6V
	Up4anogM1pzsQruwnowwif0ol/vpM5L8hFDZZJml1IKPodb8xTNigsQTMvva4YmO0rc4FHWXvh2ab
	k5zNwu3pisjyoDVwsRMYaoF2vHRZAwBNMjSKf2DOW/IsUXtQjn9omKq2PzY724IgE5C2gnqxvv+b4
	quT9TVovqZwNhVrNKdAnXY8El7VggMWEY+JHdTuFHi+lDOVR+plSAL1ujJzg9T2XEUn8jQb3966Xg
	ErV2LvdmjUGRcydWKwE0t4s8SoSqJnu1EgysDd9kCUAzRYMfc3QXNbav1z1dEDoLt7S/bv/czZQ46
	XEFaXTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEP50-00000003sUp-0D6v;
	Thu, 30 Oct 2025 09:36:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEP4w-00000003sUM-3mAP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 09:36:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33C401063;
	Thu, 30 Oct 2025 02:36:11 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEE643F63F;
	Thu, 30 Oct 2025 02:36:17 -0700 (PDT)
Message-ID: <5ab27dd7-a24c-4927-891d-15359283561c@arm.com>
Date: Thu, 30 Oct 2025 09:36:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] KVM: arm64: selftests: Count test_guest_reg_read() as
 a test
To: Oliver Upton <oliver.upton@linux.dev>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 shuah@kernel.org
References: <20251014102108.2442391-1-ben.horgan@arm.com>
 <20251014102108.2442391-2-ben.horgan@arm.com> <aQJ9mC5_j6HQ_jbg@linux.dev>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <aQJ9mC5_j6HQ_jbg@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_023622_981403_B61811EA 
X-CRM114-Status: GOOD (  16.79  )
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

On 10/29/25 20:48, Oliver Upton wrote:
> On Tue, Oct 14, 2025 at 11:21:06AM +0100, Ben Horgan wrote:
>> The test test_guest_reg_read() is run without announcing its presence or
>> contributing to the test count. Rectify this.
>>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>>  tools/testing/selftests/kvm/arm64/set_id_regs.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
>> index 5e24f77868b5..6878ee23310e 100644
>> --- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
>> +++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
>> @@ -655,6 +655,8 @@ static void test_guest_reg_read(struct kvm_vcpu *vcpu)
>>  			TEST_FAIL("Unexpected ucall: %lu", uc.cmd);
>>  		}
>>  	}
>> +
>> +	ksft_test_result_pass("%s\n", __func__);
>>  }
>>  
>>  /* Politely lifted from arch/arm64/include/asm/cache.h */
>> @@ -786,7 +788,7 @@ int main(void)
>>  
>>  	ksft_print_header();
>>  
>> -	test_cnt = 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST;
>> +	test_cnt = 4 + MPAM_IDREG_TEST + MTE_IDREG_TEST;
> 
> TBH, I'd actually be in favor of a patch that removes usage of the
> ksft_* harness from this test altogether. I don't think it adds much and
> we use the KVM-specific test assertions anyway.

I'll give this a go for a respin unless anyone pipes up to say the
ksft_* usage in this test is helpful for them.

> 
> Thanks,
> Oliver

-- 
Thanks,

Ben


