Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10645CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 21:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCaf028xC5s+DMoM0w5jJSQ23tua+iloa6oIupqhPqU=; b=drBRqQTw86E/Fq/i0/k5gI+6Xn
	g41GBBXSfMpibX12Ka6VqYbJowvZMQ41B7Lxch7+CyWKLrBnqFhUeTrwPK3cr4rzz++UaL/Bvl6aV
	C1Cq2/8t3fX9Fud1kbrd1TMsGGqHV0ePK90Nav3YAJNvRgpd/22NucArLDwdnh1WHrzbgmdG6NYeQ
	KuvlOyqOqm4L4ZhVN8CEMNHB0rJvtscDPk9HWYNFJioP1DF1Fz/Z2XMnpZWbTTabioTN61UwFJcF3
	zvFbF3U0yWiFqWqCkwrtJzfDWyL5feUaBlUUm+AvYKGpshRhC3mp7WOlK1gv46uf/u+6iAXrfkpjw
	WbRjd9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMuRq-00000000SdW-30a3;
	Tue, 12 May 2026 21:15:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMuRn-00000000Sd3-47l9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 21:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778620523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BCaf028xC5s+DMoM0w5jJSQ23tua+iloa6oIupqhPqU=;
	b=hpxCoFH+VUn836kGtNlaF92zqWkqCSVpLfCcwbsof7pWakfZUPnNz8WoffJ8ha5HYPUWwt
	HR0sqrfMGXwh4y49HW/O5pgrvVJAM4ZuJqOhMvfPJGX3OBSjxZdmggPzjNPpCk/uHSDAvq
	R1jLYevC9fwD0kv5swoKgc0SHCu5VCk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-krxYCjLLNZGef_v_RZVJmQ-1; Tue, 12 May 2026 17:15:18 -0400
X-MC-Unique: krxYCjLLNZGef_v_RZVJmQ-1
X-Mimecast-MFC-AGG-ID: krxYCjLLNZGef_v_RZVJmQ_1778620517
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-488c2aa6becso48469505e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 14:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778620517; x=1779225317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BCaf028xC5s+DMoM0w5jJSQ23tua+iloa6oIupqhPqU=;
        b=n00FikADqPakqzWHioBOe6G/8Xfk1L/Y4Fym2r7vSiWYUYc5Wbhqp+miuD5YpdefB7
         2UqmsEKAXnUiGKt9SsfO43Ff6LSKnoVB6ovVwNp+vgs2KTjJRPOH6SAUCn1oyZPb4h7y
         ueZCE7srAOnct4D7Tx5zTy0uJVb6Sx0r293iPTC3jFiEq9uZIh8zx0Gi/UrCuAezSctR
         FE+1sxBinaTIilMlqxKkl+zAhtWxJbEiYYEM1lo/eKQBxkBM3AiST0qI6QlM4RnW3YhQ
         4ilvU0OpKL6dFhZBnOueKi3j7VwOlSVsCgFmcOWiKNmrbqPHtWWn3pHsWQ8IeT/2/3/R
         jvww==
X-Forwarded-Encrypted: i=1; AFNElJ+GglCcf2qAgWSMPSJ68U7+ra4wWgIt/NB0OExaDHcSUPWjMQtyXPRtz8jvpIrzszp7Y+UEid7mpn9iPAokctBu@lists.infradead.org
X-Gm-Message-State: AOJu0YyZQ6UhPx+o8p1Kw2R4o/rFnTQdD5uVsGbxeiqArx8naK6IOEkJ
	0VeIK5ObWjnmb5pEX0wDgziAO84rNh5N423LRuNhWvfpfEfTCHlyQFQdsZaM8m2OdhjhE3IuQnq
	YymdPWoUwjnhhTZUJDGh7dmr230putNG29nKvTU47siLzx5xzncdJMyE0hJpz+I0voOLUUr+C+e
	B+rpKNk/MkLG4DcMoxYAB3xPH/t8vZ/lvgw1Uqt/QIJ/Kzm6XVio0=
X-Gm-Gg: Acq92OESgtJbnhoidfBJwaIt4RirBPE2XtJr3RCta9OzHURbSd8Z4a33RSCosq6ISrJ
	9YanTM5dlI44wtgfSeeLjugxxr0zm2uqU/GH0WV3E6rMqlbEH33x4YcaiA6j2EtVl77aLSALlmc
	9Z32grqJNZIPLHCiSbXkXIXPeOG6kVI0fBbhANwIrQSq+w5k4/udxyGn0iXhPUtxjVcS7nxf2KJ
	Clfxr4l1Dv4fP+DvIXsq7ik2Q2atAkiZHA8/NyBv2SZi3y5s2XIxiZkkFN0yIdW2ek2j3IkRNVd
	GTUhJu8O
X-Received: by 2002:a05:600c:19c9:b0:489:1a63:509c with SMTP id 5b1f17b1804b1-48fc999e736mr7208155e9.0.1778620517223;
        Tue, 12 May 2026 14:15:17 -0700 (PDT)
X-Received: by 2002:a05:600c:19c9:b0:489:1a63:509c with SMTP id
 5b1f17b1804b1-48fc999e736mr7207685e9.0.1778620516761; Tue, 12 May 2026
 14:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260507154221.2905554-1-maz@kernel.org>
