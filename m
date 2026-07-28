Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3783C54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4tdkttFSX/3BNQSdE7zE5H0DOJEurmkiijkNR+03hI=; b=M246IrH8p0ZHSbrIDZgC0+IAW1
	N3TCRRlTRmrE5XLkrTzrMTsoSPl7HvY42yxqhftYEQNaUPRvVYYVKBns/qXg/nUmzcyBooKRGlG2M
	lyUu3Q2Y2el+Aoch4emDi4LyYIxFfGT0OZCqZtcndO5OSfNoIyOja5/6CM4hVYaQl8VMOCPeg28KN
	TTf9AIdLz6dFQ8rpTyNdPDDNKBhj+mokol5ADGwYIkf8+calnQaNFuBW3eCOw9hnYtB5gMCfLhRSh
	moidb0HdsSlxndB1QKs1iJac7KLhkC3Kt3j6YIIJiGy5tlfpzuImhnQwliwwd7lgtPa8dIj7Cz7Tk
	VqUqu1jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeAU-00000004piK-2S4g;
	Tue, 28 Jul 2026 09:32:10 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeAN-00000004pg8-1RM7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 09:32:04 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4954aff6088so31643905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 02:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785231120; x=1785835920; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g4tdkttFSX/3BNQSdE7zE5H0DOJEurmkiijkNR+03hI=;
        b=XFwobUc/nbYTsO6WbXrdHZXjtLRYrdyx3S7H3R814/lAN9m/xRxCZRiy5Yml8xDY0G
         vn/nKTr3fTO9qCdTHzYVkczeodyayBLbdSMEZPFgU49TMHYGUK/X/0DSENLHaigHZESm
         yR0Arl8kR9VLNSHcvqvpMvFwyK6lY8ZnwaeGWgkRN+TjB3lnP98DyOUiE+gYp8fzQwn9
         au7zYXyceiZeryL+E2DTC/cR9k1MeCe0GUpEOar+MCqTnM2U0BPTq/09ib9YaALozHj8
         VAi8buzBq2/WQLalTPR2UCbAF1SNoTDhCTxrAu1NlzPRVePHzwx0EjqyhgTbtNZePu/Y
         Rz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231120; x=1785835920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4tdkttFSX/3BNQSdE7zE5H0DOJEurmkiijkNR+03hI=;
        b=FjMCjn3oBtI34hHfE7qfg3sut8Zw3ANyrRIc304VIfv1+j4l9QM68yoqfp/HwrJhT6
         t8wz8lziUBHal6E/L4e6ojbcFM2q88797EBRuJE9Fb/YUY3f1Ji5DI7+s0Zk9PD8yepw
         CqbrE1vhe8wVt5qv/HLE2fn6yJSf0NOZ5S7I5+f2Dg/J6znFfo5VYwkkPHISqkDW9o/y
         AkloAWVDDQh2aYicgocxayzRXRYg4NGU1Sg2gYGkV3xKIB19mdu2jpwW5ShB6UI035jb
         loPO4D5h+Uwp/jZ2BSPYdg0nFRdCMMVlyZguLV9xhKaU93ZBbgMG03O6v/5TcJ2I+0Rw
         lHVw==
X-Forwarded-Encrypted: i=1; AHgh+RqTOgo0HI2YP+hSJH3siaKkYAPr57fRFdwfOt/toPjXa2rsMbVbQMbK9Wj+hQzuT4eh0e9TLGJop34ldhNc6rdp@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf/4nXKfQhY9M4gZhVez3M0Gpu9/7IycVZ3BpO8fIeCTBGRotq
	arDf6KOIUAI1km9uOcH5ZVmwEZG2Dnqj42LBEzRnLnN64WdK9zvngDVN0nQFYMsahTE=
