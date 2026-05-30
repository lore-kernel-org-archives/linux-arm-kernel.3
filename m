Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8ABCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 09:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJKyD3MEQeL3NtbvOYS6sEffOYNqTkOAvR4qUFqTcfA=; b=FHRMZPJcCLdhT1wiEk6ND7iRpa
	ifFIg6aBRnv99lJRrB+up7voyNWbE/nNec8vhGdVNIiOjj5E4nOX/Gy0due0P46p4qyZkpIddz+15
	rlZ4517KF5JSGn3EUk4pdrFhulv2eax/LNbuZJaIenAdMzO7flWiXx/fplTZjCBpt7P1DhJlCQEcW
	jTw3gEiMpfF1aOjp/fEZ+7e4RhQ5HStFgH2AgolVkNK24toiyGrkU44XJY2yXtaezuuvu/K8H1SQz
	jBiz4QkEmu177s9LnFOfELWY2GbLYN6/b7xqLMZe8lcRL1qTIqlMcQa1q3SwdPQzdikYS6swi1ueW
	S+yQ3ugQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTFrs-00000008ZPh-0zjo;
	Sat, 30 May 2026 09:20:32 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTFro-00000008ZKm-0JfX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 09:20:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gJKyD3MEQeL3NtbvOYS6sEffOYNqTkOAvR4qUFqTcfA=;
	b=YYEwUr9YjDAV4gF6NQ78K8/5xbTf6orWEUaTxdA+IyOLpNba9GNwjVrgEpD0RN8FNkrBqHYsY
	pN9+8das2/qPxObAjOCy8wqJZ/yVDiLdblztMVulDOWt2y8wMu+QgRzox/gLnV02QyU8niFGuoA
	A5+QkKFpS7wtt78oRq6Put0=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gSDvr4vVkznTW2;
	Sat, 30 May 2026 17:10:16 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 1FC744055B;
	Sat, 30 May 2026 17:18:12 +0800 (CST)
Received: from kwepemn200010.china.huawei.com (7.202.194.133) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 30 May 2026 17:18:11 +0800
Received: from [10.174.178.56] (10.174.178.56) by
 kwepemn200010.china.huawei.com (7.202.194.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 30 May 2026 17:18:11 +0800
Message-ID: <d0e24622-fbf1-484b-81c8-4e5d945e808d@huawei.com>
Date: Sat, 30 May 2026 17:18:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Faster Arm64 __arch_copy_from_user and
 __arch_copy_to_user
To: Catalin Marinas <catalin.marinas@arm.com>
CC: <will@kernel.org>, <sunnanyong@huawei.com>, <wangkefeng.wang@huawei.com>,
	<benniu@meta.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260316123100.82932-1-xiqi2@huawei.com>
 <agdaAPtmPekOKzCx@arm.com>
Content-Language: en-GB
From: Qi Xi <xiqi2@huawei.com>
In-Reply-To: <agdaAPtmPekOKzCx@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.56]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemn200010.china.huawei.com (7.202.194.133)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_022028_442951_FCD9DE4F 
X-CRM114-Status: GOOD (  36.82  )
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

Hi Catalin,

Thank you for the detailed review. I agree with the security concerns raised.
I am preparing a second version with PAN toggled around the large copy_from_user loop,
using privileged LDP/STP only there; all non-optimized paths, boundary handling,
and copy_to_user() will continue using LDTR/STTR as before.

- For the copy_from_user fault concern, I will integrate Mark Rutland's kunit usercopy
boundary tests into our validation pipeline before resubmitting, to ensure fault
semantics and partial-copy reporting remain correct.

- For the performance improvements: I have only been able to measure these
on Kunpeng 920 so far. The optimization relies on generic instruction
reduction (fewer pointer updates per iteration) and brief PAN toggling,
which should benefit other ARM64 implementations, but I do not have access
to additional hardware for validation. I would appreciate testing feedback
from the community if anyone can run the kunit/benchmark suite on other
platforms.

I'll send the updated patch once the implementation and testing are ready.

Best regards,
Qi

