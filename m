Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D755AD609D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 17:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CJncsbaGDAchEGU52xoyVRJG6ueXf/iMGFvRXVubn8=; b=38pqN4++bZBnHPgfxb/jtWsGSv
	8hxQXPFStmFpv3B8wXkNwqXyxjlwh0r/TGgUxi8P66SgZHTZhnO05CotYAd8IhkfVLYxXZxo/cjAj
	RJS1gfBroXWAM6D1iT5Ut2sSn8q5HvBSxGVcwNYZi13/xRI2Twy/VH0NrSm+IeSNxVCa12MakYOSY
	5Yh8eQtnDptQ/nhuKtRvydD7NkxzX7PWyxAZEft1JIbS5E2EfpSClTDn12a4Us/rt07rHxxjYiedr
	PGtKfv4GUiQw4MfjjaYliSgrgfWcY48fsfFJQaXYP1Bzn3lpgreR43zi2sOc3EeJjMwK4sx7JTTbQ
	R42XG8Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYdj-00000005b3x-477w;
	Tue, 16 Dec 2025 17:15:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYdh-00000005b3P-2QH3;
	Tue, 16 Dec 2025 17:15:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF5E34087A;
	Tue, 16 Dec 2025 17:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79985C4CEF1;
	Tue, 16 Dec 2025 17:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765905308;
	bh=mcmdjoIeQ8dVaydge/S3sCXDOzpTarcOqio6eoFh39k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fd77r7CVON1lRH0b5ILmf5Gy/OkXnk169H1lioS5jyy9elisWdT1B/13wKfu+8pZc
	 MMVtqqxS56r1V01p+Q85v7lwRhImLwUnIJJ0vwO75aAuzEyDngWY8pLjYM79dfY8f+
	 5hyuQnh96NvBdqQApeIyRFLfbs6yW4Y4LKCn8Aw/RrfYIIobxDskLwKUX6wRtVGBKw
	 R2zpsoAI2i5/AFYKvFT2N8twQh/qnJ6umnF7PnanyQvjDYoEksoloEXlTs+/elMEY/
	 PTZGiL02hNPhdY5Gtl8RycZ9WpmAyen3c6YEpedvcyXnwPyXz276eehtsd3P+/npXv
	 IAcWNiEQ0WdfQ==
Date: Tue, 16 Dec 2025 11:15:05 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Vinod Koul <vkoul@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-iio@vger.kernel.org, iommu@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev, linux-sound@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Remove unused includes
Message-ID: <20251216171505.GA2641341-robh@kernel.org>
References: <20251212231203.727227-1-robh@kernel.org>
 <20251213165949.4b51f7cb@jic23-huawei>
 <695ca5d2-b713-4838-8427-a9d31751c0cf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <695ca5d2-b713-4838-8427-a9d31751c0cf@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_091509_640830_F5559388 
X-CRM114-Status: GOOD (  14.99  )
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

On Tue, Dec 16, 2025 at 01:02:52PM +0100, Konrad Dybcio wrote:
> On 12/13/25 5:59 PM, Jonathan Cameron wrote:
> > On Fri, 12 Dec 2025 17:11:52 -0600
> > "Rob Herring (Arm)" <robh@kernel.org> wrote:
> > 
> >> Remove includes which are not referenced by either DTS files or drivers.
> >>
> >> There's a few more which are new, so they are excluded for now.
> >>
> >> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > 
> > Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com> #for-iio
> > 
> > Ideally we'll get a QC ack on those as well.
> > 
> > Jonathan
> >>  .../dt-bindings/iio/qcom,spmi-adc7-pmr735b.h  |  30 --
> >>  .../dt-bindings/iio/qcom,spmi-adc7-smb139x.h  |  19 --
> 
> Those are being moved to dts/qcom:
> 
> https://lore.kernel.org/linux-arm-msm/20251127133903.208760-1-jishnu.prakash@oss.qualcomm.com/
> 
> and will hopefully be in use later in this cycle.
> 
> Krzysztof and the submitter agreed on that outcome since they represent
> hw constants and aren't "real" bindings (connecting sw to sw)

Okay, I'll drop those 2 when applying.

Rob

