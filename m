Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE070CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 15:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gGzIR3Ya12RsZQy65tkjnFhcSYwdslivQxR7gOO4emA=; b=MZzZyp4O8mwxWeMMFJcAw1Y/GX
	+S3cLsAEr3e84Lzy90xb5jRFoNziorGwADGPHYlHdXdiZ2U42wyFCwStMd5+C862+VdtJuWDDpLtN
	2zaWfnGIztZRZ6opOFLflaGQnlKEnzu+0lx7VgyNRfmnhKFcUSpr9y0UR1woWEVin+nPrKoppraw1
	4S7zRuOhxyRuEHYhU32fyWD8E6saYZi4MiuUROUQL/EShIYelWzUbsK9ru/KZEsKQTs2ClyjX+qsB
	v6x0ih+U+BPXO2YJzRGAQlRZQX6xkORC5q1o8q0jhtu9rubwYwYbka7SuuMLHv/pamq86mo9Mny1n
	tRdHMJ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4Y7-0000000BNVz-0oES;
	Mon, 01 Jun 2026 15:27:31 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4Y4-0000000BNUh-0auy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 15:27:29 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so105874005e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 08:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327646; x=1780932446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gGzIR3Ya12RsZQy65tkjnFhcSYwdslivQxR7gOO4emA=;
        b=F4J6yM2BdF1qVlpxX3fOhv7cXcMNnt2i4gzfuR1ochDzWeMYeIefy6N+kSvXVa+nDu
         3ehQO/jfwpSC+LVMA9IrE7jSjkgUy3D6piAMKFKwfna35hw7ZtpGQGFMS+za02ASyLwA
         FgGKIW1xXIaeRdIJ7FliB6xDgXN0p0pR1Xf9HzDxwPY2fHGKCgI1xqfj8g9mAmQDpkb4
         9kfgBUFhpzwl5oSdUUCM7ZFMkA8UBzFkPqu1xP1J72W7SakhNedcXOkLqB6HSax0AsE0
         9wD3wLT2qtZO29XV2nmuk+FuHoP9HsEGESBbIUN0w1OethJpHsqWio5Gd4U4SZJp9Evd
         sGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327646; x=1780932446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGzIR3Ya12RsZQy65tkjnFhcSYwdslivQxR7gOO4emA=;
        b=PxZHP61npo31czFjyn5qFgTqJJVsgo7+fdy/IA8Vc4UTgHsxb4ZrSKZQlLU6dwToeW
         bvxcfasBFCbIsijBBdUvn/DJ03lDE/aBY6YE8vT9UVJ3O8NLnPmICYf3/DSTeEcvMxMh
         nhSOjd1Dkwct+YFc2j2W4/BubDveaX8r4ht+omZSku3L2fDUCFLuFo61NdneOzap5+5E
         2MfI2viOLSF7dFjTHsObivZW4g75A0k5hL4+Jux7OniUA/Ij8whZ2P0TcljVsnvqoY5e
         1F3WrfEoUsxghCi/calMyZ3NHVO/KSVWz0J/y7Lz2Fo52wxUcpUhXTiYJ6dgNI9UUL4s
         LNwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Z9B7hs7q9/JJtYlA3fUD70OpaaJFC1+fxJOIFTDe6blID6SrwhPT29YzRI4uKvbDk+ZxzliWUpFtObgWkAIvm@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9x3UuvLxBKSPtm70tah1KKF0r7JpOCiKZwUXmrpHs32tzbJ3w
	Qrm2M+29fEsgQh25E427VBLawArpKBVaSpwCPjgQnCIIfCgH97aMQ3707/qQPP8UQTU=
X-Gm-Gg: Acq92OF8c1OnhRxkt3jjzGjTUc7uZzZKX+lO7QoLMjKGF59348FSA4a16YCLvA+jbp+
	ejvMr+dJSXbD6HAIbUbpq/39ApsxiCKu6orIVsNASxkHmodhyb+dQ6yhgkEJK7nSEDUjar5i86w
	eYWs8nt4m/2y5NVgSvSpCKkgyrqnzPqlyv4vjMGcD5M2cgs5op6iixdwSDv55x4KRnKVdtLg7Ah
	qleBiLUpJ5SZTlEOuljNMUL+c+Sz1WizBlEy3+vY2jwk/FgRwhTSx7/f7XsWeWfc5n0hItCwk3d
	9r20B406fGemdrJO8B4N9JPgILE3RYoMcfMqCb61VkwB2GHSed8DHOW00tUlpRmXGUwGHbxDVPw
	CL8XNBS4RTPsGFuJthT3inZmAGf6/ZlFMGMZn5vX2qWqq83Q8jvRJjMssC4I41G4dXfb1Q/ZTYV
	vHQONT+yVO/SrZMg9JVaDTYQ9yWHo=
X-Received: by 2002:a05:600c:c285:b0:48e:5fb8:f80f with SMTP id 5b1f17b1804b1-490a2966ce7mr127746435e9.24.1780327646037;
        Mon, 01 Jun 2026 08:27:26 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ad63b34dsm14041635e9.27.2026.06.01.08.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:27:25 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: pinctrl: mediatek: mt6795: document the slew-rate property
Date: Mon,  1 Jun 2026 17:26:42 +0200
Message-ID: <20260601152707.29039-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_082728_187133_540410C4 
X-CRM114-Status: GOOD (  10.22  )
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

The driver for MT6795 pinctrl already supports the slew-rate property.
Add its description to the documentation.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../bindings/pinctrl/mediatek,mt6795-pinctrl.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
index 68e91c05f122..9a937f414cc9 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
@@ -152,6 +152,14 @@ patternProperties:
             $ref: /schemas/types.yaml#/definitions/uint32
             enum: [0, 1, 2, 3]
 
+          slew-rate:
+            description: |
+              Set the slew rate. Valid arguments are described as below:
+              0: Normal slew rate
+              1: Slower slew
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1]
+
         required:
           - pinmux
 
-- 
2.43.0


