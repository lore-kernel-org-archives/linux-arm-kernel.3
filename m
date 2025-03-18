Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFA2C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 07:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mbj3e7hz2+weX4F9BcSOKaI3E3hZD5px+IbELmcJYV8=; b=sx1XFDLp8hCpmc8S5wzESA3WRh
	I1MPDgC6V83p57go3kjsAht3XRn0PrdPRH3Opr2unuwlTEKdhvN/4uf+JLSewUYsZkgubrdk2gxnY
	01mn5/UhoAjjKtFdkk5byhvf+7WMozbjcTe5m8PprHWWUWHIY7/dHivNtsm+pKunUrADQeAS/RNEn
	+9HnLfgXqbzaZUWItZu44nKI5qE6qHYeiQQmzZ+anakrI3D/OwIlDCdUbykwrdA1xlOoW2goKRns+
	aZvvbKZloHNs3QCTsFwfKfBqX6mJVZAB7WOxP7bi8U4feBAeubz0iZZEulHSL87qsK+eiD2XrayQV
	dwp4qSvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRoh-000000053Ub-2eW8;
	Tue, 18 Mar 2025 07:56:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRn0-0000000539s-2c35
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 07:55:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1D134A476B3;
	Tue, 18 Mar 2025 07:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA15C4CEDD;
	Tue, 18 Mar 2025 07:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742284505;
	bh=D4iMGhhuzept8ULjmWzbTssS4mIzRCuc7D7FjZeefVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ay0EVHEdmwjg6EwY1oj4Rnz6tLXQXjlk5J28ENJcy0uroi2w7MMralceARzOD+9ie
	 xELU4DOwu2ExqI/2U4vXcsaQgBiSjKxOetS2X8o7V2f49Smx23WhjQb+YzgYGBjgy1
	 G7DmhvM+EbYb9NlLn2DKMozCCHkUsShuszHZ15i+RZGXVlkoZ6MuFIKRmoj8jMPxna
	 7MPHOFk4r60Y6S5GQpYLWlx4fQ7JzD7+bGbh39ICLYM7WcEpr0diy2sXCgI7Yjx57A
	 XMUnbEHzl+84wc92pB0fltjf93E/buBI+6AxyJ+YqrUWg4KMkDmrq9V1HfJMhlZDbz
	 amry7CiVquiIg==
Date: Tue, 18 Mar 2025 08:55:01 +0100
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
Subject: Re: [PATCH 1/9] dt-bindings: soc: qcom,rpm: add missing
 clock-controller node
Message-ID: <20250318-hungry-nimble-marten-dfb4db@krzk-bin>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-1-655c52e2ad97@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250317-fix-nexus-4-v1-1-655c52e2ad97@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_005506_721232_BE81ADF6 
X-CRM114-Status: GOOD (  11.61  )
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

On Mon, Mar 17, 2025 at 07:44:36PM +0200, Dmitry Baryshkov wrote:
> On Qualcomm platforms in addition to regulators the RPM also provides
> clocks via the child clock-controller node. Describe it properly in the
> schema.
> 
> Fixes: 6b42133d2189 ("dt-bindings: soc: qcom: convert non-smd RPM bindings to dt-schema")

Fixes should rather point to original binding, because the conversion
did not miss them. They were not there in the first place. Coversion
should add them, to match existing DTS, but still the mistake is in the
TXT binding.


> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


