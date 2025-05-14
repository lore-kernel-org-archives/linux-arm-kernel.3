Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5025C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 22:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnoLzcOalNEGfB6bC4U/GG0uqW8KtqGG0WUQtJf8iiY=; b=brogx53H695607DyztJ+YPPedN
	Y6LNqNScUGfjSwFt9PYxxIc7GaChmJy2aN+k3aOEI0TGDLwcS1K9/HtljqbZiDMbP1kdHHXOrlrHc
	RA60AdokvdcZsDWeTMWeklKXZ31R79PK5GC6iyniP7TN6jnQThpFdLnLOkLScER5vQBtXViCAxMiO
	2BMb46GLuigPeYlMHzKmio3lK8uFl+OEZ4I/rpWmMxiH/lxoWrmSYuuEO/qXYDPLgUYDlvvQSrZQ8
	k7d4qyG5cxzYDRm7YHtjMNarrE5q52PER//MpL7qhX2b9Lsr9VI19sYnaco4UwsvTGKRNjPjiQnw8
	mE0+tqpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKF3-0000000GSer-0hsp;
	Wed, 14 May 2025 22:06:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKAw-0000000GRls-38qx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 22:02:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2736A5C6848;
	Wed, 14 May 2025 21:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0848C4CEE3;
	Wed, 14 May 2025 22:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260125;
	bh=bBCMDxAQqB223GvdKm9yHRzBPrInid0txIiE0L/rdLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wlt6WydL4OlmyBn1uPevsmGDaJwHta+vKvolkNv5JmwU7YG1xolTibG0Sa62P+wMc
	 CAB9rSiSGyooqzKWWut3SciuoToVo8kC4olRP6xQ27WCWtBCyeH5fHXVtFC967YrlE
	 71fLEC/Hb7Ygn5kxZH4YK5so4WOs98TzJhJD7K1d0pMCLKbD+4UTHkVVCBKStLPxCs
	 F8HwjxUiZU+g/aNh09z28uunT1Va7moIR4TvvYeU/UNAQg0E9dHqt2U+Wa0qd9cc80
	 3jBVst83TxjAR26sTbP/BL6tE6K+B/hxe6ZLKufhi/7Lh1zPfudUNP8GZGbiMjLiAE
	 V3XbroG1u97Yw==
Date: Wed, 14 May 2025 17:02:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, devicetree@vger.kernel.org,
	Liu Ying <victor.liu@nxp.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>, Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Zhi Mao <zhi.mao@mediatek.com>,
	linux-staging@lists.linux.dev,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mark Brown <broonie@kernel.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-kernel@lists.infradead.org,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v3 04/19] dt-bindings: media: i2c: max96717: add support
 for MAX9295A
Message-ID: <174726012257.3116712.4544442889949224547.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-5-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-5-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_150206_850501_2C2742F2 
X-CRM114-Status: GOOD (  11.86  )
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


On Tue, 13 May 2025 00:28:13 +0300, Cosmin Tanislav wrote:
> MAX9295A is an older variant of the MAX96717 which does not support
> tunnel mode.
> 
> Document the compatibility.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max96717.yaml      | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


