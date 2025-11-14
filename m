Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE2FCE7B11
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oAM1SJwe5be5jeswFgKKg+ScqRvx3vPVGMPIZFDZGA=; b=fwJrASthoGWXkgkQIQj2ns4TP/
	1x6ymyE41t0sOeZg7N3/OUdBMuH03c1TBNjdEHvaqFG/VoK8LorPepmxwHEkhd1nNjTyYeJL3CETF
	RPsWnzYDHQXDBwtfdIiQYtFxlff+JAvhuX+Br9P06N9Pje6yq1woCFKetr+mkmTQa/TDdm0IH3lnP
	oij/KXxhGxofJUVK4IwGJBtTec0/kXPWGJpwN5KnHgRsqLk1C7XGjs37bGcJ10CNMUq6EBy30rLk3
	nMPkMnANgvd4ZZwQ7fVCAQZX7M4tV9N9dw1/zvix4egEBuNMrWxLfmVt+971H1dfTFo4c0qB4n3VL
	HhX1Wynw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJubs-0000000CL1i-3B5v;
	Fri, 14 Nov 2025 14:17:08 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJubn-0000000CKyw-3aZf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:17:05 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42b38de7940so1229280f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 06:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763129822; x=1763734622; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4oAM1SJwe5be5jeswFgKKg+ScqRvx3vPVGMPIZFDZGA=;
        b=YUzX/R3TMOphsbc44GO2iBGIUfo8v1GEg3B5+lglelfDB9kX+WkqePDohtrvqQUqAQ
         nMDuLaagkU7Y/UXl28/O68EP7O47QXQpJzmESRkqSg1MPqLlMrnL1Qwc2muZO/mQR3TJ
         qVaMOS/eN3ZRRj/zI5++62zrCigCQi3n6IBR9rDJ/yiudBdEwUZNvNt8EmexUZo2oZc3
         EWLyIekRt2AWhs8Ubb8yNXmAMxsYFvZsXliUnLEN0WTHEiHHVqlK22xuB09rsZnIuEQ1
         KiePciZuKAxgEJvJ+wtsCPnB15bk5JglvW1yxLIwIvHXXXdehFnD0xP45IgUzg4oeLoy
         DYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763129822; x=1763734622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4oAM1SJwe5be5jeswFgKKg+ScqRvx3vPVGMPIZFDZGA=;
        b=WBNITRNAD9lm3ZINxvRqml8zQjvGAjNlvNgjKoBmHUr2HbA+h/RCqi6ItbTKNpAbY/
         IYXr8IN8W3rOoa2HgXaPrT4M4GWQtykYejDYxil1qfpZhdc0AD4MA4wNTTAaDi9t6rST
         fmz24FQ4J4c0wSu59T+sQIFKK/BmsNtyHLpKQhaGEla/25Omp3+3rjlFKS9gUCHf5+bb
         fZZM1BiRPAj66ZlVQ048+EzJphXXXsk6L/yY17Ief1QbD8nC3drCwe5rxCmnrwyeyJqR
         6w01wUKzW0cIx8wdlrnZ4wNTwmczHYNRn7hda7gtaQQVaAC0EQv4vjVPUluEVfyuroeZ
         5cAA==
X-Forwarded-Encrypted: i=1; AJvYcCXdI6xf1vSayQCQkrKZJ+XHsYGMLzPxXDp+n2BCWxuGbLc2CwpIukDXRw0eVxAKLmK+wpyztWot5MrwLDhOus2x@lists.infradead.org
X-Gm-Message-State: AOJu0Yz235G13k1LHvlOtzTZqHP+rZKYmoTSLZTqv81ywT//DSm8ThYB
	3s6selJezRlgGX11TUKx8Amj8KKRpGAm2aRHYbOc5JhVfJzHV+BEO/JBl0pR6oiGujlHoWr1a/i
	tOQgp9Yc=
X-Gm-Gg: ASbGncvwHQrGHS527y0DrB/dH0HQw2NzEO3dZjZtpVlCCb6+n1atYr9Ct1S3D+5GozZ
	gSqHH090TRwcHKKWvp9xjc3Kv//IU0cGXWsqJFkcul13FLI7g7yO54Tj8mfqRUUR7VHY7Yq5OI2
	alvQqmgMgaAPLuue1ikOAMoE0WHX5N/GCsi4xrnvWClnrHxwqXQDA7xLlVl5HFFeqmFAdoYoIn1
	80MJv7SlzvtPv7vy2LSpaJmjQ8A3FKMCLZsVbQmaWCi83WMzxftIpMh4XlCw4Aim+piqAID2TFO
	HCZqW5oWlktL5iOjYzhRKLDh+Jbavw2euw6YTdW1kAYKEp9k1TVo/xLJwMa0jGXPrK+3y+K7AmC
	iSEiKeSELXW5DDixmdMuzT+dT5jeAWFrTKgF0V3nPvt8oYpP/cpztXcEXu2lZyREIk9VC2951Vx
	fXHb38olsDME5BZFO7wM397roGv5klMA==
