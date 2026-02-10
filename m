Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC676EB26FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 19:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AiL2V5buxMCQLXQlQY5BGvtkymU241uAzWGqsPlvj1Y=; b=uZqN7P9nMPb730i+ZprHl+uTuc
	7ZCYrWEvKh7QaQkCzlsaGIYPfcmllieq6r8IdpRQvGUgC6XKkLfUlKrTSy0jNR21NaPMp5q6hCqUC
	IYItESdtMB9cTprGVo8Wx/OHW45m9n506haq7/FZOnYyomLjWFPqLLj+j3jKkeEyDQtDwy9G89n06
	52RDDD21hPjOpzBMe9/tS+6szCzc/MSNC+wa3rZ7TCHmyNXY/iAxZAmx4M4pmXy426vEsDd9vTPb6
	5bJJ3//rwhMQSaEJg+YAvi8hECbLQEXdvfYSmYk4Y1c9wMa4vl1rHVYetzTuSl2HzRqIgXWURPJmW
	W8iUFnuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpt3e-0000000HPxG-0iuN;
	Tue, 10 Feb 2026 19:05:58 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpt3b-0000000HPwM-1yS3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 19:05:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so87640845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 11:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770750352; x=1771355152; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AiL2V5buxMCQLXQlQY5BGvtkymU241uAzWGqsPlvj1Y=;
        b=eyGhZvAIeze/aOy8ucToXddfw9L8ImJ3W73I+o1Bf0m3zfERc806d1jp1oEcgViEgN
         6XnnC+nyVJIphqE8GkMSRjv4eZCpx866qUi5c8UBfy4lNUaBvlWmJ+lMqTI2M3VN/Bse
         0XCGKQ8uRnjCtNvd1ss4PAW0ETAdSMhs5qN+kwFO/IQ/dKHPkQRNormTYVs27UGg+IF8
         zfNl++p/PMIlSlEBdYToLQlzlgN5Krm3ZiKoWK46nvlqxs0tgJWB9Ga+0Zs5dXiXfNxk
         flVpqVnwn2/LVd+56f+WCoBK6/2jXhzh6cy5Scfe59yrA2IMleCy2V80DttzSvkzFt40
         RPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770750352; x=1771355152;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AiL2V5buxMCQLXQlQY5BGvtkymU241uAzWGqsPlvj1Y=;
        b=jckp7t2bvEPQDUQW8MeUgBnR1GAbf93UCFyG3I021RpO0ME+Ng7/GHFyEn4CfZm8vf
         wXRyuaZDgNO7PVIyyAfn1Hy9HRj3WZ2eXBxogviecKdL5V1oEgE/fqygsideZLrr2cFc
         DJuthbAHaH1vv6dGbvliUCUpwM8Qj38iEeOtHYqpP3Y8uKh7c3R6zp4PCzG7uWZ1zQY/
         7pOnlesMDcFIx0YilHasD6belrSg1ORkZA3z0AiFCj0BUHDkI07Wuj/ATu0nwHMUW0kr
         Z/NtcAZDvCTwcd8KszYs1PIEx9ghZJVS7j7DvtrBYcwhC6hb42CjQYNpLhR7dIv2xj1L
         d6qQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0cXgtVUKJttyRULhCXuGSgGNJOxXOqvwU7+VoHoAlf/Sgyvt5EROhww9Mo0bZnPJp0E2neLboMOrvjZakSPkA@lists.infradead.org
X-Gm-Message-State: AOJu0YzIt0sRazRq/XzNPk28C6ZcExuWadAGZjUBTrANJb7oighThz/q
	5uqYRWylOoPCMBjJNOp8/5wqJ+op38UQ0lEfGWZhk1TcH3U76OO80ePu
X-Gm-Gg: AZuq6aIwMcvbuTWfCCo3INdi+iGiLpfhReLEB03fNRg54PjCQPsdKh65b5HRdI1t/9Q
	VrUGabhZ2LWsm6H1Ox7eowlSMJpNH5nwEtp0Viabc4jAk1MJ5z/+wz1UPmfB4ffIJKlW8VgHqce
	v3GhD+SYj0j/UeNT7bPin3bwwoHZu+141RWammxdvOOs+DZY71hCuANtXHIUcBMMK5JN4Gm0oxK
	O/vAuvJwqFm0iBmzqr/APvCLBwkWIdQbDsZo/TQ9W0WehbTKPOJQqbRfm72YXmQXK7TfQKqirUa
	84hDDOMXj+7HeyGIeqjpDW5F1lW67IUypquBRUlIUQ+3IyB/NICN0GFECPk0WMbwO2sg+qrlVdi
	tgmsyTEy39UzmjAX24+/apdiK0w6I2bM9zstlrfQsDVXJFe11+P2hS78DFg9qNAgWUVAsXR9Nk0
	w76tKJnPH8ICV/nsVI8+zx+vJa2hUx2jy2lFaNhixvQCy/kX/q
