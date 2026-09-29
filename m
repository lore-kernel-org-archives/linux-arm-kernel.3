Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BECCA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 12:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=; b=r6IoBQKbQXQGjKt4XGfuj01SFY
	NZvCd/GmkbrTQfjg0FUbDGofKbyMSwsOEjNShmbtIPXgKZ4GrGewFwWIoKZsIIY1nP202yGqqt/2Y
	IU2MZ+uDPUoo4u2Y5PYJ3fVUKOrt2pb//nUQeD4CzkLWvIMsvdmIjks9Mandlw6ojmnA+oUT25Slz
	bYheYbWXN9riSl32Xumw9ZAjG7j+T/oCla1lioRDpVusNMObebwkt7mnwo008BL9yRqkfiXBQUO+9
	mRp+nnlDuJsoqgp7wX4fG9WbUCVHuJlRToL23cAGOwaF2lKPBRaOMvBdWZbN/jmaOkQ9TsfA1nfvZ
	IH3pvRTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXQ8-00000003byv-2U3Q;
	Tue, 29 Sep 2026 12:58:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXPs-00000003bu9-2v4Y
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 12:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=; b=LgwvKnxx8DJLir1Rznsu0OlCgB
	K+0QAFVXrEqmWlxyIBqMds5mFv39hnoWCbQzaHM9Hl1zVcS3vTNomboi5xTTYNOi5iW3UtCvT97dr
	1SEevc4TODI4xAHy7uO2nhqNO7YxhdlSKPI6FDtFC6ISRa0pOmQkrUL7icIkrPKuydB5rKqNX1h62
	Ghy6CGuquZHAfLSTC/B1VoPAKczLnqNLOBcpogHUnNR0ykoq3QYwjxgIxftr2L4F7t5iK8p1jgyGv
	sqNIACteoJSN0E4d1cpe5AGhnVxsokNxkxLybeshpOI0DuGctdF01yhk+fAzYBL9Yc94OTKnbecbX
	gvaVnjow==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBXPn-00000002e8E-1SKI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 12:58:39 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e721b5503so39111555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 05:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790686714; x=1791291514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=;
        b=foMHXd98NqkNSVYOPUeNf1Lpyb/vfayZ9EpiL6WtJNJl8xk3srh3GzSlQ9yGprViHe
         lJJxxPTJ4pMZTLpjHTctJcm+PRXjaZ0kMR/+ezos0g37pD6rzqP5lhatVJ+lelsCoyH2
         4ivQyZJzrNjfTeJYOXXZtTOUZsmj6HxE0TK2Uo/DDUjUHyNBmOxxiTgauVOvdgpo5taa
         PITSgGR3/+MLYDIEPXQnw2N1qImB1himcBnXKaQrPRqk0rGZ0Ee5rFjGt99cptSNCUKw
         +7z8o7wkYwk+FB4FT+e+FsAnQCoJjdXX9cqREYqRcPGgBLxGlt1v9H1t2BaT9gQUTZJg
         s8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686714; x=1791291514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=;
        b=Idf+sY+qu8hYs+E4xHWb2oljK9XRo4rewZQ/2/elNAB8TELEBwjZMt+wSDDchm/Mfx
         Hz1mHU5Y1kJ+gKY1SYCOipj9tRpGqC7JUvOkGi/os8LkPBr/50BCMeZNTYblRmcTaQ2c
         VSESjaj3MByAQ7UcYKb5PLsz6fPu/YQFHycRPgU7dqi6lCMAbByHzQ38ZYYKZaVWVCyz
         q1nxhF0VmCsNAMw2eumsyN4s6jsl0VOBSBHEvWdpnvZN/RmN2F0E/xXXnT1Wy9AfzF7k
         SrLb0W0OpNQKhB6Q7YJc033q65cAO96JjZvGlXt7T7Xj1folc9asdCGMIAiJc4stFJ+w
         hAkw==
