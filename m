Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6AEC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 16:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwRBrAn95ue33W6DszvlK1HReXU3uB5HdQrOlS7LOnE=; b=Dck1WA+N5OibyRzNVcWPXWgbBw
	/TLTsTahHPoWTobwrZvVa/T2Qv1Pw5YR3HPfsuEX2JmZrjTep6bm1bKEemoHArVhKwi0b1tQ6XuUj
	7OsCz8aBFLGLaeHDrbNj+Sz36RN6or6Hc6S6diW+UTtLTCrznSLU6VavRHF/nT8vDJKwqkW/3bstu
	ygpYS4f44T8b12xp91UDvqW1DbWXdWLcIBGbdPmNBxFG0kKhQeMEvrAM0fQtJrqoMKUek6ZgWoJsk
	XTJPjUfC3uGsGWjZf4CgjYp+Brprx0UxrqE2V5JXWWnBx256vZj4pebbfy4VOfRrR2aWEZiewpYiU
	5Vfb2eKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tua6x-00000006acu-13ni;
	Tue, 18 Mar 2025 16:48:15 +0000
Received: from mail-ua1-f44.google.com ([209.85.222.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZwO-00000006YhB-3LkV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 16:37:22 +0000
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86d42f08135so2400648241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 09:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742315839; x=1742920639;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwRBrAn95ue33W6DszvlK1HReXU3uB5HdQrOlS7LOnE=;
        b=Elrc7eS1BM0pwcuc4p2kjASIzu4zz2AWa525NrZwI1FKLwKJyNlpW/jI0Ndo517YPf
         9JKx2IHNZopredRIIroczzvy7C/WFUUqZ5/JXvtIKere7ySNe1SbyS/1uLXMJ/XqiopJ
         Rbh7dJsiyfLnYy4Zc3HHREA5qiffZP9ykF/vhwfPA8Y6s2l/+jF4fXPHMpW61m1P9lmc
         y2R19iQi0OUUlWQDB2gqElyQaKnt08mRpISVsW6BDDJgoV9QTjH01KfMd2FPsC83XXTJ
         Csqza8Yu+OOt53djliQi28ii6a6d1y2fd1fbyWcA9P9zjiYLOw7GkoL8WKP/eLMN9z1L
         fGrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/pZDmRYdsjj2hg6UOctfqT1VqS3l6/P+UAvI2sA4I9HKU927sifDJkI8OaTZOJTymF4gUYMwVKq3Myao289Av@lists.infradead.org
X-Gm-Message-State: AOJu0YwgVtDMNw75EfdB64SLZL6beNnWgR0vnagtbuCA84HW7KavCSzq
	4eobwhhEYv0IMvreQVaZO4ri0tX063Bf1E0g/1AO/OkV5yOtL5B1iE/gw8Ks
X-Gm-Gg: ASbGncv5PyEJOVQY8+R+oJUuxyEl6dKS5EM6tJcWdOdhmjrtsReaH3FraPJ3BagdjI6
	CvP/C8BgWm+jBWeIDg41qjScTK78iu5yySNK284nwuK1bIYtZmsueHnPiW8XoiSxjWuO4pm0y72
	MMrEd+S8fZFUU/tXw2p9iQU1Isl7/KtPoqRxKuhGoNs7eg0wLehYqkMdKY29bqEd2yN7KbAcMQI
	dbmDlAxVzvij9FCrkOORwJplzc5jCfII1Uh6zXKQqfUwmOIUy9cgybFSgTooyWDXODmKjqrcwIW
	uX4eh1C4Qma+b3udZcGcc3YvMeu6lhNm4/woEkW3MIX76OpgaFTRNh7XzCTY4gMB9PMWjr0NDzf
	WO1hlvTZ4tsE=
X-Google-Smtp-Source: AGHT+IHIblkDF2x/6XFVeH0vEgti9dT8LmmZ1nyu0QNefiYZjwOtYwSdmZKe9sD+l+LwXhEftjmpag==
X-Received: by 2002:a05:6102:4421:b0:4bb:d062:438 with SMTP id ada2fe7eead31-4c4d8ff3607mr4083763137.1.1742315838813;
        Tue, 18 Mar 2025 09:37:18 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c375462bd6sm1974797137.25.2025.03.18.09.37.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 09:37:18 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-523efb24fb9so2384034e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 09:37:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXW0hMYjmpocS1/uTfENIV5Kxf8p7ndc/s8WausIHR0rad8bx2SgrtD7y1Ob1hfoF6vON3dD/dAlcopaBDJui13@lists.infradead.org
X-Received: by 2002:a05:6122:3c8c:b0:520:5a87:66ed with SMTP id
 71dfb90a1353d-52480e7f34fmr3607589e0c.5.1742315838042; Tue, 18 Mar 2025
 09:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1740753261.git.robin.murphy@arm.com> <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
In-Reply-To: <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Mar 2025 17:37:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWPFnHTFeeWL2-BU8tKOL-E5K2ROOz=LLBLTJJLCK9NgA@mail.gmail.com>
X-Gm-Features: AQ5f1JoM657_qcXASxrgwKY3sd-GA64e6coLQEp-A0NEDn3ArAoI-Pzo7CTBLaA
Message-ID: <CAMuHMdWPFnHTFeeWL2-BU8tKOL-E5K2ROOz=LLBLTJJLCK9NgA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe path
To: Robin Murphy <robin.murphy@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Stuart Yoder <stuyoder@gmail.com>, 
	Laurentiu Tudor <laurentiu.tudor@nxp.com>, Nipun Gupta <nipun.gupta@amd.com>, 
	Nikhil Agarwal <nikhil.agarwal@amd.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
	Charan Teja Kalla <quic_charante@quicinc.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_093720_840049_2904C420 
X-CRM114-Status: GOOD (  44.08  )
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

Hi Robin,

On Fri, 28 Feb 2025 at 16:51, Robin Murphy <robin.murphy@arm.com> wrote:
> In hindsight, there were some crucial subtleties overlooked when moving
> {of,acpi}_dma_configure() to driver probe time to allow waiting for
> IOMMU drivers with -EPROBE_DEFER, and these have become an
> ever-increasing source of problems. The IOMMU API has some fundamental
> assumptions that iommu_probe_device() is called for every device added
> to the system, in the order in which they are added. Calling it in a
> random order or not at all dependent on driver binding leads to
> malformed groups, a potential lack of isolation for devices with no
> driver, and all manner of unexpected concurrency and race conditions.
> We've attempted to mitigate the latter with point-fix bodges like
> iommu_probe_device_lock, but it's a losing battle and the time has come
> to bite the bullet and address the true source of the problem instead.
>
> The crux of the matter is that the firmware parsing actually serves two
> distinct purposes; one is identifying the IOMMU instance associated with
> a device so we can check its availability, the second is actually
> telling that instance about the relevant firmware-provided data for the
> device. However the latter also depends on the former, and at the time
> there was no good place to defer and retry that separately from the
> availability check we also wanted for client driver probe.
>
> Nowadays, though, we have a proper notion of multiple IOMMU instances in
> the core API itself, and each one gets a chance to probe its own devices
> upon registration, so we can finally make that work as intended for
> DT/IORT/VIOT platforms too. All we need is for iommu_probe_device() to
> be able to run the iommu_fwspec machinery currently buried deep in the
> wrong end of {of,acpi}_dma_configure(). Luckily it turns out to be
> surprisingly straightforward to bootstrap this transformation by pretty
> much just calling the same path twice. At client driver probe time,
> dev->driver is obviously set; conversely at device_add(), or a
> subsequent bus_iommu_probe(), any device waiting for an IOMMU really
> should *not* have a driver already, so we can use that as a condition to
> disambiguate the two cases, and avoid recursing back into the IOMMU core
> at the wrong times.
>
> Obviously this isn't the nicest thing, but for now it gives us a
> functional baseline to then unpick the layers in between without many
> more awkward cross-subsystem patches. There are some minor side-effects
> like dma_range_map potentially being created earlier, and some debug
> prints being repeated, but these aren't significantly detrimental. Let's
> make things work first, then deal with making them nice.
>
> With the basic flow finally in the right order again, the next step is
> probably turning the bus->dma_configure paths inside-out, since all we
> really need from bus code is its notion of which device and input ID(s)
> to parse the common firmware properties with...
>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com> # pci-driver.c
> Acked-by: Rob Herring (Arm) <robh@kernel.org> # of/device.c
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Thanks for your patch, which is now commit bcb81ac6ae3c2ef9 ("iommu:
Get DT/ACPI parsing into the proper probe path") in iommu/next.

This patch triggers two issues on R-Car Gen3 platforms:

1. I am seeing a warning on Renesas Salvator-XS with R-Car M3N
(but not on the similar board with R-Car H3), and only for SATA[1].
Unfortunately commit 73d2f10957f517e5 ("iommu: Don't warn prematurely
about dodgy probes") does not help:

    ------------[ cut here ]------------
    sata_rcar ee300000.sata: late IOMMU probe at driver bind,
something fishy here!
    WARNING: CPU: 1 PID: 13 at drivers/iommu/iommu.c:571
__iommu_probe_device+0x208/0x38c
    Modules linked in:
    CPU: 1 UID: 0 PID: 13 Comm: kworker/u8:1 Not tainted
6.14.0-rc3-rcar3-00020-g73d2f10957f5-dirty #315
    Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
    Workqueue: events_unbound deferred_probe_work_func
    pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    pc : __iommu_probe_device+0x208/0x38c
    lr : __iommu_probe_device+0x208/0x38c
    sp : ffffffc086da39a0
    x29: ffffffc086da39b0 x28: 0000000000000000 x27: 0000000000000000
    x26: 0000000000000001 x25: ffffffc080e0e0ae x24: ffffffc080e0e0bb
    x23: 0000000000000000 x22: ffffff800bd3d090 x21: ffffffc080acf680
    x20: ffffff8008e8f780 x19: ffffff800aca8810 x18: 00000000e9f55e4c
    x17: 6874656d6f73202c x16: 646e696220726576 x15: 0720072007200720
    x14: 0720072007200720 x13: 0720072007200720 x12: 0720072007200720
    x11: 00000000000001ac x10: ffffffc086da3700 x9 : ffffffc083edb140
    x8 : ffffffc086da3698 x7 : ffffffc086da36a0 x6 : 00000000fff7ffff
    x5 : c0000000fff7ffff x4 : 0000000000000000 x3 : 0000000000000001
    x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffff80083d5380
    Call trace:
     __iommu_probe_device+0x208/0x38c (P)
     iommu_probe_device+0x34/0x74
     of_iommu_configure+0x128/0x200
     of_dma_configure_id+0xdc/0x1d4
     platform_dma_configure+0x48/0x6c
     really_probe+0xf0/0x260
     __driver_probe_device+0xec/0x104
     driver_probe_device+0x3c/0xc0
     __device_attach_driver+0x58/0xcc
     bus_for_each_drv+0xb8/0xe0
     __device_attach+0xdc/0x138
     device_initial_probe+0x10/0x18
     bus_probe_device+0x38/0xa0
     deferred_probe_work_func+0xb4/0xcc
     process_scheduled_works+0x2e4/0x4a8
     worker_thread+0x144/0x1cc
     kthread+0x188/0x198
     ret_from_fork+0x10/0x20
    irq event stamp: 49052
    hardirqs last  enabled at (49051): [<ffffffc0800fb6a8>]
__up_console_sem+0x50/0x74
    hardirqs last disabled at (49052): [<ffffffc0809eb65c>] el1_dbg+0x20/0x6c
    softirqs last  enabled at (49046): [<ffffffc080096c50>]
handle_softirqs+0x1b0/0x3b4
    softirqs last disabled at (48839): [<ffffffc080010168>]
__do_softirq+0x10/0x18
    ---[ end trace 0000000000000000 ]---

I added debug prints to sata_rcar_probe(), and verified SATA is
probed at about the same time on R-Car H3 and M3N, and the probe is
never deferred.

Do you have a clue?


2. The IOMMU driver's iommu_ops.of_xlate() callback is called about
three times as much as before:

    +platform ec700000.dma-controller: ipmmu_of_xlate
    +platform ec720000.dma-controller: ipmmu_of_xlate
    +platform ec700000.dma-controller: ipmmu_of_xlate
    +platform ec720000.dma-controller: ipmmu_of_xlate
    +platform ec700000.dma-controller: ipmmu_of_xlate
    +platform ec720000.dma-controller: ipmmu_of_xlate
    +platform ec700000.dma-controller: ipmmu_of_xlate
    +platform ec720000.dma-controller: ipmmu_of_xlate
    +platform ec700000.dma-controller: ipmmu_of_xlate
    +platform ec720000.dma-controller: ipmmu_of_xlate
    +platform fea27000.fcp: ipmmu_of_xlate
    +platform fea2f000.fcp: ipmmu_of_xlate
    +platform ec700000.dma-controller: ipmmu_of_xlate
    +platform ec720000.dma-controller: ipmmu_of_xlate
    +platform fe950000.fcp: ipmmu_of_xlate
    +platform fe96f000.fcp: ipmmu_of_xlate
    +platform fea27000.fcp: ipmmu_of_xlate
    +platform fea2f000.fcp: ipmmu_of_xlate
    +platform fe9af000.fcp: ipmmu_of_xlate
     rcar-fcp fe950000.fcp: ipmmu_of_xlate
     rcar-fcp fe96f000.fcp: ipmmu_of_xlate
     rcar-fcp fea27000.fcp: ipmmu_of_xlate
     rcar-fcp fea2f000.fcp: ipmmu_of_xlate
     rcar-fcp fe9af000.fcp: ipmmu_of_xlate
     rcar-dmac ec700000.dma-controller: ipmmu_of_xlate
     rcar-dmac ec720000.dma-controller: ipmmu_of_xlate
    +platform e6700000.dma-controller: ipmmu_of_xlate
    +platform e6800000.ethernet: ipmmu_of_xlate
    +platform e6700000.dma-controller: ipmmu_of_xlate
    +platform e7300000.dma-controller: ipmmu_of_xlate
    +platform e7310000.dma-controller: ipmmu_of_xlate
    +platform e6800000.ethernet: ipmmu_of_xlate
    +platform ee100000.mmc: ipmmu_of_xlate
    +platform ee140000.mmc: ipmmu_of_xlate
    +platform ee160000.mmc: ipmmu_of_xlate
    +platform e6700000.dma-controller: ipmmu_of_xlate
    +platform e7300000.dma-controller: ipmmu_of_xlate
    +platform e7310000.dma-controller: ipmmu_of_xlate
    +platform e6800000.ethernet: ipmmu_of_xlate
    +platform ee100000.mmc: ipmmu_of_xlate
    +platform ee140000.mmc: ipmmu_of_xlate
    +platform ee160000.mmc: ipmmu_of_xlate
    +platform ee300000.sata: ipmmu_of_xlate
     sata_rcar ee300000.sata: ipmmu_of_xlate
     ravb e6800000.ethernet: ipmmu_of_xlate
    -renesas_sdhi_internal_dmac ee100000.mmc: ipmmu_of_xlate
    -renesas_sdhi_internal_dmac ee140000.mmc: ipmmu_of_xlate
    -renesas_sdhi_internal_dmac ee160000.mmc: ipmmu_of_xlate
     rcar-dmac e6700000.dma-controller: ipmmu_of_xlate
     rcar-dmac e7300000.dma-controller: ipmmu_of_xlate
     rcar-dmac e7310000.dma-controller: ipmmu_of_xlate

For some devices, it can be called up to 6 times. All of the duplicates
happen before the device is bound (cfr. "platform" instead of the
actual driver name):

      6 platform ec720000.dma-controller: ipmmu_of_xlate
      6 platform ec700000.dma-controller: ipmmu_of_xlate
      3 platform e6800000.ethernet: ipmmu_of_xlate
      3 platform e6700000.dma-controller: ipmmu_of_xlate
      2 platform fea2f000.fcp: ipmmu_of_xlate
      2 platform fea27000.fcp: ipmmu_of_xlate
      2 platform ee160000.mmc: ipmmu_of_xlate
      2 platform ee140000.mmc: ipmmu_of_xlate
      2 platform ee100000.mmc: ipmmu_of_xlate
      2 platform e7310000.dma-controller: ipmmu_of_xlate
      2 platform e7300000.dma-controller: ipmmu_of_xlate
      1 platform fe9af000.fcp: ipmmu_of_xlate
      1 platform fe96f000.fcp: ipmmu_of_xlate
      1 platform fe950000.fcp: ipmmu_of_xlate
      1 platform ee300000.sata: ipmmu_of_xlate
      1 sata_rcar ee300000.sata: ipmmu_of_xlate
      1 rcar-fcp fea2f000.fcp: ipmmu_of_xlate
      1 rcar-fcp fea27000.fcp: ipmmu_of_xlate
      1 rcar-fcp fe9af000.fcp: ipmmu_of_xlate
      1 rcar-fcp fe96f000.fcp: ipmmu_of_xlate
      1 rcar-fcp fe950000.fcp: ipmmu_of_xlate
      1 rcar-dmac ec720000.dma-controller: ipmmu_of_xlate
      1 rcar-dmac ec700000.dma-controller: ipmmu_of_xlate
      1 rcar-dmac e7310000.dma-controller: ipmmu_of_xlate
      1 rcar-dmac e7300000.dma-controller: ipmmu_of_xlate
      1 rcar-dmac e6700000.dma-controller: ipmmu_of_xlate
      1 ravb e6800000.ethernet: ipmmu_of_xlate

Before, the callback was called just once for each DMA slave device.

Is this intentional?

Thanks!

[1] SATA IOMMU on R-Car Gen3 needs an out-of-tree patch to add it to
    drivers/iommu/ipmmu-vmsa.c:devices_allowlist[].

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

