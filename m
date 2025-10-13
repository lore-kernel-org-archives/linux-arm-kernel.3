Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F6ACCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 07:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjH0T+C5VJRa0OHUcThvmXFRqxCEkkBrgzruz6RH1Do=; b=zYcSHzLRYGjYQfRCHlN0wi1HmC
	QvtPBhJhbeq63xSLdlRfg/vL4jX4AKBi32QU/cjHifNIuz7NaN/Jaa8r9whBiIJu9q78A01epDauT
	5mz1mYTm6nFJ/VDWq1V2r/3dhuDS2iAOU7MMRoNcs8M9nNFjw5YWsffsWp9G0kZmHSj58oBz9zBdl
	GtYdFpk85hGLr9iGHtJLChy6imuDpofyWTsYKH4wh0yYO1538eA+/Ty27ZrVV7ZXEBWtSAMF6D/g2
	dgBtWQ7rGeuU9CWbCYqRy/d/IBV6nwSo6UHDK03WvsBbmpubcom/ANNSTbtNqywAr5NwTnosPelY2
	LZqvrvyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8D5I-0000000CVUn-1IxF;
	Mon, 13 Oct 2025 07:35:08 +0000
Received: from mail.loongson.cn ([114.242.206.163])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8D5F-0000000CVQr-0KRK;
	Mon, 13 Oct 2025 07:35:06 +0000
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxH9Ogq+xozn0VAA--.46226S3;
	Mon, 13 Oct 2025 15:34:57 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxE+Sdq+xoJ1PdAA--.31982S3;
	Mon, 13 Oct 2025 15:34:55 +0800 (CST)
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
 <0c9b8e6a-96a6-91d4-946f-2109f48a529b@loongson.cn>
 <CAAhV-H41m96fvEWG5NqAE=tykPjyzt=50CseJDeCqdG-c_WMrQ@mail.gmail.com>
 <CAMj1kXEs5=VRi_rJwgHUrQWos-27PBbr3c4fYnmkV8Ahi8HZgw@mail.gmail.com>
 <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <CAMj1kXGvSnCMRVCW7eAxgLRWMEV3QRj3Dqg3PmZchZJNpnLK9w@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <3695be6e-bc75-1ee4-1222-95aafa44abdb@loongson.cn>
Date: Mon, 13 Oct 2025 15:34:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXGvSnCMRVCW7eAxgLRWMEV3QRj3Dqg3PmZchZJNpnLK9w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowJAxE+Sdq+xoJ1PdAA--.31982S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGrWfuw43urW8Ar4kCw45urX_yoW5XF4Upa
	y7GrWUKrs5JFZ7J34xJr15u3yUAwsIya45KF9I9ryrZw1UuF90qryjvrWjvFWDXrW8uFy2
	yF4ftrZIyFWqywcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zyIUUUUU
	U==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_003505_495789_4A0B68F5 
X-CRM114-Status: GOOD (  23.52  )
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

On 2025/10/11 下午11:58, Ard Biesheuvel wrote:
> On Sat, 11 Oct 2025 at 08:01, Huacai Chen <chenhuacai@kernel.org> wrote:...>> Hmmm, I want to know whether this problem is an objtool issue or an
>> efistub issue in essence. If it is an objtool issue, we should fix
>> objtool and don't touch efistub. If it is an efistub issue, then we
>> should modify efistub (but not specific to LoongArch, when RISC-V and
>> ARM64 add objtool they will meet the same issue).
>>
> 
> It is an objtool issue in essence.
> 
> The generated code looks like this
> 
> 9000000001743080: ff b7 fe 57   bl      -332 <__efistub_kernel_entry_address>
> 9000000001743084: 26 03 c0 28   ld.d    $a2, $s2, 0
> 9000000001743088: 87 00 15 00   move    $a3, $a0
> 900000000174308c: 04 04 80 03   ori     $a0, $zero, 1
> 9000000001743090: c5 02 15 00   move    $a1, $fp
> 9000000001743094: e1 00 00 4c   jirl    $ra, $a3, 0
> 
> 9000000001743098 <__efistub_exit_boot_func>:
> 9000000001743098: 63 c0 ff 02   addi.d  $sp, $sp, -16
> 
> There is nothing wrong with this code, given that the indirect call is
> to a __noreturn function, and so the fact that it falls through into
> __efistub_exit_boot_func() is not a problem.
> 
> Even though the compiler does nothing wrong here, it would be nice if
> it would emit some kind of UD or BRK instruction after such a call, if
> only to make the backtrace more reliable. But the code is fine, and
> objtool simply does not have the information it needs to determine
> that the indirect call is of a variety that never returns.
> 
> So I don't mind fixing it in the code, but only for LoongArch, given
> that the problem does not exist on arm64 or RISC-V.

I assume this is the final conclusion, if there is no objection,
I will send patch according to Ard's suggestion and update the
commit message in the next week, the code looks like this:

-----8<-----
diff --git a/drivers/firmware/efi/libstub/loongarch.c 
b/drivers/firmware/efi/libstub/loongarch.c
index 3782d0a187d1..e5991aa9f805 100644
--- a/drivers/firmware/efi/libstub/loongarch.c
+++ b/drivers/firmware/efi/libstub/loongarch.c
@@ -10,8 +10,8 @@
  #include "efistub.h"
  #include "loongarch-stub.h"

-typedef void __noreturn (*kernel_entry_t)(bool efi, unsigned long cmdline,
-                                         unsigned long systab);
+typedef void (*kernel_entry_t)(bool efi, unsigned long cmdline,
+                              unsigned long systab);

  efi_status_t check_platform_features(void)
  {
@@ -81,4 +81,7 @@ efi_status_t efi_boot_kernel(void *handle, 
efi_loaded_image_t *image,

         real_kernel_entry(true, (unsigned long)cmdline_ptr,
                           (unsigned long)efi_system_table);
+
+       /* We should never get here, only to fix the objtool warning */
+       return EFI_LOAD_ERROR;
  }
-----8<-----

Thanks,
Tiezhu


