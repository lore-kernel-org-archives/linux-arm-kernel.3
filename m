Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C727BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1P5FnXVHJnPLZfXaGUrRwAxb6l0f3HX95u0vVllv/s4=; b=jWIKYD4jB2IgTrGbnx6YYeeY2c
	Y5QNVpPzTJtwjrVIgJB7BGLJ3naQxiawmxemGbsdxhkIXvnCmf++vIKMfNSYQOB5MXt/3mK8n6u1/
	1T4eXAKUYbAWTSn/2htJXMCTE52D5w6Bg35LmWhg/HKYfttVhh9R0EsQwfc9T06AXwXix6zkAdkFB
	eq9OkuUIFHyni2FIU7gA/NtenlWodSjwiaCOBcGkMEXiSleSAVpAZ+atU7K5Je5JhA//kpILcq59A
	wTXWk9uyjb51zA2MA+DENusRwEhjgzGTe+HHqe3Kmmfex0GaTlTFWCwj0DI11qPNTjngWOuMqfqAm
	rFvTy6lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUmN-00000005ndB-2Puw;
	Mon, 10 Nov 2025 16:30:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUmL-00000005ncY-2gar;
	Mon, 10 Nov 2025 16:30:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2407601D3;
	Mon, 10 Nov 2025 16:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D62C116D0;
	Mon, 10 Nov 2025 16:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762792204;
	bh=BENcJUva/mHHQYIayp0HLjQkCuTaKmej8Tu1JFzK0Is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YHf0VWs4SipvI5N7AaQ6K/3tRxLQgCT0CnlyFItJoneQ+JNsfdVG0M6Yk/jBN08xo
	 AyIQ5tytEvx9KerdQJCFnfePes9C9oq8nuJsQJC7groB2UOAvBWt84OFutfFDbmwWv
	 s7EPisfszp3zTP9OGVVRxvA9gZmfqK4/JSwsYym1bV+MMBXGP0GtkolMIXIe7q6Tk0
	 OS///SXTGxp1jQSWLjdFbviBAGs2C9koNl9W72FNMm/KGamKe4mX6RyO4NpeJ7hNCd
	 1VDVMLnQg6FFWLwD2BGYTHT8rforlQ3ozWPBydIkRDCCd2xtHJLKchuIR25tmUkrE5
	 aESXY2FgTLRFw==
Date: Mon, 10 Nov 2025 10:34:10 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Vinod Koul <vkoul@kernel.org>, 
	Thomas Andreatta <thomasandreatta2000@gmail.com>, Caleb Sander Mateos <csander@purestorage.com>, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Olivier Dautricourt <olivierdautricourt@gmail.com>, 
	Stefan Roese <sr@denx.de>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>, 
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 01/13] scatterlist: introduce sg_nents_for_dma() helper
Message-ID: <bnkx654tvfekhgragyuwseg7sxcrgrnb4bvwe5bgxikaf7k2ew@kf7jb76zrf3r>
References: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
 <20251110103805.3562136-2-andriy.shevchenko@linux.intel.com>
 <waid6zxayuxacb6sntlxwgyjia3w25sfz2tzxxzb4tkqgmx63o@ndpztxeh6o32>
 <jea2owcqtjeomlbwkfopt3ujsnakn4p3xeyqhh7s4kowf7k7dr@deyg5pky5udo>
 <aRIFyR0maAfZF7MN@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRIFyR0maAfZF7MN@smile.fi.intel.com>
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

On Mon, Nov 10, 2025 at 05:33:29PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 10, 2025 at 09:21:18AM -0600, Bjorn Andersson wrote:
> > On Mon, Nov 10, 2025 at 09:05:26AM -0600, Bjorn Andersson wrote:
> > > On Mon, Nov 10, 2025 at 11:23:28AM +0100, Andy Shevchenko wrote:
> 
> ...
> 
> > > >  int sg_nents(struct scatterlist *sg);
> > > >  int sg_nents_for_len(struct scatterlist *sg, u64 len);
> > > > +int sg_nents_for_dma(struct scatterlist *sgl, unsigned int sglen, size_t len);
> 
> 
> ^^^
> 
> > > > +int sg_nents_for_dma(struct scatterlist *sgl, unsigned int sglen, size_t len)
> > 
> > All but two clients store the value in an unsigned int. Changing the
> > return type to unsigned int also signals that the function is just
> > returning a count (no errors).
> 
> The type is chosen for the consistency with the existing APIs.
> So, I prefer consistency in this case, if we need to change type, we need to do
> that for all above APIs I believe. And this is out of the scope here.
> 

That makes sense, after a second look I agree with your decision.

Regards,
Bjorn

> Personally I was also puzzled of the choice as *nents members are all unsigned
> int in the scatterlist.h.
> 
> ...
> 
> > > We need an EXPORT_SYMBOL() here.
> 
> Good catch! I'll add it in next version.
> 
> > > With that, this looks good to me.
> > > 
> > > Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> 
> Thanks!
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

