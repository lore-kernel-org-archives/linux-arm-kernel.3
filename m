Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E94CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 19:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6JUAAbCTBvwCnu4g6ahUXqf01nw/ZXvZYL2etR6kYk=; b=OQDIkmA6D71NiDtlzpIBMU6eqL
	1NL/ez9HdXIP2LwZohTnlyz0wGWTqEU+KReprRqW6yXAUJOuBEPFeBj9U3Cxz/Ybo8qgJ1n3krrI3
	wrlmueVDFTUgGfljcojh0+2ylhmjX47Roq/irPWokG/rv7278DofHiXSHCOAO1fiY3L/h7bm5A9bK
	rGxr+31m6HCzCmPOamuUSAzS4rRjePRH8C01BHHciyqnOLzZNw/ZxYcOwx6/PwV+46YnsGC10Y6kw
	GYGNWtR7gebej/B206JBs/d6O2RJ73eS63aBElGV618gMRVML4NlUfe0Agi92HgVaNyf9vqP47vgI
	j4amiXsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSiT-0000000EdiL-22Md;
	Mon, 27 Oct 2025 19:17:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSiS-0000000Edi4-2tnM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 19:17:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CA3661ED6;
	Mon, 27 Oct 2025 19:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833DEC4CEF1;
	Mon, 27 Oct 2025 19:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761592635;
	bh=mmWNVH8Z0wkoOiWVvjxfBmmdO0OIAoLLR/+tC4OGlGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fg5tvawNQQxKOnGSc2B355zaBy1wf+dUNWGGaKWpOfFCsBx1AYXKLA5NrP0zB5WUB
	 p00fp06Q4LoCtStQwnKmyFGQ2WqTqmQqYcKvxAVFtb72Cavt5zLXq30rX1DPFIZkzP
	 ISwdQgADdznR1/S5ZJPqRYdzrEO1wRTTS96pqYTBY5YpN1O83nJoqyX45Ooxc2XXO2
	 +5NmQrKOSxsu9OCCfW45dQ05DQFExtyfLD1gkoPht6ICeK7WAoGBElpiO0aU4kwP2h
	 F0vuo9hTw6nX92Pw8z82P6MhtDPnX9L9zEseLoGlv6bdgm8Z72D2vsS5WdBTjQ5R91
	 kjQhAlGxWseRw==
Date: Mon, 27 Oct 2025 14:17:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, UNGLinuxDriver@microchip.com,
	Daniel Machon <daniel.machon@microchip.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Lars Povlsen <lars.povlsen@microchip.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH net v2] dt-bindings: net: sparx5: Narrow properly LAN969x
 register space windows
Message-ID: <176159263113.1438645.11402990432058741672.robh@kernel.org>
References: <20251026101741.20507-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026101741.20507-2-krzysztof.kozlowski@linaro.org>
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


On Sun, 26 Oct 2025 11:17:42 +0100, Krzysztof Kozlowski wrote:
> Commit 267bca002c50 ("dt-bindings: net: sparx5: correct LAN969x register
> space windows") said that LAN969x has exactly two address spaces ("reg"
> property) but implemented it as 2 or more.  Narrow the constraint to
> properly express that only two items are allowed, which also matches
> Linux driver.
> 
> Fixes: 267bca002c50 ("dt-bindings: net: sparx5: correct LAN969x register space windows")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> No in-kernel DTS using it.
> 
> Changes in v2:
> 1. Fix typo in commit msg.
> ---
>  .../devicetree/bindings/net/microchip,sparx5-switch.yaml      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


