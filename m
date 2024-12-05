Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2720E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUhzG3caX9aWXbpAIl+TsEC4KHzPHOePfY0vBdmRaDs=; b=w/Eq1nyjHK+Rim8fwjbvszeCYf
	uJ3j+7w2G5saILpeZvi2Zf2PNyZ3OEE2z7dJaMt4BQuBCNGoEj7GPqNhzLlUsJbwFSnnYZh/8W+dX
	mdbW0EsRwId2MIR8jbbjXfyD91TXxDvW2mOvNBdlQQtjFYWUW4XEiNHTcMcLweLzUKPY9Qlhaa7io
	CkuWGL98uGh2CuiizA43AkB1VuKdmOErTo1SaVguaP6Ye1bpekt+pg3OxTwkXT9TOzlRQVkWRZ6ed
	iDu2o9TB+Q4EdOfWAGlYzhFWTnSrQY0TAt3XUB7qg9asJpiTrE6agMPyrbYR4VG+u3riTJsBgExtO
	b/Ms/ktw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGDv-0000000H3gk-3tSr;
	Thu, 05 Dec 2024 18:05:11 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGAw-0000000H2yc-3ivl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 18:02:07 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so667291f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 10:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733421725; x=1734026525; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUhzG3caX9aWXbpAIl+TsEC4KHzPHOePfY0vBdmRaDs=;
        b=BfDm3VsSk9j5uZ9l3ZBJNiUoEvG0PFZuTe+Y64sq3NJjY464XLfNHviSy4+3+90syj
         /P/9c/8Guo8rIS8g//vOHHrrKONIKT19OLSBvzvQ6LMApTuEcY2vhwNrIYeWXAlVS2i6
         x5TOcHUnLx0g36rIKMWnLxNDVkINiJDXB7g+3Vs+DVBJRAwdbt38X15pjqhnLda/XvbM
         DUAYQmFk/Q+ilvSw1/Slhz+5iNBdoJasixBlZJFb+k0eCBshhgY0nFmntWXXjT1JAHIR
         84NKdPvJMAs7IyAHWYqkeJ2GRvug+BCHYVh0nANcZfKXnAF9h/gEGRopBL8LqXj1PJs5
         FQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733421725; x=1734026525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUhzG3caX9aWXbpAIl+TsEC4KHzPHOePfY0vBdmRaDs=;
        b=TNhLa0dF+G+47wsxYoTHcvdCcWM2OPP3O26oOY9x/m/0DM+NkBq1p+6iQXSwLFKLDP
         LSV/1c7/afydSAnY5zyHHPy/dc/yPXxjvkj9yNMOijuKjVrUidEqlxQy4lsosGW5/q/Q
         F9ZEp/6QWPjmsm3cbdo64W8GbeAprcAIar5gQb9n8I54SkPsELmSYLa5av19FqOS1Git
         X2ZKSNu7ZPBS14NInoJLGjYJbdvOyYNA/v0NfZ/+ad1eQsTVMvo3IbST3NDrdNu2s626
         iBb6HFn2HeIZ+InwttdFBspAPI9n+cRPIdDQC+OxJxRstGariXmJmS9BLqKoAjgfzvFo
         0MSA==
X-Forwarded-Encrypted: i=1; AJvYcCWWZ6DvFpvEB1P1P+uOIWDGY4fD/w4Q4R9Vzmus/1+ltaIYToPeTfKlPp9dmgomxZZP7B3bYMQJdMPdsRYxNJ0z@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7GHvRp6VjeG8SgbmG9S/gvkJkv3W/J5tMbj5FplZN3nWZj2Nc
	4qnPWnqYhqFLTtoAdG41Pk23ADPnES/dCQzNCXZPmI707ySXgsW5fE7Mgon2RF8=
X-Gm-Gg: ASbGncviyv5/Ur8C0O5CXG84cds1/JE/ejUfScx2k09YJ0uOp37hfubbMka6laC8Pn4
	N4oKxjJyD1IuZrmGXUsvwL7HUP5eD5Lkcl5+bEj/dH6KAlvWjOINIbyYEtHVh9fYoqa5sgnCwJK
	TNpKM+pdJZfl7pZ0n2+ipDDObMOqVUBcZPLiaXSf1eFmOuGlNVupv0/MapaChOZc5fdB9t4uHms
	zKotxcFGNd5e5IxdRzKypvvR5TVkQtPT+3Vzw3amWRBUsSRq2Ib3i2xvZtt1bNpd6qzTyuI+5rf
	cPmPO5M7Jq5THD/QqrbOaE6bP4LGqSmP
X-Google-Smtp-Source: AGHT+IGmIVnSzknE9WcSqtMq8Jlgijm5XW+UPlAChDtBhFcBlLYDYS+u/7aO8ZXJh83ENw/Haen6jg==
X-Received: by 2002:a05:6000:178b:b0:382:41ad:d8e2 with SMTP id ffacd0b85a97d-3862b3d096emr17492f8f.39.1733421724972;
        Thu, 05 Dec 2024 10:02:04 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386219098d3sm2618228f8f.70.2024.12.05.10.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 10:02:04 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	javierm@redhat.com,
	tzimmermann@suse.de,
	daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org,
	ulf.hansson@linaro.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 2/4] arm64: dts: exynos: gs101: add AP to APM mailbox node
Date: Thu,  5 Dec 2024 18:01:58 +0000
Message-ID: <20241205180200.203146-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241205180200.203146-1-tudor.ambarus@linaro.org>
References: <20241205180200.203146-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_100206_924489_374F1F3F 
X-CRM114-Status: GOOD (  10.64  )
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

GS101 has 14 mailbox controllers. Add the AP to APM mailbox node.

Mailbox controllers have a shared register that can be used for passing
the mailbox messages. The AP to APM mailbox controller is used just as a
doorbell mechanism. It raises interrupt to the firmware after the mailbox
message has been written to SRAM where the TX/RX rings are defined.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 1441e9a252c2..0970f6fc1ef5 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1445,6 +1445,15 @@ wakeup-interrupt-controller {
 			};
 		};
 
+		ap2apm_mailbox: mailbox@17610000 {
+			compatible = "google,gs101-acpm-mbox";
+			reg = <0x17610000 0x1000>;
+			clocks = <&cmu_apm CLK_GOUT_APM_MAILBOX_APM_AP_PCLK>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <1>;
+		};
+
 		pinctrl_gsactrl: pinctrl@17940000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x17940000 0x00001000>;
-- 
2.47.0.338.g60cca15819-goog


