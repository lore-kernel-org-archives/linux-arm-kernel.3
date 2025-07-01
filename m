Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8FEC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 08:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JLnuPI1OpbZEzpOWF/Lr9rgMolg3W5p+0QgjbFw55Sc=; b=4KThI4zlC0aU6qB9djbmxoWnqf
	dCOpBa+RilOes2YV3mzQf7tNGbtFVXFpUgSVrmlwTB699UUZpu48l7IMA4BOYl6dmobxMB9To5zAj
	a4EDbJ8DP9v2fhbhuwP3YBUiMvJLOn7uTgMQEeXWaymTuSVbSLdh7g5DTnfLQ88rT3ZBqvaSywY+I
	U7s7JBRsTzNqSS3c+/YIdS2V/B+rlDmlW024318niajva9ap4TBya2MD4S3bCaqGAyo+gkxofIf7L
	hQUDoSuxWfIomhekrjC3I83wZEKplycYeXFtkozp/9ru3vMiOfbQNmD1N0RTQa9EC2097mRSRKNr7
	Zz6C8Y9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWjd-00000004UUA-3g3G;
	Tue, 01 Jul 2025 08:53:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWao-00000004Rvu-1Yho
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:43:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B705B4489E;
	Tue,  1 Jul 2025 08:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D8BC4CEEB;
	Tue,  1 Jul 2025 08:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751359433;
	bh=zEtteRShEKxsilU1Hd798Yj8bqUgtyrPa4gMPVvltBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QTca0xQ6usblgn0H54MJyFZyL9ZmPDGrAlA4LGrzuO1VJiUauh+qK/CUxeFlTL5dX
	 UscJa3DxZM42Q76n7oBLLmiGaoU8ZWPIWQkqVSMNFj/3q4V7QQORhbz8GV+WrOHzEw
	 O9n/nG5o4+q+Tzl7xOo2l0wRcFsSY/lY8U0UJTlw=
Date: Tue, 1 Jul 2025 10:43:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sergio =?iso-8859-1?Q?P=E9rez?= <sperezglz@gmail.com>
Cc: michal.simek@amd.com, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shuah@kernel.org
Subject: Re: [PATCH] usb: gadget: udc-xilinx: validate ep number before
 indexing rambase[]
Message-ID: <2025070120-outhouse-lubricant-ff47@gregkh>
References: <20250627060125.176663-1-sperezglz@gmail.com>
 <2025062834-botanist-crop-4aec@gregkh>
 <CAMCbnubpfO0y9oMnJnYHQ3ALTPmF1W80sPhbNPzaR59hy+cDQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMCbnubpfO0y9oMnJnYHQ3ALTPmF1W80sPhbNPzaR59hy+cDQQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_014354_448880_5DED44EA 
X-CRM114-Status: GOOD (  31.39  )
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

On Mon, Jun 30, 2025 at 02:20:35PM -0600, Sergio Pérez wrote:
> > On Fri, Jun 27, 2025 at 12:01:22AM -0600, Sergio Perez Gonzalez wrote:
> > > Issue flagged by coverity. The size of the rambase array is 8,
> > > usb_enpoint_num() can return 0 to 15, prevent out of bounds reads.
> >
> > But how can that happen with this hardware?  As the array states, this
> > hardware only has that many endpoints availble to it, so how can it ever
> > be larger?
> >
> 
> Hardware will likely behave and not report more endpoints than it
> supports, but I thought that there is still a possibility that this
> can be exploited, taking into account this patch:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7f14c7227f342d9932f9b918893c8814f86d2a0d

That patch is probably not needed, for this same reason.

> and this CVE:
> https://www.cvedetails.com/cve/CVE-2022-27223/

Odds are we should reject that CVE, want me to go do that?

> However, looking more closely the above patch, the endpoint number is
> extracted from a struct different than the "usb_endpoint_descriptor":
> "epnum = udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK;"
> in contrast with the code that I'm touching. The CVE does not add more
> details to understand if the part of the code that I'm changing is not
> subject to the vulnerability.

Please dig deeper to determine this :)

> > > ---
> > >  drivers/usb/gadget/udc/udc-xilinx.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
> > > index 8d803a612bb1..0c3714de2e3b 100644
> > > --- a/drivers/usb/gadget/udc/udc-xilinx.c
> > > +++ b/drivers/usb/gadget/udc/udc-xilinx.c
> > > @@ -814,6 +814,12 @@ static int __xudc_ep_enable(struct xusb_ep *ep,
> > >       ep->is_in = ((desc->bEndpointAddress & USB_DIR_IN) != 0);
> > >       /* Bit 3...0:endpoint number */
> > >       ep->epnumber = usb_endpoint_num(desc);
> > > +     if (ep->epnumber >= XUSB_MAX_ENDPOINTS) {
> > > +             dev_dbg(udc->dev, "bad endpoint index %d: only 0 to %d supported\n",
> > > +                             ep->epnumber, (XUSB_MAX_ENDPOINTS - 1));
> > > +             return -EINVAL;
> >
> > Any hints as to how this was tested?
> 
> I don't have access to such xilinx hardware, given that it was marked
> as a high severity defect in coverity and it is basically extending a
> validation that was already added in other parts of the code, I
> decided to propose the patch without runtime testing.

Never trust static analysis tools blindly.  The number of
false-positives stuff like coverity creates because it can not determine
where data actually comes from is way too high.

thanks,

greg k-h

