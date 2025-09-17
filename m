Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCF7CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oC8JSEMej3kF4e/Mcw5qoRTo4gs8KiZjgmbDS5yCog=; b=bs/zx4hdBo3ebo78h6Ch+coahM
	wZcDbwjnPjvCy7BfXiM6G8YZFcz2FM18J0BJh5s+9e5tr+fjtNtcIc3TzWQTFnDTi+QWl59uptm5O
	B1FnyuybPUh36FbwOcSvvPfXtUh6rSMXNroRpnVCSk493cC+HIdb44s2uYlF0mRN5lXzr1aEsQBV1
	xLnt/8nMxlyC+J5+NAWA/eUT+UxbUyRsu9M8IkcNaCcoUKRFY7Y9Spmcv/zDnPP7ubA+6t4V6VZ2I
	AFuvudDlf3Fr34UzbL3t2yR7Ay3iiIt4NP39o9TmR7DvjLIQOFzo1Ojw/Yrf/PcB5BXditiIBZp4k
	pwXz/j1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytgD-0000000CWES-0t7z;
	Wed, 17 Sep 2025 15:02:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytgC-0000000CWDi-0dRc;
	Wed, 17 Sep 2025 15:02:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A49866023A;
	Wed, 17 Sep 2025 15:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DCF7C4CEF0;
	Wed, 17 Sep 2025 15:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758121361;
	bh=DkAob/mYPV+ZNAEqdno0NyXMgOtH4pnIcMp+zpKJAxo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=sPT4O+XvDEdrvk/c00OHoqwWJCwrh5WRxwW2tzfT6VyUHJdXBW/vpmYjndvYkUg9Q
	 4Jj9Bu94e75coQqY0ZAY3DnhFg5EnUERYbd+Vaw8+dHEgY/SaTmvfFtvCWDker95nM
	 s12OIAXMjopWutHC5B0Za8oNtIDlU7dyKOuKm5ZSCarfmgLIUyiIepAtgS0QXD3Ffc
	 zs+brP/jrIpbtZnJtf8IuRs5IGUWOWNxBhmesgdnr/BBP+LjJ2EYVPOO49nNr5QV6L
	 c2FZ4OI4wGqia7QEs/0k4oAvTRgJtumOc1CuOa9RiZ3b+U34Djc9Idi3hiLW4FfUxg
	 1kQS/hbO4N+tQ==
Date: Wed, 17 Sep 2025 10:02:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Kees Cook <kees@kernel.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, Conor Dooley <conor+dt@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-arm-kernel@lists.infradead.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Steven Price <steven.price@arm.com>, 
 David Airlie <airlied@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, kernel@collabora.com, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 linux-hardening@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
In-Reply-To: <20250917-mt8196-gpufreq-v3-1-c4ede4b4399e@collabora.com>
References: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
 <20250917-mt8196-gpufreq-v3-1-c4ede4b4399e@collabora.com>
Message-Id: <175812136009.2068624.13991293282844294346.robh@kernel.org>
Subject: Re: [PATCH v3 01/10] dt-bindings: gpu: mali-valhall-csf: add
 mediatek,mt8196-mali variant
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


On Wed, 17 Sep 2025 14:22:32 +0200, Nicolas Frattaroli wrote:
> The Mali-based GPU on the MediaTek MT8196 SoC uses a separate MCU to
> control the power and frequency of the GPU.
> 
> It lets us omit the OPP tables from the device tree, as those can now be
> enumerated at runtime from the MCU. It also means the mali GPU node
> described in this binding does not have any clocks in this case, as all
> clock control is delegated to the MCU.
> 
> Add the mediatek,mt8196-mali compatible, and a performance-domains
> property which points to the MCU's device tree node in this case. It's
> required on mt8196 devices.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../bindings/gpu/arm,mali-valhall-csf.yaml         | 32 ++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.example.dtb: gpu@48000000 (mediatek,mt8196-mali): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-valhall-csf.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250917-mt8196-gpufreq-v3-1-c4ede4b4399e@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


