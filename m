Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2ACCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 22:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0+UD+Yw+EAgKYBaOW8R3QEC9Yrxig+NIt3rjRIBbtM=; b=oFHEx3SMUiPscSQetshfbr5KII
	Hm0M97APpHixpsieWQLZJGpqgYcwfAQT4cVLizucmn+FpgdOmhNtovBU4N88cCEV010fDduV/TUEt
	DNjuiAXUh6RBEXEuiZyrcwl845Bb/ea6cZM54mF5oFA2H7CwQXsW4cEQeajfDMSZU7K1thJHRpMqd
	DgPPblFwJxiUI8tRvB6on2iJ2YEeNE1v9Zqni6QPuJzQGkp8AJv1hXFucpPpTpEc6APuW3+HXLl4L
	TQiy6t1XF5sTWr17XjDFlPX9OdlFu+dGpWsOGO52shE67bFLsOrhq5xUAEIj2PzjUBRrWfrBrOwQR
	UtT32vHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJfW9-0000000BApz-3UEA;
	Thu, 13 Nov 2025 22:10:13 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJfW6-0000000BApR-2P7x;
	Thu, 13 Nov 2025 22:10:12 +0000
Received: from pendragon.ideasonboard.com (82-203-165-222.bb.dnainternet.fi [82.203.165.222])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9B62DA8F;
	Thu, 13 Nov 2025 23:08:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763071683;
	bh=dKdEN6uk0uJTL9PTysEpXfawWX1Up2xnGgIfoHRGKbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YEkTkthxQzEcJJhVrVrzjcyCeXDHk0PRd12zVw3NKYtS1fZEUFNHTXi+TqT2nCGnD
	 4XSmGjRSfT+B2cQIAvoIdHKu1kIQRe5sRgyipDliGwwZck+5BGH98n7ClTy7ntDcCm
	 zKvDpmFq4nUVZpKGqGmnqHDx3vdhemfmfVsLr+Gg=
Date: Fri, 14 Nov 2025 00:09:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v3 0/2] drm/rockchip: dw_hdmi_qp: Fixup usage of
 enable_gpio
Message-ID: <20251113220951.GA5912@pendragon.ideasonboard.com>
References: <20251027222641.25066-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251027222641.25066-1-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_141010_760199_1132E9BC 
X-CRM114-Status: GOOD (  16.83  )
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

Andy, Heiko, Sandy, could one of you push this to drm-misc ?

On Tue, Oct 28, 2025 at 12:26:39AM +0200, Laurent Pinchart wrote:
> Hello,
> 
> The dw_hdmi_qp driver supports a "enable-gpios" DT property that is not
> documented in the corresponding DT bindings, and is not used in any
> upstream device tree sources. This patch series renames the property to
> "frl-enable-gpios" to express its purpose more clearly, and documents it
> in the bindings.
> 
> In the previous these two patches were part of "[PATCH v2 0/5] arm64:
> dts: rockchip: Add device tree for the Orange Pi CM5 Base board" ([1]).
> I have split them from the Orange Pi CM5 Base DT and rebased them on top
> of the drm-misc-next branch to ease integration.
> 
> The other main change compared to v2 is the rename of the property from
> "tmds-enable-gpios" to "frl-enable-gpios".
> 
> [1] https://lore.kernel.org/all/20251005235542.1017-1-laurent.pinchart@ideasonboard.com/
> 
> Cristian Ciocaltea (2):
>   dt-bindings: display: rk3588-dw-hdmi-qp: Add frl-enable-gpios property
>   drm/rockchip: dw_hdmi_qp: Fixup usage of enable_gpio member in main
>     struct
> 
>  .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml       | 11 +++++++++++
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     | 14 +++++++-------
>  2 files changed, 18 insertions(+), 7 deletions(-)
> 
> 
> base-commit: 18ff1dc462ef6dacba76ea9cb9a4fadb385d6ec4

-- 
Regards,

Laurent Pinchart

