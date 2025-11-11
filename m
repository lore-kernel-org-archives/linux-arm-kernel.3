Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40901CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 07:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8B6SrbtxXe8etjyyZ3mSqXzIGycPwFHczVWgyHU3OJ0=; b=jKU4U7E6IUXmiuaH2vqR6qRdEM
	KkE0sy8m6Ky6fJ1QhV7mLgy2CguM6HysINm7czWra4OffGDSqcgln1xaFB2vVTziwbixlhhxGGaZk
	LwA/nV2RLYX7EaIxfi4OPOWZwaoSQK2k44oZ0Uz1UCXzVuHFVS9i5iDHvGpKmMeHL70V5EapWO81H
	3IflK3f12qWej2oYZddAe0XlPObIN3vA6AF5fzkkYZ+8U1YV2wJOtAgfIusrCCls1iSvW35I00szO
	afJp8j8yJ+vTY95cQ5ep1/IikwiHzwKdLb3CasKbpoIQ/nSZ32C3Q3xgyrFzXZYvHLDfc3okxY7oX
	emMfJOSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIj8c-00000006ieQ-0cvt;
	Tue, 11 Nov 2025 07:50:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIj8Z-00000006idm-1AVo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 07:50:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDCBD43B0D;
	Tue, 11 Nov 2025 07:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B81C19423;
	Tue, 11 Nov 2025 07:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762847398;
	bh=LtD7jh1jiHyiFX3iVP+B4S4da4HrLV4LEooD4oBo27c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JoFTKMV5c9VBms5D1QoGJ/1cmQlq6ndI44MgJvLg+2cKTvNT7VCTKai7D8BJaSmsL
	 1lXEZ/4I8pKMhvjzVyTP07+o9t+mBRZzL7jx/AfC5SqyiBA3CYQw1j4mwskoWdsesY
	 FAX1tlQ6elMo6Z2UKve1n3Sb9XIhxk4Vnhok3b1nXsSbEa77ohIzvPU4cbbLgQcx59
	 lmRb1KLQhdPI9nVBwQGBqkglY+ZtLQkcvzl/PyC+3aqowHCzu+pUffziPJsf/4fmSY
	 Hq0aErDgQz7DV6zwmH3X/2iNtV8uUVM0K5DHDOwwZiAbMEA5uOGHP57205mbfEVYFZ
	 iiW/zl9nKuv8A==
Date: Tue, 11 Nov 2025 08:49:55 +0100
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
Subject: Re: [PATCH v2 20/21] dt-bindings: display/msm/gmu: Add Adreno X2-85
 GMU
Message-ID: <20251111-magnetic-jasper-slug-3abc3e@kuoka>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-20-bef18acd5e94@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251110-kaana-gpu-support-v2-20-bef18acd5e94@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_234959_341175_F111A0D6 
X-CRM114-Status: GOOD (  12.65  )
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

On Mon, Nov 10, 2025 at 10:07:26PM +0530, Akhil P Oommen wrote:
> Document Adreno X2-85 GMU found in Glymur chipsets in the
> dt-binding specification. It is very similar to Adreno 840
> GMU with the additional requirement of RSCC HUB clock.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


