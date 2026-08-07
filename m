Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF89FC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LC4v35vhZtMejQWnehiMNguB6SbMB/Zs6JddkjPBTUQ=; b=FRKV9QaYIeOR6iIvisKyY54aFB
	BXidnlQdSQUzj97zp7+329a8J9DKqW1Ku4N/Mfu08HXkx4OKgXM2VaeEMqFZ47rFf63aywbW6FUsF
	dIiSw87tF4SCpFUbYGvWQk2yOUK9wCKm7bz5AI9ZA0IFOELwx3YqmCfEJEO6s1drNQmK7Zhb0U5zm
	VXkRj/W2zBeSA3H5UmaQTleJfnGyACmXCXYbJlNKmv6Dz5nUg1sBMiXu4zrEtAs5bnoxaMkzudIcI
	+GylfWxaS+PfRS3z+NRelAnsMPgzQaSLIWZSrBLbO8QA2vqwLCKzULVxEqqnrIsqul8elbmRF/OhU
	9ytLvC6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFZx-00000007KJH-35MJ;
	Fri, 07 Aug 2026 08:05:21 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFZv-00000007KIq-1vFt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:05:20 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cfff5f88dbso44886105ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 01:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786089918; x=1786694718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LC4v35vhZtMejQWnehiMNguB6SbMB/Zs6JddkjPBTUQ=;
        b=IHJqnmhsOL9Rz9ZwOuJWwJWGum13QY/qpbRvN8aCVYptDGqO3xyOf8BEXZfxuPjhOo
         7+VOGnwJ/1YiJWZQCgOKsebNBEt4H0KfcjPmIMLmrTJULkchywWQWB82jmv+/gEsSEAz
         VvBCiV9Z496KopWH6qzl8xTfUOu5G3LCvhPIwfXLKf1GleQMJ+6ieseBBC0dBHFzSoh/
         OKiIUMeSzRSUxIwWEQiXywZdpTRs3FplqFrQrkCZSU7jgHXcRdngQ+SKhC8ofmSQAeQ/
         7pH0+HYAlOc0+D4F5H+e/n3O1ogPl4PmbUjzCJZ3beGe7KtxwrWccF+1Tdd7UJsZcBji
         m05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786089918; x=1786694718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LC4v35vhZtMejQWnehiMNguB6SbMB/Zs6JddkjPBTUQ=;
        b=DvZJ5isDeLy/gF+ohcO/uS01tng5Gj1VlMO2vugGmhAFfGGS0PvYNRrEfhXgUC7WI1
         hI3iFW0gmLEAhxwMHKN8LIF105bdlSrxgQDvT0+0J6ASI6mXNIhePHRAQPCMZBexj7IS
         A/QsmW/bQVdMQHOX6CnjLEcXYZ9RFpV9rjYZhJJLdUgS7oWy+mXRwKwDlCW/AMXaK7b8
         frZ4SKV7qpDoHrzPGzgstGI/ENAiVwct7Po7K8edYUMCiXOCHPkvmolwRQoit5vz1xQB
         qvauyKZ61kui9GFTTO466BkCg9kOUJ8gTV9MOLDuiXu7NzH6yslVQV4KysV3ma2aO275
         zTXg==
X-Forwarded-Encrypted: i=1; AHgh+RqB9yShTzwL7kuEXuePEglpdWBL+uN7YwU7diYqwRD4ixcHt5NnloAvGwVGtnTHhOqUtYxN/7D/IDE0UKhwpI7o@lists.infradead.org
X-Gm-Message-State: AOJu0YyMUDIPCIaL8TtUnzuKzi+2FU2cNrOReGgiisOyAtgsMMxralOV
	KnHO0BEXqrvEY6GQrwvn0hx2WU0nRYJkjUFK1UADy1MSzWK0thGn8Rka
X-Gm-Gg: AR+sD10Lng1WJHLPiFfmSaGeaYTqZhGeMOpKFKkPbC686TDRiYrr+EaqGXAdn7PoeuQ
	ZM+KLo97p7jbTOcGllMoE1qvGpAzmhP9s6usQNqnaxL7wzxBCOu9Q2fZq4JvpC0CXcrmxkatO+K
	AQ9UT2kcxya1IctwaYjkTz96gfm6NeitOkCSn9QsDo3acEQHZpVntDEga+JmhyuLS2J5lFcSBL2
	XdOZTLywncrf7nwz5MaxJHAaEg3A8baOxe/kvnnP70ChOZtpv2mJ0/qi1OpL1BWnZmeoPUxfWKA
	Ir1Fvm6uLPJlzGvNRJiq2bdLPki1+DcVu+52BgPSXAe4ge9/H2tkXg4MY7PSy1A58aBlTcON3mq
	gT68txgudMq/1w9h6HVgrbxO1dpiQFNQ5mN5nrPhnFukCNdnSlkOrcOih0zsrCddwKbfge7BkY1
	lHA6tkCzTfHPmGKiPjxawJcmR6Ay84FgZOMnuAfnhb0vPLx+5Vz0nLbceqbDeVnVmVmgbYgG3k8
	XeqTK653Tu2xHg8c2ZVKuZ2/jzcHK383PP9i4N4RHHSJ+nfSqF+8VslrAn4TayHT7BxAwKYI9kM
	V77D
X-Received: by 2002:a17:902:eccc:b0:2ca:481:de45 with SMTP id d9443c01a7336-2d0ca71b437mr210831635ad.6.1786089918382;
        Fri, 07 Aug 2026 01:05:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c4a773esm5055305ad.65.2026.08.07.01.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:05:17 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/2] watchdog: orion_wdt: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 15:04:46 +0700
Message-ID: <20260807080447.35479-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_010519_500371_484FC81F 
X-CRM114-Status: GOOD (  13.44  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v1:
https://lore.kernel.org/all/20260806062812.26523-1-phucduc.bui@gmail.com/
Changes in v2:
 - Update the commit message and error handling.
 - Propagate all errors from platform_get_irq_optional() except -ENXIO,
   instead of only handling -EPROBE_DEFER.

 drivers/watchdog/orion_wdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
index 0e145f762f6f..f79a14c4e222 100644
--- a/drivers/watchdog/orion_wdt.c
+++ b/drivers/watchdog/orion_wdt.c
@@ -606,6 +606,8 @@ static int orion_wdt_probe(struct platform_device *pdev)
 
 	/* Request the IRQ only after the watchdog is disabled */
 	irq = platform_get_irq_optional(pdev, 0);
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
 	if (irq > 0) {
 		/*
 		 * Not all supported platforms specify an interrupt for the
-- 
2.43.0


