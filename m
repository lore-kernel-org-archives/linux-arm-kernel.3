Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A225E77180
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 16:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97bdRnaBdJfe74YUb9Rv1xkiswutq43yZJvms06fez0=; b=o1U1kDY2fPF4LZR+nW7dkGfl3O
	oLDzMHh1oz78+8GTxP0rDNYg1HhQA4XvDorm3NAQmK9pyDY9J3Dyk1X+sOrEMO9Dwh4/ZZ5rqDWsB
	lCkXpQfjyVm69mMfsA+1b0tupTp/LsmSA5XL7d9r/HB0QVYZLwG63ghGTxhFpt6oMfAMY1z4ZjVyW
	PWRjblqHWUPNht7p1Sl/vydArxnqG7StuMWv9M+8PcYeZWm9O3BsomZ7KFEyOPAgWZfsIWcU82yA7
	WP8tSqOMV0w7XQlm+IGvXnfd3lr4PL/FHGgc1XuRaZfRoyRNAeblNChZiCj2/m3keIhcWluyfvKlc
	ezwYzLXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8sB-00000004TSj-3esy;
	Fri, 13 Dec 2024 16:50:39 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8n4-00000004Rvj-2N2e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 16:45:23 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3862d6d5765so1340612f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 08:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734108321; x=1734713121; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97bdRnaBdJfe74YUb9Rv1xkiswutq43yZJvms06fez0=;
        b=q4rd6iFS38K4MLFtzzX0LwApn92DJOhWg0dTidLaFvdXRbjuYjHdqaqWKl00eqvEnX
         0e/U0Azina1nW3eAQO4wcTHhow4yiUFsR/Q+4oyzSuHdnX5IKv6ncST305pi9ZlyQPrC
         7bqideqdi3iUTFp2Q//myd+0rUnrlyZGbeZLInSoGQiHag36SBynLEpXL00/2qQ9P+cL
         FCO2M9t763E0Ggwz7RmWp9+j+dujY1dppzeyGByZ88BqMwTABu07a218zbqT2ps9i5uu
         U3R3H0ViFaAXg9pEAH0NVHxWtV2vixr8ZJeMs9F55OP8y0XmV5RUy5GVA8CXTFXq7ZIU
         OJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734108321; x=1734713121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97bdRnaBdJfe74YUb9Rv1xkiswutq43yZJvms06fez0=;
        b=uxbQHYtCmoP6GLofpUgXVjnhE/qtZuSvZ8BA+e8w01FGXWw/BNQh3mTDOJvtq8ImkB
         rr4meb1m4MYcxjoz4eJ81UCwrIJOCdUsCepPSpej/Q7otGg3TkgghZuYPYJzCRWHbUHu
         /R8ZIpZedLIFH/nEbO5bIZnir7Z6m56/vAhVxGNRBqIBNpMByY9hCFozdUl9fezkimNx
         jn2Jp2AEyocNzQhC0facR/BDAsXG9vvq2RGwS+OnJvgMN7ts/ZWADkWMifd35/ERcYS6
         0TzOFPD9mH4K8v8zTsLd1TNb7kYfLCYZeTlbmIkbvPoGs1sPg0mnTsZVIAA7NWNExFMp
         pGyw==
X-Forwarded-Encrypted: i=1; AJvYcCXjhzxz1zVGyGagVKmx5IVme58NgpeVDqYS41dmNyw0D98V3ePzSlTq/ogDb8NKwIy8K04jsqwSQRNF12CnJyJp@lists.infradead.org
X-Gm-Message-State: AOJu0Yw33bCemZasNB1UGZUTGs55APFTOVnGoCN+55TPGAcAMmxtnfI6
	3czuSClRWV3vB1M2tM6R50FmU7BQ15O+FmFkS6mLvAuCZQJqKWQJMDamrWie9QE=
