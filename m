Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65517CDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 15:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIzVTXv8g8JnhDCGT+xWyfC+8ohfboGZ2syiLUj/bP0=; b=4EtUlEFxr0yTy8IW0m0Er0bT6J
	/Oy/Llvz3WTudah8UO5uHQ4YRAeBGV4NZi9pIKKCUjonOEe32YYeG1Q3ZU5iALVUKXaWLxAG6qOWS
	vgmW8xGpCbduNtZYapdlAvYyo51vhusOt7vNEgydsxZMaFusUoMhE+vx+fdFpNWCAIlFen9QoJZPT
	DK3uI+PlQv+Cq0QJg+1NrR5kiHlhdIcMKFfSAhcQFRYABsqP1sidUgZnnSx5CLvzCMs0sI8ZtLo7e
	r/BpotP+92GP0DVPRk5Ae0gw1qlt0Ra/GwMikX709IJVT43zJ/MwjUn1TbkYzGry97aaAQp3HI12B
	wRKNcQnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waxLu-00000003QiF-3q73;
	Sat, 20 Jun 2026 15:11:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waxLt-00000003Qhz-24Yt;
	Sat, 20 Jun 2026 15:11:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 99F32433BF;
	Sat, 20 Jun 2026 15:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911451F000E9;
	Sat, 20 Jun 2026 15:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781968280;
	bh=lIzVTXv8g8JnhDCGT+xWyfC+8ohfboGZ2syiLUj/bP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VUOK5Rm/rfi1wA5O5FpPL+PMqg3/iiAY7S654kzd/xwP4OaH2dbPrFwjF/NLGeSEy
	 1arXfmKnr+pQhziePbA11lPXHwnpR107J2eTRm2qvMXgxMT8kkTKbEaovHsxFveHmE
	 DxAgwQZD3Ip3kKQutOWHZYX55/fkyqm7gwIS4hd008/4AvjIgkpZxlIbnUDuBnrKRR
	 EB0fp+Yn0QW7aKxQJjSD0s1O2bbH8QJ55Cm8YN4Z/Ub1sPaI+7TMPKBGCxMYEdwyTM
	 hoxfYrExcyjjyQUwzhmLAH+sROFRGD2MB0hvySTwxcSDr5ii1Sm8mA1asBeizXjvFA
	 T0BI9tEC3V5oA==
Date: Sat, 20 Jun 2026 20:41:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Gowtham Kudupudi <gowtham@ferryfair.com>, robh@kernel.org, 
	bhelgaas@google.com, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, yue.wang@amlogic.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org
Subject: Re: [PATCH] PCI: meson: Fix PERST# timing by asserting reset before
 LTSSM enable
Message-ID: <qq4dum3xqs2stcrd6ula75snrxy34elhodrtp3gftjgzqhs3ir@ykl54gvrfwxs>
References: <20260614015620.20432-1-gowtham@ferryfair.com>
 <84cc8b0c-da06-4d01-a076-9743c29c91f6@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84cc8b0c-da06-4d01-a076-9743c29c91f6@aliel.fr>
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

On Mon, Jun 15, 2026 at 12:34:11PM +0200, Ronald Claveau wrote:
> On 6/14/26 3:56 AM, Gowtham Kudupudi wrote:
> > On warm reboot, the PCIe controller's LTSSM starts link training
> > immediately if PERST# is already deasserted from the previous boot.
> > The driver then pulses PERST# for only 500us, which is too short to
> > properly reset the endpoint device that has already started training.
> > 
> > Fix by moving the PERST# assert/deassert pulse BEFORE enabling LTSSM,
> > so the endpoint gets a clean reset cycle before link training begins.
> > 
> > This was found on Amlogic G12B (A311D) with NVMe on an M.2 slot.
> > Cold boot worked because POR held PERST# low; warm reboot did not.
> > The fix was confirmed on a Banana Pi CM4 with Waveshare IO base board.
> > 
> > Signed-off-by: Gowtham Kudupudi <gowtham@ferryfair.com>
> > ---
> >  drivers/pci/controller/dwc/pci-meson.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> > index 5f8e2f4b3c12..3a7e9f1d5b8c 100644
> > --- a/drivers/pci/controller/dwc/pci-meson.c
> > +++ b/drivers/pci/controller/dwc/pci-meson.c
> > @@ -310,8 +310,8 @@ static int meson_pcie_start_link(struct dw_pcie *pci)
> >  {
> >  	struct meson_pcie *mp = to_meson_pcie(pci);
> >  
> > +	meson_pcie_assert_reset(mp);
> >  	meson_pcie_ltssm_enable(mp);
> > -	meson_pcie_assert_reset(mp);

meson_pcie_assert_reset() itself is wrong as it toggles PERST#. You'd just need:

msleep(PCIE_T_PERST_CLK_US);
gpiod_set_value_cansleep(mp->reset_gpio, GPIOD_OUT_LOW)

but in probe(), after meson_pcie_probe_clocks() as that's when both power and
REFCLK becomes stable.

> >  
> >  	return 0;
> >  }
> 
> Hi Gowtham,
> 
> I have a patch [1] that I haven't submitted yet.
> This might be related to your issue, what do you think ?
> 
> [1] https://github.com/rclaveau-tech/linux-khadas/commit/bee0a02d9756
> 

This patch is also needed as it correctly fixes the PERST# polarity when
requesting the GPIO. Since the devicetree is defining the PERST# GPIO as
ACIVE_LOW, the driver should request it as GPIOD_OUT_HIGH to make sure that
PERST# is asserted.

So please submit the referenced patch.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

