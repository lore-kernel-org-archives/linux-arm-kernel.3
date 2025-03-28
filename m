Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4D5C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 17:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7RiNKZlkxAxgBvokSU2RyRmQNQI1s7tLyPaBleKgV+A=; b=1XziT2kU7nOpMcH9OLnAj/NVET
	mu/Ypa5QP2D/0BlJxZp5+O+i5inLbMeUpj7hAtMxJFqoytUTcLnfBN1DUDSVFTm1iIXzCjS1NnPpm
	nKplRHgCmS8SuZhgBhVVmwiI66AJslhB6x3kl4LDY6rvoU8WFqd2jAqrYac1EVSzAJRR1al3KR8L2
	FACTtrG08t8srFielPBEFyEGN3jw3wM1xnSIB4pYSeA5WiE2io9eNIojtVU/ESdlheFseF9Gaq7j/
	z9y7cUFl1+7gxwzvWxSWlkrmJql6JEEQul9hdSz2sZNsK3kqnX6dB9+3YjK+hcWeXrNkb752NSiOh
	tfvXAP7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyDJP-0000000DyHO-3hF3;
	Fri, 28 Mar 2025 17:16:07 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyDHe-0000000Dxmf-1u6H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 17:14:20 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so23020975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 10:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743182056; x=1743786856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7RiNKZlkxAxgBvokSU2RyRmQNQI1s7tLyPaBleKgV+A=;
        b=V27jYC4n+7nuSqPxD3HWtx0PujxLTlouRsN3qjZ5KsEaiTu9DzIUUb33Wkr5evj8XE
         qm9YM+Vch93PaiavvX2bWgK5gMncsB4bJGyMe10OJ3P8Nw4t06eLHHp8kRUne2axvVI0
         9k3oi2cm6loiKupYHFQG9E697XS4UNx8+F0OmxWAwaWjZFUJWFQTz2FfKfFFjkG5Wm9D
         CHHCgCWTsi+6jvg5M7l7PyDMAHSe7T9BIyRt2RNFWLapP4pu2bkf/peHKNr1MsJsrGZ+
         xsri4D0zCM7ivMQbesQ0uLJSjOrIAqA0A28/uI3mue4IMu8lIhpg9YyB533vE97SAzCd
         Qy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743182056; x=1743786856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7RiNKZlkxAxgBvokSU2RyRmQNQI1s7tLyPaBleKgV+A=;
        b=MC3GoGg7R3W887z2bHPuCYIrkON9u5duLdf4rRBGYi1ARkGDbx63VmQ85xv2AnY+00
         Js9gbuwoBcWd+lpGIQa4vXilHg798XEMJAKU5BEGdv5zqYhsOAjPzMk1NLIB9gDWH3iy
         dRrWFD9/fqQKxNhnlIYKUHO26BXK2k3JGlawe2oziuCkEFSE6S8Ie47YZ0U+bYHOw9sz
         kZnW3Mu9S5BJ2uZUOxql0AAEsa7tIOwFtRq2HM4MGgjmtiLTqJN1hUHuJOi0Vw2suu1e
         3PAnnKIfWPsPEE8P5SKZ/+kZ1x3kOMtRaysqtHeDaFcePoQczu0QYEA6YOJsGXlBSFSq
         I+MA==
X-Forwarded-Encrypted: i=1; AJvYcCXYmGV83wJBykmkjZb58Qf/YxPaONXSEFLQKm8nSu2IamkYEQRPi/dMCUvkxmms438aHCV3rVvCocBmYfJ6GFxE@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ2/vgZZAEogh02u54IA7Brs/G8v4Ywjz8d0PAlEYWavzzY81a
	RbReQ9tAov+rjcOHlwbxLUnvk9BKZdwokbmJ+/dqyPKfTdoJi9py6pGozOimB/0=
