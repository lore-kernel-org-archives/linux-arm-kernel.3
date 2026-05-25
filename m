Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6587CCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 14:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVVGG9O42cYkv4+MEhpJhN2Gsiqdr8SLjGLZwhgYa/0=; b=yyK8KmvY4ecPNwATwkiTYc+zHx
	cGgcdniZnE9mYnobcUcUbMynH8tlu/k9vowbNfCQmlEzegrmdS0F0lJ7nBT7+Y9lCV1DyBMpjegp/
	vgxn3JXwTI04HTsgLk+uDEYQbR7sEWo+XWTR6XwNA77SZUi7NdJj/Mc5Y9TbEdY/enPWHk/2D1ECo
	yTfdnmtbjivpe5yRblTJwNc70OEEbojb96VSYxaPwblaGTeMxZ7nHBDlQzzeT8FuaA902waYVJopJ
	y2D8TxAZ2GuxivJzv9KQY0vhhx4dGmizva4cJQyJiNH+xMT0CExZpI3BgjADxXKT6vIcuUtMTlhCC
	kIADmWhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRWax-0000000HRnO-1LDs;
	Mon, 25 May 2026 14:47:55 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRWas-0000000HRkd-1vTJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 14:47:54 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-36abfe17c11so1482623a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 07:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720470; x=1780325270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVVGG9O42cYkv4+MEhpJhN2Gsiqdr8SLjGLZwhgYa/0=;
        b=CG5QnEeDPSKQgd2cphQUb6Uqo54nqhGOa/BtnkAmgjjrxN8ZYVBDyzW/3l8Cpzyh6Y
         9ftjJETZlIJHKGqleJkZOV3IdKPrff9wemP4AlIw0vzFxdBUJvEEvNIXQq8mfPzfjEX7
         y0YKsF7eM7S0fFW1TqUojX7CshBMk/mohxNzfDvonD7Yf49ic7br0YwDG47Gw3nXPHsv
         99wu/PgVfdKludLaFMw9ER/iVV36nY2qJlpGhf/RLDpbiyATPfSpv3o2w4e589dLXtp6
         e/GzlbycjF2MEX7Gq8dTwzIqvoK6fF9Bj+Dn+wcU2qUra7doYi9fsl9A/lFmDiXe0TEv
         zvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720470; x=1780325270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rVVGG9O42cYkv4+MEhpJhN2Gsiqdr8SLjGLZwhgYa/0=;
        b=JyboRXQrSVRNiXA2wLT41SXPkfuaXLSBReTpAPz6u3ogPjiT47/PvNMqk+RUWI4iNQ
         mnCPrIZgScLOoBvjNWTNPrp+3Cjc+E5MskGTxnSa4eDDQDzmHERavV9ArRT0KpX4Gn2r
         ej38ETQgEONGkUREH9fwgelLC09hk06QvccJXsjrW7HKHq7KKCQ0Mv5PQqTssUioq9ir
         WAfzu2yOWUwZ2ZOeYYSJBCpJzWYM9xqPKUmMu8qvLR1dV6oNq+1dR4DlH35u9HkRs3OL
         CYP4yA0PbMWf9vFkTNhmWKFPtdVJnRFB73J/rJLBMNGuFnGMZWdmFcA5+6rxPuoljM5U
         fIBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2O3PEocRJ2qzVvDbHV/7zWw/wIdfoG4oXj8s8KR6aGpDTh74O6asCqIe8cBipECQSObrqjmBoNvI71+dWtF1d@lists.infradead.org
X-Gm-Message-State: AOJu0YwRBqRZ+NTCxY1XjNj5ziZSnIwiOGvXeinqxY5fes1G5i3ZOjsP
	ywZThaVu+XI7uUAzGVtZv4ldg0PHZEZo0OgbVOvDH8zG30+feZAyf/xP
X-Gm-Gg: Acq92OE5uG2ZynkLsN2jHg7v/8Fr4j/g6cRbF8lsZH79qRp+CFjXTKwYTwLHfrCJFfC
	i+N80SuZPwakW9yOxRIz1MCksS+8bqGHl1//SU+uyl7ZAzNEDyACyafzPaV+hI0bUcSvKRx0HiF
	yYJU5NKySUHyjATxxAMRuo0FSouEWew5v7CJIRufZk2ah7yMFI2W7mOqk9AnqxcOvBzTVwjm7yj
	XNTJBFdbFb6V9LNdpZkQD1hoQcUkEJ+/sL5HUD2463s9+6+ngaTEJj9OhX4NBkmyVvxNFBGWXPy
	GwdtZipPzdMX5BN6iluQ4ReFe9ogP5hDYtsiwdzwJzDn1rXv9zg9PGI7WAzQeG0m+GRJ1neRlG1
	O833fx802HgTHvuGrRFNrA73uoSZb6Re16W+RYPDDGHJHWYZWmNu35TqFYuB7Zl/jHQgEDsJRV7
	Z+mPLyiQDaYIRW/q5PqUR0+0mDG8Gwsd4zSBlxDN0=
X-Received: by 2002:a17:90b:5284:b0:35f:b7f5:9b3 with SMTP id 98e67ed59e1d1-36a67420e95mr13511527a91.3.1779720469769;
        Mon, 25 May 2026 07:47:49 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36abfe17c95sm2721993a91.0.2026.05.25.07.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:47:49 -0700 (PDT)
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
	Viresh Kumar <viresh.kumar@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	Romain Perier <romain.perier@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 4/6] arm64: dts: qcom: msm8916-alcatel-idol347: Fix sn3190 shutdown GPIO polarity
Date: Mon, 25 May 2026 22:46:10 +0800
Message-ID: <20260525144629.498630-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525144629.498630-1-jerrysteve1101@gmail.com>
References: <20260525144629.498630-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_074750_499379_C6251F86 
X-CRM114-Status: GOOD (  12.90  )
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

The sn3190 shutdown pin is active-low [1]. Correct the GPIO flags
from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.

[1] https://lumissil.com/assets/pdf/core/IS31FL3190_DS.pdf

Fixes: 1c8cc183d070 ("arm64: dts: qcom: msm8916-alcatel-idol347: add LED indicator")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
index 2de8b6f9531b..6d51d6efcbac 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
@@ -197,7 +197,7 @@ &blsp_i2c6 {
 	led-controller@68 {
 		compatible = "si-en,sn3190";
 		reg = <0x68>;
-		shutdown-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&led_enable_default &led_shutdown_default>;
 		#address-cells = <1>;
-- 
2.54.0


