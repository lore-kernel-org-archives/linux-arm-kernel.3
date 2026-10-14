Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97314CC6B27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JoNoxLjysImIDjyNHUNQP27pJgyjgutncUaFhkF4z9k=; b=ba7eh/mni6ihsRIMc5EzwxY2Ln
	5bdqx8Z1dX81ZYihel9cCmQIACRY8/aqvIrCFXs0DxR0GOOidSf+9Mvg8Z9ZqgMLxsnB2EZmAKpS0
	fXcjvb09dAtKxgURyFlx1mOo+ZtebwDnqrGonMSj0GtqBPsKAUwq8ELq/2bUDb5gBYAO1L+bodjT/
	s970wIZP9HAKm4lhDG9oiVFUQKWTbKIf26YmvhzAy4YuMkyaf6XEQK74m1DRSZG4gcFiDIfbGRzEL
	pbYtxHdeXF49pg2tDckMKaEBOPKnG4I2tO02vQ0TZWpCUU3OOu7WKL3hNwJ1BPIi9kyIRinpOIfRV
	ueQvbh6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtbn-0000000EmsE-1D9y;
	Wed, 14 Oct 2026 07:41:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtbl-0000000EmrU-1MDq;
	Wed, 14 Oct 2026 07:41:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 194C140DF4;
	Wed, 14 Oct 2026 07:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DFCD1F000FF;
	Wed, 14 Oct 2026 07:41:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 00/13] PCI: brcmstb: Stop using chip numbers for
 conditions
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
In-Reply-To: <20260911233541.1650895-1-james.quinlan@broadcom.com>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
Date: Wed, 14 Oct 2026 13:10:52 +0530
Message-Id: <179196365204.38040.9410252322524941418.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=7kgrn7vfHp/HBxFtKq6zzrmLScv3BCcSWbbxPL7Jk+k=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqzzIHwOTKlLdlXCO0vyzNfsIbHoswX7ANZ93im
 FhbPPswv96JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCas8yBwAKCRBVnxHm/pHO
 9VEoCACCjI0ALyCvEGCcqiXLR3pl3wf31kJVuI+1gEqK552ByK3YAP/JgjPB4YaSIozzPR71AB0
 5ABBNbCFqf/Yhm1CA7QL6gWJKmnPQbdI5yAKUoUB/WGfFZNZ/Ro3ZzfimeWChAigM/uhA0jdVfx
 xbc2U9N9hAfFsYTOJ0rX1Na+zksF0T42df8A9VZPK6D0u9+uFixz9fNGIazG1gjQW6YJkU/CJ3h
 89LCF2umlegZx0FWBCSYVzzLxVfLhhFDp2iVoSyjQaLXTEMBodT2/PPWp7vqkftDAn/XdKmklUz
 U1aOzHipDdx3JSIdoBLJwYaExJJdUOCzoRbmVbsPRfy6hL/L
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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

On 2026-09-11 19:35 -0400, Jim Quinlan wrote:
> Much of the brcmstb PCIe driver code does (essentially) this:
> 
>         if (pcie->chip == 0x1234 || pcie->chip == 0x5678) {
>                 /* ... */
>         }
> 
> when it should instead do this:
> 
>         if (behavior_xyz(pcie)) {
>                 /* ... */
>         }
> 
> This series does the above.  In addition, some other minor improvements are
> added in the hopes of making the code more readable.
> 

Thanks for doing this! Those checks were quite ugly.

> Jim Quinlan (13):
>   PCI: brcmstb: Remove redundant const specifier for struct fields
>   PCI: brcmstb: Use flags u32 instead of bools
>   PCI: brcmstb: Add Broadcom quirks macro
>   PCI: brcmstb: Declare and assign quirk OB_WIN_32BIT_ADDR
>   PCI: brcmstb: Declare and assign quirk OB_WIN_MAXSZ_128MB
>   PCI: brcmstb: Declare and assign flag IS_BMIPS
>   PCI: brcmstb: Declare and assign quirk 32BIT_PCI_OPS
>   PCI: brcmstb: Declare and assign quirk NO_RGR1_TIMER
>   PCI: brcmstb: Declare and assign quirk EARLY_PERST_ASSERT
>   PCI: brcmstb: Declare and assign quirk PERST_PCIE_REV_CUTOFF

I'll apply the first 10 patches as I see some comment from Florian on patch 10
and Sashiko's comment on patch 11. You can send a follow up series addressing
those comments.

- Mani


