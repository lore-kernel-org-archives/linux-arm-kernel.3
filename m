Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B442CCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 12:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpExexnZOKJ7iqaCQ+poNcR7uax4pW5z9HIKRX8sboo=; b=pXVutricJR9Ye2iicpcbCAQU+6
	fd2mklB3qC/PoS89BwjsO1ECwtlet6lZDOaLCkEomi5xpJ3TGGlvsbUwYflp3odZZnZE51X5FfG1t
	XvsJPVdmV7EliGi3MUK9e/0HpBvN8PI9SUXmcyEq49BO4dvqEmXdfxfH8Aa8kl1LwFkaX27zPzwNq
	SqwYfNAHx+sJG+dbttBPqxNrWC/Ek15ykxlhhW0R76YNu7nJJLybRDgLTbfVMYGhtdAXhapE+l4vO
	tN7BoAhyskWCDRUPc0UnbLhrBl8Bo4GE26Lwbg2/8OMMZsXG61UraR5gd2/Bq8Tu4uvx79y5ct7nV
	yFzjvqpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3gv-0000000CUtO-1EdW;
	Mon, 01 Sep 2025 12:31:21 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1tX-0000000BvBi-0eeU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 10:36:16 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3d48b45f9deso797492f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 03:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756722973; x=1757327773; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XpExexnZOKJ7iqaCQ+poNcR7uax4pW5z9HIKRX8sboo=;
        b=KKY4A1fO0JNq1zwcZLJ6nEG/R5XBoLviJ9VLNdbeX96m6RbWfvSpLN8paJKoSlibkZ
         B8c2f8FFuP6kQzC6T4VluAYYEX95v+KiPzPo7Yfo6jYE03m15VfrEXuid/uIFMSxfiVt
         +6tUl2deMw1BO6v/es5JU08wh+Ehb42uN1xkH/QOLznYqrDYTZk62GdrFwAEpizCk5rH
         mMDTE0UYRlwsdKlqfXyctbPkJy4rWmDFOcfldyqwyy9SZAoiu/tssolTA7ZIe8lr48yh
         P/yTTv023fJWqdJPyymO4KR4S0hVTSpZJF21C77++P7oeJswitsc1idE7gPsE4I0lPBv
         T2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756722973; x=1757327773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XpExexnZOKJ7iqaCQ+poNcR7uax4pW5z9HIKRX8sboo=;
        b=qNPCbZXp5EB2aHgRWw11Jcd75EqkQ1Fbs/5Dn59pkek5wyobzXtSvEfb+6YtEpyNJA
         C8rdIXKLGf0MyUocCwhaJEEVsfNekIaVSi1JduI1EFRybACXp3vQIk9WWMqnRg33dxwV
         tw0QJTBPvjTdQHDGxRddWyjdBTFbLddivxV8EbwDmP2BCJI8oeNpwaga8bKV7BImso+F
         53usXLObG192bFrcHi+6B/VgJ+Kzp8RzmbhJBrQe1TgkFL4BFTWT0+IPy7zVvgXh4Wpm
         jPrx5oMsNafXfCD+TzT1OPVmNoBDZ4fOnjngGNM1KpteCVoDrcsn1O+SsNHjT+fNPxAE
         LMig==
X-Gm-Message-State: AOJu0YxAAwhNCvI3bU4SfAqLwpVtyTliP0Lr2NOu30RIq4kBkjpUxGbZ
	gh83kBag50GqvN2y5hA4Fpv9UglgTkjF9NjaxfB2RJL/XfbP085eeEHFxZv2BSQQ2b7WvRKcC+/
	5o0RGTtA=
X-Gm-Gg: ASbGnct+WhV+aS1zoHtEniN3HQr8okK8PquXSZ4LmpVq3X1ysV3NCtiUwBGH13eQ1x6
	IAQFzlBEfdsZTkviJimWHNVIalE2G4cl61BwOQEy0Fnrg5JbGJokU342JEBwrbnZLtVBqNcdYH5
	I7yYWCxWgoWjEqt7HOVFXV28DRgCLS5CGvdKvWKhSe8icYYcRgUiUTKJoCpJKx/nl+5mcPRvPk6
	S8WtVTecUzYIJIT1rr1DoLbjAzP9IS6aDUNCKylrO4xmo/DZeCbb2/CRzGQfRKRsBT17ghS9zC5
	IfBYJKrPlkW3UvDJIHpMFGQm2WpzE5b+mnv614qLIhkXOCCfcZC4KlS047FW+4MTTKO+ktke3lB
	0J9dPfYdN/wHh3XxRRStHeBAom4h3YLxmcbh7xQ==
