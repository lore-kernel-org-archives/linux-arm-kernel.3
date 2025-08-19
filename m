Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45914CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eNcHUwUSUoXG/NU5XWsU2yLUiTQdEs7s2EmvbkhBOOs=; b=m6n96PKP5bOFEro+xy1srYbIfb
	1m9L7X3YIKYHbEWSIFN9YiJ99e7Ts1XyJoAJRveGzg45+lbj8VRtp68NTNGT9leBuZi7GmYx2J9B6
	SCK3jtjI9ps4mDqgltjqFg1v6ctLy4LTwnBGdaIyWh/bQf0h6/4pScyU6AsQd/HDy1H0NJ5J0zlgC
	KlpscEKgBtfJe5mF4jUh1XvH5qkZelQFTsIL1KN+uCkHQp93ofboNhiCPAuXl1uuD76s3GNPieXU8
	hNhQI+QMyQHIIQzGMLWIrWLY5/6Kk6NpNaCWS6777QLjQxHkneau56hsaUpnz8XuHzTbEU8GCG/ny
	TuvKb/EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQpi-0000000BCBt-2RIJ;
	Tue, 19 Aug 2025 18:13:18 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMCk-0000000AZ9q-0EJR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:16:47 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6188b67a951so818041a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609404; x=1756214204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eNcHUwUSUoXG/NU5XWsU2yLUiTQdEs7s2EmvbkhBOOs=;
        b=iB3vT5JvKzaHjNmi+mUhLViz9MrsW6Z0EhPNucXQGZXaMnAE5KHZuatDZzMCgnFHPD
         Uni1Y9zdL8Uz2U6uwr4YI9AC/dFqnERFrhpV0mWgSlp6Pi4iudutaVvrSmupNIe7xfIN
         oXJ9ewL6QzB6ACulFDtEFd7ie/FrXYIB7t0O4rV+13Rh16Qas6bqrkF6237iRBe8X0T1
         ynt/oeoWRyS3VP2qi56JIA6ReNrf8ftaRlkQMqYqAuKlexTEVFY5l+tyKqGgnq8Zw065
         0FRWRdKZ3AS45ynwJlDn5urXM9FSfSo/9PuKS/f2XLnrsDBgVyWs5b+/1l7O/rvEGO7E
         7Jog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609404; x=1756214204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNcHUwUSUoXG/NU5XWsU2yLUiTQdEs7s2EmvbkhBOOs=;
        b=h10roM8WMoIMsKKQ+2kC57Eenjv1Mqps7NO+/M7Q8MwE8CWJnH6qyt50TOZmZ/NjG9
         GBoOvHiQPCW85FKJHRjjORKsfSzE5yHfUXF0wnIwKssS3zbUS8CQg2pMy4j9thumDChh
         BZMQoozHYoUFK9S8x1Gykj+88I1aNrcgmUvKHV4otD8lc4zIc5e0cbBaSQiD5vYTdYjX
         AMCO3XQD8iBdUlBMoml6CV0uMgjjGjRyQi06A1V+Z8ME3lLZI90OP2/v/P0tbGRU8wcG
         aBbaoapVuUJzqinLr9BSSivX5xursgDkkfB3bpzCe+vjtcIYEeWj32RcKm4Aqhz+plnA
         9MQg==
X-Forwarded-Encrypted: i=1; AJvYcCXRlxGlX6lTv+lJIUt/CH6InekXlCvcbtlVK4RTwgiQMsQipOyJWjs+GExp5YeSAmu+aHn81gfl89ePciU7Mc14@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw8kZuTHrlJ079MMRKYrP4Tlr/vZ/cIPyQepUqQecRHRpqY35x
	i6Qe3c9T1IZ+TW4Ae7Igr28CtxjCYQjVFI2rpODJdu5EtLSh5sguGjnyXzyCrSx3gqc=
