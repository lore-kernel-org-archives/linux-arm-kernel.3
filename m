Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637B4C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 09:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vBWpgQqKwUlmQIuqHMYPCCLQj75FAd4GeZ2jp+pj0E=; b=HDuJnWk+w3bHaHVnRdh4UrtcjJ
	udTaLYGqyPMxwsI2UL/7IazVEXj6AyN1wnThLcHJAFutFfDvdW969I9vlgZXc6aQ09v+SCjVOMKjQ
	kSKtnAae8vbVKXoGMmM7N1Jf+ZNXCzDRkzf651mATcsalTP6yZj2+UmAOCKHG1P1X3/vCp6i4Ghms
	KM6kRkGW1s8N1JjtBr2uLVR9loZt+SJeUPyCL9ba2u4/2GkCWqVfbFf1M2krWi97zHRwcoWPOVqkn
	aQYRt+zKiX2hkr3+5uOHkDwr42Q4+/CKFkAuonP6sf5nIf/OWyNHq/lPZTvfMohPhyJ6uo0Bpgi28
	OmGWGt8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3Rp-0000000CIsS-2WUG;
	Wed, 30 Apr 2025 09:09:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3Pu-0000000CIaR-3Aar
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 09:07:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 835D96111C;
	Wed, 30 Apr 2025 09:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E02C4CEE9;
	Wed, 30 Apr 2025 09:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746004065;
	bh=JTFm4bna49JCkHZqj/tyafzK8uqLqlQp4ByNOAyKIx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AjjGTNbErxWGCzhEbbOuEOlUu5zqXJuNMw/05gI1660HBi1a31QLPK7BIJ8hxUO8o
	 ploriJYljhQqnr2B+QsvmcXgWlFEneGl4+NfEdHev/LWoNMVayw5YiQOAqKTAoY3dN
	 XteJ9zb30s8qSRBuaUbXHU54xyez0vni90ByktrS+Tm3ZLw4CGxe4yijNpP9IiZMF6
	 NAW62V1NU8VJ4a+Rii0DWNVcJisTp30uleC71K9kb0keYDEOthBLc+SztpC8Q/7kkm
	 wQQqQJv+l3UGh9GhjHxEFY/ITALVAayIM6STJUCyErKOK0qAV8iw6wUNVlEUmY4bqL
	 vEWHKXtmnF1xg==
Date: Wed, 30 Apr 2025 10:07:38 +0100
From: Lee Jones <lee@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 01/11] Revert "dt-bindings: mfd: syscon: Add
 qcom,apq8064-mmss-sfpb"
Message-ID: <20250430090738.GE1567507@google.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-1-da4e39e86d41@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250425-fix-nexus-4-v3-1-da4e39e86d41@oss.qualcomm.com>
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

On Fri, 25 Apr 2025, Dmitry Baryshkov wrote:

> For some reason Lee has mis-squashed two commits, picking up one chunk
> from the first patch and one chunk from the second one. Rather than
> trying to fix it, revert commit 2c8de7df7418 ("dt-bindings: mfd: syscon:
> Add qcom,apq8064-mmss-sfpb").

Ah yes.  Looks like I took patch 5 before patch 4, then fudged the
conflict resolution.  No need to submit a revert, I have removed the
patch.

> Fixes: 2c8de7df7418 ("dt-bindings: mfd: syscon: Add qcom,apq8064-mmss-sfpb")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 71741f06d2fddd2d4fb6b69c1cfd2d449ce73f64..c6bbb19c3e3e2245b4a823df06e7f361da311000 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -98,7 +98,6 @@ select:
>            - mstar,msc313-pmsleep
>            - nuvoton,ma35d1-sys
>            - nuvoton,wpcm450-shm
> -          - qcom,apq8064-mmss-sfpb
>            - rockchip,px30-qos
>            - rockchip,rk3036-qos
>            - rockchip,rk3066-qos
> @@ -202,7 +201,6 @@ properties:
>            - mstar,msc313-pmsleep
>            - nuvoton,ma35d1-sys
>            - nuvoton,wpcm450-shm
> -          - qcom,apq8064-sps-sic
>            - rockchip,px30-qos
>            - rockchip,rk3036-qos
>            - rockchip,rk3066-qos
> 
> -- 
> 2.39.5
> 

-- 
Lee Jones [李琼斯]

