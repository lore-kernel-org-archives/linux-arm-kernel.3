Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373C5CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AvxsLUnmBr5A2JbKgsqTvQi3FQLzoodMUimWijcM5Js=; b=yqhk7v/SKFPy0Q8w+T2AL5D56x
	aQL8isseDEXd7NtMWkrkbHKDyI03AKv/RA+CLZgybuN0utQzikWyVzNgjoHso67iUEgiy7Sweo5oQ
	3K4PGi8e4FRNFY3NyLQ6lvOXkLwWXbPLwVuxSlLLZ9bl42hTNGMUSsnOnbrtmIeOyklrvmHp5fJLj
	2VFw1aednq98s5he7jTNj1SeJ2CCXVPV8OEbIqt8MafDJleb/fmdieYgQNhmmWP1ccwS2Ae67ttk8
	Xzny2kLg3qHyxqp678Jg6bMpw47o/ezxmDc7fLBg34Sw18kHsNDkDmEFnNGNZERgObcJ8P9jtl3I8
	5st7/L8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkfe-00000004V85-3Oxy;
	Sat, 23 Aug 2025 09:36:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upYAW-00000003QTt-3Vbv;
	Fri, 22 Aug 2025 20:15:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0A5D5A58B90;
	Fri, 22 Aug 2025 20:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D25AC4CEED;
	Fri, 22 Aug 2025 20:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755893723;
	bh=1Wup3O/kJKm/ZC5Sk9t0n/JhaFTwNdq1SU4O8pcpU7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=doumbUTkxdxy5qD8tSwxIqmCWw1C+OAOW3s5urGlMmsHQFd+NT7V0Djyj7t88RS7J
	 /fK5Ozi66cGfCXt05DaxJ3UrKhkbTJ92GRoSXtV5Xzh5HpoLAHNXiSHAotKvIOx8n7
	 jqnviij6a9RquHEFabBbkJ0Yvi7mmAoAGs6yy0fMPgn/ZKjKRU3aum2taviMFLGp3b
	 xuq4wn7o8u7E9Q38ITLTbC08PV+4nKRH719kjfkoZKoIsUznx6sFt2ibOgCEO/L2+8
	 86zkEIt0Imw3/BeEi1LR44g/IMP3C+cfYDhwSWS0oXCf24Aamo66sR8ZnhUdNJYHU/
	 /vbUo5m8BJX+A==
Date: Fri, 22 Aug 2025 15:15:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Alice Yuan <alice.yuan@nxp.com>,
	imx@lists.linux.dev, Martin Kepplinger <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-staging@lists.linux.dev,
	Steve Longerbeam <slongerbeam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	linux-phy@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-kernel@vger.kernel.org, Luis Oliveira <lolivei@synopsys.com>,
	devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 01/31] dt-bindings: media: add DW MIPI CSI-2 Host
 support
Message-ID: <175589372183.282948.13173863715963070537.robh@kernel.org>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-1-c9286fbb34b9@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-95_cam-v3-1-c9286fbb34b9@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_131524_938348_751074B6 
X-CRM114-Status: GOOD (  10.78  )
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


On Thu, 21 Aug 2025 16:15:36 -0400, Frank Li wrote:
> From: Eugen Hristev <eugen.hristev@linaro.org>
> 
> Add bindings for Synopsys DesignWare MIPI CSI-2 host, which used at i.MX93
> and i.MX95 platform.
> 
> Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v3
> - drop remote-endpoint: true
> - drop clock-lanes
> 
> Change in v2
> - remove Eugen Hristev <eugen.hristev@microchip.com> from mantainer.
> - update ugen Hristev's s-o-b tag to align original author's email address
> - remove single snps,dw-mipi-csi2-v150 compatible string
> - move additionalProperties after required
> ---
>  .../bindings/media/snps,dw-mipi-csi2-v150.yaml     | 151 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 152 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


