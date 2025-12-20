Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDE0E668B4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 09:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVw0aWse2vPhALDrtiy2o4KqkTy0qvB3phpySxD9iBU=; b=w5vAp6O5o6l6Y5sI20phoOCeEm
	jInWo9ENhXbfX2KEYGzUWjx8i09uQoxWZJcNIYjwmwrbqjVDU1vdcQVsqH4xGt6LEXGDEG10jiveO
	v67XhrcZo14PHmL8QhJHhHurE4BAO1FwO4GU+Hrq5mEyYNfbtMTnwq2kveaQl6n3d4sg9CA/3cKJ6
	VsvMU2llM/SJrFSxzURjgaB7EyEZnwKNIsBCzWxYtVRx1S7PzgcahqHFKPHpexqbu9czhhpzcdP1D
	0OQ72bj0ScbuqLGWbsJtje0XdkHvwIZqjxVR919rnyouFu9A7u6L4AiSPwpFE+qeIw05e7+erIknG
	WszF+zAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWsuV-0000000BRRS-1XSu;
	Sat, 20 Dec 2025 09:05:59 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWsuR-0000000BRQ6-355G
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 09:05:57 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso21368875e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Dec 2025 01:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766221554; x=1766826354; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVw0aWse2vPhALDrtiy2o4KqkTy0qvB3phpySxD9iBU=;
        b=t/E0xHBQ2O0NlGxe8ure65wxOBR/HhrW3cBz0dNwFhdE/bX0fbxzgnTgq0ldzsOMss
         7oZ0dvW9PDr4sotPGAYqgIzZZYfztbzKc5V+JdGx5ijbTFs7vqYEraUzhEKLA0pWfKZ2
         PsK9WE6rDYJrVLjygImcoMbClN0Gh01jc0A/QcI/RdsfUN22Dggy3EERCndTqUAHUzLO
         /Yc88MjFj2FtMGpfeKTnkxX+u5XmfabcBIlDM87qYIqkeAcJxDzLjcRcPh8lgK4zfLb5
         DFOoHUp0H3BM2fS1wM9NYN0nQGVymOUgEqkmbxemYhonrIlrVEifMKiYORoFeO/5ixK6
         FVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766221554; x=1766826354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XVw0aWse2vPhALDrtiy2o4KqkTy0qvB3phpySxD9iBU=;
        b=OLWlLenvhPL46qVhPgZOoveqPPL/7ZYfqyBB12QmHHZ/8MwLetw2xhiXDoTtFjhC1i
         DgHW6SiSjODmTJiZAhKEmm0/Agqm2riuwqWiP4PSDQZ5gS3BWyLQH+uzgW/DMQ4Etv+f
         Zwv0JOZbllCBLr51qXqz693U4CckPrZt5yisG2R9NnfCAnYy4RQKIZp0AdMPM6CPVGUm
         Ic5PamJh7yL+cU9RCPpNIEt0B46ZgiRYiXwMVQNu0BDp2FwVNnqH2fPUbmdE4/eiO3jM
         f7M/1ddi99UQLNO3qD7QFLvUakNLzp1udzz4vTcA3fpWPj65eBWI+Kf+0zm4OKvH/4r/
         1E3g==
X-Forwarded-Encrypted: i=1; AJvYcCXTA7CSmifRDeAUObERQUq6TsDWJ9erzVnLcN4zjXRauPjRVlRAzUJfG6QABYFrLAcNZlHGmeNmpAm5lfkJJmV8@lists.infradead.org
X-Gm-Message-State: AOJu0YwLdUXP/IMN95cvJWS/LUMJXBUz9uJ9A6gVJ6KqWapyaXTfKJJR
	zzM2s4nG7JnLhI6CU9uiD95DzwMVJC9oUkcmZ35ihviOfoooSAQeVExxc19gmMK0JOc=
