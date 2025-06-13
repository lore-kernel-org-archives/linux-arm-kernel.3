Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18640C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 12:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hP34e2q5Xb/n9epu9K3/GerhfTkPidCRzY+znM8yDWs=; b=UfF5eZh/ycJccFlz/+XHNqR+gp
	KQ1xmqEo9Xogr0RG7oUKAyEuaDFW9BzmQTKtQjkoeA2IfneHejPoP0xp373/oBtJiCndCKuhRhZ8I
	u4A1qFoyx9ivX8z6NvwtrnqZh/qPlpSPz8iH8yxCU+DAyJykagWQI85bNlUVqyMYnd7APyALW/ely
	GcXJJ+HlEqryzZCTcA9pfC486zXk4SaDajMDUOkPFxGHOm0PskliMXc1lqzViviPOMcPhGIwWpGVL
	a7wX8USaVSpUU+7/7Se+SiIqjwrEaMeo7VrFtZbl97KD3I4iCBW355ChkrWhDBJD+cl2s9H7OHv29
	v6lRbc9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ37l-0000000GJbv-2NW4;
	Fri, 13 Jun 2025 12:03:09 +0000
Received: from mail-qt1-f169.google.com ([209.85.160.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2nV-0000000GFLI-0f9Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 11:42:14 +0000
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a58e0b26c4so35607841cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 04:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1749814932; x=1750419732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hP34e2q5Xb/n9epu9K3/GerhfTkPidCRzY+znM8yDWs=;
        b=vqRtQLOzrK671EIiPvETGhdOeeLWWjfARexXojfMS+zPVwF1VuFTCH1zyYxuz3u7MM
         pOC9mpD586e4VYZ7Pe1d1JABLMOXKrZ84jMKn4DFHHM2Agc1JKlGFcZO8rCN86XgHpEd
         JPRbeGCjBzg7qLc0cUYT6Uln8TftrXV38edNmRSjgG0ddyt5EqUl+ZaHgavuyvVHvKmj
         9yv+ZMc1i755hH/EXSK3EjlxwcvI0Y0QM+nMx1v624d6P3x9iIJNiy2PxvHJy6somBv/
         WrdiIgYLmUJj5QKmChx3vIk6WmIMhC/7uW69vz6bGyzfhBRuOiUqDMZp444KTcWSsWcG
         J/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814932; x=1750419732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hP34e2q5Xb/n9epu9K3/GerhfTkPidCRzY+znM8yDWs=;
        b=joamDXRcIzbrW7g2NvM2mWThf6H23SibGvQKhncdIFylz9jtYC2YuCUjaPUatb1P62
         s3xHNlxN/7BLG5VsGxsc0s3B2zwNW+O+t8WIxGu9qLb8w8vW3UvVSRbIvkqGbcMYVdGG
         ioaguHFak5ja84RrzEVc5VCSe876XUlJ0wowxL6viQZ1B+Fz1K476G6kX0OkUp2xdv3N
         fexLm35cpCDz3RsRJb/A00qOZI3BQMOqEbf/vZXIEllq6PnNNVYqQMKwIvrNXoZI+1Qa
         Ix8VetmkqrLvTIpcL5R7IPCwfKp13aMMx5E80J0NOCzNd836PVk/clx2LHZXDadkV6Pi
         cfyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp2//9SWSrNWFVSPlsNxLy1lRcOcmEy84slgqoiC+2O5asrmuVNqpYYivTuz4pBynwT9TGt69srHpVTg4iVJCR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/MChkafiAvJmvmUkfMJo3pF2RG0nHOVfSLjPnwrgzLCkAzdgH
	HhUk8mnK7K+HejULKDRtmRBdBz5IpWpYvyw5PqgabUlmC/++ZBHe3txJtmygLLoyENo=
X-Gm-Gg: ASbGncvISthNrFR7v19otfocFEIbUBJVNA6IgGG7FAVxTdHor55Sy0hZv9l3zxdWHCf
	C3tGLhLJK2sMNqu/eBBv4y2ZtfDEkD2hna06h5N3FxsQNsQ1hZhT1rsRUeYKEF2GxwdiXTVXpWa
	nldnKE0fQv8ReL+J1WJSrdO22fh1QZzOz6q/6CPib9uHAAIHIlKW1nJtDbB4aujouFEPAEj5WXb
	anzvJDGyhS5pv0QuuZa4XQNr54xPEqEDVZusi89nJvfy38KiLZM+z1DyrZ2M5dNhiaBdBfxiyrW
	DzI6NAjub1xVyMk8QkYJ5JdJCfA2+yMVBNC4BmQtfZP9XX3/lETpTjJEJsUcvhoaS7KoRWI65Qg
	H7qNeLCsaVclarqeK4KHR4A==
X-Google-Smtp-Source: AGHT+IEvwSeOVrcJVMZPPA8Mgajhh3j4DaXHPn6mHw+5/rNyArLRJaLGgxD9f3JE53WDOm92ws1YcA==
X-Received: by 2002:a05:622a:4807:b0:494:a447:5bbb with SMTP id d75a77b69052e-4a72fec2119mr49140131cf.16.1749814931845;
        Fri, 13 Jun 2025 04:42:11 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-18.zg3.cable.xnet.hr. [109.60.82.18])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6fb35b3058fsm20558206d6.37.2025.06.13.04.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:42:11 -0700 (PDT)
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
Subject: [PATCH v7 5/6] char: hw_random: atmel: make it selectable for ARCH_LAN969X
Date: Fri, 13 Jun 2025 13:39:40 +0200
Message-ID: <20250613114148.1943267-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613114148.1943267-1-robert.marko@sartura.hr>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_044213_192359_370AFB8A 
X-CRM114-Status: GOOD (  12.12  )
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

LAN969x uses Atmel HWRNG driver, so make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/char/hw_random/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index c85827843447..8e1b4c515956 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -77,7 +77,7 @@ config HW_RANDOM_AIROHA
 
 config HW_RANDOM_ATMEL
 	tristate "Atmel Random Number Generator support"
-	depends on (ARCH_AT91 || COMPILE_TEST)
+	depends on (ARCH_AT91 || ARCH_LAN969X ||COMPILE_TEST)
 	default HW_RANDOM
 	help
 	  This driver provides kernel-side support for the Random Number
-- 
2.49.0


