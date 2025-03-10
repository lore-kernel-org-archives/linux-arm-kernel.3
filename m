Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB25C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 07:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7P8FXLCdEeNVKfaCUMP7QfhFDAw+ltVTkmiIYl3wAQ=; b=kkf7dTvjcHi7ZAjWeTrZEYdsi8
	ogsBB4mVWlgghosTJYNUs5XrtTu+wJSlHjRie8/baSo5CORPZ9YPWN075j7KMD891+QyGwTeCPFkG
	c/OJf2Z2RAjw3PbwYpSqdA20V7Lb/W+tclNBLbggVntPE7Qunt5k8IJ7ZTK+XiQGNNJ4V2yhsKcJX
	zTrslb4F5b2pug02Wwtrtipnkz9gVvsOxcoW2PEqPOtxv+CycWK5oWWp5IG0OM0jV3voSIDyvyrIQ
	8cmxRo3t+goFrA/L2ut2UQ2cpfT8MlG1W+E/ZbBAlwNpBCCAXvyzwhbnvygcmC0lmwzNs5jVTNxTq
	cTmdUxBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trXb0-00000001kwY-11j8;
	Mon, 10 Mar 2025 07:30:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trXTv-00000001jsI-33NT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 07:23:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 49AAD5C577D;
	Mon, 10 Mar 2025 07:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59CBC4CEE5;
	Mon, 10 Mar 2025 07:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741591402;
	bh=4ETkd0jFHLyp3RPMBWiubYsNSXRDodyaLu0wHY0y2XU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YMUUmsbKMTpJIOzlDQphAuc2kpcQCU4fCSZ4fQtG+R+LQNt6YwQciN23OZgf0/itk
	 ZHbKHvjGM45dX2MbZ32QNS/PwrHxj753MYl4pfeJmj8IG+zd21QH8uk7puO/mVUPw/
	 d3vK3nq1DDBM6gRdMG2xVvD9ZnXQ2Hak9xP/rHOpyf7ZZPCVq7Hqw+ydmVGdjM56Ul
	 ikLzRYbPfFZ8Iz2AeAtACS929d5fWzFnJTVmj1FqpnQbLhuoJ2I17qUPM4tIiCuM2Q
	 ncunR/tRH4scVhXHG1p1hO46Jw3YcZptVCK5qVxeL7nteF7lj966YbXe+ntvpAneqj
	 UWIIfKEDhKqqw==
Date: Mon, 10 Mar 2025 08:23:18 +0100
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
Subject: Re: [PATCH 04/10] dt-bindings: display/msm: qcom,sc7280-dpu:
 describe SAR2130P
Message-ID: <20250310-eccentric-rare-rook-e4fb60@krzk-bin>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-4-1d4c30f43822@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250308-sar2130p-display-v1-4-1d4c30f43822@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_002323_817780_BC7BBF34 
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

On Sat, Mar 08, 2025 at 03:42:22AM +0200, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Describe DPU controller present on Qualcomm SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