X-Gm-Gg: AY/fxX6Tit7K7gsfyF4nInXfTRy/+4JF+qGLa5jDYVkNok/UgUBGUJ+ZoAM4KthjZ+P
	BwUowvW3O+mt3H0ceYzTbtWOr7izurZ9cCgRN/TpOD2WuAj381rJhPZStPCMiKMH9pRR9+/Zacj
	4AUP1/9IluVaxDcORm7n6gxkR99HjC731kPqxSQ3m+sg/occpQh0ixcEha3PVtLAAPNV3MO16R8
	jNu+HSXFFZUZZlsSoqQ5tbH+oT7kRvsFDQ2g+AtLpsahWb6uum62TsABQ8p767WUfK7UzCXQ4+M
	HEKoHUg5TfCZ/o7iLFPwikPF32S+SBw3bcRKrKmOF9u9FoTSd0MvYuDoLO+NKzMZ+wXvLhGFeqR
	ynRzX9p5BDBKCru/+duxIYM8bXv4wHiXkg1wtDeRomUNFzVEuLX+cEl4Lkk/Yvl+go7lEO9jCHF
	CVUwKbejUi94O2MD+/fGFE4xnX5n2tY4gb30+uHwo=
X-Google-Smtp-Source: AGHT+IHm7esSV913JpdZ+YNyx0nqLo6qDaknHuHbwAmvI0v8Wnn36TQkgkaeC8uL3ugSC4TXAIGoqQ==
X-Received: by 2002:a05:600c:620d:b0:47b:da85:b9ef with SMTP id 5b1f17b1804b1-47d19569c23mr60792875e9.16.1766221553759;
        Sat, 20 Dec 2025 01:05:53 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d1936d220sm88466685e9.8.2025.12.20.01.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 01:05:53 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 20 Dec 2025 09:05:39 +0000
Subject: [PATCH v6 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251220-automatic-clocks-v6-1-36c2f276a135@linaro.org>
References: <20251220-automatic-clocks-v6-0-36c2f276a135@linaro.org>
In-Reply-To: <20251220-automatic-clocks-v6-0-36c2f276a135@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2882;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=bUKPDLDgvyDmiCQQmMkKtxjUpJMIVvdlMfzNhg8FZ4I=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpRmbtf4HhlaQ6BY7Iw6T389W5xKye2Rc4k0PgV
 PmqcNLorLmJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaUZm7QAKCRDO6LjWAjRy
 un+/D/4puNY+0dl4g/cgXGWqZa6pGPbTlYDisHMcXVvoToKPpj99jEPpUolN+8x04z7ayoFFfn1
 goVpUIp6PRJyLMBy0vEERO47zp1u7CkFIhPhgvqium9Hs8KyfskVBD18nXqd4Mw0hhGmAH3EVkG
 eXUtSs7xDZxfqhX5fIvn6YHpgdqi69o3g3tAAC/99H5YgCmnehe5GGSlnPgKionfjdPUwo2R3p/
 AyRzWJMPDXs+72NxewSTQR8LdwvVPLp2YOk03suCHG5h+vuKgvnPa6omSXu9eN13aGGVkpJzAWZ
 wSbyGrNTGtm/fuU6dkNntTqptaTdXJPBWNFKRmF4jLGyBmcW6xmk9er0qwOqnGWcRwCgT4g7RE+
 WtNYOuNxtzvkMgS5uDVLekdAcH+OiczykTG21Q8Sirx57TfCCu7/QWegwWvTYMh/S8Lqxzr4lZv
 yQV0RypJikvza8EvKol3LHFShVF0fSfpNQCSynxoW0dAuI6wwK0575PeK9w7NlyCuFfjPj7vVqX
 FkBKLvVy5pfYRrB+dqVlOJyRxr0Bjqv3ZAda+aR9le+uGj+NVWmDhNJXY88AwoOuTOrv0hEcmnt
 RnESt47SMVByS2AjZuF8m/dQGqNS6C/RjMGT/xldnPixsfTaeT7U1sarWIad/v9NMch24lNiS6q
 fn7E9263EZC9wYg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_010555_804894_078F3625 
X-CRM114-Status: GOOD (  13.30  )
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
2.52.0.351.gbe84eed79e-goog


