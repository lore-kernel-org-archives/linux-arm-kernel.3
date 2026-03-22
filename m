Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87656FC72CB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 15:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7g8MY1vCtLNn6W/YkPkDXFGjyD7zE3ehnXdpUQaG3r8=; b=sUjqKmkH6LDGB9DnOld0rfaR7a
	//J5nRv0SWelzSE68Cfbcf7Oah/4I/Y1G4gGY9FxWJmv+JRGDBYhaAykCU+otXXOxiqCFbArejxHU
	novv8MvxOV6o3jlRlCQG7Sy+z78oOLKtzP8imCM4AT/NJwFTq4DBf1ubRuFJa+kbF9rX0w/jy+bhJ
	s/MiV0/ANqT+zLBlIPh0bDpHeR8NsLNdhHYTjsviFS8OEErLmsPsKRdT3N1PV7GiidudJbFvajohK
	EhuELiQxewjGYY680Fkl1jW10kBImz54TVEcfiSd2PnU/5VMHLY03gBVk0ftUirhhJGRaWdmTNF73
	fMSJMmTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Kym-0000000FT7z-0tKW;
	Sun, 22 Mar 2026 15:44:40 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Kyj-0000000FT7b-3YTs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 15:44:38 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-5091ed02c54so688191cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 08:44:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774194276; cv=none;
        d=google.com; s=arc-20240605;
        b=TJfS3GZjEfkm+JFNYc04mq8LU3DX/4GrHVAXXDtb91pf9AbaoNzAtaO9dzBizG9gwK
         O5ab2jcbKigtpY9ZKXAVRUzUKkbd4XPxh9BQDrregkF6p2L1UOlRAeQcoTHD2kZS1B6J
         6hFa3tigvyVJswrYZ3RbUnGaAegRhEP1VsOmNGfHVXBTEgbqNjDiExf5ufjLaZFpQawP
         ZOt08jIOflklsMHHABKpv8guvMOvkn5xbloEq3U3SsXcBYRqdwHoci8MK0YcE/W3kYAi
         CEHD6KIIdvH+Gn8nwOSEBsfw5cgLovdqwW2ifXXxY+xH/nDRFbesGctyWoJnrNrS2pzI
         E69A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7g8MY1vCtLNn6W/YkPkDXFGjyD7zE3ehnXdpUQaG3r8=;
        fh=6BW3lEOC7PTdlitUNQNR+bc83CSeKxUtOlUty/C3dwA=;
        b=bGtyTbLJi/6M1tyxpCjJulgW/Vl+hPQ1HXNkFCFTyqUZk64+KdkqYQt9s2STbYYX7p
         ins08PixrsO/TFZxAMWgrGvlTkBmXx6YdEKSjfSCgs8XmvJRBm+F1+sCpA681EGapxnW
         mHGVmKAZdSWyYjPfA97RdGRn2FuA1CUiQiTZbw9eUfnegh3KuTTsVrriaylK4OlmZpTf
         yKB5HJOhotzTJm5/nqESnLqdwIQwlI9G2/eM1hLZlt7kNQWyuU1QuYFOvNq3+mSs4eXi
         XW6+Rz6t4o2LP+ZSwG4MJdKAWgs+lV+FXQPJVEFiYOvhYwnrbeHBntVT+ZSQjxOABgO0
         JQXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774194276; x=1774799076; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7g8MY1vCtLNn6W/YkPkDXFGjyD7zE3ehnXdpUQaG3r8=;
        b=jbPqgUC30e4zQ1MFV+rizRoeCfzUcV0UuA6uJcXmRRLkew6pzWxFNKGv/BfcJI6VqC
         dxwQ8tonDEuUUGh7OdAokFzUgWJY0ilqErl49lrj9Z6pKuMj9MFwr0ed7HHjPnwJ2BDH
         Ci3+96KUS+IqrNW6+ne0WK5E5fws9Rx9Nnctt2DVNJKHphhnqnT4gPwjNpNGP2S83lGq
         wzrXDN0zWC/KJ5l1vGj7W1icQb9068B4dtE2/r5uczLH89t7bZXFlO/Unz7kfQs2JIz2
         /Fhg1dsXZAwqC8kgv682C1XzKfx4EIOxdGXWtZiHhfZ5dZ23zBsQ4gfiA2Q19IWTrHSK
         BCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774194276; x=1774799076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7g8MY1vCtLNn6W/YkPkDXFGjyD7zE3ehnXdpUQaG3r8=;
        b=OeiS/6RupfLjVkhE2xX324t+v94MBeA4VX1DoBMo0Or1Igc3BJ6AhIMwD/w3rV4NET
         PADZqFhwzna90H2/7QUIChaQkP9Gfahi/94ShqYOCrnUB/uqK4J87HGEdsyBOCbhgrD5
         VXqbWQ2vZ9/OeS2/yv4TEU8RQEINOPj7JVg+c2J4HQzSWv+jakLNamPvT9dz7Ihdsm/u
         hvuxL0phBcF7RCLcXodH/zV9+VfmRMuSDYtQoPlXTQff2Vx9UiH+Zc3udkgMUbhaq+Qm
         /JUkJPJ7S8zs/YY2ll/vhtWsz5kAjdN1uTnpI3Ee1huIvvASObEQGF2jHfTf6F5Uv/X4
         xeXg==
