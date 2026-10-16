Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3F1CCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 23:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsagHKk4Izz9QG2y+9vzDv+u1V8rfrHnbTHd/Qn0ZOc=; b=tYheRNkHULCQ+ymKH+Jk5+aYgc
	iBQcwpCzEPcqZIoBlMU7GXcv8NDh0amtbBLst5ihrFvBFGARsyZ459Iqqhs2VDcwo3KrZnKXDUeyx
	l6017axjWyIcr/wmlw/adxqhreKL4PaEDEybvtowmYKJBrWAQQHv3XHSKHu8Zdwm8K2pv95ivx2iM
	ohOt81K2GA7+UaJujqoh928vocn1EOtLwAEXW1sj4TRlGmDiGMuKBhkzZ7eBRHLqTdli3XlJQ1Aa8
	UPuBBwcA9Yg4Edyd+/czncOwdpdnaCS5e8u1+HLLeP/Zow5ulnq4ShQPKzwxefAgZC/gMx7J3mZUz
	n4bV9nCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHrLc-00000004Cg4-2OFK;
	Fri, 16 Oct 2026 23:28:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHrLb-00000004Cfm-1Uz0
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 23:28:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AsagHKk4Izz9QG2y+9vzDv+u1V8rfrHnbTHd/Qn0ZOc=; b=qXPj0hr+6EfY80XdCMbwHWGAo2
	nX5IlEMjhqNftL/czaijLRuNisZwgPmUT3r10hU0l70AiX2OrXqo50jGTfSkhkvhJJBwjt4hGROxa
	369sjIX9Cxip4eIbHojoL7ed/iSSTxQ/87rabuUOVT+fpKkW8HjnUUiA3ulGfZd1Remu/w5GaDTZT
	yN5UIlcjyIKg1q8gbeLDXvMEH/QkmWTuI7z5QQ5PfGbNQqagRwIwXT1egk0/vhifl26E0RtG1sbj4
	RTzdQl9r3RNbukbNZZqDzoma5lkC36/PMZCqVnzWyUTT3edrXB49W6PuIBx8hC/y7N4WycV4WiE/T
	l//r79xA==;
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHrLY-000000021rV-1kXo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 23:28:22 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-5e82b413858so136472e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 16:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792193298; x=1792798098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsagHKk4Izz9QG2y+9vzDv+u1V8rfrHnbTHd/Qn0ZOc=;
        b=st8DADi0YS/L0ssJJaq+/WgnZlV9PDQQhst/JM4tNb3QnHsJm2fKxWJU/lWeFf/Z2j
         EE2fgh1GlZE4xBf64MxaRNMNT1auxADAHIjD3GWvRy2K46fdg6OmxbSDk9gcsHd2Pp6I
         p9P1OcZL+sJ8nXv/f9i9R15W940TqeutSvSHTGpJieHI711hcGkgKKEnxix5YIzmgw90
         yHftjwp4IHzsOHrdLS/cgiQkFvxQriQzheyFJK7n3FKx+BsckJ9/uT8uaEwGpvKwqTgP
         ZE8himbY0oIsuSZpuWdaQwvQNxLvjBjxXG2wlq3mQgPDgGS1i3UbfGzUW1VYDM4FF/+l
         LvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792193298; x=1792798098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AsagHKk4Izz9QG2y+9vzDv+u1V8rfrHnbTHd/Qn0ZOc=;
        b=hzqG2ouyUdecS4Bsvpsz7f28v6dCGgSfun46gtz2BP57NpDBD77oaKdeCpSwuic7Ap
         aeo5vH5OXyvjVHkJvUk7YDicz1VKoBYOnAqQuGtjFqiwX6s1OBzinvv7/yHgdME5hwPB
         zrpnRzZMGcFqI3/3cHkrupp4pMqSb1R0/tmhQ2amnziNIngm3erG5SWooYMTLnyhNuut
         Xh0GsDIh2az+ic+QWjkWB/H17+6cdjp2HFgli4hc1vbAeylQO3zbNvgLdNMk2R4nv6HY
         uoQtpFUXMnpUCU3/PMbMiB77BFq/mbBVzOB9oTVmnbB90BIWvrSAD3OHyanF34XUx82c
         V2WA==
