Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33799C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 17:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V61MtFHN1V5mcLJHu7tV/IoRmZFZoC5zGlPSgF5EIbk=; b=jhUfu0Ljsm+NIC7S4qOpYWdKSS
	i2wLR2YQ5+S5zjLRRKxZQFZ0OeWlxq8A+vLb3yyiNuRXRjCCXDFADO1W/SuV1EIrWT65fw3sgSIHv
	HOF/Q3DJUlKPY2IbKy2Gf51U+af+95LzlWPt8llfZJTUfm5FUG9PaRnN0FeIcjvD1ldnEfJhjCVEX
	bUiaAyL+9EsMfyZID+xkkbu71SLbyTf4n3XNMXGT0ghpIrR1quo8nraHNeGjev1CpShRLNUNamZcw
	hH3cqI3d7h38WY/58RxSfQogdlkacKqmfDvCZlvGYugAkp22u+EXjzBDVC3GQUWTG3Y1IBKChW3Su
	YSwk8cLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPYu-00000003b5N-42Lu;
	Mon, 27 Jul 2026 17:56:24 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPYs-00000003b4I-0NCt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 17:56:23 +0000
X-Gm-Message-State: AOJu0Yw4r9b8qTm9Pwxub9ir/IWY3U28UolxSKUj6L+HhqEUo3aTllGj
	GwVVghrXmG8Y66m7PG+dtJAyLOkhqr7LQFFDJ8zAsyn7sQy5WMiaLhjleirWCoZDsACovCjyKnh
	S0vfN5zH3RIdTrb4kuM9VFXCCGb212aTLV4nCoshm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785174973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V61MtFHN1V5mcLJHu7tV/IoRmZFZoC5zGlPSgF5EIbk=;
	b=oZsg0ptH3Ggd+EWBBPSqeIFPdK6zwQ6/jrOdreYbsC/CZeeP3EZ6Nft1tw6jLiy+PXX+jh
	eELrag+aLMD4XKUfGv3CGaRoRaAX0iANoEPmuvHpX5ZWt27IsdysdZFqmjAUQ8gUmRumGU
	SvKjvqAVHFZ9avHIknFuEKhckQBM0c0=
X-Received: by 2002:a05:622a:9c4:20b0:517:5e32:2d14 with SMTP id
 d75a77b69052e-529a5e726b4mr37748591cf.10.1785174970207; Mon, 27 Jul 2026
 10:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260724104819.1296803-1-sascha.bischoff@arm.com> <20260724104819.1296803-11-sascha.bischoff@arm.com>
In-Reply-To: <20260724104819.1296803-11-sascha.bischoff@arm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 27 Jul 2026 18:55:33 +0100
X-Gmail-Original-Message-ID: <CA+EHjTz+msYV6L0ydQR7Qw6LA8ASucpkumAqxrO36KUhvRDW2A@mail.gmail.com>
X-Gm-Features: AUfX_mzT1lQqmfncb9Af7oKyhTBxEtHB6P2oZDlB1iOpMSGOvof6H3RE6t1v3sE
Message-ID: <CA+EHjTz+msYV6L0ydQR7Qw6LA8ASucpkumAqxrO36KUhvRDW2A@mail.gmail.com>
Subject: Re: [PATCH v4 10/48] KVM: arm64: gic-v5: Introduce guest IST alloc
 and management
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
X-CRM114-CacheID: sfid-20260727_105622_610824_C1D0121D 
X-CRM114-Status: GOOD (  10.69  )
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

On Fri, 24 Jul 2026 at 11:52, Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:
...
> +static int vgic_v5_alloc_linear_ist(struct kvm *kvm, bool spi_ist,
> +                                   unsigned int id_bits, unsigned int istsz)
> +{
> +       const size_t n = id_bits + 1 + istsz;
...
> +       l1sz = BIT(n + 1);
> +       ist = kzalloc(l1sz, GFP_KERNEL_ACCOUNT);
...
> +static int vgic_v5_alloc_l1_ist(struct kvm *kvm, unsigned int id_bits,
> +                               unsigned int istsz, unsigned int l2sz)
> +{
> +       const size_t n =  max(5, id_bits - ((10 - istsz) + (2 * l2sz)) + 3 - 1);
> +       u32 vm_id = vgic_v5_vm_id(kvm);
> +       const u32 l1_size = BIT(n + 1);

I think the linear path might be missing the floor that this one
applies. The host driver keeps it on its own linear path too:
`gicv5_irs_init_ist_linear()` uses `n = max(5, lpi_id_bits + 1 +
istsz)`.

Without the floor the allocation is under 64 bytes whenever `id_bits +
1 + istsz < 5`, and `vgic_v5_ist_istsz()` gives an `istsz` of 0 on a
host without metadata support. `ARCH_KMALLOC_MINALIGN` is 8 on arm64,
so a 4 to 32 byte allocation is not necessarily 64-byte aligned, and
`vgic_v5_vmte_assign_ist()` rejects that against
`GICV5_VMTEL2E_IST_ADDR`. It depends on where the slab places the
allocation, so it is intermittent rather than reliable.

The rejection also logs with an unratelimited `kvm_err()`, on a path
the guest can drive repeatedly.

This needs the host IRS to report a `MIN_LPI_ID_BITS` low enough to
reach it, since `vgic_v5_ist_cfgr_valid()` rejects an `lpi_id_bits`
below `irs->idr2.min_lpi_id_bits`.

Cheers,
/fuad

