Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A9DC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCEhzIHv+gI4dxAX0R87oiyrbLJH9NF0MvQOqH+iMVM=; b=Tc325ammQB7e8APmcLM54L+K1O
	Flsz7uQnjgymYav0QO3duxSWMi3xeyXDeDJKTwxWk5hPjUWfol66auIYn0DNnxlEBuScYSCUu0PTx
	8UEMnznolGmDfmz/KYmSmIyOgq0yY1kd3EGLCsB/rt2AsuyVyAzt94ehLlWzbq1hU6JXdQ01selLu
	miKzYavqgPJqad0J+3bNrEWHnmRQ/1bLiG5f49uTOsF/l2zeLGstB6A0OpHJ2K7uLTcxwzUj7IH01
	HhyX4w3h5MM2wxbYZ6KoAIfxWUlewBfXHMgLUaEKJ7aicAS3QOPcVvvWmvpYID0wQrSkRjlttfmSm
	ggYtefWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lsf-0000000EvwH-2JdC;
	Wed, 02 Sep 2026 14:24:01 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lsc-0000000Evv4-2f2O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 14:24:00 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48431648f33so1681278f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 07:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788359036; x=1788963836; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eCEhzIHv+gI4dxAX0R87oiyrbLJH9NF0MvQOqH+iMVM=;
        b=nmonXIXP2SKI38FiRLlxlJCslYEJ+LCjIHyrpZQhrILayoeBxq0IMEah1/Se0e0E1x
         3/WYk8Pj98g1KorDsHtG04fbU4XuEZeGx3O/DkoKCVomiG6UiyOLCFe2WjbofuoWPsp9
         /tqkSySiQNgOffbkp1OrmDKNOUnHLElQv7KYfy4gjga+Zzf0KHgHmMlr/8Irbl7S2ffJ
         Q4hB+S+FN5Fh/X9tL1K3xpSZ6SKgAzo6e+gtwk7o6OsAfQo6YSuR0tqgBT66jRc69agw
         H5WUFn1P8YKPclUlWgXf/STS4kr1H72KxHzf1T4rS7oE/3vbb28RAdH2OzqjMsF/JNY8
         YxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359036; x=1788963836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eCEhzIHv+gI4dxAX0R87oiyrbLJH9NF0MvQOqH+iMVM=;
        b=LTEXOatVflpQkHiAI6yt9XFmXYxdHVhmFg+dVw+fhF6sLw/ET/ARi8RHWdk1qi65uq
         LiXBnQWl0gyUAyq9BBM6JUNk30shoosLhqid3c2bYB/fUsl2Kh8Q4sIYkeofCrvtpvGL
         DMWIFrtrnvwtYsFezxJYZxAVnLb9ygsLmJd+KrXDDatgJdK+piPPXwLMONXF9Q8x1+r3
         ZP5L4dThcai5ZEu8UoZlOxo0sUjppo9Li8J5bB6jM8Xx0C0x7Q2NYFUAXhlLbMeXNfg1
         tGvDaIhEGzfzGUSIyuIqUel875SB8Dh5BOlsZeymiE0dNe/xo3TKRhuURpu1pjF/cO88
         WhbA==
X-Forwarded-Encrypted: i=1; AKwUvBz5RxPUQypDpzsjYal96ckmnU0M5Huv6pfmfDky7IJOsWFTERLPNpsPlpY+DilhuPyuDctKZMJg8OpYbs2YQxB2@lists.infradead.org
X-Gm-Message-State: AFuF++m3K49vWIni1YnZCvZgqeT6z7VW2CS36roUsTSHIS7rC8mOpKe/
	oC1XillDr/qexP6A0Rbw3nMr7x0ncspyeDo8jqqTOvC5yW5+6ewRlki/
