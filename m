Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E182C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 18:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkj+eXJWD3zKSY4LtYDXeZfa8DE+DGWzE6g5lQpJzPc=; b=jLQLZnI8iMtizpHRYixLrs8qMq
	A13Ql4hUxI7G3tdQK6hQuM9aqtmTP2pZcy2DW7J1qX1IvmW1SZUF6Cu9PtCQRkYeuwHDPKyqIzCc7
	4hpWG4RuTSE4GXaXuiOxbGmhNh8blylx2Zo5lxkEMtzlL8ObzWv9PcELSpFrQLZhCEkKRHtJd7QtM
	s0tLsjUnaLLuFyWUsHBR8bhxegx4ki/t9rHNlvinmWyu+TdCeCXT59oqCtmXmqr6qSZTDsLndX4+B
	fZ3Fm+hOuYta2Z8fhukMYk4Cjmo4oQgWN0kgPh0Pmtjb6LW++IUFZnErD2IQ9mhcZrMyBsn0ctMtS
	gM5wMj8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHDa-0000000G5Z4-3XXk;
	Wed, 14 May 2025 18:52:38 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFF2l-0000000FlWf-11XX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 16:33:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso136845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 09:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747240398; x=1747845198; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fkj+eXJWD3zKSY4LtYDXeZfa8DE+DGWzE6g5lQpJzPc=;
        b=St/kEVv1wGqspPTDTD5ihTdaQBlBFEHgAgAZBZFnvDzE4Jy9pv/Hb78jTW+LCNdE1i
         ioqhV96Uv4ls9KujPzlQ8wsQ70R+AIXNkSruPLoLbhS2qVdB2sCDsJkdzrysXqxiTHD5
         G9cUrxFUz2h/0bGhy9206vSDLloTO2QTwLxIy6Bzcpav0YK4v3L7kqwXSGxCC5QQ/JVr
         U2xVBxkG7+d0J5wudzP/uge07j/bmkTCh0gUGUkRnmFVYzMz6yRK407pgbDDXZ00N1YZ
         UnKiueaUcWx1Kn87cTFZlshchMGpFNL8c9YGlmuFqjAaPObHElnUDzGF3sDNnk80t7ZV
         D85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747240398; x=1747845198;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkj+eXJWD3zKSY4LtYDXeZfa8DE+DGWzE6g5lQpJzPc=;
        b=DSZTKREvBREzI4z06/8+EWHj1pXIswAygSohiPFt8raen+JpFm4HSnSAAh41EZeQuk
         Gad2/Of7nAj+8DQkwY/JgsI4gPf7nQMoZi0AouBBcVcsiMI4h6V71ESi+IdynP9Hm6AY
         YEnpIycY8NwdgIXpUSAwAGMlP0uaFaBkUcmBq0B8djVSbpmwouI3/UaqN+ZrQcyO36WR
         70b1KOlfWuuu/41NtC2TSJ8LFnF727sAaCHRTrjVBlBf6rrzCZWQdZ8ofnGez3CpF27Y
         bSLLRSqn8zrX57AFqiP+2qWHJkkx9NsfugQS0mRv9L3ESTykjT4affM9E9lxCD3je/vA
         Z2Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUGSpUubOcwdb5SKPwhEV1StM5X8FTQTqcRh6ST3XTf4gjiW1i6WIYudbncl64qoJVYsZiDR9fcfh9h+x4BDyXj@lists.infradead.org
X-Gm-Message-State: AOJu0YyfO8QEdJUhXaoBKmFPe3V+qT6e2VnRUP92O3TnzrrRjUGxfVVK
	TmOEaEi5XztAxI8BnM1GN0FQKywjG90jMp5DSOUDHQ3bGs6QuHAPHBbwGp6+KA==
X-Gm-Gg: ASbGncsbKwaQMzA+va+Ed/6+f9Hq4EcdolQl9r6FZug2tQs4TGxdaJrDZ3bQ/NwvtOw
	CTtwIPyzTbcvL0CY2NovhtXdrqIxtTUkq7GRTF42nhMWYj2a8jzvL9rYff5+L9UmTD8bYW2dMM/
	A47AxFPoq5zewwnzojzOI9BvvFLkvaKE3lJJYAR4ofLQ25Al99zIC/GgEAXkmBxwlS/8ZKY0+sZ
	PTziCP8A0+kfaUfxsz1YDbTwy2rEWVM5o9nyaPY7lRgRcaJ3gYY3u/U7ES/nLWluxetN0tYDPBB
	gGgmgLdE2gUGp3EQwoIbl50kW58Yo10ecSXLWr3V+JyySdD2SHCrXrW9C59Aig11mzLob50/cGz
	LwsVlw+d8mJy1fw==
