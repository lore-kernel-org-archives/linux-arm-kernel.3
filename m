Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC58310F3DEA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 16:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mh8F9k4/dinkDW3+fSJ68XGmJrivibpzhc6HbsO47Hg=; b=UEZ35DxRBVMC9A
	kiZn11KezIFposu1iL/gHo87UtZvcflJgrGIE0NcTR2tnbfDCZQGIakmed+FNlK7dFqZEFmhCFAyk
	yR+nunD+64wDPVLNQBIve6wVZ0/Wr26fE2QKjq/1X3JlX9D1FHYhdbBWcm5h2a+riUcTnH7PvAH8I
	z0mEJlDXQztKL7dXvj0d8KnfLE2YOudoX862cPi3flLW4XHC5oEgKUfsbl4yqyQUHffARiRUd2Tox
	7miqenXfFIrkwk1WlOjcNCfWXbD7i2iq7B7wg6flSZvy/ygbiu5580EJ1ij28ScuMmNxwpPlkrpKw
	P7aRqWx67z+cNfpk0Mqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6WBu-000000095zB-1uFn;
	Sat, 28 Mar 2026 16:07:14 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6WBs-000000095yq-04HG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 16:07:13 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-35c124d2613so2104350a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 09:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774714030; x=1775318830; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mh8F9k4/dinkDW3+fSJ68XGmJrivibpzhc6HbsO47Hg=;
        b=UKTlqYVCoYc3nmX6aPU67GIBkvTvgVg2WLpoZYWvotpkUMAIuDOyHkuX39fB+pkLML
         OLWldbhFC3xehaNFj94571qZy1UW9IWAX1c2+jL1dg2NKWn5DOQPIxaZz++IKVvUDa6k
         9LaZBaemj+4+Bl7yRLutQDXs7chN/xlHZ9G/MLJy5+r6xMZ4HnizLC2/fNPtL+3MA7EO
         gbF1rPh7g19UdMUiiW9vB1YIevPb+liP4Ykhz2BdhP0xfK0OIsP92mW/zKXsr/0rZSnm
         zZPxligOpke77sApuHI1/VeltYoa7+zNIAyGZufhorKfYcKKNpTmKh/DdHnLO0mPBi9u
         f9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774714030; x=1775318830;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mh8F9k4/dinkDW3+fSJ68XGmJrivibpzhc6HbsO47Hg=;
        b=dfi22pGlXFJvftPKBxOWvv01ftu1ysmbyGE9FLxsvKkuuL9LtrEJQJ/SuS1ce+WK7a
         HPtKfamyR/hZTFdrMdFkR2T+9CxvsvspIakPWqArsF0KbA6R2KMOu4jV6ivUuLaBciQr
         gFXncWeT09oaUoqUvESeq1YO+URFWLHozRcy4JC6t5A4/+p7wAlPa4UL81m8Ep+ADCoj
         flDZRPzsu40kmuoDpHHzVdEFwHtrjuX8SucupABgS0cjGIxvLKJAMN/AEtsjfLs1Oouy
         dM02l3pZUYuS6QWZtscU2iHQmTguSjuBGsevtNm8uf58Oa3V/yv9XhHpmNykiqwGi5hO
         fYvw==
X-Forwarded-Encrypted: i=1; AJvYcCUg9yHcMvejwvgC7JfzFLSmKTiTk4FsJK5ioj249CHkjPFsnEr62T0MA1meuPQoha0d6UhotkfpFAt9c2I01FRn@lists.infradead.org
X-Gm-Message-State: AOJu0YztREHm5rN6RW5/ADnSXi+1TLhcxWJ8Dsh+oTztXq73Z71tgCre
	5YuFbiv0ATm9lOWojf+v/jVfqA7Lo6ZxoXGqZSXbmmz2em/KoZXjhaGC
X-Gm-Gg: ATEYQzySOxx/MorwTPtnrtJWH+WahnujycTBuVzOQuh+mkfI2MVgwRx7O7OxtSDiY2g
	KIJX4DgZm/D1ZNCUamUTmVoiPkygPCAIR2w7HYNS1R/dhurWG1H5tFMKXUX+FijNojj42kMguKR
	KFnMOIyTOs/FQU4lnH9D8z7eg+XLwe6mvpJibsjrgVDLnrlV+51X72sOsSt2Gl3i7HL/WOzCOAt
	zQDfp0nkM1kL19k7XgHp1I/mJbSB3CV9KyVOn0DJCVCMYy6UJRpX7JV0osLQpkg9/0ijY8QPULs
	wb4HZz8qEGGMm4DNKAVd3GVANcCeP8+8DYehTxV41V4ErgVEBOBlDWBgnjGXYYWz+938XeRQ3cr
	Hw330UosYKmpl+O95j6nwC0aTafHMcqK+7aAZ25eTa3w9G1lJepaosKx4iE80w1KyAYntKYWVwP
	Z/7x87RnUUinAQ/K2llB936lQeVGBwml3dCg/Y
X-Received: by 2002:a17:90b:4b4c:b0:35b:e591:99d1 with SMTP id 98e67ed59e1d1-35c30115bf8mr5974559a91.29.1774714030368;
        Sat, 28 Mar 2026 09:07:10 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec27da0sm1988140a91.8.2026.03.28.09.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 09:07:09 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH 0/2] spi: stm32-ospi: two fixes
Date: Sun, 29 Mar 2026 00:07:05 +0800
Message-Id: <20260329-stm32-ospi-v1-0-142122466412@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKn8x2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyML3eKSXGMj3fzigkxdsxSj5EQDC2Pj1CQzJaCGgqLUtMwKsGHRsbW
 1AKuhUnpcAAAA
X-Change-ID: 20260328-stm32-ospi-6d2ca0833eb6
To: Mark Brown <broonie@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774714028; l=458;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=Bp6FqcuqvbNaOb4ln+t0fQhjjxmyiJc3wIxmGVnK+W0=;
 b=6Gs+lZTSrrDeaFeCljm1jglrdrUxEIJ+DaahhE1qGO2T/H/LZu0YUfCncOMvDLG4FCni1kwVH
 aHSXyDFyhHnD9e87xgGgrciIUZGsIMgG6dWSAeKw6Bxt4Dm5lQY06am
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_090712_061062_4B25AE1B 
X-CRM114-Status: UNSURE (   7.27  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Felix Gu (2):
      spi: stm32-ospi: Fix reset control leak on probe error
      spi: stm32-ospi: Fix DMA channel leak on stm32_ospi_dma_setup() failure

 drivers/spi/spi-stm32-ospi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260328-stm32-ospi-6d2ca0833eb6

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


