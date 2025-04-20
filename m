Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D2FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 16:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EjUWRNhL7mfMeWSPy6sa+7SQ8UfbaKL0kzhkdxakcaA=; b=t8oXcSmn02eBFVduEfstFVtQm7
	F9pm6xEvw2qEV3g7MNsvE16qTpqPJdMdGFhSNH6EcqvNXmCIAPJNt99GCG2zG/BeU+faDTigYUZ9f
	MeluQiPCwbC2Hhxdjv59kMAhtVLTuIDUc86k6Ndh8BOCOILeT05ONT4s5Xvvif9y5fyBCxgM+Tk59
	YX6t0bnlp5D0W0Z93tm2THwaR+sGtCbgVMasT0/f38Vp0jxWbuCsU/AJbd7FHqUtq5vGDSgmN1oF5
	vXN3c5lutVv2gJ++6uJ7gOTJEQeI4M/uPdro4WGD0cOjr5tH+LT+eXkuuLHcNi999/9RqvxQooCag
	aIQARDyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6XzW-00000002nu8-1fWF;
	Sun, 20 Apr 2025 16:58:02 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6XqG-00000002n2l-3kuN;
	Sun, 20 Apr 2025 16:48:30 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-acb415dd8faso516576266b.2;
        Sun, 20 Apr 2025 09:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745167707; x=1745772507; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjUWRNhL7mfMeWSPy6sa+7SQ8UfbaKL0kzhkdxakcaA=;
        b=ROoOVW71NNB4oznPG1mLRn2Cea7stsvzxH7guTW6QmFIfcHJWOjjADtxz8JE0qpIp9
         lGQo70tfmcjFfRpTqLTh89vHDYr2uFqcVUfwKUTspwvlHRw1q5xcXrXiSrFGSxeKzAwZ
         1MhWXJ+6ac1k18635h//SMnyYBlry5spAQTLMLkQMnxesZgXrD8RNk4o9GkDzfsOfulX
         xohOBv8lIVFVH+bl5d+PdxrDxjlguoA83mubp1fDVITYN6AT7SNhEocEx0VXIkT4IA82
         lHTwwERVsNBeyTKZO+VtFVn29JaCS2+mnoPRnZbdUv9H50PLXXJggOlrlaWoSZnmZk/y
         4DNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745167707; x=1745772507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EjUWRNhL7mfMeWSPy6sa+7SQ8UfbaKL0kzhkdxakcaA=;
        b=RtqcmCVQrB7Da4JmmcaDv4aM5iIY0IPy6+Bk7nPOTPfPLL2T6PRMbuiWAYEPAv5cJy
         /aMUdiqgLoudsfV1A/W4r2LDJ/GC+KaqNaABJmmIOQfk5CiAQDKjMJOWtAiPGQS9V+nN
         MbR+MtBc8ZrPaMeR3WYfJtRMvpvL440xqgSweDxQYw0HWV5OaqbKFN01p2hJWQ8nEtZk
         Y37u6EnEAyhbEEKlle1Ncvkqs4lIFSl4jFdsbFloh3lHC9kGGCtvneuGtD3egPXHuwtL
         rF5enXLCGgOZYFz1eR1hTPhZ49GOQ3ifaEMIc/4mazzRqBb1Bq8OgR6OYbdQoq/cH+YJ
         JsOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+n0ntdiLciLG7cZOkqH7efD9Eq65Dh3UtFjNIoQFX7Yt5KeB7NyPXh0DX95io/ulOHpfEW1DK7Uno2hPlrWG9@lists.infradead.org
X-Gm-Message-State: AOJu0YzRxCk9KHxxp7wje6Agqzc4p4vLoeN+M5L0bDlCKFkOgP7P/HEU
	Re6Y/YmiHM6lD0QVKhpDRP5hnINwxTHcI64LTFXBnF0TpjP9SeoiSAbrPQ==
