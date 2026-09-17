Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EF6C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCB7kYcnG02MJOJXUn6C/taoVXipNbSEcZ1HCYhjZfo=; b=LGXzcOtv4r/QLsWAY0PHjs7Q/E
	H0qTtsbwBnI+6BuXOJSMAbOCcwEoOXPT2i7BjSTBtj+xO21TqBPA1q/P5N2pAJRAYPgrFHJu9nvVU
	3Po6RI2+ejY3fXJgZb2/aEp3RCFhmZa0XVUPimlBIy9uoe6A3d70uMssa0hfMsY0jpspkvgZIowJf
	M0ufhKaxy9TcEqZIjJb6aut1eooQ6F/I+xxtG0mXQyO5HHu09x9c1AQekllCRsOcxkOXpvbn5e0zB
	OdEmEvOv23jLJYKwAlJvaIbVk4WoHLLOtv8u3I4UG2O2TxiYV25MkpatSDqI5xZYQ/5UHeYsEJsMO
	ALXbi37A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Bg4-0000000BLfr-1BKk;
	Thu, 17 Sep 2026 12:57:24 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Bg1-0000000BLfN-2wWX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 12:57:22 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5b7658501ccso1658e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 05:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789649840; cv=none;
        d=google.com; s=arc-20260327;
        b=mhnBON0NHigtexk6arg4WxWGpy6kh9CfNygQFZTXSxD4djpzjo73IU9S634oIh4gVQ
         QyuFHfLa9t+jpX+TcZTUhg0hudztmO9y7FTVUiEaioiPa0OzJwlu9oqnNk8P/CQkBMHF
         zkr9pyNtTDQ14j0a+L93xUyFprnQUFaC2gMjWlio5F1vbbZ3ttfPglQQidxHldXoW2Tz
         l6H3JJWJCxvnfHy0v7YuAE0a0VCu1Qckf31qKaXSvILukammaXYNr83PObCFrz6YwKE0
         PJJ8rcYKdwyc0pt1X6WUVYbVCqDvTry9N+N3rY5RGuRBenvPCYcazCxAirortyyFPDUy
         IkYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wCB7kYcnG02MJOJXUn6C/taoVXipNbSEcZ1HCYhjZfo=;
        fh=S54r7c+I1IvKlg0cqKagGHz/C6Oisg6j4w/V/g+eZds=;
        b=jU9NENvrCRbCzkaogEqqtkY0VqDEyy95Oev5bNDfxZP6jQgOWGwZwPwgoyrudJGYw2
         O+W+NE06UaoMP9+9x0oabWt3gV9gAfCiLEyHuQPK6qsVXiBfHFOoEQYNwxVbChdFh9Yh
         ZcryMFoL1jUJwZeT45Rw9tOMIJm8E0+bW3dPSWOKNKRvzyBgEq8KQO91vTmfCg2/fsyd
         tc1oWo7qUL/MsIUHCIed5YmylX+PbiB/V+5Ob+NJpRlGlvgVYqldIoMXQb9Vs1Fk8i66
         HNv5SPncamScne1HrLTH9rN8H+LTm/DFKl3J0Z85T6zn8rsTJ1en9TWl74iAtjlH9HNK
         AXxQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789649840; x=1790254640; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wCB7kYcnG02MJOJXUn6C/taoVXipNbSEcZ1HCYhjZfo=;
        b=Mlsx6ekvu10eYCdYTBnmphy0+F14q1V/afahY7Ef0EXxz+LbkmaLFgr5cL4+Sti7Za
         v08P3TBC10vzJDm2mTuMlCYVz49/4Z8UrT4EajWzwcAMMURaAJS5NW2WxpgOCoQcc/Uj
         j5bPoCFfDgSP/fxIn9362yK0uSq9osW5TyHEBuphChAZNr/po3J0ha5ZdILzMDlxmL31
         Ad1DtzeUdhfy+NeWdkDjMmzcaAR6CPIgRVjgoP1LWXCPOGVURbJ7yBCM/etfzkvxDCET
         WFYHXWbsWYwef3mN9DtdLsJlxR407ZxrIpDnWaGUzSugON64KkqcWK1d8Uzx6zedLC8q
         0m+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789649840; x=1790254640;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wCB7kYcnG02MJOJXUn6C/taoVXipNbSEcZ1HCYhjZfo=;
        b=ZsFoUlzEV3cNSKFauf95KbO1Pg/quE/Rk/Y/U4eIStwuzao9CJUPBpaGHWTQg4p/S5
         BVOVdtnjqsvcrkWXmCIcGr2MoPjUQySQ1IAmIKD7hmvDgf9ptrdcSUyLCM8lQTreneJU
         JsLLMdA68MAfEdTW4tloz12jp5yiTxFaaTAbQdKyPg+p2EqF2uhgkU1OAvuHzyzglr4w
         swYvMPlrex3hQRUCA9BlitQyE2mfA6Ilv4bLxTxCpH2bc0U/mfrPVVL69+8JjZAM3zRJ
         Os3uUTQTi6LB3TpBM1oZX0UienqOHgIk1xis6JC6Trfs8Zcj2QgOyh3zzmxzlRhYTzyV
         EMOw==
