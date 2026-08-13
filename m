Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DF9C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 18:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqgBZp0iCyAIhgizb7HdEahpT66JPYJ/Z8WhPEuBd8s=; b=jSPwzvAynQUN9h1HEkBQh4YyC3
	/23JQ5uprzxea07K7ped3QYLnVXsWWrAG3NnDomHYgwdrw2cX9/ZMkfvLwyxSP2JfIiHvQ6TKg4kH
	kZRfVN33eeFqHWBvKjxwU1agNY5mca3etG07S1DEOA92k07vxK4FIxX0deUgGkZa5OdU4zdpQkAl9
	xfPrnpI6nFwF3qfNYj9MHlChWPLhu9LMrLYSYrQO3kCzrdMBY463nUtDVMxnYE2wzcaZScZz1/oy/
	EXLhlvETOOnzXRca51o095AeHPBv33ZdnizUs0LYQmcnu39U7AJ6Vdq+RAIlwZI3/ooKcX0lPY+s/
	oiibE0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuaVj-00000001PNz-3Elg;
	Thu, 13 Aug 2026 18:50:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuaVh-00000001PNU-1tWx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 18:50:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 746141BCA;
	Thu, 13 Aug 2026 11:50:31 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 311BF3F66F;
	Thu, 13 Aug 2026 11:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786647035; bh=UqlujE87SZPUaAWV+3CYrV1L4tsDkWZ/Wf2g+PXcim8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jSlAxITQ8ytvrwEvfOjVSXrISd2ZMn2fDC4fGqTQWiW5V7lrZQalhYMUL3iXPcjMY
	 T8TCNitVUWzZw5kFfMbDfN+TvqHDhPJjUBdPn4NbZZZHIVcT48Go7E849j4IE32dGq
	 MXMecnGisUztYC3YPEinponeQWKgGzXsrmJub18I=
Message-ID: <6f472cda-cd55-478b-afee-66ee2a0be63c@arm.com>
Date: Thu, 13 Aug 2026 19:50:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] ARM: alignment: fix LSR #32 and ASR #32 offset
 decoding
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Cc: Xie Yuanbin <xieyuanbin1@huawei.com>, Ard Biesheuvel <ardb@kernel.org>,
 Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260812185057.1573-1-kmehltretter@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260812185057.1573-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_115037_573505_4EE77D17 
X-CRM114-Status: GOOD (  19.64  )
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

On 12/08/2026 7:50 pm, Karl Mehltretter wrote:
> The register-offset form of LDR/STR may apply a shift to Rm.  Per
> DecodeImmShift() (ARM ARM DDI0406C section A8.4.3, "Pseudocode details
> of instruction-specified shifts and rotates"), an imm5 of 0 encodes a
> shift of 32 for LSR and ASR; only LSL treats 0 as "no shift", and ROR
> with 0 encodes RRX.
> 
> do_alignment() special-cases RRX but not LSR or ASR, and IS_SHIFT() does
> not filter these encodings out, so the block is entered with
> shiftval == 0 and the offset becomes Rm instead of 0 (LSR #32) or the
> replicated sign of Rm (ASR #32).

Yikes! What kind of cursed compiler is emitting these nonsensical encodings?

> do_alignment_finish_ldst() applies the offset to the base-register
> writeback of the post-indexed form, so the emulated access itself uses
> the correct faulting address but Rn is left holding the wrong value.
> 
> Reproduced on ARM926EJ-S (versatile_defconfig, CONFIG_ALIGNMENT_TRAP=y,
> gcc 13.3.0) with a misaligned base and Rm = 0x1000:
> 
>    ldr r0, [r1], r2, lsr #32   Rn advanced by 0x1000, must be unchanged
>    ldr r0, [r1], r2, asr #32   Rn advanced by 0x1000, must be unchanged
>    ldr r0, [r1], r2, asr #32   with Rm negative, Rn must decrease by 1
> 
> All three are correct with the patch applied, while a lsr #1 control
> case is emulated correctly both before and after.

While this does appear technically correct, the fact that it's gone 
unnoticed for 30 years and the relevant hardware is almost all virtually 
obsolete by now does make me wonder whether it's really worth messing 
with now, but at the same time, I guess it's a pretty low-impact change...

Thanks,
Robin.

> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Resending after two weeks without feedback; add ARM alignment reviewers
> to Cc.
> 
>   arch/arm/mm/alignment.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mm/alignment.c b/arch/arm/mm/alignment.c
> index 812380f30ae3..49045e09ae18 100644
> --- a/arch/arm/mm/alignment.c
> +++ b/arch/arm/mm/alignment.c
> @@ -892,11 +892,17 @@ do_alignment(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
>   				break;
>   
>   			case SHIFT_LSR:
> -				offset.un >>= shiftval;
> +				if (shiftval == 0)
> +					offset.un = 0;
> +				else
> +					offset.un >>= shiftval;
>   				break;
>   
>   			case SHIFT_ASR:
> -				offset.sn >>= shiftval;
> +				if (shiftval == 0)
> +					offset.sn >>= 31;
> +				else
> +					offset.sn >>= shiftval;
>   				break;
>   
>   			case SHIFT_RORRRX:


