Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCF1C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 16:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZ7GT9tpTg48vlfg0U/YtaR7zQg4ihM+JAeyaKK+GSk=; b=FsY2jNy6/BfnfieacBFZXCB3VT
	YCgh7qeTMs3M76d0GqyFs5eS0zJZCAvwkqKaRTiMcTdaucb07uEqEU4VEaQoe4bClLgBaCRlaO6rB
	+Mw4DBnuxDvFvdozzQPDHA03MeetAptcvpnxd97XSQ/vIW9F+Cpq9Nt4MBqN2DXnNyb2dul2Ahtn2
	aywzZ5F67c6L6YD2nnyYaRy8LqmgpUBu0zSTs7PgIlxF072i7/pjxhWc9+cLTDGzdvQCO27Gnk6qD
	kn5Qkov36VfrEcwj1l6Furbz0lHqcoq5TrUYNOnMziiLzrajbNroHExzzalfRIolhLt292frLu5E0
	jWolLdAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvPD-0000000AhLQ-1Il3;
	Wed, 18 Jun 2025 16:12:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRthG-0000000AQ14-12f9;
	Wed, 18 Jun 2025 14:23:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IZ7GT9tpTg48vlfg0U/YtaR7zQg4ihM+JAeyaKK+GSk=; b=n7ggpt2HCDEc5Ja5gOza091alY
	TidK9h7stjS8E616jr/QSUWs19tqX3rKZQwwCBmPLvJAF4i4F/I3aLlenM50X35J7ecT7bPKEO9Qc
	2qLGuIkK/DYl2EPERfYgX4zBqH5rjUxCm95j4wip9XqLqF78Ze0aX1sk1llatL0+qJ/VeF4rHNdBD
	5BkLmlRlbjE0TrJrc1dpXSn2OVayoIecNYZl7VhgATlU04Oiogsv9PfplX9uus89GwrzeRN4vLQce
	0YJl4R14H1Z9tCC1i7He7mS+/Dwa6cdyqplt3xgVpf2gD4X69N4luJjJUlzN5BQtrXlZ3gxCdunj8
	kRlAx4iA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRthE-000000045nM-005T;
	Wed, 18 Jun 2025 14:23:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EAFB25C621E;
	Wed, 18 Jun 2025 14:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF084C4CEEE;
	Wed, 18 Jun 2025 14:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750256599;
	bh=Tw82APBfnc8betE49fdk4f7dJxLN1BXDSLLXI9UwX7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QdAUprYKJiSnsrJGpXN4Wmdq8DXkBhrJMF/FEGPXR2QnvW9p3H5kK1elO6+oQ5zP1
	 XWfCiGXzCXewJYibrQhrnn9YbF4K8CXWAjkxTaK94+H+HqVsWFvD32lh1WptSPnOXp
	 yLUkrvU/uomcQPTVq2Y1HpLub6VBB64WZILuuqiHz2dOxVw+MpxQEKcdKorBw1VXLz
	 gx7FoLEG/ELzuaYl5dzpzz8k/8C0WuLqq56KxebvN8Nov7JpBZL2qnZqq9waTzqBCs
	 61XHUF4Y/CmTLy+LXFmqFy2rPVd0ExD28khi6AoUdXa4nPx9R2gvLrqPYk2J4fkUws
	 hJDkGdgT+BDxQ==
Date: Wed, 18 Jun 2025 16:23:14 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2] PCI: dw-rockchip: Delay link training after hot reset
 in EP mode
Message-ID: <aFLL0vPFzxdVOR9a@ryzen>
References: <20250617220114.GA1156610@bhelgaas>
 <20250617220523.GA1157905@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617220523.GA1157905@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_152324_203303_5587EF74 
X-CRM114-Status: GOOD (  16.69  )
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

On Tue, Jun 17, 2025 at 05:05:23PM -0500, Bjorn Helgaas wrote:
> On Tue, Jun 17, 2025 at 05:01:16PM -0500, Bjorn Helgaas wrote:
> > On Fri, Jun 13, 2025 at 12:19:09PM +0200, Niklas Cassel wrote:
> 
> Oh, and this sets PCIE_LTSSM_ENABLE_ENHANCE | PCIE_LTSSM_APP_DLY2_EN
> once at probe-time, but what about after a link-down/link-up cycle?
> 
> Don't we need to set PCIE_LTSSM_ENABLE_ENHANCE |
> PCIE_LTSSM_APP_DLY2_EN again when the link comes up so we don't have
> the same race when the link goes down again?

Nope, we don't.

To verify I used this patch:

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index be239254aacd..e79add5412b8 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -506,6 +506,8 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
        if (reg & PCIE_LINK_REQ_RST_NOT_INT) {
                dev_dbg(dev, "hot reset or link-down reset\n");
                dw_pcie_ep_linkdown(&pci->ep);
+               pr_info("PCIE_CLIENT_HOT_RESET_CTRL after reset: %#x\n",
+                       rockchip_pcie_readl_apb(rockchip, PCIE_CLIENT_HOT_RESET_CTRL));
                /* Stop delaying link training. */
                val = HIWORD_UPDATE_BIT(PCIE_LTSSM_APP_DLY2_DONE);
                rockchip_pcie_writel_apb(rockchip, val,




[   85.979567] rockchip-dw-pcie a40000000.pcie-ep: hot reset or link-down reset
[   85.980210] PCIE_CLIENT_HOT_RESET_CTRL after reset: 0x12
[   93.720413] rockchip-dw-pcie a40000000.pcie-ep: hot reset or link-down reset
[   93.721074] PCIE_CLIENT_HOT_RESET_CTRL after reset: 0x12

0x12 == bit 1 and bit 4 are set.

bit 1: app_dly2_en
bit 4: app_ltssm_enable_enhance



I also looked at the downstream driver and they also only set it once
during probe().


When running the controller EP mode, we (the Linux driver) currently never
reset the whole core after probe(), and as we can see above, the hardware
itself also does not reset the app_dly2_en bit during a hot reset signal.


Kind regards,
Niklas