X-Gm-Gg: AYBFou1Vpaj2NLnqqgUnwv6aSI01jwJnq0wGolnKi3pHd1ZARb21MXxyOLpfgEl9JAU
	dYvSfFmiwziBKgO/ogErsrg5s/rTA6IacQkTcTWxsBSyXHWzV1YRxlr6KKVntZlGvRP/+n55Lkd
	crCcl3p+PSGIy7rU4Lr64NCSINqFeHP9vwzACneogmSdF/Vamm8qlHqunWfLQZHpiXn7cgcETBv
	V5qjxjeqE+yNd9Jg39uN1n6XALNI+bIWTgkPYFNwieBKaKiu46P4TMWhCPqBp4ow35wKltQGIxM
	u1SKQfqUly9rI2CciZzSo58oyt0SiKQnAuLdw5lNLbd+abNcIGtmWh5pGHhPFNKYDCVgRRxnQ0k
	L5ZGGk8sQrR/BsUhxPi7CRz2iSkTW1MCLLFvMJAB2iGhfMrhAwzyNW7dXX1YaqzHIs3WwNxrz5n
	j4qU+A/KSNAwA+l1+6BWQyXkUBdWcuLglpItpuJwA4q5uGkeltkG6WgeghQM1LHQ1EbUFvS856N
	5OOvvOweTAFFx0oSB8ybKrlfz5gDKBZ8uulETDG+Z8p/gdn/CBQCb6Glq2Yhbw=
X-Received: by 2002:a05:6000:4211:b0:482:fbb6:1b29 with SMTP id ffacd0b85a97d-485781faaeemr6553373f8f.10.1788359035442;
        Wed, 02 Sep 2026 07:23:55 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e6f604sm6722961f8f.2.2026.09.02.07.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:23:54 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:23:53 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 6/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 OV5640 CSI Cameras
Message-ID: <qkcwnshcm4o3q5vbdgb6i33wtm3wrri7ifsi5pnj342mqgfiaw@76vnlt3yro5v>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com>
 <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810>
 <3ak4ffamwvdrtgw3bivzvrbtkmyh7g3lvuk4xwvdiuzizi3iu3@uxqvyif7rvpx>
 <178471622928.2174993.5439033710284861967@ping.linuxembedded.co.uk>
 <20260722105914.GA72270@francesco-nb>
 <amDXGRT80HfyJwCt@SMW015318>
 <vrw2wmtywuokachenclid4dnrosaq2xqlzqtyqe75tsdt27yzx@ntztzwyxoadw>
 <amJrv2FDbdkbvMKQ@SMW015318>
 <sr26lfvwasgcosfzcf4ydtwxwjjutlio2yqpgxldatpzjo7e4y@77k7gefnjzvl>
 <amN9zxNjXM0bSp1w@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amN9zxNjXM0bSp1w@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_072358_725909_861AF422 
X-CRM114-Status: GOOD (  65.42  )
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

