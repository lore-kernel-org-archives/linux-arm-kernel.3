Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370CAC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r1uQiRHsShfsnhUou+7H5mwvSopx957gJ4JlVS+ceqk=; b=QZqutn+S8Q3tU+4Cpzu8N37JVA
	z4D2S915hR+J2JBMupqVzcBgWPYwUixfH1F+FILIyz3d1n3IkLbEOEWh41nDy0fqzBjyxBnmu4yCh
	ktD5GCToQHNG5irscB60Z1s37mO2JDssdZKOzoMqnNfL3E25OFhPvahU6yOlcBINhL20/T/vh7NLt
	OysOSmnSjCzf8R3VTZJTZkTiBahw7hKlfSaB7fYhV2DgxYgTmX1KcOxJqfJSQpt3J1maOrHs4Hude
	OGLuojeDt1hgXikL2pbqFtUs1M+pDxp7MNvF4T0yRJBmLdtnoyrjywMghnqzYHMjFoaN5TN+1v1df
	EsdlOikQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502b-000000098L9-31Nc;
	Wed, 16 Apr 2025 10:30:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4y5J-00000008oVY-3ex0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:25:31 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43d0782d787so46631245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 01:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791928; x=1745396728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r1uQiRHsShfsnhUou+7H5mwvSopx957gJ4JlVS+ceqk=;
        b=cqET25kQJ/xuMiq8nfnIrux5Pg4rL5qAZS0ghnYQ/qOh4LpyLAeRUO4HP/ZDb8EPm+
         44f4dzPBEmcm2ndPpH/B2vi8DhAqxO3o0m9yNRwj2KlcW+yAuoNJeEHs3VeAGyrG2e/L
         QR/HWxHkbIr4/EYmlEoAIhGpsOfsjg09sR549Nrkccy35sIuya3OjEzQGeDTxku1v121
         tEQyQuu/YaI7wMvUcbzDOj6s5CpTFGnlwga+7FZpDIR1I0iU+ZqLmijIyEgvRT/4nLM5
         /qDrNhN7JDOrZrJH9/t2QLpyqo7jFWw3EXUgKwV9jo2Qb4FmnAs6t2IAOl2L6tlErsfV
         VR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791928; x=1745396728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r1uQiRHsShfsnhUou+7H5mwvSopx957gJ4JlVS+ceqk=;
        b=pr+k2Kf3BcnWHZo5aXuqThBFD5mZieztaomFfQGQuYTPPZAb+WkjxJMvaqfHbt6u1c
         aWjwvAGqKsN4mKT1xzBSsfr76NZKAyKIPHaLZNIrd5qRxAWJssrHJMKpPd9p7FbyTnTa
         YQj16xF8l7odCCBu1+PuQWPHCFcFOC5V0REEf1/Gwi3esln/7p3MWDWA18dMdcmBQJcL
         ee5HmQxEca9b2im0doPaBtZbOOwRUQSAias6c+J2/2iwHgdXTmWnBhZbt+4kJzWfCDwb
         a3aLAlUb0rw/lORlkvukSUbX+PbSTx/yKyOwy2vjtR1J/5foXPyuT82EKomxhXO8QMK/
         F4pw==
X-Forwarded-Encrypted: i=1; AJvYcCXbLKhq+KkkRJHT8sXSv+WgBA9V8V3RrXFYlZ3i6gp1NqQArIaSPK1U8wAwKLtaREnDN9j4x3iaotPaxzjfjFn6@lists.infradead.org
X-Gm-Message-State: AOJu0YxIPtTImvLJLYtUaUUAhwdb93CBLdWoL9g8+6mSf/XrKXM97zQz
	P1bWPIG2rvP3KUfpB0XImzOQm8ZegkPMTlP430GUjPMHFJebYoGk
X-Gm-Gg: ASbGnctgRZR3Vdu3giIj09l+V8Tq8yML/KTyS3/6UwTzLU10krh/aNwXbyuvuHkCgdU
	Ss+oR5Lps8ZXglJ17fFZkByeqq7QpOTUFRQ9mFP0+yyTWbOdw3XmvLJpRoj2gLshoKLVkIqhmmz
	SEs1VSDOtFNozkPc/pFfaay5I8JH9CRIM5Bv7yP3JL0UQWZj1REIO600/zdafhrVmPe4kCIi5VS
	XOyv8fpQtxCir7SOp/Wmx55InkVpZUv4QMtMC8i8ULoHvYjd9laRjolGeI9Qq+xp17Q1Q+AqNbZ
	YGhT76ciAQPNzJfo/F2/9uA49pcj7ZK0nRC313AB6IiYK1EVlWvkKd/Yohgjw4miAcKUGpk2G+U
	ZbMQutWjIt8S4QY2Gq9+xpxMQVPZiLnJ4oFkfAVI1PPc+/f6IFtcuQ8AysQUadtRw+nt5+zN7/d
	c=
X-Google-Smtp-Source: AGHT+IHDUqi1eQx0/KeIR92bOFcE04EoiMUJKsfmo7Ud6Ppo5FhXkSTld+4PMkD4fwsF+3L01VDAWA==
X-Received: by 2002:a05:600c:6c98:b0:43d:aed:f7de with SMTP id 5b1f17b1804b1-4405d6ad29amr6520995e9.21.1744791926914;
        Wed, 16 Apr 2025 01:25:26 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39eae977fc8sm16214745f8f.48.2025.04.16.01.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:25:26 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] irqchip/irq-bcm2712-mip: Add ARCH_BCM2835 arch option
Date: Wed, 16 Apr 2025 09:25:17 +0100
Message-ID: <20250416082523.179507-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_012529_907089_C28FA6B6 
X-CRM114-Status: GOOD (  15.88  )
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

The ARCH_BCM2835 is used widely for platforms enabling
the Raspberry Pi and some drivers that make use of this
driver are enabled using this or the BRCMSTB option so
add this too so the users that want RPi5 without all the
other STB devices end up with the driver as well.

Fixes: 32c6c054661a ("irqchip: Add Broadcom BCM2712 MSI-X interrupt controller")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/irqchip/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index cec05e443083..08bb3b031f23 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -114,8 +114,8 @@ config I8259
 
 config BCM2712_MIP
 	tristate "Broadcom BCM2712 MSI-X Interrupt Peripheral support"
-	depends on ARCH_BRCMSTB || COMPILE_TEST
-	default m if ARCH_BRCMSTB
+	depends on ARCH_BRCMSTB || ARCH_BCM2835 || COMPILE_TEST
+	default m if ARCH_BRCMSTB || ARCH_BCM2835
 	depends on ARM_GIC
 	select GENERIC_IRQ_CHIP
 	select IRQ_DOMAIN_HIERARCHY
-- 
2.49.0


