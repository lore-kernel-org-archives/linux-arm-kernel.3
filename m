Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D231BC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ed3HwmGDccuaWYbTyHyaVTzv4wASH1XGS6TfCk4H9oo=; b=HpxauNwtdmVpHrWi13z0Zlhz6q
	iVB3AF9mtH2SCTBp4ysv7HgEcIDrWV7AEn5d1+YP+vzvGO2CQmVP4cHxDFkh9lJ+fv3ZfqDBUQqdI
	0va6CWq63dLwD9FWO8lm48zjifRhmAS4fQ2Vh2hy56gWBWkjYPrIt0oOPf9AV2DZqIYMU7bwHdPad
	6dgxCHJd4tIx9zYWJTY8LDJykUfHU89lNgzWHIw/W+XoLPfRPPB/hQ0c7IpJ9FGJWNc/l0LV+lNvb
	fLm5FKzHdF9qsREagL+KTBpnA066bLMgsh23ibbKutjcUTGMpux+c/JYBe0dcBaMxWysf3X67aRAj
	9GNI61NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRKQ-0000000H4bK-1TQ1;
	Mon, 10 Feb 2025 10:47:50 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRA9-0000000H2iy-3pVL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 10:37:15 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2fa40c0bab2so3663021a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 02:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739183833; x=1739788633; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ed3HwmGDccuaWYbTyHyaVTzv4wASH1XGS6TfCk4H9oo=;
        b=zprpdYwHZVOTG2TOGZFIhauVuQxigyUlT03G4VXqgr+lk1r1Od6p7eA5c3va21Uxv+
         whUZeOQGJr7gkOzT0Ksmgrq0ULIWQ6aqXY1+9a9VTcBvtzfA29KY+KHgIDHsDHKuUMYx
         iw8tAyrgUYbK6hfgV0YSOk172vMqZ3Y/8eXJphJIbzAPaMYyfIdZgluqTkEL4OF0wFtC
         yw3IO48mpil8aliGxdffZYEiyZbXgpqHktczDG3Nrq4s9bY6E361vnRpBC23agkqMGX/
         O/wa1qHtBBWJBALnMmaYuCUFMS3FmVH3TIlq8SctcFGjmjzMYfyqqBZTJJ/50beOn5Bm
         a6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739183833; x=1739788633;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ed3HwmGDccuaWYbTyHyaVTzv4wASH1XGS6TfCk4H9oo=;
        b=CkNesRbGOoWgMgEvweGKE0l452J2KhPn17aUhMj5JO6jQveYj37so2U0lQzxcuROx7
         7jYLB/gp0rJ6mPlU6WqsnDLPhV0yemLkGY5cvhX76AtTUxeiTfRQedzozjEE0PdMri+C
         Om/XR8K5WxSa2HFQX9MF29dwZyhLcommYO0zT+XeSgO/UWPEVwDIAg5yrWNwNLD/KP9N
         gaiRVQ8dCDGDvca99GKdnQ9ImUoSM4jMWSiT7lZpyj1miaYUBLF3ZaT6yE2axXOdal1C
         bUIFwMQoaxjzNNFn4RfFDomHC4G71J/q1hfR01riIrdgfgR3qoFjpO888uKf+wOiKCM/
         veig==
X-Forwarded-Encrypted: i=1; AJvYcCW3Q0XtBKHDQKMbr1ZLhXYtq8Eo0WNlW7Mb5RsoVvuetGEJZ7r0fCNNI2lfpD+G3QQ33H6BmUHHwQtQ0yYpMeIu@lists.infradead.org
X-Gm-Message-State: AOJu0YwUaNx7mLH7i30s7YG3Q0vqR6W6sZYo7N4r4o6n/42VAbEbgnio
	OaUv6JZuKDnxLL11hAqWtBLviVLZoOvK86OFX4h3pGAX9YVEe/6Vi3x25cW8nPWSeu/xuv8pxpU
	=
X-Gm-Gg: ASbGnctv8bqeZCX+g+IRpqGaIteCAEFOuGNyEseHsqVqTzCsu7eQY/EXMYvhLsYbyx5
	ovv5kzCfWUcxWpt88ChrZ7Jg78p4vZxUL5lkVoYBfsc7fo/4Uh9mf8NLn8vD5PXBQeZd9xnRuFg
	ccjd8wGgY+S9dlhwyGI8f+dgU5rxA55XSpSQLe0bf0WsiDCs2urhU45jqqL6P0iaLM3aWL/HPBK
	7i9u3zgx3xqw/eBnY5+x7vKJiFtvYOczkis6XLCCoZHnVf1q6XMdB3kfxRHzlgXMcIpMTU5qoNA
	CUZFWRo+LvNlJMu4qz2ihFvZDrvP
X-Google-Smtp-Source: AGHT+IH+EZSozw+jru34fUmFnJ9GiwELwA5qvlNGOOzM35DgohR3W+M4Z4wp+SiWS/lt6+tMpE0BSw==
X-Received: by 2002:a17:90b:364d:b0:2ee:c4f2:a76d with SMTP id 98e67ed59e1d1-2fa24274bd2mr18771623a91.21.1739183832952;
        Mon, 10 Feb 2025 02:37:12 -0800 (PST)
