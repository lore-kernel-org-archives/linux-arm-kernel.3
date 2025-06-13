Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063B5C71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 12:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHtJLyTMYIFfJmuax7k6vu5lhjJG1PUEv0OdzzE0zPY=; b=T4sIOPzDpGese9GH3LhSvLcikR
	rfCsco2Seq2sZs0tuAyXug0pxn1mg5vYtNtWUT3k9nw72MGNopxPjrWnNhRx86zcPdyHaufniG9Wu
	t8hD7Tfczxjuu6MtWEt8eiHbgYDKqjABItY0RYPIOE/uJ95j3r7hdrBznHooar9aM6v+boSdDCz1q
	PweA6fN2FHKmybry6xUl5D9DTaUYvVGqXKk4U/QGOxbhM1FaBbg7Bfdf4ch6Ka3UcaUYYLC3jGPG+
	17v+zCRcCXVEz9L4b0gNoL52g/Szfden30sq2jrdOxpdKhd9r8K0InrHoK2/R2KyREA04m8k41H9k
	WaBB1zCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ37k-0000000GJbG-22Cs;
	Fri, 13 Jun 2025 12:03:08 +0000
Received: from mail-qv1-f53.google.com ([209.85.219.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2nO-0000000GFJv-0ruw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 11:42:07 +0000
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fafd3cc8f9so27752416d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 04:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1749814925; x=1750419725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHtJLyTMYIFfJmuax7k6vu5lhjJG1PUEv0OdzzE0zPY=;
        b=UubkypPNx1CP6vTd/znoS7O5guXAmnYm+swYj6FT14CYUy5Y3lNrEVns2q0V8nKp1W
         /p8p0F2k97bgbTSQLV6l3Z0BezobsnLJrUHYbv/aj2j2pAWgAhq1ParpBJmMlF6VGvsc
         MfKdSwFs/7ayH5x9Vg+2G0YU0UEm7Eq9oqmMKUHs0eScJsCH1s/VwTE5GVwUp3CvZJOs
         l9IpCVpAI6aiF6d0bYi9KyCtYU9evZzTb2J/ZJs6y0gu2Qpy2AsZETn38oZwglmxMCi2
         NTYjGyEh818+YF3ukOaSTZisvxMxMTJKPb9JPwvlorjnobobaZcBRuhjbO8VtfkZ22My
         c1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814925; x=1750419725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHtJLyTMYIFfJmuax7k6vu5lhjJG1PUEv0OdzzE0zPY=;
        b=VhZLKddiDUYFUZwU3E0SlXMkpyOnu51snhz4cPy+VdE0Nn4aWLXsadAZ54olKgElDm
         gEPEa+ug8+cgOnbrZQlP/6kLcLZ860C/vUNe6YAmbg1b57uQs3GAWroU0/d1DpZNDHoH
         6J7z54sqDlXd6ceY3F/kBnntPkWDgIdldwfVrVbnndqvqxDQUQv69SNo/TBhL2wY4Dwh
         spdcWV1pkidR1G3rThbO5HKisKA9QNAem2VsN0y820+OhWFU8XlWu5xoPhdRw0tLC6sL
         cLSvrlqrkliiPsp9JrPMAKJ6nJAFhgVkwBCENa5sE4OgX8edI+dYK8hRoyMxWdcTkslX
         SuHg==
X-Forwarded-Encrypted: i=1; AJvYcCVxNdr6eeYBnehgT4WYc47eNh2RHT0WMjFXxAJsmOisovC8Aj7rXsp4evpkdZpNskjtNnYEjLdKboMpiJwxbZnj@lists.infradead.org
X-Gm-Message-State: AOJu0YytczJf8/UdcBLD1ao54pOi3uXlJQXwkOnTCCNbZGUl6H86L8lw
	WeJrqa15yTkTX3n/HNTtPfja0vX8g0f+mwRFBTvp7cdy1J4wKHIvbBVyPKKfbxvJt60=
X-Gm-Gg: ASbGncvm98/L/JH+aTigKV6qXmFQAIrgxTQAbD8okIR6D6Y/Efmu0B/Pri/QoXX+J/4
	GL+EoKxyt2u5NEQNm8KxChvvFZklZXtcRo6NNuZ3EtbYfdV+4eXGAOZaLnxxFL1OVCRRWakoD+z
	Chuc+6WZRC8gQd4Lwueybu2oVeYQunfsC2miJIk4RHETd78CRMwtz0FVKwq7txfcrXgq+Uk+c+j
	mGVKmuEl6xBMjPJnsorVlpR0SMNO3wdSwRmAktdwee+jBbUgIXRDBhMGBA7CGATSWSgHj1QUC94
	yB9yPkorGLVnGGcUpVWSEed58cC06inWG3Yi7rRu43vCZEtFFz9z04293ARM+XyZzNYDgU4F5g0
	6VWN+mcez1IbqX0RWppWvpQ==
X-Google-Smtp-Source: AGHT+IFEhBGPIDsjq1frk0/wn96Fw6QfUCgUoIMTWna+hcxXY+/S62LesfKCTPJGDYw7KyfEPMYp/w==
X-Received: by 2002:ad4:5dc5:0:b0:6ed:19d1:212f with SMTP id 6a1803df08f44-6fb3e596a01mr39443246d6.5.1749814924913;
        Fri, 13 Jun 2025 04:42:04 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-18.zg3.cable.xnet.hr. [109.60.82.18])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6fb35b3058fsm20558206d6.37.2025.06.13.04.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:42:04 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	ore@pengutronix.de,
	luka.perkov@sartura.hr,
	arnd@arndb.de,
	daniel.machon@microchip.com
Cc: Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v7 3/6] i2c: at91: make it selectable for ARCH_LAN969X
Date: Fri, 13 Jun 2025 13:39:38 +0200
Message-ID: <20250613114148.1943267-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613114148.1943267-1-robert.marko@sartura.hr>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_044206_248554_60C4B04E 
X-CRM114-Status: GOOD (  12.07  )
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

LAN969x uses the AT91 TWI I2C, so make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 48c5ab832009..ba8c75e3b83f 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -414,7 +414,7 @@ config I2C_ASPEED
 
 config I2C_AT91
 	tristate "Atmel AT91 I2C Two-Wire interface (TWI)"
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
 	help
 	  This supports the use of the I2C interface on Atmel AT91
 	  processors.
-- 
2.49.0


