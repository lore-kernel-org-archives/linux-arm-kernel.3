Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3C6CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=plBpRxzOXh1Cs6ihly2kzk0+EpaX0QDgSfgHTsuw0DU=; b=mCxNIggUP7VfUgbOlp9d9Xgup1
	m2yQooHMLX6RJHDex9VDFvDKbth86p8560XoSfDfC3ivNKihvfv0z/T6UYleHlX4oJ78kZKavQHau
	rqFwzfoedpq03oGZzyWGaj8LmozMyTmX5r+MScg3dBN/GNmhTuIjsDBl8ul1Fxk0MbOS0Ao759OHa
	pnmax0YxPtxviW+ozak2hvuNBK0YdK06Yey+aNURoRvwjO6uANyDFpZkQ7BKgdAHI0Kkv1bXrcapP
	G0uYUQr/CAn3sSdZl+lsx/vKHaBWe2PriFnZMWA1/r0wnpBfhfCCv9v+M8D5M+u+LR/i/unCONFIC
	YNzrjgKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkdw-00000004SK5-4AqY;
	Sat, 23 Aug 2025 09:34:36 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRtW-00000002deW-2FdX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:33:27 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6188b7895e9so356202a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869605; x=1756474405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=plBpRxzOXh1Cs6ihly2kzk0+EpaX0QDgSfgHTsuw0DU=;
        b=YveilCugH68gaUFbCTsIU4VCJ0qBacuOIkmj84f4DNNjMna+orX6xCLCg8BjhayOew
         NYe0fUl92NjZoVK2xf5YdhoXqpO9nCKg/cshmGxkbcJA4tm6R1hz1jYLbb58zUyeu/XW
         PySz4HQBb6//8/XZXLv5I6bK5NC3hFzskvjJ8azTcXmixgPTgi3UnDSjWLspBPKugBCN
         47oo05mzKdhvy5r4x/iKpTpsIRxHKMecAkbf0G/1Y4pWFO3BpM60zt7LcgVGtDW796s5
         6QpuojyjP6D0t7qo3Uk4eWkXykXg+rcUDSnEIf5XhkpQhSgmhrM+4CYbRqwRQBRwnzHa
         GeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869605; x=1756474405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plBpRxzOXh1Cs6ihly2kzk0+EpaX0QDgSfgHTsuw0DU=;
        b=GqWdOB86WLXEuycgyDDoxg/jF22WScGZuHp3zoARP6Y/SeJ+Lq828xyW8RXi1owglR
         CYxOhNHX3JuqoAeewxueFFZLxbGeDcAQTRT+FtPtJRIAySmdFrQ8WYYt1eInUEOiEBp6
         LmkdccUr3DqqCwFUb9D0mYRw0Zm2QMj470pRhI5J1+eM226BVengdnyWaLoxdHRDbez3
         RmZ0uL1PNoXUZhFcxR3uVuDYquSG9ZjzUYNiDqEjkAs4t1A3ATfoDxHlmbIHwmPIePNS
         xOgTJGKXpJluQ0LARmYmUsJbH92NsvmsYd0axJY+4gizWKbuFIvHKzdpA2M+wpUPpH0L
         V+Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVISwRsTqAxc4De/cr3QH003qo0f2tqXxM/SaY8cTTRie1vcuC+f0T5q405sMlYcerF9bfWFcZLawjsu0LzQDOK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx782SuGx0/EHzI1UraBUOFToS1GnUdqcww77y7XINEIC7VY5+w
	LIWDBSkMhH7pzVRhzbw9nYXtbl8imtcLCkzkL5bhUTAilJry0uocYi6t0GaZJ350cHc=
