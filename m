Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FADACA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zx90QVm6GzzZTR1BgRYVVtW+V2nRWjdVuhddzxz8SwA=; b=FAaNfRGHJj7fJoZQ2CAGVTLN6g
	bSWddNmBjLfUkfW1HD/7JdBKFqcV2JA1B3yi9SFwzhkIrSbSK4sVaOaPt+nXNa448fVKVQ08bG+eK
	veojF2Zzk9IuRu0hHUGLJ1bz/iFEPk1aC7MR5N/nJZUg6EhHTwP2O7rT9SWVvmY3UXCkUKSbXZkuu
	P5zj/jgR5mFlmFQsIcTvtg7IqXIq3gsSAacRuaoIUdAUs8TxpJ9FukJPSv20bfpHt0Tgej+1V4Hpw
	sib9Jg+j3NABs6FCv05clBabGmPRf88/2YXbke0hRDxhci5t21OnGiES8YEIULcoynGmzaJTROCYX
	JXijbS5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphuG-00000004Aa7-0aYC;
	Sat, 23 Aug 2025 06:39:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upU4a-0000000377t-08pm;
	Fri, 22 Aug 2025 15:53:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 02EC6A58AFA;
	Fri, 22 Aug 2025 15:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8FAC4CEED;
	Fri, 22 Aug 2025 15:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755877978;
	bh=GZcqAUhind1yPvp4zhhO0FBJJvpJTi5iPD/E6Y6N6GE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tBUykIQBRStiihtAnJe0AVIVB3jiv164suytchNLOiHzXp4/+sT3VdYIWELtCxQ/S
	 k+XB53PnA2SVEHhRTUS7U4pZc/6+NTJUkZY7CKASmPvQ9QpYCcufIcSzgpR7NWVkSi
	 jp9XGx5f+pZpXKidRSPAs6K+jdBokudQq0L+JSHKIQsakl6rBCtx53/+fKmRYU7AE5
	 FMyFc2btLCA2xVryygJW3jkoBWIeiRMncRcBrhZrVRERgO/U1xU0HV1QVl4Lxov6FV
	 dzjxYmwhLLY/zdK180LgDdUc1uFpRhZ4yyM60sjdxOlRcDnYbBAtClKHQaXm10ebIj
	 AcsRl3MiOJs+A==
Date: Fri, 22 Aug 2025 10:52:57 -0500
From: Rob Herring <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com, broonie@kernel.org,
	chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org,
	davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
	flora.fu@mediatek.com, houlong.wei@mediatek.com, jeesw@melfas.com,
	jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org,
	kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
	lgirdwood@gmail.com, linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com,
	matthias.bgg@gmail.com, mchehab@kernel.org,
	minghsiu.tsai@mediatek.com, mripard@kernel.org,
	p.zabel@pengutronix.de, pabeni@redhat.com, sean.wang@kernel.org,
	simona@ffwll.ch, support.opensource@diasemi.com,
	tiffany.lin@mediatek.com, tzimmermann@suse.de,
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v1 13/14] dt-bindings: input/touchscreen: Convert MELFAS
 MIP4 Touchscreen to YAML
Message-ID: <20250822155257.GA3865729-robh@kernel.org>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-14-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-14-ariel.dalessandro@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_085300_204574_D47C7E06 
X-CRM114-Status: GOOD (  13.51  )
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

On Wed, Aug 20, 2025 at 02:13:01PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for MELFAS MIP4 Touchscreen
> controller to a YAML schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../input/touchscreen/melfas,mip4_ts.yaml     | 55 +++++++++++++++++++
>  .../input/touchscreen/melfas_mip4.txt         | 20 -------
>  2 files changed, 55 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
> new file mode 100644
> index 0000000000000..170fd4212467e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/melfas,mip4_ts.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MELFAS MIP4 Touchscreen
> +
> +maintainers:
> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> +
> +properties:
> +  compatible:
> +    const: "melfas,mip4_ts"

Drop quotes. With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

