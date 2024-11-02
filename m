Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D100CE677EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 08:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CxnydXbwJ5eq9YUDX/EDzhIGvXa8fKehgoMmewXSQHs=; b=2TzSL+RfQOodqg96gCmRxNz5oM
	hYeTV54k85lhPMK5v6KxtR8jWsn+9v5Wgc4noPtxcfbrYsSHFzHPPYUE+6QHqq6wpGbNuCTcpcmO9
	uq5XlrXbY2Bspf6JYFYt7tx9oVTwYREF19XTqVlghy+DCwfLWY4sMREituO1YJ/lF8Ql0ETb/qfY1
	9lxXDWg2elZjs65TXziqSITl9szkDq3kJr7vaUxMuM68R8J7rQsnhhiZWVvZMf/vPXHUWMMHtN5WF
	vc/HUBfEimCQa8X1ER8aIWukf/ETjllZfUG+mGpnlipdt8KBetcFZSNStc3xvUwifNiyi0u1rdtzV
	FO4AGoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t79dx-00000009JTz-0TOV;
	Sat, 02 Nov 2024 08:38:01 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t79cG-00000009JJz-0abR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 08:36:18 +0000
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id B17BE1140113;
	Sat,  2 Nov 2024 04:36:13 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sat, 02 Nov 2024 04:36:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1730536573; x=1730622973; bh=CxnydXbwJ5
	eq9YUDX/EDzhIGvXa8fKehgoMmewXSQHs=; b=TAJdI5nAD6q3HluHLkaBXGD9f6
	gHJCALc9zMPzV0vRb8UB2lYzPr979fqIkVsoqGYkPuKKDo9X9K8s2NJnNu4UH6Up
	Kq2jUJ0GAsU98bTEUM/jXcRw95wkorCLioREZthUv0yPOFO8ooCSv0fem9SIcRP/
	ANX9Wv+pStJ0ogH/8TmuOVnFPNyeW705fsPZWlfq09+hHf6x+rgYLp2ZABl5RyI7
	6awdEkvJKk3Spnb7XTYYUTlDxkturI5Yn/8sMBY1tZWkKZ+NqIzlkpfvU1s2jDih
	JcR3MIhw4ZHa91k/sSLaXnCQDfXerIcKCR8ltgLt64BugfEjuUti/rgI1HSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730536573; x=1730622973; bh=CxnydXbwJ5eq9YUDX/EDzhIGvXa8fKehgoM
	mewXSQHs=; b=HuP631SAvyeeZHWs+JrtVJWwL00bMZ0gi+cQns6gFZM2gu4S1PK
	rV3ly0VRs9LsvpZhQ+coufByMgCmiWjyOJHtBITCHPJ+z1qjP9RU0jdbULCYzAGC
	DefaDb6KMwPKbQeAEO4GyYU9zGOPKDAWJMkxTWK4a5Y2pPMTRquoPP+N1/ussHth
	CwG0dC4V6RNJPV82sgl4+ZJkfjzHzfS+m4N0zRdGLtjhTgyJAPnvY3cQuLqEIv8Y
	+GrwkLniHAnafbIyQ6qbDDAGiS7ChdDqPsF7+VBPkSRM4vSGm4tQ4UqExJqV4EDx
	tJrKqPUW3/pysECFCqFnjvEzAEYAdpKKTLg==
X-ME-Sender: <xms:e-QlZ_a9_L_-1qdndBi9EyVE1RfvY0h-Gb_COzmZPWrKvuXouquq0g>
    <xme:e-QlZ-YBBowAHMAQ_SE73I4PT1VdvHrDj1RNu70FpMsnicmu4P3WIH-POWueb9Ka_
    S5h-Vnt3YqVtP0SbVs>
X-ME-Received: <xmr:e-QlZx_Lqy8r4Z5fAiv39L3BOYL7MpJL_hUn7GUl6K-1kcUMjVABIUxQEsu0-fhZVtvGN0BmI4lyJhL_0qYObFVjQnWzyrznrT8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeltddguddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdej
    necuhfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqne
    cuggftrfgrthhtvghrnhepgfduueffleefkeegueektdehkeejtedtffdtudejhfdvheet
    gfeigfeltdeufeejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgv
    thdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    htohifihhntghhvghnmhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrhgtrghn
    sehmrghrtggrnhdrshhtpdhrtghpthhtohepshhvvghnsehsvhgvnhhpvghtvghrrdguvg
    hvpdhrtghpthhtoheprghlhihsshgrsehrohhsvghniiifvghighdrihhopdhrtghpthht
    ohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprg
    hsrghhiheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:e-QlZ1rCGgyYwIm0MvtZUxAbZcABlPTgAHcfvQTlzJqOAJ4-tgx_Yg>
    <xmx:e-QlZ6pgPaU9Pjm19b883M6R3UeFUufranZFbUrX4Uon-jJBw0Fp9w>
    <xmx:e-QlZ7SAmYmre5LCDI_AdOFSS1T3dfKMYdJ4RDnD04sOy_ONYOexIA>
    <xmx:e-QlZyoWi7B9Q94K7a402vdT3F8InxhnTcuPL2dc_bFRvQGospOBOw>
    <xmx:feQlZ_7_vg1vU6QchmWwft0O504JlUpp_2PPFt47138o039zjUeq9ck_>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Nov 2024 04:36:10 -0400 (EDT)
Date: Sat, 2 Nov 2024 09:36:08 +0100
From: Janne Grunau <j@jannau.net>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: spi: apple,spi: Add binding for
 Apple SPI controllers
Message-ID: <20241102083608.GA308136@robin.jannau.net>
References: <20241101-asahi-spi-v3-0-3b411c5fb8e5@jannau.net>
 <20241101-asahi-spi-v3-1-3b411c5fb8e5@jannau.net>
 <46b31874-9fe2-4534-9777-816765a265b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <46b31874-9fe2-4534-9777-816765a265b1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_013617_186934_701E6BF3 
X-CRM114-Status: UNSURE (   9.54  )
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

On Sat, Nov 02, 2024 at 10:36:56AM +0800, Nick Chan wrote:
> 
> 
> On 2/11/2024 03:26, Janne Grunau via B4 Relay wrote:
> 
> [...]
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - apple,t8103-spi
> > +          - apple,t8112-spi
> > +          - apple,t6000-spi
> > +      - const: apple,spi
> Apple A7-A11 SoCs seems to use a Samsung SPI block, so apple,spi is too
> generic. Fallback to something like apple,t8103-spi instead.

Have you looked at it? This one still seems to be somehow Samsung
related. See the previous discussion at
https://lore.kernel.org/linux-devicetree/d87ae109-4b58-7465-b16e-3bf7c9d60f1f@marcan.st/

Even the A7-A11 SPI controllers are not compatible "apple,spi" doesn't
prevent us from using something like "apple,s5l-spi" for those.

Janne

