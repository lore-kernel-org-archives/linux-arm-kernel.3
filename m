Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20C8CE8E67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 11:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYA6MwsxWjcmrD99UvE66aFNc4oikmDVt3WjcSBcC5c=; b=pWdUfSNLxS3r2na6lz5ucBVGHs
	zdZNurVYyJvpXStr/B0eDD7h++R2fIAUXKJvmTHQ4PcmwEym3xAHNr1snwVK0kHFyOl760YzdPoYK
	61PU4tTnp20IF9Lx1htB4TZG31SxGm1hs7GSltlj789uWuTLaPo9HG4nqVLD5h/W8K4zAkTCMhX/D
	yjj5NCmJoY0mc+RymbY4XNJ4cBusCWLqdllyRiWgKyKVJ3HY0fhXK2wkSvoNhxAC9TnRY8FZaRx8x
	HkxLdmA22YXn8kYO6q+HIaw3JsDSc9jbC9Bus0bbm+ZNChb+Aweghcj4eP0AK7Z9cm/Ws5NylfKkh
	jTvsH8BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wNx-00000000Fxv-3vQo;
	Thu, 24 Oct 2024 11:52:13 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wAw-00000000EVt-3U2S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 11:38:48 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71e70c32cd7so632070b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 04:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729769926; x=1730374726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYA6MwsxWjcmrD99UvE66aFNc4oikmDVt3WjcSBcC5c=;
        b=gJ6ZPVvgWHu27PvlYfbBsSgjttoGilORavbPRq/HEF5/zoYAJG1kukaiNtZChQK5SC
         +LN6o4zgiYuCG1ZeG2mlOMdl66e26RlqBXCm527txLOAvNMlkVm0QTfTGy/tqE68xE7m
         XsFuY/+QWRflUqqYjizA0qhPA02eSidUW+hDWkH0lVNlvR/mVewTfag1uhU/PWifBqUf
         A8SYL39KgJePYGtCmkv6x1SM4MDGovOYym135RinNK0XS6dPgMLYadtUeIZjH208INT/
         0mFMfCgGbmnmRNcrru0UJ0Kg5GmkIGMwz0AoAjYwYh0tegSpPkUrRKkBUX0xUt0Fq99C
         WAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729769926; x=1730374726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYA6MwsxWjcmrD99UvE66aFNc4oikmDVt3WjcSBcC5c=;
        b=wwy4tb0DIXj5g0h49UXZWBEZ8KptPXtCQtiDwM8MDQk/cVmPiEg+imFmgdxHjfC9yK
         kUfp9WZ4NbMbZAddqDdH0ZSSi+aLpaCjoXD16z9VrpJdG+IxYV1raNj5xYogj3RG6gAj
         RDICc7baJ5p0WJO7rCBMYbjh0r1EjDiFXfcy25gMOttUkfUiNP5KzQ1bbAlBCNcFD1BB
         6lLoYZNkc5ODkaG7Pr1r2HAMrsUyWVzreVYRTO/Ng76zLWb9rIe85YEisaXVUhzzlZqR
         t2j0zM05U/KxDdqibbPmLoEogXRg/nigThHbO7GDP75agHoSbf2puGZ9Em/V44I7/cxA
         Ub6A==
X-Forwarded-Encrypted: i=1; AJvYcCUFIR6n4Ql9qXIKD3AbTBjhfB8NV9rzHCqjA5uoKpevtZG2SCpAFlrKoRMfWu90w4F4ygiLaXHgSQK1w1jvYDwc@lists.infradead.org
X-Gm-Message-State: AOJu0YxFJ9AoSNj5sk6r3dUgkqwYnJHD/m3Z7Cw3gig5guwVnnDRcQAy
	ZsTZnu4kf+An6rv2wZgkcxvmEU8BqekfES+7nuN4NBb9jT9MpDe1
X-Google-Smtp-Source: AGHT+IG/2FgtWjx3qeOywMDdzdESnKsFTTYJLhclmPbET5MpWNBPtO3icarH1Lnvbag7LFcZj3uzEg==
X-Received: by 2002:a05:6a00:b50:b0:70b:176e:b3bc with SMTP id d2e1a72fcca58-72045f8a518mr2099304b3a.28.1729769925883;
        Thu, 24 Oct 2024 04:38:45 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:248:317f:2ba9:e66c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13d765csm7798029b3a.115.2024.10.24.04.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 04:38:45 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: hverkuil-cisco@xs4all.nl
Cc: lars@metafoo.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	francesco.dolcini@toradex.com,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] media: adv7180: Also check for "adi,force-bt656-4"
Date: Thu, 24 Oct 2024 08:37:52 -0300
Message-Id: <20241024113753.1353023-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024113753.1353023-1-festevam@gmail.com>
References: <20241024113753.1353023-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_043846_894217_3B40FC72 
X-CRM114-Status: GOOD (  10.43  )
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

From: Fabio Estevam <festevam@denx.de>

According to adv7180.yaml, the correct property name is
"adi,force-bt656-4".

Expand the check to also test against the "adi,force-bt656-4" compatible
string.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v1:
- Collected Krzysztof' Reviewed-by tag.

 drivers/media/i2c/adv7180.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 819ff9f7c90f..ff7dfa0278a7 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -1440,7 +1440,8 @@ static int adv7180_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	if (of_property_read_bool(np, "adv,force-bt656-4"))
+	if (of_property_read_bool(np, "adv,force-bt656-4") ||
+	    of_property_read_bool(np, "adi,force-bt656-4"))
 		state->force_bt656_4 = true;
 
 	if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2) {
-- 
2.34.1