X-Gm-Gg: ASbGnctMmMB9COMTARGEwuGPPGfyoe8+RoHZ53fGhdmg53nHw5w4kNmXtIKafqu46k9
	/rM5kJDsMObHolWXikQaId7UzwlbmdsbhPQg72Hz1Laq+rsCZw6dT1i1SMc+Tpa+PkmRnPlKgAU
	lN3tvp7bnyY+b8khH8626mIdeThrumsG+Id+SRWVsJUhbRrjLD+X5f1di+OvgDaBF1BDlbx9NJQ
	Y96g3FgMXVWSSqzWieBkpw5PtD12Z3YGPsH5v1BFKkKnTUCjwdbO8vEUesAc78fsyNbp3CRN/uA
	oEy1+dfZSA==
X-Google-Smtp-Source: AGHT+IGZWqjtdOdT/tpdS6VIYY/OsEpMo2zR5ORrDSrlvnH3vBH19ZJ4OkOJsfs9LUuPR/6YXntcCA==
X-Received: by 2002:a05:6000:4024:b0:385:e38f:8cc with SMTP id ffacd0b85a97d-3888e0b8718mr2672697f8f.38.1734108321100;
        Fri, 13 Dec 2024 08:45:21 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625550523sm53900665e9.7.2024.12.13.08.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 08:45:20 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Dec 2024 16:44:40 +0000
Subject: [PATCH 3/4] arm64: dts: exynos: gs101: add pmu-intr-gen regs to
 the PMU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-3-c72978f63713@linaro.org>
References: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
In-Reply-To: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=878;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=uO4wHh5R6umt3vpek5lvClXZRvrRF8v6hmmxWJa+U7s=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnXGSaf/9i9t3N75PN25j2i/ydlMAkKuaeaexK7
 X0Egk2OrE6JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ1xkmgAKCRDO6LjWAjRy
 ukK5D/9ome5x888y6BKVVMDwfE02V/42kZwdnreejxJI4o2iiOpAA5D3FCwK+Q/V/Y3V/91Nf9c
 OiOdQUPD4v9K6WOZrdBDhW64QCkwKTegdIqhstPvsfyZw9XfYKVOEd0Y4aA3BONUbmU1dUeP04p
 52RV1al+IlZmf3YiQSLLo/2HalaZWvRDCuaVlVCTmW15BktT2ufzOlUZzJPpNZgVdv/l0c+0j+n
 WlBYj5camPsEuEwsP9XPIUz1/UMvBiabRwioX0tGYCJQOpQvPs+IKqb0XYmME9FTcHgelXLzhwv
 yzboFdNLxPpf42K/H+cENSmc14/DJt/sB0W2mfQJJHqOsgskZa0hg/v/locl6Mgns/96CIkRB6y
 MrgbqRf0KZgnZQSKCt/cAIHiZX2IHzAb8sCVR85UGVyL1Bx/SrxhqoAO6GGgKt3qeWTbu2T1IUX
 CLhnVBdSJQo8TUcuHouJ0/lA/sfEuSQjSpbNwEThH+CJtDj6Ag9hY5SAomTR9I8qXZfEM75rtrq
 VCas+ueobtMbBPtmzoer1GLD3rM2VaJV44aICHQ01Nq/go3UVF9iSF1JBxoGN6sAXPaaXIrIUdd
 vzLYYzTBbpT1ngkisIkNwYApUPQeqlGndS6669BwRZtorUIloclr5HNJkow01vRLi44BnyezzVW
 0v3RehT7gH+35Pw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_084522_622741_ED0CBE61 
X-CRM114-Status: GOOD (  10.98  )
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

These registers are required for cpu hotplug.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 302c5beb224a..93db14e16246 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1393,7 +1393,9 @@ sysreg_apm: syscon@174204e0 {
 
 		pmu_system_controller: system-controller@17460000 {
 			compatible = "google,gs101-pmu", "syscon";
-			reg = <0x17460000 0x10000>;
+			reg = <0x17460000 0x10000>,
+			      <0x17470000 0x10000>;
+			reg-names = "pmu", "pmu-intr-gen";
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";

-- 
2.47.1.613.gc27f4b7a9f-goog


