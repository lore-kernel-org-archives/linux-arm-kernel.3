Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AFCCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 07:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m82cK3xRCUvbcWhZbxs+7WqSqZtr7xd6qiGXFqz/RDg=; b=FlmWRzWKUKEunAVeEjDTcR8F9P
	piQElyAFxk9vmkZvonxkhG5mwx87BgxtBuXagD6anpKCO3ZwXkTZjSHrQTeUyqJORfVF8hYJguQHa
	ajRwofgzo6ThKzjLo8KY65RNS3u3nlkGX6U8JjHDlWSe9a3Mad04xLTFlv3YQa+aDH5Z/fCXqccLw
	b/wI5AOOsJDhKmPXEPOBBm3y+IHgVdeJLSLJ3bm/tXA9sI1lCN1memHooHt0RuS2VLa495Vwx/cMI
	vIbwcld7pkKfv4T1RIxhuQc6xwTlYDr+GPkravIhj1to71ToqQrh16pqVtDvPWuNqG3I8oouv8qEf
	StK6SPvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHzbL-00000003pqu-07Zy;
	Sun, 09 Nov 2025 07:12:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHzbI-00000003pqW-0XFo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 07:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762672354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m82cK3xRCUvbcWhZbxs+7WqSqZtr7xd6qiGXFqz/RDg=;
	b=dQQWJMin8BoFu9Iz8/O4zl1ZszWz+I8apNdzENFNDj7qX5t0VHWqOPQ8pP0HxUa+joPUug
	vx0Lg8RDN77MNIGfeJZY+iL1duaYfkXlLrJWNftgEOs7Iu4jT1P79gWspBRDMNuLWqulsW
	4dTC9pSVlen1tERg2zYRJt2907IPrZc=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-lBtMYWOgPEG7-iVnOl7pXg-1; Sun, 09 Nov 2025 02:12:32 -0500
X-MC-Unique: lBtMYWOgPEG7-iVnOl7pXg-1
X-Mimecast-MFC-AGG-ID: lBtMYWOgPEG7-iVnOl7pXg_1762672352
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297e66542afso25185935ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 23:12:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762672351; x=1763277151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m82cK3xRCUvbcWhZbxs+7WqSqZtr7xd6qiGXFqz/RDg=;
        b=u3Hv/n9qDeeDrC5cozs+vc8OqoeTwl5hVAfbKGE+cqQ6w2AYlcWDIat+GwRim6IIgg
         J8IhgyAslGxTJ6qn+0PUTjIUOQF3evVj3mygaB4z+AlVffNUokbZTrtk6b5Un6d5zP6h
         yYH3QGTInGynUXp+8QCjn3X9dhG7/9cAPDAAZIIZtQzfKtXy2q2QjkGsEA4FWP82cf7H
         e3mluzQBhaM2UG7zAKn20vahL+awMvdjzcToSHior77cj4oxRn9E518A566bX83+N55s
         DUk5GzfaXNcMCnkbHtrUyIZtYP/wX2f+b58ntZsSnPxzo71TGcIhwpAGcpnrU2kVpVFV
         50kw==
X-Forwarded-Encrypted: i=1; AJvYcCXcXSHIUjCFGXU34XR8yjfv1HoVG3VHMTde9KTYFJO1ZHffQDpIMylFYLB8zVXhiiydzH+ENwWpTN6z5QkpeBtP@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj9f3/JqjZJExycpA6iBaeoWF47+iSQ8l7JbtC5IWS99AZqb7P
	N8kjehwCqdRwtNLrxMzfRsdCC/G4G0UvSerfZj77fGZdyFmSwXCeIknuoweM562EwXKfh6pMAUH
	qF7YzovlapaUx8z3jY5k0zxMzNwUvwn56T+l8/tl3x7iPAnjxvOAfYA9Uz9/zUPLokM9/RbX78o
	1vyxeo4lvIcTENYIzvVsGEuK46VV+c9G397g8NvnoT3WUdHLWofNc=
X-Gm-Gg: ASbGncvWpeqVP1LNWq1iFiQ6+vkabJxCtIT69OnKI+btRK20N8JCRy9jagcPHtSZ3gv
	ZyclrWffh7CWjWiEEtxJKqQwOUMFS0KC0vVDGuBufKXDQlu3dou3sai3rHfBhnxrTut5RvtCmS6
	Kd4DwrSxo2oIGq1g8hjpyo+GISORhQniz1bFH7TOseEI3W2V9BC85MH5i5kEYctcSM9tiHoRV51
	PiSm9Kfno8fMEPmLFtKZTx7EZRCDZNzW3UwkptzXZ/dwMnX5Nl4pDArMBCk
X-Received: by 2002:a17:902:e78f:b0:295:68df:da34 with SMTP id d9443c01a7336-297e5718086mr51623645ad.53.1762672351606;
        Sat, 08 Nov 2025 23:12:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmxSGLvw4pgRZ8aTw3qCykYC8xSzISK8rwIn1R2Gkp0ELn8flQDD1U9o+r1UzqIM5FPkf2ioy3/4F0I7hTmD4=
X-Received: by 2002:a17:902:e78f:b0:295:68df:da34 with SMTP id
 d9443c01a7336-297e5718086mr51623375ad.53.1762672351274; Sat, 08 Nov 2025
 23:12:31 -0800 (PST)