X-Forwarded-Encrypted: i=1; AKwUvBzPw+Wqj6x8kOf9HXaN9vVzNUc/dK/Ms+dk9o+spMAmQm3AgaUykqUTd3OJbQSGlpLIgV/A/bSQ55Sb+PTtzhpV@lists.infradead.org
X-Gm-Message-State: AFuF++mmlXRRhNa86voyCTPLTRn9We5si5r5wuf0fXEgt++iF+oPzRce
	+WXKHmMib9jcONWcpNzE1bJ/gtRe4mj6c5KrZVKvtI3vTGt7m8lwed2oh9zpsWISBcI=
X-Gm-Gg: AYBFou0hUSg3v3CaFytj4b4EucTiqhlTJK9J6Q8FimZ9Dscr5TlEzKpkW8kIStMXAKj
	MUFxr6XAWDrfsQvVfjqdfMXZB5+wAYIJkCpQI0y67xg+uPnKqXiofjEb8cnp6c4h4oJIVHTjXHo
	ln4LxQw82y9gzLSJUi8CuGqJzvdCISrimswTH5ZuyJekGOOjkueZUonyPJgq5rHUdXAFgYCdViW
	EJNpSplLCN6Ubxg3z4jCVm/TgE52OpV4SCpQ5lXrdT54yHYIhO8zEI0wHyfeXMfHv3oB9Kqtke3
	7ITrC6KIfCn5QCuGqkKYU2BXeX8yQrQWEHe8qLyezvkaTs7fQWMsBja+q1ZUtvnj6DZejDTg2dP
	kX5Wj/j8Ir+lGUxcReq+cO6pTUYfHs06Mlo0CXazUAgXYePPAla7+Xf26tUFy8gNK/Bo4f0jHu5
	fXoaoRWB9joXZwEuvwz/6VFeoUASMvCb1ce54EqS6FCA2o6zntivbncpJQPcVwdW0QV22zpecS4
	es1zjOE
X-Received: by 2002:a05:600c:4ed2:b0:49f:e3f2:f5a3 with SMTP id 5b1f17b1804b1-49fe6685393mr284862965e9.0.1790686713541;
        Tue, 29 Sep 2026 05:58:33 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfe13a1sm75682335e9.5.2026.09.29.05.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:58:33 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v12 1/2] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Tue, 29 Sep 2026 15:02:11 +0200
Message-ID: <ee0aa89faa14e0073f1271693bae28678652998b.1790686331.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1790686331.git.andrea.porta@suse.com>
References: <cover.1790686331.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_135836_472216_A2D4E330 
X-CRM114-Status: GOOD (  17.74  )
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

From: Naushir Patuck <naush@raspberrypi.com>

Add the devicetree binding documentation for the PWM
controller found in the Raspberry Pi RP1 chipset.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 0000000000000..be020583fd0ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/raspberrypi,rp1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi RP1 PWM controller
+
+maintainers:
+  - Naushir Patuck <naush@raspberrypi.com>
+  - Andrea della Porta <andrea.porta@suse.com>
+  - Stanimir Varbanov <svarbanov@suse.de>
+
+allOf:
+  - $ref: pwm.yaml#
+
+description: |
+  The PWM peripheral is a flexible waveform generator with a
+  variety of operational modes. It has the following features:
+   - four independent output channels
+   - 32-bit counter widths
+   - Seven output generation modes
+   - Optional per-channel output inversion
+   - Optional duty-cycle data FIFO with DMA support
+   - Optional sigma-delta noise shaping engine
+  Serves as a fan speed provider to other nodes for a PWM-connected
+  fan.
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+  dmas:
+    maxItems: 1
+    description: |
+      Phandle to the DMA controller and the channel specifier for
+      the duty-cycle FIFO.
+
+  dma-names:
+    items:
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@98000 {
+      compatible = "raspberrypi,rp1-pwm";
+      reg = <0x98000 0x100>;
+      clocks = <&rp1_clocks 17>;
+      #pwm-cells = <3>;
+    };
-- 
2.35.3


