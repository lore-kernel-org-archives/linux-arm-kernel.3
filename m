Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD08C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 10:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LDU3E7ugNL0CY6R17fTrojKGk0DUzjv1ic5ywPvNUA=; b=Si654rcGA7dQsQbbG5KVKiLAaP
	4Hml2uazYVffHgpCyQtCHNcwniugEEi1p38YvN6RyFB0+b16J3AyBUtLTSHmOIJ6TrjT8AfCM1/tC
	geJuJXcZstgssNRvMcxU8WBDOC9MrDOi75/5sZtwHPqB0fycruv5UeP7xfZmV1EMSZEpnmcFhrwpy
	S9XJ0Yk09DhQNkg5HbxaLJS/Gg0gdSQRFD4XW8AnaSQP4HJU60lV69x+QzijV1ULnFEqt4lJgYqc6
	xoqWtCSG0YhivRgGLao2T/Af39SfYtfnhEakkzCbsByBy2aTaz4kfIaoiTTLn8+jIShZcMMXC323f
	UbHb2lmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmhA-0000000C3zY-37Tz;
	Tue, 13 May 2025 10:17:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmay-0000000C2Yc-00Yq
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 May 2025 10:10:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8LDU3E7ugNL0CY6R17fTrojKGk0DUzjv1ic5ywPvNUA=; b=j14H5pUgP3ztGe7CxFPO0WotLu
	7lUS4/enjNQDbFLpse15IKRgTydrHN8xvq/PMORRioKoiUxqIltd0lXrF+dQRowMaGNXUDVpSyG9+
	UoP4KhIQNJQPvS/6zjNRHmjg4iucOcUp5VZ47EpmqWDGvXTvHgpFWzIOu++XnYd4iRMLGz7ighAFB
	rd+qpEx4g6KSsUDB0M2jkFaagUfcV90+RlvUCTcmWyUWghMTaRLMYGT9mk7m4KCUroTOzr1q7k+9H
	7zQeFPJeCW06HIYej19Klp6Zc5herOlx3d/v0uktk1S3bQ5T7kzuHVk58P3VPSX7gccWrxJ/AmUbD
	kqJlTl6Q==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uEmau-0000000Gvdr-3RvF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 10:10:42 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-441c0d8eb3bso5270565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 03:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131039; x=1747735839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LDU3E7ugNL0CY6R17fTrojKGk0DUzjv1ic5ywPvNUA=;
        b=R4Xs2ZuOlH976iUUDvOq3SaOWKWAZfxjaE31nuwjxrZde+UH7VLoLAgOsh4gpeMpio
         5jbffliidg2JQaA2Fgbnyj89tp7vzR7OC5AZ+RveFW61OATsKrf8f8upCBdYdZZP5xmq
         i9B3V8NBKU9P1xP1nXqjZuOo8n4VaKH7RTCdYhmoNxJ+flHVxQlojLJ6kuJvDBNlM4Jw
         ZWvGg425m35hBF6ZgC82AIAnKOpCY9qp4vMB84kCJhm5I6o5SZBl3izQCCbIRcCfYtl0
         zC6FzuCrVVu8Qo14NOIMijd6HhLiu9rP3CPTd2FwuXauSL3ZUpbGkqiLQS6oe5RmVSjh
         wU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131039; x=1747735839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8LDU3E7ugNL0CY6R17fTrojKGk0DUzjv1ic5ywPvNUA=;
        b=KCstbAPCcb4Jui0GwvKlKMOIKO4xgXDyhqVtt5T2vZgXQ7IsJSlo8/Cy2RfE4P4BFW
         d6Lo9WUl3voWeQc8TaxgtvhR5jqhe627eD4Mta3B7yEw9rmWA+QSAkwYqiudszyJQe7I
         vRTPkRlp/jy+Tc6EdtKW5xAGaxNKV9noCCSMyX2mo2mc2rQepToP794fk9fqDl8RR9oV
         zVQnCDTeyPX3hwSG/Pa+niByDbqKqUjSy30UonQ2UmGVLCFhJVllA6Ctz177PY2uhqdJ
         R/ZyLJQkSTYvATlHeI+03wayu3jlb6+J0yco7b5UgiZMY8eL9oS2qdofsKAzHVroD1bs
         1lRw==
X-Forwarded-Encrypted: i=1; AJvYcCWViPlgvoeNsZKPNWK8Q2RQT/MR7WgmtVZmYTia1Vqi6+uOeFCo+G2jlCTIRsWqirDSBPIdv+LVKNC+MzIpZH/P@lists.infradead.org
X-Gm-Message-State: AOJu0Yz66KDYbFNsnr49hw2a9XXT7H2yAWT1bnlce3pf3PEzCVQvhJvl
	HCeRFcCkrmkcO145xT6Aak0fBrwRUlWJSP2wdFFQ6P6lx9F6dL5ijJnBWEPnY3M=
