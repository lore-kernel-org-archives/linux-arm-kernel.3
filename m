Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793F8C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkYtc8Zy+X1nQtQQfmPXyE49NKh145BAfNH3nX3cWHM=; b=sdJ+3F2skGgUPjDvtub8HmU/Pw
	zvv2Lm2RlujQJbFEOQjYn17cXNlAXBqc7ol+HyMw3luVUX4fR1FfZ/yRwiOKvrksniFYgQViP5/jL
	5RRszRElSPRxbZuUfzEqvV0UoyfXKGd14HUWGFPuKNnluijA7QEj5f/IMyBtLTNgU15hLfxz3U6/U
	NrUpotWNPZ3s0yTSGDRq36SwYJmXSAnJ3k77NSaQHhIfcJLpYJATSoP0NomEH4gf1xCeSdQUmq+7l
	LAfWqUuEifrbR+g/JKyaVOttdtm3MIk+xVtD2tdpc/NClMLq2hxnNlOA1j9tCYv3Hy+nX0aqwdxvu
	PTHO0tFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tfg-000000026e1-3FE7;
	Fri, 04 Sep 2026 13:09:32 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tfb-000000026YK-3yLc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:09:29 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b4ba7fe26so267125e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 06:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788527366; x=1789132166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WkYtc8Zy+X1nQtQQfmPXyE49NKh145BAfNH3nX3cWHM=;
        b=r3QdrH+m2BPWCjRLkaR96wkwXqfl3tVD01UfL2gb8tpnV3eNoFL0gs+oNsGXDaQy2S
         sBtP7mFl5D+OPiF/L3sMmzZ8tzi3ZhEl/PGwqT1fNeiiIe7CcB6Ec6Ji2ltQFfmZOLQ+
         Q34MLDbsDTutF0doM7VF16JxvoS3Kvj4iqNVbff7HnFnizAafGmp/AgFOqyAdxTu+XVD
         eX1tlgwKElqn1S1BUszBw9fJuqRy5aHmKEG1cqSe9SRplKa5ufh+M2MFw6bg+/n/VOer
         iXUg6MGz55Q3ENXbpEMI0qqQiaktFd8VhDEpAthCYi1h4HZNZkQh0Jr97QzmBYQGGqgG
         203g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527366; x=1789132166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WkYtc8Zy+X1nQtQQfmPXyE49NKh145BAfNH3nX3cWHM=;
        b=ENip4Y5yPwFDGoAkHN5DravOanOCv1D+8OYZhWERxhZA+aO79TwlF766UaECeGMGAk
         mUSy49lKEHFzkqo0RFxOF6fqkceuUq5PBuiNgkz6yeUAhEgn50VjAPbg2VVkDz2w4SO2
         gbqlYLMTaAzBWW1MUEtTK1gTP2TKZHP6GjkCoAjcliXsjKpmeMjgJ1DnWqyX5XUQCLXc
         udeJmqWJTSjf93MQ9IgmZjHv5S17S493fLOaM21dHDoj9hR1ttBQcOMOq97JKoEB9YUc
         YIYxe9Zd2H6vD9NWGrfmvle10DNz4aZnXAJ04qqTr8eSY025PcKci8B5wZtT+GmevU6i
         qlqw==
X-Forwarded-Encrypted: i=1; AKwUvByWfcQc1fWY3AA0ROQkaTS0ZwZ+74bUhGZ5D6ciVRCGfFToaBTL7+F/Bc6+Hakam923EGNzq4pKV/FEO3VaoZSa@lists.infradead.org
X-Gm-Message-State: AFuF++lBcM7LD0u4cpU8v+aFn1rrYNEP1ZyW/iNPVZusmJMSc6oY0vm9
	fHr/0kazyega2P8zsqjZ0w2zE/N70zgVTZ3j9TosrAb8gxolPA/56AxB
X-Gm-Gg: AYBFou1vtql3dD3MflUJrP4tpi062ftaoZ1m7vuDnt3cfHITj+99KV4gxvRMUJofp73
	Vuqd4blUsKw+7mWUjiPWmIdjFo+/E2IX3jLzGV+tDhsUM/Z+2TR+2RqV/Bzu9QQ/ImLdX/YGbWc
	/FfVTtAIcSlwTDNa/s79ZpK9xeUP+uC22WQDQWtuKcvzKfmkJDwdEMQno4A6ASR4nv1rtg9ewCd
	MUrynownnjSa4ZuBXRNXgzsfsK31o8HpA7jyXZFG3HHQPcvHIZ0IMdUMmUb6OK//7E/e0bn/his
	ODSRUXsJ3BHIUolFG6rv0V44heHkyQ60xKbx7uewnZYxhwAKGh+BBMEDWYbGg/JtqySFJXxWxgi
	HMpgOpd1/EjWhRRmb9ty98Alv/mBZnwDvb5hh3pdPPtI0Xi6XZ1K6XuB6iBgqtQGx1J/fv/NnCr
	fjJ/ZkdhpDfjJHwDOTwA+gHwgaYlGBMvFqdLTnxjDW70sqwN20uKSxFvAZeXJsoZd+t4DwZHJB2
	RiaiRYqMvQUdCxX7oY9+6GZMj3Ch3Wzflyb41GCK9cs4CUd2Ikmoz8pBGMEqixnnSIddkkjeTf1
	/sdX2eY0slATZMk=
X-Received: by 2002:a05:600c:34c5:b0:499:cef6:104c with SMTP id 5b1f17b1804b1-49cf823c012mr41127815e9.1.1788527365941;
        Fri, 04 Sep 2026 06:09:25 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B871500CB6EF488A18F9C42.dsl.pool.telekom.hu. [2001:4c4e:1b87:1500:cb6e:f488:a18f:9c42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm135575435e9.3.2026.09.04.06.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:09:25 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH 2/7] dt-bindings: npu: rockchip: allow DVFS and thermal properties
Date: Fri,  4 Sep 2026 15:08:53 +0200
Message-ID: <20260904130858.27803-3-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904130858.27803-1-royalnet026@gmail.com>
References: <20260904130858.27803-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_060928_005134_8D9B8B59 
X-CRM114-Status: GOOD (  15.26  )
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

Throttling the NPU from a thermal zone needs the same node to be usable as
a cooling device, so allow #cooling-cells too.

Both properties belong on the core that carries the shared clock, not on
all three: the cores have no clock of their own and cannot be scaled or
throttled independently. Naming one representative node for a shared
frequency domain is the established shape, as in "Cpufreq cooling device
on CPU0" in
Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml.

The schema cannot enforce that placement, because all three cores share a
compatible string and a node name pattern, so which core carries them
stays a devicetree convention. That is the same situation as for CPU
cooling, where cpus.yaml does not restrict #cooling-cells to cpu@0 either.

The example gains #cooling-cells; the operating-points-v2 property is
exercised by the RK3588 devicetree later in this series.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Assisted-by: LLM checkpatch dt_binding_check
---
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
index caca2a4903cd1..595aacfbf8608 100644
--- a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
+++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
@@ -42,6 +42,13 @@ properties:
       - const: npu
       - const: pclk
 
+  "#cooling-cells":
+    description:
+      Present on the core that drives the shared NPU clock, which is the one
+      the operating-points-v2 table below is attached to. The other cores
+      cannot be throttled independently of it.
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


