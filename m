Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A622C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 20:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbQUcocXM6VHyJ4FeiW0D1YCdpoLynB31hIqBFpFpXo=; b=IZXfvd6w/IuVROHMoriiqAXWdK
	LT8zLO1aR2d6O+Vse778JUXgAp65c0X3wokWCLgsVCY0JYu2jx0X4yE0tdfiV7GaLuIUuWFoezSVJ
	jnAiqk8M8To+ALRpKObbPhLmyC+TFHDdMqWMkAQoStQlY+l+G0fyRJy7DVwWI9EL0zxMb2uzzyTbn
	4Vek5H8341njF00oytTBGGPxXbwGHXtU+OiNxn8Da2ame125JbIDIo3ZwJ+AGtZngDjknv0pla2e7
	L8elK5vacCT0/YregRtioKT/xGo1GoftvnIO40y2P2x1GCHTghOq0uZUK6NvVHkfWptqjT/bOSkH8
	Y6qjX7rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhD3W-00000002LPn-3Sax;
	Wed, 30 Jul 2025 20:05:42 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhCrL-00000002JaT-3XxE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 19:53:09 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3b78a034f17so131960f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 12:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753905186; x=1754509986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbQUcocXM6VHyJ4FeiW0D1YCdpoLynB31hIqBFpFpXo=;
        b=ZCzn0CQgEsGLh7jI0QV9NT0l+zgQTsZd+D0WTBEqblVgF/ecJT6P0d7+bdECgV1k81
         0bxBRD6mVuA5R2gIaXhOe53B25rMBI1MYDbbYetDluCxLmaYhSg4RJJXc61lK7q9uydm
         xZyk8iwaqotViGMxUwqSNHiUGPAz8viwyzvstyOl81IO+9m3mFj5YOPJAcX0RZC0Ppdd
         +BjWdcRs3FguMKAEZph/rbw6sKTyc15mSxElBFCIjFoBeNPwUpt0oBNL4W697yF87MeM
         hwiJWJ1KLw7KHBe0LxVOl5c+QMXcv7CkDG0+xIImofg2LSwOZzFTn9/NXOksO4Sr3ezv
         Ab6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753905186; x=1754509986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbQUcocXM6VHyJ4FeiW0D1YCdpoLynB31hIqBFpFpXo=;
        b=WtGMHvSSwWmvJlLvSFcB6pf/n1GmPx9mvHDE6fA3kXsO9j8czjkg8sLLBN0yABTBf5
         l/vzg+D1gMaoe8Nx75Y0Odv8auZDevi/5SQoV7kCUi0Z5SnFNXbMiLlG2rics5C/E+Ll
         Hz9sGA5JIcRl4OobSb0Z/CtTTJl7UUW1/vf8dLMuDIZcIkCReKhnQXJnp4jYpDCteWbt
         OrOUhlCrSF3uG72/Z/X176bEth/uJ75r/nnEjLYsdg8Rgnbb5KOviOUmTKF3BxnB5dOq
         TgkH9UaQTS8b0IV+uWiFR7FC/JK9EREObx1zVwA4eTgXJoGZS7yUneT7Xo/wJDGKDtoK
         6NSw==
X-Forwarded-Encrypted: i=1; AJvYcCXno4SR+WVujR4KmbWKyHYat/sM2OQVp0/77AhVEIOIaLytAoVCxKc+GDf4W7A6nrHxhhSWEjyL9dVIExezwdWd@lists.infradead.org
X-Gm-Message-State: AOJu0YzTd4pU2Mf32c7LQKu7D94SSXCtoognu6NzN727OyQ89zueBuE8
	YdTVySW/ng8hvQLG4106EOoUd3tNNBSeXruEYwUsn1EUTM0bSfrnWV2ySLr1q8hjexg=
X-Gm-Gg: ASbGnctDozDNhhRhWkFKnv0mp5rc36C+Jvxs3QQ8fW7q3E87SzSMUiQNb1HgUMJ7//O
	efnwLMAetFbAM3AEBYQo567XXYB4bl77eADaFX5tRHQRpPDIU3slt5uTtsnOcM0A4GOBuLNRnJk
	PW3cWKj9wr2jzYwfxtjog62WVpIS9fDTdKzuTscofz90GXWkQboqO5l6tp4iqjBgsX3ocpzwsc6
	EvaCAxEEMh8oTAyqk7zBDE+p6AlhjTOlPHUSsXX157nfKbIo1/Te3A4F5JAl9vcbFLl0mL+POal
	rpamqTaNQJq2xYFQ7oMu+Ut+vf78NHy11/OGUb3y7GqyS2aWePmxJ4H1UPtKemNiysQESviSpRw
	rpH7IEibggj7GKNyd1MldKJrX2iS67zMUKYzBaN0CnRM53Fjc
X-Google-Smtp-Source: AGHT+IFWuBrLIEbeUtZdtLqTw+hW1a9tpEUu4JPcNe6Bb4qKpFMMypY6fb8mghVdvzohIsDDM0+1fQ==
X-Received: by 2002:a05:6000:1a88:b0:3b7:8832:fdcc with SMTP id ffacd0b85a97d-3b7950093b6mr4274596f8f.38.1753905186428;
        Wed, 30 Jul 2025 12:53:06 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b26a4dcsm9556193f8f.32.2025.07.30.12.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:53:05 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: [PATCH 4/8] arm64: dts: s32g399a-rdb3: Enable the STM timers
Date: Wed, 30 Jul 2025 21:50:17 +0200
Message-ID: <20250730195022.449894-5-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730195022.449894-1-daniel.lezcano@linaro.org>
References: <20250730195022.449894-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_125307_886779_B9615BF1 
X-CRM114-Status: GOOD (  12.78  )
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

Enable the timers STM0 -> STM6, STM8 on the s32g399a-rdb3.

The platform has 8 CPUs and the Linux STM timer driver is per
CPU. Enable 8 timers which will be used, other timers are useless for
the Linux kernel and there is no benefit to enable them.

The STM7 is skipped as it is slightly different and needs an extra
property to be handled by the driver.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 .../boot/dts/freescale/s32g399a-rdb3.dts      | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
index 802f543cae4a..467e0c105c3f 100644
--- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
+++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
@@ -40,6 +40,38 @@ &uart1 {
 	status = "okay";
 };
 
+&stm0 {
+	status = "okay";
+};
+
+&stm1 {
+	status = "okay";
+};
+
+&stm2 {
+	status = "okay";
+};
+
+&stm3 {
+	status = "okay";
+};
+
+&stm4 {
+	status = "okay";
+};
+
+&stm5 {
+	status = "okay";
+};
+
+&stm6 {
+	status = "okay";
+};
+
+&stm8 {
+	status = "okay";
+};
+
 &i2c4 {
 	current-sensor@40 {
 		compatible = "ti,ina231";
-- 
2.43.0


