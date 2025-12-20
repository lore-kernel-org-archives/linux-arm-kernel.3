Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52397E668AC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 01:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wipaZ5wqHzyJK2d9ee7AOD7kpN3dENbb0WCeC2DIZpQ=; b=nQcsF1zfoGNNz3ssFSqDiQI5fI
	jem2c+pZMVQF2LlLQLn3li/+NQtnHg2vjTE28FgQz0j+fR1ztL+9F4tSf6ty5fesqx+niNszc3wmz
	+6t01ewiZByjZVsOlIJ+oW/KZbmiknKqKF7s7wSra/YmcOWMHTzQ3VKs2OP1eprH7adQorekDsrXT
	WoNT1HS7z3bb+JnlWAx3akuewdbor3byDUTF2YyeNwlT06OMPPQvgwY4/022R3/+2VdZWEHjgkSq9
	ic5qIw+n/Zd+ORadexZQRA6KWqMZMH50/Kgx/WWTPa003SrcTWC6WbbXP19TtR0QvnCZay0+iKOR0
	sqlnYsww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWmEg-0000000BBrB-257s;
	Sat, 20 Dec 2025 01:58:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWmEe-0000000BBqi-1dBE;
	Sat, 20 Dec 2025 01:58:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A78D440220;
	Sat, 20 Dec 2025 01:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5005CC4CEF1;
	Sat, 20 Dec 2025 01:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766195899;
	bh=WNfNeRNtBHMdT3MgMNoIm2HEkpmzRyn8zXURCSnutSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h7k7N6jGCuh/KOw8VYsG4g230WVUnnQx/8NKaj78m0lsETxEtxnLzGF8xMn8Skv5c
	 6iH1jTqGr57q6v0pp44XfdtK0mRGFkVlDqHCrPye8Hip7mOhStFt2yjJ3kaYP71plb
	 wSrQk9C4tOGKtKy9IRcJm9lB/rlYrykLT5KZmg4FHjTZAdl26BBYDFzqy0MCunnQcb
	 iYyXzkqvNEHJ2h6yTeiutbvDpXESGSUfhsVuWoIf3OfSGAQBngL+kS3t+mDNatx/l/
	 daKyKHz7A+0p0ecJc1LtYbRSiuBy7lIo1BFYXrGrYB2Vs1tueSYNsp7kkml8dzEq7U
	 9ME9RVMes7/pw==
Date: Fri, 19 Dec 2025 19:58:17 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	kernel@collabora.com, Liviu Dudau <liviu.dudau@arm.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Steven Price <steven.price@arm.com>, Chia-I Wu <olvaffe@gmail.com>,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: gpu: mali-valhall-csf: Add
 shader-present nvmem cell
Message-ID: <176619589672.357311.747766699419646929.robh@kernel.org>
References: <20251217-mt8196-shader-present-v1-0-f6f8f3aa1e93@collabora.com>
 <20251217-mt8196-shader-present-v1-1-f6f8f3aa1e93@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217-mt8196-shader-present-v1-1-f6f8f3aa1e93@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_175820_507927_7E337690 
X-CRM114-Status: GOOD (  11.06  )
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


On Wed, 17 Dec 2025 18:03:27 +0100, Nicolas Frattaroli wrote:
> On the MediaTek MT8196 SoC, the bitmask for which shader cores are
> present and functional is not the one in the Mali GPU's registers, but
> in an external efuse.
> 
> Add the nvmem cell properties to describe such a setup, and make them
> required on MT8196.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../devicetree/bindings/gpu/arm,mali-valhall-csf.yaml      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


