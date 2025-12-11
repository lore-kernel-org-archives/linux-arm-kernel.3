Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AB1D41D68
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 17:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QF4bwegGvFed0Yl+DUy1op1ro7pOAMcTWKOhyZ6qe2w=; b=MviCnBx9QhLnztwSKxwf1g+5rk
	Ca4NdqqPwdD7ZREPglsUN9TIrfbyEEfiUGpEoHcgF6qNyUKHvDuazibazJletOxfZ+lyg5idsmPPd
	T5xMiHkApfCHBJew4Da2N34mkExov36rAM2kxUegU5qIWaX0hz1SzmZQwzOW0ZFWTq0bZ0L+cXAjX
	s8h57F7sQQKmYV7X4BtApy0bffC+OPZUsSnjlyctlhMLW1XUDA16vsqveUdGyCtWHgKoMJvnTLxgZ
	qBhglqcp9XsZ3utvx68ik91Zi6tMQpgB8wDmIN2+rSzB4fcl2TVEKQI//EnbRPvxgT2wANia2+/0o
	wUG6u/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTk6t-0000000H0Nz-1est;
	Thu, 11 Dec 2025 17:05:47 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTk6r-0000000H0N4-0PgA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 17:05:46 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so401704b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 09:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765472744; x=1766077544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QF4bwegGvFed0Yl+DUy1op1ro7pOAMcTWKOhyZ6qe2w=;
        b=h+3qL6/I4qVxgkfn8G63zStmZ9H8uynvlkx54W0TTna5ZAtW3EV2IKLdQ6Sgj7Ktcl
         TzJ/5UwhYPyQ4X+llmGzWS5pG5C5oAIWHg0T/gP+uaTgTP9xGiAh9stsfntYe3QRXOBs
         VQNxxYUsyyxjoxN/wpssTWDoddmo8ZjR+eoFa2qdRm7ZeX5fjXoB/23WFY2/z+49GsL3
         EHbbgK1mmvIHv7oxdwS0yd0WuohryBHFMJjBjB5V1iDKhF3eM0vZILciBKQqGZFcEz5B
         r6CraQvjCxwaMX194h9/4VXgeV1yNwWpGHMsR2oJyjYky8GbvcYGiPR6N6DVVWAwDHVK
         olPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765472744; x=1766077544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QF4bwegGvFed0Yl+DUy1op1ro7pOAMcTWKOhyZ6qe2w=;
        b=RlstSGWqGzf7RHbVElQsnNsTJABnUFDvSdX3RxqWobBHWzbSGfJuw6atKpE6EEjgZV
         xQIejfwbhAK5+eLZX6yQy4cC0ODDt/ahEPCVgPGJU6wMNWTlkemI9pik+yqIKY/yALkQ
         JVnhBHOcoj3tOt/cduHIskYbnc0MpX2z4BLjKyZntXVLYBJvbLtmNWZWwhxnuafaZf82
         yCo7OCjnF81ZLr4gxpMDQGxv2qosAWT0TkmXVwCcGxhkCSE1kMk/kTYz0X4o4vpIXn53
         BqygW7O6u9hdpti3mewmeGAgNjZVQoajEfmZTQShjvaz7E9hc5otokMWEdMFPs8XB/ev
         lpqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbAqxsuv2dcNehRR2Rt2OZJtgx85F9rvC70+zKZWNS/rHLuwFDaP3TQqdEBqi/Rxu/ZXBPUDCJXCNkuUNEmmRS@lists.infradead.org
X-Gm-Message-State: AOJu0YwTbiGOrDBIZilFsnvx3cnZqvjUW7EDf/XVIHuFKes9LvF5WYw4
	tZN2NONxNdD8Uso/qASux8p743Ee6oQ4TkCzcPLvdt0wvroFSgPjIalt
X-Gm-Gg: AY/fxX6Z0gA3tZRAkEPNB1J+RDaRO4eVCkqOKrKLSMV2N7xay6ghZf7V8Twc5xtIBYD
	EAiQ51sPldHiTZQG15jewpHSaaTB1PNAF4sXfN26emnFQWM2SISuPH0qbGK4/8veGhCcW2fLJW6
	rq3IcRfg+mEP8u0vG/qsyj5OuUvtORupiDrSbX+rUNn0jcoOkankEwceleHMOejCYSHzqjcSz4V
	Qy+ES2Yk+YBbuoT+7D7lx/ZYJgU4AazimfRkUrvak5lrKbDyLyA2lBOmFrDWwoSQyCTo9ykWMLy
	UNZfgMc1oabP5QsJuDnLi7zHI5z0gxFD5oRqhsWvvxcsXKO1BwXlPQz0iEa5qDvifeHRJawfNjb
	TrDozuJv/8dPXff89FmAtYaprfqgdoiZmO27OOkhgmzJSZnyz6xYXRiVFf+/EuBKE4WnT0/PFYw
	bGwmPSlGVbr+/H7Pki0ye858QB8bF9pLKXlj3GHVBQw9o2q3A=
X-Google-Smtp-Source: AGHT+IEeCkuqUuhvrUzPTxUZijZi+4cL+t0lUV3MX3EblNMLxt5tgAkoaPiE1OZ8oV44fCIWFzlHPQ==
X-Received: by 2002:a05:6a00:4b56:b0:7e8:43f5:bd1b with SMTP id d2e1a72fcca58-7f22fce63e1mr6604332b3a.48.1765472742417;
        Thu, 11 Dec 2025 09:05:42 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1cc4:1fe3:da4a:fc56:de9f:a856])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c237f2a5sm3010980b3a.13.2025.12.11.09.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 09:05:42 -0800 (PST)
From: chourasiarohit27@gmail.com
To: linux@armlinux.org.uk,
	rmk+kernel@armlinux.org.uk
Cc: linus.walleij@linaro.org,
	arnd@arndb.de,
	nathan@kernel.org,
	kees@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rohit Chourasia <chourasiarohit27@gmail.com>
Subject: [PATCH] arm: kconfig: fix duplicated word "the" in help text
Date: Thu, 11 Dec 2025 22:35:35 +0530
Message-Id: <20251211170535.33836-1-chourasiarohit27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_090545_144715_6F2AD273 
X-CRM114-Status: GOOD (  12.84  )
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

From: Rohit Chourasia <chourasiarohit27@gmail.com>

Signed-off-by: Rohit Chourasia <chourasiarohit27@gmail.com>
---
 arch/arm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index fa83c040ee2d..bc7b05a954a5 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1484,7 +1484,7 @@ config ARM_ATAG_DTB_COMPAT_CMDLINE_EXTEND
 	bool "Extend with bootloader kernel arguments"
 	help
 	  The command-line arguments provided by the boot loader will be
-	  appended to the the device tree bootargs property.
+	  appended to the device tree bootargs property.
 
 endchoice
 
@@ -1626,7 +1626,7 @@ config DMI
 	  continue to boot on existing non-UEFI platforms.
 
 	  NOTE: This does *NOT* enable or encourage the use of DMI quirks,
-	  i.e., the the practice of identifying the platform via DMI to
+	  i.e., the practice of identifying the platform via DMI to
 	  decide whether certain workarounds for buggy hardware and/or
 	  firmware need to be enabled. This would require the DMI subsystem
 	  to be enabled much earlier than we do on ARM, which is non-trivial.
-- 
2.25.1


