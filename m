Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE7BCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 09:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/DHTxjBxzogPKxJ4cOK4Z/whU+0rHPxz/zI82eTcXtc=; b=BTy0VtrL5Shykvfw23QBxjlTnU
	SV29tng7fZyr/ZyUB6E2yF3MzcGRrkb9T0DqKO3DgInw0aMhhR2eCB5FI6J1tGUKxFbKVvk3tN305
	htJodD2mLJky8nNwVF3o6agY+h1633RCDJPaxkDBAXhe5EJIzlTrr2ZVZtK4Fx4vDxlMDGzxrL2m1
	tboJt3DU/oh7J5cZ/+I3JK0XNJD27WoJkQZInEqqc7IzbeBV7rK3PsfLysV7dO3+50VOEmPj5zLDG
	bY4Vkp3nubG6dtmlGEjEDLhuGHVYgB8llJ+vspleXMjUPP/RKYX/dFT07w+5XBzQLg57GrXpjQ8Mi
	VCWHMO2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usI69-00000007gSz-3Yac;
	Sat, 30 Aug 2025 09:42:13 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usI3Q-00000007gLA-2LJX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 09:39:25 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-61cb4348ac4so353715a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 02:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756546763; x=1757151563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/DHTxjBxzogPKxJ4cOK4Z/whU+0rHPxz/zI82eTcXtc=;
        b=CdjJJtfw3FmhJAU8X7HU/ClI/AKQVIknx0UQmrAd5cMBHEzRXcgNgzYSNcHKtsdu0l
         Mv8m5J7zvTRnfwSyLcoT3CQdGy6CU5IqT5n3tX4IQ3vVk8lwI/VmBmi5D7Dcl+zTj5OW
         7iwi/V6UGpNs4PnYYVCGjVbE0PLLIBGc3YcECPYmPwPBzRRySp2vM/iXG8wPRTlNk3ce
         0SSVnxY/eJTgX+oK/E3+9BVxcGga5S1VGDn0bvMPPFVbVfYA5H/Z8bQ9rX7o+ncs50yh
         OnL3B18xT1cQHb+QmRRQnDPaBjJmN2TFuCAqFVRWaF+fW+QN5yV6PWx0IMGbzUeImAR2
         JywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756546763; x=1757151563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DHTxjBxzogPKxJ4cOK4Z/whU+0rHPxz/zI82eTcXtc=;
        b=WMNuc2SUXTflGK3Kd8f8R7v5+1VzKaFWqlvKJw5ayuR37uOPeU8iR35FBxLvToKecg
         K3ir16juXHCXTJDIxDFQBJ3dPkzPeEdAw2/sKNldP5zEsiQ7HtpA55qP8gYAf+VVqiLN
         TgnyN/fb16Hrj3F2QbVhC6lPsALuQAMbgI3iTPE7WOHoDRQZrzWE6H5fEB0HvaP5wWU3
         YbPWX4DDpdm3+bqA+NXQAmNR/tEt19sc9b4XdMpHoI4F2yhtJYMWv4n3vs3wTY4nkAZK
         Wpn1mdcRhF7fxBKYeac1dNas4CfEtPfFVl9H0ICeJz396oQ7OgtKpVHfiZp9ExHixfmH
         dDpA==
X-Forwarded-Encrypted: i=1; AJvYcCWkAYXoL1lZ8HaOM+YMKj4RWTlp1Zkg6xQt8adc8WbxHnqR18/qDBSWH9NfjwEzF6kbUe5CPXv5Cj1E/Yhil3QF@lists.infradead.org
X-Gm-Message-State: AOJu0YylRpxIeJZAWJ/t310mTu2KU9qWubLy7bRo7pO14U2J+3SNWCNK
	JLmJ4rJK1qK/EQR+TySRBUD4qQOAzuVb2VcNfRzNiAP+WANw93ktafZUGy6z1G5Fiuo=
