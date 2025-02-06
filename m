Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC1AC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 13:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDAg+ppQjoLROQ6tgZmSgyH+iG6RB5+F1jMAwfLcm78=; b=zd6eTdkEdfdlAMl3Ow08/rULyM
	nuMJqVgMgbosRKIlDmfbr5P7LY9eaeSFTARdgcp/0NyRIKlSAvedCRLBxFQ5YupMgF4Y7s78wCU5l
	gKHZq0odvGZa94uWeHKGiFNSh759c5iQJdYSu+etnkMH5/n8MD5Lmi6BPHb7iu0BhvOPipDz/h6kf
	gO2UjGfVZ7bvAFd360GcPYUbXLFQBaaIwPQlSqm8JaFHCXOIiEKCWxr+iGZ/Nt54o8gRAMa0zq3rJ
	pmguyM6gZb2QrJ7YqzMRBE6IDeJZS/5YKCxZfKxOwiuCdgnulaV5n65UdayaNmCvHfXX9Ic2hAPFh
	jW+68I+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1gp-00000006N1D-1ZDU;
	Thu, 06 Feb 2025 13:13:07 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1cE-00000006Lzt-0daY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 13:08:23 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5de3c29ebaeso75485a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 05:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738847300; x=1739452100; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDAg+ppQjoLROQ6tgZmSgyH+iG6RB5+F1jMAwfLcm78=;
        b=UguGZFtwri+s+ttT5XxUUdCbk79CvFh6Vh93s2y13yeevqjuyFow3T7h0ApXbevQy3
         E3taQMshOK88GkhuK6FERtHovyhfGw2fHjFcXqSwSezgzgdQ+8TDbuqJ/wsIceXJEgEW
         j9b509IHah8N24f86D2NRUENzVtYFkl41W0o0TP90bd52LSMY4Na8Xm3TETB1Fl8zzXE
         jWYDNw/Q5Pln+CLJHwOwWJ/IzeK0FOFW/yfm4cMv2dUVN8ASu0QSoukyO2tDrFvxR1BS
         gp+9baNdxfl6LPDMG5g+DjO9CP5VkpEBFJ+RhtrfsxPpaHRcG5qWD/0YmOqSvpQD0usM
         ZKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847300; x=1739452100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDAg+ppQjoLROQ6tgZmSgyH+iG6RB5+F1jMAwfLcm78=;
        b=hV5q0P2MDZr70hTHrIfjY8cEHdynut5vIRUUPjXlKhi/EYUigU4t3nIzi/BEEnLZiT
         nwA+LmdFmJ+HUOxfZdu/U6AegxJDb7PzruXly5yustBj8iDH5jPe8eeY//P2cpCPygyH
         Z3eckSG9q2FkybwoO9gHNqCuzbj0t45TyzfDnNmjItgYajwVo1lTEZqZz5xqgqe2O12E
         yrbAA6VtQOgXy/AoPDXyvUIj8T0RnIqEQdEUEP5S4nYZCFcaQFONrpKN99Me/cLbkkI+
         dEQmJEjvTGxTYap5op9Wb2Xf3GgUrKJt6aUixmrNf4H5gQw2+ooyt2bOOvBX7EUNtv8f
         Z53g==
X-Forwarded-Encrypted: i=1; AJvYcCVqZFkw4xG1Uis1z9Mfz22V9C22Zvknk0ON7Wdku3Mjz5fBqDJOWSLIIcfuctty0vaXUFzTHHCuEa+85LEjaBv7@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf5+fMVcxT60BjH3yCJ7rZ2SfswJuTCeiI8mS4rNCNYHo/ZGQ0
	vS5AE6SRheYuO5Hm9RHTq/Xnfbf+IqhZWmYsnB8jyvq4V3nPNE5NE2OKl9+sAtY=
X-Gm-Gg: ASbGncupt8EzRGVWrJsXyIKJRPw7eNUDkCg5o3fSquCWHvzCKbi9IAYSbVhuSBdgCnL
	ZuWpSWUlsS+vAA7RAZ0o53AU2/QENFddHpzzzXdWAvD5LZPAaczf7/EdxZlSqjbCyvrOdMUDUcQ
	VQSZOXAb1leOC+ttjrfnD8QNp8yzms+9Mpat6fSqQlWYMPfvqELak7+XIL8kxZgQtmAy24EmONs
	Vnp3ivYh4gzUYw08gTO4I9GrqbKaIKw4yu0zJxXfNTTN0S5vk0c/mT7R+j8loMEIy8eWHm0eFED
	Elm4n5fKD6ACUZynbRo2HsoxsglODp2+S1T1xgnmu/ZNaXBBYLmCjjmShgy8zuk9sQ4X9h5Rpuo
	=
X-Google-Smtp-Source: AGHT+IFTAdVpqgZ0wqgMByKwDevPfkkbqJL1+kBcqsh/Cv6cjwQ8nQLxo1utspkD+w2738TsWHLVKA==
X-Received: by 2002:a05:6402:520d:b0:5dc:d34f:a315 with SMTP id 4fb4d7f45d1cf-5dcdb729597mr7450061a12.15.1738847300001;
        Thu, 06 Feb 2025 05:08:20 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b73f8csm830235a12.8.2025.02.06.05.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:08:19 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 06 Feb 2025 13:08:18 +0000
Subject: [PATCH 1/3] arm64: dts: exynos: gs101: drop explicit regmap from
 reboot nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250206-gs101-renppt-dts-v1-1-cdfe993fb3c5@linaro.org>
References: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org>
In-Reply-To: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_050822_189230_CA8D89C7 
X-CRM114-Status: GOOD (  10.91  )
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

The regmap property for syscon-poweroff and syscon-reboot is unneeded
here because the poweroff and reboot nodes are children of syscon
already. It also is deprecated.

We can just drop it to simplify the DT.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 813f96089578..e78dcd506a5c 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1400,14 +1400,12 @@ pmu_system_controller: system-controller@17460000 {
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
-				regmap = <&pmu_system_controller>;
 				offset = <0x3e9c>; /* PAD_CTRL_PWR_HOLD */
 				mask = <0x100>; /* reset value */
 			};
 
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
-				regmap = <&pmu_system_controller>;
 				offset = <0x3a00>; /* SYSTEM_CONFIGURATION */
 				mask = <0x2>; /* SWRESET_SYSTEM */
 				value = <0x2>; /* reset value */

-- 
2.48.1.362.g079036d154-goog


