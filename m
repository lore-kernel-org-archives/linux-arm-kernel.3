Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DDAC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 22:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fI2zMJOmV0A0dLVKe1Xqy+6wNFiGQyubOlW4Xt8XN6U=; b=cmXJ80/5VG7/Z5/TwBHGNVHSy4
	6fftbTkKvnrAzEUiFbhR/2D8cMNO42VgCM0465Ss78OP6GGpY8obQDZqEW0czUKQpL/LeGkHfbvXK
	zryXkhHhyhWjFWUN2XfZYttu8H91LWAYer2m3oXmJ/WA94Z7pGCofnmVby1qLCyHN3oR3pUbPcnqj
	BH3cGMnVNXUTfGFVZ/DVxZm9pFcgNhXBZZOlTb8dcXtLUe0Tvas7/uhoEgrXf9zl6CGLZLlNZrSeM
	U2rTZrWM48dz+kYUU52KGPmGVHE3j0yAEc38ebEY0ULBWytTveF9RGu9HNTu3+DVx0schzMHVxj5R
	fx8JUwXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKN3-0000000GTvw-4BVh;
	Wed, 14 May 2025 22:14:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKDR-0000000GSF2-1fh9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 22:04:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF879A4E2AE;
	Wed, 14 May 2025 22:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFF9C4CEED;
	Wed, 14 May 2025 22:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260280;
	bh=VF/6ptY3YAA/WhG9VLCXpoTM5T1oQlAmB00KMlDK8LQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SZvDOd5IsEj3W7FooGL26wkWPwWGxk8bH/xzhj85q0rf1OJ0umY1BbrW2e2cubOq9
	 FZbQ1zAV1yAdrPaWE658yaUur5UHhW85U8fQJNQI+eJmXigtQT+P77QHGj/zoMHVh9
	 U8rQqKcZti+UbL9XHXJjj3VmMdqmm32ZrR40hEI4/elboe1ZSuNpjvimNHLBVz9LMw
	 mGeYfLKOIl0+4MetZAh5uzPZYG8pEmSQRYi3x4pElF6d8o6b5aKGi/SDM9Vj1ySsBL
	 5lXS3v3eRMGysVRbj6BDqp8WcIrUggMWqKiqDnbOtD641TOh0qjOsdbz2KT7je2B+R
	 tMA7KQOKqYiNA==
Date: Wed, 14 May 2025 17:04:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Eric Biggers <ebiggers@google.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Julien Massot <julien.massot@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Liu Ying <victor.liu@nxp.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zhi Mao <zhi.mao@mediatek.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-staging@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-media@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/19] dt-bindings: media: i2c: max96712: add support
 for I2C ATR
Message-ID: <174726027793.3124111.7562097751443784673.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-9-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-9-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_150441_503262_C3E86043 
X-CRM114-Status: GOOD (  13.43  )
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


On Tue, 13 May 2025 00:28:17 +0300, Cosmin Tanislav wrote:
> MAX96712 and MAX96724 have more than one GMSL2 link, and each link is
> capable of connecting to a separate serializer. If these serializers
> have the same CFG pins configuration, they will also have the same I2C
> address, causing conflicts unless the deserializer changes the address
> of the connected serializers.
> 
> The MAX96712 and MAX96724 support changing the I2C address of the
> connected serializers.
> 
> Document this capability.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96712.yaml    | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


