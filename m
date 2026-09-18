Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCF8C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrXbvFOV+NU9m5j2WeTHVhbaWFlGi5GoAqKgLGAISoE=; b=guXU6S0ojne9F3CBjJ/6TG48gw
	RmYBiL1r/O3DVJwr0UCZ72x+B/EwLueIQrfoPkCU8reKsUa6UxuyLiEQqLpk2yDAs7UC0NiqUoULV
	MWkPIXY5AGI2jT6cZ9KHUIP+AHgmcGbgYT5Bp0FiUd6iKqQqXkCj3eyP4oVfGOihmPghznl9WfcC/
	YuA18y3rEa1h7I1SkY5srG0JQD0bNklVsrJlDeuCJ+bgdqCIgPT+tPikbQ55rUr/HOphgdm8YZbew
	EHypzwIeGMNV8eMpuITToj4Iwf/l1SDyztgj6rmClCozdiZwd8N04naHnNt+O1Q4mnV1Epe33heEr
	2ZpLGbVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bP1-0000000F1Gd-1qYo;
	Fri, 18 Sep 2026 16:25:31 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bOx-0000000F1GC-3RQO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:25:29 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469d249c4so926608b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789748727; cv=none;
        d=google.com; s=arc-20260327;
        b=ZGlXt4O7zYvsxODPLlaF3/lZVKgiEqt5ShQJyWYhwfhE63l1/n2X4c9zVGS1MaHPPi
         fN0ErDGEs7lpCWiClDedYby0iwPO6lR6qupgaq0CCl28O5ZOogdeh5UC7ewzrnmQlTRx
         NR13/b9C1btUCrRcZJ+rRnXHnhOMtBt7gpltI9NnS00IHPBsj76RYtdFcl+0xUABkpST
         KnUiyXr840O4YuanVIgvpm2TtOznq3nNk775qLUUpQK7mSYs6PrznY2HM9xl5XFUsICc
         qKikyW/pvLKhG7xmwk55BaP6scUUQD93qw4aNuJcI99vQvNhKOBpZ1Gjai8QkjImCsI+
         KJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VrXbvFOV+NU9m5j2WeTHVhbaWFlGi5GoAqKgLGAISoE=;
        fh=x9r73uqHDCe7zmMJRKBr8K+CzKa8D+JnTRLiuW0WZnU=;
        b=Z0fRdaQxlSuEtgLBRD6thA/zbXXu1GyAv/zwzIE396irfqPo5rThqMfZ+FHBuXcrlR
         jBfN9Igsqn6XmsxM2KWPt2eTDyDsHFElixD7yZv5xkwvQ524ofB6fubZMs/Fh7+glQUZ
         e3iCF+k0MGMDpB2eUmNhdgVO3onuDVhjuSsslkf+lOtgWN7PHtT51aNnA6j6ygDRgg1r
         6KtoxdqIXuCVI9nCRUymeqtffDGwqqNPDTkWLjGMVlPg7zn/5NYmRMMuBjcMekl4JhVY
         51si16TWCvdfowj1Bat+3mEMpR+YanBzeP6U7Y6lJVVdZSnG4lfqHKmqPIZraCxPhmmW
         tcIQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789748727; x=1790353527; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VrXbvFOV+NU9m5j2WeTHVhbaWFlGi5GoAqKgLGAISoE=;
        b=IOLYaJAMYrLsulKVB71JGUtCswd3lMWQCwc4n7LZBTtudfNUYdJF5VAy4fk2WS2dqR
         y5bfPDM2ES/H1foT/A2J5EiWkF/KVujcZImHYtIUagfHiDzFkoTvZuV89i1CwMEVv75k
         acxV6aTFvdx2I/oCcVWtUWcVPx90jLxzjbhGEVZsH0UUY0AfBYLcgIoSJh4h0eZyO3Bk
         qccfEpjgsC1QEjOStyj5fsD5Fl/dDVYijO7fyvJ8k6/6+KLeCRDxLnLiEJjy6xJ1nu7E
         lvfleb6T485wf0dJHEsD3YlKez7hWW5/bcrt05EAMSQQEMShGa40bnHfacvX2DTvxgNd
         F26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789748727; x=1790353527;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VrXbvFOV+NU9m5j2WeTHVhbaWFlGi5GoAqKgLGAISoE=;
        b=JmaNX2lyfrdPdKyzv7wsKcihvKEHU/UOUQVEVHCNyS7zVkCDStoJvOsCigV3TDo4Mp
         6kafpb+gxytPEwa4WDFf3RxfrCrpWuRxJWnWEUv1qxJ84rdSwjKfeCkXE2Aw3hkb/RZG
         pO0wnFKxJofzljgI03tzWKyIBxdepg6b/E5MF5J4NaXJ8eP/EWOhQW13GkLhiGXGWe1O
         OBcp/Fa3DZIU+2VjuPRGnUDRreuki325FMmeesp9QL4Q3U6MDuFKDKHcj1UX/7iNXBTe
         EsjSbgL2vF5jP1wadT8r1Daa5IxYh3ELFgtf5Jeysncj7UQHJwpNz20tLBaRf+fVmkjX
         y7ag==
