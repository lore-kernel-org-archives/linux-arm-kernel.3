Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC161CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 19:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7+mqGR7dpFOmg9HvnMXYkfm59tcB5c47+S6f1nglZA=; b=R2Xg9rWaaWnhFEk4DF0ypuVFko
	iSeRCzt+IqCmXGFudHQLFJwG0kQYePHKvmVO6DSQqzi7z8IsQYfz8cBr39vV0l2cGtW2rvL7GAe/a
	Y3abIrcafnZjhrQdLmkphv0ZmjmGDCEzYQM9OkgExOzzs0qRFtWm9f2Zam4psbkDhqGvqV7Bd6nbK
	C3kBEJChQVDWFP4X7YrnnEjFX7MZ5tj+EWPB6xtwM/IFQnprPa58LBIfK4zsYHMHqdyYrIbfdsJE8
	i9eWWWOl0mTSIDBYT1e9KsvUYolp+CBt8rx7nMMXA9b8v9iYnSFort14IIelxVwrn8TGzlFQu8RZn
	zopgwvzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6wIC-000000070dR-44w6;
	Thu, 09 Oct 2025 19:27:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6wIB-000000070cy-3jQ5;
	Thu, 09 Oct 2025 19:27:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BB5B62400;
	Thu,  9 Oct 2025 19:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEB6C116C6;
	Thu,  9 Oct 2025 19:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760038029;
	bh=J7CUiWc0ADF5tenIxtE4W4RrkCaIIs7aFDIdrQb3yuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ocOfs+N7rtJInE5RqP5OdMODSvcF4BMfHOQ/dcESFUUiWLWZAxbZaF5uNBcC7hENh
	 qSwKlQWc7ueBC64kW2mHYeok0OYGmn9lyK+JRYDFeqfUUJL++YiR0VukEUdApGwZ4P
	 06fxejW18TPzKsAf3FaJh5To8Xpr1/s8bqgN9DgXGr/z1ZXFBh272XQyfXUJXlKFAv
	 4mF3dyXq7P/6ESbB3idH+ngJx9sPFTjCaHZ8861rBV4KfbYP+Zth70YDTTW0kAiNxW
	 8QJP0JGvJcnnBDViirhzGPJdCFx3Ynf1ASJF8rtJ/rR02QsosocZbskOnujsGkzC/J
	 /yWABoLKDafzg==
Date: Thu, 9 Oct 2025 14:27:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Steven Price <steven.price@arm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Liviu Dudau <liviu.dudau@arm.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>, Kees Cook <kees@kernel.org>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel@collabora.com,
	Chia-I Wu <olvaffe@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-hardening@vger.kernel.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v6 2/7] dt-bindings: power: Add MT8196 GPU frequency
 control binding
Message-ID: <176003802776.3154911.16315672930945564696.robh@kernel.org>
References: <20251003-mt8196-gpufreq-v6-0-76498ad61d9e@collabora.com>
 <20251003-mt8196-gpufreq-v6-2-76498ad61d9e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003-mt8196-gpufreq-v6-2-76498ad61d9e@collabora.com>
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


On Fri, 03 Oct 2025 22:15:04 +0200, Nicolas Frattaroli wrote:
> On the MT8196 and MT6991 SoCs, the GPU power and frequency is controlled
> by some integration logic, referred to as "MFlexGraphics" by MediaTek,
> which comes in the form of an embedded controller running
> special-purpose firmware.
> 
> This controller takes care of the regulators and PLL clock frequencies
> to squeeze the maximum amount of power out of the silicon.
> 
> Add a binding which models it as a power domain.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../bindings/power/mediatek,mt8196-gpufreq.yaml    | 117 +++++++++++++++++++++
>  1 file changed, 117 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


