Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61FCD58B22
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 13:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykRRvKlaRwZ6vZ+pDBOmf2gxxH/PlXPS+bT1nkMsSak=; b=m8SDxP/1YHHeEvXELWyPr4dqbf
	j1a293pC0QYyi2P4WdyOI6tf95kz0nunO0u7n3K1xrwvtagMaQdapDqJm/7F9fZk5E+oSXYp5ENsS
	/JNcs68utYFq0PU7SaXxMcmdGs7AYkjlnfKd4zmLmAiHs4ak65QkaYC2zYhDXyBuq4mGrPDch0vvi
	jZbOSeETjljtzhxlgIKdKPd3xY8C6NJB4REZYlQnzlf5NLlTcp/wbXvIh4r8Qk1z5YPIg1/tEqXQ4
	mmdbMppZB1XS8KS1HgAyjatzwhDOuUM9hj/g6gV1q0ISPGwPf0Rdf9MKPll3HWdg8II3XPn4ssbwm
	bSg1XQnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1lTK-00000002d1D-06c5;
	Sun, 15 Mar 2026 13:25:34 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1lTG-00000002d0o-3VUu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 13:25:31 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-50906a98ffeso606711cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 06:25:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773581127; cv=none;
        d=google.com; s=arc-20240605;
        b=QuKZwSy5Ij0GfgJsLbvpO6gTfJ1beUYheCTlxzZtNvmqSBY0ETVOlVN4TZrzU3M463
         HtMu8X6mKdSc1VB22rVSm5+1XpJ78VDk+09oQ433WBn7FekOH5zhIi6pRtpoG/pNM0Z6
         5dPHUBhWUn+M2fuRezU4duz2OPcvgFOoUuCpcvbCCH5iEcNPZ+CPLUKPcmK3Hflk0f8O
         wRPAsKK255yF0p355uTdDB23fszT+skHNH3INnwOf72j82BvZ7xoJdBxs6CrtTBnOceK
         vrsC4JttF7rUlKgzoTgtVBlfdjRKXOEO5IW2KQda6naRYl3ynSFBQ8TdJ5NV3kx4ciLd
         tpPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ykRRvKlaRwZ6vZ+pDBOmf2gxxH/PlXPS+bT1nkMsSak=;
        fh=/MeNUtcisCZi0INPUqt9eh4TYycGB/yYLAZ5sxodBJc=;
        b=ko329Wy0rAvT05Ym3y+rv9Ii4dqf6WUhdoJUNsE6KwMxGbbApQ/Bks3FgiX2CRtpKn
         UWLVIJnpcvWUbKN1yVcvybtGDiQsSo4mT+FUpcAKmw9mxpl0auCvCpgPfPQ1iTj2DCHN
         vSfVIIYvbDjRVLUlsH2OFR+44WCSooi116uIvK7gW/E4lR+5+/Bnusj/ZEae6vMcq35B
         VSCelr7r9h3VvB53iaByVsJM5Gf6c5fZ4rT1gaMYT4+zrUX56qGSuCG4ccZqkIRrETvM
         Yw5U5S2/9zBUHByBn5APWcf+7haW+kC++Rk9A1O76YlKDnSysjPtp4yIpC2FD2ONvyCq
         7C6g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773581127; x=1774185927; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ykRRvKlaRwZ6vZ+pDBOmf2gxxH/PlXPS+bT1nkMsSak=;
        b=msDpBXms4si4nBav3ik6VQLeXC2X7JZXOibiai27ppzykxtwpU3Bl0vOdS5L0ZVnAH
         ygTs1H9KUcglXlsJAYQK3OwaAkk8Zh5qHw2FDHtHfp3oxjqOwWn4uxdWwJY7Hg2+nsuD
         PhZSrdpriSaDrbGZadA4N+7xvpC0nJ01T+1B10D4PFOCdHKD0xM0fKRiEj0V/0uE6t8U
         ebXPRHqthHZXk3R05l1bG6IB2i8URFa+Bvl/xOqxSO1qCnd/5yFcjxc0hxU7UhBojhH6
         005bJ8oJdSHkfYUHehb2l40gNzUqlI+3nVhqLVkt/9jGK7vcBTsCXSkPQwC2LYY5Dd47
         3cgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773581127; x=1774185927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykRRvKlaRwZ6vZ+pDBOmf2gxxH/PlXPS+bT1nkMsSak=;
        b=SR/nsPfzMxx2hhva6U1E6UHjAF9F6FQOo0FWlbFAgOVE3rJ2RP5KAOwb3rwlYchB6I
         gmqAljnHqKt4CcONKyBomIgoS5Mc07uWYeW6bMvRWsZPRAgNJhRfOStkYUEk5s+7ptXR
         WUUQ5PSyk7JH49M8VbkrZg4JCOUSuUFsBbpji5M8+LDPpxbFLSHfcSU+myUgmOgUntPb
         jsPdJgy9RdGqtYGtYf4vNztZE9fq1gWgIe5GqkO+DkYX4+i6Xi5XIonIRNfTTpI+wjif
         0kABw2GIA7pl/QaSdwhsVNs7c9iNWaIp0tfKCt4ZtmaTLYFN3zW6nuk4NP4ah3+xsoaj
         kWZg==
