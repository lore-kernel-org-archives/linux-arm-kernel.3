Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334481125858
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 17:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/YbJZ5mStPYPfrX4lrd1txozK+dMfvbgcpYGh/3eQE=; b=v6FWEL8TL2YyTBUO9WemeI37MK
	m3I9iJ59/+9DYqNYGh82jHJcOK8sWAmuty2gVplgJbpsXFjezLRoZyIGH1tUTBeHPcbZbETGvcCub
	Xc4sp5P/T2s7CHh/hovRXAWMx6EsprvNdy/NAHsihBfRVDU9S6KPoJkK/hpIqVUlPKFna+pXFS5as
	4T0d75ufkmsCYhtIZRE/NdJFz3XvH8Gp4LzQiI21UMAtsgf/4GJSaWY4h5oQUhZqFn/CrPbwSBMPM
	3REqVrFirxQRvYpTYNj1/H441YQQy3BJuU6DvzWUMESvalbnylafu2v7q5KX6beeuyD7wOY7MHYVw
	tZht3OQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0NZs-0000000C3ru-1kOY;
	Wed, 11 Mar 2026 17:42:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0NZp-0000000C3r6-3T9u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 17:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773250952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F/YbJZ5mStPYPfrX4lrd1txozK+dMfvbgcpYGh/3eQE=;
	b=X1H2wLFtmXeS9MU/QkLx7VGrdAhpf+3u2/hsixg99bf34UkJDIyaa/Ux1mC8JGVdJesqdt
	lYKl1SzwcrlvNZnwY/gry+ScnKCZ8wXeRcbXe2fD2R1bLflgt15rB21gd9NWzaDTWlo9GR
	jU8BzoBCssUu7DibR39snqvYMCsFIwY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-RDh_8vv4PPOQGjOh8yvmOQ-1; Wed, 11 Mar 2026 13:42:31 -0400
X-MC-Unique: RDh_8vv4PPOQGjOh8yvmOQ-1
X-Mimecast-MFC-AGG-ID: RDh_8vv4PPOQGjOh8yvmOQ_1773250950
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-439bcec86dfso144700f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 10:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773250949; x=1773855749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F/YbJZ5mStPYPfrX4lrd1txozK+dMfvbgcpYGh/3eQE=;
        b=g8Ax6ahHHXZXXrZ9JH/b+i4ITWFYM/Pkih5xH+dbR78jtMTtV/5feZQpPVlkz1nKGb
         dIcfSJs6SWayyMJ+m1nt3EB5gyPD3CMEL13nCQ+WrwGKyDfji+CCocrNXwzF2na3xkZY
         RveEVQD8EksenUWBAkQiPATOiir2aGhtw+C7Jhs5EoNM0hy6ZNxokSqpLtW5zbAr4L5J
         1REjtUvCoZogoMXRqFIT+UgdPao+/eSjKrfZHw3hsFIwDLPADJ3+y7ppHaqZ+TZ5r5Va
         L/SfgA3QRS2deTPFwe0B544grxnT73tXsXrUqiSnduvqC4xaYgeJIYlIB7ErHLsgqTTz
         Mi2A==
X-Forwarded-Encrypted: i=1; AJvYcCX26cdvkCKbTEK19vpUwLNKCAYZrGvhNPO3G1Fo6rSCUKpt9oI7Ej2n23YZ9SuDmRMqNGk1aU6gFO+9w/Zd4j41@lists.infradead.org
X-Gm-Message-State: AOJu0YzSDYSFCJ9Fqe6DVZI/5ZAVXRb1r7/VqlLzIFwxdohvPKREaujw
	YoKAuNAc2QRGdCJp+isbOhMdcpKQjdn2SLc71758GN7OwtObeP03RP/Cfgz8r1tuvl7srCzzpMU
	7s4O+poyFdjOfpjGBTjr78o0X7J+ZdCBSk2Q2jzioe2pvaKG4Ido58G9nXn8ASqkIoMnnF4quJV
	snBR8ixjw4TQaIQf6PfzgaQl8WKEQkX8Wun3zajbVMs2JlXGkaIV4qRFlZtVk=
X-Gm-Gg: ATEYQzwPw5XXwWJXW8HTNcvCyM3djYGYp+a9ZKzay9qtEcabfhBuEx9YGW6ZaCepFo3
	eXHN1LUBe274aA6daWxjXK1E6a43v5Brl0NdbsnpkHlJeCEszTa5Sdtj4qSPCNJ+2+MDCzEaN4w
	GJyDbsMzOjGb5hHkkVSHNQQIK8kTuaBxoKu288DG6vtsWOpkfNMqIiIeqZjgyA38O4bppwMdQR+
	PKmmavMcF3iaEV36T1gOXBwk8+O83NwZwSt0EemQtVRfmzWpEShCXhQiWcVmsv1kIZtX5+1CqCh
	bfIDLSw=
