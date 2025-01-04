Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9193DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 20:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BMnEf52UfAT7r8nhxUJ27WGRgof8roegZaPYvjI6+Zo=; b=bQMN+gdWUgMtgsF5IimMllZKwL
	zVTOLrhkPINfCybKWJIC3zJKHtP4SzqsoHD29+qm92fciX3K77PAZ1qa11kERrME9pk+hgm+i/8bx
	AiXm5oImOZKP5c1v/NSJ1P++dd+x6gcb7JzEI7zjiOVw66CZozTgHMnHd4+1dJqCmlI9msNm3Iviy
	5DOPTN33ZKB7kaC1PpryynAfGetChKbWyv3FeBgbHMfKMjX7BVgf+cHB+Rd1F949LBXfCDq3i9dSZ
	DqP46hRmMnKcKH3sjrmYSknTtnjSZIW8LOQ5Cz5MwfLLsyeMF4199fxaERKt0VZ2Jx1moYW120656
	p4SlugZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUBEy-0000000Fbd2-2t1B;
	Sat, 04 Jan 2025 20:59:24 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUBAR-0000000FahP-2oOJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 20:54:45 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5d8753e9e1fso1910932a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 12:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736024082; x=1736628882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BMnEf52UfAT7r8nhxUJ27WGRgof8roegZaPYvjI6+Zo=;
        b=MAldF4Vm3GoMU+3gPGMULakBM4uazhLYHPFLrRqGJDzKN9xkkpcGQ5RgtmS4QEFSf4
         TXTQPZLkCPUYbK+EFzcyibRV2dEYBXpsV+QdbWIKUrzbwx/EmNZcJMrO4xwZnlGl3e6m
         oQb2Abp9au7uv+tJgN720RmOM1xt0Lj6x07MvWFvIzVSO8mrThBvDhJtVc0PvvpCpixd
         t6U5YyZCJV07Tj8gOK3x5OIeISBaXbnlbAzNpUkfKuMX+53KJi+1r2m+5XzI+709K86P
         YiH5yL602yWpt8GG/M84FJ6vqhL0Dch3wvPRxE77tiE723u3FVxiUVmZeDvwg9mC68GD
         tzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736024082; x=1736628882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMnEf52UfAT7r8nhxUJ27WGRgof8roegZaPYvjI6+Zo=;
        b=HHUSkBw9bH7J6ZBE8GjVI1+EXgyu8/gJAdKzQfkoMmiYhm2lyDUgS0sHpZCzA0XJuK
         x87RQo13rJYlz0wX/9pcKpuClsUi02xocpA4k7H8ic971z2C0HnK7PJB1OFzZ9Opwpf2
         zqJk2w2UjcHO9ccgFncDW3bg8HP+msc7vb9QWtBvZBLgNfPAwrJG90HcifLq3T+P+5Ly
         zdyTGbPYBFn2af+HXrf6XDmzcbZNs+cZbU+snZnmbWJfAOzrd2iI7+E67B0ippxKh0wb
         DKNHhF9lXqnzfbo7QgVMUJxoFkI8E0sPsEzzua0y2vjScLHkl7VZHGbi+YlDpSthjNE8
         W1qg==
X-Forwarded-Encrypted: i=1; AJvYcCWru4swv9Kd0Z/0RPolTLeaEGeuZcQW4ApGZKxy592hjl1Fer4CHn6HMjfBFL1ZpeklPEG41jIa3fJVJu3zzM9z@lists.infradead.org
X-Gm-Message-State: AOJu0YzMGIi/XYBPpYoI6x0igHjnBaH19VvTaT/4n5QbKmsIjipw+yY6
	uks15aErL4pPgr/Wd7lBOxxADNYcb9DCE7ZYi4u2GD/8UoavMZ1pmnbhclZANU46dEcxQCFKByx
	+
X-Gm-Gg: ASbGnctBRzwBBxHWan1YOxZg1ne0w6hNQbRaHy6HkMqR4JhNvEizCkDmxC+zsECLAGG
	ZYVmt2d1kXeIsKYkGHQTS/E8UMd3wfsae0O/ytEC7NVoTxaNGmnuBnbraCYljYP5OYg3qKqH8J2
	kb7NdaVwgX4oNfAqMZTzYAiFRRM+mMXjgX8kGZNwBJQXfKS7YQJHz9EOVEi64qsFodkatv6MBhD
	1wCcD+SpxbcdNfaCV/SSA9c0hNfm/X2SP+3MebM9IuHlnudkN5yT9+FIn5dwvY39Md5tOQ=
X-Google-Smtp-Source: AGHT+IFLOaiX+zI3DneKZWxfhc5l0F3vw+qCGBukNa5K0q1p/ZxNgoJYKPDQaaRdI+EszfqyaVTwdg==
X-Received: by 2002:a05:6402:2801:b0:5d3:e79b:3b4f with SMTP id 4fb4d7f45d1cf-5d81de1695bmr17922824a12.8.1736024081142;
        Sat, 04 Jan 2025 12:54:41 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaf4a841749sm839666666b.137.2025.01.04.12.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 12:54:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] spi: atmel-quadspi: Fix struct atmel_qspi_pcal kerneldoc
Date: Sat,  4 Jan 2025 21:54:34 +0100
Message-ID: <20250104205437.184782-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_125443_719242_1E497AA4 
X-CRM114-Status: GOOD (  11.59  )
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

Correct the typo in parameter name for 'struct atmel_qspi_pcal'
kerneldoc and W=1 warnings:

  drivers/spi/atmel-quadspi.c:244: warning: Function parameter or struct member 'pclk_div' not described in 'atmel_qspi_pcal'
  drivers/spi/atmel-quadspi.c:244: warning: Excess struct member 'pclkdiv' description in 'atmel_qspi_pcal'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/atmel-quadspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index f46da363574f..d135cca4e454 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -235,7 +235,7 @@
 /**
  * struct atmel_qspi_pcal - Pad Calibration Clock Division
  * @pclk_rate: peripheral clock rate.
- * @pclkdiv: calibration clock division. The clock applied to the calibration
+ * @pclk_div: calibration clock division. The clock applied to the calibration
  *           cell is divided by pclkdiv + 1.
  */
 struct atmel_qspi_pcal {
-- 
2.43.0