X-Received: by 2002:a05:600c:1f94:b0:47d:5e02:14e5 with SMTP id 5b1f17b1804b1-483507d018fmr45364095e9.5.1770750352032;
        Tue, 10 Feb 2026 11:05:52 -0800 (PST)
Received: from localhost (39.31.66.37.rev.sfr.net. [37.66.31.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376bd5a074sm18458009f8f.11.2026.02.10.11.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 11:05:51 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 10 Feb 2026 20:05:45 +0100
Subject: [PATCH v8] bus: firewall: move stm32_firewall header file in
 include folder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260210-b4-firewall-upstream-v8-1-097c1e47af82@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7RiKAqMr72FY1DKFSYCSFquGc
 HcrF3D5XvLfXyGwFw5wzVbwHCWImxLQIQPT66ljlDYxFHlR5hdV4eOMVjy/9DDgcw6LZz1ia5l
 KIl0oS5Cms2cr7z17bxL3EhbnP/tLrH/2TzDWqLDKT2Ss4kq1dOtGLcPRuBGabdu+/oNSpLgAA
 AA=
X-Change-ID: 20250916-b4-firewall-upstream-dfe8588a21f8
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_110555_525891_CE0A7F8C 
X-CRM114-Status: GOOD (  14.30  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Other driver than RIFSC and ETZPC can implement firewall ops, such as
RCC.
In order for them to have access to the ops and type of this framework,
we need to get the `stm32_firewall.h` file in the include/ folder.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Acked-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
Changes in v8:
- Rebase on v6.19.0
- Use uppercase for peripheral name in commit message.
- Link to v7: https://lore.kernel.org/r/20250916-b4-firewall-upstream-v7-1-6038cf1e61d8@gmail.com

The v7 is a subset of the v6 and other prior versions, splited to simplify
the review and merging process.

Changes in v7:
- None
- Link to v6: https://lore.kernel.org/all/20250909-b4-ddrperfm-upstream-v6-1-ce082cc801b5@gmail.com/
---
 drivers/bus/stm32_etzpc.c                       | 3 +--
 drivers/bus/stm32_firewall.c                    | 3 +--
 drivers/bus/stm32_rifsc.c                       | 3 +--
 {drivers => include/linux}/bus/stm32_firewall.h | 0
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/stm32_etzpc.c b/drivers/bus/stm32_etzpc.c
index 7fc0f16960be..4918a14e507e 100644
--- a/drivers/bus/stm32_etzpc.c
+++ b/drivers/bus/stm32_etzpc.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/bus/stm32_firewall.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -16,8 +17,6 @@
 #include <linux/platform_device.h>
 #include <linux/types.h>
 
-#include "stm32_firewall.h"
-
 /*
  * ETZPC registers
  */
diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index 2fc9761dadec..ef4988054b44 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/bus/stm32_firewall.h>
 #include <linux/bus/stm32_firewall_device.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -18,8 +19,6 @@
 #include <linux/types.h>
 #include <linux/slab.h>
 
-#include "stm32_firewall.h"
-
 /* Corresponds to STM32_FIREWALL_MAX_EXTRA_ARGS + firewall ID */
 #define STM32_FIREWALL_MAX_ARGS		(STM32_FIREWALL_MAX_EXTRA_ARGS + 1)
 
diff --git a/drivers/bus/stm32_rifsc.c b/drivers/bus/stm32_rifsc.c
index debeaf8ea1bd..65990ae8dd08 100644
--- a/drivers/bus/stm32_rifsc.c
+++ b/drivers/bus/stm32_rifsc.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/bus/stm32_firewall.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -17,8 +18,6 @@
 #include <linux/platform_device.h>
 #include <linux/types.h>
 
-#include "stm32_firewall.h"
-
 /*
  * RIFSC offset register
  */
diff --git a/drivers/bus/stm32_firewall.h b/include/linux/bus/stm32_firewall.h
similarity index 100%
rename from drivers/bus/stm32_firewall.h
rename to include/linux/bus/stm32_firewall.h

---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20250916-b4-firewall-upstream-dfe8588a21f8

Best regards,
--  
Clément Le Goffic <legoffic.clement@gmail.com>


