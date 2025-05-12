Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C5AC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 23:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WqKhY1RojEvRb14HYurQbKAHljhMzz4IMUcpGdu0eJY=; b=l0PAdWJ/aeucCIw+DPQFYaYiT4
	bRiFkZerG8IxBUe7QlhJWOonSs2NwDzXhs1AaWZl8aC6njOqWVA0EtGrm1AbZPMeEA/RTVmokkBxd
	3TMzuVXb3vs2O80AwyxOPWwNSDSRmtP7gpLvtv2LfvC0JIx0mrT0HPIH2GA6/ON08Klem1u3pC8Rq
	dMPgTCORS+FrPkNkXQaBMthxDWWXXpT4DNbGE6mtaPakzCnsOXp0F2AUoLODzejpmxat0nKewFEEG
	hvhGZ6N7qCqs6+0Q1p39OkU7zo5+cz5DB7kwH0PzDI0uw0MsSINTJ/0jRaY1qIK56Mbna3yEc7CSx
	3y3Jk0NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEcZ7-0000000Av2b-1KII;
	Mon, 12 May 2025 23:28:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEcX5-0000000Auvc-43Mu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 23:26:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7556F5C57C5;
	Mon, 12 May 2025 23:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD71C4CEE7;
	Mon, 12 May 2025 23:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747092360;
	bh=ocrZSi8DrO1EDikoZUP7oF3uAlxlKAV4CCYK0E7ESY8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=G/miODGVrcGeq496mvoRikgxy5uBNnOkysR4Bjkvdh99lpImJjlM0Q5BY/YOvD2eX
	 Tphg+iiW8oLW9MrYAirmoLLIf+pWgv0NN0Zk9AcXiXyDOzLVLNem6tdFThiaJGVPmN
	 15PcatmTdyI7Ze3ctlGjCRzcnYK33f2W6MXt7KXMSpKfzycAYk0STYuZkp3uKIuVUI
	 k+diB3b7yfILzHv2GmGN/ceT6plbGrTysUtzmgENfnumE3CYdoWsmKvoxqQfNfc46P
	 D1nIFgQTzLfQuUP5n0LDuCL/V7cexibccQXFb3mQqBCAeX6jGDDqlvTPgrFGHqhPOg
	 KR1Fk1UXvw5pQ==
Date: Mon, 12 May 2025 18:25:58 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, devicetree@vger.kernel.org, 
 Dongcheng Yan <dongcheng.yan@intel.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Ross Burton <ross.burton@arm.com>, Will Deacon <will@kernel.org>, 
 Eric Biggers <ebiggers@google.com>, 
 Julien Massot <julien.massot@collabora.com>, linux-media@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, 
 Taniya Das <quic_tdas@quicinc.com>, Mark Brown <broonie@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-staging@lists.linux.dev, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Zhi Mao <zhi.mao@mediatek.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Hans Verkuil <hverkuil@xs4all.nl>, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
In-Reply-To: <20250512212832.3674722-15-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-15-demonsingur@gmail.com>
Message-Id: <174709235870.686179.16618194990565341079.robh@kernel.org>
Subject: Re: [PATCH v3 14/19] dt-bindings: media: i2c: add MAX9296A,
 MAX96716A, MAX96792A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_162604_111910_BE823CF1 
X-CRM114-Status: GOOD (  13.61  )
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


On Tue, 13 May 2025 00:28:23 +0300, Cosmin Tanislav wrote:
> The MAX9296A deserializer converts single or dual serial inputs to MIPI
> CSI-2 outputs. The GMSL2 links operate at a fixed rate of 3Gbps or 6Gbps
> in the forward direction and 187.5Mbps in the reverse direction.
> In GMSL1 mode, each serial link can be paired with 3.12Gbps or 1.5Gbps
> GMSL1 serializers or operate up to 4.5Gbps with GMSL2 serializers with
> GMSL1 backward compatibility. The MAX9296A supports mixed GMSL2 and
> GMSL1 links. The serial inputs operate independently, allowing videos
> with different timings and resolutions to be received on each input.
> 
> MAX96716A supports both tunnel and pixel mode.
> MAX96792A supports both tunnel and pixel mode, and has two GMSL3 links.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max9296a.yaml    | 242 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 248 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.example.dtb: serializer@40 (maxim,max96717): compatible: 'oneOf' conditional failed, one must be fixed:
	['maxim,max96717'] is too short
	'maxim,max96717' is not one of ['maxim,max9295a', 'maxim,max96717f']
	from schema $id: http://devicetree.org/schemas/media/i2c/maxim,max96717.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.example.dtb: serializer@40 (maxim,max96717): compatible: 'oneOf' conditional failed, one must be fixed:
	['maxim,max96717'] is too short
	'maxim,max96717' is not one of ['maxim,max9295a', 'maxim,max96717f']
	from schema $id: http://devicetree.org/schemas/media/i2c/maxim,max96717.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250512212832.3674722-15-demonsingur@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