MIME-Version: 1.0
References: <20251108120559.1201561-1-maz@kernel.org>
In-Reply-To: <20251108120559.1201561-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 9 Nov 2025 08:12:17 +0100
X-Gm-Features: AWmQ_bkaJ1JaU0aGn42MK0o7nRRGD7HuTETuGXjvrbkmq0cZ5a-Jnj8bQX-Px3w
Message-ID: <CABgObfa2ShbRn-MctT7-y4joG85AgtjgKXM=OJA9_2FbDZ6XPQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 6.18, take #2
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Maximilian Dittgen <mdittgen@amazon.de>, 
	Oliver Upton <oupton@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Sascha Bischoff <sascha.bischoff@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	Sebastian Ott <sebott@redhat.com>, stable@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>, Will Deacon <will@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WgXq3m9-i3oQAZsCBpAgfeSuYLzClnti5JZ-Wc3bYFc_1762672352
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_231236_243528_03DFED31 
X-CRM114-Status: GOOD (  18.41  )
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

On Sat, Nov 8, 2025 at 1:06=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote:
>
> Paolo,
>
> Much later than expected, but here's the second set of fixes KVM/arm64
> for 6.18. The core changes are mostly fixes for a bunch of recent
> regressions, plus a couple that address the way pKVM deals with
> untrusted data. The rest address a couple of selftests, and Oliver's
> new email address.

Pulled, thanks.

Paolo

>
> Please pull,
>
>         M.
>
> The following changes since commit ca88ecdce5f51874a7c151809bd2c936ee0d38=
05:
>
>   arm64: Revamp HCR_EL2.E2H RES1 detection (2025-10-14 08:18:40 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-fixes-6.18-2
>
> for you to fetch changes up to 4af235bf645516481a82227d82d1352b9788903a:
>
>   MAINTAINERS: Switch myself to using kernel.org address (2025-11-08 11:2=
1:20 +0000)
>
> ----------------------------------------------------------------
> KVM/arm654 fixes for 6.18, take #2
>
> * Core fixes
>
>   - Fix trapping regression when no in-kernel irqchip is present
>     (20251021094358.1963807-1-sascha.bischoff@arm.com)
>
>   - Check host-provided, untrusted ranges and offsets in pKVM
>     (20251016164541.3771235-1-vdonnefort@google.com)
>     (20251017075710.2605118-1-sebastianene@google.com)
>
>   - Fix regression restoring the ID_PFR1_EL1 register
>     (20251030122707.2033690-1-maz@kernel.org
>
>   - Fix vgic ITS locking issues when LPIs are not directly injected
>     (20251107184847.1784820-1-oupton@kernel.org)
>
> * Test fixes
>
>   - Correct target CPU programming in vgic_lpi_stress selftest
>     (20251020145946.48288-1-mdittgen@amazon.de)
>
>   - Fix exposure of SCTLR2_EL2 and ZCR_EL2 in get-reg-list selftest
>     (20251023-b4-kvm-arm64-get-reg-list-sctlr-el2-v1-1-088f88ff992a@kerne=
l.org)
>     (20251024-kvm-arm64-get-reg-list-zcr-el2-v1-1-0cd0ff75e22f@kernel.org=
)
>
> * Misc
>
>   - Update Oliver's email address
>     (20251107012830.1708225-1-oupton@kernel.org)
>
> ----------------------------------------------------------------
> Marc Zyngier (3):
>       KVM: arm64: Make all 32bit ID registers fully writable
>       KVM: arm64: Set ID_{AA64PFR0,PFR1}_EL1.GIC when GICv3 is configured
>       KVM: arm64: Limit clearing of ID_{AA64PFR0,PFR1}_EL1.GIC to userspa=
ce irqchip
>
> Mark Brown (2):
>       KVM: arm64: selftests: Add SCTLR2_EL2 to get-reg-list
>       KVM: arm64: selftests: Filter ZCR_EL2 in get-reg-list
>
> Maximilian Dittgen (1):
>       KVM: selftests: fix MAPC RDbase target formatting in vgic_lpi_stres=
s
>
> Oliver Upton (3):
>       KVM: arm64: vgic-v3: Reinstate IRQ lock ordering for LPI xarray
>       KVM: arm64: vgic-v3: Release reserved slot outside of lpi_xa's lock
>       MAINTAINERS: Switch myself to using kernel.org address
>
> Sascha Bischoff (1):
>       KVM: arm64: vgic-v3: Trap all if no in-kernel irqchip
>
> Sebastian Ene (1):
>       KVM: arm64: Check the untrusted offset in FF-A memory share
>
> Vincent Donnefort (1):
>       KVM: arm64: Check range args for pKVM mem transitions
>
>  .mailmap                                           |  3 +-
>  MAINTAINERS                                        |  2 +-
>  arch/arm64/kvm/hyp/nvhe/ffa.c                      |  9 ++-
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c              | 28 +++++++++
>  arch/arm64/kvm/sys_regs.c                          | 71 ++++++++++++----=
------
>  arch/arm64/kvm/vgic/vgic-debug.c                   | 16 +++--
>  arch/arm64/kvm/vgic/vgic-init.c                    | 16 ++++-
>  arch/arm64/kvm/vgic/vgic-its.c                     | 18 +++---
>  arch/arm64/kvm/vgic/vgic-v3.c                      |  3 +-
>  arch/arm64/kvm/vgic/vgic.c                         | 23 ++++---
>  tools/testing/selftests/kvm/arm64/get-reg-list.c   |  3 +
>  tools/testing/selftests/kvm/lib/arm64/gic_v3_its.c |  9 ++-
>  12 files changed, 137 insertions(+), 64 deletions(-)
>


