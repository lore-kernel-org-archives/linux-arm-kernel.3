Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67597FF887E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 01:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYtiwDmtrVbl/hGmqfQch4eP6KggQ9xHSeI/NuJ3fwM=; b=js/E3xnupUFH3DDs5n+6ryEF2t
	xCZQX0qXuiu8K9FRlLa2iqD5945mTCEiq4KP5u8Fqm59cn7klSKc0ITfcX6wb0PQeo4TgTuaQtOLr
	UHMF5iJo1QVIbMctA+OiZRI6G6j640nH8tVzaRvDllrLCkmzmUWr+ajiaVY3v+gOKsm92Gywu3hLW
	AGXQnRbjrLFAbr4hIdhjJhUYUu8eYfMpDjO4eD0/vmTQdW1Sxu0UH+I0tn4patfFcPEiOVkNpVnBs
	mkQyakn+tsmZWakCTdePctkF72FI11Jyb5v/hOa9DL5Zbh7/K85Z+a6sJU++SY3JghTbXxiRIdHbv
	eZSt4pLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGeK-00000004OsB-3sFQ;
	Thu, 30 Apr 2026 01:57:08 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGeG-00000004Oob-3Uux
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 01:57:06 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so346678f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 18:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777514223; x=1778119023; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYtiwDmtrVbl/hGmqfQch4eP6KggQ9xHSeI/NuJ3fwM=;
        b=pwIz4VZhL/Pr5awLfj0bZe1AHVqkAxATmS+nr23SsVCt7H9zMb4Fk7hR1sU+EBl2xq
         zPTtLb1ioKNgWfvh9dpjxk8YSdhnHND2upLsYv5Ecxk+bqx6IVZiQ3oNr2wI8Tru6LdO
         bQbIk1xWPUev12JI+wTf5E1NC57PGNhxEotYVrlzG4CdfiGZOi4+j16jFV8yJesIpF+r
         DndRk9tL1F7y+MbNzfKJMvLhGsCLKrTsd/Lp9pcd01DPXkdRZtulU9v8UaM+v6N7cVvZ
         FA3/QpwBZgZ7hhyak92dUH+5EJuChTxzIgG34A44OdPndPkHI4tK0nimB3UtTaHaKdGn
         ID7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777514223; x=1778119023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fYtiwDmtrVbl/hGmqfQch4eP6KggQ9xHSeI/NuJ3fwM=;
        b=oRwJyiIpfKhQ5Ufj34048csOLmRrL7gnvezpUWvuEPbtf9bfe88U9LWxh3ihAVpLGA
         tlU9eOsvK5k6HybdJEtFGAF9DCuswz66IXP9ScTzkhE4Jg8Q/UDB7ryG9/XCSeoUC+Nq
         bfVEKDoZS36KE2kn7HmH/hr4lmgtkox8qor4oFGCgQiDuA2KWW0QNNTwIYjnq78nMeGx
         7z7ply51Sa6rX9y3VY04s8d9refDNiV/m6T/vC6pKvA72mmtsjPvUoNiBR9VRUltHDbZ
         y7SAtzEZHK4SVCce0WE8MsUiVOEWKsENsEn6bZ6n8aJTG5ZyNVQELoV3fbZftVnxBkHq
         BaOw==
X-Forwarded-Encrypted: i=1; AFNElJ+kxWDrHwL1/fx7u/On5TF4/gHYUz5RK07HXddvycNV0bDej9Uyw9SzO/krUikJtAJDE2QVF6EaIdcWA71K9ky6@lists.infradead.org
X-Gm-Message-State: AOJu0YyOeDwKzA03o70jAbQWwK8S5yn4h2HGm7LWqS3AC3cXM5X/Ttim
	wyozE3P5ieD0DTJw/hQv+HiOQyL+rrWrSq2z8AlbIKHMSNvKaTR8wjq6N7Sr4zlvXzsiQ05KVWm
	HbU+ytGk=
X-Gm-Gg: AeBDietVoiH5p86Gl7FPnBt9u64Ir9wfvjswLnOQrMcnyPME3YJJ2w7yf82yMwRYTEa
	7nCa12Up58dc+v9/D3VFY+5t/W/Yb8PUf9uSE+2Knel5R10/7tjtru7yKddWs9i9+yJWEtj3bJN
	6UTvgZc2AB/peZYvSCCBVrjfikSnRHHe+Pdz0w7VgtfVJAd96ayvI264kyNOWp8mAHep38o0MTa
	60ZRx1QXj1iNk8HFVGDUNIxI73wAiH0llzj+JKEPVthYjpQTCpJCTTDF0q/OFkI2g7qBde4v06o
	k6DpA/NMjzo9hdAnyR0nkl2RC+QISRNsTXlKYwOgfIhCpWRtHgC4reSUyJ2vEXp32lOjV5JVkoZ
	44+FMAQxPBosTiQKxXy4GuK6Jhc/KMfL5gQUGs2j8hfeu7muoiEjcTj5gidWmwuRwHmQjgbl+Xh
	x71jFwgc3Sx6KFC98T/lM+4u2tfpYIdHMGSPZxm7OgyQH8diVccrrOBBbG0mauEkV2leD/f4k17
	mnZwucF8sKZbYgEQBoQa6EW37Q=
X-Received: by 2002:a05:6000:178e:b0:43f:e934:50ac with SMTP id ffacd0b85a97d-4493d7f9979mr1191141f8f.7.1777514222943;
        Wed, 29 Apr 2026 18:57:02 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5bf2sm9915013f8f.27.2026.04.29.18.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 18:57:01 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 30 Apr 2026 02:56:55 +0100
Subject: [PATCH v3 5/6] MAINTAINERS: add Exynos850 PMU entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-exynos850-cpuhotplug-v3-5-fd6251d02a17@linaro.org>
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_185704_894111_4A48EF1B 
X-CRM114-Status: UNSURE (   9.11  )
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

Add Exynos850 PMU entry describing new file
drivers/soc/samsung/exynos850-pmu.c.
Add myself as M there since I contributed Exynos850
PMU support and intend to maintain that.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 498ca30a00c5..60c25fed8ffa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23645,6 +23645,13 @@ F:	arch/arm64/boot/dts/exynos/exynos2200*
 F:	drivers/clk/samsung/clk-exynos2200.c
 F:	include/dt-bindings/clock/samsung,exynos2200-cmu.h
 
+SAMSUNG EXYNOS850 PMU SUPPORT
+M:	Alexey Klimov <alexey.klimov@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	drivers/soc/samsung/exynos850-pmu.c
+
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.51.0


