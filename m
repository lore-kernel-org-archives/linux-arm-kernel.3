Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003ACC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 11:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgvBuiLRj24R5eL34h27DbmmXIsCnSbcavTOpGhYHMk=; b=ekz+lQvM2CI/XGtuWlHiw1bz+O
	4AVKNOQn5DToubcup76XRh8U5uImWogQc5TdEnStAIi6Utg4xXi5vPzLL58xiTGBwG+mRGIGXMbvC
	6x7KT1WcNgvfHU+P1MxjDedkTotPeQVMgrnIOKMaOB9U30sokfAaYkVDc8A4VjQxm+8kRbRWS3qJ7
	U8Ew7amNsz1cdccJIgQdbJHUnkTN6QgN4I6bMSSitVx1Taj2Jw4k5eItplvI2sknShy3RruomtgmM
	RyWXDbd6Z/0ZV3rXbkX4Il1dLcuds4jGuGG7K43qrhptWaudtAnnOYb8Fp/9UhCvv0Re3b/j8b5KE
	hVAOmsFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2dh-00000007kza-1tBf;
	Wed, 29 Jul 2026 11:39:57 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2de-00000007kyh-1jyK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 11:39:55 +0000
X-Forwarded-Encrypted: i=1; AHgh+RqLcH+F7Q2/3F0XgvhFs9G3g38b6ccJJcMfp60bfGC6k+46AqoHF1E8IhCuDUBBjKFA5/0fW9aJKnwtAB6Osr03@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785325189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MgvBuiLRj24R5eL34h27DbmmXIsCnSbcavTOpGhYHMk=;
	b=lkkxeAS5VmpUoZI6FV9X2hrhfhw7VHtHGjwwV2NlbxJlxMfS9bBYtuspae4vjdEjFRUzV2
	oxWf9gmGxA4qj8zjPd9abM9XJF6ZIvbM7Y4OOxIMfcJhRs+U1dQxvUy2F6s3OkJtasJ2IY
	ibmxEBn6pvLjFi66qPbcaOwhtG1omSw=
X-Gm-Message-State: AOJu0YxVH2GK6L0uW8TjKs7g/tbW8MGqgL1uarDhAXIORzxMI/LlEMAv
	7YOSro7V3XgR0yC7kyjwmsw7K8OX3TCnIfsfbOHyH3hbzyub1L96qsZ3V8gttiWn7oHTqYIz7YY
	KUkJqzQVQ9HKw5ESQeNgfAg/MshVZibckeSxo6Mln
X-Received: by 2002:a05:622a:8359:b0:516:ccc0:ee38 with SMTP id
 d75a77b69052e-52b2cc84a3emr5917821cf.9.1785325173789; Wed, 29 Jul 2026
 04:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260722202702.4165917-1-congkai@amazon.com>
In-Reply-To: <20260722202702.4165917-1-congkai@amazon.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 29 Jul 2026 12:38:56 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyMjsF6jp98TQhc+xBm3+p7wykeK-JMvybU+mjyu5gveA@mail.gmail.com>
X-Gm-Features: AUfX_myrOBKJjGr1oQQJhjpP2gtOW_slUtGnIubwUV7eVBsMrgW-SzxzJTTjCds
Message-ID: <CA+EHjTyMjsF6jp98TQhc+xBm3+p7wykeK-JMvybU+mjyu5gveA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] KVM: arm64: Expose PMMIR_EL1.SLOTS to guests
To: Congkai Tan <congkai@amazon.com>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Haris Okanovic <harisokn@amazon.com>, 
	Geoff Blake <blakgeof@amazon.com>, Stanislav Spassov <stanspas@amazon.de>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_043954_657364_413208DB 
X-CRM114-Status: UNSURE (   7.25  )
X-CRM114-Notice: Please train this message.
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

On Wed, 22 Jul 2026 at 21:27, Congkai Tan <congkai@amazon.com> wrote:
...
>
> Congkai Tan (3):
>   KVM: arm64: Expose PMMIR_EL1.SLOTS under strict PMUv3 UAPI
>   KVM: arm64: Advertise STALL_SLOT* in PMCEID1 under strict PMUv3 UAPI
>   KVM: arm64: Add KVM_ARM_VCPU_PMU_V3_STRICT vCPU feature
>
> Oliver Upton (1):
>   KVM: arm64: Ignore writes to PMCR_EL0.N when using strict UAPI

Tested on QEMU: boot, get-reg-list, and vpmu_counter_access pass. This
doesn't exercise the KVM_ARM_VCPU_PMU_V3_STRICT runtime path, and the
series adds no functional selftest for the flag.

For the series:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad

