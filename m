Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F8AD63930
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 11:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=noKpNbsu/8J3MQcJ0MB00uooJSIdAZ7N8CsX2/H7nrg=; b=l0OcghimSRFSLqUMtald5Gsgh0
	p325gQxztMpf4NipNlWbkD3S0J5zajhs6f1ZKWPsO4CydA4HwxvHFnthJfCp7T5SGYAqIA52sc0jE
	rfpPDTdfZ+1dIBVHewH4OBR+XUGlRDHWm7dCWGxc1VwZ47WpudyywENtsTJVoeBx28RLTeaJapgxj
	ZjYrzEBx5m/ToKw87n238bftY4h7KZ+smduNkpZpgUzBfDxAJ5IaQe7W+EO44zqgyTX4twhHQOP3M
	KXzZpx47cZBH6SqTKo9wjKWkQ0rmzTecq3K4KH3XMsNWcgsrPYCnmjcQQ0ebauuqbx+IZu0tO0Z7O
	+qLCmfQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDia5-0000000F9vA-3PAM;
	Wed, 20 Nov 2024 11:09:09 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiTh-0000000F8Ox-0R8T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 11:02:34 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4315ee633dcso108945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 03:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732100550; x=1732705350; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=noKpNbsu/8J3MQcJ0MB00uooJSIdAZ7N8CsX2/H7nrg=;
        b=jy94GN5Be/852r2Cx2gomtkQrSHhJKRvbU7V6pidEnLb7D1fj2GkHscHXWKzaokpYA
         wiqt9ZW+cLjr0pKNY0nphrwE067mpMFHEWi3i7gWcdVeNCTPux76jx5/kmyCXR2v+7oI
         dTTI7CEkkx/JKqIno2TFrnV2wLGZm3u0KgPXtugCzgGfgWqiWdYexizvsJXFBEVS6U29
         GOMZNHqUOghD+9P3NUPVnV/qHIwwYBsoYzC1bCbtYh4xA42nUTc2QBTcT1QkuzvvHUX2
         0XLEhXGqFq48FSCn23MLwhyLXogrnnX663Tc1UCbhegdAvCeNS4j5h8Iw9Hnbrlk5/f1
         858g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732100550; x=1732705350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=noKpNbsu/8J3MQcJ0MB00uooJSIdAZ7N8CsX2/H7nrg=;
        b=H/z6KI26mwwozNP0pDmIH/KWLZjuAwm9NW+fC32Vd7GlHnQ+/BaY1ns2oBOoBYnCIJ
         WprT3NKmg4jm/cwVVj82PlaT53Mdl2ryqf4b4mdtTPtA5bqWWOgJN1kIFuY1OFyr3En+
         Y5rKUxlNv+o8AEWq3EkDnZiYfSljk9hS4vYK9yVhkm7o09Ybm3fwCeg82Y7AakHGBXer
         IDXd6TyGM4uMtckACuAmoSvNhkPh3Vf7UyDIhDHpKQEsg1nNUHdTRz+W0d3Xx48OYkE6
         DTulDXPHcM/lKWhBelaheUytEtQCFXNiBqAbIsSO/8FVzXErDR2ge5dTSRJ1VT4SwP4B
         oGJg==
X-Forwarded-Encrypted: i=1; AJvYcCXICa26jNe1bL63g4liWxfEsvWL6FNfzX65WW6Qs9BoOkazwB38ydG9SLvoixqMCl4DEEA4uinOA0ZAVV0R8XWL@lists.infradead.org
X-Gm-Message-State: AOJu0YygB/dMXf7QbYPAFDV+o9c5N9WvQcfoGJYko0eIzeMc2G0DVi4o
	JGaAxHXU8TjATXeuAksQYRjJvLBnhJnn7q0jy//7k6aJfUyA6lSfF6S+KQn9YhPzdYpQXnpOy0w
	EwKCLTlGpR0hOsWRgQ+RPnHqEzn8mQPSD51da
X-Gm-Gg: ASbGncvkcHrvE7Sy8mP7lYT5OAL0b4Gs6hK/hlF1eKy4ddjd8+Stim/gJDkuXuFukYU
	U1uDn6OZfIXHvE+rKxvdgGpUspZoKJTmyJ+7C2PQb/rF0H7baNtfnWgAyyqD5
X-Google-Smtp-Source: AGHT+IFWapXmeo6Cj0T9528tM07HHvM3xMoQi/T027qGlMPAxMjPrqnczz9/mYUi1PPvJ9NTm45LmkIXT7oK3OkNXIk=
X-Received: by 2002:a05:600c:1c0d:b0:42b:a8fc:3937 with SMTP id
 5b1f17b1804b1-4334899de42mr997515e9.4.1732100550453; Wed, 20 Nov 2024
 03:02:30 -0800 (PST)
MIME-Version: 1.0
References: <20241120105254.2842020-1-tabba@google.com> <20241120105254.2842020-13-tabba@google.com>
In-Reply-To: <20241120105254.2842020-13-tabba@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 Nov 2024 11:01:53 +0000
Message-ID: <CA+EHjTz=i2YAoh=CVG57YtP23JK1VJ=5JuvF1Gm92_wUJKmrzg@mail.gmail.com>
Subject: Re: [PATCH v1 12/12] fixup! KVM: arm64: Initialize feature id
 registers for protected VMs
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_030233_158183_05044EF3 
X-CRM114-Status: GOOD (  15.05  )
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

Apologies for this patch. I made a mistake when generating the latest
set of patches.

Cheers,
/fuad

On Wed, 20 Nov 2024 at 10:53, Fuad Tabba <tabba@google.com> wrote:
>
> ---
>  arch/arm64/kvm/hyp/nvhe/sys_regs.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> index 54f23d9fea18..62d06d5f5bca 100644
> --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> @@ -477,7 +477,6 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
>   */
>  void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu)
>  {
> -       /* List of feature registers to reset for protected VMs. */
>         const u32 pvm_feat_id_regs[] = {
>                 SYS_ID_AA64PFR0_EL1,
>                 SYS_ID_AA64PFR1_EL1,
> --
> 2.47.0.338.g60cca15819-goog
>

