Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80ED6CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 21:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTrVUzFHW3Oj2CSlNbzlRmytUYv+2bWZ46hvpaZRjPE=; b=mcfo6sbc6oDh/kE47HGQcvn8ON
	pwcIjJv3GBpMmo826Q8ZnP69Tbcs5ynnUDdCjOHFH9+hZEqg0k6r2R3rlKXDwk2DLJxJSJXEIKKpp
	+OToiEKrm0xVPpD1O+XoBhBrQHZI7JUnW893JOBiob84TkqwbReeZohKsx1Ghfhr1zhuinypKl/Ki
	TozXs7f+UVr5Wu27MP/CMcswxiRjfgcoDt/rYqfvjiG5c0LDc4drYtSV3bu3uHGdSQ1Zxx4Lj9y4P
	jro16Qk9TeClcBEMJ7yUKzot/Na4xik+7onawojBKu034ifDTXE3E+3Y2u5LbuB27222PGoMWG0iv
	u4UTDxUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBewE-00000004YZZ-2UHs;
	Tue, 29 Sep 2026 21:00:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBewC-00000004YZG-3Cul;
	Tue, 29 Sep 2026 21:00:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ABA976022B;
	Tue, 29 Sep 2026 21:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E411F000FF;
	Tue, 29 Sep 2026 21:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790715631;
	bh=bTrVUzFHW3Oj2CSlNbzlRmytUYv+2bWZ46hvpaZRjPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JyRa5Ac9b1U1vLHqhBLIX/oo7sKjKipP9//jXhI9SeVf4EVAq1kZ3CFPaXFN0bul6
	 d53C4S2tdma+FaMP1AqWi2hYj951uAdN3xtsA1zflfjG4zYnd3BC+H8G40zNFJfKX2
	 C/eltXspluel5iPOFbHNdeQ9x7N1nme2hi2vOMoiwhM/ewAN30q6vN28FMQw+gNK+3
	 lOFnceu8YKafKw+60VyJeDjRFVkcMn5TG41TbJWK9MZcz9h9w7GUR7yjXNuPKQZK5a
	 TB8qUto/O9M0fnxM11oWQmgBlzRiHHGKiVBFuwIzq7fY9duRTAeVTX6gTxe6w6cwta
	 Z9jAI5WNe+S8A==
Date: Tue, 29 Sep 2026 16:00:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Maud Spierings <maud_spierings@murena.io>,
	Jonas Karlman <jonas@kwiboo.se>, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Paul Walmsley <pjw@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Robert Foss <rfoss@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Dominique Belhachemi <db@domibel.de>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Graham Markall <hello@big-grey.co.uk>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-rockchip@lists.infradead.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Yan <andy.yan@rock-chips.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v5 03/21] dt-bindings: display: bridge: Add
 starfive,jh7110-inno-hdmi-controller
Message-ID: <179071558022.2715907.15730978189912998246.robh@kernel.org>
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
 <CGME20260929103207eucas1p26e12772a3af606f651f1bb396686e8f8@eucas1p2.samsung.com>
 <20260929-jh7110-clean-send-v5-3-82b4d8e3c6c7@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-jh7110-clean-send-v5-3-82b4d8e3c6c7@samsung.com>
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


On Tue, 29 Sep 2026 12:31:00 +0200, Michal Wilczynski wrote:
> Add the dt-binding for the StarFive JH7110 Innosilicon HDMI controller
> (DRM bridge).
> 
> This device is the second child of the starfive,jh7110-hdmi-subsystem node.
> It consumes its register access, audio master and audio bit clocks
> (pclk, mclk, bclk) from voutcrg, and both the pixel clock (pixel) and
> the PHY from its hdmi_phy sibling.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../starfive,jh7110-inno-hdmi-controller.yaml      | 121 +++++++++++++++++++++
>  1 file changed, 121 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


