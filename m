Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D966D41C38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 13:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zA5C5PNW0/uFa37xkLqcgZ6/TZ5xC7fDMBu4P7YKTz4=; b=zaxtBFKBfFdO6MQWMTlzFIteCU
	y7iq1fl5xcAtxmDIko6zH8KDwHes6nKuDxwAxDLU/ijsy7c5jBfkfpLIlkoQiRThCwC0C+p4hG7E4
	r2eJosSmxsLxMTAy+xlr4oTDAthwYWUDpY8T6XFWzDAifK+975OXB7q7M7F3z/S1igm7GQAyi73DC
	mUBxKztHEbJliAC8C8MsOT75invJ0lUTUNsZb9pePZax0R1xN/tO0Mfb7MY+e53f9QuZO+oFWkea3
	i2yYSNsE9eMuzfp64RTHG7IuYFi4F2b49fDdDiiDDZ81+nucxQ0kus/zS5DhV0QeIuSOwso8Ch20z
	fRB+SFnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgrb-0000000GeWl-1mJL;
	Thu, 11 Dec 2025 13:37:47 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgrY-0000000GeV7-3j1C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 13:37:46 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 40E477A0140;
	Thu, 11 Dec 2025 08:37:42 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 11 Dec 2025 08:37:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsdio.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1765460262; x=
	1765546662; bh=zA5C5PNW0/uFa37xkLqcgZ6/TZ5xC7fDMBu4P7YKTz4=; b=o
	82a1GFuLupdi2f3DTNtDSHpDK/z4t0s0WgGt/7mZI7mld2Jsm5n+VPZS15R6/CpI
	habdwW7aZtZHS4z8uWuHoqpMEsbA3lgXKFiV/soZ8FE9Caq8vcX77TPvTh2w+5Wm
	1Qdx5OIJtrKXtVOQC7XDtFfErtcI97N4sqccZwSE4WWCQJ2uRstNvO1t3FcubTXC
	NLEjEjyuZkQE2IgP28TEmVLFwrEesg7y5xUTb2F5Nb54oRi5GBcQfGUcP8oDi8zH
	/ZcGDiQuoVNub+W1aQQITBQ0FPqOlp8pntCIUOZsOPM6sbfUHtOlxxL9PZS+rM5y
	Ql2A/2p+fAu2jK+mIZsMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1765460262; x=1765546662; bh=z
	A5C5PNW0/uFa37xkLqcgZ6/TZ5xC7fDMBu4P7YKTz4=; b=ikPmmeRBuksPJ7t73
	0XKq3myvQGmH9nND3o5Lwsq5d7q2jkBulKx/MA+aOLxWKdBudG1iHYnFqibJ9PA5
	AD7bs5G5oQrZmRccokvhfEXPYaCd2NMnKGtPc+awUA5Q99qCd/mRcrRL24kaG41H
	7ZcWjZHe3GtwXA+U5LuTXvsKo/PLUQXZGMhkSSB0ugColy78sahnydFJTMfBYIZR
	OyRbNmVNwnjIiJuXcqkI9Tq3KuPu/yFzGPDFllBn9VhD/S7+OWnyYdLZrxhV5DiH
	wJOFRsqdgUn7KoBlpVZjDwvFYRPNuslSim4FE0HTDuLwNBgNzjHDSfg9riRjgzXc
	r1fyQ==
X-ME-Sender: <xms:Jck6aaOV1zUdDk9toNH5FSHOE6yMYucLcOXh58jv2A-Zw4mjc5WKLQ>
    <xme:Jck6aVp0KfdAWZQJg9DHxc_c-BQqiwkSCmnG0sKHy_UQXe7Q-C_9kYZ3xOfj0-Z4M
    qPx10pij1eGLOKKQGuK59SsGAKJhifFshup3U0nhynrFpF7TCUeMug>
X-ME-Received: <xmr:Jck6aVJJFUSBf91RyGj5n8dviIr911ioqYLwa2MIZxw86CFzVOrk3egR43wZlZXwnh3NgOKvjZw0kcST>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvheeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftvggsvggttggr
    ucevrhgrnhcuoehrvggsvggttggrsegsshguihhordgtohhmqeenucggtffrrghtthgvrh
    hnpeegffeuueelvdeggfdvvdfgtedvudfhfeekudekieektddukeefteetieefvdelfeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrvggsvg
    gttggrsegsshguihhordgtohhmpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodguthes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhrtg
    hpthhtoheprghnughrvgifsegtohguvggtohhnshhtrhhutghtrdgtohhmrdgruhdprhgt
    phhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggr
    ugdrohhrghdprhgtphhtthhopehlihhnuhigqdgrshhpvggvugeslhhishhtshdrohiilh
    grsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Jck6aU3XTW4kd0xBwyxkgQxf2XLJ2Wzancykkprx9A1iVmAflHxKRw>
    <xmx:Jck6aWUnB-94On1jEB9N69xDrSruwolT75zLXxzPuu7MHceJdd8o4w>
    <xmx:Jck6aXzLDEvG24AZR6vdTmWnRyZnlbkLMtlFvm8NiOEXG93LDfdYyQ>
    <xmx:Jck6adyT_rD1hemS8dLt_9j3vLGNEss8qWF39WYCP6_LLxZcc2pY4w>
    <xmx:Jsk6aYz5kqByYQ3y2L47BPq8lloE7ZLdj1tY10pamoqm2JDMXF7nrxIH>
Feedback-ID: i5b994698:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Dec 2025 08:37:40 -0500 (EST)
From: Rebecca Cran <rebecca@bsdio.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Rebecca Cran <rebecca@bsdio.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: add ASRock Rack ALTRAD8 board
Date: Thu, 11 Dec 2025 06:37:18 -0700
Message-ID: <20251211133721.18269-2-rebecca@bsdio.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211133721.18269-1-rebecca@bsdio.com>
References: <20251211133721.18269-1-rebecca@bsdio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_053744_963952_B6EEC386 
X-CRM114-Status: UNSURE (   6.79  )
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

Document ASRock Rack ALTRAD8 (ALTRAD8UD-1L2T and ALTRAD8UD2-1L2Q)
compatibles.

Signed-off-by: Rebecca Cran <rebecca@bsdio.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd1..aefad2d02993 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -34,6 +34,7 @@ properties:
               - amd,ethanolx-bmc
               - ampere,mtjade-bmc
               - aspeed,ast2500-evb
+              - asrock,altrad8-bmc
               - asrock,e3c246d4i-bmc
               - asrock,e3c256d4i-bmc
               - asrock,romed8hm3-bmc
-- 
2.47.3


