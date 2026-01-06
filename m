Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB624C47BEA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 11:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NiOEwZUs9si4TYzocCkrKHzTqQqlZCvEzusmp4XL24k=; b=JMGttMVPbKOnLKLcwgKqDQwN3n
	1AWQU35LJaOe0UT9sWHLiI8eQTaRxFHDlST0s0AbytvEN+g/hxH4rr+VJCpvcwqqosl+1Zb5g59Hg
	YaVG5sD6wCRheR72augQC50NrLsMLpt3R1WZtHMAx2v/QX23SLm1fLm+LD9PK3QggL/x2Uhlgw74W
	eO9gq0DOYzcjNHzZvSM3svrnue3GSdS+8fTxpG1dq3k3CvQvzWgku8BUEPCxWa5Z4cLF0xcEJqRjy
	ZkkV6alKMKqQC/G0Q3dbYOhBjXBradsaZCc1lFje64OexIbgvcaFHiMaN2f/gAXGlzb5HuFXxRNKp
	m4miB5eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd538-0000000CrGn-2Lop;
	Tue, 06 Jan 2026 11:16:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd536-0000000CrGK-44lZ;
	Tue, 06 Jan 2026 11:16:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A45060148;
	Tue,  6 Jan 2026 11:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 528DEC116C6;
	Tue,  6 Jan 2026 11:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767698187;
	bh=KAZTfW562W1oYvg6yLMZiwveTP/LAQQ3kkh1Vqc/32Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z1K0/H+XpY/nY87i0BbOhrc0NiRe8qTneWo9Kclay0A+/ZiYEVXM8rM2Ru8hsNf8y
	 PxNWW770aUY0dfnswiMYnNUyiXyMopWxWKymiXrW+XiA+s5Y09ERidRRZG782OYHhD
	 4chf+I3fc+I8JmctmpRXqsR1iNYjVBnbR4j2HQFYpy59lZTrFG7rUnvWhWWj//5go4
	 LXdUEq9t2WGgtOv7/a88UHej4y9EJJGE/vb9oors6pxeMGccynmmEkVG5rYPDW4Rsq
	 79BH7p4Wrb3LzWNxaEbPknCyslDbxH1Y7TENlLw78noR/6XK39CD77/BuMLy05qqQB
	 oJUN+EE7CvPnw==
Date: Tue, 6 Jan 2026 12:16:16 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chuanhua Lei <lchuanhua@maxlinear.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Pratyush Anand <pratyush.anand@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] PCI: dwc: Add multi-port controller support
Message-ID: <aVzvANWTavhabhEB@ryzen>
References: <20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com>
 <20260105-dt-parser-v1-2-b11c63cb5e2c@oss.qualcomm.com>
 <aVvkmkd5mWPmxeiS@ryzen>
 <m5ukeugo2lazipljqpubyvm7j3xk2j5o7i2xgdbkkhii57xmyk@lh32qdzjhe4n>
 <aVzqMqTUWIuKhgmC@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVzqMqTUWIuKhgmC@fedora>
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

On Tue, Jan 06, 2026 at 11:55:46AM +0100, Niklas Cassel wrote:
> For iterating, to avoid manually traversing the array, we could do like
> libata and create a simple macro, e.g. ata_qc_for_each():
> https://github.com/torvalds/linux/blob/v6.19-rc4/drivers/ata/libata-eh.c#L851-L854
> https://github.com/torvalds/linux/blob/v6.19-rc4/include/linux/libata.h#L1657-L1659
> 
> And at least personally, I think my brain will parse dw_pcie_port_for_each() { }
> faster than it parses list_for_each_entry(port, &pcie->ports, list) { },
> since it is more unique, but perhaps I am the weird one here :)

Or... for_each_dw_pcie_port()

We also don't need to supply an integer to the macro, we could do like e.g.
for_each_nhlt_endpoint():
https://github.com/torvalds/linux/blob/v6.19-rc4/include/acpi/nhlt.h#L63-L64

which has does "for (unsigned int __i = 0; " in the macro.


Kind regards,
Niklas

