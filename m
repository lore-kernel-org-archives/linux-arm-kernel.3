Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6DCC71157
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 02:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdIXidgTQoJZ+pqA8Hrjl4qfJ3FwmVN/K/H7yiiXnsg=; b=2MFChCoruIlKn7D34bFyFXENu2
	/gU41WwJogHKayF7QPldTe0TRRdnXlDJ+vI+lQbbY5sgT02m2IUuGj2hHa+oOYfdsyWtKyniJCgea
	uWqCyH3yTUwWJzuAPt3OoNtnItpr7K/ntrmdsMJJSUkKxA7F3qN/N6RZ2TmExt8PzvsWNX31J0dMx
	lTp+rwgRQsaFF5alHYlneqnv5sH7amhzdn+nZE1ZXjt+9zXQw8+MlFX3dKP2W6IEPkoEaa1yFgvAk
	1ovGKwCcS2horq2fcqITWMrpkT7Psi7NisseIDLGQy7AlycbrDN8/I2X1q87wkILWuKDj8m3WoAk0
	a4Qt+zAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS52g-0000000BouD-3i62;
	Thu, 19 Jun 2025 02:30:18 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS4z7-0000000BoSx-2xIa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 02:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750299992; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=fdIXidgTQoJZ+pqA8Hrjl4qfJ3FwmVN/K/H7yiiXnsg=;
	b=b1mGM3Q8eYboc55alnyIUgKkzfumn4H2Lf9xAfSP6WQyhb2OMv5sGQXM2pH9xZvhEnImQaVxOKl8QipSmc2wldjBbYjPy+BtMCVyl11D6SoQsTqA3qJHO2A4pMfPNeMdy3d4V4Jj1GixU9miDQW+I2Sh+yakFkZp+hvpl/lnbxE=
Received: from 30.221.131.111(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WeFTxhP_1750299985 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 19 Jun 2025 10:26:26 +0800
Message-ID: <0a8d5fdb-28b9-41f5-a601-cf36641bddbf@linux.alibaba.com>
Date: Thu, 19 Jun 2025 10:26:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] selftests/pidfd: align stack to fix SP alignment
 exception
To: Shuah Khan <skhan@linuxfoundation.org>, brauner@kernel.org,
 shuah@kernel.org, will@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: baolin.wang@linux.alibaba.com, tianruidong@linux.alibaba.com,
 catalin.marinas@arm.com, mark.rutland@arm.com
References: <20250616050648.58716-1-xueshuai@linux.alibaba.com>
 <ee095fdd-b3c1-4c41-9b06-a8e3695c1863@linuxfoundation.org>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <ee095fdd-b3c1-4c41-9b06-a8e3695c1863@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_192638_226910_B88C1392 
X-CRM114-Status: GOOD (  11.15  )
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



在 2025/6/19 05:36, Shuah Khan 写道:
> On 6/15/25 23:06, Shuai Xue wrote:
>> The pidfd_test fails on the ARM64 platform with the following error:
>>
>>      Bail out! pidfd_poll check for premature notification on child thread exec test: Failed
>>
>> When exception-trace is enabled, the kernel logs the details:
>>
>>      #echo 1 > /proc/sys/debug/exception-trace
>>      #dmesg | tail -n 20
>>      [48628.713023] pidfd_test[1082142]: unhandled exception: SP Alignment, ESR 0x000000009a000000, SP/PC alignment exception in pidfd_test[400000+4000]
>>      [48628.713049] CPU: 21 PID: 1082142 Comm: pidfd_test Kdump: loaded Tainted: G        W   E      6.6.71-3_rc1.al8.aarch64 #1
>>      [48628.713051] Hardware name: AlibabaCloud AliServer-Xuanwu2.0AM-1UC1P-5B/AS1111MG1, BIOS 1.2.M1.AL.P.157.00 07/29/2023
>>      [48628.713053] pstate: 60001800 (nZCv daif -PAN -UAO -TCO -DIT +SSBS BTYPE=-c)
>>      [48628.713055] pc : 0000000000402100
>>      [48628.713056] lr : 0000ffff98288f9c
>>      [48628.713056] sp : 0000ffffde49daa8
>>      [48628.713057] x29: 0000000000000000 x28: 0000000000000000 x27: 0000000000000000
>>      [48628.713060] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
>>      [48628.713062] x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000400e80
>>      [48628.713065] x20: 0000000000000000 x19: 0000000000402650 x18: 0000000000000000
>>      [48628.713067] x17: 00000000004200d8 x16: 0000ffff98288f40 x15: 0000ffffde49b92c
>>      [48628.713070] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>>      [48628.713072] x11: 0000000000001011 x10: 0000000000402100 x9 : 0000000000000010
>>      [48628.713074] x8 : 00000000000000dc x7 : 3861616239346564 x6 : 000000000000000a
>>      [48628.713077] x5 : 0000ffffde49daa8 x4 : 000000000000000a x3 : 0000ffffde49daa8
>>      [48628.713079] x2 : 0000ffffde49dadc x1 : 0000ffffde49daa8 x0 : 0000000000000000
>>
>> According to ARM ARM D1.3.10.2 SP alignment checking:
>>
>>> When the SP is used as the base address of a calculation, regardless of
>>> any offset applied by the instruction, if bits [3:0] of the SP are not
>>> 0b0000, there is a misaligned SP.
>>
>> To fix it, align the stack with 16 bytes.
>>
>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>> ---
> 
> Assuming this is going through Christian's tree.
> 
> Acked-by: Shuah Khan <skhan@linuxfoundation.org>
> 
> Let me know if you would like me to pick it up.
> 
> thanks,
> -- Shuah

Hi, Shuah

Thanks for your review.

I send this fix in Mar, but it missed last linux version.
I think I need your help to pick it up.

Thanks.
Shuai




