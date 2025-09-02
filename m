Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B57DCA100F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2m0AdmzVx62ppePfQnYhxMw6RCz/hoGAXew6yRRziDg=; b=kR5uumlYYyvb6Rm33n04Z9ryoW
	whIldWPlF3DQa6TQJLkwxpuA9tglOfhVVghMCX++MIc6B+2JrAf5pmpsfPBTCKNGSNaxP4+ggyiTE
	RegbypP2slD3DkSWqpsf1u/XBcImReppJSwn+I4cTw77v60aBTuFg/AWId6kChfIRqT2cdIGe+D6U
	zv2e+c6YaPwg9VOiLe4VLGdEz9dTRHNhKoaOFXXIvbA8LsW0t+1cxF3uWJjrq/s3CuWgcgu/RN6MZ
	Om8rS6ChMVM2WJY2PJLYz0Q5CDr/es7zAZJXvLcVeJp0F6zmHu15uOxTFJ0tfyehSEEEfSjBFiitJ
	gE4ZFybA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNS-00000001Z0a-3k8H;
	Tue, 02 Sep 2025 19:09:11 +0000
Received: from meesny.iki.fi ([2001:67c:2b0:1c1::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQR1-0000000HQBk-2nmg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 12:48:29 +0000
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cGQWx2kLbzyRp;
	Tue,  2 Sep 2025 15:48:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1756817296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2m0AdmzVx62ppePfQnYhxMw6RCz/hoGAXew6yRRziDg=;
	b=oD7/YPfrsYF7PqocSEKmT0mRJYjbdf0f+hJIpls01m/zB7brfUZRxI3iZ6H6juIFF9vR5b
	I5ij7AQaKok6tXEhHwoUOjVy3MZXQ+bm4T/rcJWYyK92+81ZhrvNr/F3C/W1ARspXTYsbt
	7EE5UnkBi/bV2iOMHKREoS+JUv9j5Ss=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1756817296; a=rsa-sha256; cv=none;
	b=inniAaeJ3cVCOuLXCrrmGOkUPS8+/0QrPFZyvGS7PBqY5RdBqdOvoW+fgPRqFDwDaozrNk
	bcWaq7Jrq28xHUaeYry4EduTtrMNoFRtd+JL3rzPyCObHiJCdoDv3+l/+k1ZQLIRskOMTW
	cBjV10vQK05w1wWvX8dK1U8KRoROsD4=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1756817296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2m0AdmzVx62ppePfQnYhxMw6RCz/hoGAXew6yRRziDg=;
	b=TVokqAm9YtsAIJtOLvtXvL6q0rWppmcxEl99Jjp/YiRh+BBysDbQUpd7zcxuO5WEpfO3Dh
	FFT1A6u11PRC4KxaDmLVGBJXY0TXVplpyfQutYI1JWuV1sHcrFSb9ftx/eoctgdeGDAwLS
	Z6wsX1x19hjcQxJ5NF9ES2tSJ1y6now=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9C9C8634C93;
	Tue,  2 Sep 2025 15:48:12 +0300 (EEST)
Date: Tue, 2 Sep 2025 15:48:12 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, linux-media@vger.kernel.org,
	rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm,
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] imx-mipi-csis: Get the number of active lanes from
 mbus_config
Message-ID: <aLbnjLapJXlCe67R@valkosipuli.retiisi.eu>
References: <20250814113701.165644-1-isaac.scott@ideasonboard.com>
 <aJ77VTtZy96JJCHE@valkosipuli.retiisi.eu>
 <20250815103205.GJ6201@pendragon.ideasonboard.com>
 <aJ8ZJFSn5Wxhj2Aj@valkosipuli.retiisi.eu>
 <20250815113633.GM6201@pendragon.ideasonboard.com>
 <aJ8pKs_6YpAiPjlq@valkosipuli.retiisi.eu>
 <20250819024413.GJ5862@pendragon.ideasonboard.com>
 <175681611736.1349241.9877873145029586025@isaac-ThinkPad-T16-Gen-2>
 <20250902123805.GL13448@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902123805.GL13448@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_054827_906273_7EE1AE40 
X-CRM114-Status: GOOD (  44.41  )
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

Hi Laurent, Isaac,

On Tue, Sep 02, 2025 at 02:38:05PM +0200, Laurent Pinchart wrote:
> On Tue, Sep 02, 2025 at 01:28:37PM +0100, Isaac Scott wrote:
> > Quoting Laurent Pinchart (2025-08-19 03:44:13)
> > <snip>
> > > > > > > That would need to parse the endpoint every time we start streaming, it
> > > > > > > doesn't sound ideal.
> > > > > > 
> > > > > > Perhaps not, but does that matter in practice? Parsing the endpoint is,
> > > > > > after all, fairly trivial. The advantage would be simplifying drivers.
> > > > > 
> > > > > It's trivial from a code point of view, but it's not a cheap operation.
> > > > > I'd like to avoid making starting streaming more expensive.
> > > > 
> > > > How cheap is "not cheap"? I'd be surprised if parsing an endpoint took more
> > > > time than e.g. an I²C register write. Of course it depends on the CPU...
> > > 
> > > Still, it's not cheap, and I think it can easily be avoided.
> > > 
> > > > > > Alternatively we could think of caching this information somewhere but I
> > > > > > don't think it's worth it.
> > > > > 
> > > > > Drivers likely need to parse endpoints for other reasons. I'd cache the
> > > > > value in drivers, like done today, and pass it to a get_active_lanes
> > > > > helper.
> > > > 
> > > > Then drivers presumably would also validate this against the endpoint
> > > > configuration, wouldn't they? That's extra code in every CSI-2 receiver
> > > > driver.
> > > 
> > > Why so ? The number of connected lanes can be passed to the helper
> > > function, which can use it to validate the number of lanes reported by
> > > the source subdev.
> > 
> > Apologies if I'm interpreting this wrong, but it seems that the main
> > thing I'm reading is that this is not the correct place to implement
> > this, and it should be implemented at a higher level (e.g. in v4l2) that
> > lets all MIPI CSI reciever drivers use it?
> > 
> > I have noticed that similar functionality has been implemented as part
> > of __v4l2_get_link_freq_pad. Are you suggesting that I take a similar
> > approach and resubmit as a new series?
> 
> As far as iI understand, Sakari would like a helper function that will
> query the remote subdev for the number of data lanes it uses, and
> validates that against the number of connected data lanes as described
> by DT. I don't like the idea of parsing the endpoint properties every
> time we do so, so I think the number of connected data lanes should be
> passed by the driver to the helper instead. The helper would still query
> the remote subdev, and validate the value.

As long as the bulk of the work is done by the helper, I'm fine. This is a
fairly specific need but still in principle every CSI-2 receiver driver
needs it, so ease of use does count.

The helper could e.g. take the number of lanes in the endpoint as an
additional argument and just return the value if the sub-device doesn't
implement get_mbus_config() pad op. That'd be fairly trivial to use in a
driver.

> 
> > > > > > > > The function could take struct media_pad pointer as an argument, or struct
> > > > > > > > v4l2_subdev pointer and the pad number.
> > > > > > > > 
> > > > > > > > I wonder if any other parameters could change dynamically but I can't think
> > > > > > > > of that now, so perhaps just the number of lanes is what the function
> > > > > > > > should indeed return.
> > > > > > > > 
> > > > > > > > > +
> > > > > > > > > +   return 0;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > >  static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > > > > > > > >  {
> > > > > > > > >     struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > > > > > > > > @@ -965,6 +1002,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > > > > > > > >     format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
> > > > > > > > >     csis_fmt = find_csis_format(format->code);
> > > > > > > > >  
> > > > > > > > > +   ret = mipi_csis_get_active_lanes(sd);
> > > > > > > > > +   if (ret < 0)
> > > > > > > > > +           dev_dbg(csis->dev, "Failed to get active lanes: %d", ret);
> > > > > > > > > +
> > > > > > > > >     ret = mipi_csis_calculate_params(csis, csis_fmt);
> > > > > > > > >     if (ret < 0)
> > > > > > > > >             goto err_unlock;

-- 
Kind regards,

Sakari Ailus

