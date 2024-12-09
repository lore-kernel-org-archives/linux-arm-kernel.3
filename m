Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5762CE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 11:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9PmsohwRCXaZ4pTIrE5Tef+6KEfwnYxmCnoO4uaQp0=; b=ZDqa7V62fxav2J5z9UfWhlcaA9
	7q9Et6rqW8jxFvSbMQYnzB51aFXRHBUcymSZos9aho2qvEPwWsD6IQ47tcwOI+R9Pj7hYLg+5GHo4
	OGAgoD+TXBbjfKy5bJ48sNiC0Xldl6utPc9eAJMKpNZjv+aweBMDWautnaeNh28Va4m040s+mauw5
	/4EFc+3p0kAwRpxqoPNIAQmp2mQHrbaPANItkHRwbAPpDuu+1VEe6qoC1/xaI/3teaAedvIyGYjz6
	GtfYbOqqN3lOeu9ho/vWa+XTyhwdzwagInUhrTEqnqQ0nVlV7RObMFfCTNWT3jxTmhBD58ISYn8Ef
	y2ZCYohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbw6-00000007UeV-1Jva;
	Mon, 09 Dec 2024 11:28:22 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbv3-00000007USP-4Akb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 11:27:19 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B9BQxFv2461834
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Dec 2024 05:26:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733743619;
	bh=/9PmsohwRCXaZ4pTIrE5Tef+6KEfwnYxmCnoO4uaQp0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=aKOw0c2dZPDFVOgfLTAeiyDhSv+9n4zCs/K3iLibr1KUIq7tWL5bGk1Ix712B3m92
	 GxE3DANvLsljIADlimvMPFFih5TdzkUjkdsCcstqyy3n2sjxX0m7c2ubEWQoZB9tJT
	 vDlxr+SJwzaehudaxZ9APPmp05LoRKKHvfQD0Al0=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B9BQxHr108751
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Dec 2024 05:26:59 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Dec 2024 05:26:59 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Dec 2024 05:26:58 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B9BQvZD085644;
	Mon, 9 Dec 2024 05:26:58 -0600
Date: Mon, 9 Dec 2024 16:56:57 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Thomas Richard <thomas.richard@bootlin.com>
CC: <vigneshr@ti.com>, <s-vadapalli@ti.com>, <lpieralisi@kernel.org>,
        <kw@linux.com>, <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <theo.lebrun@bootlin.com>,
        <thomas.petazzoni@bootlin.com>, <kwilczynski@kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <gregory.clement@bootlin.com>, <u-kumar1@ti.com>
Subject: Re: [PATCH] PCI: j721e: In j721e_pcie_suspend_noirq() check
 reset_gpio before to use it
Message-ID: <laghliul4hk7lqzkt6i4ddnvfhyq7q5esgdzx24h5vaougtner@5wcboaak2cxy>
References: <20241209112321.65320-1-thomas.richard@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241209112321.65320-1-thomas.richard@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_032718_122903_42C5E553 
X-CRM114-Status: GOOD (  17.57  )
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
> 
> Fixes: c538d40f365b ("PCI: j721e: Add suspend and resume support")
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

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

Regards,
Siddharth.

