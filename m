Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865CFCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 08:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqj71Wa7DhVsm2R5HOJJo5axte1+UH0DIa2ZQTLQ2OA=; b=xGVFjpfgHXv0sapJh16fX0CJyJ
	ydYv+jymg969WZ9GzzWCQoI1YqXdTosA5Mfg5Dv9S9jyyPvUZebcpDWfV/+hbRvgLP9Pw0YjZS/Pm
	vVOu/9hDAbjQai4p6slcxuGi40SM2LGjSgu7iT26T9PRKaFqKLX/04mYCU5j5NqNr+BUBMUiTTRgw
	TQt34hxKQjwyGAyApsnoYcaHdU0HrOldu8DsNjhCL0JUXDe8fOfjfFNmbiwucOJNVthDgk+n7pohw
	S9vhWAkyb/UNg76gQoK22c1qDuLHmIhaISkyc2fllGcppUPAXtwHpIJH4/+f0HjwG9X+RZFFB9y9i
	ZJj+sU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wUD-00000000rGh-1m7o;
	Wed, 15 Oct 2025 08:03:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wUB-00000000rGZ-44au
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 08:03:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6687E62506;
	Wed, 15 Oct 2025 08:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9135CC4CEF8;
	Wed, 15 Oct 2025 08:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760515431;
	bh=5unoLNZna7TbN6XnAcrbvPxZlZXyH1EX+4YdDxPuHhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XSNhFi6LSwYMGRwm8/DjIzD70+SJl6l4LlN+k5qLeOMIEtbTZO2LQs9c8auQB/xDA
	 K7JY5T9kobA8hMf16Hn2Hf7NwRCDtbTnXMHW+pn6XrtllrMxH39uRqhnYCFrxKAPG8
	 ciDRfUJ8clQlL7702X9qNivz2a76qmwTnRe0J/K4W710FBp0MY404iWKMPyjSbGYr0
	 7Rjptvc0+/m+BV1c+OT/QNJb2NH6LZjgi3FYZaPilIB/mj9WiW8g9H689PO0C1kLrF
	 ztXTF07l+hufkiLkTAHi0wsnXGencQw7E30Ywg1vcfYrbCEoGpps4RfqlkSBpn6rSl
	 7VGDwrPt2mv/g==
Date: Wed, 15 Oct 2025 10:03:44 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Scott Branden <sbranden@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 2/4] of/irq: Fix OF node refcount in
 of_msi_get_domain()
Message-ID: <aO9VYGkCq7MDCcNn@lpieralisi>
References: <20251014095845.1310624-1-lpieralisi@kernel.org>
 <20251014095845.1310624-3-lpieralisi@kernel.org>
 <aO7Mx11tWFbDX8u1@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aO7Mx11tWFbDX8u1@lizhi-Precision-Tower-5810>
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

On Tue, Oct 14, 2025 at 06:20:55PM -0400, Frank Li wrote:
> On Tue, Oct 14, 2025 at 11:58:43AM +0200, Lorenzo Pieralisi wrote:
> > In of_msi_get_domain() if the iterator loop stops early because an
> > irq_domain match is detected, an of_node_put() on the iterator node is
> > needed to keep the OF node refcount in sync.
> >
> > Add it.
> >
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Rob Herring <robh@kernel.org>
> > ---
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> After go though of_for_each_phandle, I understand why need of_node_put()
> at break branch.
> 
> It will be nice if add of_for_each_phandle_scoped() help macro.

Yes because this fix is not the end of it AFAICS.

Please review and test patch (4) as well since I slightly change
the existing logic there, I don't want to break the EP mapping code you
added in f1680d9081e1 (by the way, I don't get that commit logic, if the
msi-parent loop would match it could just return and we could have
removed the

if (ret)

guarding of_map_id(), correct ?).

That's what I did in patch (4), please have a look.

Thanks,
Lorenzo

> 
> 
> >  drivers/of/irq.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> > index e67b2041e73b..9f6cd5abba76 100644
> > --- a/drivers/of/irq.c
> > +++ b/drivers/of/irq.c
> > @@ -773,8 +773,10 @@ struct irq_domain *of_msi_get_domain(struct device *dev,
> >
> >  	of_for_each_phandle(&it, err, np, "msi-parent", "#msi-cells", 0) {
> >  		d = irq_find_matching_host(it.node, token);
> > -		if (d)
> > +		if (d) {
> > +			of_node_put(it.node);
> >  			return d;
> > +		}
> >  	}
> >
> >  	return NULL;
> > --
> > 2.50.1
> >

