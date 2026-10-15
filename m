Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF39CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T87vGq3eLO+uu+4HDmZGZVd3NJVSkNS9b2FOBCtgcHs=; b=R476WBhYgkK9yCswR0o21HagmU
	LH8/RAVzyDPZ8PmtBjq6kWWspA+0tXSHaWtsXieZrMjSNyjiv2PZUBxyEJ5Vjuz2Auu4gZxw25nRs
	UI0dfYNItnid0p4V4epwCN/urHXlKUgovEmXtxDqLWxDzUL7DdaGNVSzqpK2lYLHQPdvrWoqokuCG
	c5CRfhLrqvDFSUHxhrkEwklzX7gzCAbS9uMYFJBNp2oSPOJSJLtFKaD9g0E1mA07s7HkogGnGr47X
	wMzOwkVsDenb6p9QYJi9GMmoblbHP42VdfLx8t5cHkaIg7W2FPNd6L7achR9dwoGC8fQ2QYZi5M8a
	ZL6sl2rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHM0g-00000000JVY-2GPi;
	Thu, 15 Oct 2026 14:00:43 +0000
Received: from out-190.mta1.migadu.com ([95.215.58.190] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHM0c-00000000JV0-1Uwf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:00:40 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=6Ntld4Igh2eWgn+gJwrpP12iCF/OrSpwwkSoEGWK6QQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792072836; v=1; x=1792677636;
 b=JUl2HYq/p0j5x9irAg4BrFKPjMX4+RYbQvkUd35Q6JK4owo5i8w7NY97NIj7kGY4CbJibCjF
 ZVYm+tb+IZ5I/aayWHRSBJfAk2rZ2CfyH2yEBFx8ncUEPNHgclHrMRUofuWBmZCQcgnr+dB57vv
 XeEypSZpcrNmUYj4EUuVF+Vk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6d157b3155b8ec53;
	Thu, 15 Oct 2026 14:00:36 +0000
X-Mizu-Trace-ID: 6d157b3155b8ec53
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so6240e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 07:00:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxxITOYChZqNC2mJwyIHYgtkGuR74PV8CUNhYIvYRxSaR5uDLARNzU/Fsj/A7b9zfgcT7CCTzsw+TyDH5o5D7S4@lists.infradead.org
X-Gm-Message-State: AFq9FYJgaxLs51+3YxV3Dprl3aYOLV7ZlGx5uNmXu+8j1GyFNZkZkV2w
	P9+ZY3R4j6AYIuGkqnIjqbKUi/rtaLhBhgUkj62iOZ45ItRT3wjXmbWsf+AL3BTkIY8qveMR5r7
	dgZoGJ2mmUU1k9/tYBBfLqYjSSJMlKfzTFKqQjwiL
X-Received: by 2002:a05:6512:3196:b0:5be:3607:3a97 with SMTP id
 2adb3069b0e04-5be3e077786mr116198e87.0.1792072832985; Thu, 15 Oct 2026
 07:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20261015100539.1011760-3-maz@kernel.org> <20261015125713.2650696-1-fuad.tabba@linux.dev>
 <86ik33137e.wl-maz@kernel.org>
In-Reply-To: <86ik33137e.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 15 Oct 2026 14:59:56 +0100
X-Gmail-Original-Message-ID: <CA+EHjTz2nsHkYkXOprZ9obYmTQeKrcue1S686CwCjWvLhtjmvQ@mail.gmail.com>
X-Gm-Features: AclHuK_p_jA27OTWFMOxJa5ERUC2ySPYnnuaQE4YLlcy6i2zl-d3p83lu3UB5OY
Message-ID: <CA+EHjTz2nsHkYkXOprZ9obYmTQeKrcue1S686CwCjWvLhtjmvQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] KVM: arm64: Move OUTSIDE_GUEST_MODE publication past
 context being saved
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_070038_699883_73F1AD56 
X-CRM114-Status: GOOD (  13.30  )
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

On Thu, 15 Oct 2026 at 14:52, Marc Zyngier <maz@kernel.org> wrote:
[...]
> I don't really want to make this vgic specific, as there could be
> more. But I can more precisely describe what state were talking about:
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 8b46fafdd3494..7ce9f3bfa7fff 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1390,8 +1390,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>                 kvm_arch_vcpu_ctxsync_fp(vcpu);
>
>                 /*
> -                * All the state has been synchronised, let advertise
> -                * we're outside of the guest.
> +                * The state that was pushed into the CPU on entering
> +                * the guest has been synchronised back, let's
> +                * advertise we're outside of the guest.
>                  */

lgtm,
/fuad

