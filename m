Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0508AEDEC02
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 03:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqPUSx7NN053MAPTpYFUkReAMvsw/zhPAKa/7nlb7s8=; b=oOvo4VpJ5e9cdQcdJAQfqrgDQe
	AlpACM+kull5XCVA7LpZ4P/OMvgXvFSs+kxt8w3eMYbj3qNyhWi9rj7nAFXOtSt11+ckJr5gL0Qxv
	aHF0LJT3+D9m8CLNP/FxPZHoJQ2FPa06GUVcJI8l2cvIX09gCX6tOK3KFIe+lKkHYMM+UPuAnCImb
	QwkXl4PEERyzKRIoxLcuNU+DiD3rAz//35elzts3m8vHFjnRu+na/HvG073Cnh6mEisbL3vzLfjIa
	zdL8ABSHXFkL2Qcmte3LQcg4IKgdxV6lWaWic4+qgM0pNHogi0nGLthxsAxlZqlrzhu4+2Ma+ZASn
	+wOAFBAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxd9i-0000000GOIQ-04Bp;
	Wed, 04 Mar 2026 03:44:14 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxd9f-0000000GOHQ-1ryl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 03:44:12 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-506a297c14bso55881931cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 19:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772595850; x=1773200650; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqPUSx7NN053MAPTpYFUkReAMvsw/zhPAKa/7nlb7s8=;
        b=CayywxDOkuX0S7cx8W+1UiNURc+kjB/flTTPaU9xvDbnwLQzBLaqQs7ssVDmz18V9N
         2ZL7Xx7RDvjT8xxzdq7K0qrmG4zCMrejeHIqE2IfAAr1seDqg4jfLsrlkElsaz/TPkJ3
         FGU1f0m1F6Pkj4fSkH7hIR7YzIANB5HbsW3ibpAL0oYD50P4ppzjHHIAf4FxMkkZov5z
         GfP/MM5osgeUlD/mVmV8gH/41Tr1aCYUbJRltO0bg442bvwFmqAlCY8zBEZdbPNOipmQ
         S/Lk9ntwgmex75Sedip04UZHQXN50Vr2NtXlfLUUWt3LBsWIzWr2i/wxnedLe1Zk2rGy
         yRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772595850; x=1773200650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MqPUSx7NN053MAPTpYFUkReAMvsw/zhPAKa/7nlb7s8=;
        b=UAd2RsKCVs3GON7smhojvkKliaiz5G+LJXdd80t4EAiK1IEg5SPnUpa8WNsq2pkTe6
         EKHrbnHVhDEzWc7sgNMsFUmY/BGbp2OmGzlpAWZuUzwTPYmJw1dBiAXKCpZ8LdV8Ml8x
         VN7DBF/ezPj04ftqZBF2/0lh9n8W/vzGErW9S9pG1xKAQBtXZLu/UYRDwYBv0q8cDIzd
         j2RVbWACBMNIZzWcAWU5jHJQEJhrQ1RZ978+UaYbywu4M6h0soomlObc4EN6GbiqyOKW
         mBiTu2tWu+5zjzAAqayTm4UBzZ9vDHQJ3FPLrQDpLEdP+KY2LRmq54ez12DwtMGIghky
         RPcA==
X-Forwarded-Encrypted: i=1; AJvYcCUTgaB5zlBn3JEYzKq0XJzNz6YBnE5RhNegwCxHfFPzOAdQV8t1IFZ0R12hnDvzl4b57joJSgsAFaTPRm3zlj5r@lists.infradead.org
X-Gm-Message-State: AOJu0YyqftxuaXuE2P4e/16z/Ja9nSWHLpzp85JvRDS5bfxPV0wCDwbg
	gsgAdVWDN97UIsxvy4a4AopaaOFIuYKkanzuaf3qs62PtjiJKVMBphX7
