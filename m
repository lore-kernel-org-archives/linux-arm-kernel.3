Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE57C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 17:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzaaRmAJU2uQKN+mo6+0+YOe5ndmWTJU4UD1b8fgt30=; b=a6FpLeRfwjEshUhYnbrujAhzqt
	eHsb2WXQlnFgRZUo6rJ0vQm243EkrDLFBMG2flPErPxVbB9FEVu+Tek9DVSv1D5UKwILMeAbSTWWa
	OnKQDYyDJGbGh/pmFpgEmm2fURP2+KqJbfT8BCzDDuURrHjl3nbynJrVuwB0vwYO2okvDcXibTEd4
	LWkQtSG7tCvnjZPK05RmVbrgumjCrNATIpnBpPPK0kRBTpHJHdIvN2tQNq7M5sOyxRhG4jF1bTRc2
	dMxVlkGdFLxVVTYpYNm0TF0QcnzpFVkMhcyaTHDw0Qrq5vjDTn8ZJDpAwoBhMDsdKlm5Yncxt+G4s
	sKVcXqAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKyA-00000004fZG-2IpI;
	Wed, 26 Feb 2025 17:13:14 +0000
Received: from vps.xff.cz ([195.181.215.36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKoz-00000004d8N-2VfC;
	Wed, 26 Feb 2025 17:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1740589423; bh=lRgrbi89RAPj6wGopHjUn9XlnG+mldWaZKc9kQI81BM=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=gQHXn0znSp/8ZBlIxfHyCNCgpKK4cR5SioN6O6ISpdQq2+jwSLvwqhHHv0NfKjhtb
	 rU2LJzexQAyi1Q5GmcWGeBqqB+QQglxxprhsuHyKPhDwnjwI4LH5bz+i3T/+LJTPoF
	 d+Wb5Qh68dK5uQ9KHQoi/LbGct10+71omlWOVBj8=
Date: Wed, 26 Feb 2025 18:03:42 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	quentin.schulz@cherry.de, sebastian.reichel@collabora.com, 
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 2/2] phy: rockchip: usbdp: re-init the phy on
 orientation-change
Message-ID: <h57ok2hw6os7bcafqkrqknfvm7hnu25m2oe54qmrsuzdwqlos3@m4och2fcdm7s>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, vkoul@kernel.org, kishon@kernel.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, quentin.schulz@cherry.de, 
	sebastian.reichel@collabora.com, Heiko Stuebner <heiko.stuebner@cherry.de>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20250225184519.3586926-1-heiko@sntech.de>
 <20250225184519.3586926-3-heiko@sntech.de>
 <7q5yn466xd7emebhjze4ixkswgyxjjjt5rwvyww2hwbts6bamd@i5vwvegy2os6>
 <1878927.BzM5BlMlMQ@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1878927.BzM5BlMlMQ@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_090346_239980_04A638DF 
X-CRM114-Status: GOOD (  44.24  )
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

Hi Heiko,

On Wed, Feb 26, 2025 at 04:53:45PM +0100, Heiko Stübner wrote:
> Hey Ondřej,
> 
> Am Mittwoch, 26. Februar 2025, 15:46:11 MEZ schrieb Ondřej Jirman:
> > On Tue, Feb 25, 2025 at 07:45:19PM +0100, Heiko Stuebner wrote:
> > > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> > > 
> > > Until now the usbdp in the orientation-handler set the new lane setup in
> > > its internal state variables and adapted the sbu gpios as needed.
> > > It never actually updated the phy itself though, but relied on the
> > > controlling usb-controller to disable and re-enable the phy.
> > > 
> > > And while on the vendor-kernel, I could see that on every unplug the dwc3
> > > did go to its suspend and woke up on the next device plug-in event,
> > > thus toggling the phy as needed, this does not happen in all cases and we
> > > should not rely on that behaviour.
> > 
> > On RK3399 there's a similar issue with the equivalent type-c PHY driver.
> > The TRM (part 2) states that:
> > 
> > 4.6.1 Some Special Settings before Initialization
> > 
> > - Set USB3.0 OTG controller AXI master setting.
> > - Clear USB2.0 only mode setting (bit 3 of register GRF_USB3PHY0/1_CON0 in Chapter GRF)
> > - USB3.0 OTG controller should be hold in reset during the initialization of the corresponding
> >   TypeC PHY until TypeC PHY is ready for USB operation.
> > - Set PHYIF to 1 to use 16-bit UTMI+ interface (see register GUSB2PHYCFG0)
> > - Clear ENBLSLPM to 0 to disable sleep and l1 suspend (see register GUSB2PHYCFG0)
> >   ...
> > 
> > The PHY for Superspeed signals is expected to be set up while the USB
> > controller is held in reset, which makes sense HW wise, and it's what downstream
> > kernel efectivelly does, via its RPM based hack.
> > 
> > RK3588 TRM doesn't have very detailed notes on this, but I expect it will be
> > similar.
> > 
> > So reconfiguring the phy here, while it's actively linked to the USB controller
> > without the controller driver driving the process so it reliably happens while
> > it's in reset, or at least so that USB controller reset happens afterwards, may
> > not be correct way to approach this.
> 
> the function here, is using infrastructure from the type-c framework.
> 
> The function in question tcpm_mux_set(), which then ends up in the
> usbdp_phy only gets called from tcpm_reset_port() .
>
> Which I think will do the right already - judging by its name ;-) .

No. This function has nothing to do with USB controller reset. And while  dwc3
driver consumes usb_role_switch interface, calling set_role on that interface
just translates to calling dwc3_set_mode(), which will do nothing if the mode
did not change from what it was previously. (and it stays the same if you just
re-plug the same device in same mode but just in different cable orientation)

Only time DWC3 reset seems to happen currently is sometimes in dwc3_set_mode()
depending on driver state, and then in dwc3_init()/exit() which is called only
at driver probe/remove time and in suspend/resume.

So if PHY driver reconfigures/"power-cycles" the PHY on its own, DWC3 driver
will not issue any reset to the controller HW, at least not based on the
set_role signal from usb_role_switch alone most of the time.

Also tcpm_orientation interface you use for PHY reset is called from many places
in TCPM driver, based on many events, mainly from tcpm_set_roles(), so you'll
be resetting the PHY quite a bit in uncoordinated manner with the dwc3 MAC
interface it's connected to in HW.

> [and also by the fact that the referenced qcom phy behaves similarly
>  when talking to the type-c framework]
> 
> 
> For the rk3399 I would think converting the old typec-phy-driver over to
> use the actual kernel type-c framework, might just magically solve the
> issue you have on it.

It will not. The problem is not getting the information about roles between the
drivers. extcon works fine for that. Problem is that your proposed solution
doesn't coordinate the PHY reset with USB controller to ensure proper ordering,
or even ensuring that any USB controller reset happens, or the controller knows
about the PHY reset.

Resulting issues may happen only occasionally, dunno. I guess it depends on
whether SS MAC will happen to be accessing USBDP PHY at the time when you're
turning off the PHY, and if this messes up the internal state of the MAC pipe
interface, so after PHY comes back up from reset state, whether that locks up
the MAC interface logic or not will depend on luck. :)

You can ask Rockchip what they think about uncoordinated PHY reset, while DWC3
is up and ready. Maybe it's ok on RK3588, but they're not doing it in their
vendor driver this way, and they forbid it on RK3399, so perhaps it's not? From
HW point of view it looks sketchy.

Kind regards,
	o.

> Rockchip actually has converted the rk3399 typec-phy to use the type-c
> framework in their vendor kernel.
> 
> 
> Heiko
> 
> 

