Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017FCC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zg3XpQecv0mXXRMsDgxjkw4kFjHnoHcsHChO/11NzsA=; b=VH2RVlfG2VUzcGDae5NQQfGEkm
	PYu6htObIhGptydZCfp9xY7dGIfAQsIUk7De3TSJt3j5jl8sPKU+c6qudQI0VeoM/o9Ha0m9m+Nj6
	5Yn4HG8sxurzIns+MB6l8EdvqPTcFZCBWhiCUVbXYqwreUlQuAhQIs/+nBhzJ6084Bd/ow0Y2Uz+R
	53SjJnCS5YdrDEaRUTfE7zyIrMxLoOXG8Kw+FHLV3FpcHQwzlB6UDJi1MHA1P5dqCpKjJm33bJgue
	9UBzNyLim5AakuPhuDQaOsdBgnC+ENZMYM/hTEONtecr2u4VkG4dvXDeitMwI+L3fLOO1RYjL8MPL
	8TKcPcAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKEs-00000002ecU-1KeO;
	Mon, 27 Jul 2026 12:15:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKEs-00000002ecO-00bC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:15:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8350143E4E
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 12:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C541F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 12:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785154520;
	bh=Zg3XpQecv0mXXRMsDgxjkw4kFjHnoHcsHChO/11NzsA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OWNby+HGAepxfSKuvxBG+TQEypvr39SSAUxEEu2K9UoUkXYZVRipxktclrFqgDuDp
	 /cwncd5mau4QL/VEKj5R0c1tqZoN0Ly2Aw2PkpNnWnfQDorOcgYi1SW0CB7fsKaCn/
	 OV/xjYY8x7KM1nmeFChGO6NBUDi92HS59SxLzHJ1OGtYtH+3NYFpqttkpO+xKjIxd2
	 vdtBHdSJw921f1kqEzyfWzxXEW3EZXJNqna7/k7yHPi79JocorcYqah/9AoLO765D2
	 /uiCVl3l1DDCumqddowDWlllssex/5BsGmMKNRA5xFmjnHLeH8HzWg9QE1LCWQ6Km0
	 jRyrxaI3iB9Yg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c86945164so20595441fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 05:15:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqbfNOYrblo9FwI3qh15oHisP19T1onzW36Nwin6csMAmmnoh1KGe9Nrs/AThD/oE/mPp8urDdM73E79wN0ltUG@lists.infradead.org
X-Gm-Message-State: AOJu0YzleWWHBURkZgSw5UQMO8Ux3rP98aJuj4sP3UJw5RwoGlz40aPG
	waY9LBMc/5KC0Z4kPC85I19EDJA3SWUqgePEBnIHX+Fc37O/LGdkdGpNcdUNUYteerQWsujmlvo
	ZT2HKzWOPSADxq9XDgzvBDMldHHoUZOs=
X-Received: by 2002:a05:651c:1504:b0:39e:b3b2:e95f with SMTP id
 38308e7fff4ca-39f2879f23dmr13514141fa.18.1785154518609; Mon, 27 Jul 2026
 05:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260727-acpi-refactor-v1-0-ff900aa326ee@thegoodpenguin.co.uk>
In-Reply-To: <20260727-acpi-refactor-v1-0-ff900aa326ee@thegoodpenguin.co.uk>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 27 Jul 2026 14:15:00 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iVareeeAj-hECFasHtVKvZfFZXb6vqTz_BGQQVzSDk7A@mail.gmail.com>
X-Gm-Features: AUfX_mwnO5VxOfQHtV3WXK2XDax9MNHWMK_aInuBMDBRO8AF87-O7Mc0F0MkYFQ
Message-ID: <CAJZ5v0iVareeeAj-hECFasHtVKvZfFZXb6vqTz_BGQQVzSDk7A@mail.gmail.com>
Subject: Re: [PATCH 0/9] ACPI: use named initializers for acpi_device_id
To: "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Zhang Rui <rui.zhang@intel.com>, 
	Kai-Heng Feng <kaihengf@nvidia.com>, Tony Luck <tony.luck@intel.com>, 
	Borislav Petkov <bp@alien8.de>, Hanjun Guo <guohanjun@huawei.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Dan Williams <djbw@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Ira Weiny <iweiny@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, nvdimm@lists.linux.dev
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

