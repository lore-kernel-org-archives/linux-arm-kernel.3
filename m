Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19399C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 08:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlqwUYU14GEzOrb668LRluAXHaFv/6rQ9X1wvdFEwFw=; b=XOjcwYQwphL2RS/HrTmijfsHpS
	kWhO79FTyAebnBOdt9wVtMUYLRkyLjO3eFzR/nVnX6zeQz/3Pc1PVgWtYU3VRaEHmxqNs1Mg4Lm2X
	WGcnRNZojXql3h6q6T/zKiB1lddp4tCep+BWFw53TUBGCBYvnc8w40IVcpsRqgiTAjTsCMMElQkfm
	2BUVZrYkUw3T2QOlpL7Duzl2WpDhWIFA9Xx6G64i04PtCo+NB1q+F5uZBqigdSCbK9eQjy5HOq9VR
	CBfZ4vs3LTrYQvqPjBaDdFuBPyiD5d15B4DPvmOFiYW3dJVNSf68YHoASSVSzjppGVNnf82KMdyEU
	AyHwrp1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkInr-00000007E9N-1oHk;
	Tue, 18 Feb 2025 08:18:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkIkx-00000007DDD-3T4l;
	Tue, 18 Feb 2025 08:15:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D61D65C5BA3;
	Tue, 18 Feb 2025 08:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303D0C4CEE2;
	Tue, 18 Feb 2025 08:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739866502;
	bh=UFdR7IbguGl7iKpceVwoQo+fFJc+Ocd7Dgzg0nOOeAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f4mC4+xjy8+3Ap3+zmCq4f4juZVPx3MmLXCA2pN+OuMHab5gaVtMq0RgIb/vmcIt4
	 5pomyFm6UrsvIjuGwEbtdC0Cnn6HgTkNdbLBGtu/S6H3634IT4Qh8f1TMWeYpsxTMx
	 HEiie4JkezV19OJAsaovd47Bq7gU0JDqjGhlceHw=
Date: Tue, 18 Feb 2025 09:14:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 1/7] driver core: auxiliary bus: add device creation
 helpers
Message-ID: <2025021826-smile-batting-e52f@gregkh>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-1-7edb50524909@baylibre.com>
 <2025021437-washout-stonewall-d13e@gregkh>
 <1jwmdsxugx.fsf@starbuckisacylon.baylibre.com>
 <2025021501-tamer-sank-142a@gregkh>
 <1jikp8xx01.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1jikp8xx01.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_001503_952710_67033CA6 
X-CRM114-Status: GOOD (  14.38  )
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

On Mon, Feb 17, 2025 at 07:10:54PM +0100, Jerome Brunet wrote:
> On Sat 15 Feb 2025 at 07:53, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> [...]
> 
> >> 
> >> >
> >> >> +							int id)
> >> >> +{
> >> >> +	struct auxiliary_device *auxdev;
> >> >> +	int ret;
> >> >> +
> >> >> +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
> >> >> +	if (!auxdev)
> >> >> +		return ERR_PTR(-ENOMEM);
> >> >
> >> > Ick, who cares what the error value really is?  Why not just do NULL or
> >> > a valid pointer?  That makes the caller much simpler to handle, right?
> >> >
> >> 
> >> Sure why not
> 
> I have tried the 'NULL or valid' approach. In the consumers,
> which mostly return an integer from their various init function, I got
> this weird to come up with one from NULL. EINVAL, ENOMEM, etc ... can't
> really pick one.
> 
> It is actually easier to pass something along.

Ok, fair enough, thanks for trying.  But I would have returned just
-ENODEV in all cases, as that's what the end result was :)

thanks,

greg k-h

