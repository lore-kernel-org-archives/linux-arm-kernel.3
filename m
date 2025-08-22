Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158CBCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLPWBbvJzifuSCPGTnAy7x/NBrhVR2Sch+UbydDDTnc=; b=ZYuvfmaCUHaxxcijIASur83tn1
	mGnETZNmG2evQCux/eGGtrRrIEKM50XNt/Rx3UpKjrhX7iKPshmeLDjn79wSe8YI40OXLnX1oJkyp
	Mbarjk4RE1if2AEwkYDHgU4UVEVuxnDNj2tw/3pJz3R6K1cw9KJpxZMwHXqfY5rxWSMSAOYpdHC0w
	jCmiVoFa2XPRJdE+GehMloz9I9k1ZgPHODGqFakFL4DCWnZvL0BMxikW8q4M4mBMjc5PTV5zLsXOh
	Si5ekxYciLRhDy22WM8ms6a19LSCLKQJ1Mm0NRTfWzWBQt5DLTkRCSn0drmXQcKm4W/SHABomCBm9
	5CIg2hXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphpu-000000044j8-038N;
	Sat, 23 Aug 2025 06:34:46 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRrZ-00000002dKS-1hmn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:31:26 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-afcb78d1695so27829766b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869484; x=1756474284; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLPWBbvJzifuSCPGTnAy7x/NBrhVR2Sch+UbydDDTnc=;
        b=Ar+eWLoFFPsOYCxnEm2itZahunUmh58s44BfgHEK+VM4kgi23/Pxxxnn8eG9KNo9hF
         nkTNUFWIX420zWAwTsXplIyvaZ7CJMXwaCM1cKmuIeaLUmqdc2t7e4ipMlyKWwFV2Gf8
         z9DPrSwzjFzg21T4X5rRFsioCEZ04KgbnnBSY81cKi2l02fFS8olRGtmyYjRAJTuwPAK
         girxEbcJ3jk+rLJ2zh91v0M6kpaLyErwO2QY4eo4/vpGc1ZOkua4OwdRNm3QPbMvVU2g
         jf8C1XcJAa42Hyef5XBw7/yi6FARlcKzWyL1JXa/YzhJEnUzpBKXGR700TI9diTMEoqO
         eBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869484; x=1756474284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLPWBbvJzifuSCPGTnAy7x/NBrhVR2Sch+UbydDDTnc=;
        b=MrynhQlgRTN8oRnyfWP2T4UDvTn9RLnY5607W/p0vY5kLePMOzkZH/1fYH9+LWiVsg
         l59FgeASadD26nUCjXYQkOn4Ff3Q/5nq005hadE+auaGSHPbErBWra5HqHE1ysrGJ8tM
         ZGDKKMTEYurOuEtwsmGT85o/iXmtRh5d4ZW8oUPINtDJQjXp5cC/LCr+lr8vdb4og4cZ
         WHjXWirIGlea0sTkh+wEqBmXe8dHeoODLeupm9fn8X0lEBQ+tpcsCeL51rOD7VJgsESC
         j70ajUAp0MXzmKoglaRIqTC0qXGB/P4IUcmHfW7Cp0kgxGtgnMbPgyh7zVl5trENOyiM
         cHLA==
X-Gm-Message-State: AOJu0YwinIaTG4n2GqxTOS4CVm+STW8NF8OLIPe2doNy0t+rt2EzOLfF
	Cs8IxTeeFg8ovWm2mZyCO3Q1lLg3Vw/KmnABSlOmnWQ7W5Z/vMJQ5HH60SGbdntiR1w=
