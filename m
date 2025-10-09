Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F260CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 19:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCubkgD1fN8e/Xm2IYVJwTVp2B0TpWZTmd8E0QeA+KQ=; b=rD/NI6BkyQky4VTHpfTPBtqddv
	NEZ4+U4tUJQMNWxHbLHsF7Q2aY2g9DrdQHwsh2cjKuJvf+c/vVtgWESbi3ENQyA8aYGTWDFToVBVL
	YfccVqchnzycMEDccSdr6IdpEFZLv0hWD3mJs4UorSaIw42wmHzLFle+pfWhnjbPh8hHKV0V0smUa
	uREwzUFKpr1ch3Qzsw7k2V8Xur6CIoH91tjcJsukA540S9O+QaEeN7D38EA4Brr6Kl/mkqeXd0V3u
	acaDcMcWkoXS9Oxwq3XtSL7qV43cSyOMxW9ZhXdKi0RpRJT7ziwgDL3M784aqA2svri+UfDf6SglC
	gDVH1Vyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6wGj-000000070Ei-1s8r;
	Thu, 09 Oct 2025 19:25:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6wGg-000000070Du-1QQw;
	Thu, 09 Oct 2025 19:25:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A61AC44D51;
	Thu,  9 Oct 2025 19:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405B5C4CEE7;
	Thu,  9 Oct 2025 19:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760037937;
	bh=ZleYVLbg1TqX6cXrbg8yQvDdGj6LBQ3wULzm7dwdO6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N5UXUgWM7C5XGdo1qWqAPTsCK9nnFVgTTrpj8r6TNc2SibypxPp2RmL6ltpQew+Xz
	 FAUVZDAysSwbBqBx3NAJWldPACkKw13KYYfuEXDmLX0betBRXRQ6RU5L0Qx3IsVEHv
	 dqxyIiAlIXTXaBwGWDSjo1yvX7MncGZF9UWqG5RP32s2xstqvNk34xxc+6V+qgyEtf
	 bLE0O4SK5XtWy3XOoEW8MOp+/C1JJcmQVf2+M+HogTO/Ws9iEvTMCPh5lXdpNODYi8
	 TihPh6SrK1+80/r4vD3XWG0bnp/MvyrUC0eFGl6lKt8Wq2L/s4eIQTihQmLN1s3gC5
	 DIXYyXlb9tMoQ==
Date: Thu, 9 Oct 2025 14:25:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Airlie <airlied@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>, Kees Cook <kees@kernel.org>,
	Chia-I Wu <olvaffe@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
	linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-hardening@vger.kernel.org, kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Maxime Ripard <mripard@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v6 1/7] dt-bindings: gpu: mali-valhall-csf: add
 mediatek,mt8196-mali variant
Message-ID: <176003793576.3141336.11200895939203051819.robh@kernel.org>
References: <20251003-mt8196-gpufreq-v6-0-76498ad61d9e@collabora.com>
 <20251003-mt8196-gpufreq-v6-1-76498ad61d9e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003-mt8196-gpufreq-v6-1-76498ad61d9e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_122538_400649_C35334ED 
X-CRM114-Status: GOOD (  13.62  )
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


On Fri, 03 Oct 2025 22:15:03 +0200, Nicolas Frattaroli wrote:
> The Mali-based GPU on the MediaTek MT8196 SoC uses a separate MCU to
> control the power and frequency of the GPU. This is modelled as a power
> domain and clock provider.
> 
> It lets us omit the OPP tables from the device tree, as those can now be
> enumerated at runtime from the MCU.
> 
> Add the necessary schema logic to handle what this SoC expects in terms
> of clocks and power-domains.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../bindings/gpu/arm,mali-valhall-csf.yaml         | 40 ++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


