Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E14CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 22:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQ4bZQVeZUAVpc+yTRE9o/ba8s956lk7mtrAzur0D1g=; b=ULeayz6ix1LbJlW4v1jSOpkQf2
	HLBZjD6e2Yhulb2x6yABsRO/rQI9xaQaqN1MCyvyPb+zPWtLGdywBBCDMHAs4Yo9nwGx50qr8pSud
	JlbMF87wWNgGLEZukhbUfvmShsEZ8ORS0WSIT/GWi+u0U7/xbZwhJtjzsW0WmYnyj2wiAciW8ZEkY
	RhqPx1UsumEAk0O4A9jUn1zJFCHySG2KY5kw2GjLfdgNCoc+HEr2fynUX72jg9lyYWJhtIMcmWDki
	5pGEUB+rtbcnzLegpUC8sM2wxBScuI1Ol/BTrqce5rppk4d5+8kZFoufYmgEiE5wvXlaLmvSPjQhS
	0P4nhmXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxCOz-0000000BtAD-1UyP;
	Fri, 12 Sep 2025 22:37:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxCOw-0000000Bt9G-0nOB;
	Fri, 12 Sep 2025 22:37:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B716423C5;
	Fri, 12 Sep 2025 22:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2214AC4CEF1;
	Fri, 12 Sep 2025 22:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757716673;
	bh=B9UWbZGKGjcmdpBpJTHq4Bvu86HEtGMURBUQlAh+wng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TrVcwliJdziWcvEcLi0TVBaYRU0cqz+P0LkYP18PS4V8it1ba7cZ92zsa5Y3dzWLc
	 YrEuOyNwShq0RR+1+3s/CzKz/FvAj8Dg2ILyM9zKHc+GxAcTbJRbF9zrHAxYtHAtWS
	 nowrg87C3Mhu7Ma9MVTSiKPANaSzfmKeaaI+jiwqqKI/eFzfgCVIsx0GyGgRpB5mC/
	 E1FV/bHUfiM/xWBXFUvAkeBLYpdn5iD18PAOpqzc3WdYh8uHA0QJpTs+ikEAG/Jg8A
	 LroectmFESH23Jvjk8Jl5nAs0sIu7GliX4k4LL9XE6Kb1IBSFNtgZdkeRG9oO5IQJw
	 v2hGeBjsKFJvA==
Date: Fri, 12 Sep 2025 17:37:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: luiz.dentz@gmail.com, kuba@kernel.org, airlied@gmail.com,
	mripard@kernel.org, angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	maarten.lankhorst@linux.intel.com, tiffany.lin@mediatek.com,
	houlong.wei@mediatek.com, minghsiu.tsai@mediatek.com,
	lgirdwood@gmail.com, louisalexis.eyraud@collabora.com,
	linus.walleij@linaro.org, devicetree@vger.kernel.org,
	linux-input@vger.kernel.org, yunfei.dong@mediatek.com,
	edumazet@google.com, linux-bluetooth@vger.kernel.org,
	tzimmermann@suse.de, broonie@kernel.org, andrew+netdev@lunn.ch,
	kernel@collabora.com, chunkuang.hu@kernel.org,
	amergnat@baylibre.com, conor+dt@kernel.org, matthias.bgg@gmail.com,
	support.opensource@diasemi.com, linux-rockchip@lists.infradead.org,
	davem@davemloft.net, andrew-ct.chen@mediatek.com,
	krzk+dt@kernel.org, p.zabel@pengutronix.de, sean.wang@kernel.org,
	linux-kernel@vger.kernel.org, simona@ffwll.ch,
	linux-mediatek@lists.infradead.org, marcel@holtmann.org,
	dmitry.torokhov@gmail.com, dri-devel@lists.freedesktop.org,
	pabeni@redhat.com, jeesw@melfas.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, flora.fu@mediatek.com,
	linux-gpio@vger.kernel.org, heiko@sntech.de,
	linux-sound@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 05/12] dt-bindings: display: mediatek,od: Add
 mediatek,gce-client-reg property
Message-ID: <175771595983.1528737.3645378655142592974.robh@kernel.org>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-6-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-6-ariel.dalessandro@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_153754_252713_90961C24 
X-CRM114-Status: GOOD (  12.48  )
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


On Thu, 11 Sep 2025 12:09:54 -0300, Ariel D'Alessandro wrote:
> Currently, users of Mediatek OD (display overdrive) DT bindings set
> mediatek,gce-client-reg node property, which is missing from the DT schema.
> 
> For example, device tree arch/arm64/boot/dts/mediatek/mt8173.dtsi is
> causing the following dtb check error:
> 
> ```
> $ make CHECK_DTBS=y mediatek/mt8173-elm.dtb
>    SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>    DTC [C] arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
> [...]
> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: od@14023000
> (mediatek,mt8173-disp-od): 'mediatek,gce-client-reg' does not match
> any of the regexes: '^pinctrl-[0-9]+$'
> ```
> 
> This commit adds the missing node property in the DT schema and updates the
> example as well.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../bindings/display/mediatek/mediatek,od.yaml     | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

I fixed up the commit msg with Krzysztof's comments and applied both 
display patches. Thanks!

Rob

