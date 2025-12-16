Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDBED5E125
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 10:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bLnyMwbJt24z0SAwK1Vw8LDbfVkEjMUM7xGF0eU5NM=; b=3PI1QcV8IW8TGEdJV1x9edE+d2
	O01Ku+/b7ZVJtnka5eZM90dV8N4pBOlq9jxj+LYL/M8apMwrJ6Elrkm7xyjfmVBU/9y4ozRuEN8qT
	AeHE6hufeZa0a/vGjgYgDVrSdqLdXlM2A2tqMa1hhMHivzWWwiqUVVHdBKE7Wk+BImoWdwCoNllh9
	Djij3UwNUICa8xBdaTLLe0Bhv9lFecrCIZLz+XTM6frNKqZ+AXEhAXUpdvgt8vPpy3n6X6MVQzz1E
	dNGPZR1WMNiejyeJ8NnCw65EwVDlO1cRp4UjPk1uLx+G2TqpQx2IkGB2d0MV6TIMh9InZ++a/Psta
	IweDkpFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSXe-000000053Zo-2YG0;
	Tue, 16 Dec 2025 10:44:30 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSXb-000000053ZM-2mP8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 10:44:28 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4ee243b98caso243591cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 02:44:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765881866; cv=none;
        d=google.com; s=arc-20240605;
        b=DBLCGjFJ6nfcDec4QL2rLR8Cln6GE1xRUoXgCPHrcgCI03FWy4Ui9/4b4LPUADl0pL
         JLhbcPaORDojcpu1344iQ/qk4EOHOiLRvQ9gLdjpLbbZzA/MXtDo411GZ6cAcGJYuMow
         cQAgQYP9zeqxLMsFS4vqzWbSFxZ1Wv0IzLiBv4j4YgoK8Zy000Sm8EX1cADWXgSE7D9W
         W0YleVx8cdWhaCHdVM/K5QVoW8iqh7ILj2w0GZ5El+ZxC11mzvv5pz8HX+1z8omMZdE0
         j6sRhLh6Jdy8M8wt3AMBVj5vWJr1aZRzwwiGywMcdenQmAdymkiICIWIAIjdPnfoo39z
         2hnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1bLnyMwbJt24z0SAwK1Vw8LDbfVkEjMUM7xGF0eU5NM=;
        fh=nkXI7HfQpIJMGPb4iIHIxWY7i2jrttcV3m8b4KLD9bw=;
        b=YLOD9wdAetppMPW//sQelrpSuNA0X4dXtV6X+0T06A+bFxMkezP+r5xzrQ8CknZnCb
         yOSNcJUSh2JI+dSaTfS+eabwmOj57Zw6OR7KGePGFlrX/swLRRRCoRn0zdM2p6O1aFRP
         28+xGKX4WIoyoK3vlKbTQyu2j7wNjhTrMS+B/7V90DysojR/QhCybx9+TEEAkih+D18+
         3nRlPo+CgF81UEH9DNE09mgjD3hsQQZgyt0Mut3Q6zaq7QCANzlPYqbBQkCrw3WJd300
         nbDR0HHgodnTjB6Gts6Hh2NyjprHtN0eFMMZJUGCBwoEw2WDSMjABSO7pb5jwrJrYf8+
         3D+g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765881866; x=1766486666; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1bLnyMwbJt24z0SAwK1Vw8LDbfVkEjMUM7xGF0eU5NM=;
        b=xV8RlNx4/9BjfcWKE0uDh/ZfNBqC9EKXl0nHCA/b8ZGNgylwCfE0MfH6G8OvxnB9E5
         JAnRzdp/bSDseDSPnzxXwnUnoUSu4eg7kMrI/QOmZODMc1HlwPzznbkXw/UjNFPzQMZw
         W+a6E/ONkNJf4h7GMc4SfA8Lux8W8EIdV8PQBvLae9zzUF/lbyyk574DfJOCDtIZZYlQ
         OpwNOh1SOisEQxLPpMITbLucHZCYKxdrl6gr9KhLyYkoDPWCcZHEZt3Cgisb4EgPGk6n
         zRloRi8H/lrLMSdIMo8ul5r7a5KrZ4fR+cU4joylsokGeNzliG51yrMn1G37CPWBpxap
         nh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765881866; x=1766486666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bLnyMwbJt24z0SAwK1Vw8LDbfVkEjMUM7xGF0eU5NM=;
        b=M7f6819PvOwwecmq/rFSFPRWhIzeS+0fSIIVIcUAqkuEF37FL2Ppq3OR2tOSDIe5vQ
         YLbkpAu7GZs8E6lRXfkBPtrHqO2LCPJvrK2FjBV9lksDF2HaQk6u2dVz6MDPudxsfnlC
         uF/SUtmJ5VBlcKUP2AhXXPbRJ809fna3ogVIOOKfjrn9xiBawS+e4F+LG1zodamfXngg
         W3YBPQP5QcAARzevb2OH7x976n/qRPEm/mA6u65u66iqO7DUaxQFM7H8R/At+wki40OI
         QV50jyV02gqIvzxjMCbflrfsVxVnb1CRCg7gdDt+qpIjC7Ub5kySLu1o+YeaAVDZKuXx
         j4BA==
