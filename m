Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5719BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 14:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bK+c3D63UjZ8jufbmxbZOM/a2XsXZv8kRnKHQX4cpEI=; b=0PUrAqyfmtuYLmURHFKj+4B1oU
	398llSyViErUA2F2vfOsWeAGhzU4cPIjVInsI/6PsM2tVNGkFQhpVZxs2YKbbHe2gtBBu38YGduOR
	jT8EZoilBRL9iTYHkOHAUEPtPJKeVqdpnZ7MupiX5zOyNc3XWFXKEvKQ/SwgwNhT2Zc7luLCJdTm9
	xHnZdsbgRBPLSugfDxC1yEu2lTbcgXtFkAglYyKwQfmU0+tTFJS7mF/CzwnkKuVdqAsIdZL0J97eg
	IEAmC06SS5+HTJ/BtFeufXwbZuV3t1UbS4HWhSeI0mApi2Z1vGg+XLu3tlfJDXnQPCl87iCUD2RsO
	zCSmYFCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0iSJ-0000000C41f-2rTh;
	Fri, 04 Apr 2025 14:55:39 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0i8n-0000000Bzt6-38qJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 14:35:31 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c081915cf3so260068085a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 07:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1743777327; x=1744382127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bK+c3D63UjZ8jufbmxbZOM/a2XsXZv8kRnKHQX4cpEI=;
        b=eSsVj++V1FU1pT54UTQPfV6gNCUQNCQU9qSjGm3QpaxhRRaEt9F33Te0BZ9YC+hwM+
         vyTL/wOwn6j6nk0G2LOAL6jE5RxTGCesDwsiHF5V3fg3zav4U8GAO+e8UPOa+mdBtKb+
         4DVFbEUp/ZbmN7z++WTnSkCsfngIhx3f0tjz1oms/e7fdFTTN/iUX+ZC16SgvwxP+Cr7
         30hVb1UhSik5OVTHgn61/PDJS6cZPXzvZiLZqyNyf8co9+mDee8FUtHpo4t4hcDWTeqR
         8UVhorO9PWiK8O9gC+Y/ReATF6aRM+iEhY3+Fk2wY2I+4pspF2rmvSnazB5WrHzqj849
         WajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743777327; x=1744382127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bK+c3D63UjZ8jufbmxbZOM/a2XsXZv8kRnKHQX4cpEI=;
        b=NM2KpkL0E211Y3fhe/iZBAxoZDRwdzETDduD/665MZz6m3tUKEYrKmqDwTqCHFMBqf
         lCUZKVoc9RW60AMR/Xuw0dyWYwHkHXz+qwdrOTCs0WSi4DmNEUIp1JdENjeP2rTSlkDc
         DfpKCcDnb4cQkoc8e0BKs/F1P9MZdZoGQ6Rk6fLdZi6/4HXPZJSQP/j4l8SC0MoHbbQE
         CY1TcRwz4ECBP+SsxD8w50LgVzA1m77inY3Ahkq4LQjiUjOVaHadK+QM64E0GzCwhtzr
         7lZhBUFsOVcjbK4ldXIGAMcCM//knqroCxRDrNaKKysDsPtQgAIEHjjchQZg9Nq5MGtf
         VCHg==
X-Gm-Message-State: AOJu0YxEn/YLU+rl8uVGwtGWk7REUlcB6mxZMPZLD9aImebaRorDZhH1
	MblLPkrDWnCayDrpKLh0QSP8D5j4PlgzjzE4yeF9GR4NNIoj3gzyCIB323GBr5ND+MX0Ci6awRR
	q
X-Gm-Gg: ASbGnctA7wfFSYYK1QBRkJnWMZLcSfRx1ETgZV6DokqT3sYnwo1ShYTfAhrOkHzKxl4
	zKfiXtEWUMFYt23aTkTAGWHB583B4QSzc3MG9K0qWYkhMvW04PBjoUJvGzqV53GNmWukm39ffLP
	rMOvpLtG6UOaFc4YQ0lEAIkKNx4hnwPw305KoXFBEYSgXY8i5INNRbGgbyNR8mB/D8Apoz82Y3n
	53EY4hd5x4yGiQBnhKvGUiUu+VkcdtfGf8Zpf5NUulhNuq/n61NIPIG5dt2Tgmr1h6KPVgxEudz
	OXzAJWHNa9obi1F3nCyyZsdb8HJOKIvbLp3gL5ymuhivPgKnpL/lbz2XEWR9KWnRgvqrU6yXifY
	=
X-Google-Smtp-Source: AGHT+IGpe2CJgpCsJsGayaNpUYmgMLrht7bkJyklskD3eOS7aHMmjw5yzUjbFsf/0aNBZKBvoN2DUw==
X-Received: by 2002:a05:620a:170a:b0:7c5:50dd:5079 with SMTP id af79cd13be357-7c774d2779cmr487860885a.1.1743777327595;
        Fri, 04 Apr 2025 07:35:27 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e735419sm224204585a.15.2025.04.04.07.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 07:35:27 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [PATCH] ARM: dts: stm32: add low power timer on STM32F746
Date: Fri,  4 Apr 2025 10:35:14 -0400
Message-ID: <20250404143514.860126-1-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_073529_985939_CB58AE75 
X-CRM114-Status: GOOD (  11.90  )
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

Add device tree node for the low power timer on the STM32F746.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 arch/arm/boot/dts/st/stm32f746.dtsi | 34 +++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f746.dtsi b/arch/arm/boot/dts/st/stm32f746.dtsi
index 2537b3d47e6f..208f8c6dfc9d 100644
--- a/arch/arm/boot/dts/st/stm32f746.dtsi
+++ b/arch/arm/boot/dts/st/stm32f746.dtsi
@@ -43,6 +43,7 @@
 #include "../armv7-m.dtsi"
 #include <dt-bindings/clock/stm32fx-clock.h>
 #include <dt-bindings/mfd/stm32f7-rcc.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	#address-cells = <1>;
@@ -245,6 +246,39 @@ pwm {
 			};
 		};
 
+		lptimer1: timer@40002400 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-lptimer";
+			reg = <0x40002400 0x400>;
+			interrupts-extended = <&exti 23 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&rcc 1 CLK_LPTIMER>;
+			clock-names = "mux";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm-lp";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			trigger@0 {
+				compatible = "st,stm32-lptimer-trigger";
+				reg = <0>;
+				status = "disabled";
+			};
+
+			counter {
+				compatible = "st,stm32-lptimer-counter";
+				status = "disabled";
+			};
+
+			timer {
+				compatible = "st,stm32-lptimer-timer";
+				status = "disabled";
+			};
+		};
+
 		rtc: rtc@40002800 {
 			compatible = "st,stm32-rtc";
 			reg = <0x40002800 0x400>;
-- 
2.48.1


