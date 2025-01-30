Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDCDC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 14:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=xdmI8hOh35qBdwKJKdiAJYKJoQFLR7C6NMjp4ibJGE8=; b=TCTAFHdhTXGxYN
	12SRcS5A2G/QoK0uFf+93n9Nnj4ZXPtJ8W0fyapgiEw5ONROfNsVbhArFH9CddG9iRC4EiyPAbb6I
	9yJxMl9RgqbnReXdqqkSJFKm1vSNjJlx8ulEu37Ta/dMvbAhEySfQbWQcZsTjXfmmj8C6cFaW1RQA
	zWEy4+9LMUOrE6WbRLpr7UWZl/7am6LFMyVRB+islC0N8L0lEIt/ldEaqRuEGeByRxorcqZvS5OHG
	tKMBgtvRgo57b1N4zdiIX/xyw7sP+RuMV2c3Lrz+l6lKn/ogeyL+hhwXYzp5Q6xTkLZQMX9OAJND1
	xemWTUZ8iXknQp+TmcKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVzF-000000091py-3yU9;
	Thu, 30 Jan 2025 14:57:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVxw-000000091kv-46ZW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 14:56:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDE3F497;
	Thu, 30 Jan 2025 06:56:46 -0800 (PST)
Received: from NH27D9T0LF (unknown [10.57.6.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 458C13F694;
	Thu, 30 Jan 2025 06:56:20 -0800 (PST)
Date: Thu, 30 Jan 2025 15:56:10 +0100
From: Emanuele Rocca <emanuele.rocca@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Subject: Re: [BUG] ARM64 regression: NULL pointer dereference in
 arm_smccc_version_init+0x90/0x1ac
Message-ID: <Z5uTCnhfKo5D-_bV@NH27D9T0LF>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5tuaxgDyFJPAvR0@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_065625_122217_11CFD7B8 
X-CRM114-Status: GOOD (  12.51  )
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

On 2025-01-30 12:19, Mark Rutland wrote:
> For the benefit others, when we looked into this a few days ago it
> appeared that a GPR was being clobbered across an SMCCC call, resulting
> in a later crash (as that GPR should hold the ADRP'd base address of
> 'smccc_version'). I didn't have the time to dig more into that (e.g.  to
> figure out whether kernel/compiler/firmware was to blame).
> 
> Emanuele, could you please dump the result of:
> 
>   objdump --disassemble=arm_smccc_version_init vmlinux
> 
> ... for this kernel? That'd make it possible for others to
> perform/verify the analysis I mentioned above.

Sure, here it is:
https://people.debian.org/~ema/Z5OpGluX6oX5NLxh@NH27D9T0LF.objdump.txt

> If you can share any more details from the crash, that'd be helpful. The
> GPR dump would be *enormously* helpful in this case, and even a photo of
> the crash log might be useful.

pc : arm_smccc_version_init+0x90/0x1ac
lr : psci_probe+0x1fc/0x2c0
sp : ffffa3d8eea33ca0
x29: ffffa3d8eea33ce0 x28: 0000000081000200 x27: ffffa3d8edd72a80
x26: ffffa3d8edd728b0 x25: ffffa3d8eec66248 x24: ffffa3d8edc528d8
x23: ffffa3d8eed7f4f8 x22: 0000000000000001 x21: ffffa3d8eea58410
x20: ffffa3d8eed7f000 x19: 0000000000010001 x18: 0000000000000006
x17: 0000000009f69730 x16: 00000008760968d0 x15: 0000000000000000
x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
x11: 00000000ffffefff x10: ffffa3d8eeac09c8 x9 : ffffa3d8eea687d8
x8 : ffffa3d8eea33cb8 x7 : 0000000000000000 x6 : 0000000000000000 
x5 : ffffa3d8eed7f000 x4 : ffffa3d8edeb0000 x3 : 0000000000000000
x2 : 0000000000000000 x1 : 0000000000000001 x0 : 0000000000000000

Call trace:
 arm_smccc_version_init+0x90/0x1ac
 psci_0_2_init+0x20/0x2c
 psci_1_0_init+0x1c/0x58
 psci_dt_init+0x6c/0x98
 setup_arch+0x400/0x5ec
 start_kernel+0x90/0x788
 __primary_switched+0xbc/0xc4
Code: d29fffe1 eb01001f 1a9f97e0 f0ffd384 (b94264c2)

The above was transcribed by hand. I double-checked, but there may be
mistakes.

Photo here: https://people.debian.org/~ema/Z5OpGluX6oX5NLxh@NH27D9T0LF.jpg
 
Thanks,
  ema

