Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DA8CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 14:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqwtJk8xmatM/f20tiZM3MnIEuWEW+BjNIaufm9TpJE=; b=HZGz2t97eAaTquNn3TBl/i7PZo
	99ql/RwBuYSH9OFGzPsXdIOz+XSdloWvyR+HSW5gx/JphrL7B0ucoqG72/H1CMf/I6E3WLF6Yx0W5
	3TRuKvaJEOWQBvZXJNEhKYryuDHuUn/3AUqJNiT/IRNH/SlCFb27pso/K5vUkRHdIG4cCEET9pT9d
	ivE5VMSmhnhCrp+FL1m5vyclmbppYCjYpvqx4DSFrl0GlyJ+D8WPzrI6aSFZKyoiGMiVY0ZfQNzuz
	rniFbPuH84T2f2g0ghpP3KW9pSL0sQPG68CpDwflmtSlrfn5aZlmlGNq5C6I68BxebKdiBEUP1o90
	SNRtTnBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRWb3-0000000HRqz-1kpD;
	Mon, 25 May 2026 14:48:01 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRWb0-0000000HRpB-3NZm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 14:48:00 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-36974217d4eso6314370a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 07:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720478; x=1780325278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqwtJk8xmatM/f20tiZM3MnIEuWEW+BjNIaufm9TpJE=;
        b=AGR90n5HArgoLL4vy19fgb8aRxgfWCbTTiRoQoEYzggI/aHMUh0ttfcnoXiGhNxIgp
         44XdI2ziRtc+SLHxWFoyOvlJiBzHIYqilGeSg/fIrjMJaGn+Dm4fGhzPA9XevWzbuqur
         /RTp5BvlSzjbsgt3BeM/0tfbf0nC8fd8RN4W8RUczYYhIe4Ai/x4t/ckg+8GTTVZ0fks
         KKsx1nxY+xMP7aXjWQrladgypa/dnXZE4ybQD4oqKAsTjLIGnidcTQpRs5doccy0TpZM
         rNSdxy8rwZCTxhJii3kGBYioOdiUvQ/lIWsyuRvqeYcm0kytjVCQqr3TlYuIcDKvBvgn
         yerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720478; x=1780325278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pqwtJk8xmatM/f20tiZM3MnIEuWEW+BjNIaufm9TpJE=;
        b=ZAS1Zw+ONwViXt37OmciaRCVJFVwSyuNAkfIKPYRhLfVd2Y/z+ZD5k/eVXll2K7fpl
         WixzWhUbxBPuGxXlPy68QwRXRmKCRRKXDopAnXdCtdpBU6wyV70GZvxaOo59Xd7xB7Jm
         4+/IYQbT6phj18xvtvsy80DNVO7h9Rxz9nW5YSuHhoPilFUufoks1XTtgcJUn7HPEaYP
         NcCfrXcvU41lg/UKU00rr0FWFA+yqGIRBevczIfKmLg/Huenpl8tADsgAUeSZR0smbVx
         f2QW3Ag0t/ldrOGnySOQqy0rS6oYbP8zPNnFR7Am6y3d/EuLKTFjjMzDsBDexzOzYaHb
         J+qg==
X-Forwarded-Encrypted: i=1; AFNElJ+y7x5CdAk+utLdrBIcxQXqB6q8dc9bswERJi5in9ukdnjPJlWa1j+XScWbw7NU5hOzfWCabjkZo+XCzmKqmUR8@lists.infradead.org
X-Gm-Message-State: AOJu0YynNdfS7pTIVEX2MeMVe+7S+HHeRDw+OvoMQwX4EL+UFmhA5C7L
	z8yVQLEKIwMg6j4e3iIX3KJdQ2M8+Ivf4fpSFmsnB2RcSIKpSFR8yIZt
X-Gm-Gg: Acq92OGig86HGlMl4nm48FDpY6SgDy/a5bRCkQejeYn/ZtQ94w+D0KogCwSuzbHE+Nw
	RP55kiA5f23V1gb6vXSaIABSu5/cLEsWuNVcieqwoOQCmbJB3fiv0g+n1dSw75WSZmXhFigj6AW
	Y6wcOlUAyWPHQLtCDtikiEFjYcTiaUEWdQETI0op0zvEibdfevJFCEwN2vMV8VY5A50fwK+M25G
	TUfSrfcJR67CijUsqYk6QYV1Xk5rrwZ9Wc7+icOtseqY2AF/4BGLmmoWT3+CNoDqQPiIpS7wlMM
	17UVw9UcygN6tK6MYqwq83SvVKn6gXtiLiwh8XnBkTcCadp81pNp0TWc6Rc9VPt/U+/AFJ8rLtm
	vFxHLwibaakBGeDLvhmmic0ingbpp2ku22JBesfbhAsNzl43PIo30MUugS3bseTSmiec5aXQup+
	DFx7iW88Ie+qCLTprbDYfRLVVQMzl9SV7BeMary9NoG8q77sq7dA==
X-Received: by 2002:a17:90b:274d:b0:36a:caa9:47d2 with SMTP id 98e67ed59e1d1-36acaa94cb2mr5894653a91.1.1779720478207;
        Mon, 25 May 2026 07:47:58 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36abfe17c95sm2721993a91.0.2026.05.25.07.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:47:57 -0700 (PDT)
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
	Alexandre TORGUE <alexandre.torgue@st.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Baruch Siach <baruch@tkos.co.il>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 5/6] ARM: dts: qcom: msm8974-oneplus-bacon: Fix sn3193 shutdown GPIO polarity
Date: Mon, 25 May 2026 22:46:11 +0800
Message-ID: <20260525144629.498630-6-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525144629.498630-1-jerrysteve1101@gmail.com>
References: <20260525144629.498630-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_074758_847166_540BBF72 
X-CRM114-Status: GOOD (  12.77  )
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

The sn3193 shutdown pin is active-low[1]. Correct the GPIO flags
from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.

[1] https://lumissil.com/assets/pdf/core/IS31FL3193_DS.pdf

Fixes: 724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
index 258bbbecd927..c528d42bade5 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
@@ -147,7 +147,7 @@ led-controller@68 {
 		compatible = "si-en,sn3193";
 		reg = <0x68>;
 
-		shutdown-gpios = <&tlmm 45 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&tlmm 45 GPIO_ACTIVE_LOW>;
 
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.54.0