X-Gm-Gg: ASbGnctAi8pDyeDIsi/LdDz8S8ODYi2R3Z3MyOaF42tR5i7h0fXUIvBkWTUqJ0g34ZN
	vXxSHmQSVvOBa41wVGR5JUGvjxEektWvxgm1khfNe6O91B/ITYj+q/YqaQSs2AnHfxvroZPAnEf
	kcUtWJupaCQyw1uFkTjKsqG9CVZNp4XPX9GsofFUngp5E23o/WaH6cCN1AJZ32VcOIggbYUrKgE
	v/s/L3t44xQs8OIXcAuyGy5gMI9BMqR3GGQvHSMA7wFl/vsapktxWV687/ShHaaOpnyB6gYDqZ3
	3Eo5SGZfvlea1lm+9nRq84TwvEHdYt+kai4KtpfJuHf+QiagOVDPRrtAPslkDn+M7WBDC5g/fm2
	1xGEut62TEnANIGlxeK6lBS0iHd3DuoA5sp0uDl0=
X-Google-Smtp-Source: AGHT+IGye/ypxcYwHYTg5+3IuOjm1+gEOjzMVOKls45nzJUtB1Xa9O00N+ETVyA5ZLC+lUcykguCIw==
X-Received: by 2002:a17:907:7fa3:b0:ad8:9207:b436 with SMTP id a640c23a62f3a-afe29048212mr148055166b.5.1755869483728;
        Fri, 22 Aug 2025 06:31:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf24bc40dsm554863066b.109.2025.08.22.06.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:31:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 15:31:10 +0200
Subject: [PATCH 01/10] arm64: dts: fsl-ls1012a: Add default GIC address
 cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-b4-dts-interrupt-address-cells-imx-v1-1-f1b479da9340@linaro.org>
References: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
In-Reply-To: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1322;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=3SVpgon+i1YQeIuy3oRoxPKfUy9lcns76Zkt/Y4NV+k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHEgiIiD6BglCYSYhzqb8B01pZD6xzH72ddRt
 SeeZP/7jl6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxIAAKCRDBN2bmhouD
 16+GEACReaQu8HmfvIKNpHLlEbY6YYh0s0nof4k3fX9yB1JvLMmDUYQa2XucniT/Jjqxn/FpXnc
 1Oc9F8wHgQ7A9tfonoMlLWbMY+n2dy4ZPKsQ7127kXGUnPs40RoNloVb5C+YJprflb4cPT4kFY1
 hD1mLDtmN39cN26PQSkK1cOChLCJ9MkuQ8oig7UmltQO0YU6azgpYcgfrmivxdt/mVD7fWiCddc
 9b1/FkvhKrt0ftpy8WXriKE03cZMgKeFczZrMOB+Cn0NzzevCXi2c9AnTx+cfJsOF4QrGMAx/Kv
 7PmwHYJZ7FWwLo3rx87JZ+NxFVJAuN0GhZl/eoWfXQR3FbnrZRo/XI5b6M/PKMoLLwoa2PmWElA
 Ss1Me+3WYH1tQXKprVqtvkdzlBrhPsDUAivEDiNSJQVPeMdocN2eMwj+qyrr1p4NICMUx6rnHTH
 VJKUFko2xx2xtgkxiEieJ8qhfDOaJTC/MgBquy33kn5/t44wFV8rJj/oPfggEGGgF3TcGoEb5PJ
 BfY8Uq10AX3UWhY+O1/yDV+/xblulpI6ckf40CL2GGeCsxatWkvHaSc2WuHvjFrQcEvQLxS8kkX
 Z2ju3N74J7IDTL+m8izQAEQCxEHMNXg3NWV+YuO4atriqT+vRBz88c0WTTe6qJGJfEij014Q+ns
 i5V0vR3VPO+IctQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063125_450448_E6F4BB9E 
X-CRM114-Status: GOOD (  11.56  )
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

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  fsl-ls1012a.dtsi:548.4-551.32: Warning (interrupt_map): /soc/pcie@3400000:interrupt-map:
    Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
index dd479889658d452142e6d50b507147ba91c799af..fc3e138077b86cd5e3cf95c3d336cb3c6e1c45ef 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
@@ -87,6 +87,7 @@ pmu {
 
 	gic: interrupt-controller@1400000 {
 		compatible = "arm,gic-400";
+		#address-cells = <0>;
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		reg = <0x0 0x1401000 0 0x1000>, /* GICD */

-- 
2.48.1


