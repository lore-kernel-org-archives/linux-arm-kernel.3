Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9ADCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 13:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JehmYEYTvH3+KOoQ+zQz5tmrxZTR4p7Nh8L3WHEpuvc=; b=RUEq6TGR+I/3wH9NXDQ3LclwyF
	NX+3RZsDst9ijlJq+TqmlxoqgCm3HsyafEP983ijM4L+UN856Sgj44ecLWPZ4vzEgZg+Ev7Q5QemN
	LbhLpN13YziNV5O+fo4vB0NSn9U8mbjXWjW26syQQ1WgTJdKIJVMn4ewudzTzSQYdC7qXHdO9OYO6
	4Nxuk98z4KftPNKn4kVg6Fv8JyLqAb8qlALOU2lbkWfqHksBbj/Fr/8L8XTFeM16Mxfgy04IgI3rS
	YL1Pbd0FLbGB2pwc5sVEIT5sjMObC0irW6EnjSAVuNKkSzzfaq7ARWIgeE1M3Ti+FaSGzH0mQn5YM
	J1Of4zSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZqMf-0000000HPw6-15tz;
	Wed, 17 Jun 2026 13:31:33 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZqMb-0000000HPvP-2k1a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 13:31:32 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-68bac6e24fdso8223240a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 06:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781703087; x=1782307887; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JehmYEYTvH3+KOoQ+zQz5tmrxZTR4p7Nh8L3WHEpuvc=;
        b=lPNX8EWmgwwQ9v7XBGzT33oDRFqdkd25oDRJLrhvAV+s9X0uZSIC8YS+oywIF4H43R
         4e0XsJ5l+nvjobMn1SIlJDE4zQidvZ+gQTOmQeQH7gR7iFcha1SBHfvPT415Aa3Cz1Vl
         8jbyD2hnO+3fdk5pGB1N/06rIFzmPSANEzh90BlbJC7Tb1zdX0x1LA+XK6gTYRCtqx24
         zZJ9Wj2aywydHlvUGlP3aZrqwVFde5rUhKUL5SIm0LUOtZggxfkE2bjAhOW1HNyzwSpy
         PnLdqJcJhszy3ljDc4NhWGgvMPkdUvbXSYoRW4IkQ7MbALuFt5bpuMJrGkw9mvinrLg/
         5jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781703087; x=1782307887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JehmYEYTvH3+KOoQ+zQz5tmrxZTR4p7Nh8L3WHEpuvc=;
        b=lYTyVRX1piW26XTZi2QRYIItuc03bC0vN3yB77GKeV/yDBS66QWkj+/R2Frsa6T37v
         wKSyR1kLbUgijdq1aEHWhj+Pb6Rqr4d3jbO77+fuhle1v5d/UUGrS/LXhjgUSRe8+hFo
         l0CJiZ8jpoHt04bIHnG+wg9h0QjexOxvPgLS9zgjK8bS6shQrKk7DWkyR6OUpiDyXGNI
         mvbkTlw1t1rdjdFym2mA5Skv0RBocU+NqbI9FwBSAe+ymbCuhEyNMh5Sf3j8cnx/FVRB
         bm2JYsGliwNNC3omZIMN10BHT5XycmR+RPMQoKJLCN8oZNwcHxUSeJyoDPIwklwHVv+W
         iV2A==
X-Forwarded-Encrypted: i=1; AFNElJ9NRDye+3LuqxTAtv/oiIPuB8baq04AsM76tKP9khaQHJEU5IAMChlvDdTr7aJLpaC2d/CNgcVZmdZ5hIXx5vM6@lists.infradead.org
X-Gm-Message-State: AOJu0YzbwoL8XSmwLB5fMMBHlHUGn+FqY+I2KjEMcFy9aH4Kkihnm7bY
	dUfr1IZSQ3bXsy04iFPcUkq20pF2dZ2Ly5j4WKmtR2frIufZFPzpmI5gouS09+eIt5iHaKZ4cx8
	QfsqrYA==
X-Gm-Gg: AfdE7ckJPu4AhGMNIBGWeguE1VEe9iag+CagEeqokMouSFDqwdB+7hY+Ih+YA4rvS2U
	RJ66CahH5qaWtW1dGb3XDitBLZOuHoXYs6yFKqx/IetrRKk50EaNBCAwzT7UrnvALBlgfyTgsJF
	a0jDfOvgTHeVKtoxD6EHrIw4Kh4JV2KvOzbP5QE/2qmMj+U9DWtKgTKa2cohula7cnagIQC/6OG
	3RXrMLjl9b/+NvtuI5zEI6AoOEP4Blm0zkK0zaEJQ7bVYYDbZS7aizAysUqQnTlX8p8prYtME9z
	KvjkQ/blG2l+N6shMxPLhuc2kO4pDZ5lbI5K2bcyiD3X/0ypfWcTQdol6Y8rXcjJFnwt+vPvTxC
	jJoqu6iiCdJyfxLMLAjdqXxTyI1jxnY3e5XogTGAUSrUUXMujjWHMI80SiuYIRHcKIoAWO5a98F
	enpgwnCyBUR9/kMsOnnod/JYK0T2vC7oMZB9+1RzyJf6ftuma7Hvx18iFRO1bZ0nrc4h4=
