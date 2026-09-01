Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F08EC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laM40tiNuQEeSHrXuWhjVUDT6uySMsBpFfN2o9Zk9dI=; b=zwbUWu7n5Ci8Piqpe98Zv2x/t0
	xvAzBe154s8M7dmVJgWntVH1FDAi0IKIT/l/cha7XYtObRtro9ff/q0eh8yB7hCs3hfTrNM9GbVwy
	hqCLMwTMlv2O78Q+QnCdK8ZmFZV1S2a1LylTAfIivJl8mRMCOYrGxonLCqCVKEYuYMTQbhPu+K4Gw
	fnFgnGIxpl7gVnUvbEDjesEjK51n7fsu1qg36drz57mfijqSF2lo2kRSwu9KoKFnqqrqOL0RmLlLa
	m0JfkjK1I22OjkPsfl/0b1HQcQvXxcM+x1JhjfS/Tb7SObgbRtA6bC7pBjiUq31QxHUGnxn4GRIM1
	KiKA2fRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PX6-0000000CLTd-09AO;
	Tue, 01 Sep 2026 14:32:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PX4-0000000CLTF-3HoZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:32:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 33D756020D;
	Tue,  1 Sep 2026 14:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675EE1F000E9;
	Tue,  1 Sep 2026 14:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788273133;
	bh=laM40tiNuQEeSHrXuWhjVUDT6uySMsBpFfN2o9Zk9dI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fEQVswwu6lBpxvhWFNE4HZhJgN1RjavpULlpN0pVrJFGsNWGjlyCg2hlkB1fYYaC9
	 UaNu+LUwaCi4i+/Y47aJ3EMBq0PJS+VhdtonxqLcRWwUJOfGadio2Bt4N6Qj5JHl65
	 LEOk8wGfsR1BtmiCb2V5NCQxcmcqsOeEuNQeJoq8=
Date: Tue, 1 Sep 2026 16:32:09 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	"peter.griffin@linaro.org" <peter.griffin@linaro.org>,
	"andre.draszik@linaro.org" <andre.draszik@linaro.org>,
	"tudor.ambarus@linaro.org" <tudor.ambarus@linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: google: Initialise probe properties with
 DWC3_DEFAULT_PROPERTIES
Message-ID: <2026090102-sponge-enjoyably-89f6@gregkh>
References: <20260819182158.1351869-1-radhey.shyam.pandey@amd.com>
 <ao404zOD-rXKZ84C@vbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao404zOD-rXKZ84C@vbox>
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

On Wed, Aug 26, 2026 at 12:36:29AM +0000, Thinh Nguyen wrote:
> On Wed, Aug 19, 2026, Radhey Shyam Pandey wrote:
> > dwc3_google_probe() zero initialises struct dwc3_probe_data and never
> > assigns its properties member. The unspecified state of gsbuscfg0_reqinfo
> > is encoded as DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED (0xffffffff), not as
> > zero, so dwc3_get_software_properties() reads the zeroed field as a value
> > the glue explicitly requested:
> > 
> > 	if (properties->gsbuscfg0_reqinfo !=
> > 	    DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED) {
> > 		dwc->gsbuscfg0_reqinfo = properties->gsbuscfg0_reqinfo;
> > 		return;
> > 	}
> > 
> > Two things follow. dwc3_config_soc_bus() programs GSBUSCFG0.REQINFO with
> > zero on hardware that never asked for it, and the early return skips the
> > walk over the parent devices, so a swnode or device tree supplied
> > snps,gsbuscfg0-reqinfo would be ignored.
> > 
> > Assign DWC3_DEFAULT_PROPERTIES so the unset fields carry their unspecified
> > sentinels and the controller is left alone.
> > 
> > Fixes: 8995a37371bf ("usb: dwc3: Add Google Tensor SoC DWC3 glue driver")
> 
> Does this need Cc stable?

I'll add it, thanks.

