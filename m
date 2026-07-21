Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A38FC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 14:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tX/2tl07+yJqbOuLTPdhA092ojLMqUmxZf/n+rIp9Kw=; b=M89gXg8H5o4CjBZtoMMyMRQ0a5
	F404nQWNJfCxYkCyO0BgPx8bJZWGMXNV+R9d0GWSvjIoeKYcqUcNY8orBZGKSoWVXjqdllHaPNPx+
	8y6carsPTtJMZUR53HsEvqEmnCF0dXrKwydRpqsZg0Ib5wAzYepJ2vCr6EFh57ILiEt0J4d3u8lFy
	nyNXiiM26LomVqCoYsRSxecR27EbLDLIlnViByyI9bF1durAE4qXDqqQcJPGA6AcUO6ssyZm1duId
	GN9lnG3Q5ZSsczlRb+uSB6fpyOFlMFe0JUr22D/+ID4NcjEwiKzv9qINANP2c9xGpvIvWBDXCijvv
	QRfjo2wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBXZ-00000009fZT-23mG;
	Tue, 21 Jul 2026 14:33:49 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBXV-00000009fYg-3dC5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 14:33:47 +0000
X-Gm-Message-State: AOJu0Yyk6Qb0bdLflfcbIJ7IZNLZopyqx7mLdOCMdEzNTLnX+nAnzanH
	Jnp15eImfJOTR7fy21EOUrfc12wjobnewDMEa5xWI7Bxy8GsEcHjprIBXyv7wwiEb3NsWkNPIZK
	cMw4dlmnLwfrGh+m8a1CS6c2QEu6cKXgDdFHChcT8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784644422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tX/2tl07+yJqbOuLTPdhA092ojLMqUmxZf/n+rIp9Kw=;
	b=KpmGcvy2aUo/SP+0RZBIk4VdVVYIGLJyRfRksje2J/hoEsXz0CKywlO/8k8xKl9ZtVJ6DR
	/Zaw3Mp3NBgEcEb04DVMwKnXmS6+Kzp+yHWVqzoR7UeyCFs9qCj/tcTKnCyGverirmCi0c
	jux1vfvG1Y5AIhqYupxQarxx/4ebr5g=
X-Received: by 2002:ac8:7654:0:b0:51c:ca9:3d15 with SMTP id
 d75a77b69052e-5266416fcf2mr9196991cf.12.1784644413281; Tue, 21 Jul 2026
 07:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260703154811.3355680-1-sascha.bischoff@arm.com> <20260703154811.3355680-34-sascha.bischoff@arm.com>
In-Reply-To: <20260703154811.3355680-34-sascha.bischoff@arm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 21 Jul 2026 15:32:56 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzwC3urfr2FZZsd-2QmMrqKj-65X-FW4VTcfR8V4LdT_A@mail.gmail.com>
X-Gm-Features: AUfX_mzQa77h9tPAu2s-6As5Zputo3VkX3T4yUJNcdJdYwyNb5k2wGjd3E4MrGI
Message-ID: <CA+EHjTzwC3urfr2FZZsd-2QmMrqKj-65X-FW4VTcfR8V4LdT_A@mail.gmail.com>
Subject: Re: [PATCH v3 33/40] KVM: arm64: gic-v5: Add GICv5 EL1 sysreg
 userspace accessors
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
X-CRM114-CacheID: sfid-20260721_073346_211372_A33D0FB8 
X-CRM114-Status: GOOD (  16.46  )
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

I found this one harder to follow than I expected, and I think what
makes it hard to read is also what makes the two things below go
wrong. A PPI is numbered two different ways here, by its position
within the register and by its absolute index, and which of the two a
given line needs is not obvious from the line itself.

Two things in set_gic_ppi_enabler(), set_gic_ppi_activer() and
set_gic_ppi_pendr(), both latent while VGIC_V5_NR_PRIVATE_IRQS is 64.

The first is the loop bounds. All three walk:

> + start = VGIC_V5_NR_PRIVATE_IRQS * reg;
> + end = start + VGIC_V5_NR_PRIVATE_IRQS;
> + for (i = start; i < end; i++) {

but each register covers 64 PPIs, so the slice being handled is 64 *
reg to 64 * reg + 63. In set_gic_ppi_enabler() and
set_gic_ppi_activer() that is explicit just above the loop, for
example:

> + bitmap_write(cpu_if->vgic_ppi_enabler, val, 64 * reg, 64);

With VGIC_V5_NR_PRIVATE_IRQS at 128 and reg at 1, the loop would run
from 128 to 255, so the test_bit() inside it would read past the end
of a bitmap that is VGIC_V5_NR_PRIVATE_IRQS bits wide. The absolute
indexing there is what the bitmap wants, it is the bounds that do not
match the 64-wide slice.

The second is only in set_gic_ppi_pendr():

> +            bool level = !!(val & BIT_ULL(i));

Here i is the absolute PPI number, but val is a u64 whichever register
is being handled, so its bits are always numbered 0 to 63. With reg at
1 this would be BIT_ULL(64) and up.

I appreciate none of this is reachable today. All three start with

> +    if (VGIC_V5_NR_PRIVATE_IRQS == 64 && reg == 1)
> +        return 0;

so reg is always 0 and the two numberings coincide. But the guard
reads as though the non-64 case is meant to work, and as far as I can
tell it would not. Would it make sense to derive the bounds from the
register width rather than from VGIC_V5_NR_PRIVATE_IRQS, so that the
loop and the data always describe the same slice?

Cheers,
/fuad