X-Google-Smtp-Source: AGHT+IFPC9mL+DlWLaHagO2PQibPE5IAsRnVspZO3QJiVtK+BzyLXCvkMi6qfUPBM+PpkrIO8X/e5g==
X-Received: by 2002:a05:600c:b8c:b0:43d:94:cfe6 with SMTP id 5b1f17b1804b1-442f4c8fe71mr33161715e9.16.1747240397611;
        Wed, 14 May 2025 09:33:17 -0700 (PDT)
Received: from thinkpad (112.8.30.213.rev.vodafone.pt. [213.30.8.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951b57sm37447745e9.21.2025.05.14.09.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 09:33:17 -0700 (PDT)
Date: Wed, 14 May 2025 17:33:15 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <dglc4iqxxrjnbpqazi2xuzdblpcszcdb7q5nlz2ezzzyeujpvc@672myo6djcji>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
 <20250508-pcie-reset-slot-v4-4-7050093e2b50@linaro.org>
 <8006a0ae-b45d-d22f-65a9-20a65f3224b0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8006a0ae-b45d-d22f-65a9-20a65f3224b0@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_093319_283755_D97FFF11 
X-CRM114-Status: GOOD (  31.28  )
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

On Wed, May 14, 2025 at 12:00:11PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 5/8/2025 12:40 PM, Manivannan Sadhasivam wrote:
> > The PCI link, when down, needs to be recovered to bring it back. But that
> > cannot be done in a generic way as link recovery procedure is specific to
> > host bridges. So add a new API pci_host_handle_link_down() that could be
> > called by the host bridge drivers when the link goes down.
> > 
> > The API will iterate through all the slots and calls the pcie_do_recovery()
> > function with 'pci_channel_io_frozen' as the state. This will result in the
> > execution of the AER Fatal error handling code. Since the link down
> > recovery is pretty much the same as AER Fatal error handling,
> > pcie_do_recovery() helper is reused here. First the AER error_detected
> > callback will be triggered for the bridge and the downstream devices. Then,
> > pci_host_reset_slot() will be called for the slot, which will reset the
> > slot using 'reset_slot' callback to recover the link. Once that's done,
> > resume message will be broadcasted to the bridge and the downstream devices
> > indicating successful link recovery.
> > 
> > In case if the AER support is not enabled in the kernel, only
> > pci_bus_error_reset() will be called for each slots as there is no way we
> > could inform the drivers about link recovery.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >   drivers/pci/controller/pci-host-common.c | 58 ++++++++++++++++++++++++++++++++
> >   drivers/pci/controller/pci-host-common.h |  1 +
> >   drivers/pci/pci.c                        |  1 +
> >   drivers/pci/pcie/err.c                   |  1 +
> >   4 files changed, 61 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> > index f93bc7034e697250711833a5151f7ef177cd62a0..f916f0a874a61ddfbfd99f96975c00fb66dd224c 100644
> > --- a/drivers/pci/controller/pci-host-common.c
> > +++ b/drivers/pci/controller/pci-host-common.c
> > @@ -12,9 +12,11 @@
> >   #include <linux/of.h>
> >   #include <linux/of_address.h>
> >   #include <linux/of_pci.h>
> > +#include <linux/pci.h>
> >   #include <linux/pci-ecam.h>
> >   #include <linux/platform_device.h>
> > +#include "../pci.h"
> >   #include "pci-host-common.h"
> >   static void gen_pci_unmap_cfg(void *ptr)
> > @@ -96,5 +98,61 @@ void pci_host_common_remove(struct platform_device *pdev)
> >   }
> >   EXPORT_SYMBOL_GPL(pci_host_common_remove);
> > +#if IS_ENABLED(CONFIG_PCIEAER)
> > +static pci_ers_result_t pci_host_reset_slot(struct pci_dev *dev)
> > +{
> > +	int ret;
> > +
> > +	ret = pci_bus_error_reset(dev);
> > +	if (ret) {
> > +		pci_err(dev, "Failed to reset slot: %d\n", ret);
> > +		return PCI_ERS_RESULT_DISCONNECT;
> > +	}
> > +
> > +	pci_info(dev, "Slot has been reset\n");
> > +
> > +	return PCI_ERS_RESULT_RECOVERED;
> > +}
> > +
> > +static void pci_host_recover_slots(struct pci_host_bridge *host)
> > +{
> > +	struct pci_bus *bus = host->bus;
> > +	struct pci_dev *dev;
> > +
> > +	for_each_pci_bridge(dev, bus) {
> > +		if (!pci_is_root_bus(bus))
> bus here is always constant here, we may need to have check
> for dev here like if (!pci_is_root_bus(dev->bus))

Good catch! Ammended it while applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

