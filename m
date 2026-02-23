Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF798EC1120
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 18:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIAnjKMCDZAXtn8ufbab6l+hlrTyq4DHuja1V9/VDeY=; b=loXcimNRWGTxX893cnsfL62e5z
	kWDbxFZx6MWhyBHywfT9ll7Zw+flZJk2q7SZ065VuoZzXDyyLxLhs1whY2PKA+BSQvZ3Xz1fa6EOs
	wFktAvH5dpwwfiWuAikJATb7+s0ZA5xFLj/Ie6Bd3QaHca0UXQVGRFkzxyiU1bvfyo9r8mH6iJZz5
	mBi3VddbaUVwvpAXX243Koh0+kxs3Avg09enBO2zY1BRjMd61CQitWXVb7fiDJ9gBGA/jDgO5ArkY
	j6aV302KcuGRy+F5IO8PR1Y00WL5knsqYXmPCxHQ34nuycRynO1dsp5xvY2pljgwurlKNhGJJSYxv
	pEgypSzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuawq-00000000tHC-0HZq;
	Mon, 23 Feb 2026 18:46:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuawp-00000000tH5-0JDU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 18:46:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53AD860180
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 18:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 007EBC2BCB6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 18:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771872381;
	bh=6y9wgSQ25UN1x75PZbsuS9ifUoczwEmoG+d0hEiX4TE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZQTgLZBpSxHuSK6C4smiTal2wlWbhNFcgPlWmW9oNr5XemqHTJ1MzYWnX+tdTTwBv
	 WUKHVYpwkoVB8XF8zF0uaKZG2gx1MEmmr1DwROIoFtsJTZVScOWwyKWRlYExfS0Arb
	 trke6iNh6BCs2QT0zvXwVn67OZS9RgyafCjtrtxFLhpl71+6qmAve8wEieYMH2bBcS
	 XbQfn7BF4z6mXme8YG/jWJx5oZqKUH1TUTWaC2hHUD5j8B1zy6OJACbGZugcyrbt9J
	 hDMyU8+GGB8v1J6tqqfcDqCq9lexqhfHXWX5CEY2K5mRuGr9T2N2kM6Dd9kvKnUWPb
	 dmVdxrkDpPWnw==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-66f747175d8so2731730eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 10:46:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXFzIaYoljGnfAaNIXvIUmKOlQSujaF4fjBbfXgE1j8MhOkcVrXwuKEqc03GWgDeUFCywYOO8veQeICBD6hZmN5@lists.infradead.org
X-Gm-Message-State: AOJu0YymUOevgGCpKcHFks7aKjYnmSBKdauDfVRxI1p30U8020xHMszP
	5PjhjLhQbfqqWEOl9vloOS1RlS2r418EAaosXUP7jihDmzKMUDJc+vSy1HCoZUPSfcHZ2/vvlLw
	e1XKdDkTcDT3HwIUQV/oatJO22SthlIA=
X-Received: by 2002:a05:6820:2108:b0:678:cf78:1e9a with SMTP id
 006d021491bc7-679c44eb59bmr4946365eaf.35.1771872379888; Mon, 23 Feb 2026
 10:46:19 -0800 (PST)
MIME-Version: 1.0
References: <20260217-d3cold-v2-1-89b322864043@oss.qualcomm.com> <20260223181019.GA3700351@bhelgaas>
In-Reply-To: <20260223181019.GA3700351@bhelgaas>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 23 Feb 2026 19:46:08 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0h8dQ10oH4KQM8Pdv0jvXyTE6yD1fn5eBPkS_jDYgA8gQ@mail.gmail.com>
X-Gm-Features: AaiRm50BsGbnxI8_7fxOA2OT7oiK5grddQjgSgxcA9FV4RG6FtL9qb_y2TUSt-g
Message-ID: <CAJZ5v0h8dQ10oH4KQM8Pdv0jvXyTE6yD1fn5eBPkS_jDYgA8gQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] PCI: host-common: Add helper to determine host
 bridge D3cold eligibility
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <will@kernel.org>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org
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

