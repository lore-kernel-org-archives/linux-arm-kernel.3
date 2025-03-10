Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EEFC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 07:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IcFhcrWuyXYGJxG0IC7v05TtJ2VIjJL7/1Xk2TfgH6U=; b=c5UiWdB2sTu6B6gJsPoKKffFBG
	aCFEuCfZP1oQWS6DApy8NpoEOYMS55bL2WFG4NTbpXDFDbrih1jHI3QWZZYdETS7PgLbx0Ci5by65
	hDwLYUX+I2FJTsq/SYN6riV65F7J0dP2fqZQaY9lqEWAlE6VWhy6O9GqiAj7xlVu0Ywv/fmRSppQF
	msZhLz7fpVpkH8tlL0lhLekrRIYA4jTU0OeSUhNh4r7o/uiqqyswFDntEcc4dmnawPX5c47NbEOpv
	KPXjOS61elhcEOvGkxwYKtfUb4SmX9Gdr38B3d/Gfe3eM4IlSQAFVoqOIzXm/wiLqYi0K7JyjMwFR
	wl0dGWOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trXm8-00000001mkY-1ADg;
	Mon, 10 Mar 2025 07:42:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trXkT-00000001mRM-0Egf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 07:40:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 18BBDA40429;
	Mon, 10 Mar 2025 07:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23303C4CEE5;
	Mon, 10 Mar 2025 07:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741592428;
	bh=A1+vd1+iI7U2juLRNkQfIRGQ+caFncDP5Th5PCoA3dA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MLLZEVEGzufs0VlS6qieY+pMhoUDMxcouSNcWPOVrGjQx1+BmVdccK1B31g4zgat+
	 S9t+CMks5K+WhoLTpoMllIS9jxMDecewNqkeTry3J7MakMz75SFX8FcMghXi9kWwe2
	 zasatPj38fuVJw5Y0DyKT93QDXjrJAsokH92ZYbWZKtJDWadI05auP+gsW0ntdETMp
	 tUbEVpawx/nm2mYD23HNeUigHTu5sAsLfltu4Z5t2rYDgYfXK/RNWoDfOPB/E8pCx7
	 lqUncZbsrTer3uvAWWEbtP0sXsfjpqQJ/RIejBYs++63rs2P/+NPR6I/rg9lTWSI8Y
	 QJC0gyvxVCyHQ==
Date: Mon, 10 Mar 2025 08:40:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	Bjorn Andersson <andersson@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/10] dt-bindings: display/msm: Add Qualcomm SAR2130P
Message-ID: <20250310-impressive-cherry-bullfrog-cbd8fd@krzk-bin>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-5-1d4c30f43822@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250308-sar2130p-display-v1-5-1d4c30f43822@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_004029_319161_6971A15C 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
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

On Sat, Mar 08, 2025 at 03:42:23AM +0200, Dmitry Baryshkov wrote:
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +

Drop blank line

> +    properties:
> +      compatible:
> +        const: qcom,sar2130p-dpu
> +
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +

Drop blank line

> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sar2130p-dp
> +          - const: qcom,sm8350-dp
> +
> +  "^dsi@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +

Drop blank line

> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sar2130p-dsi-ctrl
> +          - const: qcom,mdss-dsi-ctrl

Drop last compatible here and use contains (see v3 of my sm8750)

> +
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +

Drop blank line

> +    properties:
> +      compatible:
> +        const: qcom,sar2130p-dsi-phy-5nm
> +
> +required:
> +  - compatible

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


