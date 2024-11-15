Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DE4D68BC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 14:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28sARET1Qvfwc/kfA8YISTif9oxfXiX08KxWO0Zur2Q=; b=ORN/mJ4I+cRXvWzXyTd0yWp4nm
	ViHlxC86eTP5PUl3zo/3DIz73vFE13SoxOjbw+1WF7R2FHY12i3I8otILSwrywRU/8oH/aYNpMcBR
	8WaeUbG3+982GNNMynjpqJKLvrD0ZdzDSC0REibMcb2JRWZnCag0Jy2VeemM0G7lddc0z/pPOxiwd
	Gn7juBHioFO9hq3jhD+RPT8XCaioApQs0BYzZDi3M2nna2bQo5eevKlGvzGTS83FoFrVS03g626hQ
	ODcCXtjE26H+GmOQH+0dyww7IQLRPbYjt5JMMF+vgbj0xPPYObxNHq0O88BucIbA0XH8iqoKTJ889
	zFU1r5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBxdR-000000032Vm-3K6g;
	Fri, 15 Nov 2024 14:49:21 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBxbe-0000000329L-2Qyq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 14:47:31 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-211c1bd70f6so15995775ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 06:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731682049; x=1732286849; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=28sARET1Qvfwc/kfA8YISTif9oxfXiX08KxWO0Zur2Q=;
        b=wZsjJab1XCBH2bDoU2qQ8X/Xpyn5YdywKNf1BqXrrhJs2AObvyg0FJiX9f3owu9dCv
         IasDp2avPlS6rsgxTyoYK5qh2Z+fBOrpQmuoay1q8Alt6W94HUKCIF5SqJHFg3I29zWP
         YTXaMmO4gY3o86eLPbmPzTx1I18WfPGQqqJZANyLByJbEauHYKs1XzFbtfsKAoaZphAx
         9PiFOy30/4vT/gbQUpQUP8kL0a0nClNpl55WU2uxej0qpMnzxu/vu3WZdkFGVOoawvEY
         zAWaNuxQQnua3TBHYRwE7r+jELsNxNcgrhqmIzT8XtiyNooABhJ4N3ERzTaNUsjQxiPO
         UsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731682049; x=1732286849;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=28sARET1Qvfwc/kfA8YISTif9oxfXiX08KxWO0Zur2Q=;
        b=MsLuDhEpf+HSj539bL48j098LIQz6LMBsmNFEGV4p9N5Al+Jj2D84W1QFH0IdgZ7Pg
         dKJBGgkQ5excyHkwEJpcSZnnDyQBCqmrIXHeG2TbuLuttA/U2SPH1Lt+nXWQ+V/6j8qq
         ey1DDFO67B6b3JX1vGClRLpBOn/vT7KvNZHx6y/gFSl3hopejuCYkIIifc7drO9BPcxk
         C0q0PP4G7e5ayrpQLexNcUBcWcX6hU45kTggWc4jSufyWVyMfNqGOQMDQ4Wl7aUiHQ+9
         HAYN3EKz+EMVOMxHdI5fr/SptKtuFg7KLHqjJlr2IJcxJQD/5gybN1WDJrOmpeeouW8J
         QHdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUnZFScw5ieHS8zlo3v1Ml51HRe+6QUYhHZTyOhGNe6voSm9Nt17zvDKfT1zt/D9WFYIdhbq2r690hNNTw9qf8@lists.infradead.org
X-Gm-Message-State: AOJu0YwyKZcvkJEKOStShTe7Za/lhiTqc8f+nUeNDswYFkxkhCcSdI7e
	qf/bW73KGJL+apmKeZFkW5amZkqM5Sf2ya85U8oL35GNtxxgosXTYrPFk4Rkmw==
X-Google-Smtp-Source: AGHT+IGRUIkevz/pH5H9stH+NwULAos/5+zuVi7FkeklDpdipWBtq5/BITL7lD88Phwhg2XyNYyRxQ==
X-Received: by 2002:a17:902:ea04:b0:20a:fd4e:fef6 with SMTP id d9443c01a7336-211c0f1edf4mr113011435ad.8.1731682049251;
        Fri, 15 Nov 2024 06:47:29 -0800 (PST)
