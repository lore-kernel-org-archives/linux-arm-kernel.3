Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2438FC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 01:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BOL1qYMWR3O2znqmM5i4r2htXkqnEWXRuKcVY1Fd80=; b=H2REO1NKmFl6cI3rwB9ijgYpdx
	x0oJ1XbkkwD28/gDfzXEqF03BOdnIziiEEYqxkg3V3qRLrFR/ZfDcPULub29qdK9/IAI8ICAINEQX
	1cj49iemjusFq56PGVf3XBmAsvOfZjH7W04mx0TKZ+dhEfERlS6wArTt0hivvtBeNObb7SrHDYCrv
	70Pv9kthjK0gwRkm7/GViczc/7ALM3l1k0+VpvnaPbSHedqm+DkpS1n60Tol+vW8sKk2EJcoJprgg
	nP1dB1/Ub0emvLm0QLmGPgd4r3qZxKGamhDnTfBSFk2MSJ97sgPYejTFh1xTxahhAif/HkAk5g96a
	FJXcP3VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue23D-000000012SH-1D16;
	Tue, 22 Jul 2025 01:44:15 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue1wR-000000011df-3oth
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 01:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1753148231; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=1BOL1qYMWR3O2znqmM5i4r2htXkqnEWXRuKcVY1Fd80=;
	b=qqJxG486elMgYi6npWCpF5r8Bjxwaz9xxxA8/efq+9a0/+ZE7Yct6kWpq8vXx7IDwh6FaSBTG4y6GMpXIEf0tVF3MjBHVCq1PNyFV14AyDlnF406UAGCp9/2kwu6SQccTFWp/3yjne/q8cLszly3QyWvzK0r4yJ5jtadi/szAHE=
Received: from 30.246.160.95(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WjTgZZ2_1753148229 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 22 Jul 2025 09:37:10 +0800
Message-ID: <87ed033c-f2b1-4858-8438-f9935c4f12cf@linux.alibaba.com>
Date: Tue, 22 Jul 2025 09:37:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] selftests/pidfd: align stack to fix SP alignment
 exception
To: Will Deacon <will@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
Cc: brauner@kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 baolin.wang@linux.alibaba.com, tianruidong@linux.alibaba.com,
 catalin.marinas@arm.com, mark.rutland@arm.com
References: <20250616050648.58716-1-xueshuai@linux.alibaba.com>
 <ee095fdd-b3c1-4c41-9b06-a8e3695c1863@linuxfoundation.org>
 <0a8d5fdb-28b9-41f5-a601-cf36641bddbf@linux.alibaba.com>
 <821acc51-1429-4625-bae5-daa67bddc7bc@linux.alibaba.com>
 <c6dca956-d0ea-4c63-a48f-d02f21d38b9d@linuxfoundation.org>
 <aH5NiFDmnLwh7J_w@willie-the-truck>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <aH5NiFDmnLwh7J_w@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_183716_439249_AD4EC4E4 
X-CRM114-Status: GOOD (  12.41  )
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



在 2025/7/21 22:24, Will Deacon 写道:
> On Fri, Jul 18, 2025 at 03:10:32PM -0600, Shuah Khan wrote:
>> Can you take a look at this and let me know if this change looks
>> good to you both.
>>
>> I can take this through my tree after your reviews.
> 
> I never got to the point of fully understanding how the test was
> supposed to work, but it is true that arm64 requires a 16-byte aligned
> stack pointer and this patch appears to achieve that.
> 
> Will


Hi, Will,

In case you missed I reply in last version. I just paste the original
reply, I hope it can help you understand the root cause.

 From man page of clone():

	The stack argument specifies the location of the stack used by the
         child process.  Since the child and calling process may share
         memory, it is not possible for the child process to execute in the
         same stack as the calling process.  *The calling process must
         therefore set up memory space for the child stack and pass a
         pointer to this space to clone()*.  Stacks grow downward on all
         processors that run Linux (except the HP PA processors), so stack
         usually points to the topmost address of the memory space set up
         for the child stack.  Note that clone() does not provide a means
         whereby the caller can inform the kernel of the size of the stack
         area.

The glibc will do the sanity check:

/* int clone(int (*fn)(void *arg),            x0
	     void *child_stack,               x1
	     int flags,                       x2
	     void *arg,                       x3
	     pid_t *ptid,                     x4
	     struct user_desc *tls,           x5
              pid_t *ctid);                    x6
  */
         .text
ENTRY(__clone)
	PTR_ARG (0)
	PTR_ARG (1)
	PTR_ARG (3)
	PTR_ARG (4)
	PTR_ARG (5)
	PTR_ARG (6)
	/* Save args for the child.  */
	mov	x10, x0
	mov	x11, x2
	mov	x12, x3

	/* Sanity check args.  */
	mov	x0, #-EINVAL
	cbz	x10, .Lsyscall_error
	/* Align sp.  */
	and	x1, x1, -16		
	cbz	x1, .Lsyscall_error	// this line


When the stack pointer is set to NULL, the aligned stack pointer remains
zero, leading __clone to perform a syscall error, returning -EINVAL due
to an invalid argument.

In summary, Whether or not CLONE_VM is used, an address-aligned child
stack needs to be allocated.


Thanks.
Shuai

