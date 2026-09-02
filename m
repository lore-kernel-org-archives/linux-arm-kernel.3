Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFF7C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 21:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JuyjwHbaaYNfgnJqhnqi/RDpMTuEjW1rSeLs2DZTYs=; b=22CJPY7S1Xp7GP6FZ55tqJVm0/
	h9CqVcwiRJGxZl37+gITEQSOKsLWcgoCWmJesou1kjMpaP3QuzocVRMAA+ESvhJqY2z0wVdFbKPLc
	q83573b+hAKuxrhuwmQ8mcMOdnltEi7NbKpIz07x/MuOc6ZcutWFL61SYkHDOgUPer29go6kCes9q
	glLPOCTxtwEUXuBcCu5EZg/DRj7SgJB/NbLmuKTgvkEJf7tYtypObwnzA5B0RGy8eqhBbLoRrm2yz
	d4qCH8h6+q1hIjxsRmc+T8zHQ86lHg4LEJi93fgp6t0mHlOf3FKyYinsCB2z7GZGDHBuPeZt1mG/V
	u6ecxWaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1slP-0000000Fxo9-20Wi;
	Wed, 02 Sep 2026 21:44:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1slO-0000000Fxo0-3KvI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 21:44:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B37DF4022D;
	Wed,  2 Sep 2026 21:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649651F00A3A;
	Wed,  2 Sep 2026 21:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788385497;
	bh=+JuyjwHbaaYNfgnJqhnqi/RDpMTuEjW1rSeLs2DZTYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y9Y4NCsItJcVpoapXIjhPVr/xF62UBUMDn7klXC679J/nhvjaIcCTqQG9cGMQzlds
	 8ZZ30vDAf3Ze79Ry+QKF1JaUqAboVWCHN8vQcv8Tswg7iH1KnEJc2FPXectXgrsHjl
	 nmpsfDXna3mDiY0eJXQXL6dThQIu6MKpYVVwmvKJf4lSrQnFmN7NxhCnaN4FimFfo0
	 WOdjOU/S8hecfK4NyEQr8wcPEodf6u63gso3cMYrrbUFPZadWreJWyO0GlG4DfKh3d
	 ghCg6M4VzsIhwi5PTSGeah5A4m1hTtyMYLXRkohHNkTudqyCYr5w9HoFLy9Ou5J1lJ
	 lHcW7FRv96PdQ==
From: Bjorn Andersson <andersson@kernel.org>
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
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
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
Subject: Re: (subset) [PATCH v6 0/7] drm/msm: Add support for Shikra GPU (A704)
Date: Wed,  2 Sep 2026 16:44:45 -0500
Message-ID: <178838546713.167607.11279652924360293843.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
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

Applied, thanks!

[4/7] arm64: dts: qcom: shikra: Add Adreno SMMU node
      commit: 91b139e9204c8ed4e1f5c89826a92e28716dd7d5
[5/7] arm64: dts: qcom: shikra: Add A704 GPU support
      commit: 4f365deb0e5ecd48998537ab67b5270d719a8fe5
[6/7] arm64: dts: qcom: shikra: Add GPU cooling
      commit: edd7232e163723a0f15bd9446f3f831edb5893e2
[7/7] arm64: dts: qcom: shikra-evk: Enable A704 GPU
      commit: 94654d16acfce2ed56e39f86645c3c5f56cc3f3b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

