Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893F8C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEEmw3KuY5ds8wKR7E9oVUMUTYwULl1ezlaWi1k/+ss=; b=1/+YPZa7cS2UviyX8MUOAWi9oo
	xaz4MTFt9+OG0DlmKYqcbHPW56zctyBbV7nPUT98wjvebM56VAjhK7inALtZMgVWe2FNBhLWP80R1
	6j4TPA59zZQo4HxNbG8OPkQEmMV9jITZtFEIEbQUT7Bfg80npHAwReQzG40MHt4Tl92w6ni2DBZJy
	U1l3tcxStwbqbJqQzxLoYvZ9ueWgS3YTGS0oKn3mgVbEYm6weSloLlBnJ/jDAHbIV+JP53x0KvFjX
	CAQCAumoaYEGu3glhLLKIl1IPujqCySSnuN9VaKKB9mwYzHxwqIL+uxBmzb5Ou2fLA6rUtGxgIbPs
	mhy4vfyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4dB-00000006fvF-2xOc;
	Tue, 11 Mar 2025 18:47:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4NW-00000006dAl-0tZh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:30:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0BFEC5C5628;
	Tue, 11 Mar 2025 18:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C876EC4CEE9;
	Tue, 11 Mar 2025 18:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741717856;
	bh=nqJGj2gczt5ZrI0zy+StoezidkdBwshZUOHFEphXLc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KoZvPbqFccgIhq0iGup/S17CS4VzxYEJuyq+OnE0v74gahP5QyKad6RAV5jErhefo
	 Pb/+leksiPh+OL5l9/zSdGCmjtHlRCmm/4Xw2hUbx66t7AY3dWJ9KcaIuUDZqlJO9h
	 Bhz6kpy9lIW66lBBNJMaRF3MtQbWk3jb2cOERLFzl2OLr/nF6riLAsgvG7diV5cqyT
	 OvCXawCJz1sDeo+Xp8WGu6pUWR6HmYW9sL5HJ9dthaAbE/7jNdnfZGdgVwvuvbewq4
	 2pVR21sULRo37Qq21csVzbcjRD6YTka/oU4CGunC2eUKV6r1LfMG/5vyn7/11smX2w
	 gvLJPulaVUdHg==
Date: Tue, 11 Mar 2025 13:30:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Eric Biggers <ebiggers@google.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Ross Burton <ross.burton@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Will Deacon <will@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>,
	linux-gpio@vger.kernel.org,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev
Subject: Re: [RFC PATCH v2 06/16] dt-bindings: media: i2c: max96717: add
 support for MAX96793
Message-ID: <174171785257.3942045.11201403719435330786.robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-7-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-7-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_113058_286870_C4E91AB3 
X-CRM114-Status: GOOD (  11.47  )
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


On Sun, 09 Mar 2025 10:47:58 +0200, Cosmin Tanislav wrote:
> MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
> links.
> 
> Document this compatibility.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


