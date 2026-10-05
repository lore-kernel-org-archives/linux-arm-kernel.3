Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CF3CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 20:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=; b=bKbFAh9cr1I0bWTTzz0xwktb5G
	oNd7yJHi0tsxmGuyhLzCtfHvhLYtApTv+KJ9mVv9sblT3Dco4i1WFu3ZZvv1x4HsVAci2M9lk243T
	QOuOpffqUZSiGn5px7bOSocVeUONfqVa98Kxy1Ie+uwYQrwP8+2dcx06ESfZD3YzpwT5JQvZqt7Es
	LUQARDU9nK6lSpsIY8KjsnJM3tz+Zbiyo1Ht5NO/Qku4YXDi4gDa1s/cTvKkW+ZtSJ49UNZP/Rfk2
	owkG3ZRkPCHwqK0c46zHUjh31TWnRXWRBuVkYLyYh247gB5FcvHjNGdxhvSqAZ2mZyoOTv//wUzgO
	51788DxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpIB-0000000H7ud-4BKC;
	Mon, 05 Oct 2026 20:28:11 +0000
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpI9-0000000H7s5-2cG6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 20:28:10 +0000
Received: by mail-ed2-x0c.google.com with SMTP id 4fb4d7f45d1cf-6ad186afdf4so3904825a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 13:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232087; x=1791836887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=;
        b=sve3p9wHHuqXAlGdpj3Sts/mhgj74jXQ5nTn3XEBZuAV0VRdYB9Ru7+4WL2h0GoV+S
         RLZY9kpO9cxUGeSmeEncDgE2dwUm3nSJvDT4MXPgr0bvZlKvZwLD8eNQlpY++NuiD+Rs
         LcAgQ/eYnkDSforn1ZD5FlFB/vir/XDyshVoAI6rIAES5NTOLY+llMXfkE0BaDn4KLGt
         M/2grAXY8ZpC9BNZ/99MZAC7AQZ/ImLq8RsAumXJ1/jPET2X+NOzJ/KHTyIGJIOfuETU
         UZh9zaBRP06lZCGu4OeJ/jsBzkHbMNCdOXxWsMcUxYe1XzH5poCdywXFp1RIbYTLY+lo
         s1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232087; x=1791836887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=;
        b=WP3kMZwOJrv5RodNYssSOrYCLKJ+LwSmKUp4hekyyTIjEAW6MeycniVn8wjVf8tCgX
         fKhFg5JE0qpKwzCYpypaDlOy5iyycDh0ZwlJsI6+0pNDh5obdc/uLnojhKHhAw3LtP2O
         K2GvtwqI7xlaAkbi6S9Gcg82/Lpy65oIQ3cBHAVtNs6LsXQ2kPEB4LNWUg01x6xtZfct
         OAntFoGT6pVfw7AvWwy0Axao3EHHp+2q5biO7KclrP7tkx0lMcWoqYewmliVAgL1DCZi
         GglHh0zqcoHsCSXnColzPkIp17T3xpZTNBidRXZAF9oyiFx/F+VQKys2be9+623aBg6l
         9PBw==
X-Forwarded-Encrypted: i=1; AKwUvBxRoKRr+Dj3/2aDA3TBAtmE8Jt+4/FRZKvmz3cYNwu7phhQmHXCQeW4RKeWGKe134XlHOJadPHg2e2IrZnaE3UG@lists.infradead.org
X-Gm-Message-State: AFq9FYLrRJJmJJTwam5PH6wvdA0f3Lr7VLrIP9d+sdaPXOJ+gVdUtoK1
	N3CMlSfyj9C5NZrMXO4fEWuw0hqzwMNQUSsNzuJ5n9i/bLFM2d2BTjik
X-Gm-Gg: AYBFou1j1RNbqvllmVUHmzTvqIblua8d3ElAto0EP5vTjACQ5HUWAHfQQQ1e2T4A9u8
	bVAXoDSVcLjYKkM66UsuukdP8kwoqqGvGYKAUsYqtpNRJkTO0nmh5E5Ac4ea/9plY57K0iblw6X
	kwrHA8FlkxFgrVQDio92p9XqSW0krpvXHAA+tHZiL6Io49aH3S2yeQhKJZ3ht6tBnvZx3UtRlKq
	XjBtXKJuC2uSBiz1TWz2pHxX4JWRs3qaKeYimtIuiMOVYQmfntzNovZICEQCbR94A3Rg0YYFzHH
	LSKTjCF82+wZcp8I/1BFOgEojlCL7oplIQiNX79k2T29n/64YxWr44vOMhWT3YeXRsDq9oaC5n3
	ltSd62KVNkKiiYB+S+lzL6D1n9WfA2Kv6xc9xbKH+UraMH056A7csdvAPiXWYWrWwzifQUvc2ng
	0pI0g45ev/qksRRQEcNTob5zEnWR7yd2QbFzECc++kSdwejvtXaXBa9Ve7e93fZsSAFXsz/eaQ9
	HDYLctBm62ymFIZlKGZGKcTDJV2ADtFiA==
X-Received: by 2002:a05:6402:320a:b0:6a9:ae86:bb1b with SMTP id 4fb4d7f45d1cf-6af9e03ded3mr10580275a12.5.1791232087424;
        Mon, 05 Oct 2026 13:28:07 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:05 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
Date: Mon,  5 Oct 2026 21:27:23 +0100
Message-ID: <20261005202731.153971-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_132809_679648_4012A3D1 
X-CRM114-Status: GOOD (  12.84  )
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

The B288 driver takes its mux values from the DT, so allwinner,pinmux
becomes an allowed property here, required for this compatible only.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 45b7a0b6c626..b1f093d218f5 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -39,6 +39,7 @@ properties:
       - allwinner,sun8i-a33-pinctrl
       - allwinner,sun8i-a83t-pinctrl
       - allwinner,sun8i-a83t-r-pinctrl
+      - allwinner,sun8i-b288-pinctrl
       - allwinner,sun8i-h3-pinctrl
       - allwinner,sun8i-h3-r-pinctrl
       - allwinner,sun8i-r40-pinctrl
@@ -120,6 +121,15 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [10, 20, 30, 40]
 
+      allwinner,pinmux:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Pinmux selector value, for each pin. Only used by SoCs whose
+          driver takes the mux values from the DT instead of an in-driver
+          table. Almost every time this value is the same for all pins, so
+          any array shorter than the number of pins will repeat the last
+          value, to allow just specifying a single cell, for all cells.
+
     required:
       - pins
       - function
@@ -144,6 +154,17 @@ allOf:
   # warnings.
 
   - $ref: pinctrl.yaml#
+
+  - if:
+      properties:
+        compatible:
+          const: allwinner,sun8i-b288-pinctrl
+
+    then:
+      patternProperties:
+        "^([rs]-)?(([a-z0-9]{3,}|[a-oq-z0-9][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$":
+          required:
+            - allwinner,pinmux
   - if:
       not:
         properties:
@@ -222,6 +243,7 @@ allOf:
           enum:
             - allwinner,sun6i-a31-pinctrl
             - allwinner,sun6i-a31s-pinctrl
+            - allwinner,sun8i-b288-pinctrl
             - allwinner,sun50i-h6-pinctrl
 
     then:
-- 
2.52.0


