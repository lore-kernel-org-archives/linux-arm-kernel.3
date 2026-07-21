Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76331C44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 15:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWBKtHpQs7Mjv5sBBU83pNN7Nd/6AUX8CaJlXFspUiY=; b=T/v4O8VbdpUzBDJHJYIbwQOxGG
	00bZFzGRIqQXinIX7XyntikIH5uRkHUwQwj+jVpaIJInSOiofLrUINqjL2t9yqAeCAMzCQeLN2YCi
	Y7a6KkEQ7Zm3Ue17alLqHuK2pA8AiaQioqAmGPMhYlyOEM5o0xE486xJclGdk3Y+vB5xUsm+6F2+D
	Hcd8GuuvXeNwuMbLrarQBgA9cHjCFsuZbX4onYJuenapoc9qoldD2zjITV0dVmXx03XfC+bcoUxv6
	P2ROow54mbokc+VbQbltYOBgEZgPDH3qvjOlLpMJ8CPFUYr8Bwg5CwXeIakE1bFsbRtJrjllbQpo4
	325m2Vfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCcZ-00000009p7v-1MK7;
	Tue, 21 Jul 2026 15:43:03 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCcR-00000009p4R-1YPA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 15:43:02 +0000
X-Gm-Message-State: AOJu0Yz2KYu5lxtXJa1HASG2iGLvlvjoAC57YptOQfYCmYDQdGAqU/B2
	iMWthRe6Y4AD5+y1jd4tf/V5Tl7Ht/EPzBqqNkQ6uu0Ue5uVMwirPlS8XDe41mRCc9gknWYUbyP
	02dctAI+mL21OK4LVH2W9/OY3F7s7DB3KH5MzYBIG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784648562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fWBKtHpQs7Mjv5sBBU83pNN7Nd/6AUX8CaJlXFspUiY=;
	b=U3AA/wH5WZnLIBNlitthruHFWkjR6ddCZliEqBbSd9q64wY/ycGV3SR0hgl8YAVLoP8Le1
	JUPioe0ib0hVmTmaWsy5CMTdjvBiGg4zE4B6HQ3OUHgKLu9LnIkS7lk88QGaCWihm5xNb7
	786RtQDEsUgDXWWGOS02SVwqDb2QFTI=
X-Received: by 2002:a05:622a:d0e:b0:51c:ca9:3d17 with SMTP id
 d75a77b69052e-52601f03537mr16476711cf.12.1784648547786; Tue, 21 Jul 2026
 08:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260703154811.3355680-1-sascha.bischoff@arm.com> <20260703154811.3355680-37-sascha.bischoff@arm.com>
In-Reply-To: <20260703154811.3355680-37-sascha.bischoff@arm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 21 Jul 2026 16:42:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTybDSAgr44jXNFnssnYq_vVeuZ+1qORS8f4dtQgMzOZ5A@mail.gmail.com>
X-Gm-Features: AUfX_mxjsFrqC8Gpjv6b_a6EYXug8lYIGCF5p9ytlWNhOuKnl9fC4c65x8uK9Mc
Message-ID: <CA+EHjTybDSAgr44jXNFnssnYq_vVeuZ+1qORS8f4dtQgMzOZ5A@mail.gmail.com>
Subject: Re: [PATCH v3 36/40] KVM: arm64: gic-v5: Implement save/restore
 mechanisms for ISTs
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, 
	Suzuki Poulose <Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, 
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	Timothy Hayes <Timothy.Hayes@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_084301_575483_C3B560FA 
X-CRM114-Status: GOOD (  19.85  )
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

Hi Sascha,

Two things about the new KVM_DEV_ARM_VGIC_GRP_IST interface. Both are
about the userspace ABI rather than the mechanism.

...

> +int vgic_v5_save_spi_ist(struct kvm *kvm, struct kvm_device_attr *attr)
> +{
> +    u32 __user *uaddr = (u32 __user *)(unsigned long)attr->addr;
...
> +    for (unsigned int i = 0; i < kvm->arch.vgic.nr_spis; ++i) {
...
> +        __le32 *h_iste_addr = ist.base + i * ist.iste_size;
> +
> +        h_iste = READ_ONCE(*h_iste_addr);
> +        ret = put_user(h_iste, uaddr);
> +        if (ret)
> +            return ret;
> +
> +        uaddr++;
> +    }

The kernel writes nr_spis * 4 bytes into attr->addr, but struct
kvm_device_attr has no length field, so userspace has no way to
declare how large its buffer is and the kernel has no way to check it.
The size is implied by nr_spis, which userspace set earlier through
KVM_DEV_ARM_VGIC_GRP_NR_IRQS, or never set, in which case it defaulted
to 32.

put_user() has no idea how large the caller's buffer is. It only fails
if the address itself is not writable, so writes past the end of a
short buffer land in whatever happens to be next, with no error
reported. The documentation states the required size, but nothing
enforces it.

It is also the only variable length buffer in the VGICv5 interface.
GRP_IRS_REGS is a __u64, USERSPACE_PPIS is a __u64[2], GRP_NR_IRQS is
a __u32, and none of those can be got wrong.

kvm_device_attr itself is fixed, so no length can be added there.
Changing what addr points at is still possible while this is unmerged,
but would not be afterwards. Would it make sense for addr to point at
a small structure carrying an explicit size, so that the kernel can
reject a mismatch?

The second point is the LPI IST going into guest memory. I understand
from the commit message that the shadowing is deliberate and that the
guest has already allocated the storage, so this is about the
interface rather than that decision.

Saving the ISTs is a KVM_GET_DEVICE_ATTR, and it writes into guest
memory. Several of the documented ordering constraints are enforced,
with -EBUSY when the VGIC is not initialised or when a restore is
attempted after the VM has run. This one cannot be, because it is
about when the VMM serialises guest memory:

> These two steps may be performed in either order. However, the guest memory
> must be serialised after the ISTs have been saved, as saving the LPI IST writes
> the IST state back into guest memory.

A VMM that snapshots guest memory before saving the ISTs gets no
error, and the IST contents simply never reach the destination. Live
migration looks fine to me, since kvm_write_guest() marks the pages
dirty and a later pass picks them up, but a stop and copy save done in
the natural order would lose them silently.

Was a userspace buffer considered for the LPI IST as well, the way the
SPI IST already works? That would remove the ordering requirement
entirely, and by my reading the worst case is 65536 entries at 32
bits, so 256 KiB, given the 16 bit clamp on the guest's LPI ID bits.

Cheers,
/fuad

