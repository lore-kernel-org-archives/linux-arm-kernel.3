Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C67DF53D8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 19:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/XljB+DzgWrRFl21SQKsmodBlgq6W2fULdZ4nu2KB4=; b=UMi8MUCah9w+h+jxRniJdl/29V
	hGbC2Y7X3KzXRYgw69835bWneQnx3zHvhajFJnjhwmJCKptI5rRGIyUHd23ly5L3RN7GLqTiu9oRU
	svVmJi0Ivf1SmACKceKVCq/0oOrSd0fiigxWKdCBpbscWRk1GNofOYVgo70K3amCC9GJbxUVuOs2t
	Fg4Tcsws4xp5LPgye2Ha1uGgj3XYYSEwT+nmlcmwwbsLiK1cox0R2LYKCBtZrrRGHSJlX/IPcbEWY
	za+HbC+1DWG8UEil/UI1tj5pP7RdVtFlNFcweMQ2zQ3KitQTG3OjKwgjG1VTRbzYLD6MaYeqVlb6f
	xY9F3nJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Dt5-00000004mLD-0b2f;
	Mon, 16 Mar 2026 19:46:03 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Dt2-00000004mKN-0xE4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 19:46:01 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-509069a7a7fso147131cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 12:45:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773690359; cv=none;
        d=google.com; s=arc-20240605;
        b=RwL598kjz0pzoX15AgOXvWgbKwaxiLVNQTlMFLWVjxyMsBW+GFWSoHsM2FsSFoVi4k
         UpP3iBzG9SMCw/1x4vQfSzVd+FXmA+NiVyMo+Ya3Kx5IXAm7W9jyT32mn3PJs4UoXZLz
         CKgK3ZMf/vlUCzYtPWlKvAPukU+egzA1xPlVCJwkvafQ2IhcSU7IoWwit2lgTpFaDvz1
         jE4N1UX89jcfrCb3DYA6yv6+xMC9tluMKpqZnFHgLpfRybbOQDCQgCwkmAQQHYjVGvWd
         yl2Wv85fE4dJ+Zou/eAvyhRS4dn3S3jsqMbb4FD4sQcrCYgJM/Vntda9xfd9/yI32ysd
         4dpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K/XljB+DzgWrRFl21SQKsmodBlgq6W2fULdZ4nu2KB4=;
        fh=NYt8T8TdRcmTdc3zTqgsPIe69ZBvo3qEbQY9YSVs5iU=;
        b=DCOdioQdfXnln8UPqlMmwss6RqmLNjHmOzOATambVcFqOrHo10aCmiFGkuCrbs1Qps
         N65RzPu0IohGiYWhKgbc8V3cQF+UVLfmKje7Zg6Y2k5rD30IHxqYwGDy/E1vLzLTKfzE
         7+nSIjKd4mJQ+o5Hw2NQLTzi910rjV1hZcIvfBxCgC5QDcYviPaRgo6uQp0mL6XUqT7o
         CiRAIkqXckgJ0Mq3V3I/G0McclPHdp4ubet8zZsHExgvIF4Xwu/bKHKaXQgbvUsnXtmY
         KxEO3w6dolZ9VxOUEPsvdacbcvt0Bv0d50UDkGMIEHb74bq5FttXQcE4zQC4GMVM91Jn
         km4w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773690359; x=1774295159; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K/XljB+DzgWrRFl21SQKsmodBlgq6W2fULdZ4nu2KB4=;
        b=qtUJ4MtRjbMwfSCiZoly14zFCIpnx97dHrXfqP5+jcw8MKsARo8HdS0ICEsrFLN4g0
         R2Q3MgJF2BQBwXLrDijCJWNI4ApDocmdHlO5AvnzDIi+WNdXZqCqVwZt2X4lvFkTDS9U
         QHlmAOPg5yqS+1lgsTNlmqnSSp+6W17Hw7loysZlS1ktKV6FraBYLWuenLYuiOJfGS57
         pFnnUJ/PDjE9mhjq1nE2O6fBi4UNgssW5oG3MqQxiinTTr40lK2q99H9X5jOvGGQyYWn
         hjMovfQ9vuV+wKuK/Vnyq5JueE2J8HyxIs4FXpmaLvvs69Md5vzg59WCXdIpHewCm36u
         ol/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773690359; x=1774295159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/XljB+DzgWrRFl21SQKsmodBlgq6W2fULdZ4nu2KB4=;
        b=cUX09hBYcHAC3gJFHcoa18bcS3bC17EKPAzQ+7eeS7yd0gpepImXYHMlXOJX4Gjzzk
         W/4SK79o0vLKgQwpjcdN4L6hY0lY1VmlzUT2RTvccHgZuxuP5VsxczYKt5uHVn3yt64m
         MWoX0dQZiyEUCijrFy7YGDFim5gdb8wLJq5vjhhklwlagY6YRIX7T87wE60cH8bbbidz
         two8J+K/NIiYDmHglb1IFvoz8/tkPZWfzDtBMcYHD5NeuM/Xp19Rw2AXgL0DaV7jpv7h
         Aj9RSuWEIK4zjdYEOiJaUyV8het5bUxECcukwlDZCs6ebIK782uxidy61agieb4/0XC/
         Zbuw==