X-Google-Smtp-Source: AGHT+IGqRwmbRj/CPbgz3UePg1W1Fi4Jf+p5TO4TwZlqbe762Q/tfUy4KsZ40D0BSKchWnm2kHW4JQ==
X-Received: by 2002:a05:6000:24c6:b0:42b:3131:542f with SMTP id ffacd0b85a97d-42b593395b6mr2819075f8f.24.1763129821651;
        Fri, 14 Nov 2025 06:17:01 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f21948sm10150958f8f.43.2025.11.14.06.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:17:00 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 14 Nov 2025 14:16:48 +0000
Subject: [PATCH v5 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-automatic-clocks-v5-1-efb9202ffcd7@linaro.org>
References: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
In-Reply-To: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2886;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=6sKEmCOQ2W5VcemaPNloFrkmil66ilCQ7HCGLcFo2/k=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpFznXNvLBNwl+BCqlq+ASU5nNnrkNHVGOcCAIA
 c6LVtvJOsSJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRc51wAKCRDO6LjWAjRy
 uqU3EACgypkgEzt6O3RuGIUcTAvGF+i3BtDUdztrJqZeT5YnNtFtDpN3U1ocwD2/l92Z/7kIB7D
 A8IOXDPf7/Dac/8w65lPt5scyF6NJONoYcbVHwUy29QW+iwaHIrnalQexDIjp2SQ6JmKBCGJvPw
 Hp5cr7exmzHp0aWdLVnk5rriXqB2jZWcGEE43XyOfSLMRW3qhavXpaBVfNaz5NeqLRv+RRtCPbq
 EvixjewmBsZIyu26wShbPHO/nIG4H6HbC7tbS4v/dPnrawA99p/RvP3aQCHmA1KmtHcMdpnWdc5
 xmYIflwltaRET+sz3fxu9mQVA+NEcTFEjP19nw5/+A1L7+kE4g/IImeGVinTg7h5wwsRKQDR7kq
 3Vvp/8XzZZW6H2N/tZVOJJ9TNWUjvxuWOO/Q4J1ce4gkexA/POToJWgRAhiRYrl2ge0HB4hZJso
 zQAKWD4TVa1KtNgucU2jAwSX41m+POJ7ZqWFRlENCUOfgH0cqA6bNpGx0tfldpV8wi1iIGEdPJT
 LM5FzzLgO1rj7PECYoIHBsYtAmQzf1QdIdzJuzHXgiXgy1XCV9LLbik6t2IAkYp7mjxmk2VeSiP
 DoY7mQxBT+LwYIMhWvUmmEbWYIgLh7f6mAxhzphC30XKUmxR4a/gb2f65oGJnDe9i0zMiY4eUaK
 5GdBP9jOeYtZE4w==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_061703_925071_09BDE024 
X-CRM114-Status: GOOD (  13.54  )
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

Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
that contains the BUSCOMPONENT_DRCG_EN and optional MEMCLK registers.
The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
bus components and MEMCLK gates the sram clock.

Now the clock driver supports automatic clock mode, to fully enable dynamic
root clock gating it is required to configure these registers. Update the
bindings documentation so that all CMUs (with the exception of
gs101-cmu-top) have samsung,sysreg as a required property.

Note this is NOT an ABI break, as if the property isn't specified the
clock driver will fallback to the current behaviour of not initializing
the registers. The system still boots, but bus components won't benefit
from dynamic root clock gating and dynamic power will be higher (which has
been the case until now anyway).

Additionally update the DT example to included the correct CMU size as
registers in that region are used for automatic clock mode.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v5:
- Invert the test for google,gs101-cmu-top (Andre)

Changes in v4
- Update commit description with additional requested details (Krzysztof)

Changes in v3:
- Update commit description as to why the sysreg is required (Krzysztof)

Changes in v2:
- Update commit description regarding updated example (Andre)
---
 .../devicetree/bindings/clock/google,gs101-clock.yaml | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index 31e106ef913dead9a038b3b6d8b43b950587f6aa..09e679c1a9def03d53b8b493929911ea902a1763 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -52,6 +52,11 @@ properties:
   reg:
     maxItems: 1
 
+  samsung,sysreg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to system registers interface.
+
 required:
   - compatible
   - "#clock-cells"
@@ -166,6 +171,18 @@ allOf:
             - const: bus
             - const: ip
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-cmu-top
+    then:
+      properties:
+        samsung,sysreg: false
+    else:
+      required:
+        - samsung,sysreg
+
 additionalProperties: false
 
 examples:
@@ -175,7 +192,7 @@ examples:
 
     cmu_top: clock-controller@1e080000 {
         compatible = "google,gs101-cmu-top";
-        reg = <0x1e080000 0x8000>;
+        reg = <0x1e080000 0x10000>;
         #clock-cells = <1>;
         clocks = <&ext_24_5m>;
         clock-names = "oscclk";

-- 
2.52.0.rc1.455.g30608eb744-goog


