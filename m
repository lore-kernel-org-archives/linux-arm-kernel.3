Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8864606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VgtxnOHL;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hi5nSi0Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOZ4Ter206XpxcOoYF6+q+So3F0oft7pzSF2vobVs3M=; b=VgtxnOHLtUFs53YrD+EYvFMGB+
	skTOBxJ5cBsuyPJni65mv0tHnWG8nBpoUISa4nJezgFggLDJ8PB8nQOhAyHGiNK3LrXjXQ54Dzu8d
	FdRZ6qqSmV905K8mQFf18VHySvTENwY62FmMla2DNPsnQHmd9YDHJTg3BFZV79Q7w2EUrx/muy5lD
	7OlMBbhCsYq2eIJH5eG+Ptwtd2T8BKnQxaghRmEK73knLeCOG63a4gQPLlz9LyvDe/QIo75OFPThF
	Nqd3gIuH7jEFOGj4PmnAU+y04aDlHmDlMqqoxxF4aoYO5HkvvaelM6XW8vz02lXIZ88gyIgW4M8Zs
	60YXgAEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzBs-00000008fOX-2ae2;
	Tue, 20 Oct 2026 02:03:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzBr-00000008fOR-2LLX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 02:02:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B1895600AA;
	Tue, 20 Oct 2026 02:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04711F000C4;
	Tue, 20 Oct 2026 02:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792461778;
	bh=nOZ4Ter206XpxcOoYF6+q+So3F0oft7pzSF2vobVs3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hi5nSi0Z8e4PuO1zKyB1ESBMT7Zc9KPxYUe3Bk9Z6LfL/4bOKOA+XMoewdt4dVXwO
	 1Y6PhXJZaVCbF4HFyBVScVN17PIkL46KDlsZ2hg/HtJIDoxqQ1rCrbfpdYb4JXR/Ef
	 84g8R1QG00wFQyOpX3UlpM7TqM7T+aJVmktP2c7F6iIXbBq7BMq9NwrDrVfBJtErR7
	 8SQVHrqkKNe7hrYc6kM82Hn2eclsjmJ++91F0fjdDVX4IBYbuOrb2YOqUdgYmYJxDP
	 XXe8tou7YeMTxbmY//w09p1rOdPnGrKrMJ77GKNMqtuuQ8LHfz1D2Nl2Am75fGcWrk
	 QEM61ljMCKXxA==
Date: Mon, 19 Oct 2026 19:02:56 -0700
From: "Peter Chen (Qualcomm)" <peter.chen@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Xu Yang <xu.yang_2@oss.nxp.com>, pawell@cadence.com, rogerq@kernel.org,
	gregkh@linuxfoundation.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	balbi@kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH] usb: cdns3: imx: fix kernel panic on remove due to kfree
 of static platform_data
Message-ID: <atbL0FjdTOQoJHjQ@hu-petche-lv.qualcomm.com>
References: <20261019084944.2051097-1-xu.yang_2@oss.nxp.com>
 <atZ_w13x6QgsMhwn@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atZ_w13x6QgsMhwn@SMW015318>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-10-19 15:38:27, Frank Li wrote:
> On Mon, Oct 19, 2026 at 04:49:44PM +0800, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> >
> > When cdns_imx_remove() calls of_platform_depopulate(), the child
> > platform device is destroyed. platform_device_release() then calls
> > kfree(pdev->dev.platform_data), but cdns3-imx assigns a pointer to
> > a static global variable as platform_data, so kfree() on it triggers
> > a kernel panic.
> >
> > [   56.809541] Call trace:
> > [   56.811982]  kfree+0x44/0x398 (P)
> > [   56.815300]  platform_device_release+0x24/0x4c
> > [   56.819747]  device_release+0x3c/0xa0
> > [   56.823413]  kobject_put+0xa0/0x120
> > [   56.826906]  klist_children_put+0x18/0x28
> > [   56.830920]  klist_prev+0xb4/0x1c0
> > [   56.834325]  device_for_each_child_reverse+0x7c/0xc8
> > [   56.839294]  of_platform_depopulate+0x34/0x80
> > [   56.843664]  cdns_imx_remove+0x34/0xcc [cdns3_imx]
> >
> > Fix this by iterating over child devices and clearing platform_data
> > to NULL before of_platform_depopulate() is called, preventing the
> > invalid kfree().
> >
> > Fixes: ff6d6e6c6778 ("usb: cdns3: imx: add glue layer runtime pm implementation")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> 
> >  drivers/usb/cdns3/cdns3-imx.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
> > index a2f041e1707c..2c86fadd2cf2 100644
> > --- a/drivers/usb/cdns3/cdns3-imx.c
> > +++ b/drivers/usb/cdns3/cdns3-imx.c
> > @@ -218,12 +218,20 @@ static int cdns_imx_probe(struct platform_device *pdev)
> >  	return ret;
> >  }
> >
> > +static int cdns_imx_reset_pdata(struct device *dev, void *data)
> > +{
> > +	if (device_is_compatible(dev, "cdns,usb3"))
> > +		dev->platform_data = NULL;
> > +	return 0;
> > +}
> > +
> >  static void cdns_imx_remove(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> >  	struct cdns_imx *data = dev_get_drvdata(dev);
> >
> >  	pm_runtime_get_sync(dev);
> > +	device_for_each_child(dev, NULL, cdns_imx_reset_pdata);
> >  	of_platform_depopulate(dev);
> >  	clk_bulk_disable_unprepare(data->num_clks, data->clks);
> >  	pm_runtime_disable(dev);
> > --
> > 2.34.1
> >
> >

-- 

Thanks,
Peter Chen

