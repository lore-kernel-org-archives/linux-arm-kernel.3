Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF5BC44500
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 11:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0ZGQJGJ1qWqh1QXg5+nZXDEWKnJXbLoKauNjx/PAYs=; b=LbVlKXbxg5vgecfUtj1kWd3vV7
	EdrPgFFGy9LR/ostGeM26uS8iTypPCBD3+t5+WKqUVfRdB8QRT9uhJOswOobPPW1iWte3uW3ddlMr
	hK2VtoxrZYYM47LgrXrVun7VdxsrNdNV00DVxnOA1+w4+ltXykWblAunfYywmm/KaqYWSnhBZT1yS
	FKT7BRshE6XwcP4HfKBSLb3OxzKPOjaQdg5Loc9ZMrX43cqdRK28mUPBBqo99caGDH9SOOgEqfPPw
	0/y6Eh1aV0A+ra5wZhqvW0Cnsfmp9wQv1iiOY5nIHlxELF1i31y+x+2Zuv2aml7ZXcmYCxeaRI6sY
	k8gmQqsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3ff-0000000EpEv-131C;
	Tue, 07 Jul 2026 11:08:59 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3fb-0000000EpDd-4Ago
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 11:08:58 +0000
Received: from [133.11.54.183] (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 667B84DM000649
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 7 Jul 2026 20:08:04 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=g0ZGQJGJ1qWqh1QXg5+nZXDEWKnJXbLoKauNjx/PAYs=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1783422484; v=1;
        b=sT4HpAzGMYEhZYKHTkNka9jCpR9kdvZwWiGM6RHY8o5Jh50Xpv3CLKHIKN5BSGDP
         UO9T1j6Mo6pDZFawvG0JpSHS1WRGQgTcL5yPRrmCURV1XzeKV/H3TMAPnxTU9p1V
         BLHavpto5ibL75WXfBnQhvRrIXlF9L7zRvrsUE/sWBqGdW/n26udhLUkIK8iD6v2
         yiKor0wuTpnWYPkRduMdyP3Y5HN5FEhy/fSIctEA6OldtFope5KzYn0rd7aaALgB
         4kw5t2aTJC5oKb2k3QLKVcaLjYMySaA/rW8Xxp5xBwzj/GbXi2uJlJKHeUSBneYY
         1WxHlDXk9luvKXTDy+VdmA==
Message-ID: <e03f17b2-a765-4912-adf6-3da26e7eeecd@rsg.ci.i.u-tokyo.ac.jp>
Date: Tue, 7 Jul 2026 20:08:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/7] KVM: arm64: Disallow vPMU when pPMUs do not cover
 all CPUs
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
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
References: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
 <20260706-hybrid-v8-1-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
 <akvgIWqBjAp_VA_A@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <akvgIWqBjAp_VA_A@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_040856_507647_60F7FC65 
X-CRM114-Status: GOOD (  13.28  )
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

On 2026/07/07 2:04, Oliver Upton wrote:
> Hi,
> 
> On Mon, Jul 06, 2026 at 07:03:24PM +0900, Akihiko Odaki wrote:
>> Commit ec3eb9ed6081 ("KVM: arm64: PMU: Disallow vPMU on non-uniform
>> PMUVer") made KVM reject vPMU unless the system-wide PMUVer is usable.
>> That covers systems where PMUv3 is absent or non-uniform, as well as
>> systems where IMPDEF PMUv3 sysreg traps are unavailable.
>>
>> However, KVM can still accept vPMU when all CPUs uniformly trap PMUv3
>> sysregs, but the pPMUs registered with KVM only cover a subset of
>> possible CPUs.
>>
>> Reject vPMU unless the registered pPMUs cover every possible CPU.
>> This avoids carrying support for partial pPMU coverage into the
>> fixed-counters-only UAPI introduced later in the series.
> 
> Doesn't CPU hotplug screw this up? I could online a CPU that doesn't
> have a PMU after creating the VM.>
> I'd rather just change ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS to become a
> system feature. That way any CPU which breaks the system-wide assumption
> cannot be onlined.

ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS only says that IMPDEF PMUv3 sysregs 
are trapped. It does not say that KVM has a driver-backed PMU usable for 
PMUv3 emulation. This patch checks that extra requirement.

I re-checked CPU hotplug. Onlining a CPU without a PMU later does not 
make an accepted VM unsafe, since the check is against 
cpu_possible_mask. The problem is the reverse case on ACPI: this check 
can disable vPMU when a possible CPU is offline. DT populates 
supported_cpus at boot, while ACPI initially populates it only from 
online CPUs and grows it as matching CPUs come online.

That makes this patch too conservative. In practice, I do not expect 
systems to mix CPUs with and without a usable PMU. A better approach is 
probably to treat such a host as out of spec and add 
TAINT_CPU_OUT_OF_SPEC. We already do that for architectural PMUv3 by 
detecting mismatches in ID_AA64DFR0_EL1.PMUVer; we can do the same for 
ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS with non-standard PMUs.

Regards,
Akihiko Odaki

