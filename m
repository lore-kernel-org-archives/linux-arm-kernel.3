Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836F8C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 08:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jyAj1sMnFmpv7z/AYCkEXsUWaZpIiwdeycOR3SOgEQ=; b=b2Rw0GZlesA7VPnR4ezDafLo5n
	zEOv1Fe5hhZZ+cwOWVJCWpTkzAFJySHwRmRt0oUD8nBkUPngsJZuo2APbA/cRwK7sdXtcYTru8u2T
	OP3F08XcxzCs1KpVCnluaL1YaqxMJzAt1UjK8cDMB5SuZTCAyH2UrZHoCUXeMI/jI3OC1yC3ImmC5
	cgnT6uKOCgRN4ZRRefTem6QUUhbvo5rMpNbXYNM5z++urMgmsmAIgKRcUGs9TdvoksFuN6u+ZRVC4
	ZdPEYc903oxnXKxcIWatpO5rDtQVPAFP6GzTZ3J7DfQt0b2iY3o/c6y7iK0Q8XTKwadV+8bS1MTu6
	LfEwtpgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRtg-000000054gU-37Ig;
	Tue, 18 Mar 2025 08:02:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRnw-000000053Lr-1QsJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 07:56:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 85E055C5734;
	Tue, 18 Mar 2025 07:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21198C4CEDD;
	Tue, 18 Mar 2025 07:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742284563;
	bh=LtjsmPhSNisv7I5z84pcT0c3tUyrHI8gEhlKPZozsJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sr1P8L7sxm7dCokDBaNlASRuyiiwrimV8VPr8U/+wda6RR6MQ4kdCL44tBGs2L8FV
	 ESAmxY+3mx5DXMXWwTWE4gOaAC8xN4Lnjp49rXvl3zyVpPafGNV5ZcKHoDmQqNRXYc
	 DXqN5528GxdBI5rB1cZmg3c7gWpW/vi8HV/m0qK1vTwO0pRGCn+4Lgz3RKGH5CqeVe
	 WBS1TbqAmwYozArJWE+f0ZtGrrdTZkPXPkFDXe+/AKOqYn16LD08EXeRg0wYe+5DU7
	 BagVlaCmP5ntnHCx+NcBJBrQ8SZer/LT+M/xafox9ODbTLTjTje0kjwrHZT9MPxI2h
	 DtX4hHEtyxoSQ==
Date: Tue, 18 Mar 2025 08:55:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>, 
	Andy Gross <agross@codeaurora.org>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, 
	Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>, 
	David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/9] dt-bindings: display/msm: describe SFPB device
Message-ID: <20250318-adventurous-cherubic-coua-eecbbc@krzk-bin>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-2-655c52e2ad97@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250317-fix-nexus-4-v1-2-655c52e2ad97@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_005604_462636_A39DB9E9 
X-CRM114-Status: GOOD (  15.63  )
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

On Mon, Mar 17, 2025 at 07:44:37PM +0200, Dmitry Baryshkov wrote:
> Add DT schema for the MultiMedia SubSystem System FPB device, which
> provides several registers to control interface between multimedia
> devices (primarily display) and system busses.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sfpb.yaml | 39 ++++++++++++++++++++++

Filename: qcom,apq8064-mmss-sfpb.yaml

>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sfpb.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sfpb.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..7ca105c97edd2f305527c58ae89b9b0cf22d3c8c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sfpb.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sfpb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm MultiMedia SubSystem System FPB
> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> +  - Rob Clark <robdclark@gmail.com>
> +
> +description:
> +  The SFPB provides several registers controlling the multimedia attachment to
> +  the system busses.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,apq8064-mmss-sfpb
> +      - const: syscon

Why this cannot be part of standard syscon bindings file? Looks simple
enough.

Best regards,
Krzysztof