X-Forwarded-Encrypted: i=1; AKwUvByEi8oudp1EH8F03xuQaaQSsGgtPq+mHDYN9znu9jv2qQGgrPyfV2OC+iNjT+4vG6lwU+Jg3NtcDC9hWNLwPwkU@lists.infradead.org
X-Gm-Message-State: AFq9FYJNEzI4VODVnov0kcBj69EVEN51QNWLZUCEKY59DuQdLLM6BGHA
	Ash91Pyu5kB7Qxb+u1ACV1NhXk/K2zw1YYYyKKs9Q/iEV604hFOypw2k
X-Gm-Gg: AYBFou0q5Yp+OqbeshXtwmYmEM7BFGOQnNUB4r6cqupt7LQ9UGWxmsdXbAXR9rywG4M
	9YQey9bB9SfDxI12I/zFWTp8tdIe+zDZGevxq73QwW7DOKno1OGEOwls+GL8yA2Is6vQWrBD9oZ
	XTV2U9176STIfY6uBok53Sd/EVRYrIfdOZaR3tU017Xhcr1kBMj1NDas7vn65PQSxGM9wrDa6by
	+8x9/4mX8dYSEJ/uG4uS0fHIZyAqsHWZHuPbTP1iSOZNuKGFtnFHJQSs7HLmkFfYNbzRQ4ALw97
	VZTMdAJNKqfWS15U7P1KlCYcX/CVyDijkrXnvGRYcwY7AechhbCC9gWTPjpMDI1FpVK0AHCa18f
	qPujBMhpaIr8EHWW/n9ZilX0uNd/1TzXPxaWUc9SzeW9xCgacThrz8IGh5TCc4wM25MCGFd3GyE
	sZsHl7O0rr0jE6wU+bdJL59PHkzjLo4vzn+nBLJ3g6WukhoU5Dcf3iHzzS2ON1c1kiVF8Sc4pxY
	InOEmUKdBofcqsZGGIv0NNfHzi1rokUM6bljYAB+9QYDPkQSKoLGdhoVw==
X-Received: by 2002:ac5:c007:0:20b0:5c9:a60b:e5bd with SMTP id 71dfb90a1353d-5eaaa61b5e1mr428147e0c.13.1792193297779;
        Fri, 16 Oct 2026 16:28:17 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:42fc:16d8:d66b:d6c1:caeb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4f58bbsm2804299e0c.10.2026.10.16.16.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:28:17 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: Frank.Li@nxp.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: imx5: Restore IIM syscon fallback
Date: Fri, 16 Oct 2026 20:28:00 -0300
Message-ID: <20261016232800.536654-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016232800.536654-1-festevam@gmail.com>
References: <20261016232800.536654-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_002820_612752_DB26CBB5 
X-CRM114-Status: GOOD (  13.58  )
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

Commit d5b55c35e033 ("ARM: dts: imx: Fix the iim compatible string")
removed all IIM fallback compatibles because the binding only accepted one
compatible. The i.MX51 and i.MX53 SoC device code still looks up the IIM
with syscon_regmap_lookup_by_compatible(), though. Without the syscon
fallback, syscon_node_to_regmap() cannot instantiate the regmap and boot
reports:

  imx_soc_device_init: failed to find fsl,imx53-iim regmap!

Restore the syscon fallback on i.MX51 and i.MX53.

Fixes: d5b55c35e033 ("ARM: dts: imx: Fix the iim compatible string")
Cc: stable@vger.kernel.org
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx51.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx53.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51.dtsi b/arch/arm/boot/dts/nxp/imx/imx51.dtsi
index c8698a9af1a7..e0494aa30a6b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx51.dtsi
@@ -476,7 +476,7 @@ aipstz2: bridge@83f00000 {
 			};
 
 			iim: efuse@83f98000 {
-				compatible = "fsl,imx51-iim";
+				compatible = "fsl,imx51-iim", "syscon";
 				reg = <0x83f98000 0x4000>;
 				interrupts = <69>;
 				clocks = <&clks IMX5_CLK_IIM_GATE>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx53.dtsi b/arch/arm/boot/dts/nxp/imx/imx53.dtsi
index 93225a56896f..13550d12f694 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53.dtsi
@@ -668,7 +668,7 @@ aipstz2: bridge@63f00000 {
 			};
 
 			iim: efuse@63f98000 {
-				compatible = "fsl,imx53-iim";
+				compatible = "fsl,imx53-iim", "syscon";
 				reg = <0x63f98000 0x4000>;
 				interrupts = <69>;
 				clocks = <&clks IMX5_CLK_IIM_GATE>;
-- 
2.43.0


