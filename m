Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF27BC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 10:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=id0cMj2KAebMuH6gkinUodtE/Di6TDiK55rKHLM11Cw=; b=3vvU7Q3LPz21axP8Y3YRrbsGWM
	pQ5xvpmjH38YLpav1clYSG+a12nxjlnki62LUKHEjqXx2K6c4yNVOuktpnXhbz/2zb/LU1aY48iap
	qJsr/zJ4D/wzpeAPVbX4IZ2h7JZ8nUBl/NhBYnxJoihpDJqQY9sVu4g9oDnZfOz4FFwkR1TwCROpq
	Gy2skzSkh1HogBKWkuJfwAZt5qxtz41qe1io9NDV6xKUoovTZX1N3BksnpzM+OE9GH6SfB0d9P9y0
	ONyroz53oEU6oTZstB/Hr/TGvqOigBEXtFrl2vg4bbzjUy1fZQxzDYf13ljHEifhd9Pl4DdY8x5Z3
	6JixZLSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXH4r-0000000Ay6N-0kyf;
	Thu, 03 Jul 2025 10:22:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXH2T-0000000Axol-46W2;
	Thu, 03 Jul 2025 10:19:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B19DEA52ECD;
	Thu,  3 Jul 2025 10:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C5F3C4CEE3;
	Thu,  3 Jul 2025 10:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751537972;
	bh=6r+LqpL6KA2efSJCVmUCNNxEdOtaWMQouGC4z+YYw4E=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YNFLo32UcazxUvoPjazKAKec3zRIhjcZjy9aZW5xIpR7iyYaXGfJEgFQ4qSKLj9s7
	 Hh33md7sT92kyDqWEutMGiywsTixGcMRLcYIshnSFZ+6pdD/FT2+y5mJQIziwtEVCL
	 ztnxPL+RQza6KXSwqUCAyEDm5djhFVYJS9Fsv3wXIRkzE/vC/pkDnApbju1QnsHXyv
	 VWDIVzggWvxBRs7JfRi/aV0SSfbWbjujR0kYoFv+N5rgQBu+ypzm51e4xjfVqte15f
	 xH6pBYioIQQGFtNQfjnCtLy+x51KBUezJ6vrnUOwZHT+XAiNhbm9aczLaLqfohTfNM
	 UD32VD/x8dD4w==
Date: Thu, 03 Jul 2025 05:19:31 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 linux-kernel@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Jaroslav Kysela <perex@perex.cz>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, sound-open-firmware@alsa-project.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: "hailong.fan" <hailong.fan@mediatek.com>
In-Reply-To: <20250703075632.20758-2-hailong.fan@mediatek.com>
References: <20250703075632.20758-1-hailong.fan@mediatek.com>
 <20250703075632.20758-2-hailong.fan@mediatek.com>
Message-Id: <175153797140.484478.11959606684592113866.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: dsp: mediatek: add mt8196 dsp
 document
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_031934_154785_4E243982 
X-CRM114-Status: GOOD (  13.68  )
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


On Thu, 03 Jul 2025 15:56:23 +0800, hailong.fan wrote:
> From: Hailong Fan <hailong.fan@mediatek.com>
> 
> This patch adds mt8196 dsp document. The dsp is used for Sound Open
> Firmware driver node. It includes registers,  clocks, memory regions,
> and mailbox for dsp.
> 
> Signed-off-by: Hailong Fan <hailong.fan@mediatek.com>
> ---
>  .../bindings/sound/mediatek,mt8196-dsp.yaml   | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-dsp.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/mediatek,mt8196-dsp.example.dts:18:18: fatal error: dt-bindings/clock/mt8196-clk.h: No such file or directory
   18 |         #include <dt-bindings/clock/mt8196-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/sound/mediatek,mt8196-dsp.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1525: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250703075632.20758-2-hailong.fan@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


