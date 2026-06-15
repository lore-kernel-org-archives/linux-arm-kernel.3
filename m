Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92100CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 06:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NH91vhgtpim2mvTKLEXlcggfytTmn9NzXEfuRjaO5Q0=; b=v32zeAWtR+vRZr7DGrCZ0rOmZF
	56KHXw5IlCFTRE25+vT9NMQdU2YhnaS/QfkeLy5jO0T+6un9sqHHofNHBQ4HcAOvIwlABzwpfHa5c
	5KeYMqHpwJ2JzYEcPGA5dFUwd3ZriW9EI2U7xOREeQfb7Iqnf37Vddz2UHZ15t/kc0XLOkcYEM6FP
	1N4HOZbn0xMLlvURKFkzxTMstGkKAFlXXxT4da6docKTYuUpw1t4Or4WWBF/tgQ1zGd9D2au+lQMe
	LlkBNW/+CU6/nrIMd64omfazPVJpdXnymm3wZIdveFSeuf1U2msuV6LYcj9wVJXudVUGDDwwGYgp0
	dyBGqBkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0Pf-0000000DfNF-3SVC;
	Mon, 15 Jun 2026 06:03:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0Pd-0000000DfN0-3owh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 06:03:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D22D416AF;
	Mon, 15 Jun 2026 06:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF33D1F000E9;
	Mon, 15 Jun 2026 06:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781503389;
	bh=NH91vhgtpim2mvTKLEXlcggfytTmn9NzXEfuRjaO5Q0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oeSMN76QlgQpFNDQ9ZPs97txznTmGvIYY10j/7nHqew76rsgUzAdF3HKX/zNtettd
	 W96YkR/xavSqS7/9H5conjE9VOzTCZaUQN2aZhs80VnT8sj/EvHMTi716P8Q0B8x8h
	 rk6zLDKBnSylGlM+U7txGlav+5I7I8TlSndqWzW3jLspx7NnFgODc7yxR2NlARYukm
	 30Kfa6fhqS0jGn6tpUX94n3t6xh/FycJl1CwOJPSvWH5tU+Qm8AEzZTrRZnIfvfN1i
	 C7K8cxTIQ77oKFV8XecAv/hdwlNGncM/5yX3uCiUfW9RNQOKRwvTQAa7OxzUTD4te+
	 7UPX4idfRPqew==
Date: Mon, 15 Jun 2026 08:03:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 3/3] dt-bindings: arm-smmu: Document GPU SMMU for
 Shikra SoC
Message-ID: <20260615-quirky-horned-chital-543dce@quoll>
References: <20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com>
 <20260615-shikra-gpu-v2-3-2f2d1347c3fb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260615-shikra-gpu-v2-3-2f2d1347c3fb@oss.qualcomm.com>
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

On Mon, Jun 15, 2026 at 03:02:59AM +0530, Akhil P Oommen wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add specific compatible strings to document the GPU SMMU present
> in the Shikra SoC.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


