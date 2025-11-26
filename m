Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86615D10F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7pHNmd+OftDcBNWJEe007EP303xNpyOITe1eHb8D48=; b=LSqfK/4Ih6m9EfZv+MBguRwIPI
	WCwP63NYruZ1kheaOz4F8GRteLrDyc9ntdON0Tqk4k8fCkzVtADt9DaTnkOYGsy1+IpelMjQQ6vKH
	cB5EdSfsc6n5z+syHLiWAboQuFWcNhGLAUM8R66/nonfLtX0y27BJUaoCh1crHlHnIG5J5apvgBpe
	hbYs8SmLss/oUyYu06LOVGZbJ5eLEn2IPf9vWhQLMNghXe/7aN4mvFxLxncxLvRUUkv2Rnl11/oGo
	hPGyNyK6KyUaYmJjSgADK2wP7aNmSo4zTbpc/dePWSyzclufJXzbwXGdT+nhLZ4WMJkQB5NAuwnFz
	vufRWIag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCtC-0000000EoVQ-2td9;
	Wed, 26 Nov 2025 10:36:46 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCt8-0000000EoV1-1qJh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:36:44 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4edb8d6e98aso319181cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764153400; x=1764758200; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P7pHNmd+OftDcBNWJEe007EP303xNpyOITe1eHb8D48=;
        b=cEBYax+GZg/kGDShAeZW5sDqwq3Tkama0PfOkAtHAF1BCoVVCJvTuht2ntlk3UifJ2
         uW0n92d/OWiTypNbfaCEpsfolpN+LhSkzgdfXmfcPs2hBJs+5XEnL51cMgWPvdvB8mGn
         FeL/o+ArXyFcRXysD7fYLgargU3uabxGkYhYtdQ99amAjQMiBzwC3NB3W0yUVXVkgdzo
         6lLYWO20YTyvqQFA65pUEayE5rXc3QlO1noc+RbvJxTG0oYKqOZ4g6W/pHvb/L2kr+Q7
         VZJTrOfzZ/DLa2HdPgGxzV+W43zRA7gVhjMDNg4wBpHqvO5VnrQK22KriFUGYFcMxVKT
         WUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764153400; x=1764758200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7pHNmd+OftDcBNWJEe007EP303xNpyOITe1eHb8D48=;
        b=RMDD1BgPo0+GQ6wogoBWYMiP56LuKJuhG33qgFJB36rKusKPKagzezgHkL3NZD+UtF
         A6icYx7cJZIQFpjjYgV6I7qR7HeeZd38dqvtd7tHggc+qM2y+M1hNeC3Gqm7VZkz2Vcq
         IBoiFvTNZ7pnmPyC2u9xm0omfxugxTYQNtdkZFCcRdofhLiAZmftS0zObMq2k4/rpEO6
         oOsgLiH7iswts74BVSGt8QG4C5YbgSqBdVTUZphurLqms31/PUyEwP7RNMGdLL5emyuz
         IhZJZanbSWWeuAsopclRN3ZRxqvTDoUUKQP+78anttF+IUEYn2eGDz7lE6GZJfkcf1PP
         7wYw==
X-Forwarded-Encrypted: i=1; AJvYcCWIyauStke953sa4mbXBOEThgU6zFQlpdv+Ztbyv/7MhMMK9a0IwZzyVrO/2P5kkpscxTdTxGTza2yNmPeuRYEy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1xL+a9jAgrvBUNRWEFO1NK9Zyf/OwHcZkNipXJmf9tfNie4e5
	7zaonlV8LQW5OgsSfumgWCvHxBqtv8ZqBfhhHPZrpzf9UTntkN5OXkcc8Sg6cCllmW3dLSaRz+p
	6SW428KM+YJ8B/HSUlh1fJN9H+zfE/b0hDnksJ0+9
