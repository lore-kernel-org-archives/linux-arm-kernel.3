Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2334DC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 22:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miJsrxcnFVcD35HqgOiTX9kEs/rOCbPixak+XEQmhAI=; b=FyUIFkIKQZhwpRk/mdIBs4pwlr
	eFamFS6/eTjtLLno1rHZUEweNMdmy+nliHxV2My8Io13nQuBPZ797UnhIHXUtsOdmwS561to2QcLl
	qzxaAoY9C7CnjMPuERxLEODDdoz86E52+Gs1LIVrihK+DduFykQr8AZq0TzsoHwc2oGGh+qUPLHEH
	oPaEzSZP72SOX8C6OKfKR0LXAv92YlTRt8vjiyof0sbIkffJvikgLrDIt6TL62fRzLpXcHpPSPOig
	+WWRgn5f2lsCkAqn3tWyqGntKcv5zccokeRd7GKCWwj6KsbhDIBOzTfAbbS2HqGDARKzeoZAa4lhK
	YgAz3F5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKT3-0000000GUv0-0Z67;
	Wed, 14 May 2025 22:20:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKIx-0000000GTOo-3v8r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 22:10:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A61465C5A26;
	Wed, 14 May 2025 22:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E24EC4CEE3;
	Wed, 14 May 2025 22:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260622;
	bh=4VFuZ2yi3z2eOk72UlVbmTd8V3sowLhwi4xqoZboboc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b1b4OYzmlWPkYqoi7t9vb4BJ/52mqwbnw+ZmwDprOsIrx/mKFkhumBclgUOsOYwQ7
	 KLLgwjON2hgstVwnWfM17oYgDId5DDiYpls6eyavHnLsLLLGftZ4WMFPhsxKon6KNJ
	 qLPqBrjpFKge2sZy/CP/Ut9psIvehp8tC9bv8LtZ8RHq77TSPljKFSghKTuwesXQTt
	 yhGX/CX6G6eMxITA7agm7toJLExeXgBurTVVyJK6vtunqsoGEb+g9Yj2pcjriemvNo
	 zb/lEG1TnNhQ/+sZzgXiiXTr1iQTPj6LUGYBZQyFdgOpSefgGRnvWXZLYqHmlS0Qxz
	 31Fwq6IebAGHw==
Date: Wed, 14 May 2025 17:10:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Dongcheng Yan <dongcheng.yan@intel.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	devicetree@vger.kernel.org,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Zhi Mao <zhi.mao@mediatek.com>, linux-media@vger.kernel.org,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Mark Brown <broonie@kernel.org>, Liu Ying <victor.liu@nxp.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Conor Dooley <conor+dt@kernel.org>,
	Ross Burton <ross.burton@arm.com>,
	Eric Biggers <ebiggers@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Will Deacon <will@kernel.org>, linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v3 11/19] dt-bindings: media: i2c: max96712: add support
 for MAX96724F/R
Message-ID: <174726062047.3132190.1522703429549013683.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-12-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-12-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_151024_009745_880A215C 
X-CRM114-Status: GOOD (  10.70  )
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


On Tue, 13 May 2025 00:28:20 +0300, Cosmin Tanislav wrote:
> MAX96724F/MAX96724R are a lower capability variant of the MAX96724 which
> only support a fixed rate of 3Gbps in the forward direction.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


