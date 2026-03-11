Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0CDFD88F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5q/OoIe7MzcEL3UFP81+GVcYNliiB+ErNkv7hGJrr4=; b=KmF/ee9+yx/M1wH1RzvCcNVLwD
	cht8K/J84tRUlDijcAK9B2FiO1jyBSNNWUf0KxtTOOGJ6k0I8HFGuauL10V85JXPEjR/BUBvGjhle
	EPelsNmh02Bdju773oNTR6Ft2tnpzVQwJnltczgtudW/XuUPZF239sbg+8EGhr9cAPbv9klt8RQ/U
	tkRJOMJxtmrSuOFyRj9B6PPCen6FUodCg+crFrwF9HATJbtaZh0OvcUoAHPienR+zsdIlbxYgFKHH
	6pTDfIDzt36Smhjy5uUpBicl++0D8rHmPOvFTmmPv+/JSI9SWC/J6QjKGviBgr9MtD6BfCa3TZ/hs
	vVFH4ZIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GcJ-0000000BO2n-3y5J;
	Wed, 11 Mar 2026 10:16:39 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GcI-0000000BO1X-10UR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:16:39 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-509062d829dso410771cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:16:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773224197; cv=none;
        d=google.com; s=arc-20240605;
        b=ifbBXc+L3TVFj5yTsfGj7vjNKtB8w+mlNL5b8MxCVHnmSoo9jdreoQgNhzA0Ixlrg3
         /qaUo8sn2/0Li28QFMBF7C+l3560jrEpglhCwkPUwtrU6E/yDfj+xhvFfn3KH1Rfg/VG
         Q/XD8qQ7RjhwYqEJLRDQ/qavYO18kbB8Xi/O5CGeszAncEQUFiwYQmz09MxxxEtkGjOb
         CsjJP254TUYqJ/hVpSSVQFzkeWK2GM6fFLtr47qjrmZOq5z9rb175ElpeIQ/YERkdkaD
         wBStbvTJNpH037mhLDaz5eYCfJAwAZT5OLBKhrftkOpgfmwfr14KHQ2o0T7LeJoJlCfe
         aBfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N5q/OoIe7MzcEL3UFP81+GVcYNliiB+ErNkv7hGJrr4=;
        fh=DDLuhqsEz5wDGurvFA885nhiFgswKawGMJTu++QaYpI=;
        b=O3WBU4pXCPGUTgcnHcr/qONVOKf4UFCI7zy7hrDxldVqH2BdWsInJ+Du4xaxIoW2eI
         QXbxfMFdTZHuJ6Uz0/9/WvhbUrvlXGzqPXmEQJUHkGmDuwBi9+AjlKT61gpp1dkdL3sL
         NH2Dka0pZlyaLgoPQQcaL1rHgKxzpF+6CAdW5Ccj0z4OmQDDrBZZsikhqgeUlJW9RUtx
         aZ1vnzQcUGRU13mmNAvOEOXn7aTzlUS9aV3rO1+CdUeoRbogfnkVyzdBYeCpfA4OscZ4
         ssuQD/QtsZ3Gp5jF5ZPAS6tq+pOJ/lQqxLFCsnK7GJ4obBKOxQuw5L0ROZDwcZ7PkMLG
         t1IQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773224197; x=1773828997; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N5q/OoIe7MzcEL3UFP81+GVcYNliiB+ErNkv7hGJrr4=;
        b=XYxw6UAtZp1pK4B+qXXWMd+UGLLMnosqkM/A091YDPS3hwK+iwFw2CT7y//r8ekFiK
         CdKzdVK3p+iXLeqj1V8NFcCNzKjIUPFJesHZw5hbSTuf8PJH8776KTAaYUhYpmogyFzN
         88jASUSonlPnbplQpQs4Sb0kKcn1KcKhiKhfn+WkzSFRfxoNu5mZi/7gQMewuI2Ni3Z7
         a9i+E2ipWdDg3LgwU4ZMOeN6dqkLAMpsbgMNjNA6e1Xz81KV0k4TFUFUrkrwx+OQMsK8
         i9HKEYA8WmnpcHXUgSAf6WMr0e4pc2pUUaJRXwOKXrfOCmFhrTzJAhxMgUVPTrPsbkDu
         cQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224197; x=1773828997;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5q/OoIe7MzcEL3UFP81+GVcYNliiB+ErNkv7hGJrr4=;
        b=Zwwwfw+87kyQm7PJttiHvvAQSfdcZyHgHAUmWV4KlNo23VQQHcSUZbq5dx8s6DFJiw
         L9QkJftmTMMogcs5+KfwyNRIfb60gWwrECs6Aiz2zkVpUEr3UNhMcCpa9jcTAK3jQtCo
         +FVr5fN0S0vf9UUVwcWnW8iPDFNooqpU6cqGVkN7udKcklkE6+KsxswBHRYDkwogmVVl
         ob56OYwaqsiIw6a/GT689L4+R7ROmcj8ljcRmFpyjDDth/icuRt7imqle7UZjl6IBP8T
         6bjpuEAfpzW8e7fZZd/xhLuJNRaNWfI8jKj0bqZeYlavYSWQguWpxx5di5LLO+ISNnSH
         RkrA==
