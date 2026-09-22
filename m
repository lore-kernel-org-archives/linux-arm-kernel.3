Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EA4C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 07:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T90uQyrwOkRtULqcM/E6YsXMU8ThCL+v0Olp5Ari6hs=; b=3WPPicaA93VI1zgEqVEks8Jugy
	TaykczJymAlKnxziti3hHy79eXT4Bw18Ya8OM6YAexI5VEO+Q8SPqE50a54lJztI/YwzS0WJzERHT
	O4m9P6M+NUQHFNsMPUOqqiX64RJiS7aYKpn2naxNxQnrYJ4uH38qwUxfWleomR2sJTj95kiZ04UrP
	SRG83Pz3Az4rxrojtCZA+o4z1fnDlzMdI1TPKhP8mLcpui8xl9yCrUzn0FOcJRW981hOaDFgFAq2e
	Z16ur6A/O60F1GgpGpu42+GcpdQmfCcwI1aLQyzgvCPmktuGMs0RIWfzbaoagaIpgKqIWQeRwg/Pd
	W5Z62nsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ufG-00000004TKn-3DRZ;
	Tue, 22 Sep 2026 07:11:42 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uf9-00000004TGh-0JpG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 07:11:36 +0000
Received: from [133.11.54.183] (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68M758Hb079658
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 22 Sep 2026 16:05:08 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=T90uQyrwOkRtULqcM/E6YsXMU8ThCL+v0Olp5Ari6hs=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1790060708; v=1;
        b=PIX6HpEsycuGjgwF+yYJEKbW2YxRThaU7EHQIZGK5L/lQ22qD4JgBSnRVBDQshf3
         Q3mYoWJmW61Zd5jCJ807XJD2ckYUsNMMIXCSMfO3rjw3vVrifWt7ncSg/BcZLQee
         vauZt/VF/clNeVik7NWRPYJayqFARm8MwM5cGkxhQxUiIbeZXzoUmlqIS4wwB/Z1
         L9juduXuRjjajH+awmMnM4mU2p2Wc8O5mzkj7ZBN8yYxCqEsBehxz/Zx/ZmpXuRn
         E65YvkFWnuPiZxTFsySrYR4F8I5XKjB/kakCvhD6gHlnvsKt28tJjrobhpK/KeGG
         whouyOtt7HDBh8h9zxg5/g==
Message-ID: <fe6ddd43-7de2-4715-819b-952296456fca@rsg.ci.i.u-tokyo.ac.jp>
Date: Tue, 22 Sep 2026 16:05:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 08/21] Revert "KVM: arm64: PMU: Reload when resetting"
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu
 <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Steffen Eiden <seiden@linux.ibm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>,
        Sean Christopherson <seanjc@google.com>,
        Shannon Zhao <shannon.zhao@linaro.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
References: <20260920-hybrid-v11-0-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
 <20260920-hybrid-v11-8-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
 <arIjhlqqzt4AKTOr@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <arIjhlqqzt4AKTOr@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_001135_344580_548F6BB1 
X-CRM114-Status: GOOD (  13.03  )
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

On 2026/09/22 15:43, Oliver Upton wrote:
> Hi Akihiko,
> 
> On Sun, Sep 20, 2026 at 08:15:49PM +0900, Akihiko Odaki wrote:
>> This reverts commit fe53538069bb4f625bc8734103ba044a83138fea.
>>
>> Restore PMU event teardown before system-register reset so existing
>> perf events cannot retain configuration from the previous run. All
>> counters are disabled by the reset PMCR_EL0 and MDCR_EL2 values, so
>> reset does not need to request a PMU reload.
> 
> Sorry, I'm not following the intent here. KVM_REQ_RELOAD_PMU should
> already be discarding + recomputing perf events based on the state of
> the vPMU. What's the problem?

Hi Oliver,

A plain KVM_REQ_RELOAD_PMU does not discard existing perf events. 
kvm_pmu_reprogram_counter_mask() enables or disables them, and 
kvm_pmc_enable_perf_event() only creates an event if none exists.

For example, an existing cycle-counter event may exclude EL0 counting. 
Reset sets PMCCFILTR_EL0 to zero, but the subsequent reload only 
disables that event. If the guest then enables cycle counting without 
rewriting the filter or counter, the old event is enabled again and 
still excludes EL0, despite PMCCFILTR_EL0 reading as zero.

The earlier "Recreate events after reset" patch addressed this by 
setting events_need_recreate. Sashiko then pointed out that stopping the 
old events after resetting the registers adds their accumulated counts 
to the reset counter values:

https://sashiko.dev/#/message/20260914-hybrid-v10-7-92788053a691%40rsg.ci.i.u-tokyo.ac.jp

The revert restores teardown before system-register reset and fixes the 
stale configuration.

Regards,
Akihiko Odaki