On Mon, Jul 27, 2026 at 2:10=E2=80=AFPM Pawel Zalewski (The Capable Hub)
<pzalewski@thegoodpenguin.co.uk> wrote:
>
> This series is converting lists that contain the acpi_device_id
> struct, which is defined in the include/linux/device-id/acpi.h
> to makes use of named initializers (which they do not use currently).
> This work is part of the on going effort in the kernel associated
> with device-ids [1]
>
> The plan is to convert acpi_device_id::driver_data to have an anonymous
> union, similarly to what was introduced for PCI and I2C device ID tables.
> The goal is to increase type-safety (as most of the existing casts are go=
ne),
> to improve readability and to make use intent a bit more clear:
>
> ```
> union {
>         kernel_ulong_t driver_data;
>         const void *driver_data_ptr;
> }
> ```
>
> But for that to work all lists containing the structs need to use named
> initializers first. I already have patches that implement this and touchi=
ng
> a lot of kernel subsystmes that use the acpi_device_id struct and that li=
st
> keeps on growing. Therefore, I have decided to split the series per every
> subsystem into:
> - pre-clean-ups that convert the lists to use named initializers
> - actual implementations that make some of the modules use the new driver=
_data_ptr
>
> That way the task can be fragmented into manageable and independent
> chunks of work and makes this effort easier to review.
>
> Tested builds on arm64 and x86-64 in Yocto on 7.2-rc5
>
> [1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@bayl=
ibre.com/
>
> Signed-off-by: Pawel Zalewski (The Capable Hub) <pzalewski@thegoodpenguin=
.co.uk>
> ---
> Pawel Zalewski (The Capable Hub) (9):
>       ACPI: use a named initializer for acpi_device_id
>       ACPI: drop unused assignment of acpi_device_id::driver_data
>       ACPI: pci: drop unused assignment of acpi_device_id::driver_data
>       ACPI: ghes-nvidia: use a named initializer for acpi_device_id::id
>       ACPI: amba: drop unused assignment of acpi_device_id::driver_data
>       ACPI: dptf: drop unused assignment of acpi_device_id::driver_data
>       ACPI: nfit: core: drop unused assignment of acpi_device_id::driver_=
data
>       ACPI: x86: use a named initializer for acpi_device_id::id
>       ACPI: use a named initializer for acpi_device_id::id
>
>  drivers/acpi/ac.c                 |   4 +-
>  drivers/acpi/acpi_apd.c           |  42 ++--
>  drivers/acpi/acpi_memhotplug.c    |   4 +-
>  drivers/acpi/acpi_pad.c           |   4 +-
>  drivers/acpi/acpi_platform.c      |  13 +-
>  drivers/acpi/acpi_pnp.c           | 514 +++++++++++++++++++-------------=
------
>  drivers/acpi/acpi_processor.c     |   8 +-
>  drivers/acpi/acpi_tad.c           |   4 +-
>  drivers/acpi/acpi_video.c         |   2 +-
>  drivers/acpi/apei/ghes-nvidia.c   |   2 +-
>  drivers/acpi/arm64/amba.c         |   6 +-
>  drivers/acpi/battery.c            |   8 +-
>  drivers/acpi/button.c             |  12 +-
>  drivers/acpi/container.c          |   8 +-
>  drivers/acpi/dptf/dptf_pch_fivr.c |  14 +-
>  drivers/acpi/dptf/dptf_power.c    |  38 +--
>  drivers/acpi/ec.c                 |   6 +-
>  drivers/acpi/evged.c              |   4 +-
>  drivers/acpi/fan_core.c           |   2 +-
>  drivers/acpi/hed.c                |   4 +-
>  drivers/acpi/nfit/core.c          |   4 +-
>  drivers/acpi/pci_link.c           |   4 +-
>  drivers/acpi/pci_root.c           |   4 +-
>  drivers/acpi/pfr_telemetry.c      |   4 +-
>  drivers/acpi/pfr_update.c         |   4 +-
>  drivers/acpi/processor_driver.c   |   6 +-
>  drivers/acpi/sbs.c                |   4 +-
>  drivers/acpi/sbshc.c              |   6 +-
>  drivers/acpi/scan.c               |  46 ++--
>  drivers/acpi/thermal.c            |   4 +-
>  drivers/acpi/tiny-power-button.c  |   6 +-
>  drivers/acpi/video_detect.c       |   4 +-
>  drivers/acpi/x86/cmos_rtc.c       |   2 +-
>  drivers/acpi/x86/lpss.c           |  54 ++--
>  drivers/acpi/x86/s2idle.c         |  14 +-
>  drivers/acpi/x86/utils.c          |  16 +-
>  include/linux/acpi.h              |   8 +-
>  37 files changed, 443 insertions(+), 446 deletions(-)
> ---

So we can talk about this after 7.3-rc1 is out.

Thanks!

