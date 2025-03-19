Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A710FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 03:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dX+b5dkCzHI7qs9K1pxSG/IA6mix1y1/JgVcfCigZ/o=; b=B0PwADq+JK95yiPhNgdenFu3H1
	bojTn0aWOc9/XStwVSZx2u2RoYnzs79dMis0FrKN4eHVYxi1YymGezZ/MP/JuRHacXJf5frATwqN8
	Ee7RwHu9v20WKGQohGA27HgrT9VTcoqsQXahzX/RFdtf5yfR0MaNDiq/WgmcDWg7kpuTdcQ7TrV7r
	gJhLOMpLdeUGoKeRV0GA0AiTvRNvixt729QEhi4C7QB3+rclsQL/crJzqBNmKpyj6zqLG+fYHEzRE
	qJxsnco1ctbs8KyEnY/Tb7xuY43/T0+xVAdkyIEftsYavUu6xwiKhAc4oBs7H3VTWIEoFvlyvm2Fx
	qKzSUTHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tujgl-00000007qGj-239H;
	Wed, 19 Mar 2025 03:01:51 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tujf3-00000007q5h-45eW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 03:00:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1742353200; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=dX+b5dkCzHI7qs9K1pxSG/IA6mix1y1/JgVcfCigZ/o=;
	b=kZmEptU/cq/02yAFKFw3UJfdVO75C10XGeQeXWmSy9m4SjK1Y+CKZFxTD+qQP6+WMY5ny0DxRItQLiy5xppZWhLOUla9GF80pttnIVB5F/e9zGN1wG8w09VWW9CXC3h6Eg08PZXImtOijAeel7osCsaebI9f6Uyw8nvwsD3hvAY=
Received: from 30.246.160.93(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WRzjqK-_1742353198 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 19 Mar 2025 10:59:59 +0800
Message-ID: <0a70f4ab-cd83-434d-8dd2-486d58e5599a@linux.alibaba.com>
Date: Wed, 19 Mar 2025 10:59:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/pidfd: align stack to fix SP alignment
 exception
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: baolin.wang@linux.alibaba.com, tianruidong@linux.alibaba.com,
 brauner@kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20250312061557.28532-1-xueshuai@linux.alibaba.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20250312061557.28532-1-xueshuai@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_200006_655286_63E4FCDD 
X-CRM114-Status: GOOD (  17.69  )
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

+ ARM maintainers for review.

在 2025/3/12 14:15, Shuai Xue 写道:
> The pidfd_test fails on the ARM64 platform with the following error:
> 
>      Bail out! pidfd_poll check for premature notification on child thread exec test: Failed
> 
> When exception-trace is enabled, the kernel logs the details:
> 
>      #echo 1 > /proc/sys/debug/exception-trace
>      #dmesg | tail -n 20
>      [48628.713023] pidfd_test[1082142]: unhandled exception: SP Alignment, ESR 0x000000009a000000, SP/PC alignment exception in pidfd_test[400000+4000]
>      [48628.713049] CPU: 21 PID: 1082142 Comm: pidfd_test Kdump: loaded Tainted: G        W   E      6.6.71-3_rc1.al8.aarch64 #1
>      [48628.713051] Hardware name: AlibabaCloud AliServer-Xuanwu2.0AM-1UC1P-5B/AS1111MG1, BIOS 1.2.M1.AL.P.157.00 07/29/2023
>      [48628.713053] pstate: 60001800 (nZCv daif -PAN -UAO -TCO -DIT +SSBS BTYPE=-c)
>      [48628.713055] pc : 0000000000402100
>      [48628.713056] lr : 0000ffff98288f9c
>      [48628.713056] sp : 0000ffffde49daa8
>      [48628.713057] x29: 0000000000000000 x28: 0000000000000000 x27: 0000000000000000
>      [48628.713060] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
>      [48628.713062] x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000400e80
>      [48628.713065] x20: 0000000000000000 x19: 0000000000402650 x18: 0000000000000000
>      [48628.713067] x17: 00000000004200d8 x16: 0000ffff98288f40 x15: 0000ffffde49b92c
>      [48628.713070] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>      [48628.713072] x11: 0000000000001011 x10: 0000000000402100 x9 : 0000000000000010
>      [48628.713074] x8 : 00000000000000dc x7 : 3861616239346564 x6 : 000000000000000a
>      [48628.713077] x5 : 0000ffffde49daa8 x4 : 000000000000000a x3 : 0000ffffde49daa8
>      [48628.713079] x2 : 0000ffffde49dadc x1 : 0000ffffde49daa8 x0 : 0000000000000000
> 
> According to ARM ARM D1.3.10.2 SP alignment checking:
> 
>> When the SP is used as the base address of a calculation, regardless of
>> any offset applied by the instruction, if bits [3:0] of the SP are not
>> 0b0000, there is a misaligned SP.
> 
> To fix it, align the stack with 16 bytes.
> 
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---
>   tools/testing/selftests/pidfd/pidfd_test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/pidfd/pidfd_test.c b/tools/testing/selftests/pidfd/pidfd_test.c
> index c081ae91313a..ec161a7c3ff9 100644
> --- a/tools/testing/selftests/pidfd/pidfd_test.c
> +++ b/tools/testing/selftests/pidfd/pidfd_test.c
> @@ -33,7 +33,7 @@ static bool have_pidfd_send_signal;
>   static pid_t pidfd_clone(int flags, int *pidfd, int (*fn)(void *))
>   {
>   	size_t stack_size = 1024;
> -	char *stack[1024] = { 0 };
> +	char *stack[1024] __attribute__((aligned(16))) = {0};
>   
>   #ifdef __ia64__
>   	return __clone2(fn, stack, stack_size, flags | SIGCHLD, NULL, pidfd);


