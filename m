Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46ED3CD583B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 10:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4igsSMJUm2pHmfSuYxdMWMQVSss89GbaNEs4ZiMiGRI=; b=JMCpft1ZD7vxm3XJq9u5pMiWHr
	9K6hzxfx868dWOIKooSeZgD3j114fWDWEmw4Ti54U/TXPqblYwLjclezrxbkYqfxacgWXcIixIvvf
	kG9AD5sRnib62B3gpntmtb/EI7h+6lTzlw/JYJj7R/fEtBTPaMpNfkxUgqpJumPHg/ng4Zxyk1jKp
	SfPThium4TEaLTjZZqnFegbSMRYyMzJuxNGNWX/TiFAy0sqZZwx/KKNWIzTAtK0ZMeSYtrYBpO2Fx
	LxY3eh1SdkRhmbN6Y5uvsi4oiQQxEo5tGYMJ8HE04dh7jcgBSQxKr4iGDh6RLfsuFJghTXdD+6tUG
	ZnY5FCJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdR6J-0000000EkAo-31EM;
	Wed, 07 Jan 2026 10:49:15 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdR6H-0000000EkA4-1X8m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 10:49:14 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4ee243b98caso267811cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 02:49:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767782952; cv=none;
        d=google.com; s=arc-20240605;
        b=i6HHpe13OZdtlXYlLd64ZelNJJNJ2lFDGPiy6eDGHSBlJx0WMCKJ2ktel4TGhKJdeR
         5Pa3qSJiH5fjKnTbtNFd4CSNW533JFhdiE/jkCHh9l/4HNUJg9oBtNvImqjp2ov5nl3y
         /xbFlADOqyD4nOqLHKn94Oy5Ay6J+NFfO4v2I281mFeRtWlgDNcEfjfmP1VrIZMYhbsf
         xpUt+C8wfQ8rdl/DlHbrAlVr8E4Db1uaUyzdl17znvI/a0cja6o23PL9Zl0IewPzcjDf
         3QYRLiIJVnynOvxQryKE2sqfRR2UNFrQ6KQ4+F9QQnGzoCpp05t7wC3vs7sk/z9Gdce4
         pDIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4igsSMJUm2pHmfSuYxdMWMQVSss89GbaNEs4ZiMiGRI=;
        fh=XJZxpkM38ITBrReLoyczsP4zkSBtHqoBEqpIKT7eg0I=;
        b=M0xfto7wQVr1qkj4xyGlmL/yGNZvmeULlXFYbnzmaNjqaJaHCTveyqjT6c9boGCjVa
         VYFD5tdR0k3F7Z3KBg85utvR8RSaD0tBqyxSY48TxdrfZI55rPiul0LHeysUYNsYedyJ
         5RbZc8Jqr7AOAS62ITNGsksmGo5iZUIUYJrxUhDadwTYKAf03QptQlkAOz19UBtONgsF
         sQr0tzSuXS1a5h23A/e3UEdHdIxEqmw3pl2I7vYaEOJa1MeKq889rlDSybWC1PsSfh6y
         aFfw6DLPS/ZHrB9+/7ZKawe8SayfZqUYBCAd9+Ad4efnwKwHIaMNrBDGDzyuja9BapO6
         IMyg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767782952; x=1768387752; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4igsSMJUm2pHmfSuYxdMWMQVSss89GbaNEs4ZiMiGRI=;
        b=O+RMrpI3Dol3YMEvK2lrPv+tCur03pxSaU2NyZIoH4hdtfXEHgaiQYm/g/iAI6HTO7
         tEMWFsI4egncFkZCsLnzVIulNPeeF3hMihazFAQiIMjGSt9vvNQMsJ6LdIr0fLFYRUHP
         gVH77hNmlh0rx13TuYzHINmZZ/VMUvIWdx5eD6RoqwyMShfG3OTSJM3trutpLA/fpQov
         fb2azunm4Sp1rlxSgvGhr1j+dhvlDR3JpLhqNyi3e8pUIjVBBjL8hJzbklpLXGtg1ocs
         Jh17G0MemU0BV220oTp6iKr/CE0+L3c3hzGK5Znc3n8f3dLNglB3rnexg4EEWFspnXrI
         cFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767782952; x=1768387752;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4igsSMJUm2pHmfSuYxdMWMQVSss89GbaNEs4ZiMiGRI=;
        b=wIAEsjChgr1mrAdNI37HNaV11dZZ8aB7LqUKsv/ncxYtE3mKaYxmsWpvxSQgvCLqtN
         Tl5MTP67yabY+DIAjMRr/rGzoNAyuP14kRRI6SVWujxG9xJ6GoCzCyoI2R78lHOF2BYs
         g1/yhvsYaoJDEhYVssC3aiN/FXb8mQmGs/hV234NgKG9d7uhujFsEIGIhqBOITY3bUci
         NLYgdUcOHqf3pVT7CALtbBXqacZOSPQ8EUro/DHgLRq1eJTLdDeAY0pV1+CH2yb7Lg3b
         oswVKRkqTnY0KrjqxTz3nXz/vZ2YKLXom6mERo9sVwyQcv4i8e22pA5ZNZ96STHeFmpv
         K9xg==
