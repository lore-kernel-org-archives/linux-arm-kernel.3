Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26689C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 22:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0b/tLwjSOgUQJAxtGbeXJPrcphQDVD2nKFEtl8559N0=; b=E3USUfffRcA4EM0aMZJxXDHnkr
	lAH1b1lspAbDZhL2/IiOmGfA7NUFhB+MVaBLAuCWI3UMhvPoYuYVlxSemj1vrWEA/b8CgnerrciBn
	X9qDtLQmJeYlvWpNkdeERFTQjw4NFw+G1fymIT/T/kkL3Xh8X7TShaRF5sAkVFkSuuF2Er+H+wqfN
	ismTT67uQx8ug0THTGZ0aCaSWzPVpxoY476hmktuOQk1edFMJYIH/VZTaLnHFy3GMf6MO58SMpQot
	tFbFz5+RyJGY3N/DGP4nmeRuOxTCcM7YTlxAZ0n5lUL/N5RDf6gi6PiRXfkcykdWBrImszO3+eB91
	tLlONuxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tksoN-0000000FVsx-3IZn;
	Wed, 19 Feb 2025 22:44:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tksmt-0000000FVTn-1bf4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 22:43:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 129516121C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 22:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9861FC4CEEC
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 22:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740005004;
	bh=oB01MPEv8LjdiYQ+OxWvCnlcAnbSN33JSl8xlJVCC9k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PKdANEYzNjjbIr38NUk7z5p+Z9F+jXUNOmA/lCJpQk0PIvqLqO1KpO0bseNfZeNob
	 rLtJk3fBlNATiACZPTodvbpgflqT7l3UK4V7RSUPAq2k7JSBXpDoUiU8OcNRQBWAup
	 97RceaLpTYnX79uBjTd2v9iXYkUuKF/fOxMSmENUd9V0KSXP3vCnuXbx5c6y8PCbxe
	 HrXq0fUDtdNUmRi/saRgQ6+7SHEZK8KUz08YiBb4ITIw/iejPUG24gETgwfO0QILbq
	 rww1v9l2Y4wNnor4HcMEcCjb67uxHLwqtXO6Jmr3eFMSO9Dv7k7ATme476m1vIgAD8
	 z6O9Lj1jIyaFw==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e04cb346eeso404259a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 14:43:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUZ10MtgCp1hwUHD4Z6c00eC5Etj90gUOghZouDPTGD9H+FAVYCajo9mtAaOF/jjaxK4fMgtuniuQhNOUeWdq/K@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1jEZcGwsgEB3crPTC2K/1awnIcoeVfzO+XHLE1lKJFLZ0eerT
	8CK1yuEpxNBImfI5gm2sxcMLKJG8MA/MJKBZUTEiaC10O+T+6rKTVaBy7RE2c3uAuT8t0CT6Tox
	aDpePhVoWYlV+YA0iPLKXVNNoFQ==
X-Google-Smtp-Source: AGHT+IFKS59MJjzGgNFJyErjdo066Kf2RALm9L7HJRWP4YBWsnRrUMaiDEu5+latsq8sxVCx8lc/g5fr4x7Fq4A6sTU=
X-Received: by 2002:a05:6402:381b:b0:5e0:8920:c4c5 with SMTP id
 4fb4d7f45d1cf-5e0a4afb1ddmr203602a12.11.1740005002935; Wed, 19 Feb 2025
 14:43:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1739486121.git.robin.murphy@arm.com> <c2f0ae276fd5a18e1653bae8bb0c51670e35b283.1739486121.git.robin.murphy@arm.com>
In-Reply-To: <c2f0ae276fd5a18e1653bae8bb0c51670e35b283.1739486121.git.robin.murphy@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 19 Feb 2025 16:43:10 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+RA3ojYgqkELOrCd68JHRGPsuObzbRi3RA6eV7NYh0Cw@mail.gmail.com>
X-Gm-Features: AWEUYZnOMA-FyQa1U3tn01tUjPcRrp-PbPJQL6m4k_dHn-Ztt3nE99iHpRmo__k
Message-ID: <CAL_Jsq+RA3ojYgqkELOrCd68JHRGPsuObzbRi3RA6eV7NYh0Cw@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommu: Get DT/ACPI parsing into the proper probe path
To: Robin Murphy <robin.murphy@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Stuart Yoder <stuyoder@gmail.com>, 
	Laurentiu Tudor <laurentiu.tudor@nxp.com>, Nipun Gupta <nipun.gupta@amd.com>, 
	Nikhil Agarwal <nikhil.agarwal@amd.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
	Charan Teja Kalla <quic_charante@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_144327_532766_707FE527 
X-CRM114-Status: GOOD (  31.94  )
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

On Thu, Feb 13, 2025 at 5:49=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
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
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/acpi/arm64/dma.c        |  5 ++++
>  drivers/acpi/scan.c             | 10 +++-----
>  drivers/amba/bus.c              |  2 +-
>  drivers/base/platform.c         |  2 +-
>  drivers/bus/fsl-mc/fsl-mc-bus.c |  2 +-
>  drivers/cdx/cdx.c               |  2 +-
>  drivers/iommu/iommu.c           | 43 ++++++++++++++++++++++++---------
>  drivers/iommu/of_iommu.c        | 10 +++++++-
>  drivers/of/device.c             |  7 +++++-

Acked-by: Rob Herring (Arm) <robh@kernel.org>

>  drivers/pci/pci-driver.c        |  2 +-
>  10 files changed, 60 insertions(+), 25 deletions(-)

