Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEBCD2AB1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 10:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dP0KAMyVWS6Yj9qu9bHMDh95jkCq6kFe5y2/InwDUyI=; b=3rCjMhslFev33sin9t3RMs+v1Q
	qEQojjwIRLTB2k2jmB7tV+I0vthgQelBrs13QyG+pFKLlTOV3mUYTPpOkLnsDpYtau194at9J3yNb
	Kh3ifBgiPr6ZEikHNcgZq4f8VtaZrDx48XRW4GN71jcvegKDB9FKx1eD+9EycpZfF4zFyrgWYXoU4
	GbbE4SE3fuMK7ArQtG/g/xelhJsQgqkREb8AK6AHy0MuZMudDKi+bn1V6334YmDpfRQQgaGYUXFtP
	BpvbW18wsPBi8SdIYfu1OYGWF85vFNf0zdvSM7Sv0OWD1XZadb3kTinX1y2gqN8pWQgbwWOzxdW4x
	lVBNZiVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jVm-0000000E2ev-2djc;
	Tue, 29 Oct 2024 10:31:42 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5j3X-0000000DyD3-3mls
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:02:33 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20ce65c8e13so46326075ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730196151; x=1730800951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dP0KAMyVWS6Yj9qu9bHMDh95jkCq6kFe5y2/InwDUyI=;
        b=Bxx+o7Uu+cdxTGrvAtbr9EZPFL1XtxBfOPpYhqBfL73jcRo0ltBLrxjnxRfiriiNO1
         XmlEq5FAH/Rij6Iw8bNfKjW+yYQSBPts4kHWOsJDS3Ni0m72hnjHIYKMzNqx60COzJew
         BV3i/lE7RJHgQVDQXlSVMGIwu/h3wcZMAGiUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730196151; x=1730800951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dP0KAMyVWS6Yj9qu9bHMDh95jkCq6kFe5y2/InwDUyI=;
        b=Q9u3sSNKZ0OfynDm/70ZSw0uH7xj+jcgLtmMq0GhIY1hqWrrp898eiFwxKFeHaeWMI
         MpKx1bkmjB0Uk0Zm/G86n6iTyMJvvQ0SALKlc1Xv7mLB2TEs7fuyaUEmWIUuw8wu+xLs
         YyjG7bP9FQTuHVHSuH2HKhfPPdsXZeZZ+XQGt4n7KOddv3ytQyDvlQ/Cg2iIeH8MTR6S
         8Sq4CPmKRDlfNd9HvvlsCm21Xrp8U0kDpXFVm5FtzT3GBLEqstGqln4qTLa9Wwa1ocCa
         boFapCk5duKrh7/y4sCzwiJd+ifc+teHj05VyGhrE/4q5YX2MgLduiJjn/ZfaLnCGspC
         KJ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvA3BdcCTvzcQBiW4ph9MLQv3mTAvm1WALZqiv3a+9zTuZ2RxWqh8acVT15v8hV/J6VNtcYfWP8X1BISM2ynR+@lists.infradead.org
X-Gm-Message-State: AOJu0YzasxqtmWFxl6eMQQEtdri1RoyQJIAc0U6uMTvX4flQGFqfEF3e
	xBaDEUdXgsDGxrEV80KD4JZKGEjFU9xxb7tbyQ5V08VLzuOpDEdTmTm/zpWqwA==
X-Google-Smtp-Source: AGHT+IEVCUvA4kLgKRzZ3vDr/KBHeqsWpmQJtKxeUYRTf/PK4hHx+6K7t3YF7nEmIdBRHb+IdCV2Zw==
X-Received: by 2002:a17:902:c411:b0:202:28b1:9f34 with SMTP id d9443c01a7336-210c6d3c766mr153604875ad.56.1730196150884;
        Tue, 29 Oct 2024 03:02:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1fef:f494:7cba:476])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc04532csm62785665ad.254.2024.10.29.03.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:02:30 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8186-corsola: Fix IT6505 reset line polarity
Date: Tue, 29 Oct 2024 18:02:25 +0800
Message-ID: <20241029100226.660263-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_030231_998950_BBDBDE79 
X-CRM114-Status: GOOD (  16.33  )
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

The reset line of the IT6505 bridge chip is active low, not active high.
It was incorrectly inverted in the device tree as the implementation at
the time incorrectly inverted the polarity in its driver, due to a prior
device having an inline inverting level shifter.

Fix the polarity now while the external display pipeline is incomplete,
thereby avoiding any impact to running systems.

A matching fix for the driver should be included if this change is
backported.

Fixes: 8855d01fb81f ("arm64: dts: mediatek: Add MT8186 Krabby platform based Tentacruel / Tentacool")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
The matching driver change can be found at

    https://lore.kernel.org/all/20241029095411.657616-1-wenst@chromium.org/

 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index e3b58641f2c9..43c83620e479 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -422,7 +422,7 @@ it6505dptx: dp-bridge@5c {
 		#sound-dai-cells = <0>;
 		ovdd-supply = <&mt6366_vsim2_reg>;
 		pwr18-supply = <&pp1800_dpbrdg_dx>;
-		reset-gpios = <&pio 177 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 177 GPIO_ACTIVE_LOW>;
 
 		ports {
 			#address-cells = <1>;
-- 
2.47.0.163.g1226f6d8fa-goog