X-Forwarded-Encrypted: i=1; AJvYcCWnH/mn27Gn11zABbIXZfMtqXA9wg2XELH4ULM8dD9ymub0rBwvDLiw7R07UH79shYAnvWNlj1iRgFNiEWJMBKd@lists.infradead.org
X-Gm-Message-State: AOJu0YwrvJsmUX81UNwG8AxRcJZSpG2432Kd7qTwjpEoQvEIu75HgAcU
	x1zLUC6Xj6sKFK6HwNZ1No3jHx+vG34WCgxzOFMLSEZu8xpH/bk0u1b6j7F0hpFDx8s8Kx4T0eI
	VswQRj1akK2Gnihw7xk+PhVXiZy3HytB//rDeMEE5
X-Gm-Gg: AY/fxX7Ce4APQGE6UDiZLVV7xTM6t08Ol+0BTcqSZJv/6uJtJY18jvyQe8GeGiiD6+L
	VSnJoo0SgtDpiq3FNsQ7BPuetW5ywwKGXK9NCn6PEMVPtXSV7+L5lSfA3yggIYly02ku1AXASVY
	TYHR72xTvgyzIl+0cgeg0rGm4Lhl5BFhKDfafUZ33g3tmy/xz1cNWJbBl0VYrVFfgKBkTvU6IH0
	ECKjimm2M3Tz3abS5+8i5/uyIqrXtBSwB1yehd2XiyX2r8NtYQTtVf2b3YXJNYocvho+XJIRv0e
	vbNelyM=
X-Google-Smtp-Source: AGHT+IHz7BFOmePdPYRRE7Q8kvnfHsJmAEebo6Vy9yk0HTVhVqC7xGkfePdaKQeHq/oBf/Snyives1gg5U33ImR9vBw=
X-Received: by 2002:a05:622a:1802:b0:4b3:1617:e617 with SMTP id
 d75a77b69052e-4f34c9628ddmr2886501cf.11.1765881865974; Tue, 16 Dec 2025
 02:44:25 -0800 (PST)
MIME-Version: 1.0
References: <20251216103053.47224-1-alexandru.elisei@arm.com>
In-Reply-To: <20251216103053.47224-1-alexandru.elisei@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 16 Dec 2025 10:43:49 +0000
X-Gm-Features: AQt7F2pbPUAUSDN-4yptnwHbXr7-_gU3rXIO--1nsFwFxItLyZ6NRgGtQkeKyrM
Message-ID: <CA+EHjTwoimWFrLbL97nhBsKXAdDdSCrcb__MCacVHnk7Hvc2tA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] KVM: arm64: pKVM fixes
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, qperret@google.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_024427_710759_56663FA8 
X-CRM114-Status: GOOD (  15.34  )
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

Hi Alexandru,

On Tue, 16 Dec 2025 at 10:31, Alexandru Elisei <alexandru.elisei@arm.com> wrote:
>
> v2 can be found at [1].
>
> Similar to [2], when trying to run an unprotected VM on FVP with S1PIE enabled
> and kvm-arm.mode=protected, writes to PIRE0_EL1 made by the guest in
> __cpu_setup() are trapped by KVM and the BUG_ON(!r->access) is hit. That's
> because HFGWTR_EL2.nPIRE0_EL1 is an inverse polarity trap and the FGT values for
> the unprotected pKVM VCPU weren't being propagated from kvm_arch_vcpu_load().
>
> Couldn't figure out how to run a protected pKVM VM, so that's untested.

Hopefully this will change soon [1]!

I applied this to the pKVM/Android stack, and tested it with protected
VMs as well as non-protected VMs.

For the series:
Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

[1] https://lore.kernel.org/all/aTMPn0dBbSVUwwJ1@willie-the-truck/


>
> Changelog v2->v3:
> * Gathered Reviewed-by tags, thanks!
> * In patch #2, KVM now calls bad_trap() instead of KVM_BUG(). Also changed patch
>   subject to match.
>
> [1] https://lore.kernel.org/kvmarm/20251215114409.212512-1-alexandru.elisei@arm.com/
> [2] https://lore.kernel.org/all/20251112102853.47759-1-alexandru.elisei@arm.com/
>
> Alexandru Elisei (4):
>   KVM: arm64: Copy FGT traps to unprotected pKVM VCPU on VCPU load
>   KVM: arm64: Inject UNDEF for a register trap without accessor
>   KVM: arm64: Remove extra argument for __pvkm_host_{share,unshare}_hyp()
>   KVM: arm64: Remove unused parameter in synchronize_vcpu_pstate()
>
>  arch/arm64/kvm/hyp/include/hyp/switch.h | 2 +-
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c      | 3 +++
>  arch/arm64/kvm/hyp/nvhe/pkvm.c          | 1 -
>  arch/arm64/kvm/hyp/nvhe/switch.c        | 2 +-
>  arch/arm64/kvm/hyp/vhe/switch.c         | 2 +-
>  arch/arm64/kvm/mmu.c                    | 4 ++--
>  arch/arm64/kvm/sys_regs.c               | 5 ++++-
>  7 files changed, 12 insertions(+), 7 deletions(-)
>
>
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> --
> 2.52.0
>