X-Forwarded-Encrypted: i=1; AJvYcCWWQ3Ln9ZHAFqtD6KT2bslFd0bC6zNAjsvIV8LJOXu19qvxwJXYpYGdgMgXT49MECgW/LqJ7WAh3ggL75CZ9eB+@lists.infradead.org
X-Gm-Message-State: AOJu0YyQZdSEcyTNEvaFAH5yTeDONFV7IZFZ/QKUPakw/oHtVmNBLo6E
	LeuEMGHkH1tk7vZcnd4zthVOz8AV4T+mIJfVdF6jxK0z+tjNUiW5GmAR05oYg08JYQHp1iYhocW
	RM5DqxGbW+UgnIuD3cL11PWJDIDQaIgMH9NnY6NF0
X-Gm-Gg: ATEYQzzZMdYjeCe20fWml2wjthadkoWH5DnXsyx97DYNHx6GGfbvDW86EExVQ0KmVqt
	VaAlp4VE210jhnR5w/G5vEONkRZi1XamDdz4jBpGGkfe9uT0stPz1AqpS3e7zTg0e1I6H22XN8g
	q+8jG5tAw7qlItdeV+aUhfOu79103wnvZe+blZeuh6dKNxPhRn/9Ie3VxwHJpGHWoUq55Kgnprt
	rvifiPJUAkK5hN7skhJfjAHB59oVVyQMwG8hVCCRuqW+77oHvCJEfHoLMBykZO8lnPUQiYTptoB
	GaTSStPE
X-Received: by 2002:ac8:7e96:0:b0:509:21ff:cd49 with SMTP id
 d75a77b69052e-5096932b4c2mr17496991cf.4.1773581127102; Sun, 15 Mar 2026
 06:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com> <abQqqTYvmrtGp9l7@google.com>
In-Reply-To: <abQqqTYvmrtGp9l7@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 15 Mar 2026 13:24:50 +0000
X-Gm-Features: AaiRm50COl43rsD-SL2jfwrRIiZ4pJhZrhTRVXhXknnTzW9ZqzjepERwMSgeSPg
Message-ID: <CA+EHjTx0OvER0MmyCDzgJBjp=gdz5kC+HSNfYgwF4uBETd491g@mail.gmail.com>
Subject: Re: [RFC PATCH 00/14] KVM: ITS hardening for pKVM
To: Mostafa Saleh <smostafa@google.com>
Cc: Sebastian Ene <sebastianene@google.com>, alexandru.elisei@arm.com, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, android-kvm@google.com, catalin.marinas@arm.com, 
	dbrazdil@google.com, joey.gouly@arm.com, kees@kernel.org, 
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, perlarsen@google.com, 
	qperret@google.com, rananta@google.com, suzuki.poulose@arm.com, 
	tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com, will@kernel.org, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_062530_920749_A02D8778 
X-CRM114-Status: GOOD (  14.02  )
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

> I tested the patches on Lenovo ideacenter Mini X Gen 10 Snapdragon,
> and the kernel hangs at boot for me with messags the following log:
>
> [    2.735838] ITS queue timeout (1056 1024)
> [    2.739969] ITS cmd its_build_mapd_cmd failed
> [    4.776344] ITS queue timeout (1120 1024)
> [    4.780472] ITS cmd its_build_mapti_cmd failed
> [    6.816677] ITS queue timeout (1184 1024)
> [    6.820806] ITS cmd its_build_mapti_cmd failed
> [    8.857009] ITS queue timeout (1248 1024)
> [    8.861129] ITS cmd its_build_mapti_cmd failed

I get the same running it on QEMU.

Cheers,
/fuad

> I am happy to do more debugging, let me know if I can try anything.
>
> Thanks,
> Mostafa
>
> >
> >  arch/arm64/include/asm/kvm_arm.h              |   3 +
> >  arch/arm64/include/asm/kvm_asm.h              |   1 +
> >  arch/arm64/include/asm/kvm_pkvm.h             |  20 +
> >  arch/arm64/kvm/hyp/include/nvhe/its_emulate.h |  17 +
> >  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   2 +
> >  arch/arm64/kvm/hyp/nvhe/Makefile              |   3 +-
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  14 +
> >  arch/arm64/kvm/hyp/nvhe/its_emulate.c         | 653 ++++++++++++++++++
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 134 ++++
> >  arch/arm64/kvm/hyp/nvhe/setup.c               |  28 +
> >  arch/arm64/kvm/hyp/pgtable.c                  |   9 +-
> >  arch/arm64/kvm/pkvm.c                         |  60 ++
> >  drivers/irqchip/irq-gic-v3-its.c              | 177 ++++-
> >  include/linux/irqchip/arm-gic-v3.h            |  36 +
> >  14 files changed, 1126 insertions(+), 31 deletions(-)
> >  create mode 100644 arch/arm64/kvm/hyp/include/nvhe/its_emulate.h
> >  create mode 100644 arch/arm64/kvm/hyp/nvhe/its_emulate.c
> >
> > --
> > 2.53.0.473.g4a7958ca14-goog
> >

