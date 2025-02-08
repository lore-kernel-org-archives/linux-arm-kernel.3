Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADA8C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 10:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BoaAnmRJfikjMJJ5mT1KSvwU4+ZQgSKozzj6VL4ELUQ=; b=0Op2s90YMIETtGjfuvk1MRXgBc
	h69vj3HLmS+eD2gTMBS5OmQ8E0s8q0KA6vHHC5LcR/TFo1EvJwXdeJ6xqxO8n53FUcT7GP2f70PCy
	/KVbf72fxmErSeI81WbyW4WtMW3riT2zzlXClkCYziDD+91Nq5iNT55YQtJ4O6a0aDFYJ5wTgSOne
	yTfOtzSprTvJT8ti412EBbPxJpU/tBW92N/TPfxWMgitZtpbYnvQsd0AIRvQAQL/7wTgky09/EYGZ
	WFvXIG8+aD3LE0G3s6kjQWHH5XALEBfnxma0k/n36TBrXtj5A9q6FT7MjQtviqFg76G9/8z+dDOQa
	jtu6uW/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgiDg-0000000ClPC-0PK6;
	Sat, 08 Feb 2025 10:37:52 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgiCH-0000000ClCY-1giH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 10:36:26 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21f62cc4088so15876025ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Feb 2025 02:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739010984; x=1739615784; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BoaAnmRJfikjMJJ5mT1KSvwU4+ZQgSKozzj6VL4ELUQ=;
        b=LwAjYH8v73WlxnJIiyw3ckTfZqPazTCKUiMIa/qPNVryCiOL3hEKnXIR1TM6zrKHWb
         KjUVxOLVQkWIBctb2oZZr5sh7TktFMIGCY3VTGIhomfdU8B+kDtub3sXpIXZMReosj4X
         Q2SPh+qIOnskkS44hP7aCI4lP2pBceNwQOR6NjSIAZu5f2liC2nd2654mcKxOEJTYhW2
         QK/qpt6KgSl0BjJfD746rCq3+I89X9w0xWS4wTiMTakaDhhkvfR6Z3lmAGE6tcjhNtyF
         Ryd5e0MEZMfaZnn2sW0N3c2Lwit+gecg4R2ehFRwJyzZdihVUKY+CgjJdtaMpeNRH7f0
         HjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739010984; x=1739615784;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BoaAnmRJfikjMJJ5mT1KSvwU4+ZQgSKozzj6VL4ELUQ=;
        b=RUTLfccR5gd88iASigI03aeOXk+u0eHgW2lK4c8xXd6JcfxqC6ryTI/rbxk5ZJ+WSl
         MgJRdKkUsKTgP8MN0e2IO446JxHFfqs5hOP/TKhLD+bX9AQ5z9TVz7TAs0RvBFm4GcDY
         0iyXjqz00OWP2mBtiQCZc6cZ05jG7OJLKJsOzHmpiy1rhXj46bZKCmLm0v12mNQQnCdt
         7wA9EVFR5ZJKLMiA0OOjzA8Ek1kmJHM/za83dXsWA4o6spveQEiggAolf8oKxTBMS8Gj
         wsthBOkU5hpr4vFbPpbuf5YjG/Qu2KKR7Dj6FFtoOCxbBN369OZIW89CDE6ewmuGpTqT
         /TvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxhqmyrL8fFm93NguypL8vZeG88XKW14biEVGKcWR8sdEBZovy169ryY9ph2wi9dOgvM4hxfuMNInkEAGd2RUB@lists.infradead.org
X-Gm-Message-State: AOJu0YwcaOrCtABTTenINZtIaQan3cnXjpWS9dq7eugN9kC7Kt1w93lh
	f2cRupvXgALQF+iJ/EA85qvnBQ6O2e0dlKSYvDLw3JQIImROS/UloRDWpfUbgw==
X-Gm-Gg: ASbGnctZYXyGn+aK7pLGlvw/ru3YPQC3SwTzfRJthxwKRwqaPOH7beFx2YQ93M9bBhA
	w5MWbaw6j7f+nnLJQym9ydsWIfpkzrTGBh4FbR+vfxnwKc0H8J+YDVlV7e77Ac6ILWB/bb0HPR2
	4oFUTXJNLriehCL+PSJtdW+Op9Nl8d/OgnkGjueRWBDMAsGS/I7HXfvEnsJRYdoD8dADI2uUTzJ
	G675TjazxQZJ8gqLSbpx6Wb1EA9X5jGdskdJ4ZkcWWCdkEwlzMDw1jxFAyftKCeCOuvx5U1RIqK
	Ut+/BmtkGM4H245A88MSBugn
