Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694E3C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 09:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhw2ewrAOF+6/14Z8vcFUEVAZhS4P7T9BPyZIX21AVU=; b=uIiZaHM90i8QmYLjYsN9oFxcyA
	+5fKRykdU6VN6LQ2KxbqxxQvPyzmJ6d4iXgPNqzKGdTrbgeRpoG3QOr/sIWQMNPrpaq7SiiZgvAZx
	lVQ62WYdwcctHOLDR7U1u9m52iIfkNk5g+J5I5qb4HUtUyvyphGSXmxWsqMIReAMepKQf+OwhIqsR
	ieEDOfAH7d1x7RA5dtJP4oFXAsN/u6qUASu0h2jnDRkQ0BCK+NaxKwn7MHRUlPzsOORbfLXLy5Xti
	vPLX8LNyOyg5SHKk4mbiDzk4Z9WeI3wO9DHf+7R4YVB9u7PlgU+2Eb2gsRpwKdb7rcPdqrmeU+f4m
	e0IJ4IHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPv1-0000000F4IO-1CMo;
	Sun, 20 Jul 2025 09:01:15 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPlW-0000000F3Yx-3gxh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 08:51:27 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id E79461D0013D;
	Sun, 20 Jul 2025 04:51:25 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 20 Jul 2025 04:51:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1753001485; x=
	1753087885; bh=bhw2ewrAOF+6/14Z8vcFUEVAZhS4P7T9BPyZIX21AVU=; b=S
	V5nWdMg8nJ86MWTl3UfObR8Q/l2vdPIx6sN4CMQcaIeQ1WUbIS3f7Hzd0F14fqkw
	QQdAp146U5ntypv/YmX7pXfTfB4/0uX0YUUoOeo58PFXuZ/O0B2KslMeO/pKEdQ/
	MDAz6Ig8Knrm0V9HPHZ3vBFTq9Zf/DRjcMV8ncNt/r7gklZ9/PNjALIoIJW8zYoX
	g6B/s8HGoN0GJc4MRyQvjZxQ7w1NNjsEKye6tXC2c5hfEgywIWuNJeN9OzXMdhDp
	LPYeoguvLhXriLOxqoQvO1s277PGZpzKbylSEH1+Hd23oBtIZGS4pYvwacusJ9Dk
	N+GyEOfrobMhmcAhp9wlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1753001485; x=1753087885; bh=b
	hw2ewrAOF+6/14Z8vcFUEVAZhS4P7T9BPyZIX21AVU=; b=brCWYQyLLvQSqWD4C
	BMVn2wPMiB2zWF4L5dFZ6ras5PrhXp5uF9P3GfBEQzsD/E9XIECsgHvf7fHmvC4V
	GnhGDvB2dvWPv9kmVGL2aj3z0oBzq2PVcYsKNVa4SJVgLgz0VMlIVzWxkfhXDPE1
	C4s7JkKd9leBIfcplGGwzvu8LOx//tM/61VGtgjgoVYpUMyh4fH17GJKWgc5L8Ij
	/lk7XfTcnAwRYr5oosjsIXQXcz4qpP9YqLz8YLA4WwpfaeL1GJx7aYM7Cz8SUOK5
	osCHr5wXncZ/YfkQSLrw/88wHWxSAlPS1gvVUkRFBUZF5pgzSZwmyQN39pSYTlzN
	P3rIw==
X-ME-Sender: <xms:Da58aJBogR5BXCBXsTVxIK6MoIQn7u9LDP90-pZa5uIx466qNW-kIg>
    <xme:Da58aCYBx_vPx-eI4wPkgRYtdN-7kCDtNZGI_0BBfHT7CiBsxSugSRfb_qYk5T2SF
    1gCxSe-nibbhLWH4w>
X-ME-Received: <xmr:Da58aOzsMdPbjCldiTuvBF87yGRnmady1RTDHgqrazQ1wEr-ptOJP5jYGRmPAInksXuc6wFAhQN_wfxt_xWQka4lOPar6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeikeejjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggr
    lhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvg
    hrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieeiheet
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrg
    hnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphhtthhopeduiedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgu
    theskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprh
    gtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphht
    thhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheprghnughrvg
    drphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghpthhtohepmhgrtghrohgrlhhphhgr
    kedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrih
    hlrdgtohhm
X-ME-Proxy: <xmx:Da58aFcmrahDsfz-Bu24NfImZ28gP85f88VFqDYlcV-k0mFZjht_Lw>
    <xmx:Da58aEL7l2gLbInWtHp2XcA5qZomSPyT4dJu7wwoDiZytKAX7qfu-w>
    <xmx:Da58aO1M-M-_0lOmbo89FqjtQ4HNCWRBX9Rzi0B-B2nX6_4o61vnUg>
    <xmx:Da58aNZ4078qNEneu7z4i8qehIvYuCqmxFFP-5Mb2ZOHCiA9WU1sFw>
    <xmx:Da58aK8CGVoy-A8FjXiW3vWb2y2Ov9I7Uf7Vmc0e4cFg5CGJS14J3EAT>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 04:51:21 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Ryan Walklin <ryan@testtoast.com>,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v2 03/12] dt-bindings: display: sun4i: Add compatible strings for H616 DE
Date: Sun, 20 Jul 2025 20:48:41 +1200
Message-ID: <20250720085047.5340-4-ryan@testtoast.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250720085047.5340-1-ryan@testtoast.com>
References: <20250720085047.5340-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_015126_968957_F5FDC17A 
X-CRM114-Status: UNSURE (   8.88  )
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

Add compatible strings for allwinner,sun50i-h616-display-engine. The
device is functionally identical to the
allwinner,sun50i-h6-display-engine. This is added as a new device rather
than a fallback as all other DEs are modelled this way, and the device
is essentially "virtual", with the relevant functional differences
represented in the mixer and TCON components.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2:
- DE compatible added for H616
---
 .../bindings/display/allwinner,sun4i-a10-display-engine.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
index e6088f379f70..117426862430 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
@@ -65,6 +65,7 @@ properties:
       - allwinner,sun20i-d1-display-engine
       - allwinner,sun50i-a64-display-engine
       - allwinner,sun50i-h6-display-engine
+      - allwinner,sun50i-h616-display-engine
 
   allwinner,pipelines:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-- 
2.50.1


