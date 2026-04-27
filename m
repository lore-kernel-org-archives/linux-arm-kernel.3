Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51219FF8862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xaAdwH/ZvqVlM3qFB/XtL+Aj8QOREix0lRLn2M7hBA=; b=z+plBIKb5kgfDIu09c5mXE5aGr
	po8R/M+VJYBQP0SGadEwRYieyU7LEsKuhshTrirpLg+VnrfPKbs3v+Q3NEYmvWa3v7XELRI/VbxTB
	eKUpVz0N+fZTix1IJu3N6cTVkUnEh/201vOt3OmB+dhc94gq4dgUVjwkiDhIPKSSwLm9Pn+qHB39D
	nFLYxkIui76VhW9LqPxF/uxD41yWA6AA8QC2vAjKYREeDGon3zr1GuRldg59KwQTBeSfrRKi59tzw
	5QqIMT4UybPDmIde+fa34IiSKvVGMDSNg4xtrNFNsT+S7aeJSOfdoTwbUJnPlRzVMZwFbU0S32Z9h
	dSlJkPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHHU-0000000GRd3-0DrY;
	Mon, 27 Apr 2026 08:25:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHHN-0000000GRYl-0vHR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777278318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5xaAdwH/ZvqVlM3qFB/XtL+Aj8QOREix0lRLn2M7hBA=;
	b=WhJICabarKVkFaH55TDW0G4KtCHrcoMoOus1ugNRjM9JbwH/NaUVajKkN6dqQNazFJUCJt
	FMGOFiI6x27wMMvy+t2DxVyc+jMhrtbb9IWGyJq6V4+oY6TKhbk7bwT9/pf0AhyoLoVGzl
	T+Xh85W0oBZ58v/Sg8R8KoHHZIp5WLo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-TKWbIvT1MIGKbArSxfsXhw-1; Mon, 27 Apr 2026 04:25:17 -0400
X-MC-Unique: TKWbIvT1MIGKbArSxfsXhw-1
X-Mimecast-MFC-AGG-ID: TKWbIvT1MIGKbArSxfsXhw_1777278316
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4411a529bc0so6021048f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 01:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777278316; x=1777883116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5xaAdwH/ZvqVlM3qFB/XtL+Aj8QOREix0lRLn2M7hBA=;
        b=CV/TB2nVkl8X6Qh5X3sZ6ZNenjWLlC3RNcQOVqBdfNDZ9HyKSJ+KKF7bbAzkfYMk/V
         eJwYlWAq8JwunPmqQ7702l+L8/DcMul363sRuflh4FBPJ1QaUZCvhv7sqzPRuKZMa62g
         /mFWN3eBiQVpLFdUcAFJSzsOgCxD9FDPrwn47BeiFEc/oo3j6FAy9aUNlw9MsSt5x9kl
         KNnaLAiY3Zd96xfw/8I2feQE9EsSFmeTKLe7SzWUBMxV68ukyxyix5EcSqYL8TdB0HE6
         Z0INal5mHWP6gbvbagxGtMP9r1HQdMspR9C7KHdDYAvhkE3qJWMyRkL1Q1ke+IGN4SVS
         7nJA==
X-Forwarded-Encrypted: i=1; AFNElJ95hFi2M+LTQPCpIIUO+H1iqVVowr0B3Ma4YNH/jaO+/RUSfeK6AoDjoCQtQ+Q+fh9PUNvLqCUhPI99tB6IGrML@lists.infradead.org
X-Gm-Message-State: AOJu0YxlTuvLpbD+E0CTKM2zMMsTKL6A2YIVKI1AFV4UBIxM+v3v+ACi
	o+wp/PbQdZaqhZDg9J1rfJgT9tS4SCO1BuTot7atkpLpn+vH8cUxaVk1ImxYQ1kokVW6r9kz7Ve
	/Jbv71WdNbs2H6NOQWSBOlLXTgBLYEkM0uGWCiupYIy5mr6eE6aOs3JpApFItSc7RRdSoiKv0Da
	gt8uYnCWdSp5jX/e65envooNijVgFCMxWgZGzNootptn3NPmqPE78=
X-Gm-Gg: AeBDietAwfC4CZkjhnCg0IgybdCEDIHOMrcB7z9nfHoAXvCUsSpzcHjqVS+I5qv6R1V
	5ETd48XrdfB7DpiL1YYgP2fk7PzdnIRfe8whOnO7/pnfKCcIPyJlCNLbCw95ls4+KO+eVS1ODh4
	5wZLD6PwInzdCQC582jDVkZlKuN7KBd0T86eOR0TCah35Xqip3PG3m8P3hISHpV01fcruM0LYZc
	wHwTuD/mDbzEVdcXYbvxOgoXr02Vthfthbfrw3/rvcpyXhWjRXQ4q0uVWa3ThGFvDGwl6bMYUh5
	Aezkd19gdNpunzg=
X-Received: by 2002:a5d:64c3:0:b0:43f:e266:4c9c with SMTP id ffacd0b85a97d-43fe3db2e62mr64527660f8f.3.1777278315528;
        Mon, 27 Apr 2026 01:25:15 -0700 (PDT)
