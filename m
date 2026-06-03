Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271BDCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sk5k1GMtYr/HULN9/BDkc9qWrRFDftSIlp3dBX3ccaI=; b=XgeNhgzfrF4hUBbZo9cNC4oC2e
	meo5ABlaPL6693ydQNGorCz7kcRHnU+PEs13iaPz/jtzMT39mQuDcTgKUOi3qfrR9A7iY6Mt6gkrI
	sHpOQyUmwmmoi13K0vDpVJimG2QhqbBY/bUo/pi/c3OI0QBKlyfBQrpHqIWnqriaopqhfHr3br5G/
	6DRzhJnr7C6iM0RGiUrijPVDSwTrdDr9wyUOP2vOJs5BRVxmeGc8DRDsZ2OqyiTp9ppIH1DaEJDM6
	Os8oZB0mkN42rf//Cl1VdJ1dDitLfaOfUQ1M2gWFUSF5MgKbo/MlP4Op/FKRDaM+vwotwn7hDAKNi
	N8BSCMng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlCs-0000000F6Uw-2nJ5;
	Wed, 03 Jun 2026 13:00:26 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlCo-0000000F6SC-0ho4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:00:23 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso115558705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780491620; x=1781096420; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sk5k1GMtYr/HULN9/BDkc9qWrRFDftSIlp3dBX3ccaI=;
        b=UrTnGyjrdn/4dFn2Nh95Kn7e/Y9uvTI3VbJVTIZ29t6eZbx5A+g0n5IQYz3HNPNUCX
         7Z3ZVwb/VaqD6lDoGKnsuauxJSKRAUISGoqKeoMokK68zb1k7dw3m0/8xfkOpk+L3Dk2
         Xc1UueX+B2MsQQfLhERjd1wQz5S8Cb0agNEGjhOfQRtDcRLtpHh/5avhUepHKZrAMeEp
         jopAcRlJqWINnyi7ptjy8tcReaIZMah7+v8V4L5MfK0rD27QKlUNNekcwBVqnBFQP7pB
         g5vzv7bpwb1En052+hzL+5Jb04UttvB0f5v81XJKEbWVZ9NrlM0k85oYSSFNuNejSrmg
         r+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491620; x=1781096420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sk5k1GMtYr/HULN9/BDkc9qWrRFDftSIlp3dBX3ccaI=;
        b=MJ5cc6EQ/M0grWo0VgheQGMM6S/W0ont++vuUWJvv7juEWXdtuu2JLXulcHVWopjWc
         2b9LMrSIhoORjkwJL3u2mqYlzL5IpO2jatSj98+bx4pjiD2FevJ+T/Du4XhCZNjWJkm0
         RUR9Qw+LYpzYct1tWqa6ukC9L/h77wf3MsGb6E1CDuUD2/D8Mbdu1Gq6H/B6u4oUUYCh
         aZdAL5mZcRbcViPFIqBQ6Bk0OVQGyIPd3scBOvWt1RE1NCaS/aXzyonluZ+GggVIwC1s
         F1NdBPFZw6/Nse9dlzay/2ivAcZqjdVyMrr1sbP7nDYBkc5deX0E1vuffOdxVtYfMEff
         FL/w==
X-Forwarded-Encrypted: i=1; AFNElJ9lMYH5A/l/Ci3J83YhY4vTS2CK8EkgbJDW4jdKPCemBu2+/Mzj0kbMBoZ2+WnzGVwE5xHsqvbl30DfNxnR4eFm@lists.infradead.org
X-Gm-Message-State: AOJu0YxylVgeRKZkk+RMv4kTuOvHoG4mPaxOLWq9tQRhww86gk1M6nxW
	Ruc0xrGfu9hN+Thh1b5CxSBui4CtHlAcGYbTLbiWKoUw/D7iycbeB0PPp0fTbl0f3dE=
X-Gm-Gg: Acq92OEiTILJbVTL8dGbsiZRL/KXGOCErHB9DuWxTtw/fNmekE4Upu+FFu3CW6rPffU
	BQdEWZCXbNzUiKGC0AGfdkx7km2y4LcOtCGRVIU4zVlBJ42viQpSA14yLFImHivv3A2ebgLu+/R
	HlYkAkClxB6QQpXO6aqJaiPdsU1qIlU9aADNcQ5ZvhPu9q/JVXq8D9PYybkumSkcjZBuTU4KQsR
	CfVvdsySFrFGiYqBph8Sm55efEWYN0FumF/phkX4BFH/tiCwj6488qV+4JkC19adSDvozQP57Xb
	oy47gUo5RgVvwiq+GZYeOq9XL/NTxtcjjb9jbzk698YT8URNuMjqBBMSeCqCcR4pZRBQ1pPSUhU
	Q0UgfIF9DtuFnGtg4G38CtuPKgZx3b6mn2oRsoJZN7dknrfE24mCC7wob66H4QURuEg21w/O0rR
	ksVBPTQfvt5VJe6isef56ngtNz7LfMBAQHnV8MU4fDzr8kPZKulbqxaEAFp7YviooLkyResJdby
	cJ5OPfInooS8GA=
X-Received: by 2002:a05:600c:35ca:b0:490:5527:3be2 with SMTP id 5b1f17b1804b1-490b60e3d76mr59120555e9.32.1780491620405;
        Wed, 03 Jun 2026 06:00:20 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e88fdesm149179045e9.14.2026.06.03.06.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:00:19 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 03 Jun 2026 13:00:18 +0000
Subject: [PATCH v8 3/5] MAINTAINERS: Add entry for Samsung Exynos ACPM
 thermal driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-acpm-tmu-v8-3-0f1810a356e6@linaro.org>
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780491617; l=989;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=BuCPimd0wnIGZnAHNo8kq3fbLznVxR/5ajKR3GVVTto=;
 b=DDZhmy4QEP4ZUJ3uSYAEbuRQYdLBa/kBCUb/9RRroulU8b4Zq9zpGbgR2jB1y/YeZYSXwq35u
 DpIMVH9L39wDoT0TXUDdgkEeWc0sFgtrSbGO061VKn883T2zS0XCYWP
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_060022_215682_79A6CDC9 
X-CRM114-Status: UNSURE (   9.98  )
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

Add a MAINTAINERS entry for the Samsung Exynos ACPM thermal driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e8218c2749b7..6a8521270daf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23661,6 +23661,14 @@ F:	drivers/clk/samsung/clk-acpm.c
 F:	drivers/firmware/samsung/exynos-acpm*
 F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
 
+SAMSUNG EXYNOS ACPM THERMAL DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
+F:	drivers/thermal/samsung/acpm-tmu.c
+
 SAMSUNG EXYNOS MAILBOX DRIVER
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.54.0.1013.g208068f2d8-goog


