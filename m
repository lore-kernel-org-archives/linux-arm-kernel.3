Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAFFC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 18:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gm6ClMxDHl1RHD/LYyh3fIvbnsL96xbpC1rOSYoANHM=; b=p7zft52wSNvglFH+mNQ+5w8ZXB
	l3Igr+VgC9pvcVI1VioE7DM0AZYNcsRvISc5b7XfCp6EpKWCD1XFijAiFPlqPccPc00YrHE5XVgsV
	czFSf5EHs0jsinwaGCBILJ9uEyoVDqKQKQxJ8DxQSh6OJKluFMS8+mjVUufMPfQ0VH/2hp793icHi
	8Es7uK0Dke8JLbca8SnPZbngrEAZddMK8/FuROKewYg4cvrbhlyvnTsSkFvCCR7vTrutoyR/hdvy6
	pd3eM6K6QTTDA3aSYz5zBtMOz/Gblta1xp045kXBPgTHeTdnjDHuIiEi0IZZjR8vQ9UxHFGV9KWFA
	FJhOLe4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQVp-00000003hzv-15qn;
	Mon, 27 Jul 2026 18:57:17 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQVm-00000003hzL-3ZS1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 18:57:16 +0000
X-Gm-Message-State: AOJu0YyqcZ57eGkeIl4OMsAsKZfIT2yZJkLHUFfOIoTJkEly40+PPl0w
	7vjKw1GzZvf0qpySA0prl0kpcVTQ7+J1Eme/WaDXU2MHdaBLKTEcFBN1K+wfvw254uQbXebuln3
	xk13apGgMlX6FAqgpu0XBuMi0Z8E0lIGeldfhKtvy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785178631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gm6ClMxDHl1RHD/LYyh3fIvbnsL96xbpC1rOSYoANHM=;
	b=D+MjbT0GTMuu3nrsrZaHHwmangFHcdnvZC+Ue3aYJPcF/ANA0RX/T9h+6ngs+ukqZa8+EF
	W5LsL6zUltqSnTm9FJo/MLppOpANKqN6U9Eg7W6Q4YZQoU7XQ8IUA4fJUa361aSvLB/1mq
	Gh9OG/Ie2pekoq86ln+azgq7lGD5AnE=
X-Received: by 2002:a05:622a:8c17:b0:517:6dc0:698d with SMTP id
 d75a77b69052e-529a5be6c10mr43504311cf.0.1785178617971; Mon, 27 Jul 2026
 11:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260724104819.1296803-1-sascha.bischoff@arm.com> <20260724104819.1296803-36-sascha.bischoff@arm.com>
In-Reply-To: <20260724104819.1296803-36-sascha.bischoff@arm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 27 Jul 2026 19:56:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwrx6Ce4LMHFz9MNGo87PvFFHxEOY7Dqrk85j3W+wDtxQ@mail.gmail.com>
X-Gm-Features: AUfX_mwQzqMQPZddkwxbGWErEu-Qxdpoh07vMkc0A1I1hb4UcJBkVU3n5eDAtDc
Message-ID: <CA+EHjTwrx6Ce4LMHFz9MNGo87PvFFHxEOY7Dqrk85j3W+wDtxQ@mail.gmail.com>
Subject: Re: [PATCH v4 35/48] KVM: arm64: gic-v5: Implement save/restore
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
X-CRM114-CacheID: sfid-20260727_115715_179792_E8ADB86D 
X-CRM114-Status: GOOD (  22.87  )
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

On Fri, 24 Jul 2026 at 11:58, Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:
...

> +/*
> + * Save the LPI IST to userspace memory.
> + *
> + * The LPI IST may be linear or two-level, so host iteration depends on the
> + * allocated host shape.
> + */
> +int vgic_v5_save_lpi_ist(struct kvm *kvm, struct kvm_vgic_v5_ist *ist_attr)
> +{
> +       struct vgic_v5_ist_desc ist;
> +       u32 __user *uaddr;
> +       int ret;
> +
> +       ret = vgic_v5_get_lpi_ist_desc(kvm, &ist);
> +       if (ret)
> +               return ret;
> +
> +       if (!ist.present)
> +               return 0;
> +
> +       uaddr = (u32 __user *)(unsigned long)ist_attr->lpi_ist_addr;
> +
> +       if (!ist.vmi->h_lpi_ist_structure)
> +               return vgic_v5_save_linear_ist(&ist, uaddr,
> +                                              BIT(ist.id_bits));
> +
> +       return vgic_v5_save_two_level_ist(&ist, uaddr);
> +}

This bounds the walk with the ID_BITS stamped into the VMTE when the
host IST was allocated...

...

> +static int vgic_v5_validate_ist_attr(struct kvm *kvm,
> +                                    const struct kvm_vgic_v5_ist *ist_attr)
> +{
> +       unsigned int id_bits;
> +       int ret;
> +
> +       /* We always have SPIs to save */
> +       ret = vgic_v5_validate_ist_user_buffer(ist_attr->spi_ist_addr,
> +                                       ist_attr->spi_ist_size,
> +                                       kvm->arch.vgic.nr_spis * sizeof(__u32));
> +       if (ret)
> +               return ret;
> +
> +       /* We don't always have LPIs to save */
> +       ret = vgic_v5_irs_lpi_ist_id_bits(kvm, &id_bits);
> +       if (ret < 0)
> +               return ret;
> +
> +       /* No LPI IST */
> +       if (!ret) {
> +               if (ist_attr->lpi_ist_addr || ist_attr->lpi_ist_size)
> +                       return -EINVAL;
> +
> +               return 0;
> +       }
> +
> +       return vgic_v5_validate_ist_user_buffer(ist_attr->lpi_ist_addr,
> +                                              ist_attr->lpi_ist_size,
> +                                              BIT(id_bits) * sizeof(__u32));
> +}

... and this sizes the buffer from the emulated IRS_IST_CFGR. I think
the two are using different values, and I could not find anything that
re-syncs them.

The two writers of IRS_IST_CFGR differ: `vgic_v5_mmio_write_irs_ist()`
returns early while `ist_baser.valid` is set,
`vgic_v5_mmio_uaccess_write_irs()` does not. So userspace can restore
the IST, stamping the VMTE from the larger LPI_ID_BITS, rewrite
IRS_IST_CFGR smaller, and then save with the matching smaller buffer.
`vgic_v5_ist_cfgr_valid()` accepts down to IRS_IDR2.MIN_LPI_ID_BITS,
so on a part reporting 0 that is BIT(16) entries into a buffer
validated at 4 bytes. `test_vgic_v5_ist_save_restore()` in patch 48
already restores and then re-saves before any vCPU runs, it just does
not write IRS_IST_CFGR in that window.

arm-vgic-v5.rst says the LPI buffer size must be BIT(lpi_id_bits) *
sizeof(__u32), "where lpi_id_bits is the LPI ID width configured in
IRS_IST_CFGR", which is the value the validation uses and not the one
the walk uses.

Adding the `ist_baser.valid` check to the uaccess path would break
restore, since the same file says the IRS registers may be restored in
any order. Validating against the value the walk uses, or rejecting a
save when the register and the VMTE disagree,
both look workable. Bounding the walk by the register instead would
read past the host allocation whenever the register is the larger of
the two, so I do not think that direction works.

`put_user()` targets the caller's own mapping and the host-side reads
stay in bounds, so I think this is a correctness problem rather than a
security one. The SPI save uses `nr_spis` on both sides and restore
stamps the VMTE from the value it validated,
so only the LPI save looks affected, linear and two-level alike.

Cheers,
/fuad

