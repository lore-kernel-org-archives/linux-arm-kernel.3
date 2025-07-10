Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67006C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=te+QesjkfZV1lnlFSbAdZUz3r0Wrt/PT7jvFYDjXsLY=; b=Excq9LsrtBySapZwmJPopUGbxs
	M9h4GiX7LfreBtHgvV7vK5TCPpPH+fnj03U5FWVIXblJwF01wQuAYxguL4QTF46EKNQwCeUcJIved
	X0CLLsKszax10qlLQs2aIsfF6mSCfxTWVLAAYDSSj6B9NNHsf6HkaAf0+ZOSGgYwh2eEo4A8hQTF3
	cpAfg01JYCTHSf6RRMSNiUgTdlzCxLu6k550UGvoTkg9l7uqJt8ZMdwgc8RG2QujaWV88c2KV+ozP
	zVCazXrDRZSCbjDCTWj4Vfof67hssHHqnYbS3nZ447aUknUzU48Mjx0jqj5EHs7ZG9/yhZ8+xOXYH
	03GOhxBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuxV-0000000CZV0-1QRz;
	Thu, 10 Jul 2025 17:21:21 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsrd-0000000CCeJ-2Bny;
	Thu, 10 Jul 2025 15:07:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752160019; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S/0iPgFLijaC9J1SwO3PwYiSYcnmJnoh7LyfCLclhEGFat2r5o5h6hkRZ00xs9jvgJaBzrx/wfGKwW7Tsid1TQkup170oc4FkoFvrgOa913I1ISVb7Y4m/6lHeXsmnixUXzcnKYpE4XGGKevJHW3rIdFaSZcy0lobv5wNKiRDU8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752160019; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=te+QesjkfZV1lnlFSbAdZUz3r0Wrt/PT7jvFYDjXsLY=; 
	b=SvUMtILhxfUcBl3kHOzXxrAxM7XL90wIGK2L8XhjrBPGOR+6xDkO++k3BOj7Erh+D/RX0eE7XaLIjwNAweN1NmukV9Vq61B5zKYRYSSkhYff7w9DTuvCh0Gj1hfQMRTIzzEucpU5eFN0OLAG8Agj0S1POaBKNUQUjE4htGp89so=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752160019;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=te+QesjkfZV1lnlFSbAdZUz3r0Wrt/PT7jvFYDjXsLY=;
	b=SegZ+jEGaeYh2x8qxxp/zI4F2eiDdyq2us7x+BjvoH2y6Dz0plBcsy3m+2cIxu9j
	EEA7n7Rz5+CxCensMoTLJ0kSBbXrNetIJMIx9pUrOA4Kmc5x6KpVFWqV2Lze3cDwqDu
	sqNKoqNAM21T8ewgtKmqzfgfusFVA6+fdOVsStRg=
Received: by mx.zohomail.com with SMTPS id 1752160017391654.4434834354436;
	Thu, 10 Jul 2025 08:06:57 -0700 (PDT)
Message-ID: <6c132018714402d0a46fb8b59c862fb7f96a77f8.camel@collabora.com>
Subject: Re: [PATCH] PCI: mediatek-gen3: Assert MAC Reset only for a delay
 during PM suspend sequence
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Ryder Lee	
 <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>,  Manivannan Sadhasivam	 <mani@kernel.org>, Rob
 Herring <robh@kernel.org>, Bjorn Helgaas	 <bhelgaas@google.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Thu, 10 Jul 2025 11:06:54 -0400
In-Reply-To: <20250709-mtk8395-fix-pcie-suspend-v1-1-0c7d6416f1a3@collabora.com>
References: <20250709-mtk8395-fix-pcie-suspend-v1-1-0c7d6416f1a3@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_080709_624778_4FE1EB21 
X-CRM114-Status: GOOD (  13.34  )
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

On Wed, 2025-07-09 at 17:42 +0200, Louis-Alexis Eyraud wrote:
> In the pcie-mediatek-gen3 driver, the PM suspend callback function
> powers down the PCIE link to stop the clocks and PHY and also assert
> the MAC and PHY resets.
>=20
> On MT8195 SoC, asserting the MAC reset for PCIe port 0 during suspend
> sequence and letting it asserted leads the system to hang during
> resume
> sequence because the PCIE link remains down after powering it up:
> ```
> mtk-pcie-gen3 112f0000.pcie: PCIe link down, current LTSSM state:
> =C2=A0 detect.quiet (0x0)
> mtk-pcie-gen3 112f0000.pcie: PM: dpm_run_callback():
> genpd_resume_noirq
> =C2=A0 returns -110
> mtk-pcie-gen3 112f0000.pcie: PM: failed to resume noirq: error -110
> ```
> Deasserting it before suspend sequence is completed, allows the
> system
> to resume properly.
>=20
> So, add in the mtk_pcie_power_down function a flag parameter to say
> if the
> device is being suspended and in this case, make the MAC reset be
> deasserted after PCIE_MTK_RESET_TIME_US (=3D10us) delay.
>=20
> Fixes: d537dc125f07 ("PCI: mediatek-gen3: Add system PM support")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

--=20
Thanks,

N=C3=ADcolas