X-Gm-Gg: ASbGncvjn30ndkd0lkENoO+QxsW0WEoyD5BXXdKW2xUjjlEhNNSNpEUJyHpWz5Y9Z33
	khONPU8gWmldInBabaQbwclKXhHMdx0gVUpzApy0VA8et3XrqHxYrmIuza8Ap+8wrGdwSV0duWj
	BxuGOTTzZ/V5YEgYXsAXDzrnC7xhzxcijTyw5wtwhRWnq+uQ3HC3dTtSmfYwg9cpbKmWtmC2FOB
	iOmv/YLvw1oM1KGjZjpafNTZcrSzwXUpNheeqgG78bly+KIYdMJXIBfnndHcR7zsPKm539nn6UZ
	46+8PZoWpMlFtiJ1IsXATXkN644ObhYl7SORIWeH4bv/g/+rfR8Zn2eBpLBWKGH9/UL3kTUUUnQ
	qOTG6BY4pB5k=
X-Google-Smtp-Source: AGHT+IGR/kzMV6Atudb0fRu185H6wdA1+X5asjv7gAZNnxUUZIM/KcLBLHgVDu+28V8mgpkJV6Xccw==
X-Received: by 2002:a05:600c:310c:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-43db6227ac9mr3380065e9.7.1743182056212;
        Fri, 28 Mar 2025 10:14:16 -0700 (PDT)
Received: from localhost (p200300f65f14610400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f14:6104::1b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042c8sm33411655e9.27.2025.03.28.10.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 10:14:15 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH] ARM: dts: stm32: Add nvmem-cells to ethernet nodes for constant mac-addresses
Date: Fri, 28 Mar 2025 18:14:05 +0100
Message-ID: <20250328171406.3307778-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1643; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=BHpq2UbaF3kL6H8YXDTV3jWJ+lPDn0AShBL5PzMnA/s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn5tjen6l7NAtT3+JrsCCThqn5k1qsVD1vc0M9Y ZVXM89Rdy2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ+bY3gAKCRCPgPtYfRL+ TvPRB/9KuR3rJQ0M41W3nqDBh5GaE52iNnZd3KKvvPv9z7cHHQyJwdW77AFGgNSv3keG14zGVSh nAHzmRdowRt1Fv163Ri4lOD0ZQnL/albfzfHGGROLZGh3oZBuL0i0maRccS66D8bgiBlBfDjRHg 3v3ENgAwKOizz1eaAS4zsVozyMRtX8NC90c1HgQmwEdL6kCE5QFbvcLSaq+9yUTv0pxa0uyJFBA yWEcssCDxRMk38qor1VgCbVh7P67TQtNg0RHohxrNulSGjG15Ca8O29fr4AGZHWvZg3qejOSO52 aMUKLoIqXEQ5DMJ5DpPflMnYGF52droNnFSzBVBd1q3/1nyV
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_101418_495438_89AD4503 
X-CRM114-Status: GOOD (  10.82  )
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

The efuse device tree description already has the two labels pointing to
the efuse nodes that specify the mac-addresses to be used. Wire them up
to the ethernet nodes. This is enough to make barebox pick the right
mac-addresses and pass them to Linux.

Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 2 ++
 arch/arm/boot/dts/st/stm32mp133.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index 8512a6e46b33..9175ed77d769 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1609,6 +1609,8 @@ ethernet1: ethernet@5800a000 {
 				snps,axi-config = <&stmmac_axi_config_1>;
 				snps,tso;
 				access-controllers = <&etzpc 48>;
+				nvmem-cells = <&ethernet_mac1_address>;
+				nvmem-cell-names = "mac-address";
 				status = "disabled";
 
 				stmmac_axi_config_1: stmmac-axi-config {
diff --git a/arch/arm/boot/dts/st/stm32mp133.dtsi b/arch/arm/boot/dts/st/stm32mp133.dtsi
index 73e470019ce4..708c0af50bc4 100644
--- a/arch/arm/boot/dts/st/stm32mp133.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp133.dtsi
@@ -91,6 +91,8 @@ ethernet2: ethernet@5800e000 {
 		snps,axi-config = <&stmmac_axi_config_2>;
 		snps,tso;
 		access-controllers = <&etzpc 49>;
+		nvmem-cells = <&ethernet_mac2_address>;
+		nvmem-cell-names = "mac-address";
 		status = "disabled";
 
 		stmmac_axi_config_2: stmmac-axi-config {

base-commit: e21edb1638e82460f126a6e49bcdd958d452929c
-- 
2.47.1