X-Forwarded-Encrypted: i=1; AJvYcCVcFDpaytY9Tu9TSs58Wt0DXZvvCGDfpEkcHkBLQzn5DuzbIvZeuZ8gVfWgR2sTUiZLhNLyjC9PAvdXomQ461VA@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt+1AgFhFw1Veodt9oKlf1JOH/A6JO7rIfu1o+PRIJ1xQsvsLQ
	W26HbGrzMZWFnR0hdWns5gRXRhsdw0hqqufbNP4k02dEo6bvd8z4HLCLqBQ7klBFZoxQxWWmoJL
	118iL8Fkb78QilVvQoYG3fHL2ZDReNeoq2NtrQ+CfjJtvkZ4HoF0tce/2
X-Gm-Gg: ATEYQzw1OpFByXQI3icGobqBCG7xOf+qNAVR853YYavBwOQFr+8+K9MI27LkRhdyElZ
	O2d9mrifkcKoqQaScds46Xqy8JnYMFvBduFDJ3+0fsU5CVsFAH96HiqVwAjdmrnEpbj02D/x1a2
	2B2i1qIoMg+JLGZiXI60R1lrRdOu7ffEUqXZmInDDICWag9NthMEzrjps2hJkrL1SIuVdig0cJP
	g+hkq6cH4F2HyBGyJFm3zNMSagLNgnJCxPjAVc/0mX/vnDFyq7l6fzZVVtKD9MAhwGCsQHlb+q8
	LWJfFrIg
X-Received: by 2002:ac8:5acd:0:b0:506:1f23:e22c with SMTP id
 d75a77b69052e-50998d3ad15mr456311cf.6.1773690358263; Mon, 16 Mar 2026
 12:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org>
In-Reply-To: <20260316175451.1866175-1-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 16 Mar 2026 19:45:20 +0000
X-Gm-Features: AaiRm53vnZJxjvhwHPVI4NgCZVcmbKDWdM_VkB7D1-YURQfFQInZ6ytFCm9YQso
Message-ID: <CA+EHjTxysP-uBzpW1mg=6i8KnmgdDsymn=t2a6hgGho=sf74sA@mail.gmail.com>
Subject: Re: [PATCH 00/17] KVM: arm64: More user_mem_abort() rework
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_124600_305160_A65C4706 
X-CRM114-Status: GOOD (  17.39  )
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

Hi Marc,

On Mon, 16 Mar 2026 at 17:55, Marc Zyngier <maz@kernel.org> wrote:
>
> Piqued by Fuad's initial set of patches[1] splitting user_mem_abort()
> into more "edible" functions, I've added my on take on top of it with
> a few goals in mind:

I'm glad I piqued your interest with these patches. I had a look at
the final result, and it looks good. I will start reviewing this
series in detail soon!

Thanks,
/fuad

> - contextualise the state by splitting kvm_s2_fault into more granular
>   structures
>
> - reduce the amount of state that is visible and/or mutable by any
>   single function
>
> - reduce the number of variable that simply cache state that is
>   already implicitly available (and often only a helper away)
>
> I find the result reasonably attractive, and throwing it at a couple
> of machines didn't result in anything out of the ordinary.
>
> For those interested, I have stashed a branch at [2], and I'd
> appreciate some feedback on the outcome.
>
> [1] https://lore.kernel.org/all/20260306140232.2193802-1-tabba@google.com/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=hack/user_mem_abort-rework
>
> Marc Zyngier (17):
>   KVM: arm64: Kill fault->ipa
>   KVM: arm64: Make fault_ipa immutable
>   KVM: arm64: Move fault context to const structure
>   KVM: arm64: Replace fault_is_perm with a helper
>   KVM: arm64: Constrain fault_granule to kvm_s2_fault_map()
>   KVM: arm64: Kill write_fault from kvm_s2_fault
>   KVM: arm64: Kill exec_fault from kvm_s2_fault
>   KVM: arm64: Kill topup_memcache from kvm_s2_fault
>   KVM: arm64: Move VMA-related information to kvm_s2_fault_vma_info
>   KVM: arm64: Kill logging_active from kvm_s2_fault
>   KVM: arm64: Restrict the scope of the 'writable' attribute
>   KVM: arm64: Move kvm_s2_fault.{pfn,page} to kvm_s2_vma_info
>   KVM: arm64: Replace force_pte with a max_map_size attribute
>   KVM: arm64: Move device mapping management into kvm_s2_fault_pin_pfn()
>   KVM: arm64: Directly expose mapping prot and kill kvm_s2_fault
>   KVM: arm64: Simplify integration of adjust_nested_*_perms()
>   KVM: arm64: Convert gmem_abort() to struct kvm_s2_fault_desc
>
>  arch/arm64/kvm/mmu.c | 428 ++++++++++++++++++++++---------------------
>  1 file changed, 223 insertions(+), 205 deletions(-)
>
> --
> 2.47.3
>

