Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9756CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FAhsvbTgHoMM7XLaoHP3ualQcuM1Z0t+34Nd0slmSA=; b=GeCfHwXISQlJr6p9xXPb0uHcx/
	Q/DhtkhGFgl8C0CGSmYTW5RD5sz7BnJT3cu2gpAdiY/dnpVuZbnpojTpJYvnkPqylGdy2P3p1xJhk
	D22ePUnux1e61Sb8FH1NEds8x0rNP2RondgtYpQ+1A8YIePABpcV1SiBSxgsS6oBx6cyALmHMfqnC
	x015VOWZ5H+KloeTRBGNzOOb70iMi1+ryt1cYqajFjxgRSrk+ZLiR+NIGEyImipn/xnQmHMZtMYcj
	4YhC8ucbQ2i0yPiGPeliLwROCfBtlgM5Po/COfk6xyzhmTgIOSGu1fR3zCc0qWzERPpE6Zc8oU0Kd
	Ps0fYblw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZh7-0000000BAeb-0Q62;
	Fri, 02 Oct 2026 09:36:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZh4-0000000BAdy-3BXe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:36:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99409497;
	Fri,  2 Oct 2026 02:36:37 -0700 (PDT)
Received: from [10.57.8.170] (unknown [10.57.8.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C3A43F86F;
	Fri,  2 Oct 2026 02:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790933801; bh=m6d1llwAmb/6rvyw6Fa3xaMJy1jmVRx3TAvoRSX48u4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S3JF48p0f8QJMV6r1pz19sdCCW4wn/aoQsLCt+GMjkj9L4mlxGoCI+0AHLYhunlPo
	 rktjKpOWNSjJGwMDb+CICRkSDYpuY8WgMA6POjYnD3/Glk3ZDfFYVcM3EMylfzXzGN
	 H1q3B8QEf/oy491jjkpob+aHb5iGVWUm3x9/WKQU=
Message-ID: <7c0846df-97ff-4461-98fc-7d094c91ba29@arm.com>
Date: Fri, 2 Oct 2026 10:36:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 18/23] KVM: arm64: CCA: Don't expose unsupported
 capabilities for realm guests
Content-Language: en-GB
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
 alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com,
 jonathan.cameron@oss.qualcomm.com
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
 <20261001210703.1597150-19-suzuki.poulose@arm.com>
 <CA+EHjTyyKxW2TT9XpjSDkdjWEuGyWmA_isDpOnoyri8ikxZN4A@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTyyKxW2TT9XpjSDkdjWEuGyWmA_isDpOnoyri8ikxZN4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_023642_840695_54C81509 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

On 02/10/2026 10:34, Fuad Tabba wrote:
> Hi Suzuki,
> 
> On Thu, 01 Oct 2026 22:06:58 +0100, Suzuki K Poulose
> <suzuki.poulose@arm.com> wrote:
> [...]
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> [...]
>> +static inline bool kvm_vm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
> [...]
>> +       r = kvm_get_cap_for_kvm_ioctl(ioctl, &ext);
>> +       if (WARN_ON_ONCE(r < 0))
>> +               return false;
> 
> The fix [1] is in -rc5, so a rebase conflicts here. Please make sure
> to carry it into this copy, i.e., a plain "if (r < 0)".


> 
> With that:
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Thanks Fuad, like I mentioned, I have flagged this with Marc and he was 
happy to fix as part of the conflict resolution.

Suzuki

> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/20260914093838.1082637-1-fuad.tabba@linux.dev/


