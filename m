Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D0AC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsgWDmIW0xqXprtJvDuLIWbee1tgm25mj9X8ksZVVAY=; b=1h6L/fpFc03noutkhOwaY8gpeK
	UZ0viLbNH3Yc/n+v+RIt0N1KPJYhi4hSCdc3g7MyLC4cFtZleMmAh3Ne+NQttdQzuomXZV9G2XFxg
	2phjeVKqtkrl8ozCKuJKLwucCbTEpa64BuAxOKNoxKIC1C/WD3TD96wzn+v+yMO5AooAV9n7rch4c
	SNlnHDXlhvzow+20m/cnK5kPFWNHH++D7uciDyVzzp0KyzOKWPCR9VdChWO42aVgGL4PM5YuUHMRI
	h24VNWQpZLtau0DWNe2s6HICd/8mcvPT+oJ3mGjoNamL1Kg3Ud67hNO/V0DBLRaINa9zg8wdp/Haz
	6dhZRSJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFK92-0000000GRc4-302C;
	Wed, 14 May 2025 22:00:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFK5o-0000000GR9T-0hWQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 21:56:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D10D629E5;
	Wed, 14 May 2025 21:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFE4C4CEED;
	Wed, 14 May 2025 21:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747259806;
	bh=RGYu87/MAqgKB3NyYtwwQKOk3FvzBnCoc9OCA815Hsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KTCdstgHWRrldh1wABpKj5eRgkuQhNB8/qHdUFoPG1CrYo9NuhWXZzjVQkImNGzNW
	 5V1YXwpoqKfb1yoSTA1qt/WlcAV8ROqTVWhLYewcBW1/npMuTgTScjUBPx0e+5HLvC
	 x7EceodlirCQuQktCWkdKiOkNGMXbXYAGg7Fvsi6S92q6TPzHxUq6fDRM8ArrW3v0t
	 uluNe7pVtRuBgTTpZE7pZvPo20pgcB/uNFM6+J2naS0V5HJHKc4cNlEGI2dSpcdkpX
	 sBBwoRnlz/seX7ra4MgDLIU8runuxeffmDssmHoLvXlZfkUiMXpYOhi7bYwFVCo9P1
	 D20Lm3eykWjRQ==
Date: Wed, 14 May 2025 16:56:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Liu Ying <victor.liu@nxp.com>, Zhi Mao <zhi.mao@mediatek.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Julien Massot <julien.massot@collabora.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Will Deacon <will@kernel.org>, Ross Burton <ross.burton@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Eric Biggers <ebiggers@google.com>, linux-gpio@vger.kernel.org,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>, Mark Brown <broonie@kernel.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-arm-kernel@lists.infradead.org,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v3 01/19] dt-bindings: media: i2c: max96717: add myself
 as maintainer
Message-ID: <174725980451.3108487.13826253376011337133.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-2-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-2-demonsingur@gmail.com>
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


On Tue, 13 May 2025 00:28:10 +0300, Cosmin Tanislav wrote:
> Analog Devices is taking responsability for the maintenance of the Maxim
> GMSL2/3 devices.
> Add myself to the maintainers list and to the device tree bindings.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 1 +
>  MAINTAINERS                                                     | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


