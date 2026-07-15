Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A026AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jZxb/DyGzc2Aox27RZLCNs8CB48ahE7uYx1FJS8/x4=; b=lWHVSn1s6oetds4unVa0vsJ4GE
	cu3hOLDG94lYyTghY2dVRTTe0sGSFS5UcMuMxCS+r1hCa/4jt6UepLZLMLZuEAyfco5G6QG6UJZS2
	Y3dapqCPoi8V/sLY4aH+ZPLoiaFBNagnt8099Qww2ZTSb97gS/KBYCjVspBjiqQ+kyhIo503ksa2z
	X0pP167+jpOQX649qwUkD75NayOaH7nAua1Hb9d7/uqT2rQpXy+CsX5gfJtsD8xPOL45Uwbc4g0j7
	+ZKkxdPO6kbsiV2goJSG5ElEx+KLVVrbBFX3r1UoO4fslSVu75/cewI0n63Lyb757DqoMX/8sWAat
	eWXTBgqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwcW-0000000EPf7-0XBP;
	Wed, 15 Jul 2026 10:13:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwcN-0000000EPe2-0spq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 10:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784110410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1jZxb/DyGzc2Aox27RZLCNs8CB48ahE7uYx1FJS8/x4=;
	b=h2LnATXky627HUxuQiN5ZTvRQd+nCrYXbAI2VyfS2ifrkzb1WKuvpz65Bs6oewXdnXHCdv
	FGzX/gWSStfPH5XIfRtmkrU410tfWo2teFITyh9SWhI5cTrEbO0cefzUTeghj4NbmgB0Gx
	3r+AAgwCVV1Yorxd465alE8d/igUmOA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-aaw_Yc3BOi-jif9vvqCzHQ-1; Wed, 15 Jul 2026 06:13:27 -0400
X-MC-Unique: aaw_Yc3BOi-jif9vvqCzHQ-1
X-Mimecast-MFC-AGG-ID: aaw_Yc3BOi-jif9vvqCzHQ_1784110406
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-493b21b1fe8so17301475e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 03:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784110406; x=1784715206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jZxb/DyGzc2Aox27RZLCNs8CB48ahE7uYx1FJS8/x4=;
        b=lBMznrFuMCfP0wG0QMNY5X/pTGzZR84EVdgfiWP+yr1Tr4agl5ajlIj0c7r5tbO/4/
         1Cqlt0GHRE43LTXtB/hp/ivI6r1m7/3FjQh6Kclh3zdJuiI41wE7n5YewlNXC2I78yYg
         F5KGRXVj1ZC7VBkjo2wP6PS9w37twkuuGjMr5jelFE6gPGGlm71PNsbPQU7sz1saFT9w
         xgihp6YqO301FXp4O/Pr5UlE45QPrgj+QEbA8fkio4PcA8iUzelsJ5tk7lAcX11b8+Gl
         wooE8DVO37D7l7pVVbuJ8sQ0RqplZckSm9GxiDl6tvOTSbeIx27D/+hU/t6CIeNCttV3
         wYbg==
X-Forwarded-Encrypted: i=1; AHgh+RoGHrD1TdpgNUHRrpme1BuayWyyvM96EU4ByIHW/8lVOL/IYLbRuhh+0xqYEG5zxixYnDlomMG5vQVLQmEvfbdG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3gHLZbqYDRkO7sr5rEsCdssrzgGUNnggBOd2kg+keXsQ19fJR
	7OuE454UIzWWpq9zT0OLBwgLc9wJbYLe52RX4zGnw/Nt5LZ8z30e8oWcjqJA8BQ+yRHH7s1DXLm
	jDaQyx4wzQ+CtXMcjWEv0SMJKkczIunnp81nWs47KhhDTMrAifkMkJ6z7GHbzYLE3ZbRcZ6MHor
	A1jSTnvERc9MKXlfaqlVy+3qPpiUdBeEl4IoZBv7rYm0g4D8qf8T8=
X-Gm-Gg: AfdE7clPKEfipJfECeC3z16veNqANi7dq7rAzG1LD6JIq5lMi52Yol+imAaUbSQSe3c
	y+z93kgGcmJzdO3bmBnMPF79QlJFHpJ0yJJ457Gp3u60TIrOuRGqhS53sNbAZGJhiahrOjO82Yh
	codwRdPEtFeYlT6tJKAGyR378v+COtjYAX6FbKeWbTsb1BsscvPnfpoyvE6beEU+ahb7Rfytfkv
	JLfQn33WlgNayzGLcjo2XQk0SW3PzLFI9b8id3FxiIVboay2d45ttVi7V9J+StnMKL2/w==
X-Received: by 2002:a05:600c:4e50:b0:495:3f48:5df2 with SMTP id 5b1f17b1804b1-4953f48693emr7640355e9.29.1784110406270;
        Wed, 15 Jul 2026 03:13:26 -0700 (PDT)
X-Received: by 2002:a05:600c:4e50:b0:495:3f48:5df2 with SMTP id
 5b1f17b1804b1-4953f48693emr7639785e9.29.1784110405766; Wed, 15 Jul 2026
 03:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260626133526.817232-1-maz@kernel.org>