X-Gm-Gg: AR+sD10Q9wpoE6g7cVUpPzmw4kTw8QPjRFCWlaUKjhwi8r14jEBQYsSINdWrKi3Tnjp
	+vL+qjh2UY/DBJ2PSiav0lvl5xquqwj9hLtZ89Y8Za6L/Xw0LY26NweI8bePn9aFIBQiwX5KyOr
	7z75ztddSoJfUw/L4Xj94Dj04ry5ujKHFdXBGM/G+XFNPlHeHscfaZHbOj/q29O/I6Ert50x+AB
	p+96ADx1JgupfVFK3XUI5dRRE7kF1h3V9JVvpSEaGTu9/HLMXzZUiLA1p+J4c2checaPLWYwHj4
	uqP5xrjc8dFXLsQxFIVcc9ubDLayaUn2hJ8e1edgr4Oci+rKQULKb94dLtGTNDZ3q1LIM5gadKW
	c/Bh3/BozsAH6ZKHUMve1C2qk22kx96aTsh230SDT9gUAYNsorPuA4cNUjVqIBl/G1+NdF/EvRY
	cd3NMAU++2kOqSjrygmyh22Oc=
X-Received: by 2002:a05:600c:3114:b0:495:4e17:cad5 with SMTP id 5b1f17b1804b1-496c65809b6mr18738595e9.26.1785231120327;
        Tue, 28 Jul 2026 02:32:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm62389384f8f.1.2026.07.28.02.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:31:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Jul 2026 11:31:57 +0200
Subject: [PATCH 2/3] arm64: defconfig: enable the SY7758 backlight driver
 as module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-2-49e3ac1c8ff4@linaro.org>
References: <20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-0-49e3ac1c8ff4@linaro.org>
In-Reply-To: <20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-0-49e3ac1c8ff4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=696;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Jkl2PGH7M0NPXu29zy6QxCryxwR16MztLXN3rqJ4qq0=;
 b=owEBbAKT/ZANAwAKAXfc29rIyEnRAcsmYgBqaHcNPQpLygXthKEVC+ibQE/ftMt7r/1TDiDX/V8A
 9WiZR2GJAjIEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamh3DQAKCRB33NvayMhJ0XfZD/
 Y3GAive8EgsBExBxrjsy8Zi1O4I2uAN1I4XpWasECY/el82ulzBz8EffKkUAlxfk/A0ZIgEWTxuSrO
 e48xShxyR2+CEVEF5FXfaw5+w1JS0bOBxz51jHL5vA+184yA4kzO+vaagdMyhmMWgXW1G3+2EYkGrw
 JOwpuMlS/QPH0wmeIxo2oUlCrdAcaweh9TR86ZdS4zW9qBvIA1AFwKAtJUkBaHt8669InfGDCR7Nso
 TaU3Ma5+Rtowvp0K22jtkGoSgmy5HGXUaABRQt9x744rPO5Ne5BKZsfHlSjI1MQ/chhWZrBHQcpWML
 0vOrbmlw0NbJcIQZ6O55f5YCUIwF7GxAFM6nRmcle86MmudOcr+aEhnM4dYJEuAAFprbXOIBxv8Bbk
 d60kxVmuIPJ1iu3cLRdnfFThJr8mVTLrwF0Gm/9IVSMivDuIaCY6gROHPqTndNyrQT4pJwjw0M9pAM
 BhsMQBjnUPki/0OgCe7Fm3Lg79FFy/jIhyKCUinU2CpmcNHHt+xtjhXvi60+s6kpCWJAGI9/xgzxbT
 4zX6aFzri50oJXG4S6k9OMroOeM9+DsrDLKFPzTi0pTKNPcI3bCwZJhvlnbeF1ySLQdn6JFtOMbhox
 a7xkDdLDQyRJGEYafaZQQbWS2hOn80j/5x+ESJhEeEOhC2g2fSbAnj3kjI
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_023203_405495_227EC775 
X-CRM114-Status: UNSURE (   9.59  )
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

Enable the SY7758 backlight driver as module since it's
used by the Ayaneo Pocket S2 board as Display backlight
controller.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 97a51c238f55..90903bd082b2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1063,6 +1063,7 @@ CONFIG_DRM_ZYNQMP_DPSUB_AUDIO=y
 CONFIG_FB=y
 CONFIG_FB_EFI=y
 CONFIG_FB_MODE_HELPERS=y
+CONFIG_BACKLIGHT_SY7758=m
 CONFIG_BACKLIGHT_PWM=m
 CONFIG_BACKLIGHT_APPLE_DWI=m
 CONFIG_BACKLIGHT_QCOM_WLED=m

-- 
2.34.1


