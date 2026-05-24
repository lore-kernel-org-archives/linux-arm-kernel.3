Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E540ACD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 15:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ReOkgoPLdCaHd6CcEsCAqea7Z9/lGvf+pkF1enOHLhw=; b=O5pSlZQUNqjAL8/UjqYq3MD9sj
	mUNVXE+kGDdagUOd0ODRmKRattiQIsTgOusn2EsLCw8ut+clWE/7z4Gs01eJMh8s9V5g5RyCKS+75
	fgaTiP6Xsa3gGH8NrNIfXRCDmmeOfd8UmNCGiBcbd6H01Smip7g5ygbJGr/K6jYzvdBMHB2XhHBNt
	ZaSe9mpilrnX+SsCgnok86gg9apBvD4FNUn8LQw293xNH+kHAuubYPOpvGykxblTQqJLl3CDdfzCs
	7ilwTDPczt1ohQoU0SKgcnQ7BEGz9cRghKPSYJtUUQ7c0wq3JjHtPtwIU3NbggurvTt5yIxWlogE+
	3B0qgK5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRB5n-0000000FDDY-0d29;
	Sun, 24 May 2026 15:50:19 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRB5k-0000000FDCZ-2VUD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 15:50:17 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-82faf871346so6881821b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 08:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779637815; x=1780242615; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ReOkgoPLdCaHd6CcEsCAqea7Z9/lGvf+pkF1enOHLhw=;
        b=ZeQrNKR6GNqrfUXxWy/yUQnJAK2Dm0wqxCQvonmZ7oLntuAc8KESrGVvInPfiPOYDE
         TEAlldSIPbXRpG1XvBcyv2sNmU24yPP8J0YiikmjC+TiVDrcKho46v7cRbAtlD1FMMr/
         mBjBd6x2KKKR/tgx4+scQAfvU20fCdHaKp1kdLAbD1ZRCawV4Kjibm8JydpF5J24A6c1
         VOxUqm2t3vB/QTXfRGkpq6wdHf8/iXwI8XK/ILs/nCq2Ys3Rpu0MkCuen6gGPvKfojdO
         BQFP2KoxUreMHzoZxYzvs634Y0WU+36y4tnD+4N1sSght/oun7kz24b8paW0MMDdsS1U
         JhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779637815; x=1780242615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ReOkgoPLdCaHd6CcEsCAqea7Z9/lGvf+pkF1enOHLhw=;
        b=HTlPP30DVI/+fGgWDXAIsQNIJ3ERQRoMoEQcZ4gWc8QFNKhmiVAtcXBxptzLPYguGp
         AwXqfBM7cXVoP1eAFSdkjy4/ASeq3bdFkjV8Sr1DJ6quLdMFsZ7mU0Q3R72mUh6y8Br1
         WdQdYsRoOGDFAn5gvI2pLx5vTCeR25Iq+siZCC5ByBb0kxWQUlkn4b31bx2IHsXBXrK6
         IhkLz0fRM4FPDhsLk/MIQdzBOBpRJ4URmU+8OpI/OWNmJ0OpupxsXPlZfQwzLX3RmLoB
         2/4GY7B2O9xj2h2RiDLwLY7dF9BmWTGYFJ+PpEWOWA9UGAHbDsZ6xei2wLv5nuwtDakl
         OeHw==
X-Forwarded-Encrypted: i=1; AFNElJ8p+++0BCdBjADX49V7TTQM9bWCRvM3JMjcK/UidgPLoBPeaFmo7lcLWeXi4/pYH+OZGiufAWGNTAle/7j5xldJ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywty2i+cqvpE/WA+KiP1oxkRoRYkEettfb56vniTOoLvsia2WXG
	H6ZnikXEos6pcSbLfEtMIjw1tOgt9KUdypz1s48IIbP3XzYPkwmMS9lr
X-Gm-Gg: Acq92OFU8DaV6u6HxiMy6Gj8j8jtMPZB3mtGjBSG+BwtfGsXB4S0Kw6wM6W1XwltaFr
	AdSp2o5oNpZlziEcH6Pz7S9IwIIV4ykkmNexPqC0/XAcF1YTiTtIldI6GckziR9/AOTDF04XwSH
	k+pib+4Su77rHVihb0fW9GC/0h8QJ2FJcbW4aTpKvFwR2n8LIROhlt9zm3xK7zSFVEYDUYfdLOI
	mic4rR7l6xLLHBfKRPQxrlpG46PlJ72u/73ioHNvKqkInSoVseWilJmJJYEDnSOXX+9j7MLTzIV
	2YX0IikGL3joH63XrYTZA3/oGcSVz17w9wmwGeR/FU/HZkVAaS0sTQSPugReXcKgHro9BeyCdfB
	OjF+JAnhxw4KVzt6iBNwemZLo2MropMBhhxJAZFgqkdPXAePeS1vCNxZ1MFMjtdnjKrgsirDET8
	MALnh2Aj68jUAA1FZ86i80kTUDcaiOai1VpeZGaW+CdQPtqDOsbA==
X-Received: by 2002:a05:6a00:2d25:b0:82f:5051:f024 with SMTP id d2e1a72fcca58-8415f5dcc6fmr10442376b3a.27.1779637814974;
        Sun, 24 May 2026 08:50:14 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b74sm6997716b3a.3.2026.05.24.08.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 08:50:14 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: meson-axg: Fix whitespace issue
Date: Sun, 24 May 2026 23:49:53 +0800
Message-ID: <20260524154954.385778-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_085016_632028_EEAC3343 
X-CRM114-Status: GOOD (  10.95  )
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

Clean up whitespace misalignment in meson-axg-gpio.h

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 include/dt-bindings/gpio/meson-axg-gpio.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/gpio/meson-axg-gpio.h b/include/dt-bindings/gpio/meson-axg-gpio.h
index 25bb1fffa97a..a0d42bcd9bd3 100644
--- a/include/dt-bindings/gpio/meson-axg-gpio.h
+++ b/include/dt-bindings/gpio/meson-axg-gpio.h
@@ -23,7 +23,7 @@
 #define GPIOAO_11	11
 #define GPIOAO_12	12
 #define GPIOAO_13	13
-#define GPIO_TEST_N 14
+#define GPIO_TEST_N	14
 
 /* Second GPIO chip */
 #define GPIOZ_0		0
@@ -52,7 +52,7 @@
 #define BOOT_12		23
 #define BOOT_13		24
 #define BOOT_14		25
-#define GPIOA_0	    26
+#define GPIOA_0		26
 #define GPIOA_1		27
 #define GPIOA_2		28
 #define GPIOA_3		29
-- 
2.54.0


