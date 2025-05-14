Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC4EC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 22:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8AbuQs8rYPVpTLHMsLQgxmKoGt++a5TUe4kSedjNzkE=; b=MZrjVJ/U62URXqVAckjPPSwum8
	wvb28OVtXspANzxMuFqNQGL5EiSzEUnZU+4RMgj3Fmdf4U9xGlkqaeGKdEqS3006AMdqzcZUdOkCu
	fJBwUvLBwNO7fT46bT6Dc0cMDlQPdjUVH9yI0Kvhf9gDZFTXPaeeUaYITh3aHR5oWzlUhl4pfkoWP
	MKqwbE4ExQy8bBgY2GNkvvblRzh/OLnFSQR45C2TleaBot3+hAZd223heKViOrYlG9wjYVbitlCDD
	akl0TgN0yteRK+h4ZN4hz/sFDSZ3S+hfucln4lF+Wfkls9An9lKRSwDUvAxsdqNOCW3kvukVmxHQp
	9QpsG3Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKH2-0000000GT4E-3azK;
	Wed, 14 May 2025 22:08:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKBv-0000000GRt7-1aze
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 22:03:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6A580A4E2AC;
	Wed, 14 May 2025 22:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0404C4CEED;
	Wed, 14 May 2025 22:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260186;
	bh=DOxuecpOoYFFBrNEOqQW+VQSF4O2eelHquHDUs7IvFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qcz1V5NNoxnsrIJM+0EFJ4R8aM5wx5kTpQAYgGvPSKivx39MglvXa2XTROUxkMlCo
	 XwWUYXHyX5ERRIRlSkrktWf43CVjIKkcCUcgpIcijQxSUk+9f5Ubk+e/2mGrVsUxG5
	 WgYsIwGfFNiCcVQiXcxVIzaJTeF7FE6uyulCG3q78F4/msR/DSk92C9gET8xV5T0rF
	 8cAiAIiTtKca1LGhXrVQUtxmFRlAJeMiAQLaLQDOluAULotoQwKmmhluwaBSXMzxnu
	 UVYrhwC5EE6KOsE0o8j0EsDlF3gBf2z9mM1Qz5F02BpRud1OiTpoc/WAVxwVhoPrsb
	 w0vwPjc/MiriA==
Date: Wed, 14 May 2025 17:03:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-media@vger.kernel.org, Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org, Liu Ying <victor.liu@nxp.com>,
	Julien Massot <julien.massot@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	devicetree@vger.kernel.org, Zhi Mao <zhi.mao@mediatek.com>,
	linux-staging@lists.linux.dev,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dongcheng Yan <dongcheng.yan@intel.com>, linux-gpio@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH v3 05/19] dt-bindings: media: i2c: max96717: add support
 for MAX96793
Message-ID: <174726018371.3121119.12710872984241960937.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-6-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-6-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_150307_474329_6928467B 
X-CRM114-Status: GOOD (  11.30  )
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


On Tue, 13 May 2025 00:28:14 +0300, Cosmin Tanislav wrote:
> MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
> links.
> 
> Document this compatibility.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


