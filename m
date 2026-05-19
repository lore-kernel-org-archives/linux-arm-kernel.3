Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9F4CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 22:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jifOPOKz9e7t/M4xHCnDkF0tjSFHG2IW4tQnfDCbC4s=; b=eyNcTXht7ylyJqv2lW9sdh0dze
	/EajR2+ddvDOcfbvUwrGhMTjfPs9HbkhwLn9Iq+FLwLzykl1c5ZhOth6424KaQKWvBPGtKAvBhcFf
	a+AnAns/IpNnm6yBCOZtHF0BdG94+UCQfyABDQi21OwqcoRDudaKk1MOXvlaRj3yLQK4qJkfdb5mP
	C/sIq2Huans9nn/yk+5xl+j9V2M3dxOJqjIX9LNEmanNEjcvlZQD/SPYzJqmcT0XV9SmLE9ZJxGPh
	qt2m/bcCDH/s2QX1r43ZylU4b8l3JBCXiAEt3cJcknZtIKbsYQJj8t3Q/WKNdKVud9qKCvMSQDMX1
	r9O+LiNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPStz-00000002wq7-1DBi;
	Tue, 19 May 2026 22:27:03 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPStu-00000002wp9-3TIC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 22:27:01 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ba21d32776so29539325ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 15:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779229618; x=1779834418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jifOPOKz9e7t/M4xHCnDkF0tjSFHG2IW4tQnfDCbC4s=;
        b=swUdHDTspYq1MlKatq1+24rzIPiOqkBQtdpIKMwob+43YpncQNncVavqdHOpu/9pOG
         njUjqFPuYMbcHd2JHeL4zhx1rIVSLvXgYcPqR6WMEUoDVIbQFjz8P6MZ73D5cPbkEoDU
         anDDAqH3oTs+pUPBbP3If7R/VsS/4SjKhKiAxHBas4tF1ukuEvJd6QCa/GilZ8hOTJoF
         QWHqwhNCYsL7jDB5M4kBs11BzGPI2vWvGAg+rqX6TsxgH0m1Xww/9OPJioswSfB7yCoN
         MhZTxoGt2j8W3MNtDn9S8jmp9yF0Y78fIHb6gt2S5vTBB33EQD5YE3Y6E85DltwhT1rA
         pwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779229618; x=1779834418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jifOPOKz9e7t/M4xHCnDkF0tjSFHG2IW4tQnfDCbC4s=;
        b=WbiNfOp1FkI7gJZplTjosXVXuOW/6Bi4VMa245bbYpK0GarZZmua7GWXtFJ5NabRFl
         ZS0N7amqUM6qGOtzTCbfa0IVEYJPthe2xT+2/HiFrd/yfpFefnt743l/WTkI/bvoEyd2
         /6Oa84JqrFfdbC1uN5TbnnvxYMyyVPacBP8NEUHiJp/BPNBmcmJyoa7CrOSPS9C2Qovg
         GYncfdc1JxyWUsr6+rmq8fHjPFrWZBgGoWejeRBwQ20X468TzRIXpLeocSwISv58i80e
         9TgWR+X0QXKU4+9ZqMFZySLe9cmi9IkI1eiqRt/Su7tnx2gOI4Pe6dc/vbBMP3bpFkFr
         IJJg==
X-Forwarded-Encrypted: i=1; AFNElJ9VVF3XQBSJ3DdBvM8tZbcCKfJtiwBhse5ILF11sqa85d0rlKVwuBl+KCIu1WNRQnWOMYkZUlD3jCBmh7lrTHrV@lists.infradead.org
X-Gm-Message-State: AOJu0YwyDJWUqt7A5QongFEkjzPzH+4BEEpYm67aMYJ1l8oY+17arBFT
	fGwl9FJjLSdbw3aKxiBuRL+5oy0aimbF6XdO4enwgoQg0kOQfd+ywynA
X-Gm-Gg: Acq92OHd9syTxT7GIjZcAo+rRmDjnqD/8yi7uahdMBROXQ7ED/F1aaCOQje0QSJlI1P
	zwAmxWcrCLAHrvdnVOAQ8BbfSJEW4q+vmyLGHFAH+aaNkn4YT1KMKGxvMe1IUnwwtaBfauUpfoA
	9MgH28nq6NOZsYBMP9E5uNCriFU3r7mQTTxPAkajPp1CI8m0DoZcdSEhjjavuHIcUU6NRSkBFg3
	iOZ5vrNCn1+QSD4xFoz+a/ZUzyITLZMwvBAk20vQfXzEWOaWrNA5KAIpmyNJYBWTzt+4dbUYW/M
	tlF3ShiY/CN15Y42Dq5fuuI/nqyKTkvmps8zgSXaTqiHTDfUQjSrR/oG3CI6nW3YP/cxnPw5Ssn
	LmcJV/Nvrtutxs8U8mvdl/+jWyMU6wi1zRKq4z8edEn9U/ev3sXaZt8xxqG4KM49RNPEXiuWtBI
	Y1IcU8UAdo0mhpKwYu+HXFTRsE26IBfOtk8v69ju6BICt1KolkofVveGlzSAMjHhwRavFHCUMH+
	u2icaKrYCNN89Mt5wCS1Sviaa9MR7mKk3IHSKKzfmGiOw==
X-Received: by 2002:a17:903:2a87:b0:2ba:4eee:6c1e with SMTP id d9443c01a7336-2bd7e8214d5mr226202775ad.15.1779229617864;
        Tue, 19 May 2026 15:26:57 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd279sm196517115ad.62.2026.05.19.15.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:26:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: stm32: add missing bitfield.h header
Date: Tue, 19 May 2026 15:26:39 -0700
Message-ID: <20260519222639.34508-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_152658_885234_3A5E264A 
X-CRM114-Status: GOOD (  11.17  )
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

It seems some ARM header includes this and the build passes there, but
nowhere else. Note that the driver has COMPILE_TEST in depends.

Fixes: 37ae8501cdb0 ("clk: stm32: introduce clocks for STM32MP21 platfor")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/stm32/clk-stm32mp21.c | 1 +
 drivers/clk/stm32/clk-stm32mp25.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/stm32/clk-stm32mp21.c b/drivers/clk/stm32/clk-stm32mp21.c
index c8a37b716bd5..bdb17419908c 100644
--- a/drivers/clk/stm32/clk-stm32mp21.c
+++ b/drivers/clk/stm32/clk-stm32mp21.c
@@ -4,6 +4,7 @@
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bus/stm32_firewall_device.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index 52f0e8a12926..eb0bc918ecee 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -4,6 +4,7 @@
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bus/stm32_firewall_device.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
-- 
2.54.0


