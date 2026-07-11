Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47824C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 06:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8jCDGxFCZCvaxcS2Psadz3lVnIPsSjTP8SdZWEFY3o=; b=A4HplkpZNufHEj2MBpmOrD0pW+
	Sc9BKpbln2lWVwtiOEm68aTDy/GcfvvBVA/dc3DjCSE5ZdeDSWIdWZ6Q/fTtE8+CZNFNdM2IaFKE3
	D+pW5oosDxWz8dilnwgFnSGZyXQLh9EgmNU+UVvtT8NMtCCF7DeEYWpbK0J4KJ99rtNRret442fIX
	oAQcAN6+SmJbzcGv45JqfudnfguEKUdUC+RcYpQbzn0MC83+6kEJkkraLWaE3ZP+hG1H+cMWhJz45
	m8RnFLbzi4/QnJtM6VeNbMcaX8Q9tR43M/sQ9LElhT2AT5ZmfHSNS+kFABIgUoq/ndszMM4kXfVEP
	EUIB6pqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiQna-00000006ErL-3H4A;
	Sat, 11 Jul 2026 06:02:50 +0000
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiQnS-00000006EgH-2o0x
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 06:02:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783749736; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=OPe/j2k2jWH4cAU6GP66U8XFCtxb4Y/owuIlLEQ1WOVZ7/a1+EyHlmYTxEsX93Vckg
    YksXJxSUFK4N56Ol3EeYYom7QYELdI8eRzzSmGOWYKA4AOBWmtFfTMxjUVdOWoZZV9Gy
    zoZG2/b39GgeqTUxVhsTLRwgkDfLZdBeTBIm2Tko6ce2UHvIQZzYZuINJgSVfqiIq5jX
    Qz1naDDUFTC76tFZV8l7oE21cAIQou9FlP4oioGp4n1/mNzmbUaYrgQtU7HX7nj8+dep
    s+vUmKt4xh3Kaxdz3nwCVd8NLqKlJbuXevsP09XDh0V5CNgSfAYmWU5vjUyl44uS3V4C
    glEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1783749736;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=E8jCDGxFCZCvaxcS2Psadz3lVnIPsSjTP8SdZWEFY3o=;
    b=GzNBhnIuSWQP5HA0tgU9LmvIa6xW0t69LjSFZJSMJDZXNXoaFp2IHcqATQvZnL5UJP
    GpVDc0tlj2HjEFVz/VvLJoh7q4KvfKOXPzqF5fOl6THSKwAARnt+UEzaJ1q5Iz0r4KZ9
    7D32+y4JztNrGHqODg0Et61yyrnnmJMGOWxCFnHArZzHjogGN8xQzU6PEqwsmYe4HR5B
    VjxozmxsBwh9uZSNc7u2MjES/gioYgRi11F2v2sl4MhBkHR9ytLVInSANsnubQRvk8DT
    JPg9wQqvbt4486QfPa+YKVetO0udj/FKBMsdMZeyiQfcgsHAyl64rRQFXMhBc9knSqbQ
    6X/w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1783749736;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=E8jCDGxFCZCvaxcS2Psadz3lVnIPsSjTP8SdZWEFY3o=;
    b=bSEIuX13cFGeoDxHmGlpREmKzlrkSDTC6RxM5qWfTKqXb5BY/34Nff9VqsmfqcvOFf
    v4JtxswUCojY1iArIkmsmzupPksVDSWu6O/V85kvf/ffpDe+0bYA/fWte7ZEufoF0+rY
    BBCDMbdu9isYxeHMwv2V+WeiHQIkN0/PJDFjijmOuqqHlC+DwQVl3ssDw+STMsQP1Ys/
    fzvCjU3J2YQoAjnlzZNqw6HyrYjUNOb3kv4onWMXs/eU0n84mcHwb24RGEddx4r7uYQZ
    lockG54Qt1xEfUmcAJYLsVmOjcS4yrb2+pwQRHbaCYYPJLjtoGUSKw4WoSwxu47+jHlC
    SO2Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1783749736;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=E8jCDGxFCZCvaxcS2Psadz3lVnIPsSjTP8SdZWEFY3o=;
    b=FcC6IWfP0TTCCH9BvVqmVo68V1h+An5Q4quALN+HCARu2x7tn5kfeAKJK+S5BJbifF
    3qsD1zmLZujyE/v6fUBQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrT35oLmciNszeF4HOToVDOd6S1gdjuILE2MKVd"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.5.6 AUTH)
    with ESMTPSA id Q4b76426B62EGhs
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 11 Jul 2026 08:02:14 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Grond <grond66@riseup.net>,
	Stefan Leichter <sle85276@gmx.de>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Grazvydas Ignotas <notasas@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Andreas Kemnade <andreas@kemnade.info>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sen Wang <sen@ti.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Niranjan H Y <niranjan.hy@ti.com>
Cc: letux-kernel@openphoenux.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	kernel@pyra-handheld.com,
	mfd@lists.linux.dev
Subject: [PATCH 07/16] ASoC: dt-bindings: add TI PCM1773
Date: Sat, 11 Jul 2026 08:01:54 +0200
Message-ID: <a02383ea5907a677f4c61066d423efde2b9de48b.1783749722.git.hns@goldelico.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_230242_904196_F84322A1 
X-CRM114-Status: GOOD (  12.66  )
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

PCM1771/3 is a simple audio codec that can be enabled through an
enable-gpio.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 .../devicetree/bindings/sound/pcm1773.yaml    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/pcm1773.yaml

diff --git a/Documentation/devicetree/bindings/sound/pcm1773.yaml b/Documentation/devicetree/bindings/sound/pcm1773.yaml
new file mode 100644
index 0000000000000..f3e640705bf70
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/pcm1773.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/sound/pcm1773.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments pcm1773 audio codec
+
+maintainers:
+  - to-be-defined@openpandora.org
+
+description: |+
+  PCM1771 is a simple audio codec that can be enabled
+  through a gpio.
+
+properties:
+  compatible:
+    const: ti,pcm1773
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    audio-codec {
+      compatible = "ti,pcm1773";
+      enable-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+    };
+
+...
-- 
2.50.1 (Apple Git-155)


