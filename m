Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E73C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 20:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZ1asCEkpgSVKsX4k5hGodgTNWlxgJQWcqoOFQaeR2E=; b=EeyRIThsrHLen7sqAPWC4pDfrD
	KQlXRYoNPXcl+9VVrZkGirxEqC0QhhOBMAUn9SsfiaSB6hDLl0JMPmd+lhL/z0biWIRZMWYhJE2lz
	N0qG87aqMDgWJwkQUnEJMnnd7mBmkkuj+I7uk28CNt+UCLyRe7c2Zv1kwmiN9Khi6jepBfsUIysKW
	jjyhZsHx36aebMHy1hfDJPGy4BNAqh991cYxvvEiqXkRd3Y5Vvwx/wZKSxrFyinWUHAtjFD3eGbBb
	ux2Zq+JERtBkYQt/nd9LckE1lfOTlS4xgDeRpLmdrRtSAvrark1jBjdwMEKVU+9pJHSVMuG426fo3
	GrzulyWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts65g-00000006us2-3ODw;
	Tue, 11 Mar 2025 20:20:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4sM-00000006iC8-0Def
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 19:02:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47691A461D0;
	Tue, 11 Mar 2025 18:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA1BC4CEE9;
	Tue, 11 Mar 2025 19:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741719769;
	bh=903w085l1k6ydor21DnGi+IQsYPV/L4oQPMCNZIraXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DkaUpWFC6tonuAozpZLRP44Mvhbl9mjvUdNpmQEM9MEl9LVsmHnVfX5Ye3l4xANs5
	 3F+7S348veq0VbbP6e6uKnv7WBZ7XsoYLHnfDUetMq2y9OaDgJQbDZiwsQiigRpjkK
	 xS94S5HNcVEV3bxzkr05+ELKkcq4I9otxTszR+kBPh94Vosbwg7JE4BsWj0rGe5CY5
	 1Q0PdJl0mb8O2c+azuvNtTFn4MQeMY65V31g+MT/wEheoi9B1OApnfc8oF1JT6+j70
	 GLLAr/04IkYZ+rVPnCPTN+6UmOiGOFuE8B8F6pUt47BESyKCN0zsC7IxFfVKqGLf2J
	 U9eYovL+GD5rg==
Date: Tue, 11 Mar 2025 14:02:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-media@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Will Deacon <will@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Ross Burton <ross.burton@arm.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Zhi Mao <zhi.mao@mediatek.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [RFC PATCH v2 10/16] dt-bindings: media: i2c: max96712: add
 support for POC supplies
Message-ID: <174171976682.3984722.17562171213323916839.robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-11-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-11-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_120250_155751_08386557 
X-CRM114-Status: GOOD (  11.61  )
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


On Sun, 09 Mar 2025 10:48:02 +0200, Cosmin Tanislav wrote:
> The GMSL links can carry power to the serializer when using coaxial
> cables.
> 
> Document this capability.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


