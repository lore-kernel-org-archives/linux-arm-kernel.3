Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68FAC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kj8TYyidAV7l2PIO6TRta/Ow2V8gY5DjboWOEp2CBJA=; b=QeiJYh/iVEwtLc5ZuuVTwVdFZs
	f11mxyeKOnDOwk5bZMp3j0uW+qcYCBHJ+4uHBkR9F276Y6yxx2eY4VP86AK0IVr4Q/yTT/0yvI8mO
	vO3gwoa2ja+CTUYDE49r5YLp3AsHf4pVGWpLxGBxRXlJ3f8Yb7QBnAvByeSx4ZEGFObsufUVfxDcF
	0I6067zPAVSz+yuTl8/Bdr49s0mcLLe75WKPkWqr+k6bxChbgV2tIG6f/I/GfEYbpFzXMXjRdNwJv
	J+mAFUP+41JzEIJ1/6K0nyCuHk0tyASZ/nI4ebZBKkg58OH6wz74NP1Jyg7G1bU7YH6slyxm3Vykc
	Pl3JbAQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy3e-00000000PfH-09XD;
	Tue, 25 Feb 2025 16:45:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxXh-00000000Abd-0Fb2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:12:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 98A5C5C7240;
	Tue, 25 Feb 2025 16:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7572C4CEDD;
	Tue, 25 Feb 2025 16:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740499940;
	bh=6TPSx9DDdcDsDZc4Z3MH/7GdfIzQc59GGd56ID/Sx5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NU2EeJ8FyzWf7HI2/8kGM+qhJabN/O1VJNuarGCTaaTAf7SR0p+tXbOv0rNLPxQ1P
	 GkqL3qVSbuxuVt9WmUtYt4eLECgRNhSgxMT0XJ/QUI9wAN5TWpY3nPWU8jNdGjfQJ1
	 LEUk04YN6vDTgqNHfkNpZ21fN8T0YcAAhr04EjLYBM4jAXdRaS7W4XTBxCiIxrqv4P
	 57Y+JoPZ9jyr40AvmvoOKNnT4zak99uCOcC7BXyI5g+RhLFg7ZZKkroT5cbSGKYFZx
	 /ZFM9Ce6EOdxSFVina9oQWVocBhDIDX72LveN6lPTQLAoVJoBBHIB2h6yRFVQvtex7
	 lT6g4Vkayq9QA==
Date: Tue, 25 Feb 2025 10:12:18 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Will Deacon <will@kernel.org>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2 04/10] dt-bindings: stm32: add STM32MP21 and STM32MP23
 compatibles for syscon
Message-ID: <174049993788.2634473.18262936778020471573.robh@kernel.org>
References: <20250225-b4-stm32mp2_new_dts-v2-0-1a628c1580c7@foss.st.com>
 <20250225-b4-stm32mp2_new_dts-v2-4-1a628c1580c7@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-b4-stm32mp2_new_dts-v2-4-1a628c1580c7@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_081221_146076_1DF27E78 
X-CRM114-Status: UNSURE (   9.06  )
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


On Tue, 25 Feb 2025 09:54:07 +0100, Amelie Delaunay wrote:
> Add the new syscon compatibles for STM32MP21 syscfg = "st,stm32mp21-syscfg"
> and for STM32MP23 syscfg = "st,stm32mp23-syscfg".
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