X-Gm-Gg: ASbGncuclOuXrCywZjn+/BNr1bZ37yipLm5aQTFl7KE5vrLwYo6zrhNYXD6mjPGHpfP
	hxAQibrQl7eSBF/0u7qp4qxZVVueP8RlN3iWd7NrDaAIGj4S4cwqpesQoYHA3KPSsyB0oMKGtqz
	C9YwuVlZSBga94SChXGAn1pStAAVqWz0TM7SHMzrr+bsyli3uaCJJ5iaIk40kD5eYhtRRM7itfl
	hR9sJPQcHcMo5iAhZkPhsdm9i97u0b+jn1mswZiAfvNSz0AsLOTd9e+iuUfW9O3AtRJjIMDNALc
	DYsr2Ss8Ad+qOTW3MxMJdkq1JTSCQLAMHVwMp4Ad35L+lHBwilBUholYb0H9n0czQQKjzGCVSey
	q/HkIm1ZfPQMAPRseOuuQ5QlbSAbyIAVlOQ==
X-Google-Smtp-Source: AGHT+IHr5vEYmlpLTI1y4MLxEE80BWKAd2JViKb4VuSRUFyaMN9Jgc15AWVrSJjvQAIQU/3UzhdxPw==
X-Received: by 2002:a05:6402:42c6:b0:615:7ba6:4876 with SMTP id 4fb4d7f45d1cf-61a7e7840ccmr1220925a12.8.1755609404319;
        Tue, 19 Aug 2025 06:16:44 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a75774623sm1703971a12.32.2025.08.19.06.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:16:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: exynos8895: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:16:42 +0200
Message-ID: <20250819131641.86520-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=836; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=GuIpDTrIKMYk3WhNZGOiGrIbDEbFiSVL0yY6nh1sxyo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHk5GI3dFwiPjFb3vzq4sGFQJINn7QVqknaof
 HKsp/nfVamJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5OQAKCRDBN2bmhouD
 1yh9EACVAlFJ4VV2G2Szbi+YZvBSwEYs61YuY/gO1MbCCw5YImO/uPqlyWu5egLzhRHgR0fMqK3
 BKHYIqmiOQUVJzEl8BqP4otG8zdAklN6VJie3yszDwqjl4QqpgkUsjC2j9ylY16v4AWpQJ91DdS
 2Z0ikvnkKE5VMzqY+E/FhcgEyGZhSpjBEUxXPUHDCX4H5lKXuqLgDmxjBYw9wuTaY8tup8fxam8
 oIHIUbwYWWh+FRPbSzt7xfjxAO0dVyBcJtWa2r26PxUd6k77AnPVr4QUyI5gv8fohLgSfbojkP4
 gpGcHS+dQx28fTpy5MD+/Br8cNUosTBljYooPZielv3n48xoSgJudgA15MhN/Wwndu3AEzQMhAC
 qif8Uj2OOMOq3ZF/4I3TTw0KpMXhqPqueQk2Mc8HM6CzI6QlvkIW2I30/qOZNtXC7aF/SbOupE5
 Bg+gG7nt0TpqzdCHzvoSe/OOCpspHNsjy25lTwzG2+SJf/p/bq+XgrGBPzOmUhUVU8KSaOMTiC2
 cGCAot35vTYkWjMU12ouZMA98jPoiI+yYeKKmKPmCt0n2jme5+zu8qIHZgTizRz9J3h5nPXj2IN
 RzNTTVS87Twn0Tqycbha3ynfoQ74XdCAG21f7vZcnwRJnrcPhYL/sQiNOwG4x4O8pFkj9DQ4EZe 39VgAC5NVW3cjPg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_061646_091155_9AAEB3A6 
X-CRM114-Status: GOOD (  11.43  )
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

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
index 51e9c9c4b166..16903ce63a32 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
@@ -202,7 +202,7 @@ bt_btwake: bt-btwake-pins {
 	};
 
 	bt_en: bt-en-pins {
-		samsung,pins ="gpj1-7";
+		samsung,pins = "gpj1-7";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
-- 
2.48.1


