Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0F7C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 14:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNHDYvZ+kXQIgJtW4CpMeV/F9LD9o9x0KLwHdWA+41Y=; b=UC8sY+H9Re9ou1n+RbX9VnOF+Z
	dU3pxiou1YJxwPZsQ78+tjzwmqbyVM++9CWKqK49uZlgIYu9Ip6o3P8Hr/BYfwXAqZ1ern+F8P409
	1aSJIGEKRwxdTLiV/HdZ7Q7/zZQBJewiMUa6KJFC2B3qYy8MyKu1enepsNN71RS9CAQYDkuD4h5ya
	UhD+KpPjZxzGl36W88Ls0BWphgI/wxfOIcVVn35k1Qk8sCUoJGaYRhUX9AgG54i7ebUX3do6v+LEJ
	DcU0ropqLIaHRbLxJW8eI6fze94NmTWVck0Ns9V1id4aujxJ0fySeTYziHIakMaJqCH3Mk43u+N9G
	eGuQqTVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6sZF-00000004VmI-34Qe;
	Mon, 21 Apr 2025 14:56:17 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6sWS-00000004VQS-232b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 14:53:25 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2255003f4c6so45990875ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 07:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745247204; x=1745852004; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TNHDYvZ+kXQIgJtW4CpMeV/F9LD9o9x0KLwHdWA+41Y=;
        b=MOfPUB81EVbj7wcESb1cIXB6exUBWdWzTUeNiiRbP6flN1aJMsxj1ryy3GL2hz5X5t
         9/ffNhTOX10LvR8vRVxiT3v/fxGOz8/wdiNWdtOw8EExIshMlDngCQ1w0cv9hjTWgSHw
         4pxukccRXgz+/24xSBqk/Qw2fy0bye+VII302QNIEXtnhC5YPaAJkCV0c3PInuDC/cZO
         8KSSRNk9NRvwYY7U+2TsQQZ3XfNlsD0O7J34wM4/5MKs/P8+HMGr5QzRK2kWLwIgXYOf
         kz4VW9ABjX61nzSrC3vRtDOcLm70+N34/I1QEMxToZoaJqtZa7C4/7DHq63IhAxH1DXF
         uTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745247204; x=1745852004;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TNHDYvZ+kXQIgJtW4CpMeV/F9LD9o9x0KLwHdWA+41Y=;
        b=VcQFhjc9JEG50rd0apzSt5Gu4JwmMI0aRiXDSafHpMV2zaa6Mhy4K3UuEyptMrBTws
         +WL5nJCuHVdXA282nNBtYAj5NICk/GXh8bv7J6m3ERXAwRFzOXlLkZlsN+wSpfaRhGeC
         sjDHFF6vhswskJlD8YLoz7JDFMoYm/m8513nSqaaO6S5pc2Z0hAes9JZq+AdoCp8NfgJ
         /FGlz/tN2TcVthI+GWI3XIjSZ/WvMvTrj146+kAU7aRo2ykAKnv6nArE5Nx1TNA+avW4
         cLRXvCw0uSh9LJg7tBBerDs0YzXCU6xIpI3ID80c7CtcEOThDin4VeS1v26j0M7Nv8nJ
         dQHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO+5hHRPhCVqVW7aHx3SijkQa+9AVASHk8R8/o0tvWkGg9Vx5mzUPFNO5kGDvz/YHM1Jc0srcKmrhAu1LHT0lM@lists.infradead.org
X-Gm-Message-State: AOJu0YyKzIlLFu84OcW+SsWqWoym9zxtNHJHKi0i5JPx5/Wrhb0vaVwY
	lXR71OsXDCfI8NNNt/ktmNChWZe/avjmqbNyM5j2gVRmhEszWOvLH9OIcvvuKg==
X-Gm-Gg: ASbGncsl12HwJbFPtd5rNuRRyuoeLjJXTE/vAFPbjoS1dALPDeDdO2wTO+u/Kd/Twky
	BWVKTrfmMciGST8xJuykt1kL5swDGOae8B4UTqTWwKzq4SOeMPDSYfR3lvtwMXJgM2U4C2e8jjB
	Y+7U+4vhRkHpRxj85ql/Raekg/Diz99OI265H3cqTyFNKUuXS+kwvHcxHLlCrmOIJksUJqygKI6
	C/faVi6qL5Q0rOlXhTPQJ8gw6yIcuk0qIzlZ5+L8zVkNayINdXfoCu7UV8tr3CjHc3GHDKrGjoQ
	yRyKmp0rA8yeTjvra782GYXfDTTr8yYMYmwJ1mW7Uv1cDIEQaNiG
X-Google-Smtp-Source: AGHT+IEFdCxUF0IGkc39Y6ivCpK40FOP5pObjbZbRz+JR102E0UDzHVcUjHWjvl2BLeEpo3bJDhIxA==
X-Received: by 2002:a17:903:228f:b0:223:653e:eb09 with SMTP id d9443c01a7336-22c5356e485mr145692145ad.7.1745247203811;
        Mon, 21 Apr 2025 07:53:23 -0700 (PDT)