X-Gm-Gg: ASbGncuxlRgmuhs+9SInndoC24Ehy4bVnOWyO14quKS4S68Ta4kMzQHW9efMK695rWM
	1V2uhc8tXj7+eHzXH+vkGxCPROkqzzfAkgc1cmhXcdnfvq/T4npbBH9vRbLLViwVRCarXyL01XX
	9MCQtyBn7WDhqVVyG/qNQclVVYs1RFGc7Yq0V243M+BIemSSYQClz89DhE0cvFnAl+WX1XQxRtE
	N8HDOMq5StXrQY3El9EUBLTKdCrGG6m8PGskaKiM4TodRUXm2bS4lC8XHPU7y3mTVB5quTvEya4
	XM5Na8Lz+MYPZZAM8eeAStwrYMzYdGfE0b/AXaatq5Si5XKTyGst0TqLTbIrvxfZcZYEqDhOS2d
	IncJcwMAybl2gnAGNJXrvk/yYaCkEMpYFsg==
X-Google-Smtp-Source: AGHT+IHG72D11u5IdJuYzQxDRkzR4OlLZS8XqeeHSUIp4lu16BBZfsKFUUmkkTFaUI4Lrd1NwdPo8Q==
X-Received: by 2002:a17:907:9405:b0:af9:5a1c:fee5 with SMTP id a640c23a62f3a-afe2874f3eemr157584566b.0.1755869604966;
        Fri, 22 Aug 2025 06:33:24 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded2ba366sm608881866b.19.2025.08.22.06.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:33:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: socionext: uniphier-ld20: Add default PCI interrup controller address cells
Date: Fri, 22 Aug 2025 15:33:19 +0200
Message-ID: <20250822133318.312232-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=/M26qPH1NPziTh0Tbmf9sXdkHY+iN5CemaBMwSON+uA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHGe8ukZiKdW9GXbdlR449mVvImtqaLWDZRib
 uARzocBq/uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxngAKCRDBN2bmhouD
 18wmD/4g58pwxpUSfvmYnBNwgp53IbqJp2Z1TU+ZoB/MN1/V8S81fvV9w4BI2luvOKtasYkb8FR
 f3qyubbQQzCBoH7QBbn/8Pw3DMUgoxlAxpaM+DrgKGF+XM1oC+R/qef8vaqBBxiCFGWrBm9Xp2W
 zv8axs1FC+7p2srxUx605mAiMYUhOC6CruL72Z+IV3I3TpixyDDHD0fiWd0BTypL+cFcVWKJNmb
 Cw0Njd2LeLUHORFkA3A400iFs131n0hg3/DHDWPY37zWbGOCkKrL6Hpq5rlC3uTLAMzHll1SaBO
 T44+i4ycF7Eek6ALQJkzntoAuaBJ5FnINMdbEOQOeU4GscaZh7mmItaPjYaFWaaRrXQRQLLaUIt
 KBwASmC4Z5DvsT95DoltGs+z4MHuSROWNxWh3uVNeIwVdzOdSeA6Ui6gMq5DL9OkLSCDJAhhcr7
 QZWKNXsDR2HS5BaEMPLjF8Z2RXKfLVU0BoT6WCQVi/scGcPiWKfD5+jw1BWp9TFmUR5L5J//HOD
 OPkGXfibgJBQ5BHgAW5yOMSCxulI9w9ZoNRFCqlIOteLENRJBQY0ezpP5dwZK+6seW8kRhjmvxd
 A9j1KvyKIs/Aso9V4faQS7C8SBiGaQ3SlXtOSstFIKgwrQ7bjooPTeM4JZoRVTUHDD7liSPhSaV 8KFajmmyQrv/dNw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063326_573429_2B35262A 
X-CRM114-Status: GOOD (  11.27  )
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

Add missing address-cells 0 to the PCI interrupt node to silence W=1
warning:

  uniphier-ld20.dtsi:941.4-944.29: Warning (interrupt_map): /soc@0/pcie@66000000:interrupt-map:
    Missing property '#address-cells' in node /soc@0/pcie@66000000/legacy-interrupt-controller, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index 335093da6573..875b93856a64 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -947,6 +947,7 @@ pcie: pcie@66000000 {
 
 			pcie_intc: legacy-interrupt-controller {
 				interrupt-controller;
+				#address-cells = <0>;
 				#interrupt-cells = <1>;
 				interrupt-parent = <&gic>;
 				interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.48.1


