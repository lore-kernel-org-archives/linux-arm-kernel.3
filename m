Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ADBC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oZFZJRU8T3mXJOZmvdMOP8WVxz5gwtejM+juXIF4bs=; b=vmV+WXNUeNwKe6C/AMuKepeP+R
	eBrY/mfp+ZxV9Ed+/PJeS8qpPUczE7A0alcJZRiKKcGCb1tt9C4k3VQ4xKP1UxZyjWpxiDYQpSYCK
	oE/F96EqxKgyh6cirOABRQamcUDopH/eL7UZF5cTg4IXi3JvwtsIbjzuvKkEpISISyUG9cgqfel/Y
	H9YQERadFG31EtLbs8LBhEEfsTf7lCMrXM9eRNyUMzRDuU4hBMqIrHZbowZ2/pjJ+AtM1bn1fbN56
	Xr2uQ8AWOLa1UqAdhtgtYFvrd5uzRSf8yB8UngRdbSQT8A9JLonQLQWagt3iAnA2TQs5SSY01xp/i
	0Hkzx1Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PBu-0000000CIvC-2S6S;
	Tue, 01 Sep 2026 14:10:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PBt-0000000CIus-2leL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:10:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D1FE400F2;
	Tue,  1 Sep 2026 14:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56F41F000E9;
	Tue,  1 Sep 2026 14:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788271820;
	bh=0oZFZJRU8T3mXJOZmvdMOP8WVxz5gwtejM+juXIF4bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UBDi8GSiFO3nCiMdfGnEBHLmpEePwNtIryhGxkceCriRi31b47xkdCZejlMZvOzKX
	 hljD/DwXJdQwTUXKuGni5CdDRrI9Wklw5jDjUhKDlzHNGd29RfK3Nx5W7+mez01EjI
	 QJfEo1+fI/CrjtB4rftKnOwA+9MU/O7beY95WyZA=
Date: Tue, 1 Sep 2026 16:10:15 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"git@amd.com" <git@amd.com>
Subject: Re: [PATCH 0/5] usb: dwc3: xilinx: error handling and teardown fixes
Message-ID: <2026090147-overstock-smoking-1ed4@gregkh>
References: <20260810174713.2325292-1-radhey.shyam.pandey@amd.com>
 <ao4xQgvplTIFQk7K@vbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao4xQgvplTIFQk7K@vbox>
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

On Wed, Aug 26, 2026 at 12:22:38AM +0000, Thinh Nguyen wrote:
> On Mon, Aug 10, 2026, Radhey Shyam Pandey wrote:
> > This series improves error handling, resource teardown, and system sleep
> > PM robustness in the dwc3-xilinx glue driver for ZynqMP and Versal
> > platforms.
> > 
> > Patch 1 switches probe to device_get_match_data() and adds the direct
> > property.h include instead of relying on of.h for that helper.
> > 
> > Patch 2 introduces struct dwc3_xlnx_platdata and moves ZynqMP and
> > Versal setup behind plat->init(). The struct also defines an exit
> > callback slot used by the later teardown patches.
> > 
> > Patch 3 fixes system suspend and resume PHY handling: suspend now
> > powers off the PHY before phy_exit() and propagates errors; resume
> > disables clocks if PHY reinitialization fails after they were enabled.
> > 
> > Patch 4 fixes ZynqMP init error paths. Reset handles are saved in
> > driver private data and fall-through error labels re-assert only the
> > resets already released before unwinding the PHY when init fails
> > partway through reset deassert or PHY setup.
> > 
> > Patch 5 adds dwc3_xlnx_exit_zynqmp(), wires it as the ZynqMP platform
> > exit callback, and calls plat->exit() from probe error paths after a
> > successful plat->init() and from remove()/shutdown.
> > 
> > Radhey Shyam Pandey (5):
> >   usb: dwc3: xilinx: use device_get_match_data() in probe
> >   usb: dwc3: xilinx: add platform data struct with init callback
> >   usb: dwc3: xilinx: fix system suspend and resume PHY handling
> >   usb: dwc3: xilinx: re-assert resets on ZynqMP init error paths
> >   usb: dwc3: xilinx: unwind ZynqMP platform init on probe failure and
> >     remove
> > 
> >  drivers/usb/dwc3/dwc3-xilinx.c | 132 +++++++++++++++++++++++++--------
> >  1 file changed, 100 insertions(+), 32 deletions(-)
> > 
> > 
> > base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
> > -- 
> > 2.43.0
> > 
> 
> These patches look good to me, do you plan to backport the fixes? If so,
> can you Cc stable and re-order them so that the fixes patches go first?
> Better yet, keep the fixes and new changes in separate series.

Yes, this should be 2 separate patch series, one for 7.3-final and one
for 7.4-rc1.  The -final series should go to stable trees as well.

thanks,

greg k-h

