Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB2CE668AC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 01:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFSL6Ndgj3OuUJ1GiNXKF/aVE51pU/5X3Y32z0F9J9c=; b=SXE2tCBM4b5AEAve6LmN7dEuTb
	KrBwGzFOboIcVWZJHR4dphoQCdKAwtBnSAp2JM6DMWfBGtV66N5ww5TSkumm/guVaO9E+VPrjjbSq
	IfU7UYgsLqWYIdkK76e8MTV80c9mGbxrJzu70I+8YPPnyUCsDtexI67oz4Id4JpNL9MTwHho/LFcA
	3fhDU2ZS1QuhEWBcE7z/PTwCQLsU2/KccEBtKSc1JXsDFuf/gyVpPKHwpi2c3yFFlMBUiU1trMpyR
	kDHadI/7gaCLjih497AhhmUk0a0MfbtRktGJ6wLvpfYs5fNlP9XgTfiz+HOXMdIkLbqFoRuVvgxVR
	cOP3c/yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWmGB-0000000BBzE-0X9K;
	Sat, 20 Dec 2025 01:59:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWmGA-0000000BBz5-0KO7;
	Sat, 20 Dec 2025 01:59:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8221A60008;
	Sat, 20 Dec 2025 01:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02FC7C4CEF1;
	Sat, 20 Dec 2025 01:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766195991;
	bh=os1jh+uZ9JsdSlnhfREmRKroQHOLlY2V9cVjgynwxB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SHBcNsI+BT4SfEzjOuUyUlFgXxxsfU1cSymkC/KMEuxeQCV0RnQPMbWYWiWtARQ+S
	 roy2dQvnmshflaSieqDX4PRCmO+Wf8YHIWNFqNI6MdGbZTL3YikWsRqVcmgHkf5Ymi
	 fCIeh5cq3R11d4zZyWraYiJxA2UPdRR70H1AB7q2CNN4oeiRqBZcA1wwXelPUk7LwW
	 RzXBx4vKfypoojYjBWtlD2zYR/3hCLvUohUnhAIpuOqklGbGMW8KQmitcH/a1GCAKa
	 v6esnMcGmeiglkzGHLsdzq00xaB3nGrfUSEfAK0eRu4kMd8mId+B2Qrb5eR2IKcW76
	 c3qCIn5Sqw/HQ==
Date: Fri, 19 Dec 2025 19:59:48 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
	Chia-I Wu <olvaffe@gmail.com>, David Airlie <airlied@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
	Maxime Ripard <mripard@kernel.org>, kernel@collabora.com,
	Ulf Hansson <ulf.hansson@linaro.org>,
	dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Steven Price <steven.price@arm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: power: mt8196-gpufreq: Describe nvmem
 provider ability
Message-ID: <176619598779.359396.11418181120053228697.robh@kernel.org>
References: <20251217-mt8196-shader-present-v1-0-f6f8f3aa1e93@collabora.com>
 <20251217-mt8196-shader-present-v1-2-f6f8f3aa1e93@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217-mt8196-shader-present-v1-2-f6f8f3aa1e93@collabora.com>
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


On Wed, 17 Dec 2025 18:03:28 +0100, Nicolas Frattaroli wrote:
> On the MediaTek MT8196 SoC, the Mali GPU's "shader_present" hardware
> register may also include a non-functional shader core, along with the
> present shader cores. An efuse elsewhere in the SoC provides the
> shader_present mask with the fused off core omitted.
> 
> However, the efuse address is not publicly disclosed. What is known
> though is that the GPUEB MCU reads this efuse, and exposes its contents
> in the memory it shares with the application processor.
> 
> We can therefore describe the mediatek,mt8196-gpufreq device as being an
> nvmem provider for this purpose, as it does provide nvmem access in an
> indirect way.
> 
> The shader-present child node is left out of the list of required
> properties as we may one day be able to describe the actual efuse region
> this value comes from, so the gpufreq device isn't necessarily the only
> device that can provide this cell, and implementations shouldn't need to
> implement this functionality once this is the case.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../devicetree/bindings/power/mediatek,mt8196-gpufreq.yaml  | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


