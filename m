Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98ABC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 12:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tgql+Cc9iQ1NZcuVk7LhJ59YDO2KemFY68CoPE+vT9w=; b=0OSEBg//XUT876H2ExUS19NfBZ
	UJjdPq5VBClNVzU/QnOkNW9FBsIaIOKgY5PHdwYjkHhZnRGYhlDniF/eSsAgMmOSIwh59VQbRaAmo
	OdGgZRgAgpGrbQCpduUuBVPq6PTdIRaM+N6p7s988HkK6eE1mcCCiMopA4DHI2psrJSBGDRc4TUaF
	kViZbdiQYsxFTxt4+uVnJPUzDzhf9LJZ8jZPdMUFd15GTfgxUIqu+kiwYdRSg1iGGEc8L9MEHtcYJ
	D2XT2p9OdlTBwMEfeDpYwXw1cmkaRJRI6btITkX9EVV7EqO1qJvh75lK2nytzE03R6LA31WsoA0Oq
	jUh2s6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdTXx-00000008lFp-2drr;
	Thu, 30 Jan 2025 12:21:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdTWe-00000008lEE-1ETk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 12:20:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AE5C497;
	Thu, 30 Jan 2025 04:20:27 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 312243F63F;
	Thu, 30 Jan 2025 04:20:01 -0800 (PST)
Date: Thu, 30 Jan 2025 12:19:55 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Emanuele Rocca <emanuele.rocca@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Subject: Re: [BUG] ARM64 regression: NULL pointer dereference in
 arm_smccc_version_init+0x90/0x1ac
Message-ID: <Z5tuaxgDyFJPAvR0@J2N7QTR9R3>
References: <Z5OpGluX6oX5NLxh@NH27D9T0LF>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5OpGluX6oX5NLxh@NH27D9T0LF>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_042004_387158_B170AF2C 
X-CRM114-Status: GOOD (  21.22  )
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

On Fri, Jan 24, 2025 at 03:52:10PM +0100, Emanuele Rocca wrote:
> Hi,

Hi Emanuele,

> longterm kernel 6.1.123 crashes early when booting on the Lenovo Thinkpad X13s
> with the following error:
> 
>  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000264
> 
>  pc: arm_smccc_version_init+0x90/0x1ac
> 
> According to faddr2line, that is line 31 of smccc.c:
> 
>  arm_smccc_version_init+0x90/0x1ac:
>  arm_smccc_version_init at debian/build/build_arm64_none_arm64/drivers/firmware/smccc/smccc.c:31
> 
>  22 void __init arm_smccc_version_init(u32 version, enum arm_smccc_conduit conduit)
>  23 {
>  24         struct arm_smccc_res res;
>  25 
>  26         smccc_version = version;
>  27         smccc_conduit = conduit;
>  28 
>  29         smccc_trng_available = smccc_probe_trng();
>  30 
>  31         if ((smccc_version >= ARM_SMCCC_VERSION_1_2) &&

For the benefit others, when we looked into this a few days ago it
appeared that a GPR was being clobbered across an SMCCC call, resulting
in a later crash (as that GPR should hold the ADRP'd base address of
'smccc_version'). I didn't have the time to dig more into that (e.g.  to
figure out whether kernel/compiler/firmware was to blame).

Emanuele, could you please dump the result of:

  objdump --disassemble=arm_smccc_version_init vmlinux

... for this kernel? That'd make it possible for others to
perform/verify the analysis I mentioned above.

If you can share any more details from the crash, that'd be helpful. The
GPR dump would be *enormously* helpful in this case, and even a photo of
the crash log might be useful.

> This is with kernel 6.1.123. The last known good kernel I have available right
> now is 6.1.119. In the 6.1.120 changelog I see the following commit which seems
> potentially related?
> 
>  https://lore.kernel.org/all/20241106160448.2712997-1-mark.rutland@arm.com/

Last I looked, there was no obvious reason why that should have an
effect on this issue. It's possible that the differing asm constraints
have an effect on code generation, and happen to mask the issue.

From a quick scan, I note that the asm constraints *don't* include
clobber x17, and maybe that's getting clobbered by a veneer between the
BL and __arm_smccc_sve_check().

As above, it would really help to have the disassembly for
arm_smccc_version_init(), and the GPRs at the time of the crash.

Mark.

> 
> That's stable commit [1].
> 
> The relevant upstream commit [2] is in linux 6.12, and that kernel version does
> not crash. Comparing [1] vs [2] I see differences, but I can't tell if they can
> help debug the issue further. 
> 
> Thanks,
>   ema
> 
> [1] https://git.kernel.org/linus/bfcaffd4cc2d61ecb0571c5baf127c4089978ad4
> [2] https://git.kernel.org/linus/8c462d56487e3abdbf8a61cedfe7c795a54f4a78

