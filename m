Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2681C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 16:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yt7x/5rejb3XYnanbj6Fu7QWWQuxwcHQvNiFH3/VAA=; b=zr8h0yK88tugW9PoXWs+K1rx3B
	VtAjMWTAiUpKGXfPWS1ZH1oM31g0Rv8jRBmocL/R+H0Sfg0kUgiJiFiEe1fHno5D38dCMBStNCP7i
	4e0vZVjh4Wg/84wfBEtdeJVzqOlKQVGyIcJMSzNQ+2R9t1dp9AKCLVQdb+7CZTd1CYke2sSu00Xs8
	o73hZtXfNnAfw5tk7UvY5xWRAXKm4+VTctuEjb1p3spGb9lkhqFvteg+t2ipB9f/FMBKNoprlFBuq
	SEukm0SQDx/jZiUxqv/GVCUHgL1B2HTt+e2nUWX6fqKjoEcVD7BlzQUauvWfJi5k5O3PqEzxwN5pu
	VmbHMgbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9tW-00000007YRW-41gL;
	Sun, 11 May 2025 16:51:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9h1-00000007Whl-3Hv9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 16:38:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9BC31A4BE61;
	Sun, 11 May 2025 16:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171BFC4CEE4;
	Sun, 11 May 2025 16:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746981502;
	bh=hs5vd8LRGfzxohCkfiT0NgBKcp5M5vzIsAKBSBoXpLQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=iKj+Z7QHlhKB3tC5Zy0pppDZKsomMglPO8eSOMhdfZmNdk1ifDb4+svINF/4J2UC0
	 gwPfIOcRd65sFHTnRfoz6rvfmXlzfeaTe9tdeSV5Hbpb9uuilbn5u53QOzSba5Vv6r
	 kNzZy+KJm861N8LvwR4O4SI2CCopHm1FLlCjzlrXL/fkXriW7FKBlqMCWjkEXgbjDY
	 SJ6YWKvEHLOW3oVj2UnXZ06MKymeQ+Sv0zMtOMaa1BuwUqqB02FSKCykpJjXfUU5yd
	 YIf+Xx0A6X92HPqBVnQADUH0ddUl9wobZ6wysQ2+TvI6Wz4nlyWIYOVsr1kSnUM/6U
	 xKRbtaYcBAalw==
Date: Sun, 11 May 2025 11:38:20 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Junhao Xie <bigfoot@classfun.cn>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>, 
 linux-kernel@vger.kernel.org, Michael Tretter <m.tretter@pengutronix.de>, 
 Gaosheng Cui <cuigaosheng1@huawei.com>, 
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Kever Yang <kever.yang@rock-chips.com>, Michal Simek <michal.simek@amd.com>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
In-Reply-To: <20250511144752.504162-4-yassine.ouaissa@allegrodvt.com>
References: <20250511144752.504162-1-yassine.ouaissa@allegrodvt.com>
 <20250511144752.504162-4-yassine.ouaissa@allegrodvt.com>
Message-Id: <174698150049.490551.15288138396615870362.robh@kernel.org>
Subject: Re: [PATCH 3/3] media: allegro-dvt: Add DT-bindings for the Gen 3
 IP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_093823_957629_34D5437A 
X-CRM114-Status: GOOD (  12.62  )
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


On Sun, 11 May 2025 16:47:34 +0200, Yassine Ouaissa wrote:
> Add the device-tree bindings for the allegro-dvt Gen 3 IP decoders, and
> update the MAINTAINERS file.
> 
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> ---
>  .../bindings/media/allegrodvt,al300-vdec.yaml | 86 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml:52:3: [error] syntax error: could not find expected ':' (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml:52:3: could not find expected ':'
make[2]: *** Deleting file 'Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.example.dts'
Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml:52:3: could not find expected ':'
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1527: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250511144752.504162-4-yassine.ouaissa@allegrodvt.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


