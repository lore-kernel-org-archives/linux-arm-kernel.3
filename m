Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409ACD2F33E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 16:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+chXS9ZDMKI2KjZOs6poLYGp8PpyW9pzoJKSHaXZwqQ=; b=z6/pHWc8GmGQx/isgVG3qaQNfx
	NNdo2M4bjC4UDfSGhXTtSTZhfGPOr0uXFzFLWwx2K4duG9PTDMX/lOK4OF0sjSQmphRNtD0Cznkoy
	2X4FNztUvAtSgIbikDBsMnWdQKglTeDUnArIiW/2iAldsf0BBvvFGdVKjMcwRBPS0rgEuOO0RhnsM
	1Hh/IRK/9TYLePBsxwJGmYswabyJjz5tfR1LeIG+0gfQvTMIipGu3pljeBRqWfvUBLMocxTZHZZ7v
	UPiP6KmRkCehUIgigrjVhX6UzbZNePpgk9g6Th61PSOFhpcDJii+EygnhfwGHwpp0R94aG6UFdIlw
	OKBPXpCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgwL-00000007RR3-1mtx;
	Tue, 13 Jan 2026 16:08:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgwH-00000007RQI-0GCV;
	Tue, 13 Jan 2026 16:08:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768320489;
	bh=XrcoqIdL7mqLMAZSLEUBjwk3677mywTfFnps1LIr2qA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AXenmkWO0eq5YWShnSaSv3RU3e/vIfy2AYsdeNYFaYb63vC1Wfxa4deyTH9bKjZdA
	 zkIfbiY4MFlNVaAbEHedzyfCo5epss/7f9Fe41KSANOp3W7SJ6jqA3jj5IhjA5cHfp
	 jXMlLjN45Ix9TjPtsQyew8bp+hTWRzToGrBW5tPz9k3W8mUlOtHczuEQWkOnA7tK8E
	 iY9NUTgtz4t5KziPuiYtjkxoj+jZ53hT/w1WayTNHan+buwycMpWWBUpp5tYW2wFgK
	 8AtxVdb+UXSRg183npbS02u28cojtXfs1ns0AwIVQsmKKaVZDsyNpBbd/6qiSZ6l89
	 DWmoRged+oF+w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9819B17E026C;
	Tue, 13 Jan 2026 17:08:08 +0100 (CET)
Date: Tue, 13 Jan 2026 17:08:03 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Make MT8196 get its Mali GPU shader_present from
 nvmem
Message-ID: <20260113170803.6e5ebedb@fedora>
In-Reply-To: <CAPDyKFqkPg5rWYk7cwDywRn_pexQhd2V3R63atjruJnSpYxfZQ@mail.gmail.com>
References: <20251220-mt8196-shader-present-v2-0-45b1ff1dfab0@collabora.com>
	<CAPDyKFqkPg5rWYk7cwDywRn_pexQhd2V3R63atjruJnSpYxfZQ@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_080813_271793_0DC54BA3 
X-CRM114-Status: GOOD (  29.86  )
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

On Mon, 29 Dec 2025 12:52:13 +0100
Ulf Hansson <ulf.hansson@linaro.org> wrote:

> On Sat, 20 Dec 2025 at 19:50, Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> >
> > The MediaTek MT8196 SoC's Mali SHADER_PRESENT register does not list
> > only functional shader cores, but also those that are fused off to
> > improve yield.
> >
> > The SHADER_PRESENT bitmask with the one fused off core omitted is to be
> > found in an efuse. However, the efuse address is considered
> > confidential, and is not public knowledge.
> >
> > The MT8196 GPUEB MCU, which does the power management for the Mali GPU
> > on this SoC, knows and reads the efuse however, and exposes it in the
> > shared memory intended to communicate state to the application
> > processor. Reading the bitmask from this shared memory area is the
> > vendor's intended solution.
> >
> > This series models this in the binding and implements it in the
> > corresponding Linux drivers:
> > - the mali-valhall-csf binding gets an nvmem-cells/nvmem-cell-names
> >   property to declare that shader-present is in a different castle
> > - the mt8196-gpufreq binding requires nodes to expose the shader-present
> >   cell
> > - panthor checks for the presence of the shader-present cell and uses it
> >   as the shader-present value if it's found, instead of the Mali GPU
> >   register contents
> > - mtk-mfg-pmdomain becomes an nvmem provider and will happily serve
> >   queries for the shader-present cell
> >
> > While it would be preferable if we could read the efuse directly, it's
> > not possible as things stand, and insisting on it will just keep this
> > hardware from working in mainline. Running a GPU workload with a
> > SHADER_PRESENT bitmask that includes a faulty core results in corrupt
> > GPU rendering output.
> >
> > Modelling the mt8196-gpufreq device as a nvmem-cell provider however is
> > not lying about the hardware's capabilities, as it truly does provide
> > access to the nvmem-cell, even if it acts as a proxy.
> >
> > From a bindings and panthor perspective, this is also generic enough to
> > where hypothetical other vendors doing the same thing (even with direct
> > efuse access) can rely on the same cell name and implementation.
> >
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>  
> 
> I have applied the pmdomain changes in patch2 and patch 4 for next, thanks!
> 
> I assume the gpu changes will be funneled via another tree, but let me
> know if there is a reason to keep these changes together.

Yep, I just queued the remaining two patches to drm-misc-next.

Thanks,

Boris

