Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4731CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 07:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMGK255wwyAjRD6lvlMg99YBP8AsvkgV9+EN+wiypcY=; b=RdXfHA0e8P2N3o7muexHea4TW5
	8aPm7++nVpU+okSNDs0hu92u4aw1TmI6pWhMFb4Fn65sHmdhxfpO5kPocHtyB/c2FukUealTFm83k
	zyNQUEpIZbWkthr4KgiMIcKHFZn2iuqKSDwEBxFE7/EXMcBDQRL/Q0MyleC4t8jLEtKX9qkNsE+Og
	iDWeD8NCAYtGGQeZaB2KPDOkM08CAPpTB9G8pPyWYQmoyqPmcT89y/0SL0xXjlQ3uvlwef7dOrDbZ
	XZR/2jN0eubncDzoehixRLuOJ58jk+EAvNT4xnai++PNKPJMhesHQj4qDhnxryS/btV4oUC4eSQ1u
	p8Y/kx3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7U3Y-00000009uMh-3FAa;
	Sat, 11 Oct 2025 07:30:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7U3X-00000009uMS-1bEM;
	Sat, 11 Oct 2025 07:30:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zMGK255wwyAjRD6lvlMg99YBP8AsvkgV9+EN+wiypcY=; b=AWNaKYPUGdLtOtUZ0n5U+uV2jz
	fMmu6Ap3VSworTaXMMSOkdpkOdq6im+9OAwjloneyNiZXHcIXRZEJrxpts+eu29gMqRG56Idj9/QJ
	Uut+A/6jG11o3awzSCxcaTpi44GK/+LWbway4tSbJ0PaqmlYp+CFPzzJKiOIZovOp07dgwsTdtpvM
	wKfjvtOToK8BAAR/gfjDGS2wwBIxAmCOQxI6l72UX5akWC2HhxVY/fzpFqxxVYyNxMVlzn8Yfp9LX
	tYWpf37tBr7E+nO63qVqQGsROUtkCxLryuQYxUAoN2NiR2h53kWuPpnIQiAnBq74PQhrpOAK/XdOr
	b8bDEvcA==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7U3K-00000002krq-3Cb4;
	Sat, 11 Oct 2025 07:30:17 +0000
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx_79sB+poSPoUAA--.44534S3;
	Sat, 11 Oct 2025 15:29:49 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxusBrB+poDevZAA--.1109S3;
	Sat, 11 Oct 2025 15:29:48 +0800 (CST)
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Ard Biesheuvel <ardb@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250928085506.4471-1-yangtiezhu@loongson.cn>
 <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
 <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
 <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com>
 <fec0c03d-9d8c-89a3-886a-1adc22e59b66@loongson.cn>
 <CAMj1kXFLyBbRL+pAAQ6be6dxqFPiyw_Ug8qNQWaicZQ235HE=A@mail.gmail.com>
 <8091e8fa-3483-af39-2f7a-e4eb62b0944f@loongson.cn>
 <CAAhV-H4+UGLSkbjHbq9MerWfxnq0a13x+uzNfTsCoe1UxjbWsg@mail.gmail.com>
 <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <0c9b8e6a-96a6-91d4-946f-2109f48a529b@loongson.cn>
Date: Sat, 11 Oct 2025 15:29:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowJAxusBrB+poDevZAA--.1109S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WF43GF17tw43Jr4ftFy7urX_yoW8KrW8pF
	WjkFWYkF4rZr4UXw1vyayjvrWaqrs3trWUKasxXryfZan8Xr4aqr4Y9w1q9F4kJrZ7W3W2
	va1xtr9Iyayqy3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jza0PUUU
	UU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_083010_228592_2641D0B4 
X-CRM114-Status: GOOD (  19.84  )
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

On 2025/10/11 上午11:40, Ard Biesheuvel wrote:
> On Fri, 10 Oct 2025 at 19:54, Huacai Chen <chenhuacai@kernel.org> wrote:
>>
>> On Sat, Oct 11, 2025 at 9:13 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>>
>>> On 2025/10/11 上午12:25, Ard Biesheuvel wrote:
>>> ...
>>>> Why do we need both (1) and (2)?
>>>
>>> Not both, either (1) or (2).
>>> Which one do you prefer? Or any other suggestions?
>>>
>>> Taking all of the considerations in balance, we should decide
>>> what is the proper way.
>> As a summary, there are three methods:
>> (1) Only link libstub with vmlinux.o during the final vmlinux link.
>> (2) Remove the attribute __noreturn for real_kernel_entry() and add while (1).
>> (3) Ignore "__efistub_" prefix in objtool.
>>
>> Josh prefers method (1), I prefer method (3) but also accept method
>> (1) if it is not only specific to loongarch.
>>
> 
> This is a false positive warning in objtool, which complains about a
> function that falls through, even though that can never happen in
> reality.
> 
> To me, it is not acceptable to modify how vmlinux.o is constructed
> also for other architectures, in order to hide some of its constituent
> parts from objtool, which do not use objtool to begin with.
> 
> 
> If you are not willing to fix objtool, I suggest fixing the loongarch
> code like this:

Thank you.

> --- a/drivers/firmware/efi/libstub/loongarch.c
> +++ b/drivers/firmware/efi/libstub/loongarch.c
> @@ -10,7 +10,7 @@
>   #include "efistub.h"
>   #include "loongarch-stub.h"
> 
> -typedef void __noreturn (*kernel_entry_t)(bool efi, unsigned long cmdline,
> +typedef void (*kernel_entry_t)(bool efi, unsigned long cmdline,
>                                            unsigned long systab);
> 
>   efi_status_t check_platform_features(void)
> @@ -81,4 +81,6 @@
> 
>          real_kernel_entry(true, (unsigned long)cmdline_ptr,
>                            (unsigned long)efi_system_table);
> +
> +       return EFI_LOAD_ERROR;
>   }

I tested the above changes, the falls through objtool warning can
be fixed because efi_boot_kernel() ends with a return instruction,
I think this is reasonable.

efi_boot_kernel() has a return value, there are "return status" in
other parts of efi_boot_kernel(), it should also return at the end
of efi_boot_kernel() in theory, although we should never get here.

If there are more comments, please let me know.

Thanks,
Tiezhu


