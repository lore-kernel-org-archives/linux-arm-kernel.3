Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355BBCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 17:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vlYBHxAVQ7yizs4lgoaidrJZSwfsP97zJRnkQ0WRVsQ=; b=rJvw8n2ipEQEBW0J5s6BBhGGWg
	au/ccqO/kuwkIUvJt3gM2sQJDApzPhRR6hpw7Z7PF4LFOZuysjcJZmfaKix3cTYvkIKR6HQZZWq6u
	1wtcIbWgv/II9ZgmVpGrVV6Mwq7B2HMClBpPxKvggyHSHVfjUv/aml5/KjjdouI5rkUmIj2SjSFH4
	F1dgf4N+hBJT//Ylm7I+RhGYs3eYdcxeQMXeGiz5VpYptHnYQRJkrZ3dlGQV89eRNu+jPFINPbKp/
	9Fj2YPCDMVIzRL7KYJvFgoE0iHa1P/CO0JXN/VlsHRo2j8+pg8KbcsluDKqoJ+Frk0qiVQqIegAn6
	l9SSX6iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfeH-00000001agh-1QiA;
	Wed, 06 May 2026 17:03:01 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfeF-00000001ag0-2k8V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 17:03:00 +0000
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 71A247A014A;
	Wed,  6 May 2026 13:02:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Wed, 06 May 2026 13:02:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rembrandt.dev;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1778086976; x=1778173376; bh=vlYBHxAVQ7
	yizs4lgoaidrJZSwfsP97zJRnkQ0WRVsQ=; b=gh2QAZpBOhJc3bwCUzbt+dYRzd
	peSOEscHcq1+Cvr0XylpAn8+rHvIrZIiXT9xeiLkQPf3LXbvPx98ey+wxYuD72nE
	qvMbZ2bZp0Q/5Iqn+KWXKi0aSQVvlaAuGp7GqHJik2gLGRjvjHJsFL0HoDH7K/hO
	EHmn0EPka+tZBSAhpYvj0f1pz7LOURxKTA2VGiPh7KSR1/zTCSIDLaxwSmcEH7GZ
	tG3ZYYBNwFTKqKBPrs2r6qDyEDxE4S8PfiaKeeRRkdyEQnYY+7a0vOLxZo6D98ok
	gJWaYHOz9bHW1jvtd1rv4Ho0lylINW+a+fx0aU5MAFSRPz4CTcQ4OrSnpTIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778086976; x=1778173376; bh=vlYBHxAVQ7yizs4lgoaidrJZSwfsP97zJRn
	kQ0WRVsQ=; b=Q5PwvWySL7jilgUek97bW4Anw54Dj7LxCP/TeQn6jYL2NcNst3m
	6SHPer/4JhCjFcGyrqYIQ7korXwWWFZqgE6mza+00eN4R3uhCG7Pr3Q/9zpB8Q7P
	OGfc1fS2Dbs+dZZ6ltF6aJiRssIPNrw4ay4XenODeK3bhHCPT8ZoxUDJlhbYRnEI
	H89KWF8sJtHnBcgU+P1vYtq9Gz0mPVJIlb32T2o8jUm18HJZL1ovOif8OS4qeDBl
	1sPZlmB9bBmx8fRjO5N7HQbWcxZmbFaldl/za6cI7sRWbkOvce4sHRfsloFL91WZ
	6p1eOPpHHjj7bF8fojAhJ3OOw77RrUpto5A==
X-ME-Sender: <xms:QHT7acZHmd4dA1TyFSOhgRQd2Z-r86gLw48XpmegwXbWsBvA1v_HCQ>
    <xme:QHT7aTZx_zzNxqG_3HiZLJzwGQU9HhJm2FeH25Ey9wDKl9Ww44kcDqynsmkzmYZf1
    TjOXSn_9uMZ26CSPk7VNQwqKrvUHdxWCQG7FS4NtQxpjgJNQ_Nz>
X-ME-Received: <xmr:QHT7aZIIBS3JC5XfrM_Rl9InpKJ6byVO9xuZwwrPqPbhXTBWFGoHBk9PkXrniFheCb2n9aEWJvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdehudegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptehnughrvgifucft
    vghmsghrrghnughtuceokhgvrhhnvghlsehrvghmsghrrghnughtrdguvghvqeenucggtf
    frrghtthgvrhhnpeffuedtjeejgeeuuedvueeltdejtdeugfffvdejueejkeeltdegteei
    udffgeefvdenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgpdhkvghrnhgvlh
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehkvghrnhgvlhesrhgvmhgsrhgrnhguthdruggvvhdpnhgspghrtghpthhtohepkedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtoh
    hnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushifsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishht
    shdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghrnhgvlhesrhgvmhgs
    rhgrnhguthdruggvvh
