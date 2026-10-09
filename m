Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F37CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 13:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VP6lo9UvxywGclViIScVPks4qj7qP1L4wxVmljfUt8Q=; b=X6SELHmdPmwi+Jn19VK4A3yj7n
	Em4YHcVOsZHxpORP8waFbvT5DOArK4xNI3Glxu3McfdW6gOCACOF9oMBc9DKuUH0UWztqRQHZIg4g
	WcQSX2U5ghdHXWU2QI3jsvYIqX3OVZ3By39gM++7PAMfrA/LSgOQw6KP0xZeX4VyBed3nBYdTD2cu
	8XJbvHgnG6h8/7aH4DcqJa8WL5QnQ3GeIYI06ZR1TGcxs0n/qXjBnLy21pl/wFztJpBwgo69/zpdb
	n/PiQ5HDOVY6PyIUdlYc6UwSZqHGRaOX6gXLtiGMxBIPP04EnFKQ0ygwz51WDAFWUzvZ8nr+dQPO5
	H2MptrJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAUJ-00000006MnU-3x0l;
	Fri, 09 Oct 2026 13:18:15 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAUF-00000006Mmn-3mOf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 13:18:14 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso4827655f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 06:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791551890; x=1792156690; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VP6lo9UvxywGclViIScVPks4qj7qP1L4wxVmljfUt8Q=;
        b=IH61hlGwHJekKSkchs6ZkzKG/3bSeVADU0R8E4SNaNZgW9bvQBKzjQDe2PmQpEwOTi
         M85it7k3FFirewFDnaEFzUuqbHaC5LbuztEJnvm/1J/ULhELOQtJSLvJ8jh28M3mPYgh
         UtevTahRN+w0F81oJaVmPmky7XBe277U/k1FaA7zTkEkILrJ0eSSHO7Su2hGUXsyonEF
         +/x5tiVJIuCZHn0uPtETCagy25EZHLSOVxSEo2sSwYVyTQRvaqLQ6agwUV5X+9d9uroC
         3z3h7fBcM8Jir0Y+v+JD6Q+ziVWtetZMxhLTwHRT2b+s/KsuRdtmBd8UziOy4Zpkxa64
         vX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551890; x=1792156690;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VP6lo9UvxywGclViIScVPks4qj7qP1L4wxVmljfUt8Q=;
        b=e9TUB3uiDnV7pcqxeW8lfOILIQ0zRqak6ALkVwAuakj0+rDsTh5QBaq2N2J3gG0Fm6
         zh6HVtFKuKWNdyEydg6tYhBIJCnL6UdhYiIluAtXSRmDTZEJtLfpakK5qWlMq1EkuWQC
         pqQWCGeDRp5ZX6Bxyc3BwXJAvCE8vvMk5mai2JwQkxvC3KNr6hVOkY/rvxNJCEAh5pfu
         MOPB8u5oJEiOx3Cd9bWIEiUvL2HaoQNR3p7Qz0yin/VHbnDGS1vnnb5REn6oWd32ysEE
         nLDCFde4KzxwK1GWEYmnc7hIc0U3fct+l15kx3G99P9BpycROz+/NIJLmPh6osgsFBMJ
         lYkw==
X-Forwarded-Encrypted: i=1; AKwUvBwuFu9l+/iZHofy2Gq1C3UUFyYnc40XVAr09OCYd1sWVDLX2qXVIGlf4/D3bwzpg6dmQHRherTRMcZ1hTj4JjvB@lists.infradead.org
X-Gm-Message-State: AFuF++neAtWQfG02bZ4enN53HGXiRnnPNff9cZdxN8dxILOkduH5iJhs
	UIv/kby69u9CuTgT3Pa12K8vxBjUDWZYl3mT5r3+M9meLWDHL17aUsYT8IhKjckITg==
