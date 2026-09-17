Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94ACC982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 11:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kosCb2yMfsMu2L7rZnHgF6oeDYnJPHYiEzUWC4os9nk=; b=PiFrphtDeSmAba0aXuVLBb97/J
	XIN4gwkksmo7WEAjBLrcXEtA0rlbJ6Fia10kFWU7P4dgAWM+HY1tzM4xGyFxh7/OJSHNj4kfdOptr
	tjUb9igCl+svAJe//iYezHk40fY0J2GkoY6wZ5gcOSpaZRoQjquViflM2HHZfe1Q67Jr9Qv2jzpn0
	Rz6P9HwD90kIdqq2uM7Xe1GfQuZY/Rnf3ry1tBuj9Xsi90B0+8AlmUxO3h27Z3gR+3mNNrJL/j5Zs
	wUpn8dtk5zlhPQmxfPDqQQLIEvyKMIPVrM9guPpiydOtfEgStoiqZAU60skmZwBXQ+9O1YvedIhrO
	Qmc5bbsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ait-0000000BEoA-2ekz;
	Thu, 17 Sep 2026 11:56:15 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Air-0000000BEnm-423z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 11:56:15 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5b5e5aaf7deso1211e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 04:56:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789646172; cv=none;
        d=google.com; s=arc-20260327;
        b=aM4/moY7Ntto7YSRDNREjTzVMGwdXDUfgOVvbOB24NqVgYVuSwMj+ZXojQt5aQv3bn
         u8B5INE7boary0rXDdLZU1VSqVrXdMk0uObWFJQDJVfeYe4ngQN25pTbCDrrMFLtfYlL
         wc7IuSlx3wPux3ndPAfSfNckbYQfac/ilhxTd401EOwhbUyRAnBbE/IyqCCGcKrUUumD
         LUY43xYIPpK/TQv36jPFfHDu9MKa0kMAERsHqZ+3VUrrWxhUFpzJMGCTFlnhR5UhTaYp
         ZeyJBfbtNoFrtUwN9n62NBdIlq31ykVxOk0tc+wzHjfMsvdQRgjdMtTxTOuknl+RNqvQ
         AbHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kosCb2yMfsMu2L7rZnHgF6oeDYnJPHYiEzUWC4os9nk=;
        fh=n3DaYFMmY6n+zRfP0H7G1ub5S5a3lky8J9oDAaPnAU4=;
        b=mUOY8kUuQeK2WQn8iQxcmxQgLWxnWN8e9p76nk12pnLCh4/GVacNU+cMRpVnmMJfa9
         Ygo7KZJeIiHoLFKlEHnyF/aNjpB1bqszf9y/wHawoceMd3N4lTiJd9off1mLU91gFkj9
         IrxGI8FPH+nHm3f9PwmQ7ve5ZrKJAQIZdL4+DXkZdhRpALAbBUq1/8OGr3thkDFf50W1
         v0EudqZvdMAzWT8URDduibcgXxJ/ayH54scHzX0UpKZHt45nfAga7nQiprt7QV0tV7c5
         fNcEypVkZ8TywCltSgA1p27JmVCq3L4i+iPBeXiRAgUZXFg29NIHiBXaBuW7YnTXHp/d
         kCbQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789646172; x=1790250972; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kosCb2yMfsMu2L7rZnHgF6oeDYnJPHYiEzUWC4os9nk=;
        b=JtzXxGXvVqBZqq3FR0INWCbTWrF/C7ay1Wr62O0TO65f8Kbi15OfrGU+wWodENuYM3
         jPY46vFSwgLZnYLeWwB5ehWaV+m6e0a7V3OSin8wX43dC4yBn+N5O5TgjkQC/NMzOBsb
         4u52o4Uk7DG1rZikZZmTi6VBq+VYv8RD+kXN+I28tGJGkOnK0jvWKoIcVhoSGeD0rTJX
         V6wf4+ZLnDZRNhiZBd3HIIsrA3OU1LGFRdYnuyDxpWRy0JVB6UjuZCX4O59hFByCKSIv
         GrUxNn794WhBC293F5ut5jJJ0sXmUwVKGlcr2L6LslBx9qxcSwG7jEFyMso1d6Rq5/yF
         wzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646172; x=1790250972;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kosCb2yMfsMu2L7rZnHgF6oeDYnJPHYiEzUWC4os9nk=;
        b=IbEIM+MMGtRMMlivoXl+y68ypMfYgoowGzBEfiygB0pvYhloeogP1YmKOsTEFqcRHn
         0rbYCllsx7396/AB3qOQJXf0x1Va7xsDR8I74cjSGQFgC7bLC8Jz5T+z1UfIodbDszfy
         5bVPpjWo3DBOWEuM8VKpsZbztA6//PLoXgJREFPROwEN1y1wPaSkOb/QD8urpZU849Wp
         EX/unEZZVMYf2vqTxBLdZviXpBIl4e/G0LSOryujvlPqtopjFaFMRVjD8CcT4bVJLKYP
         z1kQK9caoDD/NACgMG2HQR61/NjDMfATthvnm13nnazEWd0qwymlNOP5PZiBm6nHnkqk
         BMig==