X-Forwarded-Encrypted: i=1; AJvYcCXdDS78rtz3i734TVp94iJHxmzIK/lsa0Z7NV9P5gkb2iQaA6au5oBAQK9v5MHJrNjbmkoxVWh7iQylgh4GilhM@lists.infradead.org
X-Gm-Message-State: AOJu0Yx31XuSUrvaK/d9fFFNz0qHADqY6C4u1ZntsO0iCWh2QSYQA/nz
	GF9Wh1776cxeQZ4gGxpJjtIdJZaosIUsTNBxfeA4yDPFxz41UWzL9hxpAfk6GMU+fWatz6YEYKx
	rlAayMfNxMn02vX1/7scfW55gzATLaGA8L8mGymgN
X-Gm-Gg: ATEYQzyqGE99CA8MX6txRGJgZVLdq8qm9QfWOjq/u10mxBIsOhoW3JU+r4mJbpmJxmL
	xkz+HXcCFKQGhbjMUmaIIlbIhhX7JYLEORR4mV3+zzcxoTAIttn8xxJ7qjD7TRrFcwoo8CMe/Jc
	NpPmABuH7Ss0oIamq6oNdHpONRg7jHcO6YQqiGx7/h+nA2/sKLMnuopUlodfa/wlzC9S4LIycON
	s3eFumyHov9TaU/NdR3kHK1JgjJf+95lk5hintVZVhUBeZLEB4l9+J4zjY1j4Hf9cLQQVmcvn2A
	O8B+1zxE
X-Received: by 2002:a05:622a:8c04:b0:509:14f0:bff2 with SMTP id
 d75a77b69052e-50b46cb352cmr19351491cf.12.1774194276032; Sun, 22 Mar 2026
 08:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260321212419.2803972-1-maz@kernel.org> <20260321212419.2803972-4-maz@kernel.org>
In-Reply-To: <20260321212419.2803972-4-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 22 Mar 2026 15:43:58 +0000
X-Gm-Features: AQROBzD3Objm2EQkQmOztE3PUeZpkFxeB6Okjt6XWmW0dH-3UyAexaWM0HnGGdI
Message-ID: <CA+EHjTycbB1rZGALB0L1iyOkaVuH+5a5bBD0teo79YHNEE5-Pg@mail.gmail.com>
Subject: Re: [PATCH 3/5] KVM: arm64: pkvm: Turn __kvm_hyp_init_cpu into an
 inner label
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Mostafa Saleh <smostafa@google.com>, Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_084437_914675_38CC146D 
X-CRM114-Status: GOOD (  16.39  )
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

On Sat, 21 Mar 2026 at 21:24, Marc Zyngier <maz@kernel.org> wrote:
>
> __kvm_hyp_init_cpu really is an internal label for kvm_hyp_cpu_entry
> and kvm_hyp_cpu_resume.
>
> Make it clear that this is what it is, and drop a pointless branch
> in kvm_hyp_cpu_resume.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/hyp/nvhe/hyp-init.S | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
> index 55e0dce65dc56..2e80fcbff2dff 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
> @@ -175,7 +175,6 @@ SYM_CODE_END(___kvm_hyp_init)
>  SYM_CODE_START(kvm_hyp_cpu_entry)
>         mov     x1, #1                          // is_cpu_on = true
>         b       __kvm_hyp_init_cpu
> -SYM_CODE_END(kvm_hyp_cpu_entry)
>
>  /*
>   * PSCI CPU_SUSPEND / SYSTEM_SUSPEND entry point
> @@ -184,17 +183,8 @@ SYM_CODE_END(kvm_hyp_cpu_entry)
>   */
>  SYM_CODE_START(kvm_hyp_cpu_resume)
>         mov     x1, #0                          // is_cpu_on = false
> -       b       __kvm_hyp_init_cpu
> -SYM_CODE_END(kvm_hyp_cpu_resume)
>
> -/*
> - * Common code for CPU entry points. Initializes EL2 state and
> - * installs the hypervisor before handing over to a C handler.
> - *
> - * x0: struct kvm_nvhe_init_params PA
> - * x1: bool is_cpu_on
> - */
> -SYM_CODE_START_LOCAL(__kvm_hyp_init_cpu)
> +SYM_INNER_LABEL(__kvm_hyp_init_cpu, SYM_L_LOCAL)
>         mov     x28, x0                         // Stash arguments
>         mov     x29, x1
>
> @@ -223,7 +213,8 @@ SYM_CODE_START_LOCAL(__kvm_hyp_init_cpu)
>  1:     wfe
>         wfi
>         b       1b
> -SYM_CODE_END(__kvm_hyp_init_cpu)
> +SYM_CODE_END(kvm_hyp_cpu_resume)
> +SYM_CODE_END(kvm_hyp_cpu_entry)
>
>  SYM_CODE_START(__kvm_handle_stub_hvc)
>         /*
> --
> 2.47.3
>

