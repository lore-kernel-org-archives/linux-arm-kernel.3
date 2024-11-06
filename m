Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3C6D44D75
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 14:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9oQe4sx0+FbwpEQfUmPJcKTYtwYF086+yq27qxHNIg=; b=FyX4+hQjODLkKX4crytnr+pFjq
	o+XRqKIYTkYCJ1Ojtt/5xyPi6C2TxuIJ3i0rmF8FNkrV2DvhWAUg4L5GqVnQyHPvxm4paK4XZp5fZ
	QkSSl49RZnAyVwIfqtISJ/tbWRo3/+5gPMO/VzCpH/M/CK8439fyeKqV5AldRQ6NlH2VNEq4ztEVK
	tbSqJEdPFnQ4jTsVEqodnmxELersujqk70koSgqVra7QAZqSvEcVoEiQHq8fzAZRam6sLnxtKm9Qn
	VroVfcTCwF++6FX053WM78t2xr5MBgf4Ui+bZi93Fr6k86A5XWFu78bj0TUHv43uUfYK5YkBucluf
	vyi1nB+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gfs-00000003XO5-2fRo;
	Wed, 06 Nov 2024 14:06:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gOl-00000003UF7-3rMH;
	Wed, 06 Nov 2024 13:48:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CF1FBA43CCF;
	Wed,  6 Nov 2024 13:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6D2C4CEC6;
	Wed,  6 Nov 2024 13:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730900918;
	bh=c7SeyIvl6VsGmWGuO3Eonlnsp4/I/OGjZxvHqsAte8I=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=CGYIZuVtUXzuISt/z0zmHlPQsDWE5HyiQz5h12xMLdAnFYwG42Ns6h8zs+1I+N+qw
	 MQGL9Vr2CauQIyD6K0vJ4Jei7Pl4qCv6Mp5Qs8XGjEwtw6wvrwLnAm1xnomWRDe8qi
	 LFq0B6uy5MSwkeK+soGsq9/05b3TExyxCh8ZqwhZy4DZCmYTHLGJbxnsLQ2woHOUDY
	 hNObXqbaxt9B4wZPSRUuqIoBHHa4hGfAoA5gplGmp3Mc1us/vx3LBOCXffVTviXO7E
	 J9AXkK7/r7GwFPJllSjgvIGqab1aHceMPBH5rIuG8LXF5FErRs/DW1qJVnASbHhJDM
	 MvnRaqy69kyYw==
Date: Wed, 06 Nov 2024 07:48:36 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: neil.armstrong@linaro.org, krzk+dt@kernel.org, jonas@kwiboo.se, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 andrzej.hajda@intel.com, linux-kernel@vger.kernel.org, 
 Laurent.pinchart@ideasonboard.com, conor+dt@kernel.org, 
 Heiko Stuebner <heiko.stuebner@cherry.de>, mripard@kernel.org, 
 rfoss@kernel.org, andy.yan@rock-chips.com, jernej.skrabec@gmail.com, 
 quentin.schulz@cherry.de, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, tzimmermann@suse.de, 
 maarten.lankhorst@linux.intel.com
In-Reply-To: <20241106123304.422854-3-heiko@sntech.de>
References: <20241106123304.422854-1-heiko@sntech.de>
 <20241106123304.422854-3-heiko@sntech.de>
Message-Id: <173090091636.3280912.9491997051985691570.robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: display: rockchip: Add schema for
 RK3588 DW DSI2 controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_054840_071904_DC628B7A 
X-CRM114-Status: GOOD (  11.81  )
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


On Wed, 06 Nov 2024 13:33:03 +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The Display Serial Interface 2 (DSI-2) is part of a group of communication
> protocols defined by the MIPI Alliance. The RK3588 implements this
> specification in its two MIPI DSI-2 Host Controllers that are based on a
> new Synopsis IP.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>  .../rockchip/rockchip,rk3588-mipi-dsi2.yaml   | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-mipi-dsi2.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241106123304.422854-3-heiko@sntech.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


