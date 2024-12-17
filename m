Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A07E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 10:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rzC8vvycH/Cp0hUw6Wfj4qRoaSuoHKIpGfYrmHMjP8=; b=fPPkyqE0HoAmBbX4pYHYA61m7I
	aaiESVuOz3s/kjEfuKnbFeLUbtRdwaNjDZKQnUPg1at8BuBl3X/64D/dEgbX8TXPsFWHTxhUY7RYp
	ObOFT7HHe6o/0QLOFjPtXibecRSyYKVD14m+nkCTdrAUfkrxf6pQmCCmqfUkMRFVluR23dVF45xB9
	Hv8kuU/Kw6LHMsoUftlqu9u3c4eJm2uPkPhZofP0dp8LEmM8W82MmTouaBOHGdf6+hGAgQULXVsN8
	Un/m7aLXHJHT/ePaRm9vCmqPEMtm9g9Xnq5nDvL8Szcm8w0TChV2jOx7Yy9RpivdkJao59UbAYaKj
	VFCDc5yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUQe-0000000D2Y4-2z10;
	Tue, 17 Dec 2024 10:03:48 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNU4P-0000000Cxay-3WJV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 09:40:50 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso36411895e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 01:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734428448; x=1735033248; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rzC8vvycH/Cp0hUw6Wfj4qRoaSuoHKIpGfYrmHMjP8=;
        b=PmAl5SQlSb6dD9gjW9jGuLMyBk6KFVnjC1Vd5WzWG8MBza7JeLshojYfTZo30NLfAk
         Z1to8Y9/VaoVUcFBI7Wfx75BR4yFnInIk/6dJMzZw03Td9I3QZXVK9UI3jYNMTX22pPC
         jaP6iVsfzLyyDK2Nsve1ASQzl1GA1yGdhVIKapEikTa7zaER2QnGBd6QOXIiB6YWdudQ
         FQoC/UC5dPsZU9VMfkavDyV7S4T5GRBRiS041yXr7OFbk5rkF/6HICSkLz8WBAo5/UzQ
         CCpEFoywSfj0ymJBfkeNadrU5zk+ULl9uv9Nw33gl8AvZuQHZ0LKrgZfAsf/QdzP3FZH
         E9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734428448; x=1735033248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rzC8vvycH/Cp0hUw6Wfj4qRoaSuoHKIpGfYrmHMjP8=;
        b=CA9AQ7OKl+/iHoLlbSgwFDhGO5K9J9550Afe7RuM4Vp+hXHVjRQFFt+F1cEooYll54
         RzG0fIZ/HghxBAjqhXMr7YQjfaF1vAc/gLj2IDcmw0yaRo32oc6L0/e0msWBrlwGBXLZ
         JGhicG4MGwU66Iei3IpuRDeLM913Sb8fOr7sQ/ZUbQ/4Ulg7m76dxOVg/XncLYbhw/YC
         fAtcb3HtNC8PU3KSRD4Bwc0YAwUzGxm/1HLFFMu1VEO1RrK64UgLMHd44t119PWww+Ld
         3TDJo+eEscOqU57Fg/PGD3uhAEq3Vw8xrR8S6f0rSRhYXb0OqUQzwRkM+w7mkBlEjhKN
         TuJw==
X-Forwarded-Encrypted: i=1; AJvYcCWG1+xOzCCpknGnEADiILxeiY5kyAMV3tSUNlkDGYvO2hop+1CsWC0sRP6ddejCb5HAfI8vAKDwao152klr+f8l@lists.infradead.org
X-Gm-Message-State: AOJu0YyATgDLy2+hjG97Y329YJXhMfH2zGfylMmbMmtuXdGvqHuugFb1
	Bfx/9JpCYIyFMBXM7lXw/jMeLtn8OyvqjqEOyfn/wmGPBV8C1NkooRo2YcK2WIY=
X-Gm-Gg: ASbGncsBTfg6ei0iGkiFErqU+uz5duFaQIU6cBxpQhZQI+O05unl22iyeVLFuAbHqmO
	Eos7SRyvMlsZi0yD3gmqHmayR7D7vtl7fUHEVC7Eq3u3SJoTFpDddxt4l5YD7Ek/mtcw325P8gD
	103TFyh9wlA5f6euoPCA6ZcxqARClNmfxDZjcMEBJ9larCOZAOTIwWZrnCiECKwVrzySVLc8f3x
	V2vp8urPPsqrK8QqjWxqX6zt6ZaWTDzv7xQ1bU8Rcs0LS3HgyAcK50Xm9WuwOjj+HeyyYa84jaA
	sMIOMIGPRxh86rR6ekwxIeOJcldo53NXqg==
X-Google-Smtp-Source: AGHT+IGdL77URRUUDel/620o0E15cA6VUq4GPfffaHhqeuBMk65coFdHp1nDn5rm38NPj5m5jvSG6g==
X-Received: by 2002:a05:600c:1d1f:b0:434:f0df:9f6 with SMTP id 5b1f17b1804b1-4364767f087mr28742535e9.3.1734428448580;
        Tue, 17 Dec 2024 01:40:48 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559ec46sm167475755e9.20.2024.12.17.01.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 01:40:48 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 17 Dec 2024 09:40:22 +0000
Subject: [PATCH v5 3/3] MAINTAINERS: add entry for Samsung Exynos mailbox
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-acpm-v4-upstream-mbox-v5-3-cd1d3951fe84@linaro.org>
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
In-Reply-To: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734428445; l=1216;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=9mXBYawofpPepE2BF91P/arRig7nezklsaAdla8ShbI=;
 b=Z0AXVvEDLX3dGQQUU6S7FG2YiVuEm8f4RKNyhHzyRa5O41uaawalfgmZW9iW5t8kzyPwvDlhN
 g3py0lZDyAoDARc+CygZuhG7TGX1DhEtmkfDDEsBIZmbJzbmsW3NitI
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_014049_878827_30BAD3DB 
X-CRM114-Status: UNSURE (   9.33  )
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

Add entry for the Samsung Exynos mailbox driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index baf0eeb9a355..6bef5fc5e4ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3023,6 +3023,7 @@ F:	drivers/*/*s3c24*
 F:	drivers/*/*s3c64xx*
 F:	drivers/*/*s5pv210*
 F:	drivers/clocksource/samsung_pwm_timer.c
+F:	drivers/mailbox/exynos-mailbox.c
 F:	drivers/memory/samsung/
 F:	drivers/pwm/pwm-samsung.c
 F:	drivers/soc/samsung/
@@ -20717,6 +20718,15 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h
 
+SAMSUNG EXYNOS MAILBOX DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
+F:	drivers/mailbox/exynos-mailbox.c
+F:	include/dt-bindings/mailbox/google,gs101.h
+
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-crypto@vger.kernel.org

-- 
2.47.1.613.gc27f4b7a9f-goog