In-Reply-To: <20260626133526.817232-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 15 Jul 2026 12:13:10 +0200
X-Gm-Features: AUfX_mxVOlhzpUoKqPqzo5NYFwSGnaFmiBzLMOnOOVrVLohEJlEsW4snDDbir2w
Message-ID: <CABgObfY=eyZ6=hLsJ2mH8=ojthafiOzo5OCrae6W48JD4SxSjQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 7.2, take #1
To: Marc Zyngier <maz@kernel.org>
Cc: Bradley Morgan <include@grrlz.net>, Fuad Tabba <tabba@google.com>, Hyunwoo Kim <imv4bel@gmail.com>, 
	Oliver Upton <oupton@kernel.org>, Weiming Shi <bestswngs@gmail.com>, Will Deacon <will@kernel.org>, 
	Xuanqing Shi <shixuanqing.11@bytedance.com>, Zhong Wang <wangzhong.c0ss4ck@bytedance.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ycZDM4cJaaBfoeezefdki0NY6S03BPmIk2GeZpJ1xWk_1784110406
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_031331_332649_EE7224E6 
X-CRM114-Status: GOOD (  24.48  )
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

On Fri, Jun 26, 2026 at 3:35=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> Paolo,
>
> As predicted, here's another largeish set of fixes for KVM/arm64. A
> bunch of them are fairly benign (the PSTATE.IL stuff), but some are
> pretty annoying (vgic, MOPS) and are stable material.
>
> On the bright side, Fuad has volunteered to be an official reviewer.
> We really need people to engage with the reviewing process instead of
> simply dumping patches on us, as me and Oliver really can't be
> stretched much further. So many thanks Fuad for offering to help.

Indeed, thanks very much!

> I expect to be back next week with a similar delivery, as my Inbox
> keeps filling with this stuff...

Pulled, thanks. Sorry for the delay (though it was known in advance).

Paolo

> Please pull,
>
>         M.
>
> The following changes since commit 1ee27dacbe5dc4def481794d899d67b0d45700=
94:
>
>   Merge branch kvm-arm64/nv-mmu-7.2 into kvmarm-master/next (2026-06-12 0=
9:29:34 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-fixes-7.2-1
>
> for you to fetch changes up to d098bb75d14fde2f12155f1a95ec0168160867ce:
>
>   KVM: arm64: account pKVM reclaim against the VM mm (2026-06-22 10:48:08=
 +0100)
>
> ----------------------------------------------------------------
> KVM/arm64 fixes for 7.2, take #1
>
> - Fix an accounting buglet when reclaiming pages from a protected
>   guest
>
> - Fix a bunch of architectural compliance issues when injecting a
>   synthesised exception, most of which were missing the PSTATE.IL bit
>   indicating a 32bit-wide instruction
>
> - Another set of fixes addressing issues with translation of VNCR_EL2,
>   including corner cases where the guest point that register at a RO
>   page...
>
> - Don't warn when trapping accesses to ZCR_EL2 from an L2 guest, as
>   that's not unexpected at all
>
> - Address a bunch of races with LPI migration vs LPIs being disabled
>
> - Fix a total howler of a bug combining FEAT_MOPS and NV, resulting in
>   exception returning in the wrong place...
>
> - Coerce Fuad Tabba into a reviewer role, and may his Inbox catch
>   fire!
>
> ----------------------------------------------------------------
> Bradley Morgan (1):
>       KVM: arm64: account pKVM reclaim against the VM mm
>
> Fuad Tabba (11):
>       KVM: arm64: nv: Write ESR_EL2 for injected nested SError exceptions
>       KVM: arm64: Sync SPSR_EL1 when injecting an exception into a pVM
>       KVM: arm64: nv: Fix PSTATE construction on illegal exception return
>       KVM: arm64: Add Fuad Tabba as a reviewer
>       KVM: arm64: Set ESR_ELx.IL for injected undefined exceptions at EL2
>       KVM: arm64: Unconditionally set IL for injected undefined exception=
s
>       KVM: arm64: Unconditionally set IL for injected abort exceptions
>       KVM: arm64: Set IL for injected FPAC exceptions during ERET emulati=
on
>       KVM: arm64: Set IL for emulated SError injection
>       KVM: arm64: Set IL for nested SError injection
>       KVM: arm64: Set IL in fake ESR for pKVM memory sharing exit
>
> Hyunwoo Kim (1):
>       KVM: arm64: vgic: Check the interrupt is still ours before migratin=
g it
>
> Marc Zyngier (1):
>       KVM: arm64: vgic: Handle race between interrupt affinity change and=
 LPI disabling
>
> Oliver Upton (6):
>       KVM: arm64: nv: Drop bogus WARN for write to ZCR_EL2
>       KVM: arm64: nv: Respect read-only PFN when mapping L1 VNCR
>       KVM: arm64: nv: Inject SEA if kvm_translate_vncr() can't resolve PF=
N
>       KVM: arm64: nv: Re-translate VNCR before injecting abort
>       KVM: arm64: nv: Inject SEA if guest VNCR isn't normal memory
>       KVM: arm64: nv: Mark VM as bugged for unexpected VNCR abort
>
> Weiming Shi (1):
>       KVM: arm64: nv: Fix SPSR_EL2 restore in kvm_hyp_handle_mops()
>
>  MAINTAINERS                             |   1 +
>  arch/arm64/include/asm/kvm_nested.h     |   8 ++
>  arch/arm64/kvm/at.c                     |   8 --
>  arch/arm64/kvm/emulate-nested.c         |  37 +++++--
>  arch/arm64/kvm/hyp/include/hyp/switch.h |  11 ++-
>  arch/arm64/kvm/hyp/nvhe/pkvm.c          |   3 +-
>  arch/arm64/kvm/hyp/nvhe/sys_regs.c      |   3 +-
>  arch/arm64/kvm/inject_fault.c           |  18 +---
>  arch/arm64/kvm/nested.c                 | 164 ++++++++++++++++----------=
------
>  arch/arm64/kvm/pkvm.c                   |   2 +-
>  arch/arm64/kvm/vgic/vgic.c              |  20 ++--
>  11 files changed, 149 insertions(+), 126 deletions(-)
>


