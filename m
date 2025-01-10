Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F239E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 11:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wR5+Y6S+TFCWjzE2EROBwv9IAeYi3VdwsFqFVi4nvyU=; b=uscCpNGpeJliTNP2qgKXUm/St8
	CXsNy7ik6WgR2BLbyIP6JIy6ZrEMfqUCJUiQ/JF5S7/5vUSLbtVC6zwqsw8llpDbSduG1fOlBwaYO
	yjL7Ng/c8m9dgsm9QhpPRoPmiszVfvK0u00BbTzkiLb+cNRwLB4DiyDyoBZQoJ27zOa0UUEa6O49P
	h3aODrlV8rYJrQVoebmcKuIpZ6u3RHOC1R1mm4GAEvPo82/TUPDCGmC29DO6Oh+10bnIU7e0DNWnc
	D1LeKpdnqPYHjTgkm57ZmFBiDkY454vpwUnvOxnwD4T5zGXWm4gWGrVv1f4j7CYBC9LXcBJEhiSLY
	Q2kfWskQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD6A-0000000F6Fc-3xKZ;
	Fri, 10 Jan 2025 11:22:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD4H-0000000F5x9-2rQ5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 11:20:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D4906A41DD1;
	Fri, 10 Jan 2025 11:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CABDBC4CED6;
	Fri, 10 Jan 2025 11:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736508044;
	bh=CnVu8Rrlov2McslMdQFWTwwznk9jD78HlW8nvi+ZtrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cu9mj9HJV4evYEMzlEc18dxiPFvM+JpC5aN9F0WIsvjeL/6MMoUA55Lk6IvneFdxB
	 wQPk8XpAaLmPQPOWTaDrFalVkb4P4ySL+Hwfxjm/4ttBx9kVThJTpqj27RyWIUE7od
	 T0ZCvrYit8TADZFMMxM01DcqlVwhOvsLlljapZajCPFxvc2+JH9RmTMJYrbXOXzfCM
	 m015FXjGzCTnxbRkA0gukwwypRDirMYKxm50N2jaQCH0xJpS/W6WNRYckKdoRyaFWO
	 wSTmiKEDCI4tTrif2Z48hwBk/ZuebkT0pmMKuUg/zF/qvxkTx0rTzeN3GCO8pbzAVQ
	 Zi5lD+YUG8F7Q==
Date: Fri, 10 Jan 2025 12:20:38 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ahci: st: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
Message-ID: <Z4EChupSfaDEuIOI@x1-carbon>
References: <20250109175427.64384-1-rgallaispou@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109175427.64384-1-rgallaispou@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_032045_785752_4743863A 
X-CRM114-Status: GOOD (  22.63  )
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

On Thu, Jan 09, 2025 at 06:54:27PM +0100, Raphael Gallais-Pou wrote:
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
> -- 
> 2.47.1
> 

Reviewed-by: Niklas Cassel <cassel@kernel.org>

