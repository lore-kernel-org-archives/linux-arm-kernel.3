Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF978E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 08:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ll6kImbemzHgzysNRe/B4ZjSKDdlmM1jCI9QSTOFJgQ=; b=qM3Ra4lRTwC56MgP4wtxzcUogq
	/k5yZF4OblcF8wsx0xQ2eox2NZ2SDIyGySRfMnL2Djh/HYxYE0EXURCdBQnSvGSiF6MMkPsClTupz
	BLmlEh3WofhnpNTivlW0i18lIhBwnZdHel/aumJShQHoREi6AH1FlMpOW+clsB73ZS2PFrpR9YMpL
	ufEnDDMG6aA6J+9iuOaAwcYLd3Cki0gDMGt7NtSkca8UmVtm0/lavGqFXKtsR7wmr/gVjOB3j5ffh
	naOv5L1J6WIrd7SSC30kiKbEWcEmXHAScuN5DL2SuvadWIsE2UljnCsFXKAYZ4p1MOsOVVdOu4U5Y
	g+Xl3epA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYk7-00000006pAb-1BOC;
	Mon, 09 Dec 2024 08:03:47 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYgA-00000006nwL-1btd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 07:59:43 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2166651f752so530305ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 23:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733731182; x=1734335982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ll6kImbemzHgzysNRe/B4ZjSKDdlmM1jCI9QSTOFJgQ=;
        b=VUA8vrYxehr9VkIHPnGm0Va73F7W365eAmyLshX7f+RrkA5x/atSr0weMlUow8wcc9
         F1grad8chmdB7lQXijrUVzr/PlheFG3hr6onI+kgSPwFFZFdcE3yuCpw6n7MhGhhsfTU
         t4wQ7yu20jv52VXrlmg0XEtNG7gHdEPAkGCYL6PQnApDfzJh4hQksUcy5pBGG1UWA7vg
         vM1JBiBfhGMYY4Dc8EmU3RUPLKILCgFqMVb6x6JncbiGlG359bWWLH2OkZgcVaitBPHB
         Dwb1gHKmZFQxEAQEJBOB7c71mYR6jVXljnioA38bD0vF6HYzkhWOEx2aarTp8JuIbIzg
         f6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733731182; x=1734335982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ll6kImbemzHgzysNRe/B4ZjSKDdlmM1jCI9QSTOFJgQ=;
        b=hNjW25WWZVpj1FunmMXgyMjYt1vTRs37DJYFB3LTF4qtuvT8ryqTM+qaPivjH9N9To
         IsbBelCq91jB2WnsfTLfzat2LuAYGi9UylkVcQ0gxOgyJBZ8yqpsAj2zUEc44Bu2zHnM
         HzZVKHobJ3YZAKDH9bbX2AiPTlUnUkRfa2nw8AzH7AudvHdyiFjlFH0kxiz0rVml39tA
         OEHro5ty8OanuAgerqSEZnadfhvdAmUB6gJAiyZKj+EyDohWB+wAcCKa/6kMTyBHDwUJ
         6M+EfrSMYLzm2sM9S+vZAvbioH5YkGW20Lc6y/QmgNMGDRAe2ttO8QJITrnEwvyiHx2R
         esog==
X-Forwarded-Encrypted: i=1; AJvYcCWCW11YEmvTAf2zdJy01Cz2CqkKvDArrOF5ei/iqbW7i8ttryqsnLGncrFqfvGDVe8FsHnlkWOZLHHnNK7j5nRp@lists.infradead.org
X-Gm-Message-State: AOJu0YwIWzW7KESVujvg8Sa4KuL/fEwHccYzpP2SOWj09DuD8soojt1b
	A2f+Z0mSeKcV2uCOnNllbkG0sUiabA8mjc72GmjfnioSRzzcgxRb
X-Gm-Gg: ASbGnctrAO0+O+Sy7I3YIJ/JRoOVhYLIlCxN6em+Yg6A9ykQye0YmSfEjh8gAJ026eR
	J+s1AntTs0mGtocf0Q47LAXTl+XPxeRhYcwJSW0a0CTBhdbGJvid66Xl5mmWdGo/9fiI0syrDW2
	EK6yE7ei6o1O9I7FvR+WKp0sX0xppon5n6mp1tm1DF3CKPv+qkU7KKYe2nu+M9OiKhr4n0bLz8N
	/lgQxBxFrRmTaE8/0oT4m/kGJ1dxC6qyaTAqRS0i2mp8rB7oteg6aF2ZGL804W2Tw==
X-Google-Smtp-Source: AGHT+IFLVJdXcJEMtQbEGzS9QEogjBccTI97+be9Pi/cjDczopusFs1mLg5QF1GGPSTJZ9o91Yk57Q==
X-Received: by 2002:a17:902:d4ca:b0:215:3fb9:5201 with SMTP id d9443c01a7336-21614dd1b11mr167697985ad.44.1733731181698;
        Sun, 08 Dec 2024 23:59:41 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21628b6588csm36508025ad.235.2024.12.08.23.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:59:41 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Mon,  9 Dec 2024 15:58:35 +0800
Message-ID: <20241209075908.140014-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209075908.140014-1-towinchenmi@gmail.com>
References: <20241209075908.140014-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_235942_417767_B955D999 
X-CRM114-Status: GOOD (  11.16  )
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

Add MAINTAINERS entries for the driver.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 17daa9ee9384..3a7dec3f9a5a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2196,6 +2196,7 @@ F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
+F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -2221,6 +2222,7 @@ F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
+F:	drivers/video/backlight/dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
-- 
2.47.1


