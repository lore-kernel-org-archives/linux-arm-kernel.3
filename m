Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D17DC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 07:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/3zKs4B4lEZHGHC5DeTMH/TpCGt5tUx1v7xkQTlrW8=; b=0Vo9T7ns5qJVXEMy6zgRTw10We
	pWCJiyFssoVpA8zelpNzZr5B+Hr266RPW+qi7DnGelt44u5sqOuYWB2gYdqRda6AGzxhP5CUG9o2J
	as2N2Fw5+wXw6ToW38S9Fsk2eWsL7u71XdshFEQ9BKUi2ewWRE/inILA9+cs8kdX5HX9DNM1H59ax
	igg1qqY9+JzjkfiXpT0uUuXo1udbb8sIMxpew02t8wdE1loXLE3Oj23q8jHl5YqhXcJepsHl/FQ9v
	o/TrIyeUZXtU+XVTYHAW6FMxvqeaKmucCKqa6GLzaqgR3o1AihdlTk1fdidoo/vYIQ/kicgCqrXeq
	nOpYcelw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trXZO-00000001kij-2E6o;
	Mon, 10 Mar 2025 07:29:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trXTg-00000001joi-2eEy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 07:23:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AC3E8A44B92;
	Mon, 10 Mar 2025 07:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5290C4CEE5;
	Mon, 10 Mar 2025 07:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741591387;
	bh=RlvKs07iuCvZ/lpYdSqVxJ2vXNGKN73rfYEc3+gIKNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N7lcU/JZEenWdzfzzb0tr1SWG3ZkhI0EoTYO2icU/G0L0RaJ7ZHQqtPfGuzJai0HC
	 csLJE5UnThUxUaxF0bE34TVJL0ewvOMiRUrpS1LpzGlEk3REzTuKwya6g19OoTRiDS
	 Vz1PJKupNDxoNgTQCzwAKVx8ovdnCg/wWlA7ZN224R6D2I7duzgJkvJvSVrBYG2slZ
	 p3u6yjBN9ebkdY2O8lhGFXlyjDWThPCcrnH0pS9VPLA+fbrK6jIKHIgOnuOzbgwGMo
	 0+KIgoJJRn/t2TN1ijKgRSzdVchI1UrORXhbGhg6icw/pthPbr0kJBZ2/ft/GNI5QH
	 50MUxij1sgAHg==
Date: Mon, 10 Mar 2025 08:23:03 +0100
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
Subject: Re: [PATCH 03/10] dt-bindings: display/msm: dsi-phy-7nm: describe
 SAR2130P
Message-ID: <20250310-prompt-economic-gaur-ef0bbe@krzk-bin>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-3-1d4c30f43822@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250308-sar2130p-display-v1-3-1d4c30f43822@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_002308_728883_61C832DB 
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

On Sat, Mar 08, 2025 at 03:42:21AM +0200, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Describe MIPI DSI PHY present on Qualcomm SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


