Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68CFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 11:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcWTpUuwHc3vp9Y15hQsl1t8c8oElxF3i30tkzGmNng=; b=J/S+UqNKcAtCKZVMo3RhBsu94i
	4nvp0Gc2HasVBte675wG2aqQv+RSGv5+Jsz67NVGFiUoU8G1a7ySFSr6VXBoQhsgcTiC6kK/NDb+w
	xF7knEqXDvbYEQ6Ege+IbjeOY0YORn+cGcepEZWBxKYUwovSfAr7BBnSUfCCUcfpdfFgr/obG0mxP
	kzt9u9kyxqoS1nxnD80IKngPlRYIL7t8NrL9qhgZhCNox+zrM+vBkU0b9bvnG1WKlWu0+c0FwyCY3
	0+x5w4+NPcXp3etRTcsU5+EYsDfCNDZlP7O+JzylauiMmJYIl808QvHXIELBUx4a/USjOpxiXA6a8
	cCIyrA3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD86-0000000F6aC-3EjT;
	Fri, 10 Jan 2025 11:24:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD6t-0000000F6Kc-3wpO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 11:23:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 391D65C5DDF;
	Fri, 10 Jan 2025 11:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FD1C4CEDF;
	Fri, 10 Jan 2025 11:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736508206;
	bh=KlB2n0papsrbB6sk08QJS5YN5JfXu+H+SiMqh9K6uaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kH8BhyjyWMOOHTum/u+jv1OvOU5fWSm16S0HR+JgOUY2zCRkVADB/VAtU9d5gKaIW
	 kr1gHQ7dUAO5efeUJ7XyUeRG49IOiAHVpwsI/vBx6pqHmxcjlyajejpmX4yIgy6Pos
	 7lHsuslEauShd8KHM23jpgWasLPJxdhoVDnt6iqoQ9oPhbd+Qn76T68tlYNwG4DFXc
	 4oWathpCDWTfilwHpBfZUAcHYLsi2dPi/t7e+jC1cOhhyZ0kQN+RNnk9SvKWIKRq8T
	 TnFV4w2s3GJCzlS1Lq134ZxMU4zAaybrJGM+n3JxUV1GYZpJtfwjy2DYvf9evpdhGB
	 cj2x6rzgKKgEw==
Date: Fri, 10 Jan 2025 12:23:21 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ahci: st: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
Message-ID: <Z4EDKUb+hO0ovV2i@x1-carbon>
References: <20250109175427.64384-1-rgallaispou@gmail.com>
 <07a7177d-7705-4eb5-a11e-02a9429ffac2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07a7177d-7705-4eb5-a11e-02a9429ffac2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_032328_032142_E2F4730B 
X-CRM114-Status: GOOD (  28.12  )
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

On Fri, Jan 10, 2025 at 02:19:06PM +0900, Damien Le Moal wrote:
> On 1/10/25 02:54, Raphael Gallais-Pou wrote:
> > Letting the compiler remove these functions when the kernel is built
> > without CONFIG_PM_SLEEP support is simpler and less error prone than the
> > use of #ifdef based kernel configuration guards.
> > 
> > Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> > ---
> > Changes in v2:
> >   - Split serie in single patches
> >   - Remove irrelevant 'Link:' from commit log
> >   - Link to v1: https://lore.kernel.org/r/20241229-update_pm_macro-v1-4-c7d4c4856336@gmail.com
> > ---
> >  drivers/ata/ahci_st.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/ata/ahci_st.c b/drivers/ata/ahci_st.c
> > index 6b9b4a1dfa15..4336c8a6e208 100644
> > --- a/drivers/ata/ahci_st.c
> > +++ b/drivers/ata/ahci_st.c
> > @@ -176,7 +176,6 @@ static int st_ahci_probe(struct platform_device *pdev)
> >  	return 0;
> >  }
> >  
> > -#ifdef CONFIG_PM_SLEEP
> >  static int st_ahci_suspend(struct device *dev)
> >  {
> >  	struct ata_host *host = dev_get_drvdata(dev);
> > @@ -221,9 +220,8 @@ static int st_ahci_resume(struct device *dev)
> >  
> >  	return ahci_platform_resume_host(dev);
> >  }
> > -#endif
> 
> I do not think you can remove the ifdef here. Otherwise, there is going to be a
> compilation warning when CONFIG_PM_SLEEP is not enabled. No ?

Look at the pm_sleep_ptr macro:
include/linux/pm.h:#define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))

I would expect the function should be optimized out by the compiler
using dead code elimination.

Raphael, perhaps you could show the before and after output
using ./scripts/bloat-o-meter ?
(When the config is not enabled: before and after your patch.)


> 
> >  
> > -static SIMPLE_DEV_PM_OPS(st_ahci_pm_ops, st_ahci_suspend, st_ahci_resume);
> > +static DEFINE_SIMPLE_DEV_PM_OPS(st_ahci_pm_ops, st_ahci_suspend, st_ahci_resume);
> >  
> >  static const struct of_device_id st_ahci_match[] = {
> >  	{ .compatible = "st,ahci", },
> > @@ -234,7 +232,7 @@ MODULE_DEVICE_TABLE(of, st_ahci_match);
> >  static struct platform_driver st_ahci_driver = {
> >  	.driver = {
> >  		.name = DRV_NAME,
> > -		.pm = &st_ahci_pm_ops,
> > +		.pm = pm_sleep_ptr(&st_ahci_pm_ops),
> >  		.of_match_table = st_ahci_match,
> >  	},
> >  	.probe = st_ahci_probe,
> 
> 
> -- 
> Damien Le Moal
> Western Digital Research

