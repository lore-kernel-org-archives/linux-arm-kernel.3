Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADECCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 18:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZHvPUDUeF46fcsyPqkjA9EbPDimxCOihBCXK1F96Qg=; b=M9q6wF5k1XEjTY6WXER8q+6LQB
	VktD6U7bccepupEN8zzfKBAK/99ic77sIkf9QpDDTbaFXYixBlPXK0B2I36l1svLTn/i3wOnmcbhv
	/WeI5DQ3914870zoC2QNAWOltK0eAJ0D4oGz2/xogFaUrdpyqNLklXKXmTUfoK5QENnMZTJhlB6ac
	VAj+BO5pfNi4ORt/IvbGb5fTdKDDEym9OZRqQACv6yImPSrDG2hG6yuuAIRychIM/mifQcNXS6bev
	umygBJF2v7W1w6lvq/WgkI+qv90MgU1UFJK9N7uLMxYTuQEAP6D356vRTnRTc+d2hhUQkHoPw2eow
	8zNZGK0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRbr-00000000ak0-2QXY;
	Fri, 07 Nov 2025 18:54:55 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRbn-00000000aff-3bFV;
	Fri, 07 Nov 2025 18:54:54 +0000
Received: from pendragon.ideasonboard.com (82-203-161-95.bb.dnainternet.fi [82.203.161.95])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5891B111F;
	Fri,  7 Nov 2025 19:52:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762541570;
	bh=T5Rw6eWbPlE27qTm/Y51A5DLe5CKLXrJE8yBA6UrFuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wm+Oa9C6Gi4k4YZUlAj74M3wS8m7LFsTeP8uiJemarhggDXSx0cAHpWMnLk5pFtGL
	 czvnQ4dmulBRace93soXdOvIr7hInH9xghsFxPHOY8pIwWDr0nZd5/Qd7cToxKGqmx
	 fx5nvc+2KOD5qgHhY4wmsZ0zyFgl40HA+c0fXv3o=
Date: Fri, 7 Nov 2025 20:54:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Markus Elfring <Markus.Elfring@web.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v14 00/18] media: rockchip: add a driver for the rockchip
 camera interface
Message-ID: <20251107185441.GG5558@pendragon.ideasonboard.com>
References: <20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com>
 <aQ4tJg8r_j4NyKhv@kekkonen.localdomain>
 <074cd08e-0412-49f9-8dd9-b1f96eb11717@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <074cd08e-0412-49f9-8dd9-b1f96eb11717@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_105452_326023_7A2BD2C8 
X-CRM114-Status: GOOD (  26.09  )
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

On Fri, Nov 07, 2025 at 07:41:59PM +0100, Michael Riesch wrote:
> On 11/7/25 18:32, Sakari Ailus wrote:
> > On Fri, Oct 24, 2025 at 02:51:29PM +0200, Michael Riesch via B4 Relay wrote:
> >> Habidere,
> >>
> >> This series introduces support for the Rockchip Camera Interface (CIF),
> >> which is featured in many Rockchip SoCs in different variations.
> >> For example, the PX30 Video Input Processor (VIP) is able to receive
> >> video data via the Digital Video Port (DVP, a parallel data interface)
> >> and transfer it into system memory using a double-buffering mechanism
> >> called ping-pong mode.
> >> The RK3568 Video Capture (VICAP) unit, on the other hand, features a
> >> DVP and a MIPI CSI-2 receiver that can receive video data independently
> >> (both using the ping-pong scheme).
> >> The different variants may have additional features, such as scaling
> >> and/or cropping.
> >> Finally, the RK3588 VICAP unit constitutes an essential piece of the
> >> camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
> >> units, and a data path multiplexer (to scaler units, to ISP, ...).
> > 
> > I understand both RK3568 and RK3588 include an ISP. Do you have insight on
> > how would this work, should the support for the ISP be added later on?
> 
> Short answer: Yes and yes.
> 
> Long answer:
> 
> The patch series at hand adds support for the PX30 VIP and the RK3568
> VICAP. I cannot really say something about the PX30, but on the RK3568
> VICAP and ISP are orthogonal (the ISP features its own MIPI CSI-2
> receiver, different from that introduced in this series). Thus, ISP
> support can be introduced anytime (whenever someone is motivated ;-)).

Won't they both be connected to the same sensor though, and probably the
same D-PHY in the SoC ? They don't seem entirely separate to me.

A block diagram that shows connections between the CSI-2 pins, D-PHY,
CSI-2 receivers, VICAP and ISP could help.

> Once this patch series is merged, I'll push out changes that introduce
> support for the RK3588 VICAP. We can discuss the integration of any
> RK3588 ISP in this scope then -- and there may be some things to discuss
> as there the VICAP and the ISP(s) are directly connected by means of a
> MUX unit in the VICAP.
> 
> Alright?

-- 
Regards,

Laurent Pinchart

