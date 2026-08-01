Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D7FC54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 06:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJoh3FskZlMZXN0frCV7KCjMR5sn7IPdvl3P81QRqzo=; b=KRX9O18kf3sC5Ci7k0ZkGeg5T0
	4I0d7Uszxi7FYc01agpGfTDdyZF24MOW4UPT8xlikvQO2GuXJW910dWiQJd5hG43r+/7olLlgF+rt
	r/G8XdF/TLUWkKVPtnlVsVCAKQOilSiO95bKLh46ZkSqY0796iNaZ5F+quqtfd8jKoIDSqr1OPuZ8
	tCnyZCyB3/opFo0n9MI4SUfqO8mSThAjJrj0tDxL6nzMPpr70zh+Tsk1jQWhhvLI41bCdKbMP9WYW
	b64cJ3rkGM2XWHnJxFldNqA2mPsExfhz//oMK/PEbFTRtdlDsZIgjPzI3FQehCQ+NoG4cDf9W5N61
	xgzr45Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq3JP-0000000Dwtw-1enW;
	Sat, 01 Aug 2026 06:35:11 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq3JJ-0000000DwtM-44HL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 06:35:09 +0000
Received: from [133.11.54.183] (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 6716YCSG018797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 1 Aug 2026 15:34:12 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=xJoh3FskZlMZXN0frCV7KCjMR5sn7IPdvl3P81QRqzo=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1785566053; v=1;
        b=K2XFECkA0Z9J1wXM376KVU1kqybglUVyvN9n43lQWKGqRyrvg+1wAHFpXKrsJyTv
         7dO28hIdlCPUIKivvDpx66LiaWaMiUf1eMwX6HKnwGFy0BQRI/ZPqLF3hJ52UeoK
         9AP8hhhgXc9PTpW4Zl0NUnJo17Epe0Or63UjaIvExn2v2BtXF+fsswayy25CM5r7
         A6r0MtMXHSxU1bBIFTHXchDGmoYOLmKCHLdg5MhGoVcYXjwTa2rvghFY1qORzTYk
         LMgUJyt3SOTNzfKJTvTGqH9iBdkizXE0bRzs4ZGh1kMGUExnDgbs3mZYI8tjnGuQ
         I5KG078+99SmfBTRnx/1lg==
Message-ID: <417908e2-c226-46a3-9dbe-a7a2432d1662@rsg.ci.i.u-tokyo.ac.jp>
Date: Sat, 1 Aug 2026 15:34:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/11] arm64: errata: Require Apple IMPDEF PMUv3 traps
 on all CPUs
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
References: <20260710-hybrid-v8-0-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
 <20260710-hybrid-v8-4-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
 <amzSTp3cUCMuwJKf@google.com>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <amzSTp3cUCMuwJKf@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_233507_036019_374911FA 
X-CRM114-Status: GOOD (  19.87  )
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

On 2026/08/01 1:50, Will Deacon wrote:
> On Fri, Jul 10, 2026 at 08:14:58PM +0900, Akihiko Odaki wrote:
>> KVM relies on ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS as a system-wide
>> precondition for PMUv3 emulation on affected Apple CPUs. A local CPU
>> erratum is too weak for that: once the workaround is enabled, a late CPU
>> that misses it may still be onlined.
>>
>> Make the workaround an all-early-CPU capability instead. The matcher is
>> still local because it depends on MIDR_EL1, but the capability is only
>> advertised if all early CPUs match, and late CPUs that miss it are
>> rejected once the capability is enabled.
>>
>> Assisted-by: Codex:gpt-5.5
>> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
>> ---
>>   arch/arm64/kernel/cpu_errata.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
>> index 476a37c82108..14ce49d693c4 100644
>> --- a/arch/arm64/kernel/cpu_errata.c
>> +++ b/arch/arm64/kernel/cpu_errata.c
>> @@ -964,7 +964,7 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
>>   	{
>>   		.desc = "Apple IMPDEF PMUv3 Traps",
>>   		.capability = ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS,
>> -		.type = ARM64_CPUCAP_LOCAL_CPU_ERRATUM,
>> +		.type = ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE,
> 
> I always get tangled in knots with this code, but does this correctly
> handle the case where the boot/early CPUs don't have the impdef PMU
> feature but late-onlined CPUs do? I'm not sure we configure the traps
> correctly in that case but this is all gloriously undocumented.
It's not only you but Fuad and Sashiko also had the same question:
https://lore.kernel.org/qemu-devel/4cf2911c-610e-4cf1-9c42-cc5792265a89@rsg.ci.i.u-tokyo.ac.jp/

The answer is that we simply don't enable hypervisor traps. Accessing 
PMUv3 registers will be UNDEFINED on all CPUs, enforcing the 
architectural behavior system-wide.

I plan to change the patch message to clarify this in the next version.

Regards,
Akihiko Odaki