X-Received: by 2002:a05:6402:848:b0:68f:cca5:d9e7 with SMTP id 4fb4d7f45d1cf-69547463699mr2153169a12.27.1781703083904;
        Wed, 17 Jun 2026 06:31:23 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937938a145sm6879295a12.15.2026.06.17.06.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 06:31:23 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:31:19 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kernel-team@android.com
Subject: Re: [PATCH] KVM: arm64: Add missing hyp_enter when trapping sysreg
Message-ID: <ajKhp-R01iaEL8XX@google.com>
References: <20260617095238.1530121-1-vdonnefort@google.com>
 <CA+EHjTz2Hc-mCA4Q0ayw0KV6KJ9_-qN5oPahVqMeKKUs93xtZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTz2Hc-mCA4Q0ayw0KV6KJ9_-qN5oPahVqMeKKUs93xtZQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_063129_730863_C6943145 
X-CRM114-Status: GOOD (  21.05  )
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

On Wed, Jun 17, 2026 at 11:28:11AM +0100, Fuad Tabba wrote:
> On Wed, 17 Jun 2026 at 10:55, Vincent Donnefort <vdonnefort@google.com> wrote:
> >
> > Add a missing hypervisor event call for hyp_enter on sysreg trapping,
> > causing an unbalanced hyp_enter/hyp_exit.
> >
> > The enum hyp_enter_exit_reason is not ABI, so we can keep the ERET
> > reasons at the end for clarity.
> >
> > Fixes: 696dfec22b8e ("KVM: arm64: Add hyp_enter/hyp_exit events to nVHE/pKVM hyp")
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> One thing that caught my eye (as Sashiko would say: pre-existing, not
> introduced here), __hyp_enter_exit_reason_str() relies on positional
> correspondence between strs[] and enum hyp_enter_exit_reason, with no
> compile-time check. Inserting a new value in the middle of the enum
> (as you do here) silently shifts all the strings after it if the table
> isn't updated in lockstep.
> 
> A BUILD_BUG_ON(ARRAY_SIZE(strs)...) would at least catch size
> mismatches; catching ordering bugs is harder without per-entry
> initialisers like [HYP_REASON_SYS] = "sys".

Both are declared in a different file. You're correct this would be less error
prone to define [ XXX ] = "xxx". Perhaps I should convert that later.

> 
> Something for a future patch, for now:
> 
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Fuad Tabba <tabba@google.com>

Thanks!

> 
> Cheers,
> /fuad
> 
> 
> >
> > diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
> > index 743c49bd878f..5f6e6789d121 100644
> > --- a/arch/arm64/include/asm/kvm_hypevents.h
> > +++ b/arch/arm64/include/asm/kvm_hypevents.h
> > @@ -12,6 +12,7 @@
> >  enum hyp_enter_exit_reason {
> >         HYP_REASON_SMC,
> >         HYP_REASON_HVC,
> > +       HYP_REASON_SYS,
> >         HYP_REASON_PSCI,
> >         HYP_REASON_HOST_ABORT,
> >         HYP_REASON_GUEST_EXIT,
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index 06db299c37a8..45a4abb9619d 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -913,6 +913,7 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
> >                 handle_host_mem_abort(host_ctxt);
> >                 break;
> >         case ESR_ELx_EC_SYS64:
> > +               trace_hyp_enter(host_ctxt, HYP_REASON_SYS);
> >                 if (handle_host_mte(esr))
> >                         break;
> >                 fallthrough;
> > diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
> > index c4b3ee552131..c84434e2349a 100644
> > --- a/arch/arm64/kvm/hyp_trace.c
> > +++ b/arch/arm64/kvm/hyp_trace.c
> > @@ -398,6 +398,7 @@ static const char *__hyp_enter_exit_reason_str(u8 reason)
> >         static const char strs[][12] = {
> >                 "smc",
> >                 "hvc",
> > +               "sys",
> >                 "psci",
> >                 "host_abort",
> >                 "guest_exit",
> >
> > base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
> > --
> > 2.54.0.1136.gdb2ca164c4-goog
> >

