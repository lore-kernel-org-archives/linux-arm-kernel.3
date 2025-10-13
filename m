Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F20FCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDipr+4PTExpx4Pus/pkesGLE+hZroTGsdhAMvKlEJ8=; b=rr/cHKgivGU/IueEazx+2Q56aP
	GngdEfE6bX19J7KT93Rl4H1tcHs7hdCt4ctc5ozVu4km6s3jM2v0o68PSZEZpq+B4abDZAGuCMQQn
	tU/gscqIpbyBlkr1QyxTLythGc3IPhgM8lbZZCB8PKAoxOEdIUmaUC8YH9zHAiWw4BqlREuGWkaEz
	3nMVMDgz7DVZ2Rcz+YSHcWL29Gbtd7H4QhZYg6FVCgKHwQuajptITn2BBzHur4LLPaTYWKEZLOrkR
	0BPjpUw92BRKp9GivjhOdBj9DEiy+DU+H2it7GodGNCMVxBgCXX/99Mb5/tF2RqPAO/5wKKDucJ4C
	ckNtAhoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWI-0000000ETf6-1aOU;
	Mon, 13 Oct 2025 20:51:50 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWG-0000000ETdD-0Tkx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:51:49 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-46e48d6b95fso40822275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 13:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760388706; x=1760993506; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DDipr+4PTExpx4Pus/pkesGLE+hZroTGsdhAMvKlEJ8=;
        b=FlflhqDXVCn2ss2LZcdneqPnAp596MZF6dbcl3QOIrLLqmNTubq1i63Q5yplhJ3zfD
         jjq4pTR++4M05puCK8Yr6e6v6GVD/1VyBcki1qT5jVaizFn0u+hIz+fPjNK0NkZCQlRh
         kVn/nGFdHcgpr/RFvOy7dr2SSkpprvB/dyY63kZJK3yo8toDfDODZS79/Wg4AxT9qU30
         hh0iuMbSRugy499KE6LkFpJSJGIjGGtM5a6mofxw4LIv0ajabHn4BKxTtYyApCWFEdp8
         Ah2HOdX0kgA09OE79k+OIT1kmU8k1uWPNeGioyvrbyTfx9qLdKdMANjZY+Ne0+4JQrJZ
         wPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388706; x=1760993506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDipr+4PTExpx4Pus/pkesGLE+hZroTGsdhAMvKlEJ8=;
        b=c0q2A9AOlhtwP7AwcXpufPig0MNPPyFQ9cgGV8fVyWFkpINJ2eCW7JOPdGuhD+Lzew
         02qp+Njl06+mJ3V1Oj1D6jAid3Ol0kDjstaQ1s3yzvlqsgxVu+Zd/Agi4E0JaUCLDRto
         sKn0/zcYdjxcc84rSnkGhAkeEJSMmrzRzG+S/NwEyf1+8f/j7+1wIZhXmPFWjXgHQwKF
         koE14YHkzwWoM5HhT3/zIfYSGJdOq9Oy9rPyehF2lOyW0nmumn2LrhAG3kYuLyVBvVNl
         CrJthot1ctN7Xwsse+tSEeVfSnUmjuJjdWXbzPBWa++aPr++Pj041xFfy0qmGPjjFkNO
         Ayvw==
X-Forwarded-Encrypted: i=1; AJvYcCWg+4U82Yre8WYWfGQHVAm42huHb4yFDGqnb2o6gu322vxUx9ME/L21QKulyFKxbUNmpsAhut3LHLBH+w5Xa5uB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1Z0VwouBu7TRCjmaTKzKK3gU16wxMXG5K9agWlP3peDdkFh/c
	RYnPGt0ninpkaHBltJkG4lw642XbndNg1jr1P5pBF5RP4WImNSILuxwPytVudlYu6l0=
X-Gm-Gg: ASbGnctTBm1RTlJV6x7J/wJWwFcvjbkVIk4MRoA9AaDADF3Cgdtke8p80O8pIR7iV8S
	sscJ+BsMC19vk6Acq+cMf63BIrntIg3Bn/njRdxuk1LmaYCJwD7rZEHRIE3Fv5F7mFtvTDt1OT5
	rlSmHTHKGoE/au1JAzI0qH9PvP6kxdhsbf+Uyh1DFbt9nbhvG40QCkM/kCxOV926y77CxqjOIjp
	j8cvtqGFoCunvtalIQfBTPLTWooHwEkrYBMfHUZwPTg7CjfnU2uR1GMKNhjRiePUiKI0xqCAoIn
	Hw81BaYei2CPy3A5krJ9fevgwO1JGQN0bWopRtimK8+xcZSvxNAlOBibL7jEEeXENNP7hAv91W0
	SJVvvrDNxPhYp48S7ehJXZrCxw8qGLzw8XFCd8pcN+K2GDPPUhN8YVN+z5HGv59rzPPftuXTmLC
	lGvtY9MXVofQ==
