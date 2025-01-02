Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B439BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 08:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcYpCzKmwxZjDWL7GZILDCVxkpSfRBXj2Y1PEROQqjU=; b=08cXmX9ISx93m5CgdK3I4fBL7E
	xT5eVQ1XjzXTn2ExbELXa44gKN9JHTMXB4tV97Xg+tFA/Ft/VFCB/cBnhaogHJb9TiVlHxAn1C1zr
	AZQs2fnS0nwl48KYkdItE3aMzyP4T80VPq7Uh+TeKjhsL0Ne/xOfrXF5IRTxrSDmt/PwJceW6sUwr
	9bwFgOasUt3Krw62HpMEUmSKfn4G8souDCwjL4k2Ev75Yvn9OGViRJBY+tz0p1yAuOVicduhsQf+J
	iB6jMjOcQwoPVyts6qIp5XCAdPCk91Xr1EMvLFhNwZ9AWHaL7EE4Ve3tWOA9dS/eMLkFqKQJOGLX+
	0wwBBcbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTGcR-00000009w4e-2ZWu;
	Thu, 02 Jan 2025 08:31:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTGbI-00000009w0Z-1IJE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 08:30:41 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2ED880A;
	Thu,  2 Jan 2025 09:29:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735806589;
	bh=tsPS3XAjtH/3cde0vUoy4i3L6/+p1mMnya4QFPd7W3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZyvflE9bGalNjH64JCp91O/Nkbh5ppDx9gHPP7SK0PTzo90bCPEwlpD1vGVO7mK8
	 JS4baft8eTdMYwZ4ozBdzqT2qWQ1Hhly6zqfWzM5cQZK/7quRD63iNSCh/i0x2Jh5H
	 iHxHMnc/04Vei0rVMx1AE+FQlU3Kd6cazQZCzHSI=
Date: Thu, 2 Jan 2025 10:30:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
	dri-devel@lists.freedesktop.org,
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
Subject: Re: [PATCH v3 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
Message-ID: <20250102083038.GB14307@pendragon.ideasonboard.com>
References: <20241231192925.97614-1-marex@denx.de>
 <20241231203136.GD31768@pendragon.ideasonboard.com>
 <88778e2b-8c43-46a1-bb79-0d9c968a5233@denx.de>
 <20250101223620.GA7206@pendragon.ideasonboard.com>
 <ac4kkjv2nmziu6pd6vkuxbllhkqaueu32snfetpemtu2l5s6ud@cvystps3734o>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ac4kkjv2nmziu6pd6vkuxbllhkqaueu32snfetpemtu2l5s6ud@cvystps3734o>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_003040_503220_8E95FAFC 
X-CRM114-Status: GOOD (  39.58  )
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

On Thu, Jan 02, 2025 at 05:26:50AM +0200, Dmitry Baryshkov wrote:
> On Thu, Jan 02, 2025 at 12:36:20AM +0200, Laurent Pinchart wrote:
> > On Tue, Dec 31, 2024 at 10:10:51PM +0100, Marek Vasut wrote:
> > > On 12/31/24 9:31 PM, Laurent Pinchart wrote:
> > > > Hi Marek,
> > > 
> > > Hi,
> > > 
> > > > Thank you for the patch.
> > > > 
> > > > On Tue, Dec 31, 2024 at 08:28:48PM +0100, Marek Vasut wrote:
> > > >> Add a flag meant purely to work around broken i.MX8MP DTs which enable
> > > >> HDMI but do not contain the HDMI connector node. This flag allows such
> > > >> DTs to work by creating the connector in the HDMI bridge driver. Do not
> > > >> use this flag, do not proliferate this flag, please fix your DTs.
> > > > 
> > > > What's the rationale for this, what prevents fixing DT instead of using
> > > > this flag ? Adding such a flag will most likely open the door to
> > > > proliferation.
> > > 
> > > See the V2 series discussion, there are a few in-tree DTs which do not 
> > > have the HDMI connector node. The rationale is there might be more and 
> > > they might come from vendors, so this flag is necessary to work around 
> > > those DTs.
> > >
> > > > If you can't fix the DT on particular boards, patching it could be an
> > > > option. We had a similar problem on Renesas boards, which we fixed with
> > > > a DT overlay, see commit 81c0e3dd82927064 ("drm: rcar-du: Fix legacy DT
> > > > to create LVDS encoder nodes"). This made the workaround self-contained,
> > > > and allowed dropping it several kernel versions later (in commit
> > > > 841281fe52a769fe, "drm: rcar-du: Drop LVDS device tree backward
> > > > compatibility").
> > >
> > > Frankly, I would much rather fix the few in-tree DTs and mandate the 
> > > HDMI connector node in DT, which would keep the code simple, rather than 
> > > maintain a backward compatibility workaround for problem which might not 
> > > even exist.
> > 
> > The in-tree device tree sources should be converted as part of the
> > series, I don't see a point trying to maintain backward compatibility
> > for in-tree DT sources.
> 
> DT is an ABI. We are supposed to keep backwards compatibility with
> existing device trees (at least for a while). I'm adding DT list and
> maintainers to be able to provide comments on this topic.

Backward compatibility is about supporting old DT binaries with a newer
kernel. There's no need to support old DT bindings in in-kernel DT
sources. By definition, if someone compiles a DT from a newer kernel and
installs it along with the newer kernel, there's no "backward"
direction.

The backward compatibility requirements aim at ensuring no breakage when
upgrading the kernel without upgrading the device tree. As I mentioned,
there is no regression if nobody is affected in the first place. Proving
there is no affected DT in the wild is difficult though.

> > For out-of-tree sources it depends on how likely the problem is. There's
> > no regression if nobody is affected. I personally like restricting
> > backward compatibility to the strict minimum, to ensure that all new DTs
> > will use proper bindings. Making the backward compatibility code
> > self-contained helps there, and we could also print a loud warning
> > (WARN_ON() seems appropriate) and set a date for the removal of the
> > workaround.

-- 
Regards,

Laurent Pinchart

