Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6BDC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 11:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQN/bMgjVGfwRUkyGr0NCKJga9lw/it44spHsjm1iCc=; b=GnZz+6hRsp3RYy7DgowH4jpbb8
	2tfjgzWJ7I0opmFFrgLgxiAnrGiIJjVHU57F3uDDRg426joYV+s3uoFJT+rkmXsDYIxoUSOmDPrfM
	NkWjEbwIcsz5Khg6oOeHExGc/AKBwl0ThwoDAMqXbPn807yZW2AU+DW+QO2CIeO9+vKy7qyjBijCy
	aTQLQxjAnq4VAf6bpU93Cufg5tBiC7oKKlbSThEbdVp9ebzljBBy91R58WzyzXHhYTGxKJktIR0Qr
	dXg7A8ogoxJu0wHhPI4wJhX/YALUI+fnQMljApbcpdK9aFayDer/gpV2zLAsi6REBb4AlPeuEOhao
	cITIDi7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGRf-0000000HYw3-47gb;
	Sat, 15 Feb 2025 11:34:51 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGKa-0000000HXId-2Fo4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 11:27:33 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38f3913569fso75065f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 03:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739618851; x=1740223651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQN/bMgjVGfwRUkyGr0NCKJga9lw/it44spHsjm1iCc=;
        b=gYTbn2do+QCq1pYDOU0+pRu1WLp1I39YU4cCw3loormIjNwqmmfgarftybdolp3DAg
         C7p0eC/I8n7io3ONqnIESrJjbP6EA0F8gFeEhZ/z/5uXxmfFpdqAsZuj7vi02IReaySZ
         nuliO51NEac9DCS6vhDHad6XBAGcUcrchfoU0mnWGV9y7m/TV3ze+CHmM51sTxqlRETl
         CIVqwE23JVEZYlTXJRQFYUGWT5vSoGYwErHNxJM3p2zp2vTCG8SJ5gC5xYDOkooFxa9Y
         LzcI8DaPp40bOdMKT8RXYCZtZYyUzGSakJL2RWhC8MzEr6kMaXr6ccdAkfcVzD6cgHIs
         Yybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739618851; x=1740223651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQN/bMgjVGfwRUkyGr0NCKJga9lw/it44spHsjm1iCc=;
        b=gQfVH2pb+B5gSociCGVwr8ylAAwnbsMZSjPGaltLVk70Jd8BrqmTGfrQUghMCp+flA
         Ckmq/3D1Jx8EQ7QxqKZ7D6VdqJ24ZMpUi2yzLDcKVfUrSt+/RWmPB7OBt9XNOw0Y0pAm
         Lp9i2vm6M2WEwNwjHjSrqIfkR9J/uPp9R4gdyrwrd1yWt/2o7bdOK+9M3LK2LgnaSrbj
         AewpzU4Z2fcSu2JLMPBkGDdSOi88XTs+QxDg5hOPZGDLuNL0i7mS9kc6QsP92Jg6V9gW
         Apq5lT/U/HRMhxvydedbkY3R/qJhycnojrqQTRHdDZQ28eo+ivagI2U1gpor3f42+xas
         8CGA==
X-Forwarded-Encrypted: i=1; AJvYcCV5jkrmFJ0SMSe4ag2UCY5T4CBVsSPjmfbk33M5r9f/2HKk6tQSpyef4EW8ZJ6MoXwf25Tr/K7CPVEgQfkNif7u@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6t8h8Tsd9sg1ZN3ShAjHTJuXKRfI24GoZzTfhJjnOgGG0jnwP
	ULVgr6YDugB+iVEdJJ5wlMv0FU5vts+mHBs9gpMeTQuhx4poKMHLVYdFYA==
X-Gm-Gg: ASbGncsIZ1v+v1rJIs3TkTY5/LgNAVN+FC9bw0VL4jZ3igXdbBcdX1gwHKlqoutgr0a
	Vo4Lr5+aDDKHx3/ZWqFvRFlFBcflINsrufZAEpLpQVkMnXoi3m+7C2A1WqjqghocKfv066WYTmY
	EuKuwEHfwRa3ivgfJCZ9BEdk+8/GGCLayW/2GZK3lMyCWVn7DTeDkPiBnrwl3nP/Wicrpihbb7J
	Zt7QAdRoshBWHUVOds8j2dUHXNcHOnV9e5Zacfzghgs2DIUhTDnAJMNbfhdSkfgMZ9wIgCTCrvr
	kVEhvyVKXB3uaiCvH9t1nY5cS/9d2u6aEhMwXJmLx2dEk/8jIs2GzjTbPoN0wHJfzGU=
X-Google-Smtp-Source: AGHT+IFg4nTLIznOmcCMhlH+TnSI8qUzjkBmAfYef1pfpNZSAHDfsvS8VTnrtO0ZfrE4sW8fKQtgEA==
X-Received: by 2002:a05:6000:1fa2:b0:38d:c74f:4234 with SMTP id ffacd0b85a97d-38f33c312dfmr2410960f8f.29.1739618850817;
        Sat, 15 Feb 2025 03:27:30 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b410dsm7018841f8f.5.2025.02.15.03.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:27:29 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] soc: samsung: exynos-chipid: add exynos2200 SoC support
Date: Sat, 15 Feb 2025 13:27:16 +0200
Message-ID: <20250215112716.159110-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_032732_573767_0E5112A0 
X-CRM114-Status: GOOD (  10.50  )
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

Add EXYNOS2200 information to soc_ids tables. This SoC product id
is "0xE9925000".

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index e37dde1fb..855bd2a75 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -56,6 +56,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS5800", 0xE5422000 },
 	{ "EXYNOS7420", 0xE7420000 },
 	/* Compatible with: samsung,exynos850-chipid */
+	{ "EXYNOS2200", 0xE9925000 },
 	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },
 	{ "EXYNOS8895", 0xE8895000 },
-- 
2.43.0


