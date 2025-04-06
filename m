Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45783C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 20:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0bCgywlp6kaDxRJG12fl3NMTv2SIFaAtl9wSse2RnE=; b=49IAgFDdClmVz/EL9ef2iUz6vH
	iMgQqI1urcWYKOv6EvRJ1vPXauAZEvjzPvYz0KmyYU4VtxKL8yLq67h7ReK36NNlwy8RJzj/y4JiW
	pOsiQHq8weGeXLSJFjGy2Mbug7TuXJpXIKDy/D37qiV2E6nNv2UNZpnDD1EQipNP5cOh9vNcZOwSY
	O+bTCpK4xTkQT/+NXM4cVwTCKl/qas8Hh1IhufnmNMt3TmT2p8BXi52K3h5BMMQ4BVL1cEvobv9TN
	r2A1REmm/Ra3B0slN/kwf6F18AzkbFdEDb0jJbiDqsJJ4+Z15herbvY5+BZaEw/S5i2o2cHxPgMiT
	vmKKPjJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1WO0-0000000Fl3d-17ss;
	Sun, 06 Apr 2025 20:14:32 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1WK0-0000000Fkgc-0dmv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 20:10:25 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-391295490c8so469373f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 13:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743970222; x=1744575022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0bCgywlp6kaDxRJG12fl3NMTv2SIFaAtl9wSse2RnE=;
        b=eOmiPNfqyhp+OdT8XEFT0nsscC9GCxJxezOhtb/IRhliQFA3X/di86ja1XV1uGmjyS
         U0Q6kw0y2K4zqETO4naTOrGr/oytaVgoF831b8lcrrV3J6sH6u+3/LuIIw2Hcd6XFRWr
         if0BwlUZeXJv9lfasraeamGNf7sTTJQPRUDTFk6euy8LPEsZEn9cShHQZ90tjME3EP3z
         HJQsvmvL2sicuFy8IL0MNZOMka2I7sd4LwTTSA1KItiDbbISLhMHzJCk4oUlIFL5omHO
         +Bvdha/yT3FHLDoh1dtQaFFmVXXy5m7bJUHIQApp82kALeKd2+orm0g1rzs3t6YXHO1e
         YQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970222; x=1744575022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0bCgywlp6kaDxRJG12fl3NMTv2SIFaAtl9wSse2RnE=;
        b=Mx98fve3ONW6QQulVTe13SnDyTG0KNpmp6E1zxBPQKltmEevcNbiga5tmQmVhZNrF1
         dtLIRoZmwrmyejaxUvOxpoWkDOtwjTKZJtQSDDsqQPHWG7FjohihMHybZX0c1t04L9Ue
         4qO54SVa1PD0LUMojQ8tan7kLPqBjwjVcrP3rcrr31G5bbE6wUETlR6W9OsUZZSVtKIr
         61ApqZ8UDF3MibNxl6aDvliWI2PxwPhCnRLaCH2HzaC8hXGvsz9OM6GXTJxEyHPhkW5N
         sMGj1NMr60VfQxGao7g4nrlP1z/Eknx1oiqsZH+rDbvGlId2TFZ5tnLm8UHHecl3fed5
         dQWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPi6nq0acyzH8jxBzBX1UZyBvpkJj5HM39I9KAq9DHocwnTkpAnVFmkRUUNHXbAxyUvSbMmBylWWCJ87CnLMve@lists.infradead.org
X-Gm-Message-State: AOJu0YwpuHLcy4UJIpoz+eMLbfOsRlFZNTcJS8dakDMzel4qsTXvaH4r
	TcQLUHKhwCUAL663cPTeoYkdAZoIuilkikVlYBHjsYyp6zWghOuR4dbaj1ShCd0=
X-Gm-Gg: ASbGnctMRaFD9ZpPAUD3tX5514Bkso4qgDqi2j143HItvglCkG+Td/CgpXfbkq/HdOw
	F0GvMCHWiQUPz+Zw5pgBiathEQ7kPbwq4PNoTNqlun7B8P+MlyCUh2NlXaMX/S/vcoTxHljICus
	96uCljx6p9yDOIvqrZGUu8ax4eO9K/DQyi+VPEY+OLjUBs+wCLEk5brcSh1Q3Tgf/MKk8cNujCV
	ZPNJPmjaWHxEAYPy3ctzh1bZ4GkpwkeITItFUj9pBAoer2q5qT/A3i+uAZ+5HnUGylxIbLMv42x
	AZwvkp4qthFiZ6BNcOxIc3HVEMiXUMGLZ2OTKlwpz3uxmau0drPPsw==
X-Google-Smtp-Source: AGHT+IHX4ogO0j9l/DVFfDe0o53qqxRjbgFXh9pHpQJLcNqGVqDaNvFPF3GPRIgR8kG8COOn0609yQ==
X-Received: by 2002:a05:6000:4022:b0:391:319c:193f with SMTP id ffacd0b85a97d-39cba93cfc3mr3063727f8f.13.1743970222445;
        Sun, 06 Apr 2025 13:10:22 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301acec9sm10080656f8f.40.2025.04.06.13.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:10:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] Bluetooth: btmtksdio: Fix wakeup source leaks on device unbind
Date: Sun,  6 Apr 2025 22:10:17 +0200
Message-ID: <20250406201017.47727-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250406201017.47727-1-krzysztof.kozlowski@linaro.org>
References: <20250406201017.47727-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_131024_191272_5F24FA16 
X-CRM114-Status: GOOD (  12.20  )
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

Device can be unbound or probe can fail, so driver must also release
memory for the wakeup source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/bluetooth/btmtksdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index edd5eead1e93..566c136e83bf 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1410,7 +1410,7 @@ static int btmtksdio_probe(struct sdio_func *func,
 	 */
 	pm_runtime_put_noidle(bdev->dev);
 
-	err = device_init_wakeup(bdev->dev, true);
+	err = devm_device_init_wakeup(bdev->dev);
 	if (err)
 		bt_dev_err(hdev, "failed to initialize device wakeup");
 
-- 
2.45.2