On Mon, Feb 23, 2026 at 7:10=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> [+cc Rafael, linux-pm]
>
> On Tue, Feb 17, 2026 at 04:49:06PM +0530, Krishna Chaitanya Chundru wrote=
:
> > Add a common helper, pci_host_common_can_enter_d3cold(), to determine
> > whether a PCI host bridge can safely transition to D3cold.
> >
> > This helper is intended to be used by PCI host controller drivers to
> > decide whether they may safely put the host bridge into D3cold based on
> > the power state and wakeup capabilities of downstream endpoints.
> >
> > The helper walks all devices on the bridge's primary bus and only allow=
s
> > the host bridge to enter D3cold if all PCIe endpoints are already in
> > PCI_D3hot. This ensures that we do not power off the host bridge while
> > any active endpoint still requires the link to remain powered.
> >
> > For devices that may wake the system, the helper additionally requires
> > that the device supports PME wake from D3cold (via WAKE#). Devices that
> > do not have wakeup enabled are not restricted by this check and do not
> > block the host bridge from entering D3cold.
> >
> > Devices without a bound driver and with PCI not enabled via sysfs are
> > treated as inactive and therefore do not prevent the host bridge from
> > entering D3cold. This allows controllers to power down more aggressivel=
y
> > when there are no actively managed endpoints.
>
> This series is currently structured so it's only applicable to native
> host bridge drivers, i.e., things using DT.  Is there anything that
> prevents using D3cold for host bridges in ACPI systems?

Do you mean in principle or in practice?

x86 platforms don't support PCI host bridge PM AFAICS and the ACPI
driver doesn't support PM either.  I'd rather not add it ad hoc
because of this patch series.

> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.=
com>
> > ---
> >  drivers/pci/controller/pci-host-common.c | 45 ++++++++++++++++++++++++=
++++++++
> >  drivers/pci/controller/pci-host-common.h |  2 ++
> >  2 files changed, 47 insertions(+)
> >
> > diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/con=
troller/pci-host-common.c
> > index d6258c1cffe5ec480fd2a7e50b3af39ef6ac4c8c..b0a4a3c995e80e0245657f0=
273a349334071013c 100644
> > --- a/drivers/pci/controller/pci-host-common.c
> > +++ b/drivers/pci/controller/pci-host-common.c
> > @@ -106,5 +106,50 @@ void pci_host_common_remove(struct platform_device=
 *pdev)
> >  }
> >  EXPORT_SYMBOL_GPL(pci_host_common_remove);
> >
> > +static int pci_host_common_check_d3cold(struct pci_dev *pdev, void *us=
erdata)
> > +{
> > +     bool *d3cold_allow =3D userdata;
> > +
> > +     if (pci_pcie_type(pdev) !=3D PCI_EXP_TYPE_ENDPOINT)
> > +             return 0;
> > +
> > +     if (!pdev->dev.driver && !pci_is_enabled(pdev))
> > +             return 0;
> > +
> > +     if (pdev->current_state !=3D PCI_D3hot)
> > +             goto exit;
> > +
> > +     if (device_may_wakeup(&pdev->dev) && !pci_pme_capable(pdev, PCI_D=
3cold))
> > +             goto exit;
> > +
> > +     return 0;
> > +exit:
> > +     *d3cold_allow =3D false;
> > +     return -EBUSY;
> > +}
> > +
> > +/**
> > + * pci_host_common_can_enter_d3cold - Determine whether a host bridge =
may enter D3cold
> > + * @bridge: PCI host bridge to check
> > + *
> > + * Walk downstream PCIe endpoint devices and determine whether the hos=
t bridge
> > + * is permitted to transition to D3cold.
> > + *
> > + * The host bridge may enter D3cold only if all active PCIe endpoints =
are in
> > + * %PCI_D3hot and any wakeup-enabled endpoint is capable of generating=
 PME from
> > + * D3cold. Inactive endpoints are ignored.
> > + *
> > + * Return: %true if the host bridge may enter D3cold, otherwise %false=
.
> > + */
> > +bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge)
> > +{
> > +     bool d3cold_allow =3D true;
> > +
> > +     pci_walk_bus(bridge->bus, pci_host_common_check_d3cold, &d3cold_a=
llow);
> > +
> > +     return d3cold_allow;
> > +}
> > +EXPORT_SYMBOL_GPL(pci_host_common_can_enter_d3cold);
> > +
> >  MODULE_DESCRIPTION("Common library for PCI host controller drivers");
> >  MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/con=
troller/pci-host-common.h
> > index b5075d4bd7eb31fbf1dc946ef1a6afd5afb5b3c6..18a731bca058828340bca84=
776d0e91da1edbbf7 100644
> > --- a/drivers/pci/controller/pci-host-common.h
> > +++ b/drivers/pci/controller/pci-host-common.h
> > @@ -20,4 +20,6 @@ void pci_host_common_remove(struct platform_device *p=
dev);
> >
> >  struct pci_config_window *pci_host_common_ecam_create(struct device *d=
ev,
> >       struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
> > +
> > +bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge);
> >  #endif
> >
> > --
> > 2.34.1
> >

