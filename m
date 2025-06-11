Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620B6C71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 21:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOOIslp7Z9nXASpzhAXfaGcmmRlsRSek7f7fvNs7EhY=; b=muPZhfFTX8cyhM4KjB1Y2PGdVf
	97zJt4xZP5hib3wqQ+ESUJ/yI9xdhgwohnBfNIntaE8xIIqy1ERfnviqdEicqEnmDvf6aqZuLA60N
	rr2LBMLgcJlps0Lqq1fLtt0nrlyqeNBZlWjMZZVXve/lMpJLkPkcURDY4dkwbta9hRaQq8nHPhyUw
	lUDEKYC9gyrPomvVA44lfW58M7QKv6pwSYoOK0g3vy95J1sZc5hKcLCgjtzuDnI4H/WpRSQqlt+lv
	smPQhcReYPDvFuI2xXvbr99n3OV8tjmzn2p5muFWK9u5ksH+hBYoONUANRJkkdjy73NRqZ5beW9Qs
	MTtJCXOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSqI-0000000BI4Z-0z8n;
	Wed, 11 Jun 2025 21:18:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPQ95-0000000ArdW-3aCd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 18:25:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749666353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OOOIslp7Z9nXASpzhAXfaGcmmRlsRSek7f7fvNs7EhY=;
	b=UF0MESCoPDgfhTVUbdJ/fcISkxwsOON9DEyHIecMNYepoEDsI/oI1xLgn4qYfPIRY38RqD
	dVHK5+bwDQCyofd2/T8nXhnNx0zBJmJa9dfGDBurcOTLL3xLxYT8OxgmHdzRYU7IR0WVOa
	jCBjsPAJ35+Mpe1bNlH6O/mpAgGfgNw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-m_rcqyDpMrO1WT-mzUlHiw-1; Wed, 11 Jun 2025 14:25:51 -0400
X-MC-Unique: m_rcqyDpMrO1WT-mzUlHiw-1
X-Mimecast-MFC-AGG-ID: m_rcqyDpMrO1WT-mzUlHiw_1749666350
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4fabcafecso104528f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 11:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749666350; x=1750271150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOOIslp7Z9nXASpzhAXfaGcmmRlsRSek7f7fvNs7EhY=;
        b=PJ5LqCaBUARgTGR+vBGPB6VaBlOqsLmTQ49fH0n4U6MIu1TX1w7cCDoYWojlc7Z16h
         UnqsI8wtnmo34jHRFwMLJHix1Ql/O89YRbM3pb3tmosE7FOFFOXsJ4TdxRk3MJFh1Pxg
         IntjNSWejus+YYmsHHq/0bTdl56o/GhD7CNdD35me4gN/FoDd7fXHAzQzc/THprb/r3O
         US8B+ylr24bKXgyYvY44Iwe7J7U3XucpjIpFaduwOYnJJZHM0Ap8IeZsWtCyvzcLpwNe
         xrrItuNusb7CEBr8ftk9d1UhwL95Wo41E7ZvYnYtI3TxWTed+9iZRSPTQ6ePlUN36+M6
         p/Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVlLlBWapGRNJb10Lb08oX3P6ou/Bd+MvaiWbbAt9x0SXPn+JS6FYRVcKg3IC0jbId5vCrT/KRWDGIhZoTbWZKn@lists.infradead.org
X-Gm-Message-State: AOJu0YyywApg0ZBouJGsKC77DPOYRJvgQdpuTxVA708T91uJ6dCuEViA
	+WFpyizNUrcBIJVbZm++KFmPnoZMp0beIPEv711nyCA77FKJqLVWurfzmVQ/b2WbxnUVbGRW4ba
	UcthaZVvjAbanj9/P6hwI3ivPol2ohhxUcikr+lc7QoRaPkmi0uHaiyxKWVqw5KTrnMYmFVwtkF
	LFTZ7GZ2dVlFVFG1Zx1EP0mpnxq9sBfPqc3HBcA8LIShdimsyvuRM=
X-Gm-Gg: ASbGncu2r+Oy0W899jXmlrEcavtqvMn1cCfqEoew/GEP7kkMrIFM4aLTNWps8VPMHOs
	CKu0H7RTTLnO3C1N/NrZxLct2JBS/cljNpomWa7yN2N5TKvTlkQJcmObALAp2jF8AG7OR05zHah
	o/4g==
X-Received: by 2002:a05:6000:420f:b0:3a5:2f23:3783 with SMTP id ffacd0b85a97d-3a55869b8e1mr3427926f8f.24.1749666350205;
        Wed, 11 Jun 2025 11:25:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw1W0p/OeOmX200drwAxajGEghfRNt/CGI93zVm1UqIQ+I2s8lkCVrViNK/rTG856Z88dFFfkE8v1yeaf2mxA=