X-Received: by 2002:a5d:64c3:0:b0:43f:e266:4c9c with SMTP id
 ffacd0b85a97d-43fe3db2e62mr64527575f8f.3.1777278314785; Mon, 27 Apr 2026
 01:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260424151443.750077-1-maz@kernel.org>
In-Reply-To: <20260424151443.750077-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 27 Apr 2026 10:25:03 +0200
X-Gm-Features: AVHnY4LX4zIbvkokFvwRe85hWW9vU3Mi4qKP1vkFGw7_g8t-wfUHl7-fG7neYpg
Message-ID: <CABgObfaBf8NMM_vNKy5gPamp1gbsT7CEv=SA2X9yQ10gekgMXA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 7.1, take #1
To: Marc Zyngier <maz@kernel.org>
Cc: Ben Simner <ben.simner@cl.cam.ac.uk>, David Woodhouse <dwmw@amazon.co.uk>, 
	Fuad Tabba <tabba@google.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uedncmf24edE2sKMk4VJpQBTfMPqfysUr0nJX966XUc_1777278316
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_012521_346017_A3A456B5 
X-CRM114-Status: GOOD (  22.89  )
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

On Fri, Apr 24, 2026 at 5:15=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> Paolo,
>
> This is the first drop of KVM/arm64 fixes for 7.1. Nothing really
> major so far, but a rather wide range of fixes for idreg handling,
> long standing regressions, SMCCC compliance and more. Add a few
> cleanups to the fix, and that's about it. As usual, gory details in
> the tag below.
>
> Please pull,

Pulled, thanks.

Paolo

>         M.
>
> The following changes since commit 94b4ae79ebb42a8a6f2124b4d4b033b15a98e4=
f9:
>
>   Merge branch kvm-arm64/misc-7.1 into kvmarm-master/next (2026-04-08 12:=
26:11 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-fixes-7.1-1
>
> for you to fetch changes up to 4ce98bf0865c349e7026ad9c14f48da264920953:
>
>   KVM: arm64: Wake-up from WFI when iqrchip is in userspace (2026-04-24 1=
2:03:57 +0100)
>
> ----------------------------------------------------------------
> KVM/arm64 fixes for 7.1, take #1
>
> - Allow tracing for non-pKVM, which was accidentally disabled when
>   the series was merged
>
> - Rationalise the way the pKVM hypercall ranges are defined by using
>   the same mechanism as already used for the vcpu_sysreg enum
>
> - Enforce that SMCCC function numbers relayed by the pKVM proxy are
>   actually compliant with the specification
>
> - Fix a couple of feature to idreg mappings which resulted in the
>   wrong sanitisation being applied
>
> - Fix the GICD_IIDR revision number field that could never been
>   written correctly by userspace
>
> - Make kvm_vcpu_initialized() correctly use its parameter instead
>   of relying on the surrounding context
>
> - Enforce correct ordering in __pkvm_init_vcpu(), plugging a
>   potential pin leak at the same time
>
> - Move __pkvm_init_finalise() to a less dangerous spot, avoiding
>   future problems
>
> - Restore functional userspace irqchip support after a four year
>   breakage (last functional kernel was 5.18...). This is obviously
>   ripe for garbage collection.
>
> - ... and the usual lot of spelling fixes
>
> ----------------------------------------------------------------
> David Woodhouse (1):
>       KVM: arm64: vgic: Fix IIDR revision field extracted from wrong valu=
e
>
> Fuad Tabba (5):
>       KVM: arm64: Fix FEAT_Debugv8p9 to check DebugVer, not PMUVer
>       KVM: arm64: Fix typo in feature check comments
>       KVM: arm64: Fix FEAT_SPE_FnE to use PMSIDR_EL1.FnE, not PMSVer
>       KVM: arm64: Fix kvm_vcpu_initialized() macro parameter
>       KVM: arm64: Fix pin leak and publication ordering in __pkvm_init_vc=
pu()
>
> Marc Zyngier (2):
>       KVM: arm64: pkvm: Adopt MARKER() to define host hypercall ranges
>       KVM: arm64: Wake-up from WFI when iqrchip is in userspace
>
> Quentin Perret (1):
>       KVM: arm64: Fix initialisation order in __pkvm_init_finalise()
>
> Sebastian Ene (1):
>       KVM: arm64: Reject non compliant SMCCC function calls in pKVM
>
> Vincent Donnefort (1):
>       KVM: arm64: Re-allow hyp tracing HVCs for [nh]VHE
>
>  arch/arm64/include/asm/kvm_asm.h   | 28 ++++++++++++++++++----------
>  arch/arm64/include/asm/kvm_host.h  |  5 +----
>  arch/arm64/kvm/arm.c               |  4 ++++
>  arch/arm64/kvm/config.c            | 23 ++++++++++++++++-------
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 30 +++++++++++++++++-------------
>  arch/arm64/kvm/hyp/nvhe/pkvm.c     | 38 +++++++++++++++++++++++++-------=
------
>  arch/arm64/kvm/hyp/nvhe/setup.c    |  6 +++---
>  arch/arm64/kvm/vgic/vgic-mmio-v2.c |  2 +-
>  arch/arm64/kvm/vgic/vgic-mmio-v3.c |  2 +-
>  9 files changed, 86 insertions(+), 52 deletions(-)
>


