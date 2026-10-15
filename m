Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1567CA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 04:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cygSHUA7YEh2Fllf4fUKnrZPET1t8vbMRMige3In1Uc=; b=wg4GTr1l2knAQfHLMjbLcmR+8/
	YLOLyiOKF79YstodLZvXQbGBV1XvjpboWq/IbiCgiHkyMSFhD9L5WzIWgIVpXpxsqcgITi/QdGJf6
	FZch2ZR8AH6I+O6dEefyLZUpk+XxZt2XQSlTkUTeir3b1Cx8LQWo8NzLCQfSmokgLk3g1u9FVbi5+
	VetIz1Hs48tI1e+oaFB1GExIcs3OJZpRTPClxHQpRa6MHnqqADq8GScPxq6c7fGBx3nMH2+461Qob
	okE/5puul1O9Ia5eSicx5Pp9bBn83pRMmPJqWZuRumhtXcKJ/z9rHprN21S5HKhXA92imkvE1GRqY
	bqVmpS1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCjN-0000000Gmdx-1VMl;
	Thu, 15 Oct 2026 04:06:13 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCjL-0000000GmdD-0u1X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 04:06:12 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-475920b9ca2so1388013fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 21:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792037164; x=1792641964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cygSHUA7YEh2Fllf4fUKnrZPET1t8vbMRMige3In1Uc=;
        b=zTU47kF+AGLZMPseRwwySJQiX7cCW47TO3F4IErhVr+YMxYtK+gOKYV4dwaISPEYmk
         gn+iyBbRCm/D19C+uxBcV84S9qS4FkrGCcDa7WYXVwxFBJ/bYEQIgeiOSqwswN3qpeWA
         He3ueSRenDz/ULu8iFBDHW9e+UFhm2sd8wjlhj02l3fNWt3ymlSNJG31rd7UuXUR8zgk
         I9tCMRf7xTMdQUGfGk9+5J3yDht4laEtLpBXIlPlv3VMVj+sCgXWG4T/qUrEfNyCNBd5
         RMBvyy+8BWZh0CFq7bnuPyHqf8FYfmniotTxYgrqPFAq2LTev9+BHUs1WJJTxGsT8YCq
         /LZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792037164; x=1792641964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cygSHUA7YEh2Fllf4fUKnrZPET1t8vbMRMige3In1Uc=;
        b=RO2AO95+Kq9PB93/qFyClwp52u04umPiYNMfrEIZF+UeWZVVdi4YzKI8fI7hfcKuMH
         Tt2Ux8bt/GIzdO3d4pH3beLy6b6NASaw/qXWwAA6q/yrmNg70aePJEA26RsHoG/B80nc
         C+LVHUS0JkEyweZOSdFXB0ThxzGmOsZdUxpEcUNIqK0CNuYwfwJ3gQlp0/i/+QG2mK1+
         fg3PSe0YyYn2pNPRa9vOKJJbunLsBxY2vzma3Y16GM1xUxR2KForNbzaLZu25YHCqv8O
         tGqgIB5ATQzHsB09yQ6a+P+I3Fx9m6d0A/EZnlfhQmMN2A3AGWE2Agg2/GNKiIrWUjbD
         tNIg==
X-Forwarded-Encrypted: i=1; AKwUvBz0At/Fg4rTWF1jADvDB93bzlfJ9ZcpziqxXLi8/+xBApH3rJVfN8dX3BKgAyt5eEWQIqTNSouiX7yIitBC0Q2Q@lists.infradead.org
X-Gm-Message-State: AFq9FYKuasU5/uWTbHDb6l9oHpd+9P6df9Muj1xRdVfxay0njBXQamLs
	LC96UXkJwsk2y8CQzQuDoaLnFd/D4mjJefwDoeGVfeAt92szCnoXU0OBTdgnori3628=
X-Gm-Gg: AYBFou2LdMsOQfSVwca2MJay2Hp2xKWZH4ehLFf8jA/qJuVzHxV6MOpiqUF1diSA3DK
	XIKGfC84nMe6FStFE0lQoRyak8XEIPH+J2qy8zg6CNWhIiHuzBu/Uxh+Hp95a1nFSCCwjv7/rKN
	SoPjUTTWKY6qurAZPMk7SYeA+hVwbEpS7y7YHP0mOGuykF7JfipL0F92d00RItqeguN7ttSAVHF
	biwyLGe5gF9HHGxRhkTKD2BxyseoWihJ3b+cS8nyokh6Ug961PDFf8imPMVtHRAa6KlYbWfFiSS
	PYlmeKF+SKW/Xj0TviaED3VN5Rfx9oX4vpA+MXOyV+4Wj2kTd0rMCTxCiHt0mFG6OwARsUSu/Ol
	FCDfrE4XvNyJ02JaUTcxh07azQNAMChPLqBKQTzghBJJTg5MxMy9aAxluckz/lR6IIymP3L0EJw
	aBl3sVqqxd++DqEeeCj//J6gRzPGyOE4sUSTN9kb5pD1P22wULsQa2iW8tt8MszYY29NHdGb3mM
	jP/ATY=
X-Received: by 2002:a05:6870:7095:b0:49c:8cd1:d293 with SMTP id 586e51a60fabf-4a2a850ae9emr14476118fac.1.1792037164109;
        Wed, 14 Oct 2026 21:06:04 -0700 (PDT)
Received: from localhost ([2605:a601:1514:4f00:264b:feff:fe59:d7f7])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-4a6dfb4e92asm3570643fac.6.2026.10.14.21.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 21:06:03 -0700 (PDT)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: exynos: Drop deprecated regmap from reboot node
Date: Wed, 14 Oct 2026 23:06:01 -0500
Message-ID: <20261015040601.30049-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_210611_265906_A2AB3273 
X-CRM114-Status: GOOD (  10.10  )
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

The 'regmap' property was deprecated in "syscon-reboot" compatible and
not needed. Remove it to keep the device tree clean.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 911643008b9f..30ae952083cc 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -236,7 +236,6 @@ poweroff: syscon-poweroff {
 
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
-				regmap = <&pmu_system_controller>;
 				offset = <0x3a00>; /* SYSTEM_CONFIGURATION */
 				mask = <0x2>; /* SWRESET_SYSTEM */
 				value = <0x2>; /* reset value */

base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
-- 
2.47.3


