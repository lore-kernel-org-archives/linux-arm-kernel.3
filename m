Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2CECCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 15:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hW97odhM9uO/XARUDOadwueA3k57Xsj3ULKP5Obq3Vs=; b=xOEVrKqqHyU6HT9+e82cUR3Mze
	vZWuPxCbrdtKbMfi2Di2lWYkBf11QnGwxZdgvStYdgqHIXrAyzipiJfLyv/KoF6O7pV+ocqjlXb0y
	dQY+j87BIhgJnuRN7NgpskCINQQnnoMLwJ1djPrfGLGte0nBTRZ3SpOlr3fBBX2upJ1Hdlht8gsWs
	UWE8g6mhnXu5H7fvsM819YcQqEnXFTfzuR7PdktHGpZX7zY5nxBSmA6GzCAHPKmQFtjSxuuX8VZjy
	oY1FCA8B+1nJ2K2ZxhBKss4ffQ1NMr/kkEKNqHn5qpEmVukygYrI7rJ166h3iOtCrTrcTQfyYTP7/
	bQX6c06A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOtq-0000000ECFI-1Qqe;
	Mon, 27 Oct 2025 15:12:46 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOtn-0000000ECEj-3Po1;
	Mon, 27 Oct 2025 15:12:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761577951; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QgkEdgY84nDWlJ/3RhFF846BGSqh3D7YQ6hxECQL/DQWvrN3pHPvR1l/0/05a6aHiBlcUyieSh1W/u1dQnC7ZSWvQgQHigfMQVCPD+Lbd8byITn/PVqYUrpEMAVQB6hXDobgINgf81tcobj82dyF/ojK8Pg7X0nAXvxB8jVmKx0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761577951; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hW97odhM9uO/XARUDOadwueA3k57Xsj3ULKP5Obq3Vs=; 
	b=mzChHXJbbaJkZ1lQwuPmdJWcTNzjqGIH/g+QQy2Iz2xWVUAaYtToT7X4Nd7cD5ARIeFUlT8JDII1ptORL9aydQONJvs3v7p8t1ywMK590d1nJod/Pl8HBtbe5v9P3v/V6JAMG6RNf7QeN3o4u3jOoraqfp4zUubftHHJ4JjlnvM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761577951;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=hW97odhM9uO/XARUDOadwueA3k57Xsj3ULKP5Obq3Vs=;
	b=hS5m5Fu+MbHy/oVUia09FXh9MSx2928G7K7rUAdUmS5oNrJeniJsasiZP09KkZcc
	VA2npHN/ClJZTanUpVQjZG4prHxslpVmUp1hv9+KtZOBwKGcdNPsy7nwCqdyYf0HfOg
	VsYV1QAXcpKUX7bsq4z8no+D/oYFengFbSYqY3zA=
Received: by mx.zohomail.com with SMTPS id 17615779488931001.9507216437198;
	Mon, 27 Oct 2025 08:12:28 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 Hans Zhang <18255117159@163.com>,
 "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS"
 <linux-pci@vger.kernel.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, Anand Moon <linux.amoon@gmail.com>
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH v1 1/2] PCI: dw-rockchip: Add remove callback for resource cleanup
Date: Mon, 27 Oct 2025 16:12:19 +0100
Message-ID: <5235617.GXAFRqVoOG@workhorse>
In-Reply-To: <20251027145602.199154-2-linux.amoon@gmail.com>
References: <20251027145602.199154-1-linux.amoon@gmail.com>
 <20251027145602.199154-2-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_081243_907295_40ED844F 
X-CRM114-Status: GOOD (  20.11  )
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

On Monday, 27 October 2025 15:55:29 Central European Standard Time Anand Moon wrote:
> Introduce a .remove() callback to the Rockchip DesignWare PCIe
> controller driver to ensure proper resource deinitialization during
> device removal. This includes disabling clocks and deinitializing the
> PCIe PHY.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 87dd2dd188b4..b878ae8e2b3e 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -717,6 +717,16 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static void rockchip_pcie_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
> +
> +	/* Perform other cleanups as necessary */
> +	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
> +	rockchip_pcie_phy_deinit(rockchip);

You may want to add a

    if (rockchip->vpcie3v3)
            regulator_disable(rockchip->vpcie3v3);

here, since it's enabled in the probe function if it's found.

Not doing so means the regulator core will produce a warning
splat when devres removes it I'm fairly sure.

Kind regards,
Nicolas Frattaroli

> +}
> +
>  static const struct rockchip_pcie_of_data rockchip_pcie_rc_of_data_rk3568 = {
>  	.mode = DW_PCIE_RC_TYPE,
>  };
> @@ -754,5 +764,6 @@ static struct platform_driver rockchip_pcie_driver = {
>  		.suppress_bind_attrs = true,
>  	},
>  	.probe = rockchip_pcie_probe,
> +	.remove = rockchip_pcie_remove,
>  };
>  builtin_platform_driver(rockchip_pcie_driver);
> 