Received: from thinkpad ([220.158.156.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa099f4dadsm8179079a91.10.2025.02.10.02.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:37:12 -0800 (PST)
Date: Mon, 10 Feb 2025 16:07:07 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bo Sun <Bo.Sun.CN@windriver.com>
Cc: Kexin.Hao@windriver.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH] PCI: controller: Restore PCI_REASSIGN_ALL_BUS when
 PCI_PROBE_ONLY is enabled
Message-ID: <20250210103707.c5ubeaowk7xwt6p5@thinkpad>
References: <20250117082428.129353-1-Bo.Sun.CN@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250117082428.129353-1-Bo.Sun.CN@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_023713_954099_C70D643F 
X-CRM114-Status: GOOD (  20.36  )
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

On Fri, Jan 17, 2025 at 04:24:14PM +0800, Bo Sun wrote:
> On our Marvell OCTEON CN96XX board, we observed the following panic on
> the latest kernel:
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000080
> Mem abort info:
>   ESR = 0x0000000096000005
>   EC = 0x25: DABT (current EL), IL = 32 bits
>   SET = 0, FnV = 0
>   EA = 0, S1PTW = 0
>   FSC = 0x05: level 1 translation fault
> Data abort info:
>   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
>   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [0000000000000080] user address but active_mm is swapper
> Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
> Modules linked in:
> CPU: 9 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7-00149-g9bffa1ad25b8 #1
> Hardware name: Marvell OcteonTX CN96XX board (DT)
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : of_pci_add_properties+0x278/0x4c8
> lr : of_pci_add_properties+0x258/0x4c8
> sp : ffff8000822ef9b0
> x29: ffff8000822ef9b0 x28: ffff000106dd8000 x27: ffff800081bc3b30
> x26: ffff800081540118 x25: ffff8000813d2be0 x24: 0000000000000000
> x23: ffff00010528a800 x22: ffff000107c50000 x21: ffff0001039c2630
> x20: ffff0001039c2630 x19: 0000000000000000 x18: ffffffffffffffff
> x17: 00000000a49c1b85 x16: 0000000084c07b58 x15: ffff000103a10f98
> x14: ffffffffffffffff x13: ffff000103a10f96 x12: 0000000000000003
> x11: 0101010101010101 x10: 000000000000002c x9 : ffff800080ca7acc
> x8 : ffff0001038fd900 x7 : 0000000000000000 x6 : 0000000000696370
> x5 : 0000000000000000 x4 : 0000000000000002 x3 : ffff8000822efa40
> x2 : ffff800081341000 x1 : ffff000107c50000 x0 : 0000000000000000
> Call trace:
>  of_pci_add_properties+0x278/0x4c8 (P)
>  of_pci_make_dev_node+0xe0/0x158
>  pci_bus_add_device+0x158/0x210
>  pci_bus_add_devices+0x40/0x98
>  pci_host_probe+0x94/0x118
>  pci_host_common_probe+0x120/0x1a0
>  platform_probe+0x70/0xf0
>  really_probe+0xb4/0x2a8
>  __driver_probe_device+0x80/0x140
>  driver_probe_device+0x48/0x170
>  __driver_attach+0x9c/0x1b0
>  bus_for_each_dev+0x7c/0xe8
>  driver_attach+0x2c/0x40
>  bus_add_driver+0xec/0x218
>  driver_register+0x68/0x138
>  __platform_driver_register+0x2c/0x40
>  gen_pci_driver_init+0x24/0x38
>  do_one_initcall+0x4c/0x278
>  kernel_init_freeable+0x1f4/0x3d0
>  kernel_init+0x28/0x1f0
>  ret_from_fork+0x10/0x20
> Code: aa1603e1 f0005522 d2800044 91000042 (f94040a0)
> 
> This regression was introduced by commit 7246a4520b4b ("PCI: Use
> preserve_config in place of pci_flags"). On our board, the 002:00:07.0
> bridge is misconfigured by the bootloader. Both its secondary and
> subordinate bus numbers are initialized to 0, while its fixed secondary
> bus number is set to 8.

What do you mean by 'fixed secondary bus number'?

> However, bus number 8 is also assigned to another
> bridge (0002:00:0f.0). Although this is a bootloader issue, before the
> change in commit 7246a4520b4b, the PCI_REASSIGN_ALL_BUS flag was
> set by default when PCI_PROBE_ONLY was enabled, ensuing that all the
> bus number for these bridges were reassigned, avoiding any conflicts.
> 

Isn't the opposite? PCI_REASSIGN_ALL_BUS was only added if the PCI_PROBE_ONLY
flag was not set:

	/* Do not reassign resources if probe only */
	if (!pci_has_flag(PCI_PROBE_ONLY))
		pci_add_flags(PCI_REASSIGN_ALL_BUS);


> After the change introduced in commit 7246a4520b4b, the bus numbers
> assigned by the bootloader are reused by all other bridges, except
> the misconfigured 002:00:07.0 bridge. The kernel attempt to reconfigure
> 002:00:07.0 by reusing the fixed secondary bus number 8 assigned by
> bootloader. However, since a pci_bus has already been allocated for
> bus 8 due to the probe of 0002:00:0f.0, no new pci_bus allocated for
> 002:00:07.0.

How come 0002:00:0f.0 is enumerated before 0002:00:07.0 in a depth first manner?

> This results in a pci bridge device without a pci_bus
> attached (pdev->subordinate == NULL). Consequently, accessing
> pdev->subordinate in of_pci_prop_bus_range() leads to a NULL pointer
> dereference.
> 

Looks like it is a bug to let a bridge proceed without 'pdev->subordinate'
assigned.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

