Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C161CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 09:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWFRHwCJWqyDwSA9g6vZ6qYM6bFdwonDXcZifiRo3bA=; b=V78UZHlAKHttDaWUFPBFON/Q5y
	ge6/JIkkCncOMhZzImJOReM7aYy6PsSiYEua4w3r4C7E6AojXBqOp7zrZ/CR7JZrGP836h9x4I+4O
	SL+u4OGBK16qTsjnDieX3bWUZBooeJpQAtsve/KkHWhRlCX9MIzSqHcpVI/JKq4DlJsd1PpMyscPP
	cHm2wQliKkVr53TqMrqQMpFd4stNjUzFcWHMlE7hIhy5BrdMxdbUxk2+sNZseRFyis+nXHLmJ0cXE
	LRKlp2U/nXLZO5AjLrjjfJN+9wNSvBR/YhvKDIAwWxlQ7gUAK07Kx6uHf2HIKyM8+XDIE6ma8RIRd
	91ykVbww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgds-00000008vkH-3wKG;
	Thu, 25 Jun 2026 09:45:04 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgdp-00000008viT-0nVt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 09:45:02 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-37de8008910so942947a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 02:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782380700; x=1782985500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWFRHwCJWqyDwSA9g6vZ6qYM6bFdwonDXcZifiRo3bA=;
        b=mved7LBTQyjE2cdIy0TwpeEvgyQZSxqQgJFH6+pIjYI0uE+eLDM61SFWnMc/pGzcLH
         2qTGDW6ykOIGO3IekchgEnerxWy5ADjgdtWspOlkm7mVEpw24E94TbFZOUJtQMTZy6kV
         5QPf3Ncaj7zwjpCWxH/++b5wDd0tCZySBcUFu5xMwUIXO1gBePG+zzetqb3nn63uMWEi
         r7sSMw/Ufe855CCH7pABonVhxCAJPl/AePU42OFn9Nc5wrKFJ7QlxOzwoskdQx2wJJBQ
         wqxMGLjECfsDRpeKFUGt5/5pQN2WLVGPXmZqM715WXnLK6kyzs7z9Wg+/HdacCBs8Svs
         BvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380700; x=1782985500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eWFRHwCJWqyDwSA9g6vZ6qYM6bFdwonDXcZifiRo3bA=;
        b=snp9bpktaXMVx1xtwlL5wSg6P24ju+xhOc968SSkK2rfU/WzFGUSRONciXTWcaT4gN
         rfQA73eYtntGBGiGEWY+UB84DLkfjLs5mtAIh0XE6uvXYgyPhl43HcR8UbwicBQEEhMF
         Ag5hrPcNpXRwCJJjHazAZixr0VjHMJtYFpARBAniOG5HK22z8jgBof9/u/wvfB5cEqSx
         5iyrCc60+GO+NYtDZVtRSNUKEuxzegn2lY2nyabX7DH2rvOBly6M3N/v4VmnGFWedXDd
         Pxc401pN5o4hK+vNNOObx4jh8IW/LflAgbM92Lz7EtAW4rNmK/0TFQ4zckraacx+NTer
         B5Kw==
X-Forwarded-Encrypted: i=1; AHgh+RpVosJo5JXRMXXcSl5aO4CmJ3pXdvuB8FqGe8NGFTseUrvDOG1KivGwKRHtlys0rNcTrbr5fw3evXijZ9KfELAA@lists.infradead.org
X-Gm-Message-State: AOJu0YxvL7wQy+4Cor3G6WfPfteY8c4ZDnj74YKcchzLN7JF8v5a+hML
	MtZMKFov5Yh6IsUT3ZzdXDaLsDwUj3AZqlsLV4Ub4ATbSb99ig1tuNcV
X-Gm-Gg: AfdE7ckEPdwtso7cORJ8RPsvAj0cfC75XcINzd7oDMgrhf1b4N85PRJzFKSxwVvVZ9a
	yQGZUFM3mNi+XfJ97H/0uLNfbvNAzF7Jzy6iIOKov6E9eqfBfAFuNt5pxuMzzo1ndxLXlJ5rsJj
	QFx+89lReZb6GAm6KnWaYz5AG99zvVyrRfeCc2jn2m7tDid+4m/3tb65iI8WalXdhzATVHTf0hb
	ZafxhZRvvPiKiMBpnsuWmMhzCSVFUPpbGUFup0SAcse07ZVIyhgXmJhcBzfwL4GDRPp/GEF9S5p
	O/E+oLfLX5Pyhst2LKeKwVYYqqluoEs2xrM7ONqpuV2djNs1DwnC5ZWPXY35nIiV6KXlLB9IkQp
	d6slKP+2FA1U7/maiIQM88RX3lvusIZgboXqpAJ18189VLtFAB6to90rcTuUf6ItWkwxwjycg5T
	7hcmXFknV4GvlJ0plu/FXAsgGR5EGKOmDcwL4HAUrH7uoCkh8xqUq1Pg6a4eopnncRmXUE/nc4M
	A63wh86zyas
X-Received: by 2002:a17:903:19e7:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2c7fc7948aemr19245855ad.28.1782380700312;
        Thu, 25 Jun 2026 02:45:00 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac8c26sm16614995ad.1.2026.06.25.02.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:44:59 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v5 1/7] dt-bindings: display: verisilicon,dc: generalize for single-output variants
Date: Thu, 25 Jun 2026 17:44:43 +0800
Message-ID: <20260625094449.708386-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625094449.708386-1-a0987203069@gmail.com>
References: <20260625094449.708386-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_024501_256141_11AACC58 
X-CRM114-Status: GOOD (  10.67  )
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

The verisilicon,dc binding was originally written for the T-Head TH1520
SoC carrying a DC8200, and hard-codes five clocks, three resets and two
output ports.

Add the Nuvoton MA35D1 DCUltraLite (nuvoton,ma35d1-dcu) to the binding.
The DCUltraLite uses only two clocks (core, pix0) and one reset (core),
with a single output port.

Use allOf/if blocks to express per-variant constraints rather than
hard-coding the DC8200 topology at the top level.  Each compatible's
block constrains the clock and reset item counts; the nuvoton block
additionally overrides clock-names to the two names it actually uses.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/display/verisilicon,dc.yaml      | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
index 9dc35ab973f2..1e751f3c7ce8 100644
--- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
+++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - thead,th1520-dc8200
+          - nuvoton,ma35d1-dcu
       - const: verisilicon,dc # DC IPs have discoverable ID/revision registers
 
   reg:
@@ -77,6 +78,62 @@ required:
   - clock-names
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: thead,th1520-dc8200
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+
+        clock-names:
+          minItems: 5
+          maxItems: 5
+
+        resets:
+          minItems: 3
+          maxItems: 3
+
+        reset-names:
+          minItems: 3
+          maxItems: 3
+
+      required:
+        - resets
+        - reset-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nuvoton,ma35d1-dcu
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+
+        clock-names:
+          items:
+            - const: core
+            - const: pix0
+
+        resets:
+          minItems: 1
+          maxItems: 1
+
+        reset-names:
+          items:
+            - const: core
+
+      required:
+        - resets
+        - reset-names
+
 additionalProperties: false
 
 examples:
-- 
2.43.0


