Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14C8CAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 00:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hx0SKrTNVT1QCAH6743uNT0OtC5R2p3QXs2MLSgZc+s=; b=GLHrcxte/Agz/XoGy58GmP/XnK
	Bj2xEV3HEFWdoLyg/h5AKTORTdLNGUfzGUwFwwWOIyyYNIdbWZO5oAve62Kok5NvfBgbaAk05zE1p
	lH6thW2XqJmGASXuAVx5YuLnY3Cq6ha0e/cAApzr5uE03DtfAcIYV4gXcP1EPwy0ZC9wFhaDENK5V
	h+IDl4YaCWrQFwFZ0+CInWQmIlyV2oXp7dx2kG+MoBf+ZaPNJsxIQCuUjrB0FakCuVMNw8/3WJZP/
	PpvemJ9dfwRZWTmRK5CsUU5oNWTqeqd9RnRHotFva+oCQw9/BwCdiAADUBFMi2Q+TZwoHEew2Hx0y
	4g41xrKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2Ys-0000000FoRg-2ZW3;
	Thu, 18 Sep 2025 00:31:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2Yr-0000000FoRV-2OeD;
	Thu, 18 Sep 2025 00:31:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A2AEF6000A;
	Thu, 18 Sep 2025 00:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15C7C4CEE7;
	Thu, 18 Sep 2025 00:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758155504;
	bh=iIdI2nVYChT/3mg+w2hb4SPCTU6Zg+BJCAlX2qIxdvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=phoUyoSIsHrZEp6LjQPs6tpELvmBp1F/OF8DNkAF6mX+9iz49xnhMFKH5GIIJByin
	 DfDEQ9zCNVpDYz1bW7XCUm2Ew9AOpex6Qf4xkJOApkRA44A0RHRc8QQkrJOB4rY5Q9
	 2jI1XAaM7aMZs974De+dE42iEnmQTXzH+B+qheaE5/U55esheQbE0WFdm6mUv0VMw5
	 L7L4CqmJFo3QUojPzCXh6BUfGWwZZzyLRU7PIKA1+8CntOCQEOTwXHQobP9RHHiy/n
	 RYS4psHc6q+7Vkb/Zwhsk96jKWhpHVOJi0Z0yHg2DG17I3xLX46KIa3byYRA4M7z3D
	 tDIAdFUVDiROg==
Date: Thu, 18 Sep 2025 09:31:42 +0900
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	kernel@collabora.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 02/10] dt-bindings: devfreq: add mt8196-gpufreq binding
Message-ID: <20250918-silent-dragon-of-gaiety-fdbfe3@kuoka>
References: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
 <20250917-mt8196-gpufreq-v3-2-c4ede4b4399e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250917-mt8196-gpufreq-v3-2-c4ede4b4399e@collabora.com>
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

On Wed, Sep 17, 2025 at 02:22:33PM +0200, Nicolas Frattaroli wrote:
 +
> +  shmem:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the shared memory region of the GPUEB MCU
> +
> +  "#performance-domain-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - mboxes
> +  - mbox-names
> +  - shmem
> +  - "#performance-domain-cells"

Keep same order as in "properties:" block.

> +
> +additionalProperties: false

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


