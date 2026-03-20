Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC95109318C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwKh84aPEwlbOzcwKg41QhnYITbrVcHTcrSie4jnTPo=; b=W35r7TcNXPZWyjWYzTQCzC6Wep
	vGYzYKA8gfgvTtzatH5jONXmSmLO+A/qEI9rUdfsjhkfnEppypB8Oea5IH3SmMU+gGqfF/eC+HZIX
	gTZyCht5Pi8RoFGaMG/bLAxwUDiqJlXLeRAS+tTy0bXcwD2tymy3x19Mc9BQeNtjNvF/n8ZJwXepE
	YDtWUVyWTBq/U0zPIBLHI29KzbCC7/MrYJ63VzIc81rvZHtIaG3GIezG2kcsKz6tw8YL2/pM2FxXi
	b9mDE2A3CuWLbK1lt23elwY4pz4KeT3Pbmvyan+ghbiogmjWs1GqxooxCVz1p6Aj3rq25Kw3ZS/yU
	frHyqBag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VHQ-0000000CMLz-2SMx;
	Fri, 20 Mar 2026 08:32:28 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VHM-0000000CMIH-2flK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:32:25 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c741692db4cso470972a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 01:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773995543; x=1774600343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwKh84aPEwlbOzcwKg41QhnYITbrVcHTcrSie4jnTPo=;
        b=On3fklCwI2NmAozmHU2ONTuGtVgJyJ62Y5Q1gEjQu0Vfa3AQuq446FTdAOAw+MzKQ2
         9PN/JxhXjHtSG2CnUeyQs5Z8DgnfUi8dl5K8Urr281V4yf4uC4LkA6A4OnnYmZP0GkcH
         EEGWRIIYw0OM7UGuu+fZ+c40JOVgWDeUhZVIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773995543; x=1774600343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uwKh84aPEwlbOzcwKg41QhnYITbrVcHTcrSie4jnTPo=;
        b=G9Xrbx/e6FsM9OXy4uckwKv25TARYdIQyhv6AUbEES8abspuhsGO7uDdUYjAqG0zxy
         SJDYzesAdcv1ao2WANMR/rNgTS26XGQHxt/iQbmHhDGP6RX0dc+PQFDk4McpRcdrmdJq
         VkogYVSlWiNcC/Kf/BnJemGlIWx2SN2/fwnVT64Uv2hbF/fUGaeCeUjWFgCiZ/OiZFyz
         1T9onuUPAKTGUNSOopcKOLPtYr/TSFbdGZ9zeV/MCIiRM9YOrVXDA1g4nayqIx9xYEHh
         IWYqa0tuURN2oW+zhLoafDgPyDGVJpEzyQmDo3W6LkzTj118/TimXROwmDEoLYjBm6hh
         +7xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmf6EiMyjcGm53YXZ2hA44NWcgj5XT6fcOTKdUZzykQbcA7MwbzT4Mh6K+AY8MspLVgaETcQSeuTOyZ7wn4Bs1@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3TwVMKasxUSM4m4ZJOJA5X2QFadSYMCKq6LfiPwFfc+aWamtO
	M8WhHR2Klta9+MzUaSms5p62WXhENRmSAjd2ommbtpq4KqIoYguehl0lklpNWbc1xA==
X-Gm-Gg: ATEYQzx1IYvfWUfdXtx5NM+nZEZ3oVzrmbwP7JqtNyragDLk7/pMdERI4XjFpPbC/ZW
	8RV23ux6APfZKZ3OwrtvVYShsdjDdguUb2E5auls4FQP7SEZukLeFI27BV5mxUuVOEozQmhxGPl
	fQA+kJkHeq0LI+nkKmpnRd5eF4BcQeDCCzkUznNyThmk76SZ5C6kdt4KTE+KDeKTDtMwrm9+h9U
	+oeJXjvUXB6jJz8GikqlhzLG3pyileIuAz5GtKmxGiMEWGXBRXhvdLMhvOyv/r5V/BIFZSFPe3w
	gc24u6hu8TNVqHD/K5ukEC/ftVSoVjde0ZZR/n1qW8VRuc0PvZ8sfpYVCZsK8FYpmJUuooULAeD
	kgenFict/uTSMIWUwCIGT6eMQrYAKrnuShrHFS+JwICtptGn8++nQGJYodPlEXoxzsPhHSeImkV
	bSSSRRNMEkK0e/XdGrHdMrwwtqQ3Ur4c/Fgfvlbhi02GSelhGxdcUvPANvlIPPVTjnN1q0PsZfE
	E0vNdb0
X-Received: by 2002:a05:6a00:2e9b:b0:824:3ef6:a815 with SMTP id d2e1a72fcca58-82a7a80b69dmr5877135b3a.8.1773995543605;
        Fri, 20 Mar 2026 01:32:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040debf9sm1408816b3a.47.2026.03.20.01.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:32:23 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 2/2] regulator: cros-ec: Add regulator supply
Date: Fri, 20 Mar 2026 16:31:33 +0800
Message-ID: <20260320083135.2455444-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320083135.2455444-1-wenst@chromium.org>
References: <20260320083135.2455444-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_013224_673361_B3532939 
X-CRM114-Status: GOOD (  12.48  )
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

Even a regulator remotely controlled by the EC will have a power supply
input.

Add the supply property name from the device tree binding to the
regulator description.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/regulator/cros-ec-regulator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/cros-ec-regulator.c b/drivers/regulator/cros-ec-regulator.c
index fb0767b33a36..aec275fe1f44 100644
--- a/drivers/regulator/cros-ec-regulator.c
+++ b/drivers/regulator/cros-ec-regulator.c
@@ -183,6 +183,7 @@ static int cros_ec_regulator_probe(struct platform_device *pdev)
 	desc->owner = THIS_MODULE;
 	desc->type = REGULATOR_VOLTAGE;
 	desc->ops = &cros_ec_regulator_voltage_ops;
+	desc->supply_name = "vin";
 
 	ret = cros_ec_regulator_init_info(dev, drvdata);
 	if (ret < 0)
-- 
2.53.0.959.g497ff81fa9-goog


