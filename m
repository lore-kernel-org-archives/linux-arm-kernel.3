Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F410C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 08:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwYADpAxOe6tYr1iyFQaPotfS5DPPpONeNi718LEzqw=; b=R15bRdHlhvXPg1m22Z7jqjDlKt
	uj1Ih6OqQC34gYV3mtdUdtUCh884rxcEns7h0zL9n6pSKSjhQrS1Bz808sDllLCqceE0eKRZpwAKu
	OyfvatgpV8wRF4yGgVHUnxxe3m/ib87RIA/tUdsSNBszYVm2Mc3T2qbEAmOg7IqUEMSlwipckq/A9
	+G73Wx+rtLehLAsNaqkmqVUIpa5Qi/yeF9VfLdmEXtDwG6WlKaRTEG6SgYxn7YSo7B9fVSg9poU7e
	djOxCqsr2hQix8W3Wf9yJ3Q4VWU35t6OInnuXFcO8Wesfrtuf+xTywtuDsaAGNqcCQIytT7pewYQs
	IyogSkPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzA69-0000000HHnJ-14Lr;
	Mon, 31 Mar 2025 08:02:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzA4Q-0000000HHeD-3Hib
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 08:00:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 44936A43002;
	Mon, 31 Mar 2025 07:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB81C4CEE3;
	Mon, 31 Mar 2025 08:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743408033;
	bh=9lhSfPox4E2eux54Gtxkrw5LjnGqrUCdXCq0YD5C+1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nXQM5M0t0uFbQ/BP15/z10c6ah0f32+Sul8vazqTQ0dzfih1yE6XX9jLQ/bUVmeUZ
	 pIzdPNI4MBmw8/Ak3P8ynzn73W3qTf2LdCcWd1RZoOx27jR3vaMvqIFpcNSMYBFKRz
	 dGxgvTX25wH+lRYRnWx5hx2HdKqKH2LmfAJOZUjMzRfgebUyclR3fRiFMP6ZbeVgXu
	 sKos25JUz+y9KXcjJZTaNeGsg+6TjBuTgjGUcl6Y2x8GJMEOyHDm0crWDPdF7jAIbj
	 faz+A9R3Oeizldd49VR49QnW5eGnRYvvj/vxwBYBijQXRcXjkklHhQfh+T8ITaJVlb
	 nC72FfYxEeZCg==
Date: Mon, 31 Mar 2025 10:00:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Olivia Mackall <olivia@selenic.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH 02/12] dt-bindings: rng: r200: Add interrupt property
Message-ID: <20250331-hulking-orthodox-moth-e7d47e@krzk-bin>
References: <20250328-bcmbca-peripherals-arm-v1-0-e4e515dc9b8c@linaro.org>
 <20250328-bcmbca-peripherals-arm-v1-2-e4e515dc9b8c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250328-bcmbca-peripherals-arm-v1-2-e4e515dc9b8c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_010034_883187_AF1AD400 
X-CRM114-Status: GOOD (  10.42  )
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

On Fri, Mar 28, 2025 at 08:43:52AM +0100, Linus Walleij wrote:
> This IP block has an interrupt. Add it and add it to the
> example as well.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