X-Received: by 2002:adf:f745:0:b0:439:fdd5:10b5 with SMTP id ffacd0b85a97d-439fdd510eemr1093021f8f.39.1773250948587;
        Wed, 11 Mar 2026 10:42:28 -0700 (PDT)
X-Received: by 2002:adf:f745:0:b0:439:fdd5:10b5 with SMTP id
 ffacd0b85a97d-439fdd510eemr1092976f8f.39.1773250948152; Wed, 11 Mar 2026
 10:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260311173902.329537-1-maz@kernel.org>
In-Reply-To: <20260311173902.329537-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 11 Mar 2026 18:42:11 +0100
X-Gm-Features: AaiRm53T5yAtX5ypUWcyuTtUjMCgSXyDtjqh-7JRGZz496zaXdK-3JoiKSNnA38
Message-ID: <CABgObfbQrLf_UJHU58vmAOZx=FgbM3TVhvqq-FEabeaain1XXg@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 7.0, take #3
To: Marc Zyngier <maz@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Valentine Burley <valentine.burley@collabora.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _MNEJwS-C177Zkwvr-H8CEZTv4jQ_hkTExsAYXJF3BM_1773250950
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_104233_935003_7B0C3C18 
X-CRM114-Status: GOOD (  20.98  )
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

On Wed, Mar 11, 2026 at 6:39=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> Paolo,
>
> Here's the third set of fixes for 7.0. Two fixes, both related to the
> pretty large vgic rewrite that went into 6.19. One is affecting
> interrupt deactivation, and therefore leading to guests locking
> up. The other is affecting CPU hotplug with pKVM, leading to the
> onlined CPU not booting at all.
>
> Please pull,

Done, thanks.

Paolo

>
>         M.
>
> Marc Zyngier (2):
>   KVM: arm64: vgic: Pick EOIcount deactivations from AP-list tail
>   KVM: arm64: pkvm: Don't reprobe for ICH_VTR_EL2.TDS on CPU hotplug
>
>  arch/arm64/include/asm/kvm_host.h |  3 +++
>  arch/arm64/kernel/cpufeature.c    |  9 +++++++++
>  arch/arm64/kvm/vgic/vgic-v2.c     |  4 ++--
>  arch/arm64/kvm/vgic/vgic-v3.c     | 12 ++++++------
>  arch/arm64/kvm/vgic/vgic.c        |  6 ++++++
>  5 files changed, 26 insertions(+), 8 deletions(-)
>
> --
> 2.47.3
>
> The following changes since commit 3599c714c08c324f0fcfa392bfb857c92c5754=
00:
>
>   KVM: arm64: Remove the redundant ISB in __kvm_at_s1e2() (2026-03-06 10:=
42:21 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-fixes-7.0-3
>
> for you to fetch changes up to a79f7b4aeb8e7562cd6dbf9c223e2c2a04b1a85f:
>
>   KVM: arm64: pkvm: Don't reprobe for ICH_VTR_EL2.TDS on CPU hotplug (202=
6-03-10 09:48:45 +0000)
>
> ----------------------------------------------------------------
> KVM/arm64 fixes for 7.0, take #3
>
> - Correctly handle deeactivation of out-of-LRs interrupts by
>   starting the EOIcount deactivation walk *after* the last irq
>   that made it into an LR. This avoids deactivating irqs that
>   are in the LRs and that the vcpu hasn't deactivated yet.
>
> - Avoid calling into the stubs to probe for ICH_VTR_EL2.TDS when
>   pKVM is already enabled -- not only thhis isn't possible (pKVM
>   will reject the call), but it is also useless: this can only
>   happen for a CPU that has already booted once, and the capability
>   will not change.
>
> ----------------------------------------------------------------
> Marc Zyngier (2):
>       KVM: arm64: vgic: Pick EOIcount deactivations from AP-list tail
>       KVM: arm64: pkvm: Don't reprobe for ICH_VTR_EL2.TDS on CPU hotplug
>
>  arch/arm64/include/asm/kvm_host.h |  3 +++
>  arch/arm64/kernel/cpufeature.c    |  9 +++++++++
>  arch/arm64/kvm/vgic/vgic-v2.c     |  4 ++--
>  arch/arm64/kvm/vgic/vgic-v3.c     | 12 ++++++------
>  arch/arm64/kvm/vgic/vgic.c        |  6 ++++++
>  5 files changed, 26 insertions(+), 8 deletions(-)
>


