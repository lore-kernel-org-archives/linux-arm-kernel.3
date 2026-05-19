Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38903CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 08:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hRuibsHH1d7GyXfjAXknzKcztEOx8udVevL3jmrUcbo=; b=bNW+PhIjWO+jviTTZb1rfXV1ks
	wWl01uqwGLd06d9ARY3gBITej0Xs+pAc/7iwo65834LgT538JvaLpFZqrRnuYCnHriPP0cFa9uEqT
	sdekiPw0yuY8L0u4Vogcjo4P6gijO3Am1s/zHlY9frz2QbqTBVgyfcne3dpCoAazy1J9WH8CU2hQe
	026KoMJAcv6p2nmxuyRSeHr+7M8LwWVtNZiuLDzAciYj0gvrA51dGLHr75U4fnBjb0CptBNfEMNzS
	kzcyrEIbFZ1AtgXoUXRwm1gdD44tDVCa6OuR4V/M/osYhuUMv0S1U6f5n9rBYxL4ypykkSZpxSb1y
	dQdj6j3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFzV-00000000hoe-3l3I;
	Tue, 19 May 2026 08:39:53 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFzS-00000000hnK-0kZD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 08:39:52 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43d77f6092eso1740997f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 01:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779179988; x=1779784788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hRuibsHH1d7GyXfjAXknzKcztEOx8udVevL3jmrUcbo=;
        b=sOzy1twY29U9JPZBc0Btxr40WUcgohTmbVixFsZtf9EMQeaohYhrd/1ejNH3vroLjL
         J8rjEWc2XnuXE/+Y8PusQZdo+Bnm/2BHNx53+qknR8H7otTOFMu3gem+Wt9+fNoEsJMP
         3jowhYWDf4QvO3hQFEjJMpq//4cc2mEHVgcPvXPYK+4NqTmvBL7VZxHIUyMxNAUcmC1O
         9neCQedYQ5ZY376pTeoK/hNZjLoDLo5QtrDcq+SXJpDU7IYzOs4AGdSrzKqmoFDoBxiz
         c1C+pFCEPNM+tKBRcISZgGHklhFTo8q9280yiJS/amRVxM8tScG1xqurHdK05mgYFsOH
         xGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779179988; x=1779784788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRuibsHH1d7GyXfjAXknzKcztEOx8udVevL3jmrUcbo=;
        b=PagvCLE6MQdBoKUp3P7I07iYJ13JPRKaDwEBmdmS9VbCPrIRLzTtjQEt1YaDx14fhf
         uW+Nj6Orp2n4VxAAm2x7uztSklNnZ05qWJfbYcIIR7NDDm/WC8Ryux3rWGZJw3w87EJk
         Wx/Z3OAlobCCxq6ElVw08X4ubfGWMhxbftjWJw3XrTufBu436AeVsBLMeIr6Qx64KXzi
         Bxe34woDe71xThL+0/Ova1WYEE8+29vR4s/zBc7Qq/HTbjZzW7LLmPJ/iwJAGnGd7OwV
         zZzb2WHpzRRKC75ki507HKtxlZy1mC3XP20ypDfm8vlKri1niePdGbor/yWt2IfNIAst
         8htg==
X-Forwarded-Encrypted: i=1; AFNElJ8q0bEo3HfcrO1gfOzK+Txi7310X/H3WiCdHXDczUoH+Om/HeRyjkP9egsl7q9z4VBlPXSpHRnT+b1+D+24gru2@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwskgy/Xo9yrrLZ5hgaOIelGdAvUdfMO1H6nFlReDC1XevaHB0
	XdI/N14DJczB/TXuFAbFJveFHz/fKuxF33XO+6qKdrPWSdc69jIXFixz
X-Gm-Gg: Acq92OEh5s4c9X9D4yi0hM0ujaLLb1FAs3Sg7ORieDbSo5duQsnNbTZwBcF+VsOdzDT
	GjcUchKngmmOKHvWczZ31bi4VwPI0D8vBSmAA3RfsmStKTkAJVTRVKDngRvwmdL7nSdVL1do/AK
	3WxnD3GfUK0p/chu05goDCAkaLxe4AkptsLX+TYWky4tRoh0SuuClqW7bsxbISe7/+Lz1AL+BEj
	HUBrxOcgk0zlJmF565jWsSAmyqf34dd7vYGbqPxe0hf/9Gq2KtHMkzvzj6hqxwESn7RVwW1A77c
	4dCmLVGdeDICZbMgrqylNGb8C1fzdorUspUWoP/oDv5d+o/RgBDTP/50MZ+c7V7Ynh4iPM0thZ1
	mAOysQ4aAgqfqejMU0YQ37Pxsvwq6W3DKITzfty0LZA1oqw0T5HCkyfYwjfRBqDlcqg8oRAz+jC
	J7R4KlmAVhKelO/8cHM9c=
X-Received: by 2002:a05:6000:400f:b0:448:8db5:410b with SMTP id ffacd0b85a97d-45e5c5e3064mr30844672f8f.20.1779179987735;
        Tue, 19 May 2026 01:39:47 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767d0bsm42061177f8f.3.2026.05.19.01.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:39:47 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt8516: remove cpu3 armpll clock-name
Date: Tue, 19 May 2026 09:39:05 +0100
Message-ID: <20260519083921.5023-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_013950_226687_BEA64CDB 
X-CRM114-Status: GOOD (  13.51  )
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

The armpll clock in cpu3 clock-names property comes from MediaTek sources,
but it's unused in the kernel and not populated in the clocks property.
Let's remove it and align the node with other cpu nodes of the same SoC.

Fixes: 5236347bde42 ("arm64: dts: mediatek: add dtsi for MT8516")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index 42712ac2b88d..21882ac4fadb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -99,7 +99,7 @@ cpu3: cpu@3 {
 				<&CPU_SLEEP_0_0 &CPU_SLEEP_0_0 &CPU_SLEEP_0_0>;
 			clocks = <&infracfg CLK_IFR_MUX1_SEL>,
 				 <&topckgen CLK_TOP_MAINPLL_D2>;
-			clock-names = "cpu", "intermediate", "armpll";
+			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 		};
-- 
2.43.0


