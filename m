Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB0ACCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 07:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/23yEUVOB+18vZKUwoW6lk7Z4vHqkWH/HFCMN5FJnfQ=; b=X5qg+I1GwKDugslalivfQw5LuR
	C1A6bty6gPfMithnI+drRksSDtFU1dlo510fQ2RsIWSdu/TdwaApAZRD3MB4Igoy70Ym0Olkcn1jv
	tG7GEjxx2A1l/rQH6DV0oX++hxUHtLHTEzoZZe8EZbueQRMI4NzioequvJYqfhx4l70cg58Cve3nq
	LutVIIt2Arxz9szHZIKdzgT2IBRJ6oqTrEbFZkfN8SOdLe+iHP2cmBiX1uEDrr1CIpUmjtGPAVISP
	RbG8iBrZXZpLmeQ3JNfhzFoZ0D0KFcDql1STbbk0i7wyGclE5xYMlHGo34+W/ZlolGB9hbUq5CdEh
	JGgFHfMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vANir-0000000AmEu-0qG3;
	Sun, 19 Oct 2025 07:20:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vANio-0000000AmDw-1I18;
	Sun, 19 Oct 2025 07:20:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9ADC644F67;
	Sun, 19 Oct 2025 07:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76672C4CEE7;
	Sun, 19 Oct 2025 07:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760858443;
	bh=E1KMY2AmpHwrokV2dPfDb4Pya+/4OzhBXOQPSDpVJKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KYTsQ6ogzr3fgCfhRydcE0RdvcnjlufXTeGkXVBiTrPzhZwcFDCidG6WrMAkdK8rA
	 7w2nIEfrSwFFQH6Y/Cj5WckrDr6c8aUohokWIAvbhrufx3k6WIQGHZnAbosRuCfNZn
	 fQcIltKMTR14fiTYwDV9pY59ca75ja3aj4qSJsQx0bQJjT4/MSs0ygSuOnQCDrftaF
	 trfOQ2U3HVQntHKVLiqUASBEgZdI+PWKfatk9OGGm4h7t0li/5v4Y3VH4ZJZP+VC9j
	 LcQ5QtcxSkNJksyXWxA6Dsq9KDcaZFONO1ffSqqUBnmcaBztQlP/Pyr34mu1jQ4k/q
	 1QuGCIYkDv1jA==
Date: Sun, 19 Oct 2025 12:50:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v5 4/5] PCI: mediatek: convert bool to single flags entry
 and bitmap
Message-ID: <pqd5e46fa36wmdf7vgt6lvejpsx3cmkmwcaccaubt4uvzi26mb@r55x7lns5sbu>
References: <20251012205900.5948-1-ansuelsmth@gmail.com>
 <20251012205900.5948-5-ansuelsmth@gmail.com>
 <675d5338-09f0-439b-b22c-a3d50b243b5e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <675d5338-09f0-439b-b22c-a3d50b243b5e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_002054_376531_A54977AF 
X-CRM114-Status: GOOD (  18.76  )
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

On Tue, Oct 14, 2025 at 01:46:04PM +0200, AngeloGioacchino Del Regno wrote:
> Il 12/10/25 22:56, Christian Marangi ha scritto:
> > To clean Mediatek SoC PCIe struct, convert all the bool to a bitmap and
> > use a single flags to reference all the values. This permits cleaner
> > addition of new flag without having to define a new bool in the struct.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >   drivers/pci/controller/pcie-mediatek.c | 28 +++++++++++++++-----------
> >   1 file changed, 16 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> > index 24cc30a2ab6c..1678461e56d3 100644
> > --- a/drivers/pci/controller/pcie-mediatek.c
> > +++ b/drivers/pci/controller/pcie-mediatek.c
> > @@ -142,24 +142,29 @@
> >   struct mtk_pcie_port;
> > +enum mtk_pcie_flags {
> 
> enum mtk_pcie_quirks seems to be a better fit here, as this is used for... well..
> quirks.
> 
> > +	NEED_FIX_CLASS_ID = BIT(0), /* host's class ID needed to be fixed */
> > +	NEED_FIX_DEVICE_ID = BIT(1), /* host's device ID needed to be fixed */
> > +	NO_MSI = BIT(2), /* Bridge has no MSI support, and relies on an
> > +			  * external block

Add comments as Kernel doc.

> > +			  */
> 
> Also perhaps... MTK_PCIE_FIX_CLASS_ID, MTK_PCIE_FIX_DEV_ID, MTK_PCIE_NO_MSI
> 
> > +};
> > +
> >   /**
> >    * struct mtk_pcie_soc - differentiate between host generations
> > - * @need_fix_class_id: whether this host's class ID needed to be fixed or not
> > - * @need_fix_device_id: whether this host's device ID needed to be fixed or not
> >    * @no_msi: Bridge has no MSI support, and relies on an external block

Forgot to remove @no_msi?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

