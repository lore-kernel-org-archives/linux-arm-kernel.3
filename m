Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1976CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 14:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UyXA6Kbx2RrlHyZTfn8yf8h54TNQENLjWNQqtxe20s=; b=rUETpglMXPHvPGGXcjFg78P3dR
	f93tpL5E6lGh4lw5cd6SHxPTAxZYziJTxc5dpL2GZlTmURTF9f5g/KOrGdprBYQ/gBZyQoIjgQ8Hi
	G9Bl5hpj6MJZiahisVqfyXtjtSYfLNR8K9WJ4DrErdMXSUzg9eMRzYy749mSZr4a5JgqVUGG8yubY
	7cduK0b/fM83B5TCaYNqqAlP0LZ78ocRDMnIlWpPrcXHsi4VqjT2mpvH3pJpnmoJVL0kjJ3Iqv3rG
	PjmKyxTEKOaUshc4zokXlSEaWt1175Zn18xfl65a8izvEYkurkZBh6fZMNe7IL6lH9ronKzD6VNq2
	+9VtytCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESVX-00000002bUK-0Qc4;
	Wed, 07 Oct 2026 14:20:35 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESVU-00000002bTV-03LN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 14:20:33 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5ba40832934so7325e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 07:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791382830; cv=none;
        d=google.com; s=arc-20260327;
        b=e4vjtTG4VDzrxJOZxlyZmnk2Hmvi1GIJSryEuMwBbaYw/viy1fT0XH+ojyMRTTJAO+
         B3AGkV5KxoHh9HYaOL4Jnlqxm5WEnHWG+dFCKzMLIJPpkuPS25348psmtctHZ2tc2S0w
         c76S00reE8kMUktuQ4iaXV518pbNQd3fSSKsK5K90wb1SizCTXpz6ZVpHqzkxCR7maHg
         SfBJL3UIBGcgNzOybXhsaEMhL/af9hOB3VYd4okHzHOHKKyLR+5rfOtTdPGOq3sEl12K
         4rS34vsEYvv5/3SoYkRieekaFKQSCagiCxANapXztkyvlSerYnQFo7k1Po0y5/NKoqhX
         logg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4UyXA6Kbx2RrlHyZTfn8yf8h54TNQENLjWNQqtxe20s=;
        fh=YgPkraICJI0ARAMcK36kV6LqR9e94WKtxcMD9H/k+/U=;
        b=egjJ2j/8Fd9E31QILVEYded9UmzbFEc54nV67cVQY1z+J9zuh1DNOXPvWOby6+iouE
         US2hTbphqIYBKXp/OeUncbGvY4WX5Y9hrxfAIoqlCvF5zmQOELA+7HdV6w1MOLqVzzz1
         YtQDxS/SwnMplXsAHKfPSeT43D/Z8PV6xeCg0tp/Pi/vo9G8VfzvMbdxlPN0Dy5CfDKn
         PqJHJniPDqsSArU8PEhS828FJJJJXh2F12eZlP+Lw82sThGF39HPEutKeFUmNUYU6BtS
         f7z4Cj68oQbORZCRNdBI9KAb1WjnJ5N3yATgO3rGchYDQ2sep7zB9ZkeKUwrruQgAE0i
         hrnw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791382830; x=1791987630; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4UyXA6Kbx2RrlHyZTfn8yf8h54TNQENLjWNQqtxe20s=;
        b=Y2junUCuzDMR4P52/yciceRdjilvB+ntB67EhYtDj9qvTr2GyDZuVtdKUHoyiGs0RZ
         bz0+w9EYyBUbf9WajYeQhvZzJ2wzNADLGG+XhXGnbqJrJVV3e6Al1Pjotytb1Km+4VVm
         5+hDqwpbKHgTMhlw8JcTGQ/A0L7AqrpVTMDld7jOBWSExHxx208Hv0F5+fcvdPnD4RNN
         DmqWO+K8Z7g08WCB+eR+fYsJDDUJSp6y6dFYdLwEr9y6IsFMit7mmGVMqvwIRHBR434Q
         T2TLOPkN7lU6QwVfwe2FJGKwu2qP0lqXeDg4PxZs+bItUEghaXWdRZm+7EvMV0QDetXM
         zfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791382830; x=1791987630;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4UyXA6Kbx2RrlHyZTfn8yf8h54TNQENLjWNQqtxe20s=;
        b=Tz8UHtgMGO3DGrmdDR1PHY9dpZVX9/8PEyLz0Z4Yc6ChxiptnVk8VtcuuVcC7h76w3
         1Eadd2ytxMx1XNqkj7x2UmDnYDlAON6UP3kQKr5q73uJAdy1pW5FCFCFlnKmtvqu1KyJ
         Vlwwg9nriedxUnxcU07gAyvSCsb8k5uXx92tUsDsWlszqRqeZfL/hqsUC1YJ8EJ+Lc3v
         Tx7AonAa2Hsz4RogBfTMOUuUVSmcjkQyqLutG5hgdLw8hu4cdYqaQaHIplmfSYRT+cRA
         ITP1sCOKvGUCCxRBfxfXpkBOdCtIxyNoBwAJSU85cXqvJiDUDMzAhbzZkZiT8Wl/hqB5
         bLtw==
