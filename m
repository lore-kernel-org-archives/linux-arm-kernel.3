Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19365CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 16:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIRsrxbOMOkK9iDXr4aj3ra7y2Ob9j8yNJXopYjS6eU=; b=c7N+kyR2PJ67E1U3Qtm18xkHXZ
	q0TA2tSS8ytoXTQ+ZAYkz4yvi3AoXpXAnYchjVjl8xxBN5AkxTKnMDfMTLKyU7RrQhZ7r54X1Tuld
	bWiA/gXa/ihHw388F+v0SPXjeVtL5Th0VBeh1awZAWD70P3YmOWNy2KpJ0m2oTCGScmcnZpwoEco6
	8Plmdm4/KnSQmGa8BBjtG+ZvR2hvstD2E0/M4y79P5aMFCDhX85stqYj425/op94ZkMP8dyb1riuh
	96Vsqlk48muhX5brAW8J20M2t1EedoyXDYEtalPp5pZlYT/BcJawHV5B6ru1G6oZ6mr/O4/4EWhbm
	LNqxnknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7dC-0000000168X-0S54;
	Tue, 06 Oct 2026 16:03:06 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7d7-0000000163U-2SMw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 16:03:04 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so8208895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 09:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1791302577; x=1791907377; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIRsrxbOMOkK9iDXr4aj3ra7y2Ob9j8yNJXopYjS6eU=;
        b=57+2c67pX0wwU84vYqNHAFsU2QnFyONEYD28HsoKWBL+U1g9z/Qa6/DatbHIs4nvEo
         iu0CKT7ZyQZn7akqn8SRINMkT+AOwBT3FFHo3jGx2Mt2U2igS3X1UjAqkoJFI9xaYm4p
         w6rXJ0udw/qnq+ahvPbm1pzocjVrvXf3I0TitrUwCaVJYXZRSvrlU213DvrR2qt9e/q2
         O0TPmMpibKdqETTHHCKbi6dTuo/ZNnDeBN0tqjGAcG59EjRYuWKumiZXKWtaj5z4h53t
         O4nGBW5ztbURTHV8AsRwRYFcwjDefJ8JxZFHqOYcCqjCfW5lWuLcpTnKYNgjNOHhToRb
         DYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791302577; x=1791907377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIRsrxbOMOkK9iDXr4aj3ra7y2Ob9j8yNJXopYjS6eU=;
        b=DsrBLROZ9Td7PHfVHwCRdymEdmZNjQo5n51i7xAMsLvZp07fp3UsTSRnrKX3iukd7g
         8qNabxUX/3xbVjfdlEA3vDBZuv8VFNXvNh4NCp1sk9AgYuz85r2sN0WHQ1/Lon9bt1dm
         vb4v43NDkTEAQL4xa00p68GfwD0XNJLhv2FdLSwhE/lu29zsG/JUlWYJJn5rPCPk1R6T
         A8g6uMW61wlAAfPfUxPmcd7Yg8fJr9zaAuehoSjZ1zfkw9OZIUm6OHapx5THcQqkKkHz
         JPf4QsIMrCsfOzV7LEKzJ4HM5oJ7bs7yrEpdxC3eCyenDxnrHALqsO3THNsL4u97Euoc
         N+eg==
X-Forwarded-Encrypted: i=1; AKwUvBw+zyv20fAiLZRG2cUgeOW6LggZ/WoHIWC2lOLYY4CPx9P64qR4ywhz55AJ4F24/BP6lEgqyM+uHvUNnfgQ0phS@lists.infradead.org
X-Gm-Message-State: AFuF++lZwwwZtWrZAPSvk3x0lqrk6Ibpr7uin6EwX/lmwttJk6gHpKop
	ojQBOWQVz+taAq3jQbDYRat/KruoHVCxRynMfJADW9SUzQsyJOc+fCz2hdROqiHYszY=
X-Gm-Gg: AYBFou3TVfAKV+diwAci/NOoyuXbg4V63BaEMElYJvwXF+Py653ja0yiqZuw/xEB5Gw
	MjAo62y9nqVb5Ppbqc1S69Ds51eCoDdhuuLbEWU2is7FDHMcYzeGWKBjzEY1VSoKWN/npbZJOnP
	trdg8HiyGuhky21k2eP7DDmxnuml1G/NEmLN+e7oxpGqCHcCLG1cC+hnyP4DdTr68EVNLskLHkP
	R0hOQ7RXSlsvGQVAt5uJDNDYbuihuJ9Jd+OEKQ/v6/EaSXU1j+iDmIC8WWvORNGFzIHRV1L2okb
	6UMp9vKSh6Y13ncQLxpIVwSuiiHGnS25OW0UuT0ZpvDUN/w7TIhtqHsanwh3VXXvUz9cQ4FwfGw
	2OZg5aSymP/pT67iarbqgRtmqUEz6AA+lbN8nHi6cGXFknnYJoI68jK0ABPeaHf2CFtIQNsi1ZN
	dbQk///Dhb9uMZanvZnTMn9gsU0/7UCqwtdkU8zop7LfsxWhIxqh7IXXnprUI+x5gDjNVxuJqCq
	uSrvIkL5kPgi9s3sKH21rNaL9psDg==
X-Received: by 2002:a05:600c:5617:b0:4a1:78dd:dd28 with SMTP id 5b1f17b1804b1-4a17b55428bmr21165335e9.27.1791302577573;
        Tue, 06 Oct 2026 09:02:57 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.85.242.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2014asm369641f8f.38.2026.10.06.09.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:02:57 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 06 Oct 2026 20:02:39 +0400
Subject: [PATCH v3 1/5] dt-bindings: soc: rockchip: add boot ROM download
 boot mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-rk3576-reboot-mode-v3-1-6edba064693b@flipper.net>
References: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
In-Reply-To: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, 
 Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=915; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Ft5tajPF6rdyfGUW0BWFsN32iOQqo1FkzC57Z7wFY/o=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQdlV79Nion2T8ozWixZ/6da5aiGbrB0uVbZLWDY+xuT
 90xjzmiYyILgxgXg6WYIsvcb0tspxrxzdrl4fEVZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKk+sYCR4av2HxfXQ6l3JgmdT1Hc82R+Kv/C/vWRT4MbQ7YwVHyyq2X4Z854eqJ
 ndfnFiB6vAtOdWaY3355/PzPo79LmjUveR88/xQcA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_090301_739681_DC85A505 
X-CRM114-Status: GOOD (  11.02  )
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

Rockchip boot ROMs enter USB download mode, commonly known as maskrom,
when they find 0xef08a53c in the register they take the boot mode from.
Add the magic under the name U-Boot already uses for it, so that boards
able to request it can do so symbolically.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 include/dt-bindings/soc/rockchip,boot-mode.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/soc/rockchip,boot-mode.h b/include/dt-bindings/soc/rockchip,boot-mode.h
index 4b0914c0989d..88684f4184df 100644
--- a/include/dt-bindings/soc/rockchip,boot-mode.h
+++ b/include/dt-bindings/soc/rockchip,boot-mode.h
@@ -12,5 +12,7 @@
 #define BOOT_RECOVERY		(REBOOT_FLAG + 3)
  /* enter fastboot mode */
 #define BOOT_FASTBOOT		(REBOOT_FLAG + 9)
+/* enter boot ROM usb download (maskrom) mode */
+#define BOOT_BROM_DOWNLOAD	0xEF08A53C
 
 #endif

-- 
2.55.0


