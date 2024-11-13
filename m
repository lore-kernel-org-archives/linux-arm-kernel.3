Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449C5D41D4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 13:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewcghCPRbL1QDa51lwOE5puy7P+MpEnKu4WitVC7Zmc=; b=qTX4bO+xXcvTw+kv9Znd51FUeX
	27BvzDJ9LdfwClR2kl8zJPb9zx+RaN4w6gHSDMJizPuZxw3124aKWhtQIf+npLZxu5bqpO3yCRrx3
	MA9ZpeXZfnn/UApVy+l4kTrz0Hm27Q67tC9TbMexb8nYndTt5dsYUACcW+AKPBOGZqwKeN9H6cy4i
	DgQpyCgIG/vYOkgaaaVACUVF7D21rP8vOl7rezY7mtAl0vrJkkOXqRMgyLQidV8C8G4oVnS0O1C5x
	GsUUF1OBGE4xrgLn1IvHPLzURqTD/6r0+7tugBFkUL5vshNG084g+GMfrYEyqAlJj+mvxDH3tQbmc
	axz5NSJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDYC-00000006wej-3T7b;
	Wed, 13 Nov 2024 13:36:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDTz-00000006vSE-28ZT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 13:32:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 93691A40873;
	Wed, 13 Nov 2024 13:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCE1C4CECD;
	Wed, 13 Nov 2024 13:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731504750;
	bh=gfCmgl3jagwHGldFjUB4K2gH4J6eJxXe8/I/qAemYJk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZJqt32ThN/8+imW4Kgw6RaW3o7K6lP9reDKy572Iu31gEfEj6vKcOiUy7grZrUrLV
	 4oBs8fS3SxU1SQ+2fzOLAygB+gwDSMU5s+kNXqO+5Dyi4GE0ZH+7Dd65HlNCwkHUMS
	 UJUml5PZhst1zmCxBZigJFzCJVlLCXEnqukzdPvRpR0hcrrIU78SWJIPeIFwsSt8hu
	 XyGPX7fYzyWSIL3eJ4brqSOtqTpPtGMC7+PZPxV3vdCK+WDTgwRigx0RartzZVT9fZ
	 t2XT8pFt1mMkHRHxP6fqE28qR4UvBY82U4ZazE/zOIT4jWBOP/GDRE00uSRJ80/ZxB
	 5MV5X6EP7fI3w==
Date: Wed, 13 Nov 2024 07:32:28 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-kernel@vger.kernel.org, 
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Li Liu <quic_lliu6@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Fange Zhang <quic_fangez@quicinc.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-3-2873eb6fb869@quicinc.com>
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-3-2873eb6fb869@quicinc.com>
Message-Id: <173150474841.4106927.5975815443901282337.robh@kernel.org>
Subject: Re: [PATCH v2 3/9] dt-bindings: display/msm: Add QCS615 MDSS & DPU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_053231_694210_83667C37 
X-CRM114-Status: GOOD (  12.21  )
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


On Wed, 13 Nov 2024 19:51:45 +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Document the MDSS and DPU hardware found on the Qualcomm QCS615 platform.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  .../bindings/display/msm/qcom,qcs615-dpu.yaml      | 118 ++++++++++
>  .../bindings/display/msm/qcom,qcs615-mdss.yaml     | 252 +++++++++++++++++++++
>  2 files changed, 370 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/qcom,qcs615-mdss.example.dts:24:18: fatal error: dt-bindings/clock/qcom,qcs615-dispcc.h: No such file or directory
   24 |         #include <dt-bindings/clock/qcom,qcs615-dispcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/display/msm/qcom,qcs615-mdss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241113-add-display-support-for-qcs615-platform-v2-3-2873eb6fb869@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


