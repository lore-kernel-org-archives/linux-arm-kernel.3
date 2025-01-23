Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CDAC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 12:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZRxUqDQtYMNJ04dpHaJOBq0JBHfXv3aaDgKYPS3OL04=; b=4KFWLILIiH2IWzFMk7jOc3ctqG
	DmH4ScdKwVF5PpzDW9S5uzeYewv+LygIXMJchNoTwZd5TU92XFj0EEsf5sz6Y63XfXci9E7bFiEX8
	ALfBB8c5436G/tUTQgGCHcqR18tFoOQo0oVQgQMCO/IU7N+mzt+ZCWouLEmo7naq2c7ZeYGflC6jQ
	JKvY/vYNrJOvc8psrojY3BYdLtZ+Ob97SgITVb03kFygFP1vJm7NKdemnFlCxs7A+W+5EmDi8OaPj
	DZfPIk9vDvYoUoo8A3irNItMqolVf6U+aupRwkudCu6q7h9HDNrqfIFUXPyy2zsdrtLfOiJ5WG25N
	gb+L6wNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taw69-0000000CQNV-0poI;
	Thu, 23 Jan 2025 12:14:13 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taw4p-0000000CQCf-3pE7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 12:12:54 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4368a293339so9321345e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 04:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737634370; x=1738239170; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRxUqDQtYMNJ04dpHaJOBq0JBHfXv3aaDgKYPS3OL04=;
        b=B/W1FQsSc7ELehm7yX4ucjQOQTITpza/VRDEekAfXp58gO3nbUbXstprqKmzQiZlAF
         8W6IIntXR4v838cIuhTt9reh4DhR8sr89tzr4S7ThLvbITJO8dUS15vliVYh1bUuvMvk
         6N76yV/eEnTX78At6r7M9KFoRtOpkxokviftVssPnRfdsbngecQk8VMRuvFddXrkl4WH
         Bhoy31QylTB3RisQnEzuqOc2cnmmsWIIj/+fm++Lwr7uaA7TEudbFH3zVMEXwq9kRll7
         yfD83DSHUjHfAN4pdDCPvyyKnpCPcYXlOmQNGZaCazDNk/qlcFp0zKRVTFaylxtmXX9N
         iQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737634370; x=1738239170;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRxUqDQtYMNJ04dpHaJOBq0JBHfXv3aaDgKYPS3OL04=;
        b=FhO+RFJhIc0R47aNvPIlw6oT4P8dLEjyRjLfxMxJaRBPdyVDbsrFTzTaqz4f4w3+8Y
         4cRGVeigqRMbuSnwB/J4kTR+lawHP5P4IQuJfqQBudwVcpj+1S5enQ7uLiOOROSJwr/x
         FTuImzxztRJSrmRTfiTYTsB+aOf/Y2l48YTDNBOmjXBKWdDscqMsYg3ojeLFZEArm0fU
         s0PB9zLgpHkxSljpwuCpk49oJvqa/IIPnhW86VTKRRzUXDM8Zo3AiCOddhe0aTPExRzS
         l4VvvOYjxwSQpyA9bIeqe8GA8+Jk4+jhbsEB09wgflnl+eY19DRfg9Qxk2BC4tf7kqd5
         qbBQ==
X-Gm-Message-State: AOJu0Yw7g9Xmy0Ble3a5+CMTWZRKsu0ieDv82DZ+sLVBw+Cq1ZRYvj6r
	cmU8XK3QO7fAEdIADuFALs1ZwRMPdMEs+7DJoGuJl9YtrDahAXIaA1luaJqYgumriVXeXtnB7XI
	1oyc=
X-Gm-Gg: ASbGncsTF1IDIk6Dkec05cA+o9viGbO7zP0iCEFNhZKHjRtZn1GNbmUuh1QQZf1NARh
	0dBEYGcMx+Zl/0C9cDW2DDcVbXe8QUxK6kV8w2TRrK+3/baqoqp4o4YpT/8O0kuDATl6DS+cKMe
	qx7EAmdeBpmIyNnWFiNw4YPfHVDO7jyiX8u/L+jM0ft9aq6QEXgF9IdqzxSuQ9rn2wWjWed6Ypv
	NI1Rmj4YSH/1Rg6NdJa8rSSF5JCt7iWdbEhhl8I45ANZ1ccGj7qMeBzsG6cCBFvxA5fQiN9djvO
	moYB5BW1TqyhEKKYM2A=
X-Google-Smtp-Source: AGHT+IHC7AaB8nrR3oGShOfXmCEVPdPVczCK1GzN9+qsELRO7/8LMNivLw27uw09FDLlr5i8rOIA4w==
X-Received: by 2002:a05:600c:4e93:b0:436:1b81:b65c with SMTP id 5b1f17b1804b1-438913df89fmr238758825e9.15.1737634369568;
        Thu, 23 Jan 2025 04:12:49 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:d40:ed60:2a79:1cf5:e6a6:b1a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31de036sm59344435e9.33.2025.01.23.04.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 04:12:49 -0800 (PST)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Thu, 23 Jan 2025 13:12:48 +0100
Subject: [PATCH v4] arm64: arch_k3: Replace select with imply for TI
 mailbox and TI SCI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-timodulemailboxsci-v4-1-b1a31b56f162@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAD8ykmcC/32NQQ6DIBBFr2JmXRpBCm1XvUfjAmGsk6g0YInGc
 PdSD9Dle8l/f4eIgTDCvdohYKJIfi4gTxXYwcwvZOQKg6iF5DVXbKHJu8+Ik6Gx82u0xCQXKIy
 Sl2tvoQzfAXtaj+izLTxQXHzYjo/U/OzfXGoYZzXqXhvl8KbdozPbSF3As/UTtDnnL7btH6S3A
 AAA
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, nm@ti.com, afd@ti.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, khilman@baylibre.com, 
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, vishalm@ti.com, 
 Nicolas Frayer <nfrayer@baylibre.com>, 
 Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_041252_217777_C114BAAD 
X-CRM114-Status: GOOD (  10.58  )
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

In order to build TI mailbox and TI SCI as modules, replace
select with imply.

Signed-off-by: Nicolas Frayer <nfrayer@baylibre.com>
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
Changes in v4:
- rebase on master branch 
- Link to v3: https://lore.kernel.org/r/20241016-timodulemailboxsci-v3-1-0e7f7a6de97d@baylibre.com

Changes in v3:
- rebase with master

Changes in v2:
- Use imply instead of removing select altogether and dropped
patches 2/3 and 3/3 from previous series as using imply makes
them redundant
---
 arch/arm64/Kconfig.platforms | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 02007256709e..a6e4bfffc09d 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -133,8 +133,8 @@ config ARCH_K3
 	select PM_GENERIC_DOMAINS if PM
 	select MAILBOX
 	select SOC_TI
-	select TI_MESSAGE_MANAGER
-	select TI_SCI_PROTOCOL
+	imply TI_MESSAGE_MANAGER
+	imply TI_SCI_PROTOCOL
 	select TI_K3_SOCINFO
 	help
 	  This enables support for Texas Instruments' K3 multicore SoC

---
base-commit: 21266b8df5224c4f677acf9f353eecc9094731f0
change-id: 20241016-timodulemailboxsci-412e2a6458fc

Best regards,
-- 
Guillaume La Roque <glaroque@baylibre.com>