In-Reply-To: <20260507154221.2905554-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 12 May 2026 23:15:04 +0200
X-Gm-Features: AVHnY4KtwnsJxjKodfXT2l49vyk4PWU8NRQcHeq925qaoxrCk6J9wCnG0t9SADY
Message-ID: <CABgObfY+qCh3_j+ykf_5aU_FwWAKjnauby_AjXndkTAROKpFeQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 7.1, take #2
To: Marc Zyngier <maz@kernel.org>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Fuad Tabba <tabba@google.com>, James Morse <james.morse@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mostafa Saleh <smostafa@google.com>, Oliver Upton <oupton@kernel.org>, 
	Sebastian Ott <sebott@redhat.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>, 
	Yuan Yao <yaoyuan@linux.alibaba.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9qtfFvHYPQm3VoNrkj6YF3fknmxPFOXOjYlKXWIxpkU_1778620517
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_141524_091866_71CCB9F9 
X-CRM114-Status: GOOD (  26.62  )
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

On Thu, May 7, 2026 at 5:42=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote:
>
> Paolo,
>
> Here's the second set of KVM/arm64 fixes for 7.1. Nothing too horrible
> this time, aside from an ARM erratum workaround that has little impact
> on KVM, but relies on some firmware dealing with the problem. Bleh.
>
> The rest is a small collection of bug fixes, mostly affecting the MMU
> (permission fault handling with guest_memfd, 52bit VA with NV), and a
> small set of AI-enhanced fixes from Fuad. I guess I'll have to get
> used to that.
>
> And last but not least, Steffen joins the merry band of KVM/arm64
> reviewers in preparation of s390 and arm64 being joined at the hip...
>
> Please pull,

Done, thanks.

Paolo

>
>         M.
>
> The following changes since commit 7fd2df204f342fc17d1a0bfcd474b24232fb0f=
32:
>
>   Linux 7.1-rc2 (2026-05-03 14:21:25 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git kvmarm-=
fixes-7.1-2
>
> for you to fetch changes up to effc0a39b8e0f30670fe24f51e44329d4324e566:
>
>   KVM: arm64: Pre-check vcpu memcache for host->guest donate (2026-05-07 =
14:12:42 +0100)
>
> ----------------------------------------------------------------
> KVM/arm64 fixes for 7.1, take #2
>
> - Add the pKVM side of the workaround for ARM's erratum 4193714, provided
>   that the EL3 firmware does its part of the job. KVM will refuse to
>   initialise otherwise.
>
> - Correctly handle 52bit VAs for guest EL2 stage-1 translations when
>   running under NV with E2H=3D=3D0.
>
> - Correctly deal with permission faults in guest_memfd memslots.
>
> - Fix the steal-time selftest after the infrastructure was reworked.
>
> - Make sure the host cannot pass a non-sensical clock update to the
>   EL2 tracing infrastructure.
>
> - Appoint Steffen Eiden as a reviewer in anticipation of the KVM/s390
>   ability to run arm64 guests, which will inevitably lead to arm64
>   code being directly used on s390.
>
> - Make sure that EL2 is configured with both exception entry and exit
>   being Context Synchronization Events.
>
> - Handle the current vcpu being NULL on EL2 panic.
>
> - Fix the selftest_vcpu memcache being empty at the point of donation or
>   sharing.
>
> - Check that the memcache has enough capacity before engaging on the
>   share/donate path.
>
> - Fix __deactivate_fgt() to use its parameter rather than a variable
>   in the macro context.
>
> ----------------------------------------------------------------
> Alexandru Elisei (1):
>       KVM: arm64: Handle permission faults with guest_memfd
>
> Fuad Tabba (6):
>       KVM: arm64: Make EL2 exception entry and exit context-synchronizati=
on events
>       KVM: arm64: Guard against NULL vcpu on VHE hyp panic path
>       KVM: arm64: Fix __deactivate_fgt macro parameter typo
>       KVM: arm64: Seed pkvm_ownership_selftest vcpu memcache
>       KVM: arm64: Pre-check vcpu memcache for host->guest share
>       KVM: arm64: Pre-check vcpu memcache for host->guest donate
>
> James Morse (1):
>       KVM: arm64: Work around C1-Pro erratum 4193714 for protected guests
>
> Mostafa Saleh (1):
>       KVM: arm64: Remove potential UB on nvhe tracing clock update
>
> Sebastian Ott (1):
>       KVM: selftests: arm64: Fix steal_time test after UAPI refactoring
>
> Steffen Eiden (1):
>       MAINTAINERS: Add Steffen as reviewer for KVM/arm64
>
> Wei-Lin Chang (1):
>       KVM: arm64: nv: Consider the DS bit when translating TCR_EL2
>
>  MAINTAINERS                              |  1 +
>  arch/arm64/include/asm/kvm_nested.h      |  1 +
>  arch/arm64/include/asm/sysreg.h          |  2 +-
>  arch/arm64/kvm/arm.c                     | 21 ++++++++++++++
>  arch/arm64/kvm/hyp/include/hyp/switch.h  |  2 +-
>  arch/arm64/kvm/hyp/nvhe/clock.c          |  3 ++
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c    | 47 ++++++++++++++++++++++++++=
+++++-
>  arch/arm64/kvm/hyp/nvhe/pkvm.c           | 16 ++++++++++-
>  arch/arm64/kvm/hyp/vhe/switch.c          |  3 +-
>  arch/arm64/kvm/mmu.c                     | 29 ++++++++++++++------
>  include/linux/arm-smccc.h                |  6 ++++
>  tools/testing/selftests/kvm/steal_time.c |  2 ++
>  12 files changed, 120 insertions(+), 13 deletions(-)
>


