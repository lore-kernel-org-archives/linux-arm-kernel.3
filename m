Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEC0C98306
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRVzD7/e6IROrFrMTSU32rtgAKkxa5C4zngEyHP7gSA=; b=IypP5mCLKB7gAPwdDP0PeBfIzU
	kLtFyAoEFHZnLmk9JBr8Dc5ZhrYuMBJmThOinIIXb4gglWZfMxBYVTK9WTRGlw8VJei7NOi/Vf1YV
	aIU2aGyXpfR79aBhjEyp2ldgUPazx1BkvfPpFhN/6cRmqjBxJr8cQYtRJVrfabYz8gHpIj/poxsw/
	T9ImTR4a0dOkTQO/H6t9CmmyBpQb4UaDNQt9O7/DFehXmXYC0SmZwQBIdXI3fITnmuNAnQW6X6DPL
	BQ5TD0IWnJcMbdEs2LrPfnNBPN5eauCXDsjI7LG+TkYkTncppIscf8whA5ia+GxOo1x8KF1FH/3Th
	K1AmigOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vSD-00000004akD-3tmv;
	Tue, 22 Sep 2026 08:02:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vRc-00000004aJL-2EMp
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 08:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gRVzD7/e6IROrFrMTSU32rtgAKkxa5C4zngEyHP7gSA=; b=RLc+W/l0JE9IoOdYii5WXxGHm5
	R5WoAvhJOMOYU54/JvpKg8/GldO5Yf1G0695i8D/JRv2RxGowxJAp/qLWl3tDGhMfhUn9o5CV4ru8
	pklawIS0Ur66fllo4/HSbzdHwVQfurdSqLhSSMvvztM5CP+mWGB9wKouT+aM2sRLec8K1Ni76a4oz
	8vAiFNE9pUlEocPBJvznmjucBhbltMmnN67D7FIM3+OmdCWxDSZ1P0Uu+9rOrPwvhOtzug0uuAibL
	E5v/i62zyTk4NmkEeNAZx+poEnTrn7qIWn+kyxAQyF5hwuV1J0+pQ4aM3jMFLMvz3Tt6RwRhMS3zo
	XKqjld2g==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8vRY-0000000DEfc-1nye
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:01:39 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b93204449so2951465e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 01:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064095; x=1790668895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRVzD7/e6IROrFrMTSU32rtgAKkxa5C4zngEyHP7gSA=;
        b=TaUlBuZWTQbgrHIrZ8S7maC+m03FyWJ5SVR7i6Pa7Ef2VKntOXBPlJ+ul4eyhy5UlQ
         3rnVKQWoVIA2XysOT1TTZGofLOOv9qyFEeG2Tx1tAqkMa6k3RY/htkyeW+ZX3qT1mUGi
         e0NN9ic2lC2bXJRhONu+g8+7J95fQ+yiIiQEYGZ96xMsZQ8yO0r8t0YMHdzvvGrV0rHj
         VWGOFNF3q5kp2zz6RlxzhEkZb/1F6HzmupU1E7An0kbezd92nGSpqYc/QrwLWr92nMXo
         4yKlOZW5P9nFF3oZJNrcdEHDHz7nxqhpF5KuZ3pIrDiliRojSolVloNqXspf2bdZZqQC
         7Wuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064095; x=1790668895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gRVzD7/e6IROrFrMTSU32rtgAKkxa5C4zngEyHP7gSA=;
        b=RR+31hBNsdl4+7tIhAaywLyGQsAEDt5g1Tl6fDZVs2b2JQBDvKChzluJzshQ4jfXDr
         Rvw5ZUqbgghbSFJI5gyIOa5mg0ozb5MD8i/3lA9zq/MOkLR7d8GufSLCvq9iSNCPseRC
         yvwzQv/C7Ey9TNKk5TxcA0vjwpfdDlh/KnX9HHYJTsnAozDJ1eT+AdUXwDgXL8FO5ZD5
         uvPIpd/m6noWoZq7B90ARYEaGoDxQZZIlCaa1jWeEqUEfaT3Im5K3Ej51ZhL1RUHahZ+
         hQGfjrqbpvD+srdR73UAyQSgOSw2G2p1vMKHGjTWeH+En5cOP+oMuAfgCDQK0vOyVLvA
         5mqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPD6F9gMF01t1sd1iMdYZivM/UShEtYCKlaUcDVYXOoAIDvKYFSuHzOLu2D+ysJX/CfHCV/dXdyojea9qdFV7w@lists.infradead.org
X-Gm-Message-State: AFuF++lnTJDU+m6htWdpLtNlNJ+2EHl9PhsDbWVBPqTzZU2EoiPMJyy5
	YJhb8NHaYLkmP8lj2m3EqJu/vqauj1NEi3jirsUMcqkKWxjPnu/N7nR3
