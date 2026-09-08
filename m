Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24BFC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EcwJ6FJdDLZqAgx4ZJcfrdseGR1/I5SVESCmgXprts=; b=YrwAm/pAP4pPD2+oEpTYLZqFhT
	6bgLUwScKWAUvn2rxWzuhuqR4C1oXLEQUzFAFfCTPYISwarqF2X5dC/sS5sL8D5zDM6+NFXyfpPpA
	5LeYCNVlWWtsuOU8rh8EjAHVoXd94ropf8VlUiHzwB1FWr3nh4RGnGW7puA6VB903H46Dc7RDnuVH
	E9IWzMVAqXB0ZSADGvDF7ymHhJdy0kF1Q1a6TIi6BXk68CEZ02Q9e/DgSTFZviejw4HdV5Xq8MAh4
	4vEtiLwFQyNXEuqDVffvT9wE9TiZaaYBzUhPZPySdJdtsZrItFqbpgyQXp/mh+RVK8jrpVVldCxwD
	WVmvWwAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3s8M-00000008ZUU-1zUB;
	Tue, 08 Sep 2026 09:28:54 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3s8K-00000008ZT9-2bLf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:28:53 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38e041ea211so3445185a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 02:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859732; x=1789464532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8EcwJ6FJdDLZqAgx4ZJcfrdseGR1/I5SVESCmgXprts=;
        b=Nt72Myh0cts/NWU837cEUmPLpdGy3JwRu8iVUkjKJQPZEBkOPROEThn7N8d8dIPMTY
         9hvUOOsMUyAx8H2egBWWuFb8Xha2Ds/zM5j4LiP4w2AStRgBfZm/W/O7um/qaACzLdHt
         HRM5fkwAagZX6gVq/4ls9qfMftR9dK9DYupprXp7GQzfRjF+6ucjzB384PXYnfiNm/Gn
         6JdCxsRMbNkCBmeFLnj0ib+yTkJgUZHSHgx/uOZg2nGkA1GB0HDdh9IvbLd+wesOMiYp
         D+6v4VKKszlsmIjnhfKOf5pNglxlx0QsbtlIA88EZyHlZc8mZ8cLYhMmxCeEHXyXXD/z
         62BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859732; x=1789464532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8EcwJ6FJdDLZqAgx4ZJcfrdseGR1/I5SVESCmgXprts=;
        b=jw02blO2DhPfBCFabztM10DB3hQzGjOnDaSSI7r3JTFxwVBesLoEe/H94wDUXPG9dX
         +9nmZ3K4FqRMcEzcYlaojYjUSF2b/0ba+FIwR/KJAq03/GNEYeEdYqiY8yOZSwK1duaO
         YS9aU3LjJm4pfV3NFyZKkceFsergkWg44d9BHIirmYaV20z0L6oqekfo1M1CiG0HBFtF
         O8rDs3CSA0Vkk4bkHK88nL/yrnMgXmS7+05TvixBlUhWV9Ptyzy2NxvPW03WfqwjTMwP
         AsS5Ki0mYaatQbx8DhmYEfzQAb7sN7X8QsyEowJe/ZyfW9zyVOYPxsyPzt0RM+Tm05Rb
         6N9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwYUHg7UiSoh651a80nHxVgTKgMT6NyNg8OAtMQYoXbImh8fHJc0rJED63kfF22PXAai9o7qfOdmkv4c77rnzak@lists.infradead.org
X-Gm-Message-State: AFuF++na6fFGSj7jBDV/onVRXK1Vu5C+K0bHHL2c7BcmUIr1IcD2AUEe
	6v4xri4W3m2RnR61NwlhC0P9wG1qBHnccs8eM7aACxWJTsIaOQiNpPcQ