X-Google-Smtp-Source: AGHT+IHUTh+o+vvqt5ApZzeaETGYqZ/dYn4CYlZfPFo7NmH3AG3xdBAc5oRb1zg/wq6RL1rLN8M4Vw==
X-Received: by 2002:a05:600c:1990:b0:46e:1b89:77f1 with SMTP id 5b1f17b1804b1-46fa9aa1c74mr143864665e9.9.1760388706278;
        Mon, 13 Oct 2025 13:51:46 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3e3206sm133512615e9.4.2025.10.13.13.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:51:45 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 13 Oct 2025 21:51:31 +0100
Subject: [PATCH 2/9] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-automatic-clocks-v1-2-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
In-Reply-To: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1827;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=giCCGOBlBChq6Ynpd6wXM0B4ZyryNCFfzlLAUn2NwOM=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBo7WZXhdIsp2MxanlYhqND7ug7W/PmVbZa8LP19
 rjZ/5sTC9KJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaO1mVwAKCRDO6LjWAjRy
 ugIyEACaZbMs7e+zhFPqcpuN5R75PYl3O9TDmu+YtFIJuzesPfmdW6mjJ+pRYDuqG8vNpAPLfLp
 HAaBp+R/VWQZgUeFhHLauLlJwp55XQVmkp2SDzcAssMfI4IRc9HcVz1ZkfnUNGbA1J+2W5wfyDs
 VaLjZbo4dyfbjinCsne58VzgnUmfTeDEDs9l1pZyQp/8r0LYamyk1xJsSjdkc2VQd+A+Lsu6rvz
 1c6HO84D1MEdY53PWfG3e2zkfg2rQxk/M1Q38TeTzdo6KqK9knJz9f5JtEIC3x/evu28VVlqfOR
 vmdhtv89j66zSiujb+9R3ADOXr+xiGlBKfI/S+JkODT/54ux18FIfEyyPFxjf/ixPP3HpSvT0vV
 pnTA/1Kp2SNFJKsoM1sAgJBGKKtlK6AAITJEc+e8AuEUw9orw3BvGcCn8e482IWSE1dJ7it3c9C
 NAJ8oHudoYuF7yuzqgJeGJT0AF43Bzfv1q6Tr7tJCRCRoiftfTCzcD/gvvHItNMTk5q2lsHSkku
 SfG4DYzxyi9EKzjf38aW8OlIhtJhAmhu41QyD+xnmoaFdSstsuRrcMAUMra9QCapyciJgobJh8W
 2TTErWidX0cU4VwL6MPVNBNLss7ZB7dNa/uxvrolbp8dFyPlQxDD8KUWUNPDzV1esTP2yVJUUc6
 g6L5JBsu9IYNUXg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_135148_218185_D36DD2C9 
X-CRM114-Status: GOOD (  10.83  )
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

Update the bindings documentation so that all CMUs (with the exception of
gs101-cmu-top) have samsung,sysreg as a required property.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/clock/google,gs101-clock.yaml         | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index caf442ead24bda57e531420d8a7d8de8713032ae..5cfe98d9ba895d5207fffc82f3fd55b602b4a2bb 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -49,6 +49,11 @@ properties:
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
@@ -163,6 +168,22 @@ allOf:
             - const: bus
             - const: ip
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,gs101-cmu-apm
+              - google,gs101-cmu-misc
+              - google,gs101-hsi0
+              - google,gs101-cmu-hsi2
+              - google,gs101-cmu-peric0
+              - google,gs101-cmu-peric1
+
+    then:
+      required:
+        - samsung,sysreg
+
 additionalProperties: false
 
 examples:
@@ -172,7 +193,7 @@ examples:
 
     cmu_top: clock-controller@1e080000 {
         compatible = "google,gs101-cmu-top";
-        reg = <0x1e080000 0x8000>;
+        reg = <0x1e080000 0x10000>;
         #clock-cells = <1>;
         clocks = <&ext_24_5m>;
         clock-names = "oscclk";

-- 
2.51.0.760.g7b8bcc2412-goog


