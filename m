Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CDEC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 22:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJyPjU+u6VDPI1pugt6znIktsw8co8OrlgfixpGhscU=; b=jqvIZFlgldsR01Wzc67ouqo6KA
	xwG7AgsSR6jOKdvKJGTkXdNBnxgidU8PDpoSOzr9Z1Hf/S3xVUFQYeaqB8TaQyCUBlI/2JGmdrEel
	oZ9YPCiRlENluFqg3+r6AfM2T2xz06UKOVsiZTmLjy6aYAhc5MAzRK3WXfKyhIyt1pt5MUAki8ceC
	waZAdq3BkrVWMt2lSlB0cuf5ldRHi3fXeIjUVRiqsaXOhjDaDmlUU0mPrWEe6EDyijqpw33m/Oe+m
	JeK3uoN1ESO2QWDGUMLBEAkpoV8+541gKfyPu4TXiXNlDZ64G+ltwZhLye8ND584Jg/NQ9f+SqO2X
	fDmXhc7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKV3-0000000GV8z-3uYN;
	Wed, 14 May 2025 22:22:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKJ9-0000000GTSk-2zSq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 22:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3002044EE9;
	Wed, 14 May 2025 22:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E5CC4CEE3;
	Wed, 14 May 2025 22:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260635;
	bh=Wwrv2UhO43VIjIV1UCjx5uhQxg/LgnMUNYlez1/6DQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vi8krzYuz9+9Xad4bChJ3PEfgRgtAamMGhnpUjFE9eO2bmZGPtYun5GrbU+vclIYb
	 IzTZ/Q45f0uk6ug0j+1NEMXkm7iBvkj3wMXrEUJcvmZzg+WNr2R7XYxqecOGDVB8KA
	 zB4yDEqKbqtN0Fd9L0QaO2EXHLRzWG1BY/stP8jsBYjRUXdOLJF1Hr2xNc+PIEz6Ak
	 8QUa2UnO4/g5+EUWGh67B3jyrxcymDyx0+911YTcQgJZKOkdE4JYoYbaNluPuqXihj
	 iJPqmgcgcRHTxommRA6FVIxMRBFOup/8dqbYc4u1PRTzFQW6iyAbA2sll49hWbffVE
	 iJZVBMK+FKtRw==
Date: Wed, 14 May 2025 17:10:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: linux-media@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Julien Massot <julien.massot@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
	Liu Ying <victor.liu@nxp.com>, Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Eric Biggers <ebiggers@google.com>, devicetree@vger.kernel.org,
	Zhi Mao <zhi.mao@mediatek.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3 12/19] dt-bindings: media: i2c: max96714: add myself
 as maintainer
Message-ID: <174726063286.3132588.5517805662447106335.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-13-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-13-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_151035_770656_B7982027 
X-CRM114-Status: GOOD (  11.84  )
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


On Tue, 13 May 2025 00:28:21 +0300, Cosmin Tanislav wrote:
> Analog Devices is taking responsability for the maintenance of the Maxim
> GMSL2/3 devices.
> Add myself to the maintainers list and to the device tree bindings.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml | 1 +
>  MAINTAINERS                                                     | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