X-Forwarded-Encrypted: i=1; AKwUvBx7NMvhP7IdesEfubjdTHyYutif7yQfywsBQVl/QNbNc6qLVf/uh8bBGzhcxZ4HEa3bM2EtYjbiElGB2YH1LGpM@lists.infradead.org
X-Gm-Message-State: AFuF++kOtOti2TImKeZ96Ae8vAbVeWLNaoE5RXfg39wRouAkA4pujHdq
	r8myeR8XLuA2pj0lrJaImRsLajQsJNFU2vtVbqsR31HswoX5NiNmo1C+j56TEbPIzD0l3tCwyAu
	5L1ce6SO3XUXqpEtFIJF/X/u+/qKGEAs=
X-Gm-Gg: AYBFou12aVZ/EbnF422ASMqVfc6Ul3dc5UMcaRVATXCx6Tcf0gsLBZl/uv8AF1gvrnN
	k4DwtuLqPAntzk611ViphTqfLXFspqmTOwdCc12X0QCfOTSCvywfIBq6Iv1oXIaYCTu0RizolO1
	VMxgKNnP4k4KYSexeR3zvSQ48gWYMH1a1chrf2YHGFpmT/hGFCwjj7zSpi8JSLVSZk7W0osslpf
	+ihdHUex91Jgoc8/X7V8ltlPxxhtacax/S0ksz3QOhDrPFVEQBzy/PxMsd+t5jQoCbp8aBsl9Bo
	b1tSDhi2+jk3bnEAH+V5ekCaovHkiaO7+77DbbgGj6oPlGTaaYrE/Ebs/JM/4VjUs9cr0rC5yUE
	Ufagdau5B1Vfb8czGaotAIxOHo25dScAfoys=
X-Received: by 2002:a05:6a00:13a7:b0:872:20f2:3287 with SMTP id
 d2e1a72fcca58-874dbeee762mr5939157b3a.10.1789748726761; Fri, 18 Sep 2026
 09:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260917183602.GA1036092@bhelgaas> <7c2a8582-280e-471a-b4b0-037b2cda6ad8@app.fastmail.com>
 <CAAsRjRnV-RTddO6h2XCUz2N5pB0pS8i_-_2XRcD=WOTA7AAFZQ@mail.gmail.com> <dc370463-125e-48d2-af6b-c3b4783f57ea@app.fastmail.com>
