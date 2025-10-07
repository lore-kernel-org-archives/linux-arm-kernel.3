Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C29CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 01:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkcMHntiqYRREzZA8Z3PaWdM8+w+6hyqu5G+XdKynl0=; b=2V2Cn2nHKbghVSf9w1BrFJ+Csv
	0yF1k3wFCBP1AwvAiKqkKW+Qmld7+oZuzPGyxbnGE7yqMeNtPHsPHiSK4ddYfSA2i7kSAdvNwPxNg
	JZ7UsVHEZOG/5ZMiWxhBbEyio9JxJPNlwbgJe4D7olYs50rYvjbVw9M7UkfIAlZRolKvpcTN/+tTs
	6jYkWsxKaCpqCSGnnYsPMrJ2yGbyDOlqUZrlQRWf9iGQij0VUimnUarsSDnHgPmfIvLyvuLyPHlZM
	LyKel7cj7dUvR5TWwBt47f23xvUL07r0ZBZC+NyX4JeUlSKkFMhaGQX0bDzuL3sDEpfZAIMM2Ozz1
	t1nhv2IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5wBm-000000016LC-0WIH;
	Tue, 07 Oct 2025 01:08:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5wBl-000000016Kx-25oW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 01:08:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5DED61188;
	Tue,  7 Oct 2025 01:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7998FC4CEF5;
	Tue,  7 Oct 2025 01:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759799304;
	bh=4mZ2Pd7g7yEA1a/btYS4fCpf+KxY0K6O7rgNoBX5KJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kIpfst5KFmC7qevzDNx9HzQobP57DvqFlF2zEOAmbfTjskVex3r4K0egK5ODyVxRc
	 pSRv4XR4rgfydQmwv3PD7qWkS8e/Yno9sSLUIsTzbZh0ypIWb08mw2reke9yQQqadO
	 Q7Kh4iv/sLIJvArPRDiIfxxmBiJwGvKeZ144P+C2dvPpnShd4UplGq7JMBnaiZr40v
	 HTo0bHtLmqqJzqqV6ZzQNuPm9LLVhxvay3FGjldmoleHApa2P/iGEulXiy8wI+VErM
	 LeEQNtFz6fR8Z/O1R3YBnE3r00qIRui7g+tfPLW6fTWSndmxolva3GTQWGJntez+Rl
	 9azlF3FT+3Usg==
Date: Mon, 6 Oct 2025 20:08:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>, devicetree@vger.kernel.org,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 17/17] dt-bindings: display/msm/gmu: Add Adreno 840 GMU
Message-ID: <175979930291.705827.13931250728494462568.robh@kernel.org>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-17-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-17-73530b0700ed@oss.qualcomm.com>
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


On Tue, 30 Sep 2025 11:18:22 +0530, Akhil P Oommen wrote:
> Document Adreno 840 GMU in the dt-binding specification.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/gmu.yaml       | 30 +++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


