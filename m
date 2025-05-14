Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E419C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 22:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxkA9H2XFE2W+2BDOo18k+oLX34T0M1YflRBxsoKt3w=; b=wwdU/8gib+yGzMPaCa+QARgFo9
	Dm8gS1Ip9KXNM0hgvYIA9/iz5VtYWEzaXnwZDR0xGIDrpIdScOHWnMZEIltmNEYMwq0y0wrchw/DP
	HN/GaJFfKFKYRAQBRR/AvFL0Hn3T7w9yG1iqgfgD7VyulBYwQcQCLG+gNnR/KFtH27MCX/0yLGh3e
	QEZNMu1ywBF4byek3e7Oj+Wt+2c/VmOkKmP6xSnAmiH3D1Nhi37fZHllvpoStYbYMNV6pxBFy5SGc
	Ud/4d0OhvOMb28+p7ADyvnON2t6x9NWLCpLOpHH/fbRZjt5n7h3jArbqiPp/Uk+fBMr8sYQtrJVrJ
	3CmYay+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKX4-0000000GVIC-2WcI;
	Wed, 14 May 2025 22:24:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKJt-0000000GTcI-14f9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 22:11:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5EDF629E1;
	Wed, 14 May 2025 22:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F6EC4CEE3;
	Wed, 14 May 2025 22:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260680;
	bh=4UaJQCgd2hT5pkJkwrytXoNgO3X8wC20SnyuDVFYARo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t8oD9goZh6UuqsEju1LgX/cz+3etVU8bQZmK9BDGxyt3kRth1HC0B+pIwW0WKX/+q
	 bavDuMc7udEHHdAp0xK4POoX7khNWR2RmN1jWJHoH+XJzEv5J2cmgFIbzjACMCmV6i
	 ubs8GS1TwunKmx3Q0tz8Lu1BFyRBE2mqptFwaMu/Locchb2fwmOBO7QyaVGsEt5F1g
	 pcNbcOxIblc7uacp+8QSW2nT7WhwEIAcBIcBYkGtgf2IEb0h6uRM48x8PqNNdeNV7o
	 JhyVpUag0Fhzhhuzi04oGOedgTxstO8OxYKIRS66zMxSh9FQPeAB4q8i256PlNFhWX
	 GBCFdHkX+XGqA==
Date: Wed, 14 May 2025 17:11:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Taniya Das <quic_tdas@quicinc.com>, linux-staging@lists.linux.dev,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Eric Biggers <ebiggers@google.com>, Liu Ying <victor.liu@nxp.com>,
	devicetree@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ross Burton <ross.burton@arm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v3 13/19] dt-bindings: media: i2c: max96714: add support
 for MAX96714R
Message-ID: <174726067779.3133689.811162498884437185.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-14-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-14-demonsingur@gmail.com>
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


On Tue, 13 May 2025 00:28:22 +0300, Cosmin Tanislav wrote:
> MAX96714R is a lower capability variant of the MAX96714 which only
> supports a fixed rate of 3Gbps in the forward direction.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max96714.yaml        | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