X-Gm-Gg: AYBFou2n1W5dlAE933yQ85bVzAt0yZS8AyF8VH8uRS+UoA4j00KB8JAEJJWayu2eJRX
	yFPF4W3hIRKoazQeEvZTVeaKjoRl9kFpjwAKJ8ouOa8SDi4uUJfI/ul9jeX/6l1ydelTWfvP3Qj
	tU0Jd6lQBuFy/X9uHezV3b39ut4OS4kITCULn8TmsE8r1ufre5k+7PFqAdP2i4pD1QnXH7OGnrj
	1EORhTpK67SxIvpgRKJ5FPR3udRqzmafxf+3PP7bA8you8o4XUtqHArXYF3c0ApbtyZdJ1/dXxd
	U9hz0WX1z65Vgkoa5s/CnfY9h7GlzPoaivPy4aQe0YfSWE5RZcA23FZJEk9LO+ZRk8cVmF0mS6/
	uuN2OKoUI4iAgePSDjTVRmiSXpqsdbM0d7itdW0Ovpz5JX44zEiIEwX5svLPR1ZywWGvyGOemVJ
	BMQfyHUSVzALzCrbdXzcpDdEaN9QXNs3+ub3Tkkq46Nig1lMrhCwnvxyZGe/Wu+ccvhiwxVRT8V
	InmH9qtw8/8ml50VTMAmAivmTSIod2qSt/d4ja/6jw=
X-Received: by 2002:a05:600d:8051:b0:49e:7a00:b9a5 with SMTP id 5b1f17b1804b1-4a18e4475a2mr39489505e9.4.1791551889336;
        Fri, 09 Oct 2026 06:18:09 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm79782655e9.0.2026.10.09.06.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:18:06 -0700 (PDT)
Date: Fri, 9 Oct 2026 14:17:53 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	qperret@google.com
Subject: Re: [PATCH v1 2/3] KVM: arm64: Add guest_hvc hyp event
Message-ID: <asjpgZDRmg54UfTm@google.com>
References: <20261009084529.462577-1-vdonnefort@google.com>
 <20261009084529.462577-3-vdonnefort@google.com>
 <CA+EHjTxzBBDpg3B9Lw47tMWMK+VCjpeEQDgYNKvLUnmUYVJVcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxzBBDpg3B9Lw47tMWMK+VCjpeEQDgYNKvLUnmUYVJVcA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_061813_087600_6FC18DF4 
X-CRM114-Status: GOOD (  20.14  )
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

On Fri, Oct 09, 2026 at 01:06:05PM +0100, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Fri, 09 Oct 2026 09:45:28 +0100, Vincent Donnefort
> <vdonnefort@google.com> wrote:
> 
> > Add a guest_hvc hypervisor trace event to log protected VM HVC call IDs,
> > return values, and whether the call was handled by the hypervisor.
> 
> nit: only the first return value is logged.
> 
> [...]
> > diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
> 
> [...]
> > +HYP_EVENT(guest_hvc,
> > +        HE_PROTO(u32 id, u64 val, u8 handled),
> > +        HE_STRUCT(
> > +                he_field(u8, handled)
> > +                he_field(u32, id)
> > +                he_field(u64, val)
> > +        ),
> 
> remote_event_format_show() doesn't align the field offsets, so the
> format file puts id at 3 and val at 7 instead of 4 and 8. hyp_enter's
> vcpu is already off the same way, so should this be a separate fix in
> trace_remote.c, with ALIGN(offset, field->align)?

Ha, absolutely, I'll send something to linux-trace. We don't have this issue in
Android kernel because the struct are __packed there.

> 
> [...]
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> 
> [...]
> > @@ -1183,5 +1185,8 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
> >
> >          if (handled)
> >                  smccc_set_retval(vcpu, val[0], val[1], val[2], val[3]);
> > +
> > +        trace_guest_hvc(fn, val[0], handled);
> > +
> >          return handled;
> 
> When handled is false, val[0] is the SMCCC_RET_INVALID_PARAMETER
> initialiser, which the guest never gets. For example, a MEM_SHARE
> forwarded to the host logs "id=0xc6000003 val=0xfffffffffffffffd
> handled=0". Could this log 0 in that case?

Ack. That shouldn't be too difficult

> 
> Cheers,
> /fuad

-- 
Vincent

