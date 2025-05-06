Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EC7C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 23:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mfsM+Xtm3oSfWWXvAVczMrUTs6MG27Vz45vdOJrth8=; b=m/3f7LjL+g3UYGXx/0eoQJqm7R
	2cH/rotzkKbPfxmmdNtw6pI7UU0d4rpX114CJ9J0UgCAPvB22Yzhxt0U/LFSJWNDuEowCRFBSu6w7
	R1/lpkqm6zvarA5yItGuiMH2OtXSfWitu/ZMMIDtdWGb3FGtNYNP2X6UAfkYzaKnJGx1/dhDOTmN1
	zdOTiLlfIhofhqEfeFa6baQ+XYL2KjGXfbNc3smTBW9QTdEcqhbbBBwCBUT2RUZQbzs4BpoTXkrLy
	pFf1Q8dJYhOGIC+g/06GTDNq68z5hjyINGS5fZCoiYEHcO27USU5NPYTGnC8auwl4Nf6BOsLQ4uvs
	OaSlqIVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCRrK-0000000Dibb-3m1E;
	Tue, 06 May 2025 23:37:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNbD-0000000DBkO-2vmb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 19:05:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18D6B4A4A7;
	Tue,  6 May 2025 19:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5832EC4CEE4;
	Tue,  6 May 2025 19:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746558303;
	bh=MSo35+Amh/seHP0yrFLPNV2O0EEaD2IT75vNZ18nUtA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iyXGHcOFG6J2D23m+FcvBlj4G/IiJWlHR9TR3aFYRXBes+B4963dDPBB0fiGGigXs
	 w6q8Ub/1rj9oThenxajNA2en9yHlLPL3hueOzLnr8ZR3UjPtF7iBJhrU6DyTqCDckl
	 1BVDnTvFDp6pYoPzWMZXPOTfa47bnxW557WYDOw6t5Ab+s4e7nsqc3PVUSjfas4peA
	 ePzrqny9plQg327zhXEvM/FjAPU/5YNncQc725YUZ1GLmQg0PImMCNi6sZDBeQWEtd
	 aQBXDbLqSwiRzWjcok4dkAXzica29VpwoZUzqA1XocAlM/Yzc0UloZ0m7pPgXTsvbB
	 z//PJRGt3MdNg==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 00/10] drm/msm: add support for SAR2130P
Date: Tue,  6 May 2025 20:04:52 +0100
Message-Id: <174653623031.1666674.14201410658457114582.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_120503_760208_AC0995EF 
X-CRM114-Status: UNSURE (   8.81  )
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

On Fri, 18 Apr 2025 10:49:55 +0300, Dmitry Baryshkov wrote:
> Add support for the Mobile Display SubSystem (MDSS) device present on
> the Qualcomm SAR2130P platform. The MDSS device is similar to SM8550, it
> features two MIPI DSI controllers, two MIPI DSI PHYs and one DisplayPort
> controller.
> 
> Note, due to the technical limitations DP controller wasn't completely
> evaluated.
> 
> [...]

Applied SMMU bindings change to iommu (arm/smmu/bindings), thanks!

[09/10] iommu/arm-smmu-qcom: Add SAR2130P MDSS compatible
        https://git.kernel.org/iommu/c/b3f3c493e963

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