X-Google-Smtp-Source: AGHT+IEusUyvpzGTFZ+MI8lsnkKYt5dsttV6VWwq3/MdNt28CRdwWKratkBzJoTnQ6bNa1MHsKujcA==
X-Received: by 2002:a05:6000:1a8c:b0:3cf:3477:6bbd with SMTP id ffacd0b85a97d-3d1df1568b2mr5850878f8f.54.1756722973005;
        Mon, 01 Sep 2025 03:36:13 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d690f2ebb9sm4115919f8f.20.2025.09.01.03.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 03:36:12 -0700 (PDT)
Message-ID: <450f11c2-6c11-4ffa-ae20-db4ea419a3ca@linaro.org>
Date: Mon, 1 Sep 2025 11:36:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Fix NULL pointer access issue
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, quic_yingdeng@quicinc.com,
 jinlong.mao@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20250901-etm_crash-v1-1-ce65e44c137c@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250901-etm_crash-v1-1-ce65e44c137c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_033615_206947_70546AB3 
X-CRM114-Status: GOOD (  21.82  )
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



On 01/09/2025 11:01 am, Yingchao Deng wrote:
> When linux is booted in EL1, macro "host_data_ptr()" is a wrapper that
> resolves to "&per_cpu_ptr_nvhe_sym(kvm_host_data, cpu)",
> is_hyp_mode_available() return false during kvm_arm_init, the per-CPU base
> pointer __kvm_nvhe_kvm_arm_hyp_percpu_base[cpu] remains uninitialized.
> Consequently, any access via per_cpu_ptr_nvhe_sym(kvm_host_data, cpu)
> will result in a NULL pointer.
> 
> Add is_kvm_arm_initialised() condition check to ensure that kvm_arm_init
> completes all necessary initialization steps, including init_hyp_mode.
> 
> Fixes: 054b88391bbe2 ("KVM: arm64: Support trace filtering for guests")
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
> Add a check to prevent accessing uninitialized per-CPU data.
> ---
>   arch/arm64/kvm/debug.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
> index 381382c19fe4741980c79b08bbdab6a1bcd825ad..add58056297293b4eb337028773b1b018ecc9d35 100644
> --- a/arch/arm64/kvm/debug.c
> +++ b/arch/arm64/kvm/debug.c
> @@ -233,7 +233,7 @@ void kvm_debug_handle_oslar(struct kvm_vcpu *vcpu, u64 val)
>   void kvm_enable_trbe(void)
>   {
>   	if (has_vhe() || is_protected_kvm_enabled() ||
> -	    WARN_ON_ONCE(preemptible()))
> +	    WARN_ON_ONCE(preemptible()) || !is_kvm_arm_initialised())

Hi Yingchao,

There shouldn't be a warning for this, at least for the case where it's 
not initialized and never will be. If you're never going to run a guest 
these functions can all skip, the same way for !has_vhe() etc.

A warning would only make sense if it's not initialized but will be in 
the future. I'm not sure if we need to worry about that though, because 
the KVM init stuff happens before the ETM driver is used.

Thanks
James

>   		return;
>   
>   	host_data_set_flag(TRBE_ENABLED);
> @@ -243,7 +243,7 @@ EXPORT_SYMBOL_GPL(kvm_enable_trbe);
>   void kvm_disable_trbe(void)
>   {
>   	if (has_vhe() || is_protected_kvm_enabled() ||
> -	    WARN_ON_ONCE(preemptible()))
> +	    WARN_ON_ONCE(preemptible()) || !is_kvm_arm_initialised())
>   		return;
>   
>   	host_data_clear_flag(TRBE_ENABLED);
> @@ -252,7 +252,8 @@ EXPORT_SYMBOL_GPL(kvm_disable_trbe);
>   
>   void kvm_tracing_set_el1_configuration(u64 trfcr_while_in_guest)
>   {
> -	if (is_protected_kvm_enabled() || WARN_ON_ONCE(preemptible()))
> +	if (is_protected_kvm_enabled() || WARN_ON_ONCE(preemptible()) ||
> +	    !is_kvm_arm_initialised())
>   		return;
>   
>   	if (has_vhe()) {
> 
> ---
> base-commit: 8cd53fb40a304576fa86ba985f3045d5c55b0ae3
> change-id: 20250901-etm_crash-0ee923eee98c
> 
> Best regards,