X-Gm-Gg: ASbGncvfm/Mtu7gWbKNxg22gvY7xiOy/RO1W5EqRgGHtAh62rIs3xvNUVhTR6wJUDdx
	5YYwl409qJtmjT/w+a/IlFsnDU5JnMhUAywYWx0LiTDC3MIgSLIuexA6oeUs8MxOOVlMFaz7Rq0
	e38Bfm0G0/CcGDvjqolUc7DIEZfbC+EBDUFY0gYWe0fGsX1jA96N65CuzLT0PevBNC9VMSZDP0g
	BE692NQL1KGyT7JED8KYImqxhqjT5aGJl3daxdWZuLKYdGyB/Cc41gXcMR/JiRI9AD5TL59oZeE
	ObW7Md8uM4Je50Rs8gWbdwqj
X-Google-Smtp-Source: AGHT+IGkh9T1GrCUEpS5l062Fy5pAu9uCk7G2i8OmKE8/iyKVeVmXdLFKhDA+YJ8ohA/lcPy/RaaxUQsbDdHP1RbJY0=
X-Received: by 2002:a05:622a:14d1:b0:4e8:b245:fba0 with SMTP id
 d75a77b69052e-4efc6c8b9d2mr4049881cf.14.1764153399930; Wed, 26 Nov 2025
 02:36:39 -0800 (PST)
MIME-Version: 1.0
References: <20251118103807.707500-1-tabba@google.com> <20251118103807.707500-3-tabba@google.com>
 <868qftqehe.wl-maz@kernel.org> <d94e17d3-41db-42f8-8039-e1d6a694788c@linaro.org>
In-Reply-To: <d94e17d3-41db-42f8-8039-e1d6a694788c@linaro.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 26 Nov 2025 10:36:03 +0000
X-Gm-Features: AWmQ_bk-AItuaclLZ-cyhTHY0J1L0Rx-tqJp1c-Q_vTQeqTrS2IzHT0qxOGJA1I
Message-ID: <CA+EHjTzizVuHXeULzyiV8cetcGMXHro=-UeqWb=cFKf1tR0aZw@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] KVM: arm64: Fix Trace Buffer trap polarity for
 protected VMs
To: James Clark <james.clark@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_023642_544020_418111B2 
X-CRM114-Status: GOOD (  24.56  )
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

Hi James,

On Wed, 26 Nov 2025 at 10:29, James Clark <james.clark@linaro.org> wrote:
>
>
>
> On 26/11/2025 10:23 am, Marc Zyngier wrote:
> > On Tue, 18 Nov 2025 10:37:59 +0000,
> > Fuad Tabba <tabba@google.com> wrote:
> >>
> >> The E2TB bits in MDCR_EL2 control trapping of Trace Buffer system
> >> register accesses. These accesses are trapped to EL2 when the bits are
> >> clear.
> >>
> >> The trap initialization logic for protected VMs in pvm_init_traps_mdcr()
> >> had the polarity inverted. When a guest did not support the Trace Buffer
> >> feature, the code was setting E2TB. This incorrectly disabled the trap,
> >> potentially allowing a protected guest to access registers for a feature
> >> it was not given.
> >>
> >> Fix this by inverting the operation.
> >>
> >> Fixes: f50758260bff ("KVM: arm64: Group setting traps for protected VMs by control register")
> >> Signed-off-by: Fuad Tabba <tabba@google.com>
> >> ---
> >>   arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> >> index 8d06a246dfd1..f6f8996c4f97 100644
> >> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> >> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> >> @@ -118,7 +118,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
> >>              val |= MDCR_EL2_TTRF;
> >>
> >>      if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, IMP))
> >> -            val |= MDCR_EL2_E2TB_MASK;
> >> +            val &= ~MDCR_EL2_E2TB_MASK;
> >
> > This does not only change the trapping logic (bit 24). It also change
> > the ownership of the buffer (bit 25). I wonder whether you should do
> > something for that, maybe by clearing TRBLIMITR_EL1.E, because
> > otherwise, you keep tracing, but using an EL2 VA. What could possibly
> > go wrong?
> >
> > Overall, I'm very uneasy about TRBE in the context of pKVM.
> >
> > Thanks,
> >
> >       M.
> >
>
> Don't we already clear TRBLIMITR_EL1.E in __trace_needs_drain() for pKVM
> when switching to the guest?

I don't think so:
https://elixir.bootlin.com/linux/v6.18-rc7/source/arch/arm64/kvm/hyp/nvhe/debug-sr.c#L60

Cheers,
/fuad
> James
>

