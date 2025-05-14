Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBD4C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 22:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFaY8rn3Xg3w9a6MtFUoRiAtDsA/43TfQf5FpMSxpDE=; b=3kHnG0szsPUNdmhddKmL5YP9UW
	7ha+pqkdJ68unk/G5pgUmRKB5ATpFgtJy0JRV5pUrPd1vAfib4NCcgc9ifTL3zpLFh/IsUCUcv1RE
	jXYkw0EXp21gM8T9jidFT4+OzYZzu4T5vj+g5eJWbhcdY4UXcxcU8Hf7tU85gvE99Y1ipzCIJjzZe
	D9j294BRh7jWQnXYAIIf3jOhtNsJF0RQkmENxx5KqUCiY2lSzokCX3UUs3565RB0w0CrSGVtZZG5n
	Rcqo3TGXYSHJXjvjo7tc5F4pgXGJzxVyAc3OxqtKUsD6R/sRgVYFtq7jjokkwahvA4UhoQNUSAWv8
	F7g9KYvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKB2-0000000GRmP-1jJN;
	Wed, 14 May 2025 22:02:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFK7e-0000000GROH-2Ung
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 21:58:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 780FE5C688A;
	Wed, 14 May 2025 21:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B94C4CEE3;
	Wed, 14 May 2025 21:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747259921;
	bh=vykZInbUINsawiOxFB/k38aMhOlKTpZD4MOpGwHvilM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bmmXcAGAocAdem/Lr4F7/wbqeuscJFeVx4zRZ+5gvbpT5A/+eATKxdeNRNJtJfam5
	 HbuupvBiUJI9m2+wFGXYvJCJXvZD5FTb6coC3Jh9UMFW5I3MrBINXvmPMWuxOecg3T
	 iBweZkF0RBeuZ5+UyrY4fLrXiM3wfE/NhvMRmOdAIfbD0JdB7CRbk+ntBRVhD9hi5W
	 EMPRrD6IAnePz2ZW0CcWwwslBlhz/BTuxARE7oKgVNo6MgUUast2kI/4/EQR7P2eTK
	 xm+izJ9RVHrPVFJmzwEwTqH7npv6prTT6ywo8lf773p+1Er+WkUqaVNAOohZS9y3AC
	 /Rp68MmNX8Uig==
Date: Wed, 14 May 2025 16:58:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Liu Ying <victor.liu@nxp.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Julien Massot <julien.massot@collabora.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Zhi Mao <zhi.mao@mediatek.com>, Eric Biggers <ebiggers@google.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-arm-kernel@lists.infradead.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Ross Burton <ross.burton@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 02/19] dt-bindings: media: i2c: max96717: add support
 for I2C ATR
Message-ID: <174725991910.3111130.9703709978772131529.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-3-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-3-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_145842_666314_A522312F 
X-CRM114-Status: GOOD (  11.55  )
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


On Tue, 13 May 2025 00:28:11 +0300, Cosmin Tanislav wrote:
> MAX96717 is capable of address translation for the connected I2C slaves.
> 
> Add support for I2C ATR while keeping I2C gate for compatibility to
> support this usecase.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96717.yaml    | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