X-Gm-Message-State: AOJu0YweYbun+rnLDRrIcjFL6lxZq1bOP/nelzbOryVswZEJS7oedkiB
	uhpIAcy83tl5Lwqj3OJi9Tr1WpzQxQ8HXNs8SQLpqKV7rmtBxdMB9W4q1ZKlBGlFoe5kZYCVidj
	Cf71ZjARkOqF0d1moXoz1mu+mSVn5Sqc8BlWdfSJV
X-Gm-Gg: AY/fxX4s+7mHPwLcg9sFWhMnFC91dn/Lv5XkgR8kzARD2KesbiVuyaGC431b6fkenwQ
	V3Y09dTlQdjLLuaqsRbxefiCNCbY5DcwoCjQ7BX4ciUl35rGT50/vIjcKhdeVRhhXLH2w6L5pkL
	QsxY7D5gMPPYau8T6vzwBYpYMUiqcnZEXLMDT5DMWAowmHaUkN4G2OaLk1IMFBu8uSA8YYRdoQB
	0DhB/Q2C6cDiptq44U/SFBJkzhSAH3gXtpJ8h+hJDB6xFEwqwJ8kCdVTyhBzQ69V4r7f4nZbUh/
	41K9m0ZM5sRaZkEs8vQqgB1I
X-Received: by 2002:a05:622a:48e:b0:4ff:7d4f:85d6 with SMTP id
 d75a77b69052e-4ffb3ca5633mr9973581cf.4.1767782951799; Wed, 07 Jan 2026
 02:49:11 -0800 (PST)
MIME-Version: 1.0
References: <20260106173707.3292074-1-mark.rutland@arm.com> <20260106173707.3292074-2-mark.rutland@arm.com>
In-Reply-To: <20260106173707.3292074-2-mark.rutland@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Jan 2026 10:48:35 +0000
X-Gm-Features: AQt7F2o5E_UoBDHB2Y99kOqP1XdD5xVVTTSRk8eYLRdaG-60Me90Qfr9L6BWJlU
Message-ID: <CA+EHjTy9n+eFe4Oxjsw1zO1QxtR7UTnpnb=jjTJU3Qz329PC3Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: arm64: Fix comment in fpsimd_lazy_switch_to_host()
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	broonie@kernel.org, catalin.marinas@arm.com, maz@kernel.org, 
	oliver.upton@linux.dev, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_024913_418753_8A4E7730 
X-CRM114-Status: GOOD (  20.49  )
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

Hi Mark,

On Tue, 6 Jan 2026 at 17:37, Mark Rutland <mark.rutland@arm.com> wrote:
>
> The comment in fpsimd_lazy_switch_to_host() erroneously says guest traps
> for FPSIMD/SVE/SME are disabled by fpsimd_lazy_switch_to_guest(). In
> reality, the traps are disabled by __activate_cptr_traps(), and
> fpsimd_lazy_switch_to_guest() only manipulates the SVE vector length.
>
> This was mistake; I accidentally copy+pasted the wrong function name in
> commit:
>
>   59419f10045b ("KVM: arm64: Eagerly switch ZCR_EL{1,2}")
>
> Fix the comment.
>
> Fixes: 59419f10045b ("KVM: arm64: Eagerly switch ZCR_EL{1,2}")
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kvm/hyp/include/hyp/switch.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index c5d5e5b86eaf0..8dce3da85da35 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -495,7 +495,7 @@ static inline void fpsimd_lazy_switch_to_host(struct kvm_vcpu *vcpu)
>         /*
>          * When the guest owns the FP regs, we know that guest+hyp traps for
>          * any FPSIMD/SVE/SME features exposed to the guest have been disabled
> -        * by either fpsimd_lazy_switch_to_guest() or kvm_hyp_handle_fpsimd()
> +        * by either __activate_cptr_traps() or kvm_hyp_handle_fpsimd()
>          * prior to __guest_entry(). As __guest_entry() guarantees a context

nit: Since the new function name is shorter, you could reflow the
paragraph and move the word 'prior' to the line above.

Either way:
Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>

 Cheers,
/fuad



>          * synchronization event, we don't need an ISB here to avoid taking
>          * traps for anything that was exposed to the guest.
> --
> 2.30.2
>