On Fri, Jul 24, 2026 at 09:59:27AM -0500, Frank Li wrote:
> On Fri, Jul 24, 2026 at 03:41:59PM +0200, Ernest Van Hoecke wrote:
> > On Thu, Jul 23, 2026 at 02:30:07PM -0500, Frank Li wrote:
> > > On Wed, Jul 22, 2026 at 06:15:50PM +0200, Ernest Van Hoecke wrote:
> > > > On Wed, Jul 22, 2026 at 09:43:37AM -0500, Frank Li wrote:
> > > > > On Wed, Jul 22, 2026 at 12:59:14PM +0200, Francesco Dolcini wrote:
> > > > > > Hello Kieran,
> > > > > >
> > > > > > On Wed, Jul 22, 2026 at 11:30:29AM +0100, Kieran Bingham wrote:
> > > > > > > Quoting Ernest Van Hoecke (2026-07-22 10:27:32)
> > > > > > > > On Mon, Jul 20, 2026 at 02:16:46PM -0400, Frank Li wrote:
> > > > > > > > > On Mon, Jul 13, 2026 at 05:06:27PM +0200, Ernest Van Hoecke wrote:
> > > > > > > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > > > >
> > > > > > > > > > Add device tree overlays for the Toradex OV5640 CSI Camera on Verdin CSI_1.
> > > > > > > > > >
> > > > > > > > > > The default overlay describes the current CSI Camera Set 5MP OV5640 with a
> > > > > > > > > > 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the legacy
> > > > > > > > > > camera module.
> > > > > > > > > >
> > > > > > > > > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > > > > > > > > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > > > > > > > > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > > > > > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > > > > ---
> > > > > > > > > >  arch/arm64/boot/dts/freescale/Makefile             |  6 ++
> > > > > > > > > >  .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
> > > > > > > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++++++++++++++++
> > > > > > > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
> > > > > > > > > >  4 files changed, 119 insertions(+)
> > > > > > ...
> > > > > > > I think with the Toradex ecosystem there would be some value in
> > > > > > > supporting or helping with the ongoing dt-connectors or dt-addons topics
> > > > > > > so that we can abstract the hardware which is being 'added'.
> > > > > > >
> > > > > > > I think it's important that we tackle the problem of combinatorial
> > > > > > > explosions of overlays when we can add a component to multiple
> > > > > > > platforms.
> > > > > > >
> > > > > > > For example, your OV5640 camera could be added to many different boards
> > > > > > > - and each board could have many different cameras - in different ports.
> > > > > > >
> > > > > > > We should not be copy/pasting overlays for each combination, or we'll
> > > > > > > have 'thousands' of identical overlays.
> > > > > >
> > > > > > I see your point, and I agree that it would be valuable to move this
> > > > > > topic forward. I will raise it internally at Toradex and see how we can
> > > > > > contribute.
> > > > > >
> > > > > > At the same time, quoting Marex (https://lore.kernel.org/all/dec2a7f6-80fd-4692-8936-969f8837a555@nabladev.com/):
> > > > > >
> > > > > >  | DT connectors have been discussed for the last 10 or so years and three
> > > > > >  | is still no real progress.
> > > > > >  |
> > > > > >  | I would be happy to send a follow up patchset which would convert the
> > > > > >  | DTOs to whatever connector implementation format lands in the future,
> > > > > >  | but I am concerned that waiting for DT connectors will block this
> > > > > >  | patchset from landing for a long time.
> > > > > >
> > > > >
> > > > > I do quick check for ov5640, we can use partial connectors, which already
> > > > > in kernel tree.
> > > > >
> > > > > use duplicate label like
> > > > >
> > > > > in mainboard
> > > > > csi_io_i2c: &i2c3 {
> > > > > 	...
> > > > > }
> > > > >
> > > > > csi_io_regualotor_3v3: ....
> > > > >
> > > > >
> > > > > csi_io: connector_csi {
> > > > > 	compatible = "...";
> > > > > 	gpio-map = <0 0 &gpio1 3 3>;
> > > > > 	...
> > > > > 	irq-map =<0 &gpio1 4 1>;
> > > > > 	...
> > > > > }
> > > > >
> > > > > in 5640 overlay
> > > > >
> > > > > &csi_io_i2c {
> > > > > 	camera@xx {
> > > > >
> > > > > 		reset-gpios = <&csi_io 0 ACTIVE_HIGHT>;
> > > > > 	}
> > > > > }
> > > > >
> > > > > https://lore.kernel.org/imx/AM9PR04MB8353AC7DF91C5F73C34019E0E3F72@AM9PR04MB8353.eurprd04.prod.outlook.com/
> > > > >
> > > > > Only clock part have dependence. other parts. I am working mipi dsi for
> > > > > display, almost work except panel show have some problem, which is not
> > > > > related with connector.
> > > > >
> > > > > Frank
> > > >
> > > > This is very interesting and I agree with both you and Kieran that it
> > > > would be great to abstract these connections away and kill the need for
> > > > so many variations.
> > > >
> > > > Certainly I will read up on this and spread it internally as well.
> > > >
> > > > That said, since there are still unresolved dependencies, I am not
> > > > convinced that we should already head this way with this series. It
> > > > supports hardware that exists today in the currently standard and clean
> > > > way.
> > >
> > > Your ov5640 have not such dependence. You can try connector firstly.
> > >
> > > display most like can go through connector, (I remember pwm already
> > > supported, but not sure).
> > >
> > > others continue go through old method until dependence clear.
> > >
> > > Frank
> > >
> >
> > The ov5640 still requires a clock nexus which is not merged yet.
> >
> > I have been playing around with it locally now and find the work here
> > very interesting. Certainly this is also useful for Toradex and I would
> > like to use it to reduce duplication.
> >
> > We will repeat this work for the Verdin iMX8MP. So I see real value in
> > using these new mechanisms to map the GPIOs such that the Verdin ov5640
> > overlay can be reused. However, this would also require a new binding
> > for a "verdin_csi" device.
> >
> > Therefore, I could consider dropping the ov5640 overlays from this
> > series and sending them as a follow up with the partial connectors
> > support. But I don't want to block the series from getting merged for
> > this non-trivial effort.
> >
> > If we go that way, I wonder where the verdin-ov5640 overlay should go?
> > We also have Verdin modules with a TI SoC, with the OV5640 overlays
> > already merged, that could be refactored. Those live in ti/, not
> > freescale/. Do you have any input on how we should deal with that?
> 
> 1: need make both work by duplicate overlay source file, which under TI
> and freescale.
> 2: try to create common dir, and merge two file to one, which may need
> involve both TI, freescale and Soc maintainer to discuss where to put.
> the discussion start utill real case happen. This one may first real
> user case.
> 
> >
> > Personally I am still more in favour of merging now and refactoring with
> > our next series for other SoMs, but I understand the desire to start on
> > this now so there are more consumers of this new behaviour.
> 
> I suggest use this 8mm ov5640 as start, you can refact other later step by
> step.
> 
> I can increase this part review priority.
> 
> Frank
> 

I've prototyped the GPIO nexus approach and confirmed that it works. It
abstracts the sideband GPIO wiring, but the camera pipelines and port 
election remain SoC- and port-specific.

So I could implement all of this, probably with a binding too (unclear
to me as of now if a compatible + binding is needed or if we can just
leave the compatible property out). But it would only enable sharing one
overlay between the Verdin iMX8MM and Verdin iMX8MP. As you noted, we
could do something like:

imx8mm-verdin.dtsi:
	/* Verdin CSI_1 */
	verdin_csi_capture: &csi {};
	verdin_csi_rx: &mipi_csi {};
	verdin_csi_i2c: &i2c3 {...};
imx8mp-verdin.dtsi:
	/* Verdin CSI_1 */
	verdin_csi_capture: &isi_0 {};
	verdin_csi_rx: &mipi_csi_0 {};
	verdin_csi_i2c: &i2c3 {...};

Along with a nexus node to abstract the GPIOs used in both, and then
have one shared camera overlay enable everything and define the camera.

But on the Verdin iMX95 for example, the pipeline is more complicated so
unless we find a way to set up more of the pipeline in the base DTSI, we
would still need a separate overlay for it.

On SMARC iMX95, for example, we would still require separate CSI0 and
CSI1 overlays because they use different receivers, pixel formatters and
ISI ports. And there is no mechanism to select CSI0 or CSI1 from an
overlay, that would need the proposed generic connector concept, not
just these nexus nodes.

My current thinking is that this is not worth implementing as we don't
really gain much. However, it is clear that connectors would be hugely
beneficial. I propose that we drop the idea for this camera overlay,
unless you see a real maintenance benefit, but we work on the connector
topic to hopefully get rid of this combinations explosion in the future.

We are continuing to work on connector infrastructure where it provides
a concrete abstraction, including the LVDS nexus work and the related
GPIO/PWM fw_devlink fixes. [1]

[1] https://lore.kernel.org/all/juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf/

Kind regards,
Ernest

