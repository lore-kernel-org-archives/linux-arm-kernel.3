Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F27CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 08:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9WzTe+1vlDzzoGxy8+EdE00Q4JOiUjNnl8CApnpdjw=; b=FFJEkKdEV5uQ2Z+IoqExXulfaI
	i/UbJfbTXhhZZCsAz2gDiS/etTzzTarlPShbabanZudVNvidIHtcoG3X1HvzBmP6DQAKgs+5YJEzI
	E3JebmmVALp945XhCY10K7zNpj2o5SxgQR7rDtcg9d56rQrM1vy07h+RS0wYzEN10OLoDOdU+K23N
	Y8MpJj8+Wc8h4OwdVP3NoHbFnVz8al2aat+Xj1Ju1cDHM0PPcf31VF3EfMgqyc16m8NauXeJqjvoj
	WwV7JjqEQ6n2yOfAvSmSe7OKhyE6rYvgyO79RyqKruTcycJ4xbV9vWz2V4+uOJWEs+ES5AVa8pXE0
	vZ8Ip91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlY8-0000000GsAT-2kzD;
	Wed, 17 Jun 2026 08:23:04 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlY5-0000000Gs8H-1E7Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 08:23:02 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2bf3781ca51so45219795ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 01:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781684580; x=1782289380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9WzTe+1vlDzzoGxy8+EdE00Q4JOiUjNnl8CApnpdjw=;
        b=CxSo7sDfV1ejZpo5mgCcQUz0VAoC5AWnTYj5iseUi/rTF57Sesu5wNF94snOq9oaQU
         ZqjVXzn127ENkXjBBPDv0OLJOmcr7RHFAQrDrxfNqj8p2buTEDA2xelfV2blpOLOxW+U
         oA0hiBJSevcnCK1TfNdOqM0FyKMMuGFgskaRj9khwb9uHXhCYwo3msmt0Yz7BvF3Trwi
         ewwlAwXKfjv4VZAcfbNnNrUJOa9E7mSDUvizI96ZqgrVw/4E040kX227T5aB3zKgpd8X
         UrKbx2TuDwZvJWi84FnfQ7Z514yGZJkih3hOYyhqZEUjXF71XR7ZoEByYfGj5gGNSzt4
         Th4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781684580; x=1782289380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O9WzTe+1vlDzzoGxy8+EdE00Q4JOiUjNnl8CApnpdjw=;
        b=L2eCkai+shNwK1uzMaMZJgfowEpGeMa1B/txz5pOFmdG36QaU8Kz3dBN63VtIVZeWP
         SR8eMDUZUt5FE8AbcTMmYGIQVFwy55swW9HLBLtFF+1K4CLOC9qrgNacXz+88PwLS6ph
         tTz9s9KC7eVBI8WXd4dG0u2yobP13LinND72F6ADfQ0YByyxaHKTHmUF77uG//q2F3uI
         J0eRwfOoJHogbEmynBeEZ5UX2JZLede0gLQtgl7LlmVHsrEKXZm+Bfh0/hpURTw4F9AH
         8btMWIozzcH+a/iIMV2Ghrh+OWwJOisU+v7O9RfFWh96mK44fNQ5EN0Ik1ggYc8i195L
         LCHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8DzYF3dExoxyVAqxucfr1p0VscN3zdEHr1Vt5vt421e5+VgMCYpdjRlE0XTA1fHXlUaJbwWYhyD7LKpAneTPXt@lists.infradead.org
X-Gm-Message-State: AOJu0YyFb8C+WY6iPqV/31qNdVmvRVMsiFJwKy4v7g0UVsXkAIb6fuvx
	yU/tNJCXYttUq7RCp9l+xyyDcy+w8YHefrjxAF6RGO5Qap/6KK65yLnh
X-Gm-Gg: AfdE7cnzb2mOrHglORtmYFyukPKdilCKLVDW6e4LkuSQVTTs/ADOJMjaNSHTddf6Pb9
	KttwxFRtowSZKTgty7A7dNm+dydixdllZHvgb5v+7yUWGnWKqa2bT1wISqfjelzsh6xfQ4zity/
	eGe+k7pmQKT6PgDXJyfc1CVn3S/dWnAL0QEUsfu1O7gKRMqdQX2FI2sLlRDZf9WvCwXiGtncGrx
	02qWwccaeDxTLDuINURjRe+SF2o5xC8daibn+KPSCEwrdSurjvzhjFfHHF64a5ntYIeak8US3f4
	ei2ajXL9JCPgOvVcbQWKMbMYVPG5i9WUNzXOwtQQMS0IIB3nEO8nuA/jg5IOj9BMAQWAAioHJKq
	EeclZAkYp8asQlLPUFhXQSUpRm5s4tyIEpfg1A5TVUWvOEtWd12OPjTdO6IE/cnUGSnYCB+JYAb
	V8mbBbsyy41m8bvaktbJVh
X-Received: by 2002:a17:903:230c:b0:2ba:3e2f:6883 with SMTP id d9443c01a7336-2c6bc227c83mr25166055ad.19.1781684580462;
        Wed, 17 Jun 2026 01:23:00 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a758a3c6sm35282045ad.52.2026.06.17.01.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:23:00 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] arm64: dts: amlogic: meson-axg: Disable nfc node by default
Date: Wed, 17 Jun 2026 16:22:32 +0800
Message-ID: <20260617082239.645562-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617082239.645562-1-jerrysteve1101@gmail.com>
References: <20260617082239.645562-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_012301_329240_BE2CD71D 
X-CRM114-Status: UNSURE (   8.41  )
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

nand_rb0 and emmc_ds share one pad. Before enabling nand_rb0 for nfc,
disable nfc nodes by default to resolve pinctrl resource contention.

No mainline AXG boards enable nfc currently thus no extra DTS adjustments
are needed.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index f1f53fd98ae2..6457667d974e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1999,6 +1999,7 @@ nfc: nand-controller@7800 {
 				clocks = <&clkc CLKID_SD_EMMC_C>,
 					 <&clkc CLKID_FCLK_DIV2>;
 				clock-names = "core", "device";
+				status = "disabled";
 			};
 
 			usb2_phy1: phy@9020 {
-- 
2.54.0


