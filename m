Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA689CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 15:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRFgdoA8Tb9xPyc7tsp0kLt91evXE6mSbWW3PiLEJGY=; b=zvxrkT+sU8p+RCHGN12IRMO/Aj
	kBNJq0EW9v5QX6k3diOkSr6wyvUHNvnI0weReM8VBTeGLWewW0oY6uxWCQNhZ1ASXtd1bVgKozUA6
	sAsXJnpo5rBmP4rJphN+uV3bytUdbdzNBZxAdlNH+1kLCJHh49XOZ6hh1s2kcRpwq/qDYBCdDPFzj
	1FMWROIJkKZPoYegcVatTIHfS21wX7zE6YbZXIgeL8VVuKK/Y4xs2bQokEyLeUrhrNFHonFtiGI4C
	JyEIVPu/C97PJfOfHEgEKv2wzuQIdnXxWFuCFPgGAE3bC05fpmSPYfT3AsqavE4wZmN1yiVWImyKI
	LUj1FqIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waExz-00000001Vei-3ZB0;
	Thu, 18 Jun 2026 15:47:43 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waExw-00000001Vdx-49DI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 15:47:42 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-51765331535so275301cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 08:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781797659; cv=none;
        d=google.com; s=arc-20260327;
        b=b2NXkPQaSkRhblqDW12ZrwOmnAt3eBrk2KI7Gn3iz24Cz8rMemN3dm3w+GL/v4MFD+
         U+295WXAdA8582vZcE7xPF6n6dAlRzhN3ZjkhbWNxgXb1h+FlyEfIDtAW08NveRc1pqC
         EQFFljLzktTzYIUe0WnTNkfi7cXhIMKrMGWqvYvREHV14sMhK3cQQwckUUasVWCsHm9R
         eYy9DomyVk9pswYePJ8Lq/KYmtyUZKyTHtJJqUH3n+Th4LFOTGrnP4UoTUGPNPxF/hrO
         bIQfNg+B7xaiYi4qrDLXZzyBn6I+JCnvBJLpwwSEF1/rbcBcZWO9CfzpKF8+qxIydv52
         s8dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MRFgdoA8Tb9xPyc7tsp0kLt91evXE6mSbWW3PiLEJGY=;
        fh=rKbt9uhsoRpR1fwGYuXmjjDzjcp0IkLFvSQ5ZF+hVTc=;
        b=VN8FCt/uJILejlvupQ4p2MVtL5nWewZYfxVk8qF9KlTRnfViS2nGQ5gBehSAEh9HNA
         f+PNbOcB80tYtc/hXY+94Q9nQC8hO+q6YX6eyQypzpoQRrHSKaZzLqiq2FGwcJUOEbyL
         gwr6ZWSZajCyM38b585WcdEPlVKgnmq7ItlTlefzyVmcCyiBsiP1p4586BYB3IaTYtVo
         ZkWiPuvwFyfUIV5W19xKJlazmcX8aT8bYxWtiyP8bTOCZQTEomcdkCpQ1HHAFsryNpCk
         BYny1FiILRLN7kEEjb6jsGWhN0Hw3zET/bb9r/dQ02XSYL6IhYmS7eEopKtEawHWdppJ
         xqEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781797659; x=1782402459; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MRFgdoA8Tb9xPyc7tsp0kLt91evXE6mSbWW3PiLEJGY=;
        b=IxwIdpzlvNESyCxFAbhCFFFB7ikSdz0e6P4PqXqRxfjTT1FMSpngQ365maBiT9U25A
         ui6NuR8MndQTdcZqU/0vpTNgo+XgEZDhM7+gybI7K5ZgF6sS3w6aW7NPd+zEBLjGzPW9
         MZ5ZbKT5jlEIYazZZ4RYQPSy58ktLMfohk9JYCV9TIZTjQ/dWq0gmCANl7c6XW8J0Rog
         vDQSG6Wio5UkfEmuuz6DV8xd2bywKIP0AAL1tfA0CzWEKJvmoE5pjPfIbxSog+hP62jO
         4e4hk2hL97IQaCQnGMQP1OVkFwLvX6DU8TgzlBU7JWcuBeqQujZnMSvK8h378hYbxbTx
         hpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781797659; x=1782402459;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MRFgdoA8Tb9xPyc7tsp0kLt91evXE6mSbWW3PiLEJGY=;
        b=WJhF67M8jk7kxHHDzeaYYzcHz50FoyWyfznjkzBP1Jm0SQdr8Ldrji/NqxO9DI29dY
         T7xJ2XLyHbEPf3GURpE7qkTSRfSxgLV3QQbMIcP/Zl2Tbjdenng4wpCLWdIyycCgcRty
         0sK4dlWtyiXEeCuwAH3trMUWxyAhOuaZFY2faVE5eG0YJLSUYAgEKeQVOA40S4Vq0mXZ
         t2/Qgop0N8xT4uJ9WyT3sHWVs3OfIRDc+kKFzL8nYHZVMDvPoDhh4XJbnI6Z6Ji3eXf9
         8DzqZXpqWY/z7sHUV+ihRKdpJPYCppHQ6l6+UOqpVndEa1fFZUiP5ME3bjHV0JJqRBlQ
         C6KA==
X-Forwarded-Encrypted: i=1; AFNElJ/XZiTx1xu0OLMwhX6EXjoOd33a0H6HhkPA7SZB0MP9SiXRa/Dv2RNfGvNgcpG2NhhZ5Oy9Xj3FTIqzYPDzrM3i@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5LsorehREzBdeOIMEySdIN6wPOEU/SM01y0ekAc34g40NvE5K
	uVJ0glJQD1CfLY5elq5errXbcgchRcDYTTJjwek3BKEkAfB9mRgwvtVq6MxWY5vjz1rdUq0DnAB
	RJ0ndUVSrUWvu+uJk9prL2TP5+RDe4USZ/t44oWWl