X-Google-Smtp-Source: AGHT+IE9RgAXmno9t4rWIPgdel/xLwnILZhf5pQ1KhWjVCU87NJl/bhU5fdwOYmDPaXFBy/uv0e86Q==
X-Received: by 2002:a17:903:2309:b0:215:6b4c:89fa with SMTP id d9443c01a7336-21f4e1ced38mr93272025ad.8.1739010984539;
        Sat, 08 Feb 2025 02:36:24 -0800 (PST)
Received: from thinkpad ([120.60.69.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d8ffsm44251845ad.150.2025.02.08.02.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 02:36:24 -0800 (PST)
Date: Sat, 8 Feb 2025 16:06:18 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Wilson Ding <dingwei@marvell.com>
Cc: "cassel@kernel.org" <cassel@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanghoon Lee <salee@marvell.com>
Subject: Re: [EXTERNAL] Re: [PATCH 1/1] PCI: armada8k: Add link-down handle
Message-ID: <20250208103618.2binrjgry7ghoavc@thinkpad>
References: <20241112213255.GA1861331@bhelgaas>
 <AD287CCE-9FFE-49BC-B9CA-B5CED4F05AF1@linaro.org>
 <BY3PR18MB46737FB5FDBD75CF31B505B8A7EB2@BY3PR18MB4673.namprd18.prod.outlook.com>
 <BY3PR18MB4673207A36B2CD7C3B75EBA0A7EB2@BY3PR18MB4673.namprd18.prod.outlook.com>
 <20250207175759.jzmoox5mke3rachy@thinkpad>
 <BY3PR18MB46738F5857319F9637FA5050A7F12@BY3PR18MB4673.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BY3PR18MB46738F5857319F9637FA5050A7F12@BY3PR18MB4673.namprd18.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_023625_451107_53BF20DE 
X-CRM114-Status: GOOD (  55.23  )
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

On Fri, Feb 07, 2025 at 06:46:22PM +0000, Wilson Ding wrote:
> 
> 
> > -----Original Message-----
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: Friday, February 7, 2025 9:58 AM
> > To: Wilson Ding <dingwei@marvell.com>; cassel@kernel.org
> > Cc: Bjorn Helgaas <helgaas@kernel.org>; lpieralisi@kernel.org;
> > thomas.petazzoni@bootlin.com; kw@linux.com; robh@kernel.org;
> > bhelgaas@google.com; linux-pci@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Sanghoon Lee
> > <salee@marvell.com>
> > Subject: [EXTERNAL] Re: [PATCH 1/1] PCI: armada8k: Add link-down handle
> > 
> > + Niklas (who was interested in link down handling) On Sat, Feb 01, 2025
> > + at 11: 05: 56PM +0000, Wilson Ding wrote: > > On November 13, 2024 3: 
> > + 02: 55 AM GMT+05: 30, Bjorn Helgaas > > <mailto: helgaas@ kernel. org>
> > + wrote: > >
> > 
> > + Niklas (who was interested in link down handling)
> > 
> > On Sat, Feb 01, 2025 at 11:05:56PM +0000, Wilson Ding wrote:
> > > > On November 13, 2024 3:02:55 AM GMT+05:30, Bjorn Helgaas
> > > > <mailto:helgaas@kernel.org> wrote:
> > > > >In subject:
> > > > >
> > > > >  PCI: armada8k: Add link-down handling
> > > > >
> > > > >On Mon, Nov 11, 2024 at 10:48:13PM -0800, Jenishkumar Maheshbhai
> > > > Patel wrote:
> > > > >> In PCIE ISR routine caused by RST_LINK_DOWN we schedule work to
> > > > >> handle the link-down procedure.
> > > > >> Link-down procedure will:
> > > > >> 1. Remove PCIe bus
> > > > >> 2. Reset the MAC
> > > > >> 3. Reconfigure link back up
> > > > >> 4. Rescan PCIe bus
> > > > >
> > > > >s/PCIE/PCIe/
> > > > >
> > > > >Rewrap to fill 75 columns.
> > > > >
> > > > >I assume this basically removes a Root Port (and the hierarchy
> > > > >below
> > > > >it) if the link goes down, and then resets the MAC and tries to
> > > > >bring up the link and enumerate the hierarchy again.
> > > > >
> > > > >No other drivers do this, so why does armada8k need it?  Is this to
> > > > >work around some unreliable link?
> > > >
> > > > Certainly Qcom IPs have this same feature and I was also looking to
> > > > implement it. But the link down should not be handled by this in the
> > controller driver.
> > > >
> > > > Instead, it should be tied to bus reset in the core and the reset
> > > > should be done through a callback implemented in the controller
> > > > drivers. This way, the reset cannot happen in the back of PCI core and client
> > drivers.
> > > >
> > > > That said, the Link down IRQ received by this driver should also be
> > > > propagated back to the PCI core and the core should then call the
> > > > callback to reset the bus that I mentioned above.
> > > >
> > >
> > > It's more than a work-around for the unreliable link. A few customers
> > > may have such application - independent power supply to the device
> > > with dedicated reset GPIO to #PRST. In this way, the power cycle and
> > > warm reset of RC and EP won't have impact on each other. However, it
> > > may lead into the PCI driver not aware of the link down when an unexpected
> > power down or reset occurs on the device.
> > > We cannot assume the link will be recovered soon. The worse thing is
> > > the driver may continue access to the device, which may hang the bus.
> > > Since the device is no longer present on the bus, it's better to
> > > remove it. Besides, in order to bring up the link, the only way is to
> > > reset the MAC, which starts over the state machine of LTSSM.
> > >
> > > Well, we also noticed that there is no other driver that did this. I
> > > agree it is not necessary if the power cycle or warm reset of the
> > > device is done gracefully. The user can remove the device prior to the
> > > power cycle/reset.  And do the rescan after the link is recovered. However,
> > the unexpected power down is still possible.
> > > Please enlighten me if there is any better approach to handle such
> > > unexpected link down.
> > >
> > 
> > There is no issue in retraining the link. My concern is that, the retrain should
> > not happen autonomously in the controller driver. PCI core should be made
> > informed of it. More below.
> > 
> 
> Do you mean 
> - pass the link down/up events to PCI core
> - remove the device or hierarchy by PCI core upon link down
> - initiate the link retraining in PCI core by calling the platform retrain callbacks 
> - rescan the bus once link is recovered
> 

Yeah. This is what I came up with quickly:

```
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index b6536ed599c3..561eeb464220 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -706,6 +706,33 @@ void pci_free_host_bridge(struct pci_host_bridge *bridge)
 }
 EXPORT_SYMBOL(pci_free_host_bridge);
 
+void pci_host_bridge_handle_link_down(struct pci_host_bridge *bridge)
+{
+       struct pci_bus *bus = bridge->bus;
+       struct pci_dev *child, *tmp;
+       int ret;
+
+       pci_lock_rescan_remove();
+
+       /* Knock the devices off bus since we cannot access them */
+       list_for_each_entry_safe(child, tmp, &bus->devices, bus_list)
+               pci_stop_and_remove_bus_device(child);
+
+       /* Now retrain the link in a controller specific way to bring it back */
+       if (bus->ops->retrain_link) {
+               ret = bus->ops->retrain_link(bus);
+               if (ret) {
+                       dev_err(&bridge->dev, "Failed to retrain the link!\n");
+                       pci_unlock_rescan_remove();
+                       return;
+               }
+       }
+
+       pci_rescan_bus(bus);
+       pci_unlock_rescan_remove();
+}
+EXPORT_SYMBOL(pci_host_bridge_handle_link_down);
+
 /* Indexed by PCI_X_SSTATUS_FREQ (secondary bus mode and frequency) */
 static const unsigned char pcix_bus_speed[] = {
        PCI_SPEED_UNKNOWN,              /* 0 */
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 47b31ad724fa..1c6f18a51bdd 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -637,6 +637,7 @@ struct pci_host_bridge *pci_alloc_host_bridge(size_t priv);
 struct pci_host_bridge *devm_pci_alloc_host_bridge(struct device *dev,
                                                   size_t priv);
 void pci_free_host_bridge(struct pci_host_bridge *bridge);
+void pci_host_bridge_handle_link_down(struct pci_host_bridge *bridge);
 struct pci_host_bridge *pci_find_host_bridge(struct pci_bus *bus);
 
 void pci_set_host_bridge_release(struct pci_host_bridge *bridge,
@@ -804,6 +805,7 @@ struct pci_ops {
        void __iomem *(*map_bus)(struct pci_bus *bus, unsigned int devfn, int where);
        int (*read)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val);
        int (*write)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val);
+       int (*retrain_link)(struct pci_bus *bus);
 };
 
 /*
```

Your controller driver has to call pci_host_bridge_handle_link_down() during the
link down event (make it threaded if not done already). Then you should also
populate the pci_ops::retrain_link() callback with the function that retrains
the broken link. Finally, the bus will be rescanned to enumerate the devices.

I do have plans to plug this retrain callback to one of the bus_reset()
functions in the future so that we can bring the link back while doing bus level
reset (uncorrectable AERs and such). But this will do the job for now.

I will send a series on Monday with Qcom driver as a reference.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

