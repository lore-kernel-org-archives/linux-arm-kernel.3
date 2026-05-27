Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF2CCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 20:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5q+7XrBx/m8kVZrsVZ4GF+b+XEuRWjJ2WtK7BZt9nOw=; b=FV5l0x17SVueiHwWvmAvnLMTjQ
	rGTMOS4ccCM7aIms4x37E/W6/k0BxROorPZ1rItfGMu2cUSr4YdidMWsTvvWEo5+Nq5Nh3Re2j1dU
	6bXyw6dm8sCiu13vF35QXnUrwGUVV7+vsg1UzpsUe7vQcbW7GaYf1IoiAEsX5/l53VOqZKEignnjp
	6qa2F3BPYFWViaaQwbIof5z9BFJ30+khiHuNPQZ/cHt9rpYyAvelhk4DYfSLkGhbc6P1xQk8ElYvn
	8DWwVPUtZZll5jN6ESuWlPumgShFcvTMBNzVpjL3AplzxKooRdN+4dyDBhU+sXMSyL0uqBK1PBYvM
	+x8xyEyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSLGP-00000004jZ2-3lOz;
	Wed, 27 May 2026 20:54:05 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSLGN-00000004jYS-2y2a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 20:54:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49042aeeb75so73428305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 13:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779915241; x=1780520041; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5q+7XrBx/m8kVZrsVZ4GF+b+XEuRWjJ2WtK7BZt9nOw=;
        b=Td+PLubnAOPkWbXIRWQLvQDR38HmJt5lR2yRLzxYxdb87JpIV+zzXxYKC+taS/P1ah
         6E4W6ME2OHuzb58sLAZ4JF2urLGKJjEfnKe7L/wTr+ktjudGQj6YLIO+1XGQr11nIz4b
         tkNGw8de7RoZO0kN8xYWN/OIU3JN61Ev6vhUwabLVEe5cxjXSpu8qSln3erDpxhE5cD/
         j1QJr7iHSIRSY/DKB47gwJJjHvM3fwkxEAIpr+535Npta8u84XKeCV0MmeJdmGlvUDdI
         F0I50hPjPRL4EM/rnN23uj0RfwIXboSsxokVDHtjAiGz5D5EdACMQ3SXCYIwimkg7yod
         jBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779915241; x=1780520041;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q+7XrBx/m8kVZrsVZ4GF+b+XEuRWjJ2WtK7BZt9nOw=;
        b=ibXyrSurF9XxGsXRcZ85QT/skL+NznUMVDat2RG62KUaJDuzzMrg2AXDjU8H32j1Yi
         jUB8hmG06+D5wqdQEMdypP9udKsCgf5n35Y4JX0/PKhL+nLvXrCiZU6rR1tzP1hv6A2x
         MVeWQGrt57mDRvmqAihFTp9FXhKtz2Y96+8Gsayud8v6Plb7y1WwYZk7m4Ao2Teh2Fna
         LofbZi/IsikaY8W7kU2sL2D6dtW4EYFVKTUu2D2/MWZdMXeLePGjIgbsjyonrwaBnzBA
         1cWdmvgsEvLk8ihs7BZNrak+v/04OgyShfAOTtZX3vEm+EzGU+GWjgvfWtSn2e5SwFvq
         tOUw==
X-Forwarded-Encrypted: i=1; AFNElJ+obg6093YsaFZjJbjm10UguZgqIYuM0Oza6mvV+kviYZRGktk3QNfmcu7Nq/esNbELX277oMbo4zAkey3ZWvkZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzAtWYTODjYM2uopQm597hlNMJmpsE530rUYtwnK7KI5lA+Vbyf
	2JQn/HncqvRsVzjPzIgAd9khjipDEhrtcAZeIuWCIBQClCCMXtjiLsPvj65nR7Hh9/M=