X-Gm-Gg: ASbGncvpGuGiaB3GHJHOl7/r2Bvc1b05K6d8xIBNg8x7CBMy7BMi5HIfwYsOHlrswx4
	3C1PueXaIo/yRKjdL/7bhgI1zIS0nYl5/L+6tSLBsXbim6PFXSLfHBtCVmgrkxg6QCAHBLGPrvn
	A23CZTU+QYriiklSkrJDEFcujk1ZaUQaHwJRUjs2PcLA2ZcbhBcU/lThLT9RiplFGOW3kKkphBE
	xR4RqW+XQ7K2V97fgVMfDRS0c1YDXVVsUUys88xVqxEI9Hg0FCeJXIeLOu/j9m42dEGuMg5XTIZ
	yPEhxq+0gncEe6m1j0hvIyTGXefUZC/6PRMsXyHQvacEXaHEfq21Pt09AFFzXE38xl6ivT5Or7j
	V6NpPmG8VqcNOinqUxREY/Wtp7u22U82x6OHcPkA=
X-Google-Smtp-Source: AGHT+IHby+uH+9SrUe0Mcr5B37Co4treeOqApvNmT3ZzjxOsvuWSMZ2/x9YLsSi2DmbWlz1SlUQrbw==
X-Received: by 2002:a05:600c:1c90:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-442d6de97f0mr50703025e9.9.1747131038625;
        Tue, 13 May 2025 03:10:38 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df574sm159683635e9.11.2025.05.13.03.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:10:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH PULL 3/4] ARM: dts: samsung: sp5v210-aries: Align wifi node name with bindings
Date: Tue, 13 May 2025 12:10:24 +0200
Message-ID: <20250513101023.21552-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
References: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=907; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=FV6lUS1VQZkp1LlugzR82qxxAdBsO/kVg1ZGJpHO5Ss=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIxqREOlMZHUTEeB8rGJ1Gc38+QkgIxsOYpihB
 PhNb4GFzH+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMakQAKCRDBN2bmhouD
 133pEACOMqgFZZYU1knd0BczssaCxOXwa3oD5FfktfyjygqFRCU+/WCNPLPHgURFsa0Hdph5dcP
 JdqF7642k+Zs7eid+yD15R7KnkgoSnoLxyVoTnvaqp+feC5HXpyqn16hFkXQgUdwgYOMDY68eFa
 hYaeGheo32dCD0XdeHBBG4gruHd2lhofAaiBwAAM32+I8dcF1ps1TURLduOC6uD0YHrykUjeg6+
 0ttqgCx1Eem6RPzY+H/Ih9FWGYsgOira9T2NrTxIGzNHEyTQRaaSjvz5ytncrkcv/kWsXL/PWYI
 dxJRaUUjFUZM4POvZXp9LVXijH+Nh+jZEK4rAsR+B4EdyVZxCZ/O6uv4Uxqrts2BEYFpTPaS3Kv
 4X7DniL1Mcs2cpw/N2wRa9kjaiuo0c9CrQXe6l+NwQ1mJ5CpHVj61IPvK+gP1hT/dbUeIFLuYNL
 zrRtKPzqDY7MFOtgspDImw2QLvnavEPi3LeaTWpLmSP84u6uHGaAwjZrgXa9Dcw4x9TsOCUGSSP
 kKNtoKqxj/ocKIaU9mBlGBiAgFWQoYIHqjLWQWdPgdM898/9xsIdJ9Esz5qD7HOEXyOLzkRbBtz
 ZElPdomkvmpOSvlz8CGDOOfzixnJ8vHLi/fr3zSK9sJY4dcChhWTjDc0YNetEUCcAldWlRdwR1/ 4ub3HTmQFrpqPuw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_111040_955974_B8486E80 
X-CRM114-Status: GOOD (  11.32  )
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

Recently DT bindings expect 'wifi' as node name:

  s5pv210-fascinate4g.dtb: wlan@1: $nodename:0: 'wlan@1' does not match '^wifi(@.*)?$'

Link: https://lore.kernel.org/r/20250424084655.105011-1-krzysztof.kozlowski@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/samsung/s5pv210-aries.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi b/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
index f628d3660493..153514e80c9a 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
+++ b/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
@@ -855,7 +855,7 @@ &sdhci1 {
 	assigned-clock-rates = <0>, <50000000>;
 	assigned-clock-parents = <&clocks MOUT_MPLL>;
 
-	wlan@1 {
+	wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		interrupt-parent = <&gph2>;
-- 
2.45.2


