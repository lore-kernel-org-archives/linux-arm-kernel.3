Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEC0C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdqWCcW8lsMQPS2xU1zQ9OVFwnuDtYA4dTZ5HLldHmE=; b=OhijXhRwam2f+VrA1lrCDGwrfI
	ndeWSYCadVk2LFnq2T6SXK/WmVxNaaBS/gD0Z9qkWKIwUZY2otOwdjLUoiQCoNahKA8FVkWIocYt6
	QOiwskGwCzTRk1a0NATbaSgbDhRZYbaectBjxKug7J3Z6ZMJvqo7YTkLYC9IdGCeGH5WVWKfAV+6x
	oaeDJSXsh2TwlntjjVhVmQEIlBMIiKtP7pzCH3ReddqEPx0Gb7FiFMtNdhwxtRIyt3BTokaMCt/Ow
	kJ/ycN6N2eGHRgmaG3WXm/FIIku2VaDIed5FQRVhUgxMJaMT60Rjt8+9G3yAx/gP/RVkVKGvEXFZ6
	p+K077+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4GW-00000006c3l-3S4i;
	Tue, 11 Mar 2025 18:23:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts40G-00000006Yqo-0M6J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:06:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5CC025C1191;
	Tue, 11 Mar 2025 18:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85EE0C4CEEA;
	Tue, 11 Mar 2025 18:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716414;
	bh=XuObIYw3RDsk53zQsCVI6/Eb60dSnbERWjSJp+4yvEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IssCg3cSilF7/wjdOftUOaTpCwST0CEsEV8ami2djc4HT6zPBbMCiV/cHwuS2qMND
	 BkfRj2zSV9ascPDRQScmPra88Z/6OcwtlZIL7RGSerTgdXK4JbyQXZXkwysZ84tUzd
	 gZ4N7XKY03vtOf/cOvrtsofH3ARPwTzhgLplkpSlhm0dIPwjn5mAlA8Q/vUIIbFzwj
	 m4/QuKDoZcuIu69BBnRgW0ygpuhOPul9039z1kpkUtdnd+ZONfpPLcMbjkREjK8hY+
	 cYmP28DjU0MSVrPw+EdEscCB7XKfcgomXkUj5k7doC8sXSppC2e8aGi+cTIHea0aNn
	 wfgk00fV7KDxw==
Date: Tue, 11 Mar 2025 13:06:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Eric Biggers <ebiggers@google.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	Zhi Mao <zhi.mao@mediatek.com>, Hans Verkuil <hverkuil@xs4all.nl>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-media@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-staging@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
	devicetree@vger.kernel.org,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-gpio@vger.kernel.org,
	Cosmin Tanislav <cosmin.tanislav@analog.com>
Subject: Re: [RFC PATCH v2 01/16] dt-bindings: media: i2c: max96717: add
 myself as maintainer
Message-ID: <174171641225.3915054.13208024290734160025.robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-2-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-2-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_110656_161443_AF3D16B2 
X-CRM114-Status: GOOD (  12.28  )
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


On Sun, 09 Mar 2025 10:47:53 +0200, Cosmin Tanislav wrote:
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