Received: from thinkpad ([120.56.203.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ecec61sm66006875ad.182.2025.04.21.07.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 07:53:23 -0700 (PDT)
Date: Mon, 21 Apr 2025 20:23:18 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: Niklas Cassel <cassel@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com, 
	heiko@sntech.de, robh@kernel.org, jingoohan1@gmail.com, 
	thomas.richard@bootlin.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] PCI: dw-rockchip: Configure max payload size on host init
Message-ID: <vc6z6pzgk2sjgkghnwfzlmj3dblrvpkfnsmnlb2nnkj2leju7t@uxy3kthse7g6>
References: <20250417165219.GA115235@bhelgaas>
 <22720eef-f5a3-4e72-9c41-35335ec20f80@163.com>
 <225CC628-432C-4E88-AF2B-17C948B3790B@kernel.org>
 <8af8a418-b808-4a14-9969-1c6d549e1633@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8af8a418-b808-4a14-9969-1c6d549e1633@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_075324_531738_71EEA0AF 
X-CRM114-Status: GOOD (  32.11  )
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

On Sat, Apr 19, 2025 at 01:21:54AM +0800, Hans Zhang wrote:
> 
> 
> On 2025/4/18 22:55, Niklas Cassel wrote:
> > 
> > 
> > On 18 April 2025 14:33:08 CEST, Hans Zhang <18255117159@163.com> wrote:
> > > 
> > > Dear Bjorn,
> > > 
> > > Thanks your for reply. Niklas and I attempted to modify the relevant logic in drivers/pci/probe.c and found that there was a lot of code judging the global variable pcie_bus_config. At present, there is no good method. I will keep trying.
> > > 
> > > I wonder if you have any good suggestions? It seems that the code logic regarding pcie_bus_config is a little complicated and cannot be modified for the time being?
> > 
> > 
> > Hans,
> > 
> > If:
> > 
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index 364fa2a514f8..2e1c92fdd577 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -2983,6 +2983,13 @@ void pcie_bus_configure_settings(struct pci_bus *bus)
> >           if (!pci_is_pcie(bus->self))
> >                   return;
> >    +       /*
> > +        * Start off with DevCtl.MPS == DevCap.MPS, unless PCIE_BUS_TUNE_OFF.
> > +        * This might get overriden by a MPS strategy below.
> > +        */
> > +       if (pcie_bus_config != PCIE_BUS_TUNE_OFF)
> > +               smpss = pcie_get_mps(bus->self);
> > +
> 
> Dear Niklas,
> 
> Thank you very much for your reply and thoughts.
> 
> pcie_get_mps: Returns maximum payload size in bytes
> 
> I guess you want to obtain the DevCap MPS. But the purpose of the smpss
> variable is to save the DevCtl MPS.
> 
> >           /*
> >            * FIXME - Peer to peer DMA is possible, though the endpoint would need
> >            * to be aware of the MPS of the destination.  To work around this,
> > 
> > 
> > 
> > does not work, can't you modify the code slightly so that it works?
> > 
> > I haven't tried myself, but considering that it works when walking the bus, it seems that it should be possible to get something working.
> > 
> 
> 
> After making the following modifications, my test shows that it is normal.
> If the consideration is not comprehensive. Could Bjorn and Niklas please
> review my revisions?
> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 364fa2a514f8..5b54f1b0a91d 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2951,8 +2951,7 @@ static int pcie_bus_configure_set(struct pci_dev *dev,
> void *data)
>         if (!pci_is_pcie(dev))
>                 return 0;
> 
> -       if (pcie_bus_config == PCIE_BUS_TUNE_OFF ||
> -           pcie_bus_config == PCIE_BUS_DEFAULT)
> +       if (pcie_bus_config == PCIE_BUS_TUNE_OFF)
>                 return 0;
> 
>         mps = 128 << *(u8 *)data;
> @@ -2991,7 +2990,8 @@ void pcie_bus_configure_settings(struct pci_bus *bus)
>         if (pcie_bus_config == PCIE_BUS_PEER2PEER)
>                 smpss = 0;
> 
> -       if (pcie_bus_config == PCIE_BUS_SAFE) {
> +       if ((pcie_bus_config == PCIE_BUS_SAFE) ||
> +           (pcie_bus_config != PCIE_BUS_TUNE_OFF)) {
>                 smpss = bus->self->pcie_mpss;
> 
>                 pcie_find_smpss(bus->self, &smpss);
> 
> 

As I replied to Niklas, I'd like to limit the changes to platforms having
controller drivers. So here is my proposal:

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 364fa2a514f8..d32a0f90beb1 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -3228,6 +3228,17 @@ int pci_host_probe(struct pci_host_bridge *bridge)
         */
        pci_assign_unassigned_root_bus_resources(bus);
 
+       if (pcie_bus_config != PCIE_BUS_TUNE_OFF) {
+               /* Configure root ports MPS to be MPSS by default */
+               for_each_pci_bridge(dev, bus) {
+                       if (pci_pcie_type(dev) != PCI_EXP_TYPE_ROOT_PORT)
+                               continue;
+
+                       pcie_write_mps(dev, 128 << dev->pcie_mpss);
+                       pcie_write_mrrs(dev);
+               }
+       }
+
        list_for_each_entry(child, &bus->children, node)
                pcie_bus_configure_settings(child);

- Mani

-- 
மணிவண்ணன் சதாசிவம்

