Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C3AC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/4AwJDlUc6G4FSUtMAB2vODvWwQjx1d0P5R5iMgpjI=; b=nAw41Q/+skonHxZO4xnKNcUHXd
	gcSCiF9h3lEuqO3JCDkuPVTrT2h4AEreED56qzfAMxGh5a5nXol0ZB0Zfc0yCVzTLv1TJndQ5I+Vu
	xVPkxeovMjyHZLv6NLcsfi9nBRahen7xYK0CgEmuS+Z53rL6AlAyLRcEHBmUb4LcwnpTFOCPtkMeU
	582H+fFSoy4IsKGDLbsAGFUmpyYGuaT1uZhKIelVCFVqojpavAwJ7Nnz6Y9j/yt4wqmQCrz+/tlr5
	BVoNZUJsy6SEs3l4wpnUfK8nzm6AOw0imy9yQmiggdOBDvWPTOKGUEZfGXk4mrGyFh5enIDVaRY/G
	YRD2+1iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmefQ-0000000CpJl-0sSo;
	Wed, 22 Jul 2026 21:39:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmefP-0000000CpJY-188d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:39:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 427BB600AD;
	Wed, 22 Jul 2026 21:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971A31F000E9;
	Wed, 22 Jul 2026 21:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784756388;
	bh=J/4AwJDlUc6G4FSUtMAB2vODvWwQjx1d0P5R5iMgpjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=brRzAZBda7UZHIg4veJxZLCYpAqd3lCO2ZMyHBAzG56VDW8Zr41kajFzsuVf16Qen
	 jfveSt7reJYPqIKL3ap9i1AnIyHiFlS2Tm2AphtXD9AmgXbcX/tXagmG+t+IpMhD1A
	 cwtRgmM7wLAMuu+ewZgaPPBKxQQowjI+KwaYQcE/ftJy2R4yI3g/+/pTG5vCEffyze
	 hBzeg+QNlgQ8LQurTVNRWREViUly0jR3ypJbAUy9STmVgZ1bPpdG76mL2ABYqgxY5u
	 +mgrWmQyS2Er3Bx/3LapCmBRVzBgGijicDWB1Yop4ngvwCcd3OHRjq2U63RXJIEvIh
	 9R8xWkFBQzGFw==
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
	Bjorn Andersson <andersson@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/9] drm/msm: Support for Eliza GPU
Date: Wed, 22 Jul 2026 22:39:19 +0100
Message-ID: <178472234101.2849821.2122520947416470747.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
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

On Sat, 18 Jul 2026 02:11:25 +0530, Akhil P Oommen wrote:
> Adreno 722 found in Eliza chipset belongs to the A7x Gen1 family. It is
> derived from A730 and shares the same IP-level configurations: HWCG
> registers, protected registers, GBIF CX registers and gmu_cgc_mode.
> Major differences include smaller cache/core counts, 1MB GMEM, no
> Concurrent Binning & LPAC support. Some of the peripheral blocks like
> RSCC are from A740 that resulted in updates to RSC layout.
> 
> [...]

Applied bindings update to iommu (arm/smmu/bindings), thanks!

[4/9] dt-bindings: arm-smmu: Document GPU SMMU for Eliza SoC
      https://git.kernel.org/iommu/c/925f98235a72

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

