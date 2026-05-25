Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611DACD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 14:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qt5GF4ec4Tz+ThdSwkffpWxOTLLBMBcFoFVLeUcmmpQ=; b=l0BHXAiSdoKDhZJ6D5PeQxUa5l
	MDchy1l5//i/hhYg3JcMGYZdlMfLWi0SA/dyZqOssOiBPlD1evS2w7n/vMb4S8hhEpU0GyN2NdpSz
	PvZbQZCmE7RQh9jl58baGLPcFPNy17Wfbx1QNN6Bp4udQ3CaasBJpyj9XxKD73TQi2ASolwNf07GC
	TqMariqicSE7q0/iPBfrftvtrgeIjcSHQszQPDpKtf8foSOTxvEKzFrO8ZJAl1VIMkk42R9KwY8F3
	cYTtbHkDyUk6pFDqosEebrTQDQ1aGhEPhGTTPTh8fUUWUY5PdoAZ5NDzjY86Di1FB2xyz7YqrVCzF
	0u9ZHrpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRWam-0000000HRhF-0vZq;
	Mon, 25 May 2026 14:47:44 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRWaj-0000000HRgC-2ahF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 14:47:42 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-36ac67f489aso786488a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720461; x=1780325261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qt5GF4ec4Tz+ThdSwkffpWxOTLLBMBcFoFVLeUcmmpQ=;
        b=IWJvKLX36+8+nFjBDcKjjrH1U/d5OnQ0j9uhbxWBBeib7oWq/3EAuTKywVIRQ60nj9
         2yhrCFHGGmCItu+12CRTEbKuSNGgSjukxZsiAJ6gf1yMRXvmNLFK1OC2WxyRgst7qeSf
         VR9IBLxQDgrikoR+Z1HIz0V4xVLc3b65LAjYk4/EBj+c/9xs5qMavhH+cdFijimaLJqf
         nSJDW+mDmAU9QDx+iFZj2qKOeDwXwRvpODzMIC/3wd3I1q9UsENpaNPxOZx7XTDIS45i
         EVP+WP6H52hO67lN9QBU6L4az5DFFXXEkJkpUWnbAb9HxyQmN7xLiQ1irP4X8aUa2t84
         0f0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720461; x=1780325261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qt5GF4ec4Tz+ThdSwkffpWxOTLLBMBcFoFVLeUcmmpQ=;
        b=UT70uaPI8sP7UysT4dVxweSVBF1xIcdhuJnSjnVfaLaPuVz/G6ZO+CcYT/8D+ACqpf
         OVOGDKNDxd2i9R/XE1U/AYWChOliwLyjjzwRcGcTYEFm11hDktL+qAhwgXXS0BvEVh0G
         VPGvMqp6rD/G4zwrAZ9H6e2zJUHJciLO5bLr57QanSi9EEgjLwPTeXAIJfXhbpKhE2sa
         2QaZzKtykcys3JsLY9H8aEJH1d7lxb8ObWc3J7fRj0wa3LQWtFrxvSjsrTF3MJoT+1w2
         bMe8HJlnaa2BYvB1xcJz3iSrT5shX2XECq4NutsLDvzBRjrOEAm6w7tObfcz0mrpmcuc
         P2Rg==
X-Forwarded-Encrypted: i=1; AFNElJ8kSQqHfqtawwxAD82L3L69hGyg5AwVXRUNfogYfgkPSWDy9BjzJe3w82QF5tAcqR4NGtsOkJFImISQR4NbS9Yp@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvs4YA82jETu3rjS9OQux5esm8ZrKAEgbFqpr+gBUHSivxBJkX
	fUnsZHLwtf5LX2CWDC+b9DVjLHrziZJRP0EI2AYMoyzKlbJiGNMYz9qJ
X-Gm-Gg: Acq92OE8Rkf/E1j8KY6n6bSuKbu1Bzfn9AdYF0pHvOSi7KkoBpV4vAfIv+g2CVToDYR
	+/qTZiX5EuGZ1d3wsXGiYWLlyMnaoi/mS+dSm+bJ3Danm00CmIP7na7cf3NCzqSBcmiDtjEALzt
	D8IpO3oTpsFEVs+A8YPE9RokDieS2GLEWr5kib3q5wRVDHTFYkrQqVwD6kOUjtfw2w90oU8Zye9
	VaBuSakLzUcENAl4wD6lLH3N9X+HV2WynZ7SXZSoO29jsbnVqvnNGjsHoFA59xR47vei9gvxuuE
	HjCmxLzLOOtudM4a7Aej3p+r2P/6IX3c/jJ6uTssmRDIYoAIoPydqR4cMcETbOjxwaueXEasWqU
	x11BZb/ZMyWP9fg103hxntTBZQAp1SHcfihkdr5FtJxocTTZM8LTqBU7gCh350tI5vW93je0Auw
	BkgjsGyCfTcP5NHJMAG/LxZIad9hWTIphfopcYWzM=
X-Received: by 2002:a17:90b:3e4f:b0:365:8fd4:925c with SMTP id 98e67ed59e1d1-36a6c65330amr11990238a91.8.1779720460900;
        Mon, 25 May 2026 07:47:40 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36abfe17c95sm2721993a91.0.2026.05.25.07.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:47:40 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linusw@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Tony Lindgren <tony@atomide.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Romain Perier <romain.perier@gmail.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Peter Rosin <peda@axentia.se>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 3/6] gpiolib: of: add quirk for IS31FL319X shutdown line
Date: Mon, 25 May 2026 22:46:09 +0800
Message-ID: <20260525144629.498630-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525144629.498630-1-jerrysteve1101@gmail.com>
References: <20260525144629.498630-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_074741_660615_C413C3D9 
X-CRM114-Status: GOOD (  12.03  )
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

According to the IS31FL319x datasheet[1], the SDB pin is active‑low.
However, existing device tree incorrectly configure it as active‑high.

Add a fixup to force the consumer active low for legacy device trees.

[1] https://lumissil.com/assets/pdf/core/IS31FL3196_DS.pdf

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index ef1ac68b94b7..8a79aaadc9ea 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -194,6 +194,16 @@ static void of_gpio_try_fixup_polarity(const struct device_node *np,
 		{ "himax,hx8357",	"gpios-reset",	false },
 		{ "himax,hx8369",	"gpios-reset",	false },
 #endif
+#if IS_ENABLED(CONFIG_LEDS_IS31FL319X)
+		/*
+		 * According to the IS31FL319x datasheet, the SDB pin is active‑low.
+		 * However, existing device tree incorrectly configure it
+		 * as active‑high.
+		 */
+		{ "issi,is31fl3199",	"shutdown-gpios",	false },
+		{ "si-en,sn3190",	"shutdown-gpios",	false },
+		{ "si-en,sn3193",	"shutdown-gpios",	false },
+#endif
 #if IS_ENABLED(CONFIG_MTD_NAND_JZ4780)
 		/*
 		 * The rb-gpios semantics was undocumented and qi,lb60 (along with
-- 
2.54.0


