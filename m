Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF36CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 17:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHO0prT8B/cvAz5K/3Flc1lkb/TA5mBubj4Z0ZR9/ZQ=; b=Ono4ZUMLpS0nqptO5leJabykgy
	E/Zxw+TtMai6ODWjK8mQotjrDWI9Bj1wTf/ZUChPgdu9D/pMgk3Bq6uFZRR/89slmZK3iGv8sC1tx
	uGcbWRAyYIRqKSrAbLFiXXRwjMEO5JbYvGZZjhVLV721xUbiPZhfARh2LJSnHc4qiM3Zh4+tNSLiw
	qTB8Slc3pkj79ftwoo5ZxVq0HvAk5huQ4qDyArX+lOv8OBJT5c5QTcbEhsJQkw0KcxjcEtJ/6iSSy
	r9oCJGRw/SXB4qMyvrpB3335agtDlse6X4nmvRgZYtQnT/JspnSHnQ2NmJPceQRbkyAUvoRXqROU1
	kAE8XUeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCqc-00000005FM2-1Wg3;
	Mon, 15 Sep 2025 17:18:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCqZ-00000005FKO-1Vd5;
	Mon, 15 Sep 2025 17:18:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A415243833;
	Mon, 15 Sep 2025 17:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5060DC4CEF1;
	Mon, 15 Sep 2025 17:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757956714;
	bh=UudavyaBPyKCvnlpRZjR/WL6Gz4dsHuj/kJzrYrD31k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F/JbTlRdHf2wuMS7PAQDX+cMcUt0Tl2t0XWZyhzi1eOyiISPk7RjJcnsIS0GIpi9V
	 7SbXrx0cZaL37tKdyg/vcUqZJzqSXLzgTtNoPXknib9uGaINZ14kqTyI7w27Jd9lfE
	 6D3ifCwLIr5z4r+BgcNvocGfn8dNx4/n/EYCi8Mze70UyAizPmCLXaCHML3w4Or7VH
	 FunnWjeDz28vusWXMx/XEhCwqYuB21S/9Q0HK2V/W6cRl8dDYJpjZR2DN8/L5UEREY
	 wgMm1OoRpOaQJd0B0pyOH+m2tJXI1okpo7J4dXt2uk7aqpPPk7lAJ+PaV8RA0gVQkg
	 wtCjSaz/a2p3A==
Date: Mon, 15 Sep 2025 12:18:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	broonie@kernel.org, flora.fu@mediatek.com, p.zabel@pengutronix.de,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	support.opensource@diasemi.com, edumazet@google.com,
	krzk+dt@kernel.org, louisalexis.eyraud@collabora.com,
	mchehab@kernel.org, matthias.bgg@gmail.com,
	tiffany.lin@mediatek.com, linux-media@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	chunkuang.hu@kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, airlied@gmail.com,
	linus.walleij@linaro.org, pabeni@redhat.com, lgirdwood@gmail.com,
	kuba@kernel.org, linux-sound@vger.kernel.org, tzimmermann@suse.de,
	amergnat@baylibre.com, linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org, andrew+netdev@lunn.ch,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com,
	yunfei.dong@mediatek.com, linux-bluetooth@vger.kernel.org,
	davem@davemloft.net, jeesw@melfas.com, heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org, minghsiu.tsai@mediatek.com,
	sean.wang@kernel.org, houlong.wei@mediatek.com,
	luiz.dentz@gmail.com, kernel@collabora.com,
	linux-mediatek@lists.infradead.org, simona@ffwll.ch,
	marcel@holtmann.org, andrew-ct.chen@mediatek.com
Subject: Re: [PATCH v2 04/12] dt-bindings: ASoC: Convert MediaTek RT5650
 codecs bindings to DT schema
Message-ID: <175795671272.2949182.4347956532845839846.robh@kernel.org>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-5-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-5-ariel.dalessandro@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_101835_410929_15E3D040 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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


On Thu, 11 Sep 2025 12:09:53 -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for Mediatek MT8173 RT5650
> codecs to a DT schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../sound/mediatek,mt8173-rt5650.yaml         | 73 +++++++++++++++++++
>  .../bindings/sound/mt8173-rt5650.txt          | 31 --------
>  2 files changed, 73 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


