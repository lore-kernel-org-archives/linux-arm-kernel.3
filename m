Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC046F364BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 21:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbiKzNLvIKfJ8UIXfw+cpWEfdIwdStkgczF64B3I3a4=; b=XZesCeLzqgIaQOgVW+nw3Ss0mV
	47dpCMyBNHi8TzcfUJ2+86PzPOeW3cmBsiA8nd+TAsz+0iEEggMQDZpUEdzHhgVUZjjrMDfiaZfot
	M5NvQ8xbtAH5LNiM0RhCu9z3KIO//YjpcKIS2KYgRw8igDKTmuhuKZDaKztODuSzO4ZUYfwXLtqQK
	9jADYa6hnLYKK4PJIhSR1vz5hFHpKL4uOAFer0uJOegQJP+H2spK+uD3YtGov1pPawRfcvLS0AU+Q
	apu+5yveu6vu7XVozYoBav8oGhMm9vgDF+DbtzOre9Y5gkaH//f0z8XTDot+8i43/PDIYBLcdUm3f
	mju2nygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAwmW-0000000BEAB-3uTv;
	Thu, 09 Apr 2026 21:19:20 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAwmT-0000000BE6h-0KYm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 21:19:18 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43b983bb07eso835975f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 14:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775769555; x=1776374355; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pbiKzNLvIKfJ8UIXfw+cpWEfdIwdStkgczF64B3I3a4=;
        b=BUKb67FhWmYHptuIQyUDFPXdXR9EIca0BhupVJD8AcTz5hAm1MqnEAsYwkQalzG/DD
         ozdEn2f8T4kTTCfC6oz+fOUMq9eqj3wXCWvcqAE1pwCE+/btVmch18dOYQcIQeQ4l5sX
         7dT10pYGU84c/UKRmWdSCn+zt3bkeVHwcFAixckjOYzAwfpca3V+0+QwQFBd7a8XRqYH
         T40V9man/Bu93DzK8t/1Lj/S8jLbQ/GEAZ2LfevemeO70AQjn+iSVsma8TsLcpCF8CrQ
         g0jFdBIC1kg6/dVUIqDYcENjaxsUpO8QjXuG+zbt2zvYkkxLqe0g0+XG0V7vtlN40l4z
         1VEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769555; x=1776374355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pbiKzNLvIKfJ8UIXfw+cpWEfdIwdStkgczF64B3I3a4=;
        b=n5CT882XrYQmiRcdZBYTbeU7+55KIfitBdAspcVx/asular56TpM3JQrsaZnQ4PzMV
         mPpjtD43cpwV+SRHVPzKTZWx01XOta/vPNnxl/pfLXyJojbTobgpWjGviOAJyJ1SRRuf
         O6wNvKf/+ntYulZn2xAwVnar9eHa683uciZzhH86H+eWfj1DoJ5ViqFhOwsTwMy8FxHm
         5v4RBJZ4Nrk86B+KxZmJ/TQX0dRQl8nex9LRp2sak6Vxm/As970Mf8AgoV5FYdvdTiyW
         eNEY0X+DMfm3lq0q9TfhurtHdD2KCC5rfSLBkaokQFWzc9GG+mAhv4mDrPwu/T/dDN7A
         ZrHw==
X-Gm-Message-State: AOJu0YyFR9HpDS6puNY3x/xXMPs0Mbty74sqUrjRdWM87sjOOMKjVAjA
	5qQ3Ghqo9H/uFnys9A7K2MlqWfhKOn+CcWsUfSoNwKSL3I7IDvORwi8Y
X-Gm-Gg: AeBDieucCMPwIwejtKmzcuxRjp0rKlmC8OaeXtcYLBYQk30yKXq6fB+BIon/jNnqeyS
	Zj8J5UbQnLv1osHmr8OsVLi5JWieccRpOzrWkbmGMhjZo1YkHe7zlMPa/lLVzsGZ+tVykXKQZc8
	2j50huTTYRbgahzFaIcMqsWBgDgTJFEzUuaFKQLQ4ROsLPpdyAtlaLr0MwBJaTBudZSGLeXHiUb
	UDhVcs466BaCxBILzma0hcfkKKqUVRTT8JeIKsgZFkuU+u4Bo2Gu/RSQCIM3URRZuo1eSjYPWws
	GDGfbkjwRu9z468Z2jFFAIwL6szzTfhBe9224Lu6QTpaGFhXvBH8TT7dfrRjRciYVRY6tfK5DhR
	ybxkDPiILhbkIpYDbAhWJZMpJ96CSLJhmczC3v/FP9qo51Co4y596n4noRhRjky3NrLbeXi6+6L
	MJrJgz96vvMw5EW+nGMPlNuuTwX6a8wu+8iQOsv7x9yaqg7FbX4EdhEivhsPkyIET+/+1pJ1PDa
	Q50BZw8nXq6yYQ4mbC7r00=
X-Received: by 2002:a5d:584b:0:b0:439:bdba:56be with SMTP id ffacd0b85a97d-43d64255118mr872547f8f.10.1775769555043;
        Thu, 09 Apr 2026 14:19:15 -0700 (PDT)
Received: from [127.0.1.1] (93-140-227-38.adsl.net.t-com.hr. [93.140.227.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a53sm1797536f8f.5.2026.04.09.14.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:19:14 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Thu, 09 Apr 2026 23:17:27 +0200
Subject: [PATCH 4/4] arm64: dts: marvell: samsung-coreprimevelte: Add
 missing SDIO properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260409-cprime-dt-fixes-v6-20-v1-4-8df6f88942c8@dujemihanovic.xyz>
References: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz>
In-Reply-To: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Karel Balej <balejk@matfyz.cz>, 
 David Wronek <david@mainlining.org>, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=925; i=duje@dujemihanovic.xyz;
 s=20260328; h=from:subject:message-id;
 bh=IiMoWzBxuRiuVp1uFOQTGKCJN8g8DoQRj78HlpQTisk=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDJviJ++FLCwqSkgRu19bOOxPAkxfyM911kzT9VYu16Jm
 sFS9su4o5SFQYyLQVZMkYV5qdwlvtTwiQ5Ftkkwc1iZQIYwcHEKwEQ4wxkZzk1U9vLy/qQmeMRR
 Ov9XWvX6qrmL4wXtfZ1vLXu0v8T+IiPDlwu7rGfvEBRbkhJYtN2+q/lq1RyLLPGPH/Wa9+5WUFn
 CAAA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_141917_155841_5A8696B9 
X-CRM114-Status: UNSURE (   9.87  )
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

From: Duje Mihanović <duje@dujemihanovic.xyz>

According to the vendor device tree, the WiFi+BT card must not be
powered off during suspend and is capable of waking up the board. Add
the respective properties to the SDIO node to reflect this.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index f71bb856f1e7..6ec899c427e1 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -524,6 +524,8 @@ &sdh1 {
 	pinctrl-1 = <&sdh1_fast_pins_0 &sdh1_fast_pins_1 &sdh1_pins_2>;
 	bus-width = <4>;
 	non-removable;
+	keep-power-in-suspend;
+	wakeup-source;
 };
 
 &pwm3 {

-- 
2.53.0


