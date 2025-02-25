Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523E2C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkTZf3YZ9YgQYkSvitLNZhE/06d2BbWPGvuZM/W4XoE=; b=KXwE/2vY2ZvU3xTnJIItl2bWRg
	xTvDpqrpRpiGkMpvkOUYUl+1KEQV7GHBIBXmBVMAKIE67Uqjs8Au2rtCD0nj38TEb2rq58cEfzTik
	rsweI5XoDll1Uckdpn/lLWpmwkV2uyvfBpjtkNOGiQC4x/YeOHHmonqh9FG+4fhDmMTi2ejW+eamE
	Ck7HczNd2BNWi4/vqS5TDE0rpu0PQkuu6BvxT4FS/X6vsBEBt4GhfmgVFq5hz/gkCTRQjISMl6th0
	W4xe0FzVzjvnpvVz/rgmfljcikzplU9jap2FOt3299kFkk8L+ZAa/JGLkyVbFeuc6VjMe77ObnRfb
	MVXe82sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxyU-00000000I6N-2a61;
	Tue, 25 Feb 2025 16:40:02 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmvni-0000000HVmj-3Apr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 14:20:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E4FB61260;
	Tue, 25 Feb 2025 14:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AC2C4CEDD;
	Tue, 25 Feb 2025 14:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740493246;
	bh=eDBxPB2ey6CEl5Fn4xbiSGUKr6VohrZZtt7brOucJf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tB6gpsOpZKp5aTOboDdyxR0i9eLXFNrNmyJ2DQAcxZG7y0ROWfd86e0ofq4/C3GmW
	 EoCE+8hsHyQGRO/TQXvZQdoSp9FTZkRL/VMEmLJjvofLyy3tzlQwy+CQJ45ZX/HxYM
	 qYoEvZyo6xCSG6gT0xlwTda3Y6XBPkTinf/6qbuTQCzHwPgfynS90twSPxcsBZI+Pq
	 G09SKxwrVNnJdcStCTcZBUYGHwHDk6SFEZsdeEasBb73x2fyoBXbk5v6ca2PkcAj0N
	 pwBFnmEMnFTVvBKPYPiKIQUcq9Fi8M1eepSTS3PR0XBqAycnnW8jxPdnfYbo13+5WQ
	 b0QY4QMg0kaAw==
Date: Tue, 25 Feb 2025 08:20:43 -0600
From: Rob Herring <robh@kernel.org>
To: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>, Liu Ying <victor.liu@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 05/14] dt-bindings: trivial-devices: add GOcontroll
 Moduline IO modules
Message-ID: <20250225142043.GA2173114-robh@kernel.org>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
 <20250224-initial_display-v1-5-5ccbbf613543@gocontroll.com>
 <20250224204428.GA4050751-robh@kernel.org>
 <PA4PR04MB763009E88F6406CD84ACBD33C5C32@PA4PR04MB7630.eurprd04.prod.outlook.com>
 <20250225-smart-industrious-groundhog-41deb2@krzk-bin>
 <PA4PR04MB76306D77C93FF2C51524BD95C5C32@PA4PR04MB7630.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PA4PR04MB76306D77C93FF2C51524BD95C5C32@PA4PR04MB7630.eurprd04.prod.outlook.com>
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

On Tue, Feb 25, 2025 at 12:24:09PM +0000, Maud Spierings | GOcontroll wrote:
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Tuesday, February 25, 2025 12:52 PM
>  
> >On Tue, Feb 25, 2025 at 07:39:52AM +0000, Maud Spierings | GOcontroll wrote:
> >> From: Rob Herring <robh@kernel.org>
> >> Sent: Monday, February 24, 2025 9:44 PM
> >>  
> >> >On Mon, Feb 24, 2025 at 02:50:55PM +0100, Maud Spierings wrote:
> >> >> The main point of the Moduline series of embedded controllers is its
> >> >> ecosystem of IO modules, these currently are operated through the spidev
> >> >> interface. Ideally there will be a full dedicated driver in the future.
> >> >>
> >> >> Add the gocontroll moduline-module-slot device to enable the required
> >> >> spidev interface.
> >> >>
> >> >> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> >> >> ---
> >> >>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> >> >>  1 file changed, 2 insertions(+)
> >> >>
> >> >> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> >> >> index 8255bb590c0cc619d15b27dcbfd3aa85389c0a54..24ba810f91b73efdc615c7fb46f771a300926f05 100644
> >> >> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> >> >> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> >> >> @@ -107,6 +107,8 @@ properties:
> >> >>            - fsl,mpl3115
> >> >>              # MPR121: Proximity Capacitive Touch Sensor Controller
> >> >>            - fsl,mpr121
> >> >> +            # GOcontroll Moduline module slot for spi based IO modules
> >> >
> >> >I couldn't find anything about SPI for GOcontroll Moduline. Can you
> >> >point me to what this hardware looks like. Based on what I did find,
> >> >this seems incomplete and not likely a trivial device.
> >>
> >> I'll give some more details, if there is a v2 of this patch I will also
> >> add more information in the commit message.
> >>
> >> The module slots have a number of pins, a lot of them currently unused as
> >> they have not found a function yet, this is very much still a developing
> >> product. The currently used interfaces to the SoC are:
> >> 1. SPI bus as a spidev to ease developing new modules and quickly
> >> integrate them. This is the main communication interface for control and
> >> firmware updates.
> >> 2. A reset pin, this is/was driven with the gpio-led driver but I doubt
> >> that would get accepted upstream so I intend to switch to the much better
> >> suited libgpio.
> >
> >reset-gpios is not in trivial devices, so that's already a hint you
> >cannot use this binding.
> >
> >> 3. An interrupt pin, this is currently only used in the firmware update
> >> utility [2] to speed up the update process. Other communication is done at
> >> a regular interval.
> >>
> >> What is unused:
> >> 1. A potentially multi-master i2c bus between all the module slots and
> >> the SoC
> >> 2. An SMBus alert line is shared between the modules, but not the SoC.
> >> 3. A shared line designated as a clock line, intended to in the future
> >> aid with synchronizing modules to each other for time critical control.
> >>
> >> current software that is used to work with the modules can be found at
> >> [2] and [3], one of them is a Node-RED module the other is a blockset for
> >> Matlab/Simulink generated code.
> >>
> >> If you know a better way I could describe this in the devicetree then I
> >
> >You need dedicated binding where you describe entire device, entire
> >hardware, not what your driver supports in current release.
> 
> I see now that I also forgot the patch that adds this compatible to the
> spidev driver. Didn't check for the spidevs in testing I guess.
> 
> Could I write bindings for this device, and then add the compatible to the
> spidev driver for now? So it probes that driver, and then later when there
> is a driver remove the compatible there and keep it only in the purpose
> built driver?
> 
> So I'll write gocontroll,moduline-module-slot.yaml, don't quite know where
> that would go. Define all these attributes in there and then add the 
> compatible to drivers/spi/spidev.c
> 
> Is that okay?

Yes. Bindings are forever, but drivers change. ;)

Perhaps put it in connector/ as this looks a bit like a connector. Do 
you envision DT overlays for the IO modules? Or modules don't have 
sub-devices you need to describe? There's some effort to on connector 
bindings (for mikrobus in particular) in order to de-couple host 
buses/signals from the modules (i.e. so a DT overlay can be applied to 
any DT defining the connector).

Rob