X-Gm-Gg: Acq92OHIPCzg8xZPWJ0nqehAAo+LdLGNyrH2qFpDHbFKdyTiVWACSON1Uxr8hKM2+DC
	pkvf5/SozsAaB0yIc68SS10l3b1EZf8iRqZ+btxpNd40ifrWqrYCC7e+zug5zP2ziKQtX/lW4KP
	297Xh79nQ2o68Zxg6YRNVNGbJMwnNg1Ikf/8tINwSfsMRqHvC4IDFApJFhsyA/Uat3RpDVaTuWs
	R1DoMi+mlPxTy/WwovnxUJxWgJ+NFLk064NTOZPOZkXzJDMd7rVtsrSX1wkzeOxm9Ab3YTFGWk4
	ksGbzcREHCbFOpIxSTM2AA6KwX0Ij8FWD6tef1klLj/R19tZsZIYiGTGe5rUYkRmwrN07jP1+m0
	PL8MN1bOKPZJIbgQuqmjJhSLpPN+SXPXKyYA4C8HiurlboV7t2i4SYAuVcY95btou/QDnynOPn0
	BvlgfTwT8XPKKbhnmhZVrDzJp7ox3dqnOSFsk9eN0dB0vgJvTzwcQ2HmvJ/DJcrIHxNUoMdbKfp
	1btFg==
X-Received: by 2002:a05:600c:530c:b0:490:5527:3be2 with SMTP id 5b1f17b1804b1-49055273be6mr321464225e9.32.1779915241624;
        Wed, 27 May 2026 13:54:01 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3124:1301:985d:3d5a:fde7:e337])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908b59c53asm3024955e9.6.2026.05.27.13.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 13:54:00 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 27 May 2026 21:53:52 +0100
Subject: [PATCH] MAINTAINERS: add myself as a co-maintainer for Samsung SoC
 clock drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-samsung-clk-maintainer-v1-1-97b179224ca5@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOBZF2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyNz3eLE3OLSvHTd5Jxs3dzEzLwSIE4t0jW2NE42N0lNAyqyUAJqLih
 KTcusABscHVtbCwB48J2uaAAAAA==
X-Change-ID: 20260527-samsung-clk-maintainer-393c74ef6058
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1041;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=36umg5EeReN0uvdh1jKJQm889m98jMU479H9iaXautc=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqF1nnvkAYqCzNZ58ckx4fYSHxq75Tk+BDT2Ykh
 X7oy8vJJA6JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCahdZ5wAKCRDO6LjWAjRy
 ukWID/4lo4SJ+sJ9lnrgiVupYXQ1Zh7MjU4oq3Ma56XYd5QQrlcj1SWca6xDc3OkhrX4dbdrQfV
 0IsqNstUuAirPoqbzZxwM2Ul9xZkMlJtHyBNEgndBlLXFfVwE4SBWaI/YxrhDiPX3v3iSfrWwJD
 5VPm/xdF4bCjX54NfMAc4zP7phuOX0wwVDJNVlv/vEYfZRASXo+bneI4iLu/T3bdsN6tRUx9G3t
 7+EmrqAB1MeNuOIRCYyjEurhj7aq0a14VpuSW8n74eST3LvjG7V8fBNW/c42L5sZe5Ef7ydx5pQ
 xKtqbwQ2nFIxdnR/tP1KsCLr9+TYFIO9kuFAGJEpZp5vVRgibODht1jvI13x+vx6iBry+Htqg2Z
 qLEkUskuxU85KMnh3C+6VtbLAOZYOqgrRAUWUljmny0sp5W+g80vHMOwAv3qO+omO5Ys51lYW8V
 8oY5d8pf9LNuixO7q6q5Afke+c+khmPlLon3PdaFyBqkTPD6zGSFXoPKPuMn1FZFFNual11Bl1P
 J5knSNYiKqzDGLshRO1edACS4VBz8GtDISbOj3QJp1Mjdq3J1UIixqA/O7hNTjMgLOIMHMMJSAf
 77hzx0cJm8ycY6MpgQB52sbaUMD1UbUOSy3HP1yYWLOuRkfFFD9RYWzNOLjR5du5chyLlEE/k6C
 /TDN90W5JQaIzBQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_135403_775926_E8A18EC8 
X-CRM114-Status: GOOD (  11.39  )
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

As Google Tensor gs101 is based off a Samsung Exynos design I've been
working on the Samsung SoC clock drivers and have an interest in helping
maintain this code in the kernel.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
This follows discussions with Krzysztof about expanding the Samsung SoC
maintenance team in the kernel.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4087b67bbc69..9f96925273c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24055,6 +24055,7 @@ SAMSUNG SOC CLOCK DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 M:	Chanwoo Choi <cw00.choi@samsung.com>
+M:	Peter Griffin <peter.griffin@linaro.org>
 R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained

---
base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
change-id: 20260527-samsung-clk-maintainer-393c74ef6058

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