X-Gm-Gg: AfdE7ckPIen+e5KwNe4u8p5BEDsUDkkbZexhFplBfqIiNdho5tIGWsiN/ZGK8tjyOTM
	qC27GEE0y8HEicleX4+YtWgSp8ER51+zg64ZKQL6XENLaQXJG8+c7EBfuftaEnq+YDHIzODLSK1
	P3Z+Xnmkp7ss6b74JEDt3LoO/OoOy5vHOpBld58TIcnYM36s+iwHYNr24gnJCXBNv66o+sZbALW
	VwBk9KSJfgV3wQS1PQMm4jagiIVXr9YAqfXo+NYMuZbwst7C7B15/ViIM8wt9yzh/5eK/vomXQc
	tUj6j7Ck
X-Received: by 2002:a05:622a:4d9a:b0:516:d570:82c0 with SMTP id
 d75a77b69052e-519c9775acemr8514741cf.15.1781797657663; Thu, 18 Jun 2026
 08:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260618121643.4105064-1-tabba@google.com>
In-Reply-To: <20260618121643.4105064-1-tabba@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 18 Jun 2026 16:47:00 +0100
X-Gm-Features: AVVi8CdsITDRUKHQCPiJRE7xA_VLp_pZNxNzO3JRnh-OLh6r8j1TswlbWR1CqTM
Message-ID: <CA+EHjTyjst=3hrMwX2Obh8hNpEQNJgL7i-2xcOpgDrb4kHZfNQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] KVM: arm64: Fix missing ESR_ELx.IL in syndrome injection
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sascha Bischoff <Sascha.Bischoff@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_084741_067249_ED734A24 
X-CRM114-Status: GOOD (  24.65  )
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

On Thu, 18 Jun 2026 at 13:16, Fuad Tabba <tabba@google.com> wrote:
>
> Hi folks,
>
> After sashiko caught the missing IL bug [1], I did an audit of all ESR
> syndrome construction sites in KVM/arm64 as Marc suggested. This series
> is the result of that audit.

FWIW, went through all the issues Sashiko raised [1]; the only real
bug it found is the one we already fixed [2].

Cheers,
/fuad

[1] https://sashiko.dev/#/patchset/20260618121643.4105064-1-tabba@google.com
[2] https://lore.kernel.org/all/20260615131116.390977-1-tabba@google.com/


>
> The ARM architecture mandates ESR_ELx.IL=1 for several exception
> classes regardless of instruction length: EC=Unknown, Instruction
> Aborts, Data Aborts with ISV=0, and SError. For FPAC (EC=0x1C), IL
> reflects instruction length, but FPAC can only be generated by A64
> instructions, so IL must also be 1.
>
> Patch 1 is the bug sashiko found: inject_undef64() in the pKVM hyp (EL2)
> path never set IL. Patch 2 makes the same fix to inject_undef64() in the
> normal host path, where IL was derived from the triggering trap's
> instruction length. No instruction that reaches undef injection has a
> 16-bit encoding, so patch 2 has no functional change today.
> Patch 3 makes the matching fix to inject_abt64(). Unlike undef
> injection, abort injection is reachable from a 16-bit T32 instruction (a
> 32-bit EL0 task under an AArch64 EL1 guest), so the old code there
> injects an abort with IL=0.
> Patch 4 fixes the FPAC syndrome constructed during nested ERET
> emulation, which did not set IL.
> Patches 5-6 fix SError injection in the emulated and nested paths,
> neither of which set IL.
> Patch 7 fixes a fake ESR used to exit to the host. The host does not
> read IL there, so it is not guest-visible.
>
> Changes since v1 [2]:
> - Patch 4: keep IL by masking it through from the trapped ERET's ESR
>   instead of OR-ing the bit in. The ERET trap (EC=0x1A) always reports
>   IL=1, so this preserves the source syndrome rather than adding the
>   bit unconditionally (Marc).
> - Rebased on v7.1.
>
> Cheers,
> /fuad
>
> [1] https://lore.kernel.org/all/87pl1t8q24.wl-maz@kernel.org/
> [2] https://lore.kernel.org/all/20260614163336.3490925-1-tabba@google.com/
>
> Signed-off-by: Fuad Tabba <tabba@google.com>
>
> Fuad Tabba (7):
>   KVM: arm64: Set ESR_ELx.IL for injected undefined exceptions at EL2
>   KVM: arm64: Unconditionally set IL for injected undefined exceptions
>   KVM: arm64: Unconditionally set IL for injected abort exceptions
>   KVM: arm64: Set IL for injected FPAC exceptions during ERET emulation
>   KVM: arm64: Set IL for emulated SError injection
>   KVM: arm64: Set IL for nested SError injection
>   KVM: arm64: Set IL in fake ESR for pKVM memory sharing exit
>
>  arch/arm64/kvm/emulate-nested.c    |  4 ++--
>  arch/arm64/kvm/hyp/nvhe/pkvm.c     |  3 ++-
>  arch/arm64/kvm/hyp/nvhe/sys_regs.c |  2 +-
>  arch/arm64/kvm/inject_fault.c      | 18 +++++-------------
>  4 files changed, 10 insertions(+), 17 deletions(-)
>
> --
> 2.54.0.1189.g8c84645362-goog
>