On 16/05/2026 01:38, Catalin Marinas wrote:
> Hi Qi,
>
> On Mon, Mar 16, 2026 at 08:31:00PM +0800, Qi Xi wrote:
>> Based on Ben Niu's "Faster Arm64 __arch_copy_from_user and
>> __arch_copy_to_user" patch [1], this implementation further optimizes
>> and simplifies user space copies by:
>>
>> 1. Limiting optimization scope to >=128 bytes copies where PAN state matters.
>>     For <128 bytes copies, the implementation uses non-privileged
>>     instructions uniformly, simplifying the code and reducing maintenance
>>     cost.
> At least this part makes the changes more manageable.
>
>> 2. Adding "arm64.nopan" cmdline support using the standard idreg-override
>>     framework, allowing runtime PAN disable without building separate
>>     CONFIG_ARM64_PAN=y/n kernels as required by Ben Niu's version.
>>     The implementation maintains separate paths for PAN-enabled (using
>>     unprivileged ldtr/sttr) and PAN-disabled (using standard ldp/stp), with
>>     runtime selection via ALTERNATIVE() at the large copy loop entry.
> I think you got them the other way around. Your new code requires PAN=0
> to be able to use the privileged STP/LDP. However, disabling PAN does
> not mean STTR/LDTR are no longer needed and the kernel should use
> STP/LDP for uaccess.
>
> Even on hardware without PAN, having STTR/LDTR is still very useful (we
> had them on get/put_user() from the start; later fully used in the user
> copy routines once we got rid of KERNEL_DS). They prevent accessing
> kernel location with a user-controlled address if somehow they escape
> access_ok() (and we did have bugs in this area). This has nothing to do
> with PAN.
>
> You don't even need PAN disabled globally for your code to work, just
> toggle PAN briefly for the routine, similar to what we had since commit
> 338d4f49d6f7 ("arm64: kernel: Add support for Privileged Access Never").
> Presumably for large copies, the PAN setting is lost in the noise.
>
> That said, I don't think we should reduce the security in mainline for
> this optimisation. And we should definitely not gate it on arm64.nopan
> (more like a less_secure_uaccess_but_faster_on_some_hardware=1).
>
>> 3. Retaining the critical path optimization from the original patch:
>>     reducing pointer update instructions through manual batch updates,
>>     processing 64 bytes per iteration with only one pair of add instructions.
>>
>> Performance improvements measured on Kunpeng 920 with PAN disabled:
> [...]
>> Real-world workloads:
>> - RocksDB read-write mixed workload:
>>    Overall throughput improved by 2%.
>>    copy_to_user hotspot reduced from 3.3% to 2.7% of total CPU cycles.
>>    copy_from_user hotspot reduced from 2.25% to 0.85% of total CPU cycles.
>>
>> - BRPC rdma_performance (server side, baidu_std protocol over TCP):
>>    copy_to_user accounts for ~11.5% of total CPU cycles.
>>    After optimization, server CPU utilization reduced from 64% to 62%
>>    (2% absolute improvement, equivalent to ~17% reduction in
>>    copy_to_user overhead)
> I agree there are some small improvements but it would be good to
> reproduce them on other hardware as well.
>
>> +	/*
>> +	* interlace the load of next 64 bytes data block with store of the last
>> +	* loaded 64 bytes data.
>> +	*/
>> +	stp_unpriv	A_l, A_h, dst, #0
>> +	ldp_unpriv	A_l, A_h, src, #0
>> +	stp_unpriv	B_l, B_h, dst, #16
>> +	ldp_unpriv	B_l, B_h, src, #16
>> +	stp_unpriv	C_l, C_h, dst, #32
>> +	ldp_unpriv	C_l, C_h, src, #32
>> +	stp_unpriv	D_l, D_h, dst, #48
>> +	ldp_unpriv	D_l, D_h, src, #48
>> +	add	dst, dst, #64
>> +	add	src, src, #64
>> +	subs	count, count, #64
>> +	b.ge	1b
>> +	b	.Llarge_done
> This changes the semantics a bit, especially in the copy_from_user()
> path. With your patch, we can write into the kernel buffer until, say,
> offset #32. On the offset #48 ldp we get a fault but #dst has never been
> updated, so we report nothing copied (almost, we have the fault path
> attempting one more byte copy).
>
> For copy_to_user(), we have some imp def behaviour already where a
> faulting unaligned store at the end of a page may or may not write the
> end of the page. Past discussions concluded that under-reporting on
> copy_to_user(). Whether that's also fine for copy_from_user(), not sure.
> I think Robin tried to address these at some point. There's also a
> proposal for a kunit usercopy test for boundary conditions but we
> couldn't agree on the semantics (architectures behave differently here):
>
> https://lore.kernel.org/r/20230321122514.1743889-1-mark.rutland@arm.com/
>
> We do run these internally but it would be good to get them upstream
> before any other changes to this code.
>

