Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED945C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 09:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sj4XyUDt2nSA8SS+HepEZMb7jMhPBqpqhfbPXTN4g9U=; b=uQQv95oWugNS2K7iwLAbKMyzTx
	g8BW/L3QzxEkAcIhkpJ5gIKE7Bo0zDJKwVxjOoMuo0OBC99KX8JtwEdZwdh5wwHrNxi3tAT/en7z4
	0B/V4SUsOMv+Rpi0coGYCTeLt/Z08onIpZqaAM6aLjL0krzUrKDfM7+kQnmXhfhjBKKbQiQtcrubt
	A4iNXi3wLDxmgCpfBL4g+1i43/i0nZdyd0T63FEorpjDWev3ioTlDRnuAtTBmjr3vF+XVJxrYcWvd
	LfZCRmDBWyQ6bWGY8TvHUs6sJkWQzMRTw9W9jvH23RUjsUYzmS60DHOcJvp1HmflvaUJsTahZ4K55
	BwNRe1/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udQ2G-0000000F4qH-3DBV;
	Sun, 20 Jul 2025 09:08:44 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPln-0000000F3bN-1KGO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 08:51:44 +0000
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 652957A017F;
	Sun, 20 Jul 2025 04:51:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sun, 20 Jul 2025 04:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1753001502; x=
	1753087902; bh=Sj4XyUDt2nSA8SS+HepEZMb7jMhPBqpqhfbPXTN4g9U=; b=W
	vz/1Dq1VcG7cG+3BVGO0RxJqORb8keK1aLSyz0r4Yl3Z38qXkz8vHrCmx3oEFASr
	+zQRzsiQFMjFH7GK+7p+I4+055gccsgnQvGmfQOcygY3VbUfdiECk2mSefQW1rhV
	EWn4QQHuU7xddAw7ZxCqc0AvaeFFNpO7m2MIYqLdc3h1kbJCAmVZ19weMd5wlmZZ
	Krck5wAMM4nH8j+8tCjajDDLoPpbG18h7ZwM3Sysiso+Nj+i3sK/7kbWrKW/sZ4Z
	GhnhV17qUNY0rPse/dlRKDiodWVreE17fuiJL3lstRW4aGxtg3zUS/iWFPLh+BTU
	FX3eiohv5+oOycEd+IODw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1753001502; x=1753087902; bh=S
	j4XyUDt2nSA8SS+HepEZMb7jMhPBqpqhfbPXTN4g9U=; b=hc9as94Z9DJgmUPZh
	gXqGzQq9CEi1vURn6VHfiXgpQysoxrfaljyAWodFKMegB3tzKCkUrRRhCHfVjtfI
	pvQcUh0quwy7z0xmp4t1bbIKTz5AHQreU7Txxy3GN+6jW7wLsRXA7mQrOVcf7iHj
	0ZGseTQiXW/M28l11Bf0gi5Bm1SNu+KEKifVwkS5nVggIlrx3ZqWv+AaFgJmeK1L
	E9Ubq0P54bEjy2YOcuXCERwZW/A65YiL13FDViuayqZLofL2jQjSRGGs0uHIPne3
	FxOqSCbCR+QcPXFWQGP0F05t089O+yI7BCyTqQFEYJUrCNkBtj8xDE3hVbqqMYc8
	tJplg==
X-ME-Sender: <xms:Ha58aLXaykteGfTajJN_2folOxrtb_u_OjPie24Kx4hMyXklpF0euA>
    <xme:Ha58aOfYtZBz2a8hF8gqWTt0Ih_DYjJ6ZUrwi-w1sA_yiuSd4J5_nb6SYZFdAVSPE
    dIsbJSYOGynRO-Zjg>
X-ME-Received: <xmr:Ha58aBkwpxYQodq1usDlf_Rdc1HvrN7fp-9PTnQTAyUuB9_didn2tT5rzrWWRv52k5o472PDdV6J--QKADdToqyPsIciOg>
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
X-ME-Proxy: <xmx:Ha58aIAuca_ViTQUWyI1Nl31K1Yy_Fken_PmzpwOaILr3YblOHzp5A>
    <xmx:Ha58aLdKMH3ZVld8Zt0_IX9NRLtFpo9Q6bClp7_iq63LB6vpH7KfUA>
    <xmx:Ha58aL4_ESK5u3S-0a7JMFHJbvRivMh-P80t9pAsw02wNAsK-eQaRQ>
    <xmx:Ha58aNOhRjXtD77ENFx2CF32Qud8PulMEBRFIFFzzO5H1541BoUpXw>
    <xmx:Hq58aFxKuZAYqlbiA1icl9AJ4UvFd58KjHFiOvciFpGhWfTjlF1Zm2UG>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 04:51:37 -0400 (EDT)
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
Subject: [PATCH v2 06/12] dt-bindings: sram: sunxi-sram: Add H616 SRAM C compatible
Date: Sun, 20 Jul 2025 20:48:44 +1200
Message-ID: <20250720085047.5340-7-ryan@testtoast.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250720085047.5340-1-ryan@testtoast.com>
References: <20250720085047.5340-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_015143_404940_F04A9E58 
X-CRM114-Status: UNSURE (   8.77  )
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

Add a compatible string for the H616 SRAM C region which is
functionally similar to the A64 SRAM C region.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2: Add H616 fallback string
---
 .../bindings/sram/allwinner,sun4i-a10-system-control.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
index e7f7cf72719e..cdb664d1ec41 100644
--- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
+++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
@@ -103,7 +103,9 @@ patternProperties:
                       - allwinner,sun7i-a20-sram-d
                   - const: allwinner,sun4i-a10-sram-d
               - items:
-                  - const: allwinner,sun50i-h6-sram-c
+                  - enum:
+                      - allwinner,sun50i-h6-sram-c
+                      - allwinner,sun50i-h616-sram-c
                   - const: allwinner,sun50i-a64-sram-c
 
 required:
-- 
2.50.1


