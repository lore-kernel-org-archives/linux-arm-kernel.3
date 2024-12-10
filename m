Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521A8E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 15:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=/zH2b3Q/y79ysbKyzeNkaxLMLyIpC/ld1UcVKIpjL54=; b=E2nWKzx+nrOPoR
	9tjzFLurtjO2iWp4/O55Cu4razyJl5P0vry46o2PYBby7Q6XBbclPhpToxI8kjpuPAmHstmq/wSbf
	EyqqSiJxr07RlnsLhEZM3r9rwVv58hJQFbo1Z9iDZ524ev9aZNPp8bq1LCmHzhbri/Oug5NiaPxOx
	l/9scVwulaxqTSWWRhFExUHwo6nBqcxbHgNOzFtFt+KDEc9rEACFtpsLvt35pTKyxDsissK/8IVYz
	3qXeYr28/V8s8YgSMQ5rDH+0eUI7MP62WUusAXBAkkpq3GXl/cW0p++I2vnu3zBljqKvr44M7FHZv
	HinDcYrPCpsnhDsl2KJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2Pi-0000000Byrz-3WKg;
	Tue, 10 Dec 2024 15:44:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2O2-0000000Bybo-2IXU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 15:42:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5915D5C586D;
	Tue, 10 Dec 2024 15:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C7AC4CEDE;
	Tue, 10 Dec 2024 15:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733845377;
	bh=2/nMlbfdV4p9tEV8SRlLwSHuMSVq76uOgvT6G4bvhkc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=p9OvaSGdsBHtBV+u6BMqLQg4dMbrtbKVJGCnioNPNAuewZc8+7HQk+R74m9X4MvfB
	 KD2f4yCuarwPFBGav5WHxBjeLOiS7OHKrtlD64OlUWrftIBudKTt4b5qSaK1SOcDya
	 IA4iq8mpI/HlFA46RuGqoFwtKfKmmwQWrNYurWl1OykRNy23YoBR1lDs+1IrWrQ15k
	 lGVKn3n+btx67K1JzeXMssQ1t/Fv6Y6Ka34/qD5CrOGre+1tNtlzHQO7Zrvlt7jku6
	 ZID91j5zqUbo0szVXIzmYzzDqciORW8WKbcPEyj0LDUf1RKnlHD03UAuEOQ7dq/bKh
	 Ws7L1Jg4gdIiA==
Date: Tue, 10 Dec 2024 09:42:56 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: vigneshr@ti.com, s-vadapalli@ti.com, lpieralisi@kernel.org,
	kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, theo.lebrun@bootlin.com,
	thomas.petazzoni@bootlin.com, kwilczynski@kernel.org,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	gregory.clement@bootlin.com, u-kumar1@ti.com
Subject: Re: [PATCH] PCI: j721e: In j721e_pcie_suspend_noirq() check
 reset_gpio before to use it
Message-ID: <20241210154256.GA3242512@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209112321.65320-1-thomas.richard@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_074258_627056_E9C61A59 
X-CRM114-Status: GOOD (  21.10  )
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

On Mon, Dec 09, 2024 at 12:23:21PM +0100, Thomas Richard wrote:
> The reset_gpio is optional, so in j721e_pcie_suspend_noirq() check if it is
> not NULL before to use it.

If you have occasion to post a v2, update subject to:

  PCI: j721e: Check reset_gpio for NULL before using it

s/before to use it/before using it/

Did you trip over a NULL pointer dereference here?  Or maybe found via
inspection?

It looks like gpiod_set_value_cansleep(desc) *should* be a no-op if
desc is NULL, based on this comment [1]:

 * This descriptor validation needs to be inserted verbatim into each
 * function taking a descriptor, so we need to use a preprocessor
 * macro to avoid endless duplication. If the desc is NULL it is an
 * optional GPIO and calls should just bail out.

and the fact that the VALIDATE_DESC_VOID() macro looks like it would
return early in that case.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/gpiolib.c?id=v6.12#n2316

> Fixes: c538d40f365b ("PCI: j721e: Add suspend and resume support")
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>  drivers/pci/controller/cadence/pci-j721e.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> index 0341d51d6aed..5bc14dd70811 100644
> --- a/drivers/pci/controller/cadence/pci-j721e.c
> +++ b/drivers/pci/controller/cadence/pci-j721e.c
> @@ -644,7 +644,9 @@ static int j721e_pcie_suspend_noirq(struct device *dev)
>  	struct j721e_pcie *pcie = dev_get_drvdata(dev);
>  
>  	if (pcie->mode == PCI_MODE_RC) {
> -		gpiod_set_value_cansleep(pcie->reset_gpio, 0);
> +		if (pcie->reset_gpio)
> +			gpiod_set_value_cansleep(pcie->reset_gpio, 0);
> +
>  		clk_disable_unprepare(pcie->refclk);
>  	}
>  
> -- 
> 2.39.5
> 

