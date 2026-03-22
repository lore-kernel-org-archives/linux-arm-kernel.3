Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B8FFC72C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 13:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u19R6ZmH2fb3IPSy31GLs1B3r1txPLZcYLK808fTUqg=; b=3s25gzlnpxa4gF4r+mdgdJumHa
	Iv+ImnE4blT/mufeijT3Yu0iwQXeW7xCYmi2iEIPULpSjT5GANBBPq0qjg/ZnQ9So5OPjDCMcJ0R+
	TXMSBbCWR6xYJY9ciuBzeCVSLmw+c4lAozZSsqsDiCjfodj4b5gK35Q0I7u0/7kMN5XvazW2zXkXu
	TXchl25YylreQUW/bA2ZSqcZPBUda23A3DtizEJr4KAgJMxUrtBk2O6/TSN16Y+Pf0Shrqk7iR7v9
	IU6S7+utiVsagDp2b63Jlj45KZVkJr1P+JXz8ZzGn3A0ubaNMk0uY17KRrIS5LLKz+gfDoP1D90VN
	avgwqECQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Iso-0000000FMrk-27Sm;
	Sun, 22 Mar 2026 13:30:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Isl-0000000FMqO-4Bfy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 13:30:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 41D224459D
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 13:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27BEEC2BCFA
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 13:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774186219;
	bh=+r4DJixed9qR03jrcBvB9qDQ5jUMnFCb5a5xczMslvQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J2197I21+EDGgXuP57VuepKieRb0SJoWutc8YtqGKvDuw8STRwbp6/V4v3R++E+fm
	 Ar4qymbmxSbOVdGBq0JT7DTtVXj/N0ZVBNomnzE9HeiKwEoC8t3nFbSv/IICo/6pDZ
	 U4G97GpVeEc7I59JdVAMamINnYWbjm5bDOrFkEGsdeumbYLG65chLJdlLDTOGDb7iq
	 QvWu5Vqx7e5DIWsaoan8JuxsENPOlpRxqtbACIqaOzmvdnYGNvTHQ71di5HSLKpbAs
	 ZJBB6Un/o2kNCMrkFq1HmRfuVLPbWg1AW8VzzbPchKHuKJ3JTqk73TIUwZFVcnRSWB
	 grCrOsMrMxgXA==
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12732e6a123so3915210c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 06:30:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWe9ZFTTyYmiFZ9DyOdpxhg12CNX2naXM2FPY/YzDrE8akz145NHVEEuTOdGYphcxJKtS8Tm0Qd4fkZtxNH5ROm@lists.infradead.org
X-Gm-Message-State: AOJu0YwJA0PGpQBf6lv2ehaQ7Az8bXzKEZlf1sZAsWx7mWfjKTsZB9gB
	5YewL1ck5dJVSZNm313jUQ1HiM4HdutmUPjVBwyDhWyxB5vTpU+UewfMDv/ISkPuaKsKI0nzWIu
	tPENu6AvP53Xdsd05LMn9s8xWsy+0Lw==
X-Received: by 2002:a05:7022:10f:b0:11e:f6ef:4988 with SMTP id
 a92af1059eb24-12a726e7fb3mr3981540c88.36.1774186218230; Sun, 22 Mar 2026
 06:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1771863641.git.l.scorcia@gmail.com> <92530e0a31eca1feb822f5c5fd4ac894937dd6c7.1771863641.git.l.scorcia@gmail.com>
In-Reply-To: <92530e0a31eca1feb822f5c5fd4ac894937dd6c7.1771863641.git.l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Mar 2026 13:30:06 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8JiyK0jbRsKfFkSguMNBgLXrMF07fZZ=7iNZWCb3p7Qg@mail.gmail.com>
X-Gm-Features: AaiRm51_S1J__pLk1a4D71_Q_McB7o8n-vG8FQQ5qEkWpejUVhVFdJ1R0hMpTzo
Message-ID: <CAAOTY_8JiyK0jbRsKfFkSguMNBgLXrMF07fZZ=7iNZWCb3p7Qg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: phy: mediatek,dsi-phy: Add support
 for mt8167
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_063020_077605_4B71EDFA 
X-CRM114-Status: GOOD (  14.77  )
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

Hi, Luca:

Luca Leonardo Scorcia <l.scorcia@gmail.com> =E6=96=BC 2026=E5=B9=B42=E6=9C=
=8823=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:26=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Add support for the MediaTek mt8167 SoC: the DSI PHY found
> in this chip is fully compatible with the one found in the mt2701 SoC.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml =
b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> index acdbce937b0a..c6d0bbdbe0e2 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> @@ -23,6 +23,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt7623-mipi-tx
> +              - mediatek,mt8167-mipi-tx
>            - const: mediatek,mt2701-mipi-tx
>        - items:
>            - enum:
> --
> 2.43.0
>