X-Forwarded-Encrypted: i=1; AKwUvByCUqR7yEMY7QF3zbkcSgqnEXvZmesv7L0AN8L7uDQiH0YBRfGFErj/YMz3En3b4yRuZhAQyf5+jGW67PgpoQ6/@lists.infradead.org
X-Gm-Message-State: AFq9FYIFG/wWYlzrNbnAQ6EKNdewBLhtfyzLMynu4lhLPNI7UhNG5Ptu
	qLbg3cWoXMaGNw7/P7TECfBk6yT3UXGkguc84vzmuz2R231Y+Ug0LHb8Ddx5kQdYzk+cLUPe1iZ
	UmHrZSpnPV35AJETCEqnjAhKjXHEi9+sIqbCkKZ4k
X-Gm-Gg: AYBFou1FKYHGMh8cNaf+1WPeJF0HnwDLS4UaN/LvI62CbSJqh6FH9n1zV1ChqtGy790
	NbJhjXr3REB6C7/7QT49bJUgrifZm/RPSxa3Z3psUwXPC9fD8a7CmEKHmgkprYvT9hEvPyKzYdp
	GjzBH9d9qPad1UCSUoK8TxYYjxbWCiRpB2bSx26A8jLO5T+GsuOHfwRTI9ddYgH90qsv5XIE4e+
	URHZWAxbmTytCdr7thIiYujMGELjkGvkoW/inq69FjOGRHbur6oB04f+U53HGMmB0iqj+0WVWjp
	TgBvHB/hj4yCbJnl/71ZOboUNG45JMZw8YNZSHObniDX0spEG8ud6ht+
X-Received: by 2002:a05:6512:1555:b0:5b8:ebf3:3370 with SMTP id
 2adb3069b0e04-5bcca158f5emr347184e87.5.1791382829437; Wed, 07 Oct 2026
 07:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-15-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-15-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Oct 2026 16:19:53 +0200
X-Gm-Features: AclHuK_RXJYhqf_nHqmpzWADAUDPbDkHCi_xcSBTNQ3epFkbXZUQQ8UXgywpORk
Message-ID: <CA+EHjTx-niYPnnRDvAAiY3MXLpSYau_PhiBTCiE9mOYUChASPQ@mail.gmail.com>
Subject: Re: [PATCH v23 14/14] KVM: arm64: Prevent unsupported vcpu features
 for VM types
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_072032_316013_FB086344 
X-CRM114-Status: GOOD (  11.78  )
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

Hi Suzuki,

On Wed, 07 Oct 2026 08:35:37 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 4d0e6bd2009ac..97089c81d6428 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -42,6 +42,13 @@
>  #define KVM_VCPU_MAX_FEATURES 10
>  #define KVM_VCPU_VALID_FEATURES        (BIT(KVM_VCPU_MAX_FEATURES) - 1)
>
> +/* As dictated by kvm_pkvm_ext_allowed() */
> +#define KVM_PROTECTED_VCPU_VALID_FEATURES              \
> +       (BIT(KVM_ARM_VCPU_POWER_OFF)            |       \
> +        BIT(KVM_ARM_VCPU_PSCI_0_2)             |       \
> +        BIT(KVM_ARM_VCPU_PTRAUTH_ADDRESS)      |       \
> +        BIT(KVM_ARM_VCPU_PTRAUTH_GENERIC))

kvmarm/next already restricts protected VM features through
kvm_pkvm_vcpu_allowed_features(), shared with EL2 (0b7d843ef3bf).
Could you rebase on that and drop the protected half of this patch,
rather than add a second list?


Cheers,
/fuad

