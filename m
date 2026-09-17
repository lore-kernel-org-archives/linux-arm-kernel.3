Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFD6C982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 11:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuZmGKQOozDdYhExUfv4iQ5oFoGABaotqoRByOfZs54=; b=NwNh2oiycsyo4bonMs8DLV8f5h
	HBUVbHb5Vo4L4yGgeiboTGe8Uhoy9s9YTt7cBDdYegyuZb7PMBMxO0i+SuCWMvAPNkyeicy6e2Y/P
	d8pceCETvpP7grzwSVE7GWVYfFOiYt0jIm3T/uacG0GLPRY1AStneIN64gAfcmlFz/idKgQoLIhJ6
	46ClOrf2nEfSNwizTxpNP8CpzZvzYz9z2Yzih5YhFuiC/J5jq9sUiMqi2FRUIK6Re7PGdQSxRowG/
	b5foOO7gbseWTGwu8CP8mWSItoQxYBLXlbk0ZBvh0yjMjAHqvZ5D9oyq/GyqksQpElLEOIxhvifKD
	/bhTP95A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Aao-0000000BE39-11lM;
	Thu, 17 Sep 2026 11:47:54 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Aam-0000000BE2V-14Tv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 11:47:53 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5b778bdb5b8so993e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 04:47:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789645669; cv=none;
        d=google.com; s=arc-20260327;
        b=aGA37pLWozpuWlv9AUO7YPqUQJgsHJhXF9jr3/qiDSlH6n892SyFl/AKCV2C0otOcK
         6n1+8nktHa2MrlhmqQ/685j26el8JX2ss0puRffyvGKvPLC/E51sLT9reN7andCpT/Qm
         UhbVmipavozltfIRW5P+fMBLXnM7GSKEFzcNpkmQ7901WIGd44wAxWL91yBcDWrAt/DN
         B7CaMV5S2PhTC9GYCq2cZJlXPYXaOCq0LCCppFfVPNP9DGPhGpA43RC8aTA2oMEF4lNF
         UD4aT365K2qz9FPsrVS5fIFcQ/TpnTGHLoayfPUwwI81SQJMkYtb/9fl0sJhKXHY8BCn
         M4VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AuZmGKQOozDdYhExUfv4iQ5oFoGABaotqoRByOfZs54=;
        fh=lGb+G0GH0/qpf/aJOTDwmRoNA0+5A2abmVTHnFFiXxY=;
        b=FWA2tYJ/JY3/dPH5HtOYhuNFtTMwaKek3x+3liji93XHMMid8mwQsmBw3lro+9ZPNT
         fBP9v3PAL70qooYQGvGDZTHl1lG8EHfi5n4o1Cs1V66ZYAgjwxjpqjrU62d04LkNNvZ1
         aJkfulsvF1VqeUsMgFDcIme8D3xtdWeMq37Ib8kNAuQwxEX4wp8MEu424fxzCcVnJP8Q
         4efCtKGrcMwXX40C3DH4nx1qDMLkAmRXwbf3B0wUfb72fooN8eVSmfZ8Ks1RiS5ua/qh
         6M4tAvfIk9kyqzaqMnb4z++sHE8c9ShYXEfCjRP8ubki9PTsLRGmUeJZQrFFV8BIaYVS
         nyIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789645669; x=1790250469; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AuZmGKQOozDdYhExUfv4iQ5oFoGABaotqoRByOfZs54=;
        b=toIwmWWBqJvL33315y/gBgD1KcXMNeygi0QJ8T61iG0yiC2YTqs5K9JdzPA8m6UGZv
         zjIRdNE+rQyoEbG01dMpBaeQPcnpWEgDmwL4DJg1hG/uj2nPzrvbfpNsnlRO90PFDD89
         PyEFtU59pt0XNRQYlltuL/YhQthNqNlO5qbWBi+2PRFevbxA6emASR8nLY66rSGYolpt
         TYlTAJ2HOyomz14R2J55utTBGM++vTgmvhJwUgG/AgJDk/j0vrRqYceHFvNhSZmp0FbN
         ggxKgaCFqWvSLNFy+4K8irOtjdJRZgom1+Rn86WQdevY3r2jwf725V3lHosmfndAnu7C
         TZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645669; x=1790250469;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AuZmGKQOozDdYhExUfv4iQ5oFoGABaotqoRByOfZs54=;
        b=Fno3U5lYrRYBExh90Dp7BNhsnBDCYET5C1g9/db58Be9H9kKCKc8VneeKMjoaIZruI
         ZGdPgL4RwLdmajpw/jhqtX8OVzAEqpMGiJ4IIEnMDCiQAc256viTCwgwjYYzJYqMjjWA
         rPIoKneR8GqqSh4kGgCWB1b8NffR8Uj8BEPcCJBm44b9q3tn8RYH7PLoslpyvboKM2JL
         6VbAPvaIEdaBJKdUF2jSIbp1wlnuf0opikmplXve6nYCkq1T/GzFEuMG4zHazh78KMcK
         o+sWf2HyzNLDj5GaW3iVmblRtM446XCjJd1mR654DgfrVhnRmpcczUFnT9i6eNCsgNev
         FwHA==
