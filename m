Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CF5C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 22:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wc0A1p7mdRd30i4t63QQJzevb0CTvreBT6v3OrGsVWA=; b=NqfUw39W1MI4dlI5hOHTMCzCXi
	8bjzSuCvcdwrC3kxvn2pMPUEMpG91oTrJWf5b4BPvdNWSqKGy6ycLjGNYm4cPim6qd6GlZHthi8P0
	8phS8oBmp2EZM7kEwUP+3veLu0tFYIPU57qIGhdcLMPa8VTe6b5kGIjxoBYj2U2LE7vdMXNQLzHlw
	qkEvhV/xXI9R9tVmlaznLP0c479fXyZk6ybEpxauxADiai0HtlNRxV36aw3sjKuDDc5MJoKuMFIRd
	1uW++ugPKcWU36aeml/7E7/tShKSiQ84iIStsjAlBSJBMJwbyHxS3tmJpmV7rByEJuaKP60MM4LLM
	PjzyAXBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKL3-0000000GTi4-1E9f;
	Wed, 14 May 2025 22:12:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKD2-0000000GS6m-2b7e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 22:04:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB3044A9DF;
	Wed, 14 May 2025 22:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756E9C4CEEF;
	Wed, 14 May 2025 22:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260255;
	bh=kSYN5wSnAW3gZ+9G6lJ65RsA0L1GRRokgz8LEmwge8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UF4woT/PdK5/zYCNEqorTNCUe/N1+BoNjs3pgsYXQuukwOstmZoDbUxS7Rm7nq8KT
	 wCApHTnyhWsv8YVBvX2mTKGT7gfAY7iY9SLqJF3dhZkS/HdNf4JTOHRG2VUXFQViaV
	 Q/81W/B9Bc29AxdKGJ9kLJhqEZTogfMZ+dP70Q35UQs4X9W2iu+VlLwv9596fFaQ/P
	 Cetobslyxg/fVJ6XpjZ2BroXp6QCY5SMWy8lI0rJ3KlGe7tal5IFRhemOa9kfjgvHb
	 2BChcdGELMAm+P/DUho+o0GQ3Ho31ZWZJlf4ajL7h+tRO7bzrNrq+90VcJ39nab4p1
	 Pn0EtQOi7+TQQ==
Date: Wed, 14 May 2025 17:04:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Eric Biggers <ebiggers@google.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Will Deacon <will@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Ross Burton <ross.burton@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liu Ying <victor.liu@nxp.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	linux-gpio@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 07/19] dt-bindings: media: i2c: max96712: use pattern
 properties for ports
Message-ID: <174726025353.3123437.1360215980060366369.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-8-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-8-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_150416_680501_5EA4E527 
X-CRM114-Status: GOOD (  11.10  )
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


On Tue, 13 May 2025 00:28:16 +0300, Cosmin Tanislav wrote:
> The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
> the selected PHY configuration. Use patternProperties to document this.
> 
> The input ports are all the same, use patternProperties for them.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96712.yaml    | 29 +++++++------------
>  1 file changed, 10 insertions(+), 19 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