X-Gm-Gg: AYBFou0ZpF/E7n9AUdsm3Fp4K39EjHgtEr+On8bRbxic2m4WwgudZGGv3YmJqbRSuyD
	drw4NEf0qHY+XlQ5lG+iBWlgg7Fbug6DGI2MpVBUWXHgFD/B9BO8tDwiAVuRIleaj5yFKQ9fr4V
	jT7tF7B0rAd5+7KNDin9wDyQxtZ1AU6B8WyO7IMVxy5gaUlW4YLKxbCfSRNs5jOpesXfuTKt9w9
	RCmQ8G6uf+abwE41mFMu6gNCP1b8Apqj1BvujnwVfZQ66PIkJB0lSfbeC+kEek6fiirFNTiF8/F
	nok8ZaCl/3nHjAny1jhtAZAwp3av2Chcw1ZSa71KZnGrsSTBJDHOsmKZAtCajvAwRPQ0MVyWriE
	Y7ZPQGmBoLbIl3S9aAeNWfdjkheen8TJHUYxN9zMhYD+mylNyX6qvfjcJYRCJIU7heC9kL+E0k9
	LVk+bDjx+FzuiN17bJoTKNzcFKeN8TBOFRlTfc98bAruF86W4ncuJcybRrdEZj84/ct9f0ejLGD
	I5EMHhc9bb5TXrmtuvr8ZgoU42Sjamq9w5LHb2qgwLWNCvvtqQn
X-Received: by 2002:a17:90b:2808:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39b262aaeb7mr44896355a91.18.1788859731444;
        Tue, 08 Sep 2026 02:28:51 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm32109846a91.9.2026.09.08.02.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:28:51 -0700 (PDT)
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
Subject: [PATCH v6 1/6] dt-bindings: display: verisilicon,dc: add support for nuvoton,ma35d1-dcu
Date: Tue,  8 Sep 2026 17:28:35 +0800
Message-ID: <20260908092840.225220-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908092840.225220-1-a0987203069@gmail.com>
References: <20260908092840.225220-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_022852_661061_5690F88D 
X-CRM114-Status: GOOD (  12.37  )
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

Add the Nuvoton MA35D1 DCUltraLite (nuvoton,ma35d1-dcu) to the binding.
The DCUltraLite uses only four clocks (core, axi, ahb, pix0) and one
reset (core), with a single output port.

The MA35D1 clock controller gates the core, AXI and AHB clocks with a
single bit, but each remains a distinct clock line feeding the IP with
its own rate constraints, so all four must still be listed individually
in the devicetree; core, axi and ahb happen to share the same clock
phandle.

Move the clocks/clock-names minItems to 4 and resets/reset-names
minItems to 1 at the top level, since that is the lowest count any
supported variant needs.  Add an allOf/if block that tightens the
constraint back up to the fixed 5-clock/3-reset topology required by
the existing thead,th1520-dc8200 compatible, and another one that caps
the new nuvoton,ma35d1-dcu compatible at the 4-clock/1-reset count it
actually wires up.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/display/verisilicon,dc.yaml      | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
index 919a900122012..773966677d0f4 100644
--- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
+++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - thead,th1520-dc8200
+          - nuvoton,ma35d1-dcu
       - const: verisilicon,dc # DC IPs have discoverable ID/revision registers
 
   reg:
@@ -26,6 +27,7 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 4
     items:
       - description: DC Core clock
       - description: DMA AXI bus clock
@@ -34,6 +36,7 @@ properties:
       - description: Pixel clock of output 1
 
   clock-names:
+    minItems: 4
     items:
       - const: core
       - const: axi
@@ -42,12 +45,14 @@ properties:
       - const: pix1
 
   resets:
+    minItems: 1
     items:
       - description: DC Core reset
       - description: DMA AXI bus reset
       - description: Configuration AHB bus reset
 
   reset-names:
+    minItems: 1
     items:
       - const: core
       - const: axi
@@ -79,6 +84,45 @@ required:
   - reset-names
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
+
+        clock-names:
+          minItems: 5
+
+        resets:
+          minItems: 3
+
+        reset-names:
+          minItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nuvoton,ma35d1-dcu
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+
+        clock-names:
+          maxItems: 4
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.43.0


