Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AF6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 18:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t16tLNN8qVrIKpI4YOViGzIchIugK3x1Lur0PSMClew=; b=W1h2LIylFXjLHcd3Kd7ixtMH1f
	ZfcxZFOPol2grv26XlK23Gb7p8lWmpnSCnoAZQksnnojBdN8Cj9zk6GjgJZvDav9aG8w74yFBlEoq
	xIb9bdcpiBV7TUsxYwcgJG5gZl9n/RiI72hwMER2Mrzh4Vn4soiin8QRwJ2gKoYlqFwAKv/wnN4K1
	QtyiEP/hinqgSrvTh1lpxHhzKtY4uQLEMeLy1CjxXchqpyBMamLFHr/nfW8kPGkN7xibzj9UPa4zM
	LrNawheyeCHVksq6UxKZVSJR+jFBeqhLmqSCleJn1CqBnZRk4mcDoWg19f79/to2fW3zJpSCNKwXr
	23Fptyow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSgqC-00000007aog-19ea;
	Tue, 31 Dec 2024 18:19:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSgp1-00000007aik-0CJK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 18:18:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27219143D;
	Tue, 31 Dec 2024 10:18:54 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C8263F673;
	Tue, 31 Dec 2024 10:18:23 -0800 (PST)
Date: Tue, 31 Dec 2024 18:18:20 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/4] pinctrl: scmi: Check fwnode instead of machine
 compatible
Message-ID: <Z3Q1bKMynWGfUkPr@pluto>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-3-e9a3a5341362@nxp.com>
 <20241227153020.hl6lysid75yquca7@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227153020.hl6lysid75yquca7@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_101827_136536_134F75F5 
X-CRM114-Status: GOOD (  19.49  )
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

On Fri, Dec 27, 2024 at 03:30:20PM +0000, Sudeep Holla wrote:
> On Wed, Dec 25, 2024 at 04:20:46PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> > 
> > For the platform that not compatible with scmi pinctrl device, the
> > fwnode will not be set, so checking fwnode will make code simpler
> > and easy to maintain.
> > 
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/pinctrl/pinctrl-scmi.c | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
> > index df4bbcd7d1d59ac2c8ddc320dc10d702ad1ed5b2..aade6df77dbb2c391741e77c0aac3f029991e4bb 100644
> > --- a/drivers/pinctrl/pinctrl-scmi.c
> > +++ b/drivers/pinctrl/pinctrl-scmi.c
> > @@ -505,11 +505,6 @@ static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
> >  	return 0;
> >  }
> >  
> > -static const char * const scmi_pinctrl_blocklist[] = {
> > -	"fsl,imx95",
> > -	NULL
> > -};
> > -
> >  static int scmi_pinctrl_probe(struct scmi_device *sdev)
> >  {
> >  	int ret;
> > @@ -521,7 +516,7 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
> >  	if (!sdev->handle)
> >  		return -EINVAL;
> >  
> > -	if (of_machine_compatible_match(scmi_pinctrl_blocklist))
> > +	if (!dev->fwnode)
> 
> I would prefer to see the blocklist to be explicit here rather than
> implicitly hiding it away with this change set.

Using a flag to inhibit device_link_add as said early in the series this
could be dropped and kept as is, I suppose.

Thanks,
Cristian