X-Gm-Gg: ASbGncuphBbOJApyKLaxJX7PJlV9seyR8KlEsBOnEP9zj4HLnkHKjYhzKQFrMcyspkR
	OvSSsg7l1dN6NWNn2NgjHW9Eu5bsMMRANMJ1206b+/Ff0/9y9j4pr4/SVfFcu1EYSmoWWFnQFES
	z5YovJ6FBv6NzNmP2alDmU/DWLR+QPoTQnA8CX0LhhELqZmn7uf2Iu/cxEm+OccAvKuh6vgyslA
	vqqv+TaebQpO7fP5BdR3DKuqjaAxJy9BqO6/ldFEZj0xQeyvSuWwbeAxQtstKoZNl9m35oFbg7R
	ofLgQBkUgmL634HYsJ1sdGNMlbXMVU27CB6hPPlHMK72CqJAvq3MqT9IhlYJaqE+O5gABdCc9Or
	YqJ4Zudov6Gex+JgiUnYYnMhGr+xsYaE19KkejVGSkf2L/pVhHSoSgmCBGznmUxOUmRDomisS8K
	E3
X-Google-Smtp-Source: AGHT+IGQbKyjINDvHkLRsaTYirDNCXIf/EYtZjqg3lz7IMf8gugQhBZRZ/3/lwYabSVCSHziooRzLQ==
X-Received: by 2002:a17:906:478f:b0:ab7:bac4:b321 with SMTP id a640c23a62f3a-acb74b80e1fmr754056366b.29.1745167707194;
        Sun, 20 Apr 2025 09:48:27 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9ddb-f900-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:9ddb:f900::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-acb6ef48e5csm416142366b.148.2025.04.20.09.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 09:48:26 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: neil.armstrong@linaro.org,
	jbrunet@baylibre.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 4/4] arm64: dts: amlogic: g12: fix reference to unknown/untested PWM clock
Date: Sun, 20 Apr 2025 18:48:01 +0200
Message-ID: <20250420164801.330505-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
References: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_094828_998498_61E7A95E 
X-CRM114-Status: GOOD (  12.45  )
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

Device-tree expects absent clocks to be specified as <0> (instead of
using <>). This fixes using the FCLK4/FCLK3 clocks as they are now
seen at their correct index (while before they were recognized, but at
the correct index - resulting in the hardware using a different clock
than what the kernel sees).

Fixes: e6884f2e4129 ("arm64: dts: amlogic: g12: switch to the new PWM controller binding")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 12e8daaa1c9b..dcc927a9da80 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2313,7 +2313,7 @@ pwm_ef: pwm@19000 {
 					     "amlogic,meson8-pwm-v2";
 				reg = <0x0 0x19000 0x0 0x20>;
 				clocks = <&xtal>,
-					 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+					 <0>, /* unknown/untested, the datasheet calls it "vid_pll" */
 					 <&clkc CLKID_FCLK_DIV4>,
 					 <&clkc CLKID_FCLK_DIV3>;
 				#pwm-cells = <3>;
@@ -2325,7 +2325,7 @@ pwm_cd: pwm@1a000 {
 					     "amlogic,meson8-pwm-v2";
 				reg = <0x0 0x1a000 0x0 0x20>;
 				clocks = <&xtal>,
-					 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+					 <0>, /* unknown/untested, the datasheet calls it "vid_pll" */
 					 <&clkc CLKID_FCLK_DIV4>,
 					 <&clkc CLKID_FCLK_DIV3>;
 				#pwm-cells = <3>;
@@ -2337,7 +2337,7 @@ pwm_ab: pwm@1b000 {
 					     "amlogic,meson8-pwm-v2";
 				reg = <0x0 0x1b000 0x0 0x20>;
 				clocks = <&xtal>,
-					 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+					 <0>, /* unknown/untested, the datasheet calls it "vid_pll" */
 					 <&clkc CLKID_FCLK_DIV4>,
 					 <&clkc CLKID_FCLK_DIV3>;
 				#pwm-cells = <3>;
-- 
2.49.0