X-Gm-Gg: ATEYQzwqOur9obNyryg9NrV9oOgyRZdjIBAOuc+xr1SkSuQZ+EdvTbifavTKAvS2l1s
	8OiUfWJNexTbhY+5bXI1nhA2TTPi99agkFuqHc/eWZwdv5I8rddpkmJuOQfe+YVFdTKtsifne9C
	UoLfBC8xbKrJLtaL0qPNvtVpG1deyXRPgPswntj4lAaEgscjoNCjMXijsf5pKt9urGZbC5RbsV4
	+Mx/egx9RNidyIdttSdm41yIrao/AuMY8LR9Zjvjv/mgM4boz6pC3rHKCm824pVNkTpgzD4Zomq
	fpdT90AH3ibJWLptTRNQ2VAc3ZZN6kDv1r4g911BH3Qa0OkWofoZqtklENqti4hSToqpdklkOGj
	HX84NaM7yzUHdvq97osMrRf2gq678+EB0WC3BMtGupu4HZyp3acgV9PClC8AzOvWWsGGNGctQ06
	9WDXotgbWQxmPCtMfffx5AkN3p0pw=
X-Received: by 2002:a05:622a:1828:b0:506:9b3a:2199 with SMTP id d75a77b69052e-508db4352a5mr7908731cf.67.1772595849959;
        Tue, 03 Mar 2026 19:44:09 -0800 (PST)
Received: from [172.17.0.2] ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899e608cfc6sm88603286d6.14.2026.03.03.19.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 19:44:09 -0800 (PST)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 04 Mar 2026 03:43:44 +0000
Subject: [PATCH 1/2] dt-bindings: power: Add Support for Allwinner A733
 PCK600 Power Domain Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-b4-pck600-a733-v1-1-2f54efdb8cc2@gmail.com>
References: <20260304-b4-pck600-a733-v1-0-2f54efdb8cc2@gmail.com>
In-Reply-To: <20260304-b4-pck600-a733-v1-0-2f54efdb8cc2@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_194411_509316_F57AC424 
X-CRM114-Status: GOOD (  13.45  )
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

The A733 PCK600, similar to A523 PCK600, is likely a customized version
of ARM PCK-600 power controller. They share the same BSP drivers in the
package provided by Radxa, with the only difference being the lack of
resets.

Therefore, document A733 compatible and make resets required only for
the other models, as well as prepare the PD definitions for future
device trees.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 .../bindings/power/allwinner,sun20i-d1-ppu.yaml        | 17 ++++++++++++++++-
 .../dt-bindings/power/allwinner,sun60i-a733-pck-600.h  | 18 ++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
index a28e75a9cb6a..b97361ce2a00 100644
--- a/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
+++ b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
@@ -20,6 +20,7 @@ properties:
       - allwinner,sun20i-d1-ppu
       - allwinner,sun55i-a523-pck-600
       - allwinner,sun55i-a523-ppu
+      - allwinner,sun60i-a733-pck-600
 
   reg:
     maxItems: 1
@@ -38,9 +39,23 @@ required:
   - compatible
   - reg
   - clocks
-  - resets
   - '#power-domain-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun8i-v853-ppu
+              - allwinner,sun20i-d1-ppu
+              - allwinner,sun55i-a523-pck-600
+              - allwinner,sun55i-a523-ppu
+
+    then:
+      required:
+        - resets
+
 additionalProperties: false
 
 examples:
diff --git a/include/dt-bindings/power/allwinner,sun60i-a733-pck-600.h b/include/dt-bindings/power/allwinner,sun60i-a733-pck-600.h
new file mode 100644
index 000000000000..cf476a005b55
--- /dev/null
+++ b/include/dt-bindings/power/allwinner,sun60i-a733-pck-600.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_POWER_SUN60I_A733_PCK600_H_
+#define _DT_BINDINGS_POWER_SUN60I_A733_PCK600_H_
+
+#define PD_VI			0
+#define PD_DE_SYS		1
+#define PD_VE_DEC		2
+#define PD_VE_ENC		3
+#define PD_NPU			4
+#define PD_GPU_TOP		5
+#define PD_GPU_CORE		6
+#define PD_PCIE			7
+#define PD_USB2			8
+#define PD_VO			9
+#define PD_VO1			10
+
+#endif /* _DT_BINDINGS_POWER_SUN60I_A733_PCK600_H_ */

-- 
2.53.0