X-ME-Proxy: <xmx:QHT7aXuyI2Z0KdfhLTnA8E2YDBTCjCEEXBN0wmuK7xvUNMpTFOq0og>
    <xmx:QHT7aVVVD0r_AlYNZgNsnOzYsBMzf21qKd1kgpphfnNTOU7dtEiyeg>
    <xmx:QHT7aahoGr1EdhR8u729_4PHYbx6Bn70_oiywiwu8ZC2RcZ1Ona3zw>
    <xmx:QHT7aVqvpepcKsJH12TvOMaFrVP5U0DYO3smONV3pzZCK3haFCdTwA>
    <xmx:QHT7ab6vyIS7tS0zJisC7j1Pu6Cd6YIFrkrHH86XWv2cd6iWvdDGH3XX>
Feedback-ID: iec564b6b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 May 2026 13:02:54 -0400 (EDT)
From: Andrew Rembrandt <kernel@rembrandt.dev>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Rembrandt <kernel@rembrandt.dev>
Subject: [PATCH] dt-bindings: arm: st,nomadik: Convert to DT schema
Date: Wed,  6 May 2026 19:02:36 +0200
Message-ID: <20260506170236.2610955-1-kernel@rembrandt.dev>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_100300_147842_0156B30F 
X-CRM114-Status: GOOD (  14.89  )
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

Convert the ST Nomadik boards binding from free-form text to DT schema.

The binding documents the Nomadik NHK15/USB-S8815 platform compatibles
and keeps the existing example.

Signed-off-by: Andrew Rembrandt <kernel@rembrandt.dev>
---
 .../devicetree/bindings/arm/st,nomadik.yaml   | 36 ++++++++++++++++++
 .../devicetree/bindings/arm/ste-nomadik.txt   | 38 -------------------
 MAINTAINERS                                   |  2 +-
 3 files changed, 37 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/st,nomadik.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/ste-nomadik.txt

diff --git a/Documentation/devicetree/bindings/arm/st,nomadik.yaml b/Documentation/devicetree/bindings/arm/st,nomadik.yaml
new file mode 100644
index 000000000000..9a6d1458cad3
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/st,nomadik.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/st,nomadik.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST Nomadik SoC based Boards
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description: |
+  Boards using the Nomadik SoC platform
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - const: st,nomadik-nhk-15
+      - const: calaosystems,usb-s8815
+
+additionalProperties: true
+
+examples:
+  - |
+    usb-s8815 {
+        ethernet-gpio {
+            gpios = <&gpio3 19 0x1>;
+            interrupts = <19 0x1>;
+            interrupt-parent = <&gpio3>;
+        };
+        mmcsd-gpio {
+            gpios = <&gpio3 16 0x1>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/arm/ste-nomadik.txt b/Documentation/devicetree/bindings/arm/ste-nomadik.txt
deleted file mode 100644
index 2fdff5a806cf..000000000000
--- a/Documentation/devicetree/bindings/arm/ste-nomadik.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-ST-Ericsson Nomadik Device Tree Bindings
-
-For various board the "board" node may contain specific properties
-that pertain to this particular board, such as board-specific GPIOs.
-
-Required root node property: src
-- Nomadik System and reset controller used for basic chip control, clock
-  and reset line control.
-- compatible: must be "stericsson,nomadik,src"
-
-Boards with the Nomadik SoC include:
-
-Nomadik NHK-15 board manufactured by ST Microelectronics:
-
-Required root node property:
-
-compatible="st,nomadik-nhk-15";
-
-S8815 "MiniKit" manufactured by Calao Systems:
-
-Required root node property:
-
-compatible="calaosystems,usb-s8815";
-
-Required node: usb-s8815
-
-Example:
-
-usb-s8815 {
-		ethernet-gpio {
-			gpios = <&gpio3 19 0x1>;
-			interrupts = <19 0x1>;
-			interrupt-parent = <&gpio3>;
-		};
-		mmcsd-gpio {
-			gpios = <&gpio3 16 0x1>;
-		};
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..86e7c1dd51ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3155,7 +3155,7 @@ M:	Linus Walleij <linusw@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
-F:	Documentation/devicetree/bindings/arm/ste-*
+F:	Documentation/devicetree/bindings/arm/st,nomadik.yaml
 F:	Documentation/devicetree/bindings/arm/ux500.yaml
 F:	Documentation/devicetree/bindings/arm/ux500/
 F:	Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
-- 
2.54.0