X-Gm-Gg: ASbGncsfYWV6ju/38g9PulLrcHfXYzZWo41i3xgm+ARYOZ7ebstGEpooZNIxjDtLkXj
	cQWTaRa9I8+yHtBIT1i1BLBkhesbRlqB3s3RbYNgg4Hdi1JwXZhQAksZPeOBRtRtL0rpeu/MAAA
	kD/IN/fH0kXnxI5yhCSUWtDPgIjZQ0bbOIblAvS2YKURNVDD7sci2Rggk9sqnsLcQ4spWZZF6lE
	a1iJpaczBWmU8ENcrJD1qizox62kNghCE64txUTJ5a7myaD9dQRLS6tTdOaSPvD6zhgIeCD+zEe
	JGCki0XVKq8s2DcrvB8dBNDZ1Mnr2q6CbRv18P0aPKC92Fwles3PL9RoLEO3C+EVzQfPgY/dpIV
	xSfJ0ID8YbJntF17kpaZBbePajc8rC51J+PQo9QcD9t5k7wfRS8exctc=
X-Google-Smtp-Source: AGHT+IEju/3F/3C9ok/98yVSIdOJnhW7fq35+ZOG8H80oN0vPxCkUSsQjBebNcRcRfWBfMhOZptwVA==
X-Received: by 2002:a05:6402:13d1:b0:61c:d24d:e2fa with SMTP id 4fb4d7f45d1cf-61cfe7eb745mr2895448a12.2.1756546762810;
        Sat, 30 Aug 2025 02:39:22 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc579ba9sm3180786a12.52.2025.08.30.02.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 02:39:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] arm64: dts: exynos2200: Add default GIC address cells
Date: Sat, 30 Aug 2025 11:39:19 +0200
Message-ID: <20250830093918.24619-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=940; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=7dtwlT+QH5+HXAaXOGsHqcyqtmA7cdi+ZckhOJDo/Gk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBossbGCgZcWgvcE82Z7nXJI8DCsyLZU6WLNZixz
 QaqMvXQfA6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLGxgAKCRDBN2bmhouD
 1+HWD/9dRaipZDON12eF3QCIU9kraOUTkBjWtHXkkfuLvQp2LMYnArQG+mlhmB9h4iZMPaRqh2p
 dyv05+2sPUhy3H6g1pKKB5rn8yNY0+axRMRSWRzDy/71I3oVMAbIGdp9eYDwe2H/PBnlBxZPTMk
 iPDv1wLEqi69HkMylnFaA7svIjyvILHGm0tz8C5B+/Jnn+rY0Tv3wu7TqfFgxHgau78zxASgdOi
 rYLPjg9epLEWT0RAEVx4l7xt0NIMtRQIH79x6Pk1Mot39imkhXtHyd80E5nbYrjEG6ECj8QUHky
 u3ZrUO4fY6a0fFxMtQVXmjWQDdenCEcKDHQvhPSrJqnvu6GhBA6vlQ5WrfNuKrrljUBTixlK23y
 zVxHBsco6jxzNYu6bpYt1IK/bRX2oCxVPBRMwEDBAXCoDaxTYVPDu/d2woKDzSTe/QPj99UXo65
 K44zjJ8rohdKZexwAG3NrOWPTQJevcVPBuzVYTzbSfvgf+YlkbieaNCwtLOA4REk36by0G2o07c
 PfPmn/9vB64tQhLbWNLrUeugwT9XseK6kIcn8mFtvWoNanlds5ky+1jkkZvoytyzJNRpezHvUZh
 pHFwT+Cc8IkBs8WKKJEVvcHJSbcJ86dT9goOi2/I/yZvq3G551FaEkXCSKgr901cThMd3nIvhJw MxXamzrF7Dj+g+Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_023924_603307_584B1207 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

Add missing address-cells 0 to GIC interrupt node.  Value '0' is correct
because GIC interrupt controller does not have children.

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v2:
1. Rebase
2. Rb
---
 arch/arm64/boot/dts/exynos/exynos2200.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
index 933ab7818ab2..6487ccb58ae7 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -274,6 +274,7 @@ gic: interrupt-controller@10200000 {
 			reg = <0x10200000 0x10000>,     /* GICD */
 			      <0x10240000 0x200000>;    /* GICR * 8 */
 
+			#address-cells = <0>;
 			#interrupt-cells = <4>;
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
-- 
2.48.1


