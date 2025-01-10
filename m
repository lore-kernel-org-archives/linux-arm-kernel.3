Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EA9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 05:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPDquhxMX9vaFDTXHVA6LAau+AcOL9+CiAdfTAXUjBk=; b=rWK+wC0ZSmcoUGoK74bxbl1fRO
	KsKB3em5uqop17Uf6vhrAgGVrhhYDIs0MmBx/9XFdJqUfGV9LSW1V0oXZRrMnqtsPJeDlIbv3p0d4
	7X5L/s58DQzuZogRz4Qypi9LeAWlX1qJ0tEvPvLZanjNoKX0WABE1fEIEG0VtEwZycnMbCj1Z+nZv
	RiVBGoeBBjqV3EY6CNWhWduW91wiA6V0gxMNVv/IkSa7A31s99eVLs9Fwt46acTSAtrPF06ROJdJq
	Rn/yt12U5pw/lEPaqp01p4QtLIqRgJGg28XQJjL7IWwoYyf0YZIEZFN/Q5hSM9L4OYwcDRcZbAwW1
	4mKLdXYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW7Rf-0000000E1kc-1PVN;
	Fri, 10 Jan 2025 05:20:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW7QR-0000000E1d3-2E3w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 05:19:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 703805C56BF;
	Fri, 10 Jan 2025 05:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AAF9C4CED6;
	Fri, 10 Jan 2025 05:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736486348;
	bh=lJGsVXqUs2Eum4m3O+xfSSfo97fQH+EomtGAdP5lDBM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nnsmWvE0lXNfmv0ghEdPUHR9HfU53nEAyBAGwI4Q050cOIaP/GotVhKGXUVcTVgFp
	 mx/ut8uxQYR9vL7TF/F/aKMecVGEWJsxoYZ1mgj6W/H99h4xR6BWqde2a4Nc+2/Zqj
	 1zqlPphm+9BhVA/K0MYlSTp7cUZOiteNSVxpmBcsIuv3mJTcnzzl6V6GWU15fLfP+j
	 MWC8EG8XSH6PnbAH8AyCA/xGt4gUJAPSa8CxPjnJG3Lfl5OVLOGhHytZr7SAKud4dd
	 Z1xThh4OSOo7mJetLBpCHDwn+Jnu4p/oy6KP7q9mevf8pUE8DnldHtkP5ZiCKUhic2
	 CPIyqEN4XngxA==
Message-ID: <07a7177d-7705-4eb5-a11e-02a9429ffac2@kernel.org>
Date: Fri, 10 Jan 2025 14:19:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ahci: st: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
To: Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Niklas Cassel <cassel@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250109175427.64384-1-rgallaispou@gmail.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250109175427.64384-1-rgallaispou@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_211915_610536_8F81588E 
X-CRM114-Status: GOOD (  22.30  )
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

On 1/10/25 02:54, Raphael Gallais-Pou wrote:
> Letting the compiler remove these functions when the kernel is built
> without CONFIG_PM_SLEEP support is simpler and less error prone than the
> use of #ifdef based kernel configuration guards.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
> Changes in v2:
>   - Split serie in single patches
>   - Remove irrelevant 'Link:' from commit log
>   - Link to v1: https://lore.kernel.org/r/20241229-update_pm_macro-v1-4-c7d4c4856336@gmail.com
> ---
>  drivers/ata/ahci_st.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/ata/ahci_st.c b/drivers/ata/ahci_st.c
> index 6b9b4a1dfa15..4336c8a6e208 100644
> --- a/drivers/ata/ahci_st.c
> +++ b/drivers/ata/ahci_st.c
> @@ -176,7 +176,6 @@ static int st_ahci_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int st_ahci_suspend(struct device *dev)
>  {
>  	struct ata_host *host = dev_get_drvdata(dev);
> @@ -221,9 +220,8 @@ static int st_ahci_resume(struct device *dev)
>  
>  	return ahci_platform_resume_host(dev);
>  }
> -#endif

I do not think you can remove the ifdef here. Otherwise, there is going to be a
compilation warning when CONFIG_PM_SLEEP is not enabled. No ?

>  
> -static SIMPLE_DEV_PM_OPS(st_ahci_pm_ops, st_ahci_suspend, st_ahci_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(st_ahci_pm_ops, st_ahci_suspend, st_ahci_resume);
>  
>  static const struct of_device_id st_ahci_match[] = {
>  	{ .compatible = "st,ahci", },
> @@ -234,7 +232,7 @@ MODULE_DEVICE_TABLE(of, st_ahci_match);
>  static struct platform_driver st_ahci_driver = {
>  	.driver = {
>  		.name = DRV_NAME,
> -		.pm = &st_ahci_pm_ops,
> +		.pm = pm_sleep_ptr(&st_ahci_pm_ops),
>  		.of_match_table = st_ahci_match,
>  	},
>  	.probe = st_ahci_probe,


-- 
Damien Le Moal
Western Digital Research

