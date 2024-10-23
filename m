Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0107ACF5396
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 14:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAZtW9NjaJRCd02uPiUXqi3LhoLZg99JQlzHPisrjt4=; b=lX4icr5BM/5GwsAqCeOYY/8tBb
	DS6KMqbASwG6nnjppIQtu8FxpX3/5S6oKnjnf3Au3hq7eqxSoyo3ise+N/lSCqF58vlKu06FG93G1
	/B25ahr3zNXsWt3mobQhILtemLY7XdkIvaanxia4sjRCHRXr6G1+eVI5koG/t1AdPeN8bTizsHQS+
	hP35p84d8Agr5TlT9AX4U+zvKYjbJ2+Yg5gzsw8HwIGRFcqzDPwTbnqFyxIOhqKOSuY/STKF7K+m1
	jpqGwCVXU88mUSr4B0wrEyq1E9OSBKmOot1CUcFG64bDlRhLcsDd3X1Rcd9drARq+X7hrnXgyyL3C
	cJx3vcBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cdG-0000000EnI6-1ptL;
	Wed, 23 Oct 2024 14:46:42 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cZ6-0000000Em2R-0a5O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:42:25 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20e576dbc42so51765795ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 07:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729694542; x=1730299342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAZtW9NjaJRCd02uPiUXqi3LhoLZg99JQlzHPisrjt4=;
        b=HmUxHLwTZrJMbc1eT6EFqjGKz3g8IG79z8Ao30Y7vgXnMW74zuedOpyJgGAb43eedh
         kFfT0fKOszzZSZGmPLbAFw6pjC1+qAf/ej72kHwKZyrtqNf8WriZzrtWOh9PsdmVbOXI
         r52ez3ioNOufbAqXT4G4T94XxZM6QUof2vuMFfvs2p9ihYvUrbnCHWXK+7VcLsQ0+r69
         zvDhQVBsaH4UxVhmHPBapECxWg9xohzSkmYfHpvC8wQYVWBRm/sAGmdKCdpmuolEVHIZ
         CXui/hMWth7gpdoSxf07zTo/tFq5U2REC/ggPiSYtu4xMlkr3JTbgNdfS0qy9x5Jw2BC
         ucbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729694542; x=1730299342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pAZtW9NjaJRCd02uPiUXqi3LhoLZg99JQlzHPisrjt4=;
        b=ab3G58Hl9htgM3b/sGdNbUpSsb08SQ+BqgojBXsAPwGW4bEKHOVE7ZHuhibTSLdOIr
         yiECOZS/8EoyiveMUywOrFHFSTlnQE5vSkGtxlDMeunFlBy/taQAeFlOK1J8x+yDM2LS
         sTJybwJWpRGZKfViwDhw3B8lGOZrqiVASUdyHZ6dUFve/wGDeqksiyuc7t6+jdRduZ/X
         CbPFNnhxokRTAmEwBCNk+0i/+4SM9Tl3xMn4kh7lGAuZYwm7rc9w5EYP6kxkmigR0vTy
         S6NYKynuFIJYlqg/aRnJvAYUgt9H8npDhBQIDJvy6d6mPHk2erxjIWHXh4PHZu+sS20l
         9vXg==
X-Forwarded-Encrypted: i=1; AJvYcCXtToxlx8TjnOXB3px06rFf14QDsuJyVsch64ukFlgK9te3Aytej6rh6n1D5lE2o8ntROEk9zK479Zx6a/0NCxt@lists.infradead.org
X-Gm-Message-State: AOJu0YzLErJI8UcmmJu2NvYHZBblDSGz3GP3ZbASBKX0LP6gtv7cq5Ii
	degObikR/TWtUsaupq3mWgZ4+g8II8OI002ITLUZZb+2lEZBQ1Q9
X-Google-Smtp-Source: AGHT+IHtFI+W2uEX9Bpbgk8Y/oO1hucjnLHdsZzQdADv9NyLsS84aIUvZDstLfDUxYK/QEtVQbGdYA==
X-Received: by 2002:a17:903:1c2:b0:20c:7898:a8f5 with SMTP id d9443c01a7336-20fa9e5c43cmr29315235ad.28.1729694542344;
        Wed, 23 Oct 2024 07:42:22 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3468:366c:e529:6d8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f109c5asm58573725ad.305.2024.10.23.07.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 07:42:21 -0700 (PDT)
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
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/3] media: adv7180: Also check for "adi,force-bt656-4"
Date: Wed, 23 Oct 2024 11:42:05 -0300
Message-Id: <20241023144206.1099622-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023144206.1099622-1-festevam@gmail.com>
References: <20241023144206.1099622-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_074224_203523_ACBD2585 
X-CRM114-Status: GOOD (  10.76  )
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
---
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