In-Reply-To: <dc370463-125e-48d2-af6b-c3b4783f57ea@app.fastmail.com>
From: Semih Baskan <strst.gs@gmail.com>
Date: Fri, 18 Sep 2026 19:25:12 +0300
X-Gm-Features: AcwNN1VOh8d_2xmEh01oZ9EcnHO1v-ja8QTE4DnWV1Kfj81LBJx61PkF6VeulFQ
Message-ID: <CAAsRjR=sHgZMgXuTid+D7Vst=N_GBUZUrduZ4YZax5rbotHNMg@mail.gmail.com>
Subject: Re: [PATCH] PCI: iproc: Use pci_alloc_host_bridge() on BCMA
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, bhelgaas@google.com, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rosen Penev <rosenp@gmail.com>, rani.hod@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_092528_539544_4ED2A159 
X-CRM114-Status: GOOD (  32.42  )
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

On Fri, Sep 18, 2026 at 12:32:12PM +0200, Arnd Bergmann wrote:
> If the DT window doesn't match, how does the bcma driver find
> the device node that corresponds to the EROM entry to populate
> the child nodes?

By reg. bcma_of_find_child_device() in drivers/bcma/main.c compares the
first reg address of each child of the axi node with the core's register
base from the EROM. That base is 0x18012000, 0x18013000 and 0x18014000
on both revisions; only the outbound window differs. The pcie node's
ranges is not looked at. The reg is translated through the axi node's
first ranges entry. The PCI core then matches the wifi nodes below that
node by devfn.

> The driver should probably check earlier if the device is
> already bound to the bcma bus, rather than just trying to
> request the bus windows. If anything, I would have expected
> the conflict on the 18012000 address for the register
> base.
>
> I see an ioremap() of bdev->addr in drivers/bcma/scan.c but
> don't see a corresponding request_resource() for it, so maybe
> an easy fix is to add this to the bcma bus scan and
> make sure that always happens before the pci driver probe?

In the tree as it is, neither side claims the register base. bcma
only ioremaps it in scan.c, and pcie-iproc-platform maps its reg with
devm_pci_remap_cfgspace(), which does not request the region either.
That is why the window is the first thing the two collide on. On the
ordering, bcma_bus_register() calls bcma_bus_scan(), then
of_platform_default_populate(), then bcma_register_devices(), so the
scan is done before the pcie platform devices are created and the
bcma core devices are registered after that.

> If a board has nothing connected to one of the host bridges,
> why is the pcie host bridge still marked as status="ok"?
> Do you need a driver to put it into low-power mode, or
> should this just be marked as disabled?

The three nodes are in bcm-ns.dtsi without a status property, and no
Northstar board file disables one. Which controllers carry a device
differs per board: the RT-N18U has one on the first, the R8000 on the
first, and on the second through a switch with two radios behind it.
bcma takes the cores from the EROM, and bcma_register_devices() skips a
core whose node is not available, so a node marked status = "disabled"
is skipped there too, and neither driver would take that core. I do not
know whether an unused core needs a driver for power.

> Does the platform driver reprogram the windows to match the DT
> description, or does it rely on the boot loader to ensure they
> ranges/dma-ranges properties match the register contents?

It programs OARR/OMAP from ranges only when the node has
"brcm,pcie-ob", and the inbound side only when it has dma-ranges.
The bcm-ns.dtsi nodes have neither, so it programs nothing and runs
with what is in the registers at boot. The PAXB_BCMA register table
has no OARR/OMAP at all, and the bcma driver never asks for an
outbound mapping, so it does not program them either. OARR0/OMAP0
are in the PAXB table the platform driver uses, at 0xd20 and 0xd40;
I have not written them on revision 0x01. Broadcom's 2.6.36 driver
writes OMAP/OARR 1:1 from its own table: 0x08000000, 0x40000000 and
0x48000000, with the last two replaced by 0x20000000 and 0x28000000
when the core revision reads 0x07.

> When using the bcma driver, does that update the ranges properties
> in memory to match the EROM contents?

No. 552aa843e4c5 drops the windows parsed from ranges out of the
bridge's resource list and adds the EROM one; the patch in this
thread reads ranges only to compare them with the EROM window. The
property in the live tree is not touched, so /proc/device-tree keeps
the dtsi values and the mismatch shows up only as the warning.

Best regards,
Semih

