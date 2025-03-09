Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE02C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 08:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6D4nNiDsoCmfkR08WaPZur5Udci4/JXP8lfXTACJmTY=; b=szS5hvyRCN47ok31eU7hSZIBK+
	y1uiZBx8dArvNc+ganLhChSlVs8qLjgSiM6u9/FjVeupoI10qgf8k2ohqfKLHhWH//UAO5G5VO3fb
	rVIRyUhiNBS1eSQD/B/YAW/v2kRjZBwNZ0dgkQdBisXOLiHkXCaORVrpf8LNmg4/CcMypSruT+Eea
	rc5Ue7SwhhWbLDj7fxJu6VrrK8kLqJMfVFP+HyWg25sipxp+W7QWASEycuWz3LgO6OGlHsjnMtfkb
	iHOjp1PwiFeYb3qXe6DoJqOT/3aXuNBj3DhWxKoE7t8/ZdX3tCEVCjunIjtJn32AkjbWEgfknbBcF
	2QKHoPLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trBmh-0000000096T-1qc2;
	Sun, 09 Mar 2025 08:13:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trBl3-0000000090E-3Suf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 08:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741507895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6D4nNiDsoCmfkR08WaPZur5Udci4/JXP8lfXTACJmTY=;
	b=LffluGPgiEsuCkwlWBxdhXUTNeZdr5D+hTpolf9mtyDeEN+ZlWTM5iubQYSFNbi+9YQ4MR
	JSxgmosRxUt2we/ARq20FYGB7U+ya7lL93O1qPD8geQBASKze+OftHyd/Wr4Nt+Eli4Fys
	70fvrPpa9v6vXT+d3gZmHSh/aQA/PMY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-yYQIdv2fPjGGGWG7jPcg_g-1; Sun, 09 Mar 2025 04:11:33 -0400
X-MC-Unique: yYQIdv2fPjGGGWG7jPcg_g-1
X-Mimecast-MFC-AGG-ID: yYQIdv2fPjGGGWG7jPcg_g_1741507893
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3913f546dfbso489544f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 00:11:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741507893; x=1742112693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6D4nNiDsoCmfkR08WaPZur5Udci4/JXP8lfXTACJmTY=;
        b=WVm2lrY2A72X3d5NjnkSM0OvQ/9BnNywhSA7mg4XfSJw0bdbeS3ftJIUY2JACxwt1m
         FRUW4rGIa3fqtEOnl/a0iFryq5kuQQROQv/bm3VlcGNvMmwVnChLqFQaXHtttZoD3UDQ
         ITAnwvJyHFxoTJZRzPN0UYl2zGfQ356Xq3VOvT0w/DumJcL2TAy+uYFUv/MR6zIqnMB0
         FMT1DQDmv+d24QMELT0V1J1Ya0hlyQnlURQ58TkXD61zXPVADmBJnBvjKID1nD3APOzp
         IVHZuXmzhQ/xkpuOhKlRKPEtkc6wTw7fQYN5hHyfXzBqO2MisLE+fZg5S+/Bk2yZIfw5
         Pobw==
X-Forwarded-Encrypted: i=1; AJvYcCVLjrLucGfrtFOopw2bFGXnI/hkwLZwwMOfYaAXXgnWSpzbrj2Fk6H4SbD3Az9ctC7ClkOZMGMpYze34XEkksM0@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj1HQeVgjeFwaWYlR4l0hJCoI0Mo3xaZ3Raje7hAyKSF68qdxy
	sgaJVqrshtGVHtlZpZeuN5K10ym6VXd9fuRjOIntVlECFBYnn/8OUN+yBWajXIfHteyRWIorvM3
	x6aJXpIvoNYw7U6dYHxZNdo0jTHEbXcQuGsBFEooR3e0F1YbjaQ67YaQZXk7V3WgD6Z8CEHKt/5
	kyBGIt+x1/Ox+amnutGM5spclNGalcqOA6M89M8OK+9PgV5kI=