Received: from thinkpad ([117.193.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f54a2csm12920475ad.256.2024.11.15.06.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 06:47:28 -0800 (PST)
Date: Fri, 15 Nov 2024 20:17:20 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	"open list:PCI DRIVER FOR GENERIC OF HOSTS" <linux-pci@vger.kernel.org>,
	"moderated list:PCI DRIVER FOR GENERIC OF HOSTS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] PCI: check bridge->bus in pci_host_common_remove
Message-ID: <20241115144720.ovsyq2ani47norby@thinkpad>
References: <20241028084644.3778081-1-peng.fan@oss.nxp.com>
 <20241115062005.6ifvr6ens2qnrrrf@thinkpad>
 <PAXPR04MB8459D1507CA69498D8C38E0488242@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB8459D1507CA69498D8C38E0488242@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_064730_626403_7464334C 
X-CRM114-Status: GOOD (  52.25  )
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

On Fri, Nov 15, 2024 at 10:14:10AM +0000, Peng Fan wrote:
> Hi Manivannan,
> 
> > Subject: Re: [PATCH] PCI: check bridge->bus in
> > pci_host_common_remove
> > 
> > On Mon, Oct 28, 2024 at 04:46:43PM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > When PCI node was created using an overlay and the overlay is
> > > reverted/destroyed, the "linux,pci-domain" property no longer exists,
> > > so of_get_pci_domain_nr will return failure. Then
> > > of_pci_bus_release_domain_nr will actually use the dynamic IDA,
> > even
> > > if the IDA was allocated in static IDA. So the flow is as below:
> > > A: of_changeset_revert
> > >     pci_host_common_remove
> > >      pci_bus_release_domain_nr
> > >        of_pci_bus_release_domain_nr
> > >          of_get_pci_domain_nr      # fails because overlay is gone
> > >          ida_free(&pci_domain_nr_dynamic_ida)
> > >
> > > With driver calls pci_host_common_remove explicity, the flow
> > becomes:
> > > B pci_host_common_remove
> > >    pci_bus_release_domain_nr
> > >     of_pci_bus_release_domain_nr
> > >      of_get_pci_domain_nr      # succeeds in this order
> > >       ida_free(&pci_domain_nr_static_ida)
> > > A of_changeset_revert
> > >    pci_host_common_remove
> > >
> > > With updated flow, the pci_host_common_remove will be called
> > twice, so
> > > need to check 'bridge->bus' to avoid accessing invalid pointer.
> > >
> > > Fixes: c14f7ccc9f5d ("PCI: Assign PCI domain IDs by ida_alloc()")
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > 
> > I went through the previous discussion [1] and I couldn't see an
> > agreement on the point raised by Bjorn on 'removing the host bridge
> > before the overlay'.
> 
> This patch is an agreement to Bjorn's idea. 
> 
> I have added pci_host_common_remove to remove host bridge
> before removing overlay as I wrote in commit log.
> 
> But of_changeset_revert will still runs into pci_host_
> common_remove to remove the host bridge again. Per
> my view, the design of of_changeset_revert to remove
> the device tree node will trigger device remove, so even
> pci_host_common_remove was explicitly used before
> of_changeset_revert. The following call to of_changeset_revert
> will still call pci_host_common_remove.
> 
> So I did this patch to add a check of 'bus' to avoid remove again.
> 

Ok. I think there was a misunderstanding. Bjorn's example driver,
'i2c-demux-pinctrl' applies the changeset, then adds the i2c adapter for its
own. And in remove(), it does the reverse.

But in your case, the issue is with the host bridge driver that gets probed
because of the changeset. While with 'i2c-demux-pinctrl' driver, it only
applies the changeset. So we cannot compare both drivers. I believe in your
case, 'i2c-demux-pinctrl' becomes 'jailhouse', isn't it?

So in your case, changeset is applied by jailhouse and that causes the
platform device to be created for the host bridge and then the host bridge
driver gets probed. So during destroy(), you call of_changeset_revert() that
removes the platform device and during that process it removes the host bridge
driver. The issue happens because during host bridge remove, it calls
pci_remove_root_bus() and that tries to remove the domain_nr using
pci_bus_release_domain_nr().

But pci_bus_release_domain_nr() uses DT node to check whether to free the
domain_nr from static IDA or dynamic IDA. And because there is no DT node exist
at this time (it was already removed by of_changeset_revert()), it forces
pci_bus_release_domain_nr() to use dynamic IDA even though the IDA was initially
allocated from static IDA.

I think a neat way to solve this issue would be by removing the OF node only
after removing all platform devices/drivers associated with that node. But I
honestly do not know whether that is possible or not. Otherwise, any other
driver that relies on the OF node in its remove() callback, could suffer from
the same issue. And whatever fix we may come up with in PCI core, it will be a
band-aid only.

I'd like to check with Rob first about his opinion.

- Mani

> > 
> > I do think this is a valid point and if you do not think so, please state
> > the reason.
> 
> I agree Bjorn's view, this patch is output of agreement as I write above.
> 
> Thanks,
> Peng.
> 
> > 
> > - Mani
> > 
> > [1]
> > https://lore.kernel.org/lkml/20230913115737.GA426735@bhelgaas/
> > 
> > > ---
> > >
> > > V1:
> > >  Not sure to keep the fixes here. I could drop the Fixes tag if it is
> > > improper.
> > >  This is to revisit the patch [1] which was rejected last year. This
> > > new flow is using the suggest flow following Bjorn's suggestion.
> > >  But of_changeset_revert will still invoke plaform_remove and then
> > > pci_host_common_remove. So worked out this patch together with a
> > patch
> > > to jailhouse driver as below:
> > >  static void destroy_vpci_of_overlay(void)  {
> > > +       struct device_node *vpci_node = NULL;
> > > +
> > >         if (overlay_applied) {
> > > +#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,6,0)
> > > +               vpci_node = of_find_node_by_path("/pci@0");
> > > +               if (vpci_node) {
> > > +                       struct platform_device *pdev =
> > of_find_device_by_node(vpci_node);
> > > +                       if (!pdev)
> > > +                               printk("Not found device for /pci@0\n");
> > > +                       else {
> > > +                               pci_host_common_remove(pdev);
> > > +                               platform_device_put(pdev);
> > > +                       }
> > > +               }
> > > +               of_node_put(vpci_node); #endif
> > > +
> > >                 of_changeset_revert(&overlay_changeset);
> > >
> > >  [1]
> > >
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2F
> > lore
> > > .kernel.org%2Flkml%2F20230908224858.GA306960%40bhelgaas%2
> > FT%2F%23md12e
> > >
> > 6097d91a012ede78c997fc5abf460029a569&data=05%7C02%7Cpeng.
> > fan%40nxp.com
> > > %7C025e209cf9264c4240fa08dd053d9211%7C686ea1d3bc2b4c6fa
> > 92cd99c5c301635
> > > %7C0%7C0%7C638672484189046564%7CUnknown%7CTWFpbGZsb
> > 3d8eyJFbXB0eU1hcGki
> > >
> > OnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIl
> > dUIjoyfQ
> > > %3D%3D%7C0%7C%7C%7C&sdata=uCo5MO5fEqCjBzwZ8hdnsf3ORh
> > SedhrJWvNOCCMNvG0%
> > > 3D&reserved=0
> > >
> > >  drivers/pci/controller/pci-host-common.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/pci-host-common.c
> > > b/drivers/pci/controller/pci-host-common.c
> > > index cf5f59a745b3..5a9c29fc57cd 100644
> > > --- a/drivers/pci/controller/pci-host-common.c
> > > +++ b/drivers/pci/controller/pci-host-common.c
> > > @@ -86,8 +86,10 @@ void pci_host_common_remove(struct
> > platform_device *pdev)
> > >  	struct pci_host_bridge *bridge = platform_get_drvdata(pdev);
> > >
> > >  	pci_lock_rescan_remove();
> > > -	pci_stop_root_bus(bridge->bus);
> > > -	pci_remove_root_bus(bridge->bus);
> > > +	if (bridge->bus) {
> > > +		pci_stop_root_bus(bridge->bus);
> > > +		pci_remove_root_bus(bridge->bus);
> > > +	}
> > >  	pci_unlock_rescan_remove();
> > >  }
> > >  EXPORT_SYMBOL_GPL(pci_host_common_remove);
> > > --
> > > 2.37.1
> > >
> > 
> > --
> > மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்

