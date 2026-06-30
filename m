Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35E3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QS02Y4ZTkCaY+8KNH+aFUHWmz4C6FfgfF/SB6ePyOlU=; b=cDmBJ5Pwl2w/VK0CJegyliubh1
	KizWmNC4MTfR3s90DHhl29NMoDp982DzHvDkF5Q9LtwDhfHQ2qDdQYsorxyRMcMpawpy+aeV10fM6
	YJus0f/VN/M3rxsTFyxU0k5FGaAm5hfUhZ9UqzpPWQkssCsNFlD8GU+9cWSb4bVi0QbhGbC09DyeJ
	HLXLxyYt1y8/jz7bw+cvBvqaQvpoURJsxuWSEmn308jw0hJHxAjyoPcOycvRsG+XlQfdygTvrAmwj
	coy1mcL5oCa1prpvwli6CIkT6q+Jr7afPOyiIzhubDQFTh62/AR3X3uEGilwvOfsfsIXgp9PA6P1j
	4GOPzMUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weW7g-0000000Gizw-1YBk;
	Tue, 30 Jun 2026 10:55:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weW7d-0000000GizS-2fCZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:55:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BC9E438B8
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 10:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4035D1F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 10:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782816921;
	bh=QS02Y4ZTkCaY+8KNH+aFUHWmz4C6FfgfF/SB6ePyOlU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a4sK+8R1ugLnIFAsbH0lz8AUe7kRH/N+y63uSUgrKVXOkND+PCeWRv4/rDdnx5VZ+
	 HEAYjfubry0IAxUVqH2gtygSX54hRtbd/gji/L+InYJsudr4Mq4+w3C/W5mBNbGXx4
	 O2MNTIAnfTm5czNImtNraZW8xQckJeYL1T0zG7bKSDuNCJOq/ctejSZHbwXJIqGslK
	 WRjP4Fgozdg17w9FwGA/HUZGQgBnsWcPGAdsV4Ey491dOrvLqSomra9Ra4V4mHcEC5
	 7fIMRI53Jkdc6trZxUuojgL6mR2wNEErxGEK/kNeaeCG6Mw0YBLSt0Wi/WKsA/T4KK
	 tY1hYwLOS2ZSw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39b293079d1so91081fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 03:55:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp2s14ZdPtVyUmE4qiKUpz3xVFwlzMds05GH0otRK6gYuejh5og67oi1LDQTB/fSmdYnH2AMXL2pIhY0C3iMK3b@lists.infradead.org
X-Gm-Message-State: AOJu0YyCWg7lYFH6daZ7bnCQQIAdb1z181OaeJ2jouKtVsf72JJucSi9
	V+Mnnn+AyH3zCDKtb1Jcye1eKrlGpRIariq82hk6KcbLTd04zcz5eyWWZJyC2QiFRwwaScEmPCz
	KkXt5jiIEp4/NTssFLHRN/EyICQXi1dQ=
X-Received: by 2002:a05:651c:41d1:b0:399:b07e:daa7 with SMTP id
 38308e7fff4ca-39b1df87889mr5327631fa.24.1782816919764; Tue, 30 Jun 2026
 03:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-6-23ffa16b6ebb@kernel.org>
 <CAJZ5v0ibZKfzJwGyUb92-K1N9C_ab0QujpAKCrvMdyygquS1Vw@mail.gmail.com> <akOfu2EIQq3CJgqw@lpieralisi>
In-Reply-To: <akOfu2EIQq3CJgqw@lpieralisi>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 30 Jun 2026 12:55:05 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hUUz0TPKEdn5Z-4My2R59YeJPenU6ksF6Y6mvXoxQsSw@mail.gmail.com>
X-Gm-Features: AVVi8CckYFzmEyQcHXV6OSl_5EYAouUcgCGftnfBtVwhGCqpemZWNGkMfRNVdZQ
Message-ID: <CAJZ5v0hUUz0TPKEdn5Z-4My2R59YeJPenU6ksF6Y6mvXoxQsSw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] irqchip/gic-v5: Enable GICv5 IWB ACPI probe
 ordering detection
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Sunil V L <sunilvl@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jun 30, 2026 at 12:51=E2=80=AFPM Lorenzo Pieralisi
<lpieralisi@kernel.org> wrote:
>
> On Mon, Jun 08, 2026 at 07:18:15PM +0200, Rafael J. Wysocki wrote:
>
> [...]
>
> > > +#ifdef CONFIG_ACPI
> > > +       if (has_acpi_companion(&pdev->dev))
> > > +               acpi_dev_clear_dependencies(ACPI_COMPANION(&pdev->dev=
));
> > > +#endif
> >
> > I would rather add a wrapper for this, along with an empty stub for
> > the !CONFIG_ACPI case.
>
> #ifdef CONFIG_ACPI
> static inline void acpi_device_clear_dep(struct device *dev)
> {
>         if (has_acpi_companion(dev))
>                 acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
>
> }
> #else
> static inline void acpi_device_clear_dep(struct device *dev) {}
> #endif
>
> Something like that ?

Yup.

