Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8FACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 07:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJRX3BEKekw18RS1cbyaVAktVW1RFoXN5NDG/YonWwE=; b=Qeeztbc5dajf6n8oH5ONirByM8
	k8Ch3ldip1JQKEx4uUVqlb8uf1g3VxCDYAxfT76CDl9oit4s6v8X6Zp4VxOp/XMcp0G7CC73tWVBC
	nXboCegCNuSHMLsb1765ZftAUwtD4l/E3WB9MvYIe4uyuiOjnBQJu3amSLTDq8BIZD0E5z5tv7JrO
	nzOIvP2mAwhcI0Q5E2Wlp8PDLcVM2anA0AkHlSTIpXO1iGxliWghkX0po3QNvHFFKg+sHwHT/UOFF
	1MVYtfGg4gFDMc6GZEMCHfQBbegoAUw73+Kougp8XoGTpGNcmV14OFaR06GaffvZRkl53NjcpIbC8
	7BJUcKTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIj9B-00000006ihy-212P;
	Tue, 11 Nov 2025 07:50:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIj99-00000006ihk-1pLr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 07:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9246361915;
	Tue, 11 Nov 2025 07:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9736C4CEFB;
	Tue, 11 Nov 2025 07:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762847434;
	bh=oUpC387GOG+scMgq73fcTcbxVzxmSK2/5OLQR2Y2jNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IMob0ZfD44J4BlJiPK4v9d+USC8LaYmuTo2h/N6KUYluazUj4oBym09P3HqQ2GtCb
	 5V2eQ1GAWULEai3y83riVrBFGwdcKzmP2I/aGFo6PyMXWW3YAW/VgOnbaU0I3Ws6RN
	 RF+7xiRK51aGPwh8jBdMYG4O1etN4Mx1kxNbJTBvZEz/+hPfCUKu334GduKC50ytmT
	 2fWvzPwg8OuWussEFBkC0sxM/YqxmVWkvjHB/Bv1uqgFjRYdIAkPp1l3Cg60Ay2RXU
	 5p5AySOeJKt+Aogwv0H8+1aE/pZ83D58JP5ITHvLzbAKzOsZlmbfWJ/BOIGbz/RyzG
	 0ePqZF4epfbrg==
Date: Tue, 11 Nov 2025 08:50:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sean Paul <sean@poorly.run>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
	Jordan Crouse <jordan@cosmicpenguin.net>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Connor Abbott <cwabbott0@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 21/21] dt-bindings: arm-smmu: Add Glymur GPU SMMU
Message-ID: <20251111-mighty-aromatic-urchin-f80cd9@kuoka>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-21-bef18acd5e94@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251110-kaana-gpu-support-v2-21-bef18acd5e94@oss.qualcomm.com>
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

On Mon, Nov 10, 2025 at 10:07:27PM +0530, Akhil P Oommen wrote:
> Update the devicetree bindings to support the gpu smmu present in
> the Glymur chipset.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

So you ignored entire review? I drop the patcshet from DT patchwork.

Best regards,
Krzysztof


