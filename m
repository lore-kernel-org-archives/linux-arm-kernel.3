Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86513C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fz6BSxMkCu1RefDmAvc14OnM9ef11rusjWb2l2/6uM=; b=CQ8uR306o9rFZft1rC6ct9YZDz
	CiLlxQjuhsDqZBpzT5lEKTW2QQxMxN+DmWKTYGt95uuvzdAGi+5qxQUdLBUz2Nz7d6YZxfwL9p1fK
	FPMWNX/8sV7yyWAKCEe5YgEZchK8UvsBdPzZtTAJMjnFpjBclIY0P3if8Px+Q7Xo+pHyH5uWTivDC
	q1ilJO9C4qHZzk7iNZL3jus/VVuMeMGhJn6wR3SRdxK6wzSZWSBTlC63i/Qfed/8xOFD7E7Ro85D0
	f1xRdxdtzcSWcfdXICUJ5PPc/0d0eEsZ8zFgDShTj46DnBdt+vfI/L2YOuAxzKsIyIVmVaydUjcCg
	Mcn5NmBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fcl-0000000Ebma-1vzq;
	Thu, 10 Sep 2026 14:19:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fcg-0000000Eblf-1Qbr;
	Thu, 10 Sep 2026 14:19:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9536B1570;
	Thu, 10 Sep 2026 07:19:25 -0700 (PDT)
Received: from [10.211.55.7] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F0293F7B4;
	Thu, 10 Sep 2026 07:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=foss.arm.com; s=main;
	t=1789049969; bh=YyZZgELesOQYbwi5589EMzGDv5CnlCwWEAz7cpxWzf4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=npJdqY2lkzMQ1ArUoRWjCHl6JYyGW+9VlY+FuS0oSIaTEVefYoWD5nfgZa3oYgF6v
	 ay/2+Tge/AzDs2LsbDIQlY088djByVQkbuQy86vTzSrEcx8dA4k2lt+gHCIJrIfhQ1
	 5pYgG0hGhKhZ4WqQc6JDXsRvcAe54mfMS72pXNHU=
Message-ID: <615d5d1a-5266-4b83-bff2-21c8f3840040@foss.arm.com>
Date: Thu, 10 Sep 2026 09:19:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Shadow Stack Locking Semantics between arch's
From: Bill Roberts <bill.roberts@foss.arm.com>
To: Mark Brown <broonie@kernel.org>, Jesse Huang <jesse.huang@sifive.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-hardening@vger.kernel.org, linux-api@vger.kernel.org,
 dave.hansen@linux.intel.com, rick.p.edgecombe@intel.com, debug@rivosinc.com,
 andrew@sifive.com, kito.cheng@sifive.com
References: <a1946d93-370e-4ca9-85d6-60b4a20ffd47@arm.com>
 <3bb672e0-7bc3-434f-904e-aa00394dd01f@foss.arm.com>
 <d20ccb74-69ed-45d7-a810-846904873588@sirena.org.uk>
 <0ef9f4ab-4c9f-4089-bed3-f7726ec97804@foss.arm.com>
Content-Language: en-US
In-Reply-To: <0ef9f4ab-4c9f-4089-bed3-f7726ec97804@foss.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_071930_527403_ED4D477C 
X-CRM114-Status: GOOD (  16.93  )
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


On 9/9/26 12:57 PM, Bill Roberts wrote:
>>
>>> 2. riscv should check that the low bit is set in locking not just 
>>> that its
>>> 0, it should be 1
>> I think for ABI compatibility RISC-V will have to continue accepting 0
>> as being equivalent to locking PR_SHADOW_STACK_ENABLE (or everything,
>> but it only supports that one bit right now).
>
> TL;DR - No users, lets fix it before risc-v lands the userspace side IIUC
>
> I can't find any libc's that support this for risc-v. It appears the 
> glibc
> patches were not merged and I commented on those patches just now
> that the interface is wrong:
>   - 
> https://inbox.sourceware.org/libc-alpha/8a5e21d0-0628-4910-9ad8-165c829e9680@foss.arm.com/
>
> Additionally, stress-ng does it "generically", and it would be broken 
> on a riscv system:
>   - 
> https://sources.debian.org/src/stress-ng/0.22.00-2/stress-prctl.c?hl=1144#L1144
>
> This is a bug and never followed the convention to begin with. So 
> risc-v is
> non-compliant to the spec and this effectively prevents the a true 
> unification
> of a generic prctl interface. The behavior on riscv doesn't adhere to 
> there own docs:
>
>   - 
> https://cdn.kernel.org/doc/html/latest/arch/riscv/zicfiss.html#prctl-enabling 


Sorry I confused two interfaces here, anyway, 
arch_set_shadow_stack_status is fine,
it's the locking interface arch_lock_shadow_stack_status, code snippet 
below:

/* If shtstk not supported or not enabled on task, nothing to lock here */
if (!is_user_shstk_enabled() ||
     !is_shstk_enabled(task) || arg != 0)
         return -EINVAL;

So even the glibc patches will be fine. But definitely something we want 
to fix.
I am going to float a patch over to the risc-v folks.




