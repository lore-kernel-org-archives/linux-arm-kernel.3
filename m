Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2225C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 15:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfcYRpGvDEB9ZovoNTinTJJIgrjgrPaz6h+TFRWZUrQ=; b=yTXd1f4faqmAiU3RpPDgN5aw3/
	fGlI4lj4noQVVCqvGMxf3jTSpDo86iUuqPWuNAW/UWspFTnwovqbg05WJAbXnis3LeBJvKvd/3sWa
	T6stEyax7vn6At9G6xyjXjYMyiDbjBnEQSPW6ui88w7w5Jj3E2d4zDgel6hrKB7yQM2XgGBbSP+SU
	Zz3QQpiie3JOtK126kK0Ypgt05GY9AocBP33khp2eInbP9CDOu1c4l3lgj+Fr4eCKRf8tQ7Tsu8zG
	kTkDLd2P3NWC8FFy+zwTpcqh9WaPCDHWaU2nHS/9Rdsoc1r5btfSnyXxBE8/sfaSSA/ukAsShETVm
	/qCAPq+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIU5t-00000004DJK-0v4x;
	Fri, 23 May 2025 15:13:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITmK-000000049ka-1B4f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 14:53:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF8E244D86;
	Fri, 23 May 2025 14:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A3BC4CEE9;
	Fri, 23 May 2025 14:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748012023;
	bh=HATUZF0Vtlf1O5ShWubkaMv3AMrVKKLUmHPj4Bew+YM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=B1jl85x+fOg7LMml+TAJp9nfOKpG1bu0U0dQoYXlp9Sy77lk5VSIlae2qeu7Z56gW
	 oqxSBbz07sVPkgtnDEtT48/mbX8O0fKjDREOw9IaLRlLxKZMnEW/+1Um9Zh784b/r1
	 TWdFI7bMFu0GqpuLKncTSTU5RpawE5nMr/NAHTzT2TvnafVz1rIMhX0YtMI8ZubhSp
	 tZIA9fs82dTxlTJSG9Dt/Q4/2swXFguua3YdPkbkJXOZ/G0Cl3ZeBxvGMqPCLAduyN
	 mGYiLpV1PM57GQBql5LnDqVn0iqcTrmZ0DJGl2Bsh4nv9ZooLAoS47nk6mzU22E2Gt
	 aH1t9g2eBS2Vg==
Date: Fri, 23 May 2025 09:53:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Hans Verkuil <hverkuil@xs4all.nl>, 
 Gaosheng Cui <cuigaosheng1@huawei.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, 
 Junhao Xie <bigfoot@classfun.cn>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Heiko Stuebner <heiko@sntech.de>, Ricardo Ribalda <ribalda@chromium.org>, 
 Kever Yang <kever.yang@rock-chips.com>, Michal Simek <michal.simek@amd.com>, 
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, linux-media@vger.kernel.org, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Michael Tretter <m.tretter@pengutronix.de>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
In-Reply-To: <20250523134207.68481-3-yassine.ouaissa@allegrodvt.com>
References: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
 <20250523134207.68481-3-yassine.ouaissa@allegrodvt.com>
Message-Id: <174801202204.1815416.4328234127791627696.robh@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: media: allegro-dvt: add decoder
 dt-bindings for Gen3 IP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_075344_356396_0446A29C 
X-CRM114-Status: GOOD (  11.76  )
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


On Fri, 23 May 2025 15:41:47 +0200, Yassine Ouaissa wrote:
> Add compatible for video decoder on allegrodvt Gen 3 IP.
> 
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> ---
>  .../bindings/media/allegro,al300-vdec.yaml    | 75 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/media/allegrodvt,al300-vdec.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml

doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
MAINTAINERS: Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250523134207.68481-3-yassine.ouaissa@allegrodvt.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


