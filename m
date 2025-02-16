Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5509C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 19:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJw/apkD9aGn51IELkXxp/idESG6pC1H6gAPScSoptk=; b=LwPjZsvW7Ut7NXHI3Uuq0Dbmf9
	lzu/IzC7NGRYQPMPFbcpzkD4X77DdnxJen+iJ69SsynldiJWzvN9KS7fmOQAdB5dfXxHTmK/etSjg
	k8TJa9z6cqGvaZbFzOlJbgV8LqrCRyorHjFtjkcXmM9wK1kJQzRIQdZGSrNNwes3Cp2pbYT4n4XS2
	hIbcW9sms129Swl0zt/W2xtR8YiGxCHd5a+cpmqBh1g5iXKeX5ePljLkbqM0olNnjilkyG3KgCTcx
	KXd/aA6+s8xQDjQLEUpV0uuBjcTJOezNlHhffhD6NP/qz8yEgUrQX5UlsB3GDtnd+Z6N8sc1O8jXX
	prxWKTHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjyW-00000002Qc3-0g7n;
	Sun, 16 Feb 2025 19:06:44 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjYt-00000002MRP-27a4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 18:40:16 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 433FE25400C3;
	Sun, 16 Feb 2025 13:40:14 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 16 Feb 2025 13:40:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739731214; x=
	1739817614; bh=BJw/apkD9aGn51IELkXxp/idESG6pC1H6gAPScSoptk=; b=K
	3iTI4vmFvxu3qmPRAyN6NKLbUQDs+uvE4PDgBnT1JTOFv+Dki0Id5371AYeYugbB
	maKBucXiOYeXE2qw420KZAhgAyyutpajeyO0padtMIs9cBxtf3GKeLUq14aZpU2D
	qLNDvPi47KymMjoR1BxX1lyteZPUzQy/NPioDGpwcNb7jWXqUMJxQkeiGVEAwoRb
	WfEbqvZDu3ooA+mbD6/kQNIVGw64MMuArZ3Zb4VvPmQYfRcO4Agn1VOyeI3IquFp
	N7h5mbwQpjOoMbdkkjBQJs4ZmxlfIhaV8lkIFjeNvfCvz+nhuMOo3LfkrYxrnCoB
	05n8eo1PcvBVycIMIo5vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739731214; x=1739817614; bh=B
	Jw/apkD9aGn51IELkXxp/idESG6pC1H6gAPScSoptk=; b=H7uFJplDX0y/cWnUW
	8sskksipym/7VyiwoA+cPGFR6fCMDRL9TmA4aHz0oi8tDzOdrTdwFeRH2e5H0VCW
	ojcR32RT5IYoUCA1m22CXvmfSLqspk0bxtqZZpp4d/E+0nAu0S/86H8lQ4kZjQmg
	xu4G6XNOoopCwMbudpCLJflJLkf1Ti/OfJnapjLh/ppF+sT+BnaAPPWoBnFT6cun
	ixUk8LBFyZnWDUwUfB5q5DPm4QrYuuB4CIXHQJVvIdo7q7O58rrJb4EmYrAwRoHK
	+npJ65QQfIhRpdvgjXso4aZ/JVBhLZpepUFomdEzqbp94ypsm+uSjDmlhxs+tPNN
	87Qrw==
X-ME-Sender: <xms:DTGyZ2N290orpzVL4IsITh6Hu_ZwVg6Zz-dYDkqp5X7oBprfQLcVrw>
    <xme:DTGyZ0929IRlCJFfLSiTNJzpOp3oP8eOzbkbCC14F38pbSZmLI1k3eIzT7PfBbggd
    PSyDyqlgJMsxb-ABw>
X-ME-Received: <xmr:DTGyZ9SxlchJi2EFRaaSEQDd1Pql2KZ8AuufblLadY20txgKpid8jBH_aXgijh8w80hF66sOy6g8vW7--L7LTOqrWkF2ClTv42AeWPcqgF_s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:DTGyZ2ub1PH5L9YG_AauZQZI8QPFsXA6Jj5PQH9Dp0xCG1RHS5ydgQ>
    <xmx:DTGyZ-cSEEhaTzct0DaM5sv0jDZ-ICWoJa23iqqZrMHCZ-mC-WlpVg>
    <xmx:DTGyZ60yrl-NUxeZgpaysArIa4YE7ficiL2YPqsIo01xv9xNUgiykA>
    <xmx:DTGyZy-TzG5rZISRZQ0eVzy8hlZ3N2X-NXYC9rj5JXXubO0E1dKHhQ>
    <xmx:DjGyZ9kytfZviclP8KqFbYkQpPb2nluA6HKKlZz_JGOB-nyPLClDvPo7>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:40:06 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 20/27] dt-bindings: allwinner: add H616 DE33 bus binding
Date: Mon, 17 Feb 2025 07:36:20 +1300
Message-ID: <20250216183710.8443-21-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216183710.8443-3-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_104015_600590_510FB258 
X-CRM114-Status: UNSURE (   9.12  )
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

The Allwinner H616 and variants have a new display engine revision
(DE33).

Add a display engine bus binding for the DE33 and increase reg maxItems
to 3 to accommodate additional register blocks.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

---
Changelog v1..v2:
- Correct DE2 bus enum to reflect fallback devices accurately.

Changelog v2..v3:
- Separate content into three patches for three separate subsystems

Changelog v5..v6:
- Increase reg maxItems to 3.
---
 .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml  | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 9845a187bdf65..317a27cf590b3 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -24,11 +24,14 @@ properties:
     oneOf:
       - const: allwinner,sun50i-a64-de2
       - items:
-          - const: allwinner,sun50i-h6-de3
+          - enum:
+              - allwinner,sun50i-h6-de3
+              - allwinner,sun50i-h616-de33
           - const: allwinner,sun50i-a64-de2
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   allwinner,sram:
     description:
-- 
2.48.1