X-Received: by 2002:a05:6000:420f:b0:3a5:2f23:3783 with SMTP id
 ffacd0b85a97d-3a55869b8e1mr3427915f8f.24.1749666349830; Wed, 11 Jun 2025
 11:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250606094350.1318309-1-maz@kernel.org>
In-Reply-To: <20250606094350.1318309-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 11 Jun 2025 20:25:37 +0200
X-Gm-Features: AX0GCFsgTrXBmCEi1cZ9vmBCByY8mT5dVXknZ_pqZHoWTAQJcrp5JqwyhfcBkUo
Message-ID: <CABgObfbd=Jx4UdXKXyCb+8bQotLk-rc8P_BD-Aafx_rttgHMYA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 6.16, take #2
To: Marc Zyngier <maz@kernel.org>
Cc: Miguel Luis <miguel.luis@oracle.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Sebastian Ott <sebott@redhat.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NArXBE04s4-hf2QQkZJuSi6HQH-UhO8EU0QPjqTjQU4_1749666350
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_112555_962710_4E173EA6 
X-CRM114-Status: GOOD (  18.21  )
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

On Fri, Jun 6, 2025 at 11:44=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> Paolo,
>
> Here the second batch of fixes for 6.16. We have a significant rework
> of our system register accessors so that the RES0/RES1 sanitisation
> gets applied at the right time, and a bunch of fixes for a single
> selftest that really *never* worked.
>
> Please pull,

Pulled, thanks.

Paolo

>         M.
>
> The following changes since commit 4d62121ce9b58ea23c8d62207cbc604e98ecdc=
0a:
>
>   KVM: arm64: vgic-debug: Avoid dereferencing NULL ITE pointer (2025-05-3=
0 10:24:49 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-fixes-6.16-2
>
> for you to fetch changes up to fad4cf944839da7f5c3376243aa353295c88f588:
>
>   KVM: arm64: selftests: Determine effective counter width in arch_timer_=
edge_cases (2025-06-05 14:28:44 +0100)
>
> ----------------------------------------------------------------
> KVM/arm64 fixes for 6.16, take #2
>
> - Rework of system register accessors for system registers that are
>   directly writen to memory, so that sanitisation of the in-memory
>   value happens at the correct time (after the read, or before the
>   write). For convenience, RMW-style accessors are also provided.
>
> - Multiple fixes for the so-called "arch-timer-edge-cases' selftest,
>   which was always broken.
>
> ----------------------------------------------------------------
> Marc Zyngier (4):
>       KVM: arm64: Add assignment-specific sysreg accessor
>       KVM: arm64: Add RMW specific sysreg accessor
>       KVM: arm64: Don't use __vcpu_sys_reg() to get the address of a sysr=
eg
>       KVM: arm64: Make __vcpu_sys_reg() a pure rvalue operand
>
> Sebastian Ott (4):
>       KVM: arm64: selftests: Fix help text for arch_timer_edge_cases
>       KVM: arm64: selftests: Fix thread migration in arch_timer_edge_case=
s
>       KVM: arm64: selftests: Fix xVAL init in arch_timer_edge_cases
>       KVM: arm64: selftests: Determine effective counter width in arch_ti=
mer_edge_cases
>
>  arch/arm64/include/asm/kvm_host.h                  | 32 ++++++++++--
>  arch/arm64/kvm/arch_timer.c                        | 18 +++----
>  arch/arm64/kvm/debug.c                             |  4 +-
>  arch/arm64/kvm/fpsimd.c                            |  4 +-
>  arch/arm64/kvm/hyp/exception.c                     |  4 +-
>  arch/arm64/kvm/hyp/include/hyp/switch.h            |  4 +-
>  arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h         |  6 +--
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c                 |  4 +-
>  arch/arm64/kvm/hyp/vhe/switch.c                    |  4 +-
>  arch/arm64/kvm/hyp/vhe/sysreg-sr.c                 | 48 ++++++++--------=
-
>  arch/arm64/kvm/nested.c                            |  2 +-
>  arch/arm64/kvm/pmu-emul.c                          | 24 ++++-----
>  arch/arm64/kvm/sys_regs.c                          | 60 +++++++++++-----=
------
>  arch/arm64/kvm/sys_regs.h                          |  4 +-
>  arch/arm64/kvm/vgic/vgic-v3-nested.c               | 10 ++--
>  .../selftests/kvm/arm64/arch_timer_edge_cases.c    | 39 +++++++++-----
>  16 files changed, 151 insertions(+), 116 deletions(-)
>