X-Forwarded-Encrypted: i=1; AKwUvBze2dc+4ElQGlQ4g7OkvLZKlyXqsPnemNRiBdqzvGS1NXtryUc+kuh2x4lqH/ZMzMD/Y47YaxdhuGfTTSUjpori@lists.infradead.org
X-Gm-Message-State: AFuF++mYKZ0HXA8+chx6RfdY0mpBivHGkKJ6HrLKoWGOJY+SD/XjVTwc
	15LSyu+Y3kuwps1rfaI1qGHEzL/zrEzsY5J0BD1XG9TnThxV/EpE6dozvjgo/9c9+64N1OOjQY5
	rD3k2UXD9RLaNlyoFJ7FOd+Gi6gq0Z1OME2NVGJnA
X-Gm-Gg: AYBFou1V+qpuSnNt5NHtoQXsNFK4wo6SyQrVTijzmMySkCrWUJqyAzSKWjw/X681q4+
	uSJwyCOgUFkrolRM9ch+6DdkTPI3lH+7cGjAVGn+VC/P/+NxpXm9Zkcygxs7D+Wpk9iNRoKg3RD
	VxAZL/+U1/XhDjzV1lKvmPe946CFBI+0gRIF+meD9KZyKwypP4RjZFW11mwdDKsUyjMcP7ec+AK
	DhthPjtfsi/kLDua+Jf2+E5HGnMQdSGOTH8gQiskJ3o8cEMV5xoSSZaQ/OZFg/Ona6X5UfXDgAN
	XyaheQVFPzy2e1Pjje3vh/VgHz+55FxwnZlNWlYIF5+nauiOegX9jUr6Bh5OaqurE0KpB7ZcrlX
	0ItIpQH6Oh/2R/w==
X-Received: by 2002:a05:6512:686:b0:5b4:74e2:4171 with SMTP id
 2adb3069b0e04-5b8bff1fc30mr29453e87.4.1789646171156; Thu, 17 Sep 2026
 04:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com> <20260915160141.3543048-14-suzuki.poulose@arm.com>
In-Reply-To: <20260915160141.3543048-14-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 17 Sep 2026 12:55:35 +0100
X-Gm-Features: AcwNN1Und6z4n8NhcdREXtYfkYZKnB08V2Uvzr0E-uhaZeSThY7dario3kxcFlo
Message-ID: <CA+EHjTxe=UXnKR6DzTqL9d6O0aG+rO+nPKTxKKQ_-w6tpkGCVQ@mail.gmail.com>
Subject: Re: [PATCH v18 13/23] KVM: arm64: Add a helper for VMs running on hyp
 that don't trust the host
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
X-CRM114-CacheID: sfid-20260917_045614_017916_CE7889D7 
X-CRM114-Status: GOOD (  10.76  )
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

On Tue, 15 Sep 2026 17:01:31 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
[...]
>  enum kvm_arm_vm_flavor {
>          VM_NVHE,
>          VM_VHE,
> +        /* VMs running on a hyp that doesn't trust */
> +        MARKER(__VM_DISTRUSTING_HYP),
>          VM_PKVM,                /* Normal guests on pKVM */
[...]
> +#define kvm_vm_hyp_is_distrusting(kvm)        ((kvm)->arch.vm_flavor > __VM_DISTRUSTING_HYP)

I think this should be `>=`, as in kvm_vm_is_protected(): MARKER()
gives the marker the same value as the enumerator after it, so `>`
leaves out VM_PKVM. As posted, kvm_phys_addr_ioremap() no longer
returns -EPERM for non-protected VMs under pKVM (EL2 still rejects the
mapping, so it's only the errno that changes).

Cheers,
/fuad

