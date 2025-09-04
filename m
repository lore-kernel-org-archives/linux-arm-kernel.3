Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CC5CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 20:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ljcWFrJPcaRe8xII62FUT6usRu6iFKKNC7dwzJQr+E=; b=UkKhaQ2RFdZ9Y7H3DhGLiC49xc
	nKdpPXaZ8EVRpVQO9hUJQo4Hr3DSi5V/iBbmh27fvxHftRkDGJDHaxNQSu9lohIGKdAyTiK65EcrV
	HvYg7QTem3ukARFXnk9a8CcP0ep3DlI4YLp/Nx2NiwctX/99SD4jXz8wHyYQtwiMpeTryx5wVIz+4
	7k+5u3RlT+7Slr+kLo2nZUnMMcHb4CHh6JdCjWVvrqQ29L4o5UJ7WGyzoCRRmJjuJ3UBjbXrRb78A
	lWZe9N3tRVmRVrK4qMIa8L+IE+5qxx27tSKQBCrLRc1XzsRDecebxAVKnU7jFLK7XXp2QEZaXDhla
	wLymlaqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGGE-0000000EA2r-1dAM;
	Thu, 04 Sep 2025 20:08:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuDT1-0000000DAeK-1upZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 17:09:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BCD543A4C;
	Thu,  4 Sep 2025 17:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9297BC4CEF0;
	Thu,  4 Sep 2025 17:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757005786;
	bh=Kb5OEk6CH681dR8WwdpshUf8PEmUll6MbXBONva8auo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPSwdcJP4MCiJ8QOfsVD77rIQdkXbfYiHaf4DPc/qOL1RGsR7t1mB26BNa/wvie6/
	 ts8MIC5y8oLbQYvx0SMK33g32n5jSPH56QYrTHBu58/OwGaH4ZukJobGqMjoJfrDIL
	 eIi1ufaEBTSeaoJQ1Ob4zLrTGy+/35sR7cL2JoNSPhdlU8Lrll1PsE86mPd9dxw1X1
	 VsUcDNGjRIGA7Ti6yC45ONK39KNjqcXDi71D4bz33iTtNq6s/A+P/Kcuf5z57Ds/QV
	 afQ/Sn8+EkWLyvj5vV81lEF2v2UuedyRrmT89OraQjWTmYe2ZW5/pFcMeANV7zKhPt
	 aQ1vSw3Vn+lCg==
Date: Thu, 4 Sep 2025 22:39:34 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] PCI: imx6: Enable the vpcie3v3aux regulator when
 fetch it
Message-ID: <piirka3qlna6k33r2eutg26s2iepnvubzbdps6rh5b2tzhxxmg@c7nv3jgkwxpw>
References: <20250820022328.2143374-1-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250820022328.2143374-1-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_100947_515259_A5973EB3 
X-CRM114-Status: GOOD (  23.10  )
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

On Wed, Aug 20, 2025 at 10:23:28AM GMT, Richard Zhu wrote:
> Refer to PCIe CEM r6.0, sec 2.3 WAKE# Signal, WAKE# signal is only
> asserted by the Add-in Card when all its functions are in D3Cold state
> and at least one of its functions is enabled for wakeup generation. The
> 3.3V auxiliary power (+3.3Vaux) must be present and used for wakeup
> process.
> 
> When the 3.3V auxiliary power is present, fetch this auxiliary regulator
> at probe time and keep it enabled for the entire PCIe controller
> lifecycle. This ensures support for outbound wake-up mechanism such as
> WAKE# signaling.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
> v5 changes:
> - Use the vpcie3v3aux property instead of adding a duplicated one.
> - Move the comments from the code changes into the description of
>   commit.
> 
> v4 changes:
> Move the dt-binding to snps,dw-pcie-common.yaml.
> 
> v3 changes:
> Add a new vaux power supply used to specify the regulator powered up the
> WAKE# circuit on the connector when WAKE# is supported.
> 
> v2 changes:
> Update the commit message, and add reviewed-by from Frank.
> https://patchwork.kernel.org/project/linux-pci/patch/20250619072438.125921-1-hongxing.zhu@nxp.com/
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 5a38cfaf989b1..5067da14bc053 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1739,6 +1739,10 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	pci->max_link_speed = 1;
>  	of_property_read_u32(node, "fsl,max-link-speed", &pci->max_link_speed);
>  
> +	ret = devm_regulator_get_enable_optional(&pdev->dev, "vpcie3v3aux");
> +	if (ret < 0 && ret != -ENODEV)
> +		return dev_err_probe(dev, ret, "failed to enable pcie3v3vaux");
> +

So if Vaux is available, do we still need the IMX95_PCIE_SYS_AUX_PWR_DET setting
in imx95_pcie_init_phy()?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