X-Gm-Gg: ASbGncv1zub9V6VKEplPvUA+CbW43rnR21QkfMwaOBPyagJpux+stR2lfIjFx61TlRJ
	LVEi+4elZGXr7LS16ckbAwfwgStGnbjpXL7DbRB4JTotM+y9WvP9RlP6IuMSgqIhJueFI/DFX6g
	==
X-Received: by 2002:a5d:64c7:0:b0:391:11b:c7e9 with SMTP id ffacd0b85a97d-39132d6011emr7166821f8f.28.1741507891075;
        Sun, 09 Mar 2025 00:11:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiBPbgntPWPglpyH3yVJe7DtL/SqQ3tkdVqB05cSWbb15hmPwKqmctjqE5FygFtKO8OhuBCU8t4eAyP8z/ofw=
X-Received: by 2002:a5d:64c7:0:b0:391:11b:c7e9 with SMTP id
 ffacd0b85a97d-39132d6011emr7166753f8f.28.1741507889227; Sun, 09 Mar 2025
 00:11:29 -0800 (PST)
MIME-Version: 1.0
References: <20250307161824.2373079-1-maz@kernel.org>
In-Reply-To: <20250307161824.2373079-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 9 Mar 2025 09:11:13 +0100
X-Gm-Features: AQ5f1JrP7IQ8OrSLUcslcCFYIM4kkq22dH0_bEGdv3OXLIuy8ZkTPSuW1cy68r8
Message-ID: <CABgObfaZQsPLvyYsuFzYJOwgEaJ40=yZ+TS29Lt_xZyT9oSKpg@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 6.14, take #4
To: Marc Zyngier <maz@kernel.org>
Cc: Ahmed Genidi <ahmed.genidi@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Leo Yan <leo.yan@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qw3hs8OzBdbeH4eOQXA2IU2j-6LAA4QA8cW0e5VyXoo_1741507893
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_001137_936163_B0F022FF 
X-CRM114-Status: GOOD (  17.92  )
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

On Fri, Mar 7, 2025 at 5:18=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote:
>
> Paolo,
>
> Here's what I hope to be the last set of 6.14 fixes for
> KVM/arm64. This time, two patches addressing the two side of the same
> bug, where pKVM's PSCI relay wasn't correctly setting up the CPUs when
> in the hVHE mode. Thanks to Ahmed and Mark for fixing it.
>
> Please pull,

Done, thanks.

Paolo

>         M.
>
> The following changes since commit fa808ed4e199ed17d878eb75b110bda30dd524=
34:
>
>   KVM: arm64: Ensure a VMID is allocated before programming VTTBR_EL2 (20=
25-02-20 16:29:28 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-fixes-6.14-4
>
> for you to fetch changes up to 3855a7b91d42ebf3513b7ccffc44807274978b3d:
>
>   KVM: arm64: Initialize SCTLR_EL1 in __kvm_hyp_init_cpu() (2025-03-02 08=
:36:52 +0000)
>
> ----------------------------------------------------------------
> KVM/arm64 fixes for 6.14, take #4
>
> - Fix a couple of bugs affecting pKVM's PSCI relay implementation
>   when running in the hVHE mode, resulting in the host being entered
>   with the MMU in an unknown state, and EL2 being in the wrong mode.
>
> ----------------------------------------------------------------
> Ahmed Genidi (1):
>       KVM: arm64: Initialize SCTLR_EL1 in __kvm_hyp_init_cpu()
>
> Mark Rutland (1):
>       KVM: arm64: Initialize HCR_EL2.E2H early
>
>  arch/arm64/include/asm/el2_setup.h   | 31 ++++++++++++++++++++++++++----=
-
>  arch/arm64/kernel/head.S             | 22 +++-------------------
>  arch/arm64/kvm/hyp/nvhe/hyp-init.S   | 10 +++++++---
>  arch/arm64/kvm/hyp/nvhe/psci-relay.c |  3 +++
>  4 files changed, 39 insertions(+), 27 deletions(-)
>


