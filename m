Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F92ECA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2a/xzUtAnOmuWUvgMfS5XJMavi32/iIBW6KE2lIvVkw=; b=o6kUyQ0iHjKF+LYYMQsrv/V4vp
	VSG50wHFQiGnSLecJWiY2TFHFR3kTeLueDLg+q1i1AhPREBQpOhLhjEaLKurM54Yrx++hVHz+sdIz
	kGUyJZ59DCaDJbTemiA+thS7g0Z9/P86P/CS4QiKeAJy+5NIph89m9jZdlAB8RTZONRWshUDHEkqA
	beb7Swcy69ieannhGAAhfFLa/nKHGjGGD8urMfy/kXKrufWaVQii24IMXHbkEBCXsLsNN3rWqZWp1
	mawCJxLBaEJTyREaa1MkkEczEwimyEkRJuJ5nF/VPd6RmlD8NXvlWvJoygF9MQNTas6VdYhvj6bbJ
	FG0g2ITA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upScb-00000002maf-2IjI;
	Fri, 22 Aug 2025 14:20:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upMhE-00000001sII-4A64
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 08:00:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A60E043974;
	Fri, 22 Aug 2025 08:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED615C4CEF1;
	Fri, 22 Aug 2025 08:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755849624;
	bh=3LSBrlgPclPcn4MCgtRigx2+6I/Y0aDUi3B5dRZXgJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHsW+l5lBzW6kIrQPVMAzO+pLHcaO9NHZlYPxnKMkHMJ4t0v1jWgeqNJeriGCTOXy
	 4mj7Yj0W1lhPZncT1Q1rcwbsRxk1frpx6p7fK521064HLZoSTKOaSv50jbwGhAff/R
	 IGcREZsoQUt7Fy2BogPc0NRiig+ip1MyOv3g5ntKq2/8rWKboO7f4bhSaFhujEu5CZ
	 PSfI/bxD8EFetgLxg7/grV6GwCEP0bCMmDdQfUc/FVg9Ha6gKVnLj846fyyFWodWhN
	 B02F0I1VKT99cWB6hfO4VHiOUqLVdHXNy+xBcWZ0KRY78b6KttQ2Z+JJfMSCAYO9Kh
	 018gCc3WKLGrw==
Date: Fri, 22 Aug 2025 10:00:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/13] dt-bindings: display: st: add two new
 compatibles to LTDC device
Message-ID: <20250822-gifted-messy-fulmar-1eab63@kuoka>
References: <20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com>
 <20250821-drm-misc-next-v4-1-7060500f8fd3@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250821-drm-misc-next-v4-1-7060500f8fd3@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_010025_049673_493FA1F3 
X-CRM114-Status: UNSURE (   8.62  )
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

On Thu, Aug 21, 2025 at 01:08:51PM +0200, Raphael Gallais-Pou wrote:
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32mp251-ltdc
> +    then:
> +      properties:
> +        clocks:

minItems: 2

> +          maxItems: 2
> +        clock-names:

minItems: 2

Best regards,
Krzysztof


