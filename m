Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181DFC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 22:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nb6/L+48QpQpe11Mru6CiGYz6SLQx4K3jzQDHG783Hs=; b=dAogqDuWcbjhz9qL6HM73dWSFf
	XNO1ncK7deApBktGz4tLOnChb0B/PRn4QcD+hcWeEkAOslQ0sr30xl6j9DFp1Ptm1Rl1vhaATH7IE
	/IBP4r/6Dt8gDJyVlqIONRnZWQmTFtYwr0EMfcdYLP77Rhr/8NCb0JbjbM+Qd+qWIZxSiw5vP6nGa
	bu7HO8aQFDHxqZ8ZtqrDRlhziVogcGj7zAgG3Toh6+syEueo/weZMCYQ6P6pJXL7tmgV73rriKIXG
	2N5GrqoJZBcxOAN1tnzvgAjueYJisYouTYvg4b9T8w/kkTXIcyDNV6DKsRghx/Innc851WJVCrxDN
	aTGwOIDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKJ3-0000000GTQt-2btO;
	Wed, 14 May 2025 22:10:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKCG-0000000GRxh-2yPK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 22:03:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DDFF6A4E2A9;
	Wed, 14 May 2025 22:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DDAC4CEE3;
	Wed, 14 May 2025 22:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260207;
	bh=tFUiw9jSDFGQfWMjyTIVRcA/2nR4HJFoR2JXQACUWVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kNAcmINZbZC/ZEeYVuEEblerwJddQSMo4nY150rrTEnOu6LSOqT5JX2MOZrtePd4o
	 qJUOrQajMD4N5f+rDe6pdYXTbzvaTnOpkwWIfSrzmngft90CUFQprpQpn46ixd9mcv
	 NHbCeCGxfsLnS55A4N2mFzXKlcCgAUXTP9UtfiM10/JgbydtSH30jYj7ISkhr/AAGk
	 LapX7TNAHEbsRPZdEB7Zqrar/h+dQS/oBg8zcPdPUA+yhM8e2m2IksHkxRrw9HtIZK
	 Cm1va2pKB98dsZFYoo3fchwwCb8bT+VvsmU20gJXLH/WyEotfRcY8qQZVCdA3jol1x
	 GvwjOUO8nsGuw==
Date: Wed, 14 May 2025 17:03:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Liu Ying <victor.liu@nxp.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Eric Biggers <ebiggers@google.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Julien Massot <julien.massot@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	linux-media@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Will Deacon <will@kernel.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v3 06/19] dt-bindings: media: i2c: max96712: add myself
 as maintainer
Message-ID: <174726020521.3121912.17909444436858791493.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-7-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-7-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_150328_818116_5C26A0E5 
X-CRM114-Status: GOOD (  11.75  )
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


On Tue, 13 May 2025 00:28:15 +0300, Cosmin Tanislav wrote:
> Analog Devices is taking responsability for the maintenance of the Maxim
> GMSL2/3 devices.
> Add myself to the maintainers list and to the device tree bindings.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 1 +
>  MAINTAINERS                                                     | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


