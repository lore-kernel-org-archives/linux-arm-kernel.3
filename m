Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59723C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1wOx0e4PjnlF3z9WLHEYARB2GSoN4b0UX9bWrnaH3c=; b=zMaj1h8epA1HZcgZ0UrKUedzqG
	v/H4Jdo17GIFMfGVPoYw5Kogo+N7CQKRMF1Cw/D24K4U09GcRAm5F0/fdyASvYgkbr+zFL77eQRcj
	rDX7iiujHwcT+odCGAloO5qt1D4vkDw/4rmA3vGrNU/13CsWK3iHCinOyTBPG7e9ux5d5SuKNRRwO
	QPgCR6oVorBAxTfUNCyVFx2IqPoOaSQNhq9yWWf6PvOG1yQ54aNuNyb45NSootnadZi82C21r4BBg
	BiF5wp3Yfw0xOQwaUAClV8rVrIMurU4IjyVF1Z2AUr9oOvPhVCFgjQ8sBmwf9N4S4P448rOyC/jLV
	Mpu8AYcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmefZ-0000000CpMQ-1iE3;
	Wed, 22 Jul 2026 21:40:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmefV-0000000CpKp-2mbj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:39:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E48CC43FDC;
	Wed, 22 Jul 2026 21:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B77A1F00A3A;
	Wed, 22 Jul 2026 21:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784756395;
	bh=f1wOx0e4PjnlF3z9WLHEYARB2GSoN4b0UX9bWrnaH3c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FV3up+hKKYgBreJt+xgk9qax0vNTRVcRIerlpcYvJJHFkhgMsoucwlRE5dVJVQAUk
	 NOlaCo6qFmrDUWShS2RAfkllGOVrpRZeeBAfEj2xXaL65AFASCVyoQ1w+/xtYmJPQG
	 BhW19lZxp72vmGZyaxEo/cuhnq3Uvz0D04ymSYpQ3dyGhCLwEdYwB4s8Dimd1+FQut
	 4IkAqpkLCT+q8XwUidRGtcQQM59e6Pm/Jrv9mUfVZnryPkH43Sl4l2BM2NKVEPK4zF
	 lT3HNeglZh+8GdzQ2CFnty4o8eBGg+9m9WuRIR4RJZ0NxY4rW7uCfcTv++ZdOnHzGC
	 Yn1nhDKXxPlLg==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	Aditya Sherawat <asherawa@qti.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/7] drm/msm: Add support for Shikra GPU (A704)
Date: Wed, 22 Jul 2026 22:39:20 +0100
Message-ID: <178472212670.2848256.16113852617483173149.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 10 Jul 2026 00:11:59 +0530, Akhil P Oommen wrote:
> Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very
> minimal changes. The only KMD facing difference is the chipid and the
> zap firmware which is specified via devicetree.
> 
> Mesa side support is already merged:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41762
> 
> [...]

Applied bindings update to iommu (arm/smmu/bindings), thanks!

[3/7] dt-bindings: arm-smmu: Document GPU SMMU for Shikra SoC
      https://git.kernel.org/iommu/c/20b4f0f120ea

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

