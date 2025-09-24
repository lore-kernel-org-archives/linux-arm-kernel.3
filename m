Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F67CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CwSO/UStg10ejRuwvNWNvAfhFc6wI6JGB0ruZLyaCUk=; b=CWtgGZtPw8Xind6PVug0oUi+Xl
	miR07Eg8SwYjiQGSsgpYhrp/VcOFGH9F9lfqAFYhrAR+hX2sFt+oGNnyCMhTlgsdU35Y4V8Og1oq/
	80qbnmX6WbEiPwqkYer0x+M/e4rDhg/G9udYzJ+0S1Qtr57XX3oZ/XigosCKpPsef2fkrzNre9LGp
	GmUUiaMIwn0JLnukFQrCQvJAyAArQ2YFsC7a4IVDI1gjKIv6otT73cXjGO3pHgkfL+M4LU+8bDOYP
	CRQUeOldLFuWxzR3WEQ6GyfUG1nG9dxe634EhxcFGu97F1/wQ8qXW79E5gl0HqcmDyyRtzuqwa2gW
	bNe1WUtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1LND-0000000FySz-1sBH;
	Wed, 24 Sep 2025 09:01:15 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1LNA-0000000FyPs-2aDA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 09:01:14 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-46e29d65728so4305715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 02:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758704471; x=1759309271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CwSO/UStg10ejRuwvNWNvAfhFc6wI6JGB0ruZLyaCUk=;
        b=lMrFUnPpQ+qTmY9/pb409eTntFKXWlkr9fDduljtl+9wB25XwNsacKhXEUVDS2vW7x
         CzkrfqapvgIaIr8ptwiftGmGVUsltk/LZhZ4UCA9ruNj5k5Sr7DPVVCd4GxizwYCv6aO
         hxNDBe7hERN1OMpZS3iPNN9C6RdxKEKvDumIY89qHaEbQ0YpnYPe8n9tKrv7BuLZmzoG
         mzlV3h7gi/fB7S3bSeDFJmRsqzqD3jAGgD8E3vWqv/wjxuYWw81IsIRwElNQuySlYA/3
         FG3bUFY5A7T3C4q0FmbeGoqBbpWUBhlugu1hPbT8bzxFnw6M/JfrTmk45JK/dvthX8Ej
         agQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758704471; x=1759309271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CwSO/UStg10ejRuwvNWNvAfhFc6wI6JGB0ruZLyaCUk=;
        b=K4l5dQerqN/Hlg2Z4cCxBI9H4fx4y/bHVKsjQJcrf/7xJG3R+L+qzlKMse4j2fj+uF
         3WgZZe4Qp68gBf7JDBw0k6+OnxpF4+Qfkf9J89UKUCyfU0EOCYlwP+LoUwlXzw0DeC1z
         3K7qvHfgAELIz0+21y+0Q4CYe/iTf9+KZ8V2rCJ+uGcocaU6FbbCr/6p4qoafCoGw4Ng
         85K0wN2ivuO2AHA6HcLQrpYrseHN3iAk+No5ge3KlIeqQ44p4Ex7lgruQeq+L3zntrTi
         swGlhpA/m+kZVhQoul4EjT5y8T6rnHBr+8PBjgjkznnwRy+x3RfG9nPfAH4gmtqC0OVm
         l7ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE6JeC/DkbKufxHhJNUbXINNz/MmcQqveTIgJXOL18mV5J2MoyoAWb+/r3PsI9UdHSPRZw8f6oW/YyYvC0R1y5@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh5dK7LrWJUb6dZjhJ4BFm308Wba2htl6yuQ8Eeflcyz676O2r
	Ux1cKX3ZE6IJ55NpaXgG+Z1jL0phrT0oUAMLA0iHz9FUjfBq4e93OB4Q
X-Gm-Gg: ASbGnctM6dEJlS6oKzLmWrwOA+iDirmjUi17+KgzuvyxrLEuTjAsDDqUuj5BCx9X54g
	Ub861AViPtT3wrSrt/a3eGx9mzdMmnnUUNNJeiazvTMTPyZILq690jYAK8hNJ49pRG/B6yvuNp2
	gGADDw4mIoJKCrUuQKHd1aMMI/uEMjHbykNzxYIRp3B7sT8uPPLx6Co5DvyTZ0LTRBVisicJQq6
	tMk9ePjhf0k2VfGHgKBIbyLmu8L/iFaSi490EUEbAe25Krt+DZ4ip0VYxyUwRWFMv6fK7k0QV6t
	vQSRjvODPgJkaUvXR5mqTuy/4m2S8nrWbgQVVFkJSpJPaKPTTSKi94aR9Jr37DvkBiQ04HRB9HD
	rN+74cmsFB4hM9pcxFeOC/5YV6v53mcMn1UYH/XFxReWSdqkug0gHYBFTZ/YDkTTL
X-Google-Smtp-Source: AGHT+IHpzyaPnI+Zu/TvvnLw2DI9mOyp3Ft61wcigLJ89X2kylPJoZzkb59KiURiHIn9xm/HtmGg4A==
X-Received: by 2002:a05:600c:1d07:b0:46e:1a5e:211 with SMTP id 5b1f17b1804b1-46e1dab631amr46273615e9.21.1758704470581;
        Wed, 24 Sep 2025 02:01:10 -0700 (PDT)
Received: from cypher.home.roving-it.com (82-132-239-193.dab.02.net. [82.132.239.193])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-402188ef7b2sm8766512f8f.34.2025.09.24.02.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 02:01:10 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm64: dts: broadcom: bcm2712: Enable RNG
Date: Wed, 24 Sep 2025 10:01:03 +0100
Message-ID: <20250924090105.1061910-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_020112_660650_A38F3505 
X-CRM114-Status: GOOD (  11.54  )
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

The RNG is the same IP as in the bcm2711 so add the
device tree block to enable the device.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 4cd51d80d40d0..6976a88c262f4 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -226,6 +226,12 @@ system_timer: timer@7c003000 {
 			clock-frequency = <1000000>;
 		};
 
+		random: rng@7d208000 {
+			compatible = "brcm,bcm2711-rng200";
+			reg = <0x7d208000 0x28>;
+			status = "okay";
+		};
+
 		mailbox: mailbox@7c013880 {
 			compatible = "brcm,bcm2835-mbox";
 			reg = <0x7c013880 0x40>;
-- 
2.51.0


