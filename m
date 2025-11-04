Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC55CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 03:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=db86T0sxSYzL3ST6R1lft3vtJ7ePLDmJwSELFxfbkPs=; b=huU6Ap3XCDvboRbgjFBSYug/ur
	xm9weW8k/baUUs3FcI7daTnxjZ5ZLQF/+qsSrAflPR/LCkcjtv+YKDi6WTpYhg2S33Dz9mf+a0tus
	wy8kMPDQ6E6i+S4oc2f4jgvYMYg757kmDjgIQwE4v4y+veBPiuBVrIRUaIBz9P4aSuyz3w6lKPkib
	UTKDPfn+46hXDq+d9zoxzEMT7mC60/pCconTxfyxSNBy0VChOg7ZVYxp872eb26NTNUv2nWc6fW1F
	TnEcj05skQSIQ8P5vkw3jfkMSxx6mXWyxpgoM3MqNguUF9n2uuGtntTiSWR07EWhJWsV1tmoNkM/7
	BIGjE0Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG83A-0000000B4ri-18m5;
	Tue, 04 Nov 2025 03:49:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG838-0000000B4qw-2ybJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 03:49:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 29F46444A5;
	Tue,  4 Nov 2025 03:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33761C4CEF7;
	Tue,  4 Nov 2025 03:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762228176;
	bh=6pjQezU4iwekhElF+PBuaDe7tVtkK82fk5KyzqXZ8Cw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YCoXatokCFxgWqIhTzyTAdEYOahZgkdImF9ovuBfWpKFctgxRRSzyE9Egag2hKZej
	 DovnzgGxYSntC/DoKCHBW0+X8MtqT61p0TtPrh5EWor7chSFr1v5n3oUK6v2A0iSyx
	 zcggZIw7Eu7PHzY0tCDEeT5HLORySxOGJZhPyAnplgDWFPE13JoZbmUXGVcd+Hp7Qb
	 WtdUiywXmFq2l164tZek/Szryui98qGlgwKoeKbjVv/bP4fqru1TO8uX6QnZ+5wOZf
	 TjS4rE3OmzY8ExnBmZR7OX6W6iw+9GCDXI6Sxspsr+Rd4+mR43VlrHdKlnQrv6UiNu
	 V2gnxLxE5/Gjg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Marek <jonathan@marek.ca>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 00/17] drm/msm/adreno: Introduce Adreno 8xx family support
Date: Mon,  3 Nov 2025 21:53:00 -0600
Message-ID: <176222838011.1146775.11549730263195869073.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_194938_797471_B66E7B59 
X-CRM114-Status: GOOD (  10.64  )
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


On Tue, 30 Sep 2025 11:18:05 +0530, Akhil P Oommen wrote:
> This series adds the A8xx HWL along with Adreno 840 GPU support to the
> drm-msm driver. A8x is the next generation in the Adreno family,
> featuring a significant hardware design change. A major update to the
> design is the introduction of 'Slice' architecture. Slices are sort of
> mini-GPUs within the GPU which are more independent in processing Graphics
> and compute workloads. Also, in addition to the BV and BR pipe we saw in
> A7x, CP has more concurrency with additional pipes.
> 
> [...]

Applied, thanks!

[01/17] soc: qcom: ubwc: Add config for Kaanapali
        commit: 85d55d8cc3ef7f77b249c97e9fac6a0fc5f5daa7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

