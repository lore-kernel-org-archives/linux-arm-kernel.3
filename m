Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD58CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGrk2oPo0H7A+ik7BU/ig11tdFGBFYIllqz/ZbusC4w=; b=lZ6BP86DZnNULkpBmltYlyVjVW
	r01CxfPXcodJmbsDSpMeO96frtd+J9fJTUTQhQaV2CYhFWxdChPweRVq7Er0EMhkHHDeSrkQrNAiM
	rDQ1+HvuGXnHYogPXxkmlIz/R+WgvoZH631f1/itbBoJDNKpjY9sDpQUrSu4oJIfwG5ISIe1Tf2Ne
	0V3rzgVP213/DWb6s6sqPbKlRYYI1a7yiwJz3tRyo1Cg+5lCh9/VBF/R85wO6tgLldtZWRH2D1rjE
	hMidk4PCM3tvRcz1wZwo8O95RKXt0AzLT4sz42cq4jndDWkXvtFSk1rixbv09HTBO4Aq7toOw4TuH
	amweVhXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNR-00000001Yyu-33ej;
	Tue, 02 Sep 2025 19:09:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQHL-0000000HN47-25tr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 12:38:28 +0000
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8408DC77;
	Tue,  2 Sep 2025 14:37:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756816637;
	bh=E7533lX6MAykX99kEXEDHRaSmvwJZBHmZuyZ+hSEuDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7IjiLZJrdTo7odl3ewl6xeftk66e0FJE5SY4uQ5HzNOgIhoXDJm/XjCq2Zg1OB6q
	 KN+RSD0GQiPZHE8i/VhO7eE94s6ELIMfxzEy9wwZTHVHpLdaIajy1M5A2r4FdTMSPi
	 3m9WHxqZcQaFE7dQGw2oVw3Swfdvuca/Lj0OxX8Q=
Date: Tue, 2 Sep 2025 14:38:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
	rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm,
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] imx-mipi-csis: Get the number of active lanes from
 mbus_config
Message-ID: <20250902123805.GL13448@pendragon.ideasonboard.com>
References: <20250814113701.165644-1-isaac.scott@ideasonboard.com>
 <aJ77VTtZy96JJCHE@valkosipuli.retiisi.eu>
 <20250815103205.GJ6201@pendragon.ideasonboard.com>
 <aJ8ZJFSn5Wxhj2Aj@valkosipuli.retiisi.eu>
 <20250815113633.GM6201@pendragon.ideasonboard.com>
 <aJ8pKs_6YpAiPjlq@valkosipuli.retiisi.eu>
 <20250819024413.GJ5862@pendragon.ideasonboard.com>
 <175681611736.1349241.9877873145029586025@isaac-ThinkPad-T16-Gen-2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175681611736.1349241.9877873145029586025@isaac-ThinkPad-T16-Gen-2>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_053827_675338_8CE67734 
X-CRM114-Status: GOOD (  39.52  )
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

On Tue, Sep 02, 2025 at 01:28:37PM +0100, Isaac Scott wrote:
> Quoting Laurent Pinchart (2025-08-19 03:44:13)
> <snip>
> > > > > > That would need to parse the endpoint every time we start streaming, it
> > > > > > doesn't sound ideal.
> > > > > 
> > > > > Perhaps not, but does that matter in practice? Parsing the endpoint is,
> > > > > after all, fairly trivial. The advantage would be simplifying drivers.
> > > > 
> > > > It's trivial from a code point of view, but it's not a cheap operation.
> > > > I'd like to avoid making starting streaming more expensive.
> > > 
> > > How cheap is "not cheap"? I'd be surprised if parsing an endpoint took more
> > > time than e.g. an I²C register write. Of course it depends on the CPU...
> > 
> > Still, it's not cheap, and I think it can easily be avoided.
> > 
> > > > > Alternatively we could think of caching this information somewhere but I
> > > > > don't think it's worth it.
> > > > 
> > > > Drivers likely need to parse endpoints for other reasons. I'd cache the
> > > > value in drivers, like done today, and pass it to a get_active_lanes
> > > > helper.
> > > 
> > > Then drivers presumably would also validate this against the endpoint
> > > configuration, wouldn't they? That's extra code in every CSI-2 receiver
> > > driver.
> > 
> > Why so ? The number of connected lanes can be passed to the helper
> > function, which can use it to validate the number of lanes reported by
> > the source subdev.
> 
> Apologies if I'm interpreting this wrong, but it seems that the main
> thing I'm reading is that this is not the correct place to implement
> this, and it should be implemented at a higher level (e.g. in v4l2) that
> lets all MIPI CSI reciever drivers use it?
> 
> I have noticed that similar functionality has been implemented as part
> of __v4l2_get_link_freq_pad. Are you suggesting that I take a similar
> approach and resubmit as a new series?

As far as iI understand, Sakari would like a helper function that will
query the remote subdev for the number of data lanes it uses, and
validates that against the number of connected data lanes as described
by DT. I don't like the idea of parsing the endpoint properties every
time we do so, so I think the number of connected data lanes should be
passed by the driver to the helper instead. The helper would still query
the remote subdev, and validate the value.

> > > > > > > The function could take struct media_pad pointer as an argument, or struct
> > > > > > > v4l2_subdev pointer and the pad number.
> > > > > > > 
> > > > > > > I wonder if any other parameters could change dynamically but I can't think
> > > > > > > of that now, so perhaps just the number of lanes is what the function
> > > > > > > should indeed return.
> > > > > > > 
> > > > > > > > +
> > > > > > > > +   return 0;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >  static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > > > > > > >  {
> > > > > > > >     struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > > > > > > > @@ -965,6 +1002,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > > > > > > >     format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
> > > > > > > >     csis_fmt = find_csis_format(format->code);
> > > > > > > >  
> > > > > > > > +   ret = mipi_csis_get_active_lanes(sd);
> > > > > > > > +   if (ret < 0)
> > > > > > > > +           dev_dbg(csis->dev, "Failed to get active lanes: %d", ret);
> > > > > > > > +
> > > > > > > >     ret = mipi_csis_calculate_params(csis, csis_fmt);
> > > > > > > >     if (ret < 0)
> > > > > > > >             goto err_unlock;

-- 
Regards,

Laurent Pinchart

