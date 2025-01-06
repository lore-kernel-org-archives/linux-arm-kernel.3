Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5FDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 17:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ve5ETpYH+HZOg9DqLp7h0IrFlBdWMqh/ffo+a35uwPU=; b=JpsH1+5lQMm9c6V4gJnHW/ghaC
	J71rGBuY/3sqoD8pWdjvjfC35Dc8nnCHdm5wOFcyv92MXbZuO5TDt3TMkpVb6mOl8cSCKqb5ffNKE
	2Gt2p1betycKssM+S+WylWmREtuqALF+MUYdIzh24UXfUmx9VAdOLs1bfPI9r+p2HnsMgs1aSX2tr
	ihaapacsxuttnj90Ge5PpXyjzcoJm4XBHBBC96jsbeT+vHk7SkDtvZeqMylQzS1cCdu6X38Fv8727
	gEOymIwxHp21ACz11bPmF6Hw4WbOIC190x7CEZS8Tlsa5EOCDkGFtp2x+M4j08E8Rzn+8oof5NIgr
	nL72eLAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqZ0-0000000249m-2Paw;
	Mon, 06 Jan 2025 17:06:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpTO-00000001rki-2j4N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 15:57:01 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 109D2520;
	Mon,  6 Jan 2025 16:56:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736178964;
	bh=m4G4sp/GWSPNBk2U6hQREs4YdXlRNqrxfvcawNfVRKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pOVTWHMae7VYOpCYkBMbUzkiqGAEKZWPLoCkEBCUJlNZ77Zd4O8jR34HcFsq+jytz
	 JeifhstPX5yXIPbk/xhEZlUTFfL8RvOMri+TRXD4j4gWnsSN6TLmTyici9RIk88BGN
	 vSvZu+vkNCbhdiA8dJfR+AeG+IKfGf+8+39i7VL0=
Date: Mon, 6 Jan 2025 17:56:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
Message-ID: <20250106155653.GG10308@pendragon.ideasonboard.com>
References: <20250105190659.99941-1-marex@denx.de>
 <20250105232219.GC21164@pendragon.ideasonboard.com>
 <a783fe47-89dc-479b-8e85-f956d95cf404@denx.de>
 <20250106070514.GA5568@pendragon.ideasonboard.com>
 <add68d4c-51d8-4c1a-9560-7c95213dd524@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <add68d4c-51d8-4c1a-9560-7c95213dd524@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_075659_991209_794982C1 
X-CRM114-Status: GOOD (  21.88  )
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

On Mon, Jan 06, 2025 at 04:36:26PM +0100, Marek Vasut wrote:
> On 1/6/25 8:05 AM, Laurent Pinchart wrote:
> > On Mon, Jan 06, 2025 at 03:48:52AM +0100, Marek Vasut wrote:
> >> On 1/6/25 12:22 AM, Laurent Pinchart wrote:
> >>> Hi Marek,
> >>
> >> Hi,
> >>
> >>> Thank you for the patch.
> >>>
> >>> On Sun, Jan 05, 2025 at 08:06:03PM +0100, Marek Vasut wrote:
> >>>> Add a flag meant purely to work around broken i.MX8MP DTs which enable
> >>>> HDMI but do not contain the HDMI connector node. This flag allows such
> >>>> DTs to work by creating the connector in the HDMI bridge driver. Do not
> >>>> use this flag, do not proliferate this flag, please fix your DTs and add
> >>>> the connector node this way:
> >>>>
> >>>> ```
> >>>> / {
> >>>>       hdmi-connector {
> >>>>           compatible = "hdmi-connector";
> >>>>           label = "FIXME-Board-Specific-Connector-Label"; // Modify this
> >>>>           type = "a";
> >>>>
> >>>>           port {
> >>>>               hdmi_connector_in: endpoint {
> >>>>                   remote-endpoint = <&hdmi_tx_out>;
> >>>>               };
> >>>>           };
> >>>>       };
> >>>> };
> >>>>
> >>>> &hdmi_tx {
> >>>>       ...
> >>>>
> >>>>       ports {
> >>>>           port@1 {
> >>>>               hdmi_tx_out: endpoint {
> >>>>                   remote-endpoint = <&hdmi_connector_in>;
> >>>>               };
> >>>>           };
> >>>>       };
> >>>> };
> >>>> ```
> >>>
> >>> Are there any in-tree DT sources that use the old bindings ?
> >>
> >> See
> >> https://lore.kernel.org/dri-devel/AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com/
> > 
> > Maybe I'm missing something obvious, but where is the patch series that
> > moves the DT sources mentioned in that mail thread to the new bindings ?
>
> Since this optional flag is added, that DT update series can be done 
> separately.

It can, but I'd like to see it merged in the same time frame as this
series, so it should be posted (and reviewed and tested).

-- 
Regards,

Laurent Pinchart

