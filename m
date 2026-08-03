Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBD8C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfzXJjZ3mHbVoiAwesGWjaxUXEBdTtay7I0FHZ7Z+vM=; b=Hu0DbIufz12mSwEd075szG3dUc
	tVrGgtFfibozb/wdcqxsdqHrncIJ92H78Li8FA3vVvGQhGwc071iQc7LWFcDVsHj4ZltjdRqjTryn
	siV9X1qaz5jreXBOBviHEmxc3Ypeuu7aTVSHyMWLIB3PaL2aiLoLSKrSLr0dZznN0a0UqNujjfyha
	6kNMNJ4BJEgzzBqGUI/FH0frb/fH+Jv6YNRY4EMBym7tRBw1X54kmEvL0afZvUjBe+fwVXOyjh8zF
	ZRlqAaYGOutVfHfI80D5yQ96SjtQuy6vGuJmtHVuqr3Q5rKwjIzxG2j9TKarMBqAbu1hNyluDIBGl
	MWeKjsJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvG4-000000001gE-0EQd;
	Mon, 03 Aug 2026 16:11:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvG3-000000001fg-0aNJ;
	Mon, 03 Aug 2026 16:11:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C571543895;
	Mon,  3 Aug 2026 16:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4AC1F00A3D;
	Mon,  3 Aug 2026 16:11:14 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: jim2101024@gmail.com, florian.fainelli@broadcom.com, 
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
 bhelgaas@google.com, Sangwoo Han <sangwoo.han@nearthlab.com>
Cc: bcm-kernel-feedback-list@broadcom.com, robh@kernel.org, 
 linux-pci@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260730072215.2090974-1-sangwoo.han@nearthlab.com>
References: <20260730072215.2090974-1-sangwoo.han@nearthlab.com>
Subject: Re: [PATCH] PCI: brcmstb: Reserve only the MSI vectors that are
 handed out
Message-Id: <178577347444.25420.9482634841308840205.b4-ty@b4>
Date: Mon, 03 Aug 2026 18:11:14 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Thu, 30 Jul 2026 16:22:15 +0900, Sangwoo Han wrote:
> brcm_msi_alloc() reserves a naturally aligned power-of-two region with
> bitmap_find_free_region(order_base_2(nr_irqs)), but the irqdomain core
> releases the vectors of a block one at a time:
> 
>   /* irq_domain_free_irqs_hierarchy() */
>   for (i = 0; i < nr_irqs; i++)
>           if (irq_domain_get_irq_data(domain, irq_base + i))
>                   domain->ops->free(domain, irq_base + i, 1);
> 
> [...]

Applied, thanks!

[1/1] PCI: brcmstb: Reserve only the MSI vectors that are handed out
      commit: 92bf60fbb80f94c1b0fc24c7ff67d7aee936a58c

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



