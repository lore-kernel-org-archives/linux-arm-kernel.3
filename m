Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA645C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 13:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0THhRo5kOVI7aLEpHnqmWXR6vt63Hy3D5k779a1bV98=; b=VfKrL+iKIcwlZPoq6FL9RYN/Vp
	RMzxWeN9993E8ghbqoUcIKyYVVvvw28CBndF4c/O8j/VG6KH8fz/u+NCFkSytrBYVwWjAXmx6Mxam
	+SfX/GezFZYbW2u+H0iZiS3yMNIEU418I5GGQdEZBgbndedOVHPxFqk/EZvBjzAlHI5ItdPRV4oxO
	lMpNku9qrertc77r1hHI/h6f3WRFggl2yTCLin4rJnEMTKZLQCKWhRe4+hh6RjHzSC9utGC8rnzeP
	lmjdqB+hTbFD0kqtlkkUo5ZT4+dS40019e4pGRZ9JIIYO4H0+jW9mO7Izyo+bz41czRTDDJ+BxVep
	4GyzU8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrbJh-00000003yaB-1wip;
	Wed, 05 Aug 2026 13:05:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrbJg-00000003ya3-162A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 13:05:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E868041497;
	Wed,  5 Aug 2026 13:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1071F00A3A;
	Wed,  5 Aug 2026 13:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785935151;
	bh=0THhRo5kOVI7aLEpHnqmWXR6vt63Hy3D5k779a1bV98=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=HL4/upL0WK0ArFGrVyu49md5TqVZWiio+QQhBGHelbj9azHFE35XqnUezcWMzNcIL
	 ztBKv4VuzOwhpecti1fOzN4KPUch8dp1MUJw95NtK+qW/r/J49vLIMt2k0T+DW2uQu
	 Ivi4ruzkzmqUONXTMPBv4vrEESOwnoA2/SNv8Hz2R9zIkDzT0Bw7W/OO2BWNYfPqfX
	 i51T4v9jcLWmUIDBRXPmZ63fFr1+J7ww3l+nLPJTSxlNex+9swwu5bogxsFlFfyhQb
	 psxcdCfJsSONDqIYSzDbLqxVpOrwilAHls6z0A2oDVERXjU4E4za8OM/K0+80GxrrE
	 389TO3t6Nz0SA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 3/7] firmware: arm_rmm: Move RSI support out of
 arch/arm64
In-Reply-To: <anMcw5lTFN7OYreL@arm.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-4-aneesh.kumar@kernel.org>
 <anMcw5lTFN7OYreL@arm.com>
Date: Wed, 05 Aug 2026 18:35:42 +0530
Message-ID: <yq5atsp83eft.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Wed, Aug 05, 2026 at 12:02:51PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> The RSI SMCCC function IDs describe a firmware ABI and are not arm64
>> architecture specific definitions. Follow-up changes need to use them from
>> non-arch code, including drivers/firmware/smccc and the Arm CCA guest
>> driver.
>> 
>> Move the complete Realm Service Interface (RSI) implementation from
>> arch/arm64 to drivers/firmware/arm_rmm. The RSI SMCCC definitions and
>> command helpers are also moved to include/linux so they can be shared by
>> architecture code and firmware or driver code. This also keeps the
>> firmware interface outside architecture code, as requested [1].
>> 
>> [1] https://lore.kernel.org/all/agsNO9cc7H-b0H8L@willie-the-truck
>> 
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>
> I haven't checked but Sashiko has some points that it may break the
> build on other architectures with COMPILE_TEST.
>
> https://sashiko.dev/#/patchset/20260805063255.1638614-1-aneesh.kumar@kernel.org
>
> (for some reason I get error 502 above; hopefully it's temporary)
>

Below is the sashiko output

>> -#endif /* __ASM_RSI_CMDS_H */
>> +#endif /* __LINUX_ARM_RSI_CMDS_H_ */
> Now that this header is moved to include/linux/ to be shared by cross
> architecture code, will it break non-ARM64 builds?
> Looking at rsi_attestation_token_init() further up in this file:
>    struct arm_smccc_1_2_regs regs;
>    ...
>    arm_smccc_1_2_smc(&args.regs, &args.regs);
>    
> Both struct arm_smccc_1_2_regs and arm_smccc_1_2_smc() are guarded by
> CONFIG_ARM64 in include/linux/arm-smccc.h. If a generic firmware driver
> using COMPILE_TEST includes this header on a different architecture, it
> seems compilation will fail.

Only arm64 code is including that header for now.

arch/arm64/mm/init.c:37:#include <linux/arm-rsi-cmds.h>
arch/arm64/include/asm/mem_encrypt.h:5:#include <linux/arm-rsi-cmds.h>
arch/arm64/include/asm/pgtable-prot.h:69:#include <linux/arm-rsi-cmds.h>
arch/arm64/include/asm/io.h:11:#include <linux/arm-rsi-cmds.h>
arch/arm64/kernel/setup.c:10:#include <linux/arm-rsi-cmds.h>
drivers/virt/coco/arm-cca-guest/arm-cca.c:6:#include <linux/arm-rsi-cmds.h>
drivers/firmware/arm_rmm/rsi.c:11:#include <linux/arm-rsi-cmds.h>

-aneesh

