Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD288C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 07:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ujJuYIkzvSM/zCENEqyTlicDTrrxDHY2YWYmb4rTX4=; b=mlQhXKdjDIncsSent1tmInDuke
	rvshdohu0SWy3OWFeMRyJcefJbmHQwm9K1p1fAJNuoJiiLuqbcuilWl0u5VShNhZhXWBxjYWdK0G7
	aV58wX4sYo9i5a801xNRyI4CfbAHGoTk5GNbag9GK22fc91gJlJossviMO17lkK4AepiFQGtYVFFy
	teuEurZ3BDpalYPBtzgF1+g2LXqFBO7ZAgLIPxLPxbvtRe6xX3c55rnzCqObXhlVHSbRouK70uBSc
	1KaL7L0ySMYZyi+42h4+93h6rGvolAZCV1x9RNRXigwILy5Nguoe2yc90pIWdfY0BW9h408X12yOM
	B5pDlTyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trXUX-00000001k0a-0Cp5;
	Mon, 10 Mar 2025 07:24:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trXSs-00000001jdp-39dh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 07:22:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9BF0DA44C92;
	Mon, 10 Mar 2025 07:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739DEC4CEE5;
	Mon, 10 Mar 2025 07:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741591337;
	bh=n5EJYANlraVMEy+z1CBmSc7C+ttH7vkN8CorsyFAuIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SGWqhLCyHfViKVUDQ0jzJVcUDm1jsoJM5JnDqfJcZojKRbq7vNU+vCgInlkqWwyIO
	 gRoT7KuGYicBeb9fB7YOiZcrL1ksNwYXxjq4mVly2MhjuFkQYHamsY6eZ1/Tsw+RGI
	 tz28itcBfaVrsBedxosouyOT5zCcHb1Dsx6hh1Eoprrbz9HknvikhcQo0EKq9lx6dz
	 HSM969yK4eZT4TZG8Can+YSyIijegAX++6/y+hFi1G/2xY+Yh25LLE4G7bW7b2ajyE
	 aD9WlibTu1ig4095nGNzz7t2iZB1KU+2FCMlqC8dWOXlY7BX+r9bG/jNJuDDRRzMrT
	 +4iLxrs2cfxeg==
Date: Mon, 10 Mar 2025 08:22:13 +0100
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
Subject: Re: [PATCH 01/10] dt-bindings: display/msm: dp-controller: describe
 SAR2130P
Message-ID: <20250310-adamant-wildcat-of-order-8efdda@krzk-bin>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-1-1d4c30f43822@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250308-sar2130p-display-v1-1-1d4c30f43822@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_002218_919468_5F10F5ED 
X-CRM114-Status: UNSURE (   9.71  )
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

On Sat, Mar 08, 2025 at 03:42:19AM +0200, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Describe DisplayPort controller present on Qualcomm SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


