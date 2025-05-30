Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90117C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 13:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFymtFLteooWlqBOwC4BZ9DDhvy3zbPIReDymrSJTCs=; b=AxfPtRQCcImiiu9M2/jpGuwOkq
	6mXnDWGzzQH7LKL7prulyuAFqW1NjyAO7y8XVN9+5KBoEBpJieXThURbXHimXbntLIuFgTYH+yIqm
	gxUKMdjIAoRtCvM3ZZbJ0OXDU1J2tX9IF2DdUqTju8ABPkpTiht0ysVGtq7dJr73PRPAIBAqv9VPr
	XqwEEt1BHWt2/4y+r72sz6VBYbc4f376k5bQNIqcA3HdiVD0F4gXO4sYjHwqHcdaVd1Fezt5L3ay2
	TMzxvXCw599YEYDVFnu5NmFqyEUanY1VYVNCJjnjWl4qYjmIRLnUD3YZfUlZWskrSzf+ZG3A+8RBP
	MQaxQrmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL0Gk-00000000pmj-3kmi;
	Fri, 30 May 2025 13:59:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL0Ec-00000000pTN-19pc;
	Fri, 30 May 2025 13:57:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2877B4416B;
	Fri, 30 May 2025 13:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055F7C4CEE9;
	Fri, 30 May 2025 13:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748613440;
	bh=+zsqPWkubdWde6jUz5nwbNsl1reIqr5AbthKVOWyVIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jwGcrnkwftu0mRb4vYazECZefxBEn32Ml69pqE3voqrBsZ2HudhGYiS3fmtSTSeba
	 sbealA6C6En3If72ionzzfA1RrF0ZuX3FQSK19NQA9O0xe6ZdpinNY/GwISm9ImvUm
	 roCTom/CvdGu5Vt5Qr7zFBH9nZOc2mTqGR1rgSc554fQC0AH2MQGMQHgb55QZG7nt7
	 fR1XZR6Ikf26BiCsKQGCjbVMOTfdxmPC7DigpKLWMOiIQdYXPGeYiPOjG3+tnoQobr
	 szn0cnby/s20t7pVDljl8GlggS4ImPdTdvrBELiCt4p+ZQdHrcaoOVtfbwz1U7zyQz
	 LILL1Pvupb3jQ==
Date: Fri, 30 May 2025 15:57:14 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/4] PCI: dw-rockchip: Do not enumerate bus before
 endpoint devices are ready
Message-ID: <aDm5Osv_k-yK6Lbh@ryzen>
References: <20250506073934.433176-7-cassel@kernel.org>
 <20250528224251.GA58400@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528224251.GA58400@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_065722_360053_E661E443 
X-CRM114-Status: GOOD (  29.36  )
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

On Wed, May 28, 2025 at 05:42:51PM -0500, Bjorn Helgaas wrote:
> On Tue, May 06, 2025 at 09:39:36AM +0200, Niklas Cassel wrote:
> > Commit ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we can
> > detect Link Up") changed so that we no longer call dw_pcie_wait_for_link(),
> > and instead enumerate the bus when receiving a Link Up IRQ.
> > 
> > Laszlo Fiat reported (off-list) that his PLEXTOR PX-256M8PeGN NVMe SSD is
> > no longer functional, and simply reverting commit ec9fd499b9c6 ("PCI:
> > dw-rockchip: Don't wait for link since we can detect Link Up") makes his
> > SSD functional again.
> > 
> > It seems that we are enumerating the bus before the endpoint is ready.
> > Adding a msleep(PCIE_T_RRS_READY_MS) before enumerating the bus in the
> > threaded IRQ handler makes the SSD functional once again.
> 
> This sounds like a problem that could happen with any controller, not
> just dw-rockchip?

Correct.


> Are we missing some required delay that should be
> in generic code?  Or is this a PLEXTOR defect that everybody has to
> pay the price for?

So far, the Plextor drive is the only endpoint that we know of, which is
not working without the delay.

We have no idea if this Plextor drive is the only bad behaving endpoint or
if there are many endpoints with similar issues, because before the
use_linkup_irq() callback was introduced, we always had (the equivalent of)
this delay.

Since this will only delay once the link up IRQ is triggered, it will not
affect the boot time when there are no endpoint plugged in to the slot, so
it seemed quite harmless to reintroduce this delay before enumeration.

But other suggestions are of course welcome.


Since it seems that we can read the PCI vendor and PCI device ID, it seems
that at least some config space reads seem to work, so I guess that we could
try to quirk the PCI vendor and PCI device ID in the nvme driver.

The nvme driver does have a NVME_QUIRK_DELAY_BEFORE_CHK_RDY quirk for some
Samsung drive, perhaps we could try something similar to the Plextor drive?

I don't personally have this problematic NVMe drive, so I am not able to test
such a patch. The user who reported the problem, Laszlo, has been doing all
the testing.


Perhaps Laszlo could try something like:


diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 6b04473c0ab7..9c409af34548 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2865,6 +2865,12 @@ static const struct nvme_core_quirk_entry core_quirks[] = {
                .quirks = NVME_QUIRK_DELAY_BEFORE_CHK_RDY |
                          NVME_QUIRK_NO_DEEPEST_PS |
                          NVME_QUIRK_IGNORE_DEV_SUBNQN,
+       },
+       {
+
+               .vid = 0x144d,
+               .mn = "Samsung Portable SSD X5",
+               .quirks = NVME_QUIRK_DELAY_BEFORE_CHK_RDY,
        }
 };


.. with the .vid and .mn fields replacd with the correct ones for the Plextor
drive. (Don't forget to revert patch in $subject when testing this alternate
solution.)

I don't have a preference for either solution.


Kind regards,
Niklas

