Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE40CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 15:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5WuGdChPOQR0vjftfl5fUSQjcwbvKwZfaPsZ7I0dkA=; b=2inBrXw/J1o+YbaxY12qy4sQCy
	r5MtV17vI5e//ie0CZEkjkVtRys0aUprGvrH54o+QKRBhTX85Jg9KwRHrXeY5cItViapd6Q9RXCCK
	pi8zGtPTP8l6UcWmzNaJk8lSwAfDPK2eYpkj1+a7TQ+N49veY5KIerA+3cAFQhJaHfhWNjQS7imp+
	OzLtLJSmRvh0xq9qtcHOm8Qn2yESXQcpmT585u3ldeBSR4YWL5cFtNc/Nf7tjOtsuDqiRbn1WRGyG
	gC7uLK4N9+X7Q3aaeQx4aJw6fOBd9LL04ZZktY+4b7gD0p7SkhG7WMJcTrkU9iCGbowG0p+USZFH8
	Mcr7seaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkqf-0000000GmNa-0lap;
	Mon, 05 Oct 2026 15:43:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkqd-0000000GmNL-3zCu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 15:43:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6718460A6F;
	Mon,  5 Oct 2026 15:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6FA1F000FF;
	Mon,  5 Oct 2026 15:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791215007;
	bh=Q5WuGdChPOQR0vjftfl5fUSQjcwbvKwZfaPsZ7I0dkA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TniW9neXllce7NIK2HiIcHuRubQzns8HlabuzsWcp3yG85FBThAFvjZdmvfuV7aEc
	 cpHkuKa0hEnF10t0ClbRcQDlYph/dCcWVeBA6gm5yZz+TM65uO8geOGpt4OuOnW9ZC
	 JS2eMfltT2QZAOt8oQ2AB4PKX3fjPZerLgSH4RitYjwLscnvLCHbXNwlQmNx0Lcz3z
	 dBCtiS53rrGO5Jh91sjM70fP4mPJFuGJyQmUdkiF6Gq2E+YZbjJglXs2vdy9FwquUF
	 smDcna+FgKNgAnKpQ7mdgkHZ++TV/UjYrO0J48KpZChxrDBR/PyH96y7GLcg1RHDfR
	 M2x+fAs5KRP9w==
From: Vinod Koul <vkoul@kernel.org>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Frank Li <Frank.Li@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Sinan Kaya <okaya@kernel.org>, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
References: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
Subject: Re: [PATCH v3 0/4] dmaengine: use designated initializers for
 acpi_device_id
Message-Id: <179121500435.358863.16138122883017416450.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 17:43:24 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Wed, 16 Sep 2026 16:27:53 +0100, Pawel Zalewski wrote:
> This series is converting lists that contain the acpi_device_id struct,
> which is defined in the include/linux/device-id/acpi.h to make use of named
> initializers (which they do not use currently). This work is part of the on
> going effort in the kernel associated with device-ids [1]
> 
> The plan is to convert acpi_device_id::driver_data to have an anonymous
> union, similarly to what was introduced for PCI and I2C device ID tables.
> The goal is to increase type-safety (most of the existing casts are gone),
> to improve readability and to make use intent a bit more clear:
> 
> [...]

Applied, thanks!

[1/4] dmaengine: dw: use designated initializers for acpi_device_id
      commit: 3a03a5866e82027c0fa96f6208721397e5a6ff78
[2/4] dmaengine: loongson: use named initializers for acpi_device_id
      commit: b37c93bc1cfd0f5fb898b7943bd0c1797341a41d
[3/4] dmaengine: qcom: use named initializers for acpi_device_id
      commit: db09763394959442d91d86840717412073c41abc
[4/4] dmaengine: xgene-dma: use named initializers for acpi_device_id
      commit: b2c203a5878b0d3f95e4802fa01e320d317b82cf

Best regards,
-- 
~Vinod



