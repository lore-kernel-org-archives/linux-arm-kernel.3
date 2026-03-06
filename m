Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787F4F5141C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 22:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGeWdIkU9VejQgwZq5zb7Y2J6ZyCjsrY3OgmM4MXxHc=; b=AnSvShURL30V1G0DcwSb23puIT
	xc2Jbyu4QyhuHZcXrdh/EThCYHNA+wWB7bJX+ZCiQH6x9TuReIeay2c4vQYfwswUjTh3qf1qPKKdj
	Hvnr5mxFCbPwkP2mpALMaQ0WnjX+6h3s3H7APWhLZjRPBNchCIpvqjLFn/TkSGTTmzVHFjU1TeHXm
	VTyo0WgjaCVnm3fqMxBl5l/MQBRwYWQgeL0uGR/N1v83IQo5LOgVyXPTBWOQBxm/JJ/5pbYVpOz+b
	k/QX0Ap96Uae6uqmPHz9KKwdn3IDru6Q1A6qioFKejRnfmG1XeMDQXXlJdZBM+cfCBjvQ0NwwmDXA
	0uGnAM+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydbl-00000004aRt-2CNh;
	Fri, 06 Mar 2026 22:25:21 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydbi-00000004aPD-0ajX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 22:25:19 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ab39b111b9so45397805ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 14:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772835917; x=1773440717; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGeWdIkU9VejQgwZq5zb7Y2J6ZyCjsrY3OgmM4MXxHc=;
        b=aqJiwcZ4LZo9lTsmv4ROHdZh5b/RID+ah7N2qtpM6T3fXxxtHHwSJ7pGTIBVt27O8e
         2WLJiSfB2Hw2bfi9AFvfg4WTKeqtl3M5i4/VVu249Odye4AlcFRqQ0RANHmjdC/Fo0qF
         AFf/+j+4lRwHXcmR2hPsK1p/zTZNmSVV/EMQj2RxMmQ0xfIcVVLbVhLMq9QOx7IaUIY+
         FhR0DfJAgFp84+f769KoDDV+1F62oevsqqZjxMZ6a3URxhDXFkWKNnmNSBPukSh/0QEP
         T8qEMJhagq4XV5+HNBi0ny7HARRs9LMKhP+paKLLTmE3Gl6a9VYuxRBM/iknk69vKoY/
         R60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772835917; x=1773440717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BGeWdIkU9VejQgwZq5zb7Y2J6ZyCjsrY3OgmM4MXxHc=;
        b=hfzW5jOGKHJfaIoLHM1SlOpX0duD6Cl48Ju4wLwZpemAsCS1wJwJA69z8P1j8mXoO5
         V/w/5zijiQN0bF2/WLWQ/1C0Lnia8i6mUXtX7xkAQxmN7+2I5lKMgYT/DAkkVKPAPQpL
         DvAHsSGKuu1HOfiR8FQMm6fIK9DuthH6NhRDilgAK2r+CCTbLyG9h3QSuJJ3CwU6+0d4
         07C8ZqAP8HdD+UjSAbbFLGiLZq82W2qj0dnfQ6cKGOXM/O1PF7ffccHILojhASKz5JqS
         EfKovkdwcoKk4hpUaWcS3+a7yc6anQ5sMS/E5MB/w7TyUK8xWZIKbY1pq56859+N/6dU
         Wj4w==
X-Forwarded-Encrypted: i=1; AJvYcCV2xRsAiYo3Y1nFsDOwTLaJZ5qMSz4iedZ+8PolkZqm/oTAu0mNachhWL+4YGoMWMlc2a5QEITFWg9HdEVZAVT8@lists.infradead.org
X-Gm-Message-State: AOJu0YzdSFKrnQNEeeM300wR1s6xAqLuwfSDzIQ/Bp28wc7ESGU0N88l
	kxwFIkR4+lcxdKpgSlNX9I8hWOsgkOTHwPyq49+avYdq/+Iuv1x4BVSv
X-Gm-Gg: ATEYQzxylJiTBPphDrMSAcw5Ga3CzLNTBMmL+Ns9ezgF4JQHb5iwM/qAU6iVLFKPlct
	PpuRNIxkTK9PMhRTEoAEro0oHJc5cc/ZHetxJy8JuRaKn3i+5PsYPMLkGJU2z4V8EW4FHrpI1LS
	epKmXwTjeVChLRMGc2DWb+PDQwY5ElvcNkUwZXuP1JTu0hhEEuj9BbXbzREQV4QJBA5nKLO1+jE
	i+n4oSbiSUflBuueq8zBzomDb4i7RJTrsXTNjeHi/Q5L2H4IH2XaVJcxa/L/sXabnoFN2NOkkRG
	G1gPMrOu1ZKmKvjPQae+xCpQE5kOG4tDms74FvSzypAtezdTGq4n/hrrGWZfrHq8r6BTk0eVt45
	EHJKZmcX2LHU5ybii6kWIYEI9RmQfTjc9FVFe/YYqMbyDYuHUTYnAUMtxsFIqozSFDD/K36RxPl
	pmrwca6Sp+nKN0MsebgvvqPjuga5/MEysrXvcvUOlpqRWr9qO1IKM5nz4=
X-Received: by 2002:a17:902:ce82:b0:2aa:ea8e:f118 with SMTP id d9443c01a7336-2ae8241ddf9mr42623695ad.3.1772835917227;
        Fri, 06 Mar 2026 14:25:17 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e7c58asm32516605ad.25.2026.03.06.14.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 14:25:16 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STI ARCHITECTURE),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2 1/2] phy: miphy28lp: add COMPILE_TEST
Date: Fri,  6 Mar 2026 14:24:56 -0800
Message-ID: <20260306222457.8400-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306222457.8400-1-rosenp@gmail.com>
References: <20260306222457.8400-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_142518_199431_068B4B86 
X-CRM114-Status: GOOD (  11.54  )
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

There's nothing special here to prevent compilation on non ARM hosts.

Matches every other st phy driver.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/phy/st/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/st/Kconfig b/drivers/phy/st/Kconfig
index 304614b6dabf..49206185e563 100644
--- a/drivers/phy/st/Kconfig
+++ b/drivers/phy/st/Kconfig
@@ -4,7 +4,7 @@
 #
 config PHY_MIPHY28LP
 	tristate "STMicroelectronics MIPHY28LP PHY driver for STiH407"
-	depends on ARCH_STI
+	depends on ARCH_STI || COMPILE_TEST
 	select GENERIC_PHY
 	help
 	  Enable this to support the miphy transceiver (for SATA/PCIE/USB3)
--
2.53.0


