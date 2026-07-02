Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DA8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 23:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0nJyn9ZlHXNy1UtVy9wnNIdYbhNJQE+1kKdh0a86nQ=; b=veWeNK6ewqrM0ntjxbE0tFdycV
	wuxlVdtXio5hniIl0zfsruVXkk2Vzl9TinWfcz9QOepyXCqFvIO/RZlwBlk4xE+9yINVdES1ncBZp
	jdyWfkxzs7oAw/eD5ugjpOPzu4Otf7GxqZCyqy0WkIEH1DXzAaaKa/xY026nWt2SwYXPPHIH1ne+c
	HN/R0+hbYy6xK8F08bEanjiRfNoEwQJCX5sUY48YhLvk4qnS7disZ1E1FZj2FEEQa1w81iJDpbfNN
	u+PqAIVPjIVDIyyc5CWy1wxPEBeJFNRTWuYXN/S98/p3gjIthnEgLDdJSD6vY+YyNL9325+yxqD48
	V2ybnl3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfR1Y-00000005kG6-1pag;
	Thu, 02 Jul 2026 23:40:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfR1X-00000005kFw-24w2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 23:40:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FA4A6001A;
	Thu,  2 Jul 2026 23:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FCD51F00ACF;
	Thu,  2 Jul 2026 23:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035650;
	bh=E0nJyn9ZlHXNy1UtVy9wnNIdYbhNJQE+1kKdh0a86nQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ifTRbqCWDMCfJRpsFWFSJW7oCng/TneUHfOCCN8EjG3vvjTMa+DppbPZPE39lcmp3
	 KgAxwXNLRLEQWl5Hofq+MKDVWPtZTvupP6r4Jt6X1MxvF1VcbQy7+XFdhWK4I7+Qd/
	 UBoEEIT54NrPlfyf7v8w6KAxIZG6oC3hRmTjUJUh1kny2QKL5DwxZgRA78v/cg2E5a
	 qMo2ZNe3wn4i8lkD5Ievr1COh413z5G4XYafPOURVlaJAVSj31M7hnIDxblz+3gNl6
	 a7Xzjlh5TfNzMIp6UHGs34v0EVn3jqwv3poSbxu6x+HMhW18soeyZLLF6Sq/iPECm+
	 XKeLLY9rwDRDg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/5] Devicetree support for Glymur GPU
Date: Thu,  2 Jul 2026 18:40:24 -0500
Message-ID: <178303563635.359079.10264708628600253510.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
References: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
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


On Fri, 22 May 2026 15:41:56 +0530, Akhil P Oommen wrote:
> This series adds the necessary Device Tree bits to enable GPU support
> on the Glymur-based CRD devices. The Adreno X2-85 GPU present in Glymur
> chipsets is based on the new Adreno A8x family of GPUs. It features a new
> slice architecture with 4 slices, significantly higher bandwidth
> throughput compared to mobile counterparts, raytracing support, and the
> highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among other
> improvements.
> 
> [...]

Applied, thanks!

[3/5] arm64: dts: qcom: glymur: Add GPU smmu node
      commit: b90a899027ae9def17cff2c566f50e406bb95307
[4/5] arm64: dts: qcom: Add GPU support for Glymur
      commit: b6ff8cec8aaac2128a4fe82ccfba263cf645cc68
[5/5] arm64: dts: qcom: glymur: Add GPU cooling
      commit: 7d260e77d88fa026a1e181cecee545687fa80f92

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

