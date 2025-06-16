Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112D1C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 14:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKjeTdmJPh/8z/0sRDDRVkWKLbnDMCBBoa4t9bucIe4=; b=DY9t0V2aceUfk/2xqpnSEdjHGS
	DD1DZt2XEBPEcgAT0jH+sEVL7fQq12Den+A8/Qr9gMAKURjiQmIlQ2nsFpADK6FFeSO5zkSUqydZT
	RD30Nzr66Hxg7Cct8KM060OSkwFP1JLbJ23cxpJ7+wFNBjCz5KTsDsxB3VhYPVpOD3nmyQWkoi2A0
	iXi/WaWVa02+jO2P6BMEGeyG223Dqy6ccFSQyYhlsfviqBehmOP+HVvBfKeo8xMqA+GuWlVDhYR+U
	KkE2+hGPCut5s6JzKs144z7c62bIXYjv7y0qR59S275EIJi69q/4yVNQNmKST9cXsI9XTPGYextNS
	5BDwcq6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRARm-00000004doL-03wp;
	Mon, 16 Jun 2025 14:04:26 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9GI-00000004QEg-1PBA;
	Mon, 16 Jun 2025 12:48:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750078090; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Noj837lL1QUwu7QwkZOvSNZyMANKK4hvJRpnt3BeaQkZfvjrMDtbEVB7pyeP9H3rGsZIwZjbnZto6Dw6xvLqZDOgRi0WdWOHnSFq+w8ocLkp4KRC8FISqOMAtulZN/hErS2wNCwChKeF5ct2yxovVMu8osk6129ALt5XeIbbGE8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750078090; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HKjeTdmJPh/8z/0sRDDRVkWKLbnDMCBBoa4t9bucIe4=; 
	b=J0sXDy+hxuy+880JvsArY9kGS8zGenjEO6mtuM1TOAokRZZalldQcJTXzjB87BSnUK6KeIH4nSGPZ8PD4AwN1QWTloUKOwgzynnz9mo1FBuo1lLVlGdnCxYa97ZUR4qSILEKXjbZHmJHh3gYNZ0i+7ZfRwpGvwZpIJ6uyludl2U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750078090;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=HKjeTdmJPh/8z/0sRDDRVkWKLbnDMCBBoa4t9bucIe4=;
	b=P1mehgoW9dxsq8haTmNMgTw+EKa3hxVmX6x429UQxc+r06naOkrbhD2WzXCJrfa1
	4ZB4MIsrQMxJYC4u6ku4JNUBduBRPV1NutWRlCdXt7NExjrrvwAE07Gd4tjJBz6dP3Y
	VH7KKk2bIoArvK9W559I77SqtxhjQxUezTlYzC4k=
Received: by mx.zohomail.com with SMTPS id 1750078087706132.33901078776455;
	Mon, 16 Jun 2025 05:48:07 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Alexey Charkov <alchark@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] phy: rockchip: inno-usb2: add soft vbusvalid control
Date: Mon, 16 Jun 2025 14:48:01 +0200
Message-ID: <7815489.EvYhyI6sBW@workhorse>
In-Reply-To: <5c531d53-3573-4c25-a32b-79dfd5abd4cd@linaro.org>
References: <20250610-rk3576-sige5-usb-v4-0-7e7f779619c1@collabora.com>
 <20250610-rk3576-sige5-usb-v4-1-7e7f779619c1@collabora.com>
 <5c531d53-3573-4c25-a32b-79dfd5abd4cd@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_054830_443947_D69BB618 
X-CRM114-Status: GOOD (  27.03  )
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

On Friday, 13 June 2025 11:02:40 Central European Summer Time neil.armstrong@linaro.org wrote:
> On 10/06/2025 16:07, Nicolas Frattaroli wrote:
> > With USB type C connectors, the vbus detect pin of the OTG controller
> > attached to it is pulled high by a USB Type C controller chip such as
> > the fusb302. This means USB enumeration on Type-C ports never works, as
> > the vbus is always seen as high.
> > 
> > Rockchip added some GRF register flags to deal with this situation. The
> > RK3576 TRM calls these "soft_vbusvalid_bvalid" (con0 bit index 15) and
> > "soft_vbusvalid_bvalid_sel" (con0 bit index 14).
> > 
> > Downstream introduces a new vendor property which tells the USB 2 PHY
> > that it's connected to a type C port, but we can do better. Since in
> > such an arrangement, we'll have an OF graph connection from the USB
> > controller to the USB connector anyway, we can walk said OF graph and
> > check the connector's compatible to determine this without adding any
> > further vendor properties.
> > 
> > Do keep in mind that the usbdp PHY driver seemingly fiddles with these
> > register fields as well, but what it does doesn't appear to be enough
> > for us to get working USB enumeration, presumably because the whole
> > vbus_attach logic needs to be adjusted as well either way.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >   drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 113 +++++++++++++++++++++++++-
> >   1 file changed, 109 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> > index b0f23690ec3002202c0f33a6988f5509622fa10e..4f89bd6568cd3a7a1d2c10e9cddda9f3bd997ed0 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> > [...]
> > @@ -666,8 +679,17 @@ static void rockchip_usb2phy_otg_sm_work(struct work_struct *work)
> >   	unsigned long delay;
> >   	bool vbus_attach, sch_work, notify_charger;
> >   
> > -	vbus_attach = property_enabled(rphy->grf,
> > -				       &rport->port_cfg->utmi_bvalid);
> > +	if (rport->port_cfg->svbus_en.enable && rport->typec_vbus_det) {
> > +		if (property_enabled(rphy->grf, &rport->port_cfg->svbus_en) &&
> > +		    property_enabled(rphy->grf, &rport->port_cfg->svbus_sel)) {
> 
> Why do you check the registers since you always enable those bits on those conditions:
> 	rport->port_id == USB2PHY_PORT_OTG
> 	rport->typec_vbus_det
> 	rport->port_cfg->svbus_en.enable
> 	rport->typec_vbus_det
> Can't you us them instead ?

I did some more looking into this, and agree that I can drop the
property_enabled lines here. The other concern I had immediately (that
the bits never get turned off, which seemed fishy) isn't a concern after
all, because after sleeping on it some more, I realised that it's probably
not very likely that a USB-C connector is ever going to morph into anything
else spontaneously.

Thank you for spotting this!

> 
> Neil
> 
> [...]

Kind regards,
Nicolas Frattaroli



