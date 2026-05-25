Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2666CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 11:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzBDFr43Boq9Lj7lrwvex2le7up+8Wg9eGEwYQ+PjtU=; b=3E3QHlFAWkrQ+0WUNKDJp1V5DG
	cqIcht862Jryo83qLD4Xc/+XUJsK/junOSffSG76HNIF3QmMzrcvo3p6Eh0qOiv+gd8zreoJ2CGGV
	R6j0Iqex77UdC2EGCn4MfLt11geGnoWHuNgrSp/F4sgeijrpzdwXH0TZJ5hnl3GmrXd6NN/zHTwmh
	MSieAlfW1EGEEEi5aX5VKLAFAHKLD8vYMzTQWZBTrajwwW4RqiHzgiliBC/UN7K/tZMVU/Snrwg8N
	Dted2Ar9BKtN1M17/7e8zL4pZG+2j5b7/28GsYoQW2eFJED24acWCoEowFQlDDCywHqp/q/aTTowY
	SzpaJTtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTFm-0000000H3KV-2fCL;
	Mon, 25 May 2026 11:13:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTFk-0000000H3JC-2YBr;
	Mon, 25 May 2026 11:13:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EDCC43B7E;
	Mon, 25 May 2026 11:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB331F00A3A;
	Mon, 25 May 2026 11:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779707628;
	bh=gzBDFr43Boq9Lj7lrwvex2le7up+8Wg9eGEwYQ+PjtU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=DOzzvhQSiS34iWE7nXECeeQpcxWWsGg/C9aX/BghWrz+rvSMthodByxXcIe2gTPn1
	 frRj9aAbz9cFPG+jTgToU6avpbHx5CJrJf2YC6R4DMwn28O+lXO3eAucd2tyFiPTae
	 zMAQZxXfUzM1gt4rvwfBKhgk5zcbHC9vxFX/eL3Kx0MSplvx+mOvzndibbwCnWYr8m
	 81deYGQtF89WAPPHMTAzCz2VrFYfom70TOUbauHvXMQR4Kjq2uXrt4Zid/Cat4knP/
	 /NTqdujID3PpecLSePgSx/DyFTN66aS601brDxoDcIYE0JaGgrv8e7wU0rC3WeEBAh
	 Bnix/jWsap93w==
Date: Mon, 25 May 2026 06:13:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: mripard@kernel.org, luca.ceresoli@bootlin.com, tzimmermann@suse.de, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 krzk+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com, conor+dt@kernel.org, 
 cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com, 
 rfoss@kernel.org, sebastian.reichel@collabora.com, 
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 andy.yan@rock-chips.com, andrzej.hajda@intel.com, jernej.skrabec@gmail.com, 
 simona@ffwll.ch, devicetree@vger.kernel.org, 
 nicolas.frattaroli@collabora.com, m.szyprowski@samsung.com, 
 Conor Dooley <conor.dooley@microchip.com>, hjc@rock-chips.com, 
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, jonas@kwiboo.se, 
 dianders@chromium.org, heiko@sntech.de, neil.armstrong@linaro.org
To: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260525082033.117569-7-damon.ding@rock-chips.com>
References: <20260525082033.117569-1-damon.ding@rock-chips.com>
 <20260525082033.117569-7-damon.ding@rock-chips.com>
Message-Id: <177970762670.3598384.1698792096821270137.robh@kernel.org>
Subject: Re: [PATCH v7 06/10] dt-bindings: display: rockchip: analogix-dp:
 Add support for RK3576
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_041348_663558_E1CD7533 
X-CRM114-Status: GOOD (  12.37  )
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


On Mon, 25 May 2026 16:20:29 +0800, Damon Ding wrote:
> RK3576 integrates an eDP TX controller compatible with the existing
> RK3588 hardware design, reuse the same binding configuration directly.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - Split out a separate patch to add the "hclk" clock reference.
> 
> Chanegs in v4:
> - Modify the commit msg.
> 
> Changes in v5:
> - Add Acked-by tag.
> ---
>  .../bindings/display/rockchip/rockchip,analogix-dp.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml:34:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260525082033.117569-7-damon.ding@rock-chips.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


