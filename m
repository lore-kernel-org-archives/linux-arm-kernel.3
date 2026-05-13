Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8B5CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 12:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYtiwDmtrVbl/hGmqfQch4eP6KggQ9xHSeI/NuJ3fwM=; b=r67l0Ax3tiI18DWX0zia14hNAF
	ndJ9PDpGR3KiL/iMpnZcs0ZpaYin9KBm1qLDiqhLhOiak+m7sKJrHw+s5foza/LSJeR3AZtgGyXT0
	CRfQP6H6BPnmEL4OVG4JIPshuMsCWFWGpedQNyzilJze359mbcj4Tg47bJ16GuHU8r651enQPe/0R
	+mvvB7V/5lZY9VKZh0bpx1y8OboSpkg4tgJ5f2rjwzxX2/L1I9+cxh0jQJBcYctoDcsYdzxGSCucY
	oBnFKXWIi9u3ojo7G1d4i1GE86X6Q338SIUA5ZHLim1pVoppuHSlJgVHcQ9259UZqUa31KUpDkyre
	Ub/vJ/DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8q9-00000002Vnr-0ceG;
	Wed, 13 May 2026 12:37:29 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8q4-00000002VgS-0hVC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 12:37:25 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-44509921fbcso3417218f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 05:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675842; x=1779280642; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYtiwDmtrVbl/hGmqfQch4eP6KggQ9xHSeI/NuJ3fwM=;
        b=Ekcl5csrAQZQZ/2XNgQLO9zDPwpD5OXqLnOf4BtghI9x6asl35Vc1eUcBT112Tf58d
         yiXQtNSrwpbhxr6f8NuQAZc++rRham0I9VyPguCaw8UkhB8xLad4qrmYIgcJI45A4RMF
         uNezvOBDB43KLvo1rEW7EygKO/rTyvJIGKg8edFndkrwNu3XtcU15Fa4uzCe0V0hDxoT
         vvWUa5R+BZuN4sQBJ3s9CfGsIgOn8FBSdjR7u4F9erhfw1pDPLO8oZ9lCoNu7Dnx8qkD
         IaFIttJAVvTnDHYeiAAFHcBCGL3PgmvdRyqDLa/wS6hU5lkHddHADJ/aGXpk+NCmd5N1
         gT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675842; x=1779280642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fYtiwDmtrVbl/hGmqfQch4eP6KggQ9xHSeI/NuJ3fwM=;
        b=ddT25MknGE4FQaPaxOV0qUsmZiwsdb18Q8fueSMqb4qum0LHkwgyYONLw3rkfPIHPh
         nS0RaZS6fs0IwLrlcFcJZZ1lFNLImnhPLyYZj1PN4EObqVmaNMiS0KimaxAHx9uZljH2
         25GiuNOQIrXXyyyA0rnPeFULC/cbMPOXLvGGJ1v/+Z7Kl6UX8gElGBoQkcdctSjMWQ+1
         fPILzDN6bznc0k8wXTmbOny4YTHCTVtBX0I9FSVhq0a32AjFggUJXGOIwScNaprSV9YP
         PTaQIzoG09HcyLAu9dcZlTP448mVVSPVvYro0nj02vB0hbabATQjFqjKr0ONxo9qeOP+
         wqIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3gp5HaO4WBBI2QcGcl7CwhIPivR7vcHhQmTSwuQa2IpgyKTowcfTZvd6wBv/ivWGOXYwt4BvN99dz9VeMk0vN@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9NZdnvVG1FHmhLQhtr1aDaJ22QYhfHgDKTh4o4vsUKWdN6umK
	kTxHrHHDL75yd92Ld8BqZDQMa5pwc8qG8+PMwKOgS/ctj9B1VJFNnP3lQH9yXr3ZoFt0/DP0TCb
	OHCE11bc=
X-Gm-Gg: Acq92OHVh0YCDIIkUJH/XUdxe6kRIndLMh6UZrgl9f0+urpVo24DJKMMWX7t0aUxUVl
	lbimCWihp2nNyTv6uzsMWCXq5zJaDXobn5A+bvmZJ/43rGfo+Xqtad/so0gLlZbmShTknO1iNot
	g+zf9Hb9zX+oPNqjEOGailc2zJYos505PeQmQeAxgJHMrFUMW7Px21CKgyRzCw7rpZcfk9gyhww
	vaNhEHouv3LmARQgV8wGKq61BSTAKH+fmlR0c1ULFVDl9F2nPQJaHIWBNKWA+Gi7oVHpAY3qlVB
	A+bTbG7jhYoB4EX+Na25YMNDaVxy8x+VdEGbk/jOeLcWALAYvzgQ5b6pauxI7H93iaUH7cbKU7o
	66srny5CAY4plOn62ttGHOA6aqY4Ewrx6bz+UZNWKFPmW5p4vAW+0GGstKUSBsjNnqCbMibWJiz
	BWXDO83AuX7k4nP/a94oZvRMJYi9qwvEbP+gztcBpvA3iXOpXhpThjMCmKY7RX3KUAhHKra/u6W
	3M8xgZjkR+3p82e
X-Received: by 2002:a5d:5f90:0:b0:43f:e94a:e773 with SMTP id ffacd0b85a97d-45c79f297e9mr4410874f8f.27.1778675842151;
        Wed, 13 May 2026 05:37:22 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e4bb87bsm38899725f8f.2.2026.05.13.05.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:21 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 13 May 2026 13:37:17 +0100
Subject: [PATCH v4 5/6] MAINTAINERS: add Exynos850 PMU entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-exynos850-cpuhotplug-v4-5-54fec5f65362@linaro.org>
References: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
In-Reply-To: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_053724_259579_9F6BF97E 
X-CRM114-Status: UNSURE (   8.85  )
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


