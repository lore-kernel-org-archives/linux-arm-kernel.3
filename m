Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90329C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 19:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1WTao9NFteyfaYzewuSpHqVfQAMvgSzADPqoOBqbvc=; b=a/8wpa6lCw3cFiwkc47ebFqQ+M
	OL6A+ckKh1ONilZAL/A4LeDhqZigOzLQtN7NxWNkEQ1zCBLJRWxtYzG11d6W3Z0osr36fog11Xw3K
	cFTjdmgj3M1kHupm7v8F7IfBaYTiJraEUo6bGwb8cVIGhRljODVRYbMjb+KsWxSX6CNmeYLeQVBKi
	13pZ3qR/rX9YCF/jQLPaxvts0F1z8GaiJCbin0LuhFSEWMgYPY39boigxgLHl8Ha3L7HeYORV+PmQ
	S7XC8IkRHJFAliajGAKNuF3BU3UJQ323L23bANIwIbBYGyLvD3Rkq0M/S7IxUnuNIB0lPdkFo0dwm
	wlNzNvlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuGQ8-00000003qpY-1Y0l;
	Mon, 17 Mar 2025 19:46:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuGOD-00000003qUe-27y3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 19:44:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 051235C3CE2;
	Mon, 17 Mar 2025 19:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45DB4C4CEE3;
	Mon, 17 Mar 2025 19:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742240684;
	bh=OiQVuvTN1/XflXpR3RqcHCaJ640D1uHI1i9Ur7T7qKs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=LOa737wrjHepnbxep326FXIDSAcB2rL++PYLUj/AszMLNZHv7tdoRhUNrX9QZrleC
	 A0dKbD1XhZRR5Kv2Fi+eBXALlamDgHb3ExZfje4E09ZLXgLCzdM/CMLltD/YSV7Pql
	 e7ZJ5fJgFeVAZJVt/ZwuHnhroS4ZRwlm5COLLNnvU8vbZJXfoyHcuiETR0b9hB60XY
	 aFKci0gMNcgOLFIieuVYhfo08wg0yLhvo7tpxm4rMSU2JW1PuIIf5br0HavPhfuvHQ
	 PCMfyIH4pXJC7Kvc1Ss6nyRrHrpCcUm6EDHLoZdJDiFJf2sqKkQp++J2gbgdnaGf5p
	 pRfeDmX1+CpwQ==
Date: Mon, 17 Mar 2025 14:44:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Georgi Djakov <djakov@kernel.org>, James Clark <james.clark@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <andy.gross@linaro.org>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@linux.dev>, Andy Gross <agross@codeaurora.org>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Konrad Dybcio <konradybcio@kernel.org>, David Airlie <airlied@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 coresight@lists.linaro.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, 
 Mike Leach <mike.leach@linaro.org>, Maxime Ripard <mripard@kernel.org>, 
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Heidelberg <david@ixit.cz>, 
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>, 
 linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Kumar Gala <galak@codeaurora.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com>
Message-Id: <174224068328.474126.11922746474259386307.robh@kernel.org>
Subject: Re: [PATCH 4/9] dt-bindings: arm:
 qcom,coresight-static-replicator: add optional clocks
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_124445_663054_46B25B5F 
X-CRM114-Status: GOOD (  10.93  )
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


On Mon, 17 Mar 2025 19:44:39 +0200, Dmitry Baryshkov wrote:
> As most other CoreSight devices the replicator can use either of the
> optional clocks (or both). Document those optional clocks in the schema.
> 
> Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/arm/arm,coresight-static-replicator.yaml          | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml: properties:clock-names: 'enum' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