X-Forwarded-Encrypted: i=1; AKwUvByMV9KMoucCS9JIjMh3sPFQ97ijMHdtNPhj0xpv4UKt8pVwMJanuj5ov0iapBPWivL5y1W4CxXQs5XhqxiKprWu@lists.infradead.org
X-Gm-Message-State: AFuF++mzuRNyo8Kr1QI1P5XiQFTqXRZA1IUpbfBA1BU6r6BUGsRupuqX
	IE/rYu7dLo0Tfmj0plFOnMExH5pReOwciQdojrUzsJo2MZZfp2etlT1A5FcOTj/JwyIgHYcQEid
	IXAAe7QYg6Ro0BfpkKQmXybDXClqQ0kJiO/npbwsf
X-Gm-Gg: AYBFou08ZcYLCLKeehbO9mJJ2y+JnkW4MbzXsUjIu0sAiQ6PPDRlLLUtopb2AIyBmGH
	f5vZECaAWlmO9WlwAVk0VTYpHAtR4kim8JVkydaJWsRhs15pICHRNTsYO9rSM6RhGv/EQed3DmF
	Sb3dVNHlu98PKFehfN1i7BdammFhQ2SsUDrITI2MwlAYg/PvL9q3NQigpg+waMh9UlygRyLb4oI
	ikUgUUTWUtjMNlQXDdzQs8iusxlzJAxhhP7QOej/3/XMjZmvBTjJ5mjRaJLfb4mEKSqEX9pkQvY
	D6pmISUsZXCYg8seGGks7nSX4NOWDN3Z+L6+kt+Q/T/VzMxshXfGzyyujw1TLXuzWRdhFFz+Vd1
	4PIVUFKU5pjTK0g==
X-Received: by 2002:a05:6512:b97:b0:5b1:571f:715f with SMTP id
 2adb3069b0e04-5b8bff16793mr25923e87.3.1789649839151; Thu, 17 Sep 2026
 05:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com> <20260915160141.3543048-19-suzuki.poulose@arm.com>
In-Reply-To: <20260915160141.3543048-19-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 17 Sep 2026 13:57:00 +0100
X-Gm-Features: AcwNN1X3rwZaClpg5QtpbmDuAi81nkVt-NA4XEMnqdzMUr4WqSiJJDooQvLcWZ4
Message-ID: <CA+EHjTzKjjEuAuoOuzGG0uKyVZE-r+CEreca2H2kEQYuRPpgUw@mail.gmail.com>
Subject: Re: [PATCH v18 18/23] KVM: arm64: CCA: Mandate VGIC_V3 for Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_055721_785170_3DFC0480 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

Hi Suzuki,

On Tue, 15 Sep 2026 17:01:36 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
[...]
> @@ -84,6 +84,9 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
>                  !kvm_vgic_global_state.can_emulate_gicv2)
>                  return -ENODEV;
>
> +        /* Realms only support VGIC_V3 */
> +        if (kvm_vm_is_realm(kvm) && type != KVM_DEV_TYPE_ARM_VGIC_V3)
> +                return -ENODEV;

Could this be kvm_vm_hyp_is_distrusting(kvm) (with patch 13's compare
as >=) rather than a Realm-only check? A GICv2 isn't possible under
pKVM either, but there the v2 mapping is only rejected later, in
kvm_vgic_map_resources() at the first run; this would give both the
same -ENODEV at KVM_CREATE_DEVICE.

Cheers,
/fuad

