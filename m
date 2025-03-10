Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD553C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 07:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7vhF/MHHG+mQLjB+vizFD4onJvbVlNmDuMPtGwihfc=; b=Iqjp0sUKe29z54jQr5LbrfUx+B
	6iosKZ0yKVYtJoa3NDmIW3PXZczSkPJkxkY3S5HlUl7UpR8f0e1eek6uXSeEOoNIcR8xiVIos+IwM
	S0RDuAVAQxbikT8tWBI9EjT4FG/XHKmb6pIFr6X/mtwzBj3lBvUyqflqMosWyrFB+T17+75fE7M52
	9xYzTMDHTNua10/qvdcQd794N+K0w6QuWcpzeIKJ0rcAf5H7MH1Bzi9732esljB1HwsJUtSlMv1cl
	6NfqhkQQkVilGOS1aB1XVbyXynYzCGKIdfBuSeFRzHNi/9PnkXJSns85gywd+NYoqguykKM91Apmp
	y0j/cLWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trXW8-00000001kGB-36hx;
	Mon, 10 Mar 2025 07:25:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trXTM-00000001jjw-1bYG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 07:22:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 13D9C5C5446;
	Mon, 10 Mar 2025 07:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D291C4CEEC;
	Mon, 10 Mar 2025 07:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741591367;
	bh=Od8L1z8gpGuI01Q46FCrk/dgTluhyNxz/YRj8wTeP4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RUc4q3GdNN+6ts/tAqY680p2XE7YKchNwjX3K8gVj7z0To82usUJf6QbgxHL16oTC
	 2uNsjiDTH9d/fy9Y431E8JtXL7h9i6Wup3Sp/zrYSul273raYEowyy1X4U+j7CmvL4
	 aVDTcmOU5yOBBVZaAzKmznQJpkzM67qmY+IWu279KU2ckDT7DGKrGvQrFOi3izceGK
	 dZFdyod48PZ+tN34na43hFAzeZkl3xXbMorWV2Hhag67SCnA44FotBRDf2o5qIEQNh
	 BXSFoFpqDyBaI0hOkYW5zqM1NeC5trbydPMJ1Et0Jn7DuvIap30ME0gn0XHKhlmHkD
	 UVhlOCV7C1xtw==
Date: Mon, 10 Mar 2025 08:22:43 +0100
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
Subject: Re: [PATCH 02/10] dt-bindings: display/msm: dsi-controller-main:
 describe SAR2130P
Message-ID: <20250310-wise-jumping-moose-b45f1b@krzk-bin>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-2-1d4c30f43822@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250308-sar2130p-display-v1-2-1d4c30f43822@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_002248_459942_AB543EE9 
X-CRM114-Status: UNSURE (   9.54  )
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

On Sat, Mar 08, 2025 at 03:42:20AM +0200, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Describe MIPI DSI controller present on Qualcomm SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