X-Forwarded-Encrypted: i=1; AJvYcCVTlph/GBLcK3iuEu8/xocG8JKy9xeBpbCnvDeBGgU+beziEcWRSDcXRzswA2OOOtRPt7Ak07yZUkXWm2/QGzCa@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmb1ZqrNXjLfwVGHS0OneE/iL5b8IKmnh9pN9MXTPO37iD2UWo
	2HUBUrxhix1iayfiR5caL3fAz5/L3ygQMCwHanC6gsO2VP7kBcrFlhYO5SdE3abonh3U0TVLabb
	q0m7IgUQhWxejAQCrVPpDJEk+E/IQ+dw5LX5UAf5v
X-Gm-Gg: ATEYQzxBnYfCGYCmfCVJqH+lNtSY+n15Zpw6ptmbjuw5h3ecXbXgolMBe/7wdgVwnBV
	Au9RKcTYw7TD3QmE+iVV4OlhU+U/JSgi1kzuakYv/TOzfLCBiaLoT+/VvfF89VYbjbwii9VHgLO
	XLr3tZUoedVZIII2ayVGak09OFWQeYEcM/gWhdqZYIs6+yUUV6YeIn+3HmXRQ4AEivDdWlldxms
	tv7b1rpwASBuKzkncB3v1gbseRYW8VLpBjVFPKZY4RK903kEzHt7XSu9xhUM99inHSwi5yNRLHj
	/O+vNA5UszsgMG1TBDihPHzpSK3LsOCAIITWYw==
X-Received: by 2002:a05:622a:19a3:b0:4ed:8103:8c37 with SMTP id
 d75a77b69052e-5093827a36cmr11288421cf.12.1773224196603; Wed, 11 Mar 2026
 03:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260305144351.17071-1-will@kernel.org> <20260305144351.17071-5-will@kernel.org>
In-Reply-To: <20260305144351.17071-5-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Mar 2026 10:15:58 +0000
X-Gm-Features: AaiRm50BjnGexUUYazkxEAHHsZsBXlEzYbXtALA_qr4JeNpp8BQ5cgNF7CG_T18
Message-ID: <CA+EHjTwnyVKZ2SHJPWO10erH6NjjmQ9J3RKZoKOZx1uM4woY4A@mail.gmail.com>
Subject: Re: [PATCH v3 04/36] KVM: arm64: Don't advertise unsupported features
 for protected guests
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_031638_287669_49863A12 
X-CRM114-Status: GOOD (  14.76  )
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

On Thu, 5 Mar 2026 at 14:44, Will Deacon <will@kernel.org> wrote:
>
> Both SVE and PMUv3 are treated as "restricted" features for protected
> guests and attempts to access their corresponding architectural state
> from a protected guest result in an undefined exception being injected
> by the hypervisor.
>
> Since these exceptions are unexpected and typically fatal for the guest,
> don't advertise these features for protected guests.
>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/include/asm/kvm_pkvm.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index 757076ad4ec9..7041e398fb4c 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -40,8 +40,6 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
>         case KVM_CAP_MAX_VCPU_ID:
>         case KVM_CAP_MSI_DEVID:
>         case KVM_CAP_ARM_VM_IPA_SIZE:
> -       case KVM_CAP_ARM_PMU_V3:
> -       case KVM_CAP_ARM_SVE:
>         case KVM_CAP_ARM_PTRAUTH_ADDRESS:
>         case KVM_CAP_ARM_PTRAUTH_GENERIC:
>                 return true;
> --
> 2.53.0.473.g4a7958ca14-goog
>

