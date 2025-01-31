Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC85C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 11:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7vfH4Sgbx8sGmHpacPWSYRXDbwnTm7hjUlAlA09Dfc=; b=T/FPbMFM7iIyJwcUePkd4e8oBX
	S1rld3lMyw1iN3i82WAuXQ0Si7aPShSnIj24LugM8kY8hFWOws4QaO+8yQ6CfdP4X5Tre0Z5U9MrN
	guVcQL7O9waISsXIft816DjHRf0SZ0jJNXzwp8Q+Q5mjpFAeTK8zRcvxLG5wZ8QF2lmUD+inQggR0
	TeGR0i7NAegJj52hLioG0tm2FuJvVknz4hozRxDZMnq33ho6lSxTwXQ1OMhPNXO0EQPdMeXe7YLWY
	0xa3xemErIhPg2do+IGRuT/j04tGvrnqW2l00GLCdbvJNqtTCI6iyVXpGa0CF0sSSwm8BcVfNkITS
	HIanixjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdpax-0000000AYbM-0FuT;
	Fri, 31 Jan 2025 11:53:59 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdpZS-0000000AYU0-3BZp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 11:52:27 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so2453227a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 03:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738324345; x=1738929145; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k7vfH4Sgbx8sGmHpacPWSYRXDbwnTm7hjUlAlA09Dfc=;
        b=ZOaOk4yJS4+4ycIMX9GaCgK8UaLbwZBx4VbnxG0ChIJwxTjT12m7UdjUQ4rV5epJN9
         hBLCXuqiwFpkIDxI7WcbK6kUpmiN6vxNUOftgRZe3Qni0GEW3FFJ05e+FVtomBnf2v+H
         rGOvxoI5gjNWNusTapJqoBVSw7Iix5xZvzIHyzMUlPl0861k0SJ+HaDc33DF608tAzWm
         Su0CEzOpN0K4k4tD6zCAhfrB7QKZKD2OBx++LKZALLUyUFkmI0ckkK6aoRI8/U3qqV5L
         1qPs1IipuFCzQkvmEerG2alpgg2CG4GtfN4Bg8mllPEMWEvWRaOpI52h0wjJER4XKC6C
         j+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738324345; x=1738929145;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k7vfH4Sgbx8sGmHpacPWSYRXDbwnTm7hjUlAlA09Dfc=;
        b=ZpEldvgVPQHb3w+PKdyb2aypZNyd0nD1yWJRebUUV4Tu7rcaUeYrn2lN+StYs9sYG8
         SNeEy+IStkY0MgzazOzWIDALYdE0CL3GAORVXtBN2swKaETze8EFJr//+adVgynj5JLu
         wpaetzFl7/LEFTz2OsMKniRSU5g3UeSKOztPeVPeD8sRuC5tepjlE2LTUoXoBQOXlWpS
         22zN9kGNOIPFvAYQaPSXOpBpCK92Gh+tt2JbvTc9yJRiSCNv3yi7gnsih3AAalwBUFx3
         iuHoOodA6hYMUv1tsOg/QLN9Yk7ji35HLa8djhxah/+PcORWMFrjVkuOGyFO+eGp14Od
         lYnA==
X-Forwarded-Encrypted: i=1; AJvYcCXFPA7ksc+LKEGsw99vwl/5qShX+V4sjLlTwgr6ud/QoSeEtVqkroBX/06MfGIV/bIo1iWpukNHHOmHoPmT38DK@lists.infradead.org
X-Gm-Message-State: AOJu0YxfnNp2qt3i1BQIEEQi2Jlpjz0gwfEI8IPF5gzmhW2Iezr/e/f/
	n5MJK98rEOT9OZSAqmhhLSd2wlZbK7ILZQTD/VfuI3dpm6gcsS8oegushacQ+A==
X-Gm-Gg: ASbGncs7NkMHwrdOukXbuLgqA4hHzpxBRDhgqeUYNK3ldfEX2WAnYMDDWS3A5A5lq+y
	T90HPiq9fj51NusuWUdVR5drtu+r5wiKSjmdublGkZZ2XNFhNdp2dWyhtBV1efYAXuPdqOTqMAc
	XYP+GLNHWCTDFpE4Xfag5tqJLUfN3aNXFV+bjvGBBkmm74lRQAAs1KNArtkItBKnGDv3Uazz1KZ
	Lvu/Znuu578V40qJdGwQcydn9/uIUSDAO9hxaSwBO1B5kVGyqXvIgyZwE25+cfVVIQPZZGs9pvD
	LqYXfS3H5e6P6xHOemLGkWKeuA==
X-Google-Smtp-Source: AGHT+IH8kZTc6caDBWl7vN/cLXEXPX/ziS+zmhHeSacd6exwy3GZEb1SvfXm7pZ6ALinPkamOfpQog==
X-Received: by 2002:a17:90b:520d:b0:2ee:dd9b:e3e8 with SMTP id 98e67ed59e1d1-2f83abd8adfmr15401669a91.8.1738324345440;
        Fri, 31 Jan 2025 03:52:25 -0800 (PST)
Received: from thinkpad ([120.60.68.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f8489d2c20sm3368655a91.22.2025.01.31.03.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 03:52:24 -0800 (PST)
Date: Fri, 31 Jan 2025 17:22:17 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] PCI: brcmstb: Fix for missing of_node_put
Message-ID: <20250131115217.qu4ue4cfmdt7gudf@thinkpad>
References: <20250122222955.1752778-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250122222955.1752778-1-svarbanov@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_035226_789002_C2F86DB6 
X-CRM114-Status: GOOD (  20.62  )
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

On Thu, Jan 23, 2025 at 12:29:55AM +0200, Stanimir Varbanov wrote:
> A call to of_parse_phandle() is incrementing the refcount, of_node_put
> must be called when done the work on it. Add missing of_node_put() after
> the check for msi_np == np and MSI initialization.
> 
> Cc: stable@vger.kernel.org # v5.10+
> Fixes: 40ca1bf580ef ("PCI: brcmstb: Add MSI support")
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> v1 -> v2:
>  - Use of_node_put instead of cleanups (Florian).
>  - Sent the patch separately from PCIe 2712 series (Florian).
> 
>  drivers/pci/controller/pcie-brcmstb.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index 744fe1a4cf9c..d171ee61eab3 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -1844,7 +1844,7 @@ static struct pci_ops brcm7425_pcie_ops = {
>  
>  static int brcm_pcie_probe(struct platform_device *pdev)
>  {
> -	struct device_node *np = pdev->dev.of_node, *msi_np;
> +	struct device_node *np = pdev->dev.of_node;
>  	struct pci_host_bridge *bridge;
>  	const struct pcie_cfg_data *data;
>  	struct brcm_pcie *pcie;
> @@ -1944,9 +1944,14 @@ static int brcm_pcie_probe(struct platform_device *pdev)
>  		goto fail;
>  	}
>  
> -	msi_np = of_parse_phandle(pcie->np, "msi-parent", 0);
> -	if (pci_msi_enabled() && msi_np == pcie->np) {
> -		ret = brcm_pcie_enable_msi(pcie);
> +	if (pci_msi_enabled()) {
> +		struct device_node *msi_np = of_parse_phandle(pcie->np, "msi-parent", 0);
> +
> +		if (msi_np == pcie->np)
> +			ret = brcm_pcie_enable_msi(pcie);
> +
> +		of_node_put(msi_np);
> +
>  		if (ret) {
>  			dev_err(pcie->dev, "probe of internal MSI failed");
>  			goto fail;
> -- 
> 2.47.0
> 

-- 
மணிவண்ணன் சதாசிவம்

