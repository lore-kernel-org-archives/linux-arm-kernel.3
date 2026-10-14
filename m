Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69045CC6B2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 12:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbWv/sKW2lmc17bvY7lmU1JjT4iCo+CxyyunhN+cEbE=; b=iKKXIjXUWC8P7QgDFIpvUQrGoC
	9dvV/YdgOIVae/OeHhNVv04JTQZEMCHhvFf3KkRmoLxcANHkFzn2736/gETknLB2vJ1geiUM88T1P
	2EaN7YQOyFUHHVozaFM7ZdDUzJfuiyFz1nArgIRc2kssUuqXl11etOdyEgwWT8z4obEa+dM3FXnua
	/xkdX4u/qddfpu953t1MljnBH6wvlcQBu28iUnRaRmu05NyZQnDdc3RAJ5TYkOuaGhizH7R66Yd8o
	Wca7SBxzbfsCUlYgG6xoV7ByWmBxJNNj+9DashSEippcIEYqCsUxYiWZFQjl6Iy00Il729pfUbvH2
	T9/mkQ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxk0-0000000FOpA-0xvU;
	Wed, 14 Oct 2026 12:05:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxjq-0000000FOmc-22ML;
	Wed, 14 Oct 2026 12:05:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CFEFD601F9;
	Wed, 14 Oct 2026 12:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B431F00898;
	Wed, 14 Oct 2026 12:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791979541;
	bh=UbWv/sKW2lmc17bvY7lmU1JjT4iCo+CxyyunhN+cEbE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=L9DYpwfgbq7A1hlSgGa4kKkf0hl6Smqwskhwsu5z+DMN9dKe1ORJgPJTRYNFZm7++
	 Gb1tQkmcgxUSOnPYajj+OeiFD6WOI6vfKX4iRGiol2OR5XnWtAAak66zNgBPvSJhCp
	 cB2rKk8t7RvStbddBaRD388k0zUZ25dERKumkjnbKWcqZzbCtrBjVFxhTSM35IW0VU
	 PwfxNc0LiM0HUV7A+3MIsjO1wFo5nPohOBRRwvq8yUBM/+4MeRffjCh3eI0T9L9yai
	 Q++241eGKFMY/AvzVDLfjtt9vsV8VQgFJo9Verk25TzvOt/FH0M9GWL3s80uO9annR
	 ddDV3jxbtyayA==
From: Manivannan Sadhasivam <mani@kernel.org>
To: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, bcm-kernel-feedback-list@broadcom.com, 
 jim2101024@gmail.com, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
In-Reply-To: <20260911233541.1650895-1-james.quinlan@broadcom.com>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
Subject: Re: [PATCH 00/13] PCI: brcmstb: Stop using chip numbers for
 conditions
Message-Id: <179197952602.38040.4438252459530233972.b4-ty@b4>
Date: Wed, 14 Oct 2026 17:35:26 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1988;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=CRzzNPaNH9skV8gEC8csK/YI4PQjB9eAcSu5FdE1Hlo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqz3AMrN7UJ7vHZBhFsbIGNRwnoOkDmgY8rUVP6
 q/+oXcWx1WJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCas9wDAAKCRBVnxHm/pHO
 9XlqB/9tGmBzMnCMnPGBUcutfz9p5JM2flP91QVH5egfoOyZpvXooGJTJ4C/sv45shkUFtIHPSh
 qCeSqFu1DEaFaFx+TqHjDm/DyBYVnhU4YbsdizJur864f4RzogtmLyAd3Zzjy+wfRTmBi0U/EXl
 ICqUXuxrUYYGty0HZOhUZlR0rH1p3wIYsLRE+T/xzhKjhAKpdD1X2q3VN4Tcch/Zh6GaqMhF3eF
 ER96d72vGJQBRVK2oq2jgfENaK0uxZXPSELptNT69COnqfDn2t8L/fEryAY+YdK4EXs++HVp0QP
 mNJLvXE4cbB9WFICfV2Ilv9DRdnv3uFE7o1qpURn/xwBJ7w+
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


On Fri, 11 Sep 2026 19:35:25 -0400, Jim Quinlan wrote:
> PCI: brcmstb: Stop using chip numbers for conditions
> 
> Much of the brcmstb PCIe driver code does (essentially) this:
> 
>         if (pcie->chip == 0x1234 || pcie->chip == 0x5678) {
>                 /* ... */
>         }
> 
> [...]

Applied, thanks!

[01/13] PCI: brcmstb: Remove redundant const specifier for struct fields
        commit: 46edf058e1531ceac70c59b0e69c3ff35b22e3f1
[02/13] PCI: brcmstb: Use flags u32 instead of bools
        commit: 17bf3521be9674ecdea6354af3ea2a38ca979ffa
[03/13] PCI: brcmstb: Add Broadcom quirks macro
        commit: ac87f644cec7f86681f56e2e07fb5124e622d26d
[04/13] PCI: brcmstb: Declare and assign quirk OB_WIN_32BIT_ADDR
        commit: 8f3d8492346ef55e20099eda7d170befcb2ad97d
[05/13] PCI: brcmstb: Declare and assign quirk OB_WIN_MAXSZ_128MB
        commit: 3c34e04a5ceb9f25453b51943127f3e242318a81
[06/13] PCI: brcmstb: Declare and assign flag IS_BMIPS
        commit: 19db283e770e9efbba6fcab0786210e4d870d7c0
[07/13] PCI: brcmstb: Declare and assign quirk 32BIT_PCI_OPS
        commit: 11c1752f24e643d7a3281f1add22f6a99d56a64a
[08/13] PCI: brcmstb: Declare and assign quirk NO_RGR1_TIMER
        commit: d3e27c1f1c1a3df58495f3cb51ce5ff0e6551256
[09/13] PCI: brcmstb: Declare and assign quirk EARLY_PERST_ASSERT
        commit: 644c94d347f644acf48801cd8841cea55e730bd9
[10/13] PCI: brcmstb: Declare and assign quirk PERST_PCIE_REV_CUTOFF
        commit: 1e840300326d6977cce6211e62e94022d569ac73
[11/13] PCI: brcmstb: Put max_burst_size setting in cfg_data
        commit: db776dbcfd25fc8e354aa4b3c16bdc4a7c59d99e
[12/13] PCI: brcmstb: Use order-0 indexing for inbound BAR window array
        commit: f22f415f21daaeb6d0e6b1537460513d3421d166
[13/13] PCI: brcmstb: Split up complicated function into two variants
        commit: f22895a0c371adaa8345dd76616462b868a8f38f

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