X-Forwarded-Encrypted: i=1; AKwUvBxJNUB+vsidi/eQ+sp3KnrY3zs75wv3dgyhBy4F9zU+SZGdMBMu3ca069ORouWI07U3vBekRlImYTyKmp1jTWOJ@lists.infradead.org
X-Gm-Message-State: AFuF++kdqASjISwZj4zXEF24UjFz49+M+TSkONVZEx0vh32eOJXc6jAi
	D+fpRJcMVLRpPiWBq+O0avKC8QafuJt0GsFj0ZxKEyEdVyVG2uUxRg8VyuoGZgx3uHwi1stGEUk
	5OkHypWwiCpHIAhBO1LF9/FdBl08FoJJe33GFMS8x
X-Gm-Gg: AYBFou12daVaG8a+E+ySYf4gFkgcyrqJFnJPQo6FJAZjidggE7qqJRRfoxVyKf17SuF
	l78zPVdn0Ksu3g8xXblAJIw0nH6Svc1gvtgh++MEQNA7RZcxNhDlAsHRolGuEEDHfS3QbG4S7mJ
	yjE/M0bDOM3ns/jf4GG0xgU3Man32q9zbaTN8ID8DpHuTZYHzZ9Q6KkiwwK/KB9N64F8ckF4SC/
	X4sBHIPF59uIaI8Pw07ryp8zQzRvuN/LOZ5yoGTXOc+Ky5B5EW9933NLwOpv7LKMdkFb64Ai0Or
	eWOY+Kce7lkQUAmzdZBwUD1H7MAWX8pbmlr1wvUtFd4VADCIZNzNeeTKDx6/A+WAVcTDziExR6R
	fNEXCut5vGNK4Hg==
X-Received: by 2002:a05:6512:3c86:b0:5ae:b726:5f1f with SMTP id
 2adb3069b0e04-5b8bff2c01dmr18224e87.8.1789645668434; Thu, 17 Sep 2026
 04:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com> <20260915160141.3543048-12-suzuki.poulose@arm.com>
In-Reply-To: <20260915160141.3543048-12-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 17 Sep 2026 12:47:12 +0100
X-Gm-Features: AcwNN1UOph-dvwenB_bEiuZFqzb6gytAI9_L8AUcm8oP9DDQEKK-aUQXatB0jDI
Message-ID: <CA+EHjTzOR7xczcb1HbUAi3H7K8ta=pFcdjxJb7UixZEh7QS-Eg@mail.gmail.com>
Subject: Re: [PATCH v18 11/23] KVM: arm64: Use kvm_vm_is_unprotected() for !kvm_vm_is_protected()
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_044752_311075_E9F35AF6 
X-CRM114-Status: GOOD (  10.10  )
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

On Tue, 15 Sep 2026 17:01:29 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
[...]
> @@ -490,7 +490,7 @@ static void handle_exit_pkvm_state(struct kvm_vcpu *vcpu, int exception_index)
>  {
>          int exception_code = ARM_EXCEPTION_CODE(exception_index);
>
> -        if (!is_protected_kvm_enabled() || kvm_vm_is_protected(vcpu->kvm))
> +        if (!kvm_vm_is_unprotected_pkvm(vcpu->kvm))
>                  return;

Could the two pKVM-only helpers keep the static key in front? With
`is_protected_kvm_enabled() &&` inside kvm_vm_is_unprotected_pkvm()
and kvm_vm_is_protected_pkvm(), as kvm_vm_is_protected() had it before
patch 5, the boot-patched branch skips the load again for every user.
This runs on every exit: the old test is a cpucap, so on a host
without pKVM the function returns straight away, while the new one
loads vcpu->kvm->arch.vm_flavor on every host. The wide
kvm_vm_is_protected() can't have it, since Realms run without pKVM.

Cheers,
/fuad

