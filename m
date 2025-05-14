Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C2BC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 22:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+M88bWgHgBIATjjuOd7wmym68HJyaDyTRM160K/B/w=; b=yj3CdI8NaOKLzSzlHOe7oz6gqJ
	6iz2ssWVDwWdFjIqoN+9n9CBVTCuhYncW+m4WXJr46J7MMIFHZmFhBBDpuZtWhjHvXVPYjBIfCvNN
	4HvehubItKpuSVK+WjlKm8pnS+ZcbGn8CEh/Mn1Gv/EZQ7jh5Qt7cfcT7q9I9tV44O7GhClw/U2VI
	vQnlymSOZ8CWCd8tSouOXEY6lRzePGOWFkR6S5woQpfs632hk1P15HwH04AZFz1M+O5MA8qda1g6H
	Cei58EV1GayYpQEnMN8AQ8mkV/5aLgkhnAsDtz0R0Pvk89Dg5SkvhoipiP0n/nIgs2Rg+CZJvYgzj
	5VMxUetg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKP2-0000000GUBZ-39lD;
	Wed, 14 May 2025 22:16:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKDv-0000000GSMu-3MNY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 22:05:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DEAA861155;
	Wed, 14 May 2025 22:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3945FC4CEE3;
	Wed, 14 May 2025 22:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260310;
	bh=F1JbH1eATkPBeJkGH4i74QeDy3H0QrGsbTi6OhDM7VU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YArlUvJ5HgmZhwJHRxUZwhChPTmKiMZoT0Au29oRU2t/zj62Vv7O8beD+m4vtyMzs
	 EoF4+0CSRHYpq2kvrGGRM2T5GnGMmyYELs/mqvaCN8muKWXZdDgF6gNxoShVpP9xBv
	 Kf6YRuMya1258sPB9y16Y5ObFiD/RBFVpDLcXH4S7SEj6x3WTlcV/z/Adbxkrl6vn3
	 79oWrzKTPM2aJafokjtZk0r/aHdHhEqogqpV40drxQIMqlhUMkogL2RwVL52D7rqGP
	 fblr5EOrcggaloU8L/TtmtMXEq6/+9WI6an4sedZ46PIC1hd/ySbxBQKcjbRauJlG/
	 XQVTLNU7xiRlQ==
Date: Wed, 14 May 2025 17:05:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Eric Biggers <ebiggers@google.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-media@vger.kernel.org,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Will Deacon <will@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Liu Ying <victor.liu@nxp.com>, Mark Brown <broonie@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-gpio@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-staging@lists.linux.dev,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ross Burton <ross.burton@arm.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 09/19] dt-bindings: media: i2c: max96712: add support
 for POC supplies
Message-ID: <174726030810.3124901.1578644990539282460.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-10-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-10-demonsingur@gmail.com>
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


On Tue, 13 May 2025 00:28:18 +0300, Cosmin Tanislav wrote:
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