X-Gm-Gg: AYBFou1NUU6ky7HTFpzDIgCRbLsVbqtxJB00IyKSxJXaexrs7pCVB6L/QgApWam6k6A
	u87lzlQDLK8tfBnU/LDZg4m1Pn76ScVptwojxgetXc5fh0UQniJpNgv/AGaQFeRuIefVFbo4wKR
	LuADp00c5WLS1LN2DDOIfFp5Qbf+2qSgDm4F5s09CMe9QducVD0YEXrTOlgYhW9roJIOnFE+Van
	dI4GVjfba/MA4MyBtKI4dZSM+tpQ+VTX86QEo2ShDj6Zh7kwSjIhRUXmn8cmIv1h1CS3pswaJTH
	fa4HRWMIXKOzR4D+fSniHie/pZEfxTsFwdDgbGMm1LlyFLmHW2vunML+LGYi5Y9L9ojUlAtrfRM
	STERGEEYa5svoDXFTQ0gEBI71ZmV+QN+OUVIEstMkIWR7/nOn9rzo+FieLBNUl3vwi9CWMwAwtA
	pZhFgaU7lf3FGeW8SEvdFSbnzeghHYVfght9sefgNC9Kxm9sLy0lZ7z7WRlbiBG0XGdgLRPuO4E
	t/XhVanWdbwrBqN+eO0vSjA9os4oERNvxt3buVwljgiB+YinK0l6o/X4mU2Iq02smEYlb2acZ9a
	fQA=
X-Received: by 2002:a05:600c:609b:b0:49c:f9b8:bae0 with SMTP id 5b1f17b1804b1-49fc7f2bdc8mr199260285e9.2.1790064093776;
        Tue, 22 Sep 2026 01:01:33 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf97e2sm18248625e9.2.2026.09.22.01.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:01:33 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2 06/11] dt-bindings: npu: rockchip: allow DVFS and thermal properties
Date: Tue, 22 Sep 2026 10:01:09 +0200
Message-ID: <20260922080114.44662-7-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922080114.44662-1-royalnet026@gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_090136_729127_FF6D1CEF 
X-CRM114-Status: GOOD (  17.52  )
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

The three NPU cores on the RK3588 are fed by a single clock and a single
supply, and the firmware accepts a fixed set of rates for that clock.
Describing those rates as an operating-points-v2 table is what lets a
driver scale the NPU instead of leaving it at whatever rate the bootloader
set, so allow the property on the core node.

Throttling the NPU from a thermal zone needs a core node to be usable as
a cooling device, so allow #cooling-cells too.

The OPP table belongs on every core, with opp-shared: the cores have no
clock of their own, and one shared table for one shared clock is the same
shape a CPU cluster uses. #cooling-cells goes on one core only, the one a
thermal zone's cooling map names, because the cores cannot be throttled
independently. Naming one representative node for a shared frequency
domain is the established shape, as in "Cpufreq cooling device on CPU0"
in Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml.

The schema cannot enforce which core carries #cooling-cells, because all
three cores share a compatible string and a node name pattern, so that
stays a devicetree convention. That is the same situation as for CPU
cooling, where cpus.yaml does not restrict #cooling-cells to cpu@0
either.

The example gains #cooling-cells; the operating-points-v2 property is
exercised by the RK3588 devicetree later in this series.

Assisted-by: LLM checkpatch dt_binding_check
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v2: the text on where the properties go is rewritten for opp-shared on
all three cores, following Nicolas Dufresne's review of v1 3/7. The
only change to the schema file is the wording of the #cooling-cells
description; the constraints and the example are unchanged. Conor, your
Ack is kept on that basis; please say if it no longer holds.

 .../bindings/npu/rockchip,rk3588-rknn-core.yaml        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
index caca2a4903cd1..beba1896156f5 100644
--- a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
+++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
@@ -42,6 +42,13 @@ properties:
       - const: npu
       - const: pclk
 
+  "#cooling-cells":
+    description:
+      Present on one core only, the first, which stands for the shared NPU
+      clock as a cooling device. The other cores have no clock of their own
+      and cannot be throttled independently of it.
+    const: 2
+
   interrupts:
     maxItems: 1
 
@@ -50,6 +57,8 @@ properties:
 
   npu-supply: true
 
+  operating-points-v2: true
+
   power-domains:
     maxItems: 1
 
@@ -100,6 +109,7 @@ examples:
         clocks = <&cru ACLK_NPU0>, <&cru HCLK_NPU0>,
                  <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>;
         clock-names = "aclk", "hclk", "npu", "pclk";
+        #cooling-cells = <2>;
         interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
         iommus = <&rknn_mmu_0>;
         npu-supply = <&vdd_npu_s0>;
-- 
2.43.0


