Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360E8CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 16:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6ifxHkAY/tZiF4oxsD8xCvN6uBTURhwZ8wJ5XnK2n8=; b=XIxXc6kSFTLmsZbcmw9qOVOVHJ
	4ByeQpzRi+bFp43KpED2QeNKOnkQC1/Upw/ze0HtANcs8w38pCIAyL+1tO8svapxFLYo/k9BnvQFU
	R0EfxA5pply0rUTe4PRpWLKxCr203+uXLop/xd6y4wh8TYpGkbVgFWTKEegF5gE+SRbgsKPAa+gyX
	OJ8JV2sjw8DwBzW4dpig9Pn0Dl8j0emBatDaAfBYyqFUvj3W9GmNuQ3+1q0m42adoSs+M4+KvAjZH
	5jmKLxSwo8WRpSbCODOStPHdMhvZ1z4IKQ/SF9UXVWQSuOSMLk6oFN8InxJ7swG45fFlrKZUT96bz
	lAWqMsfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEgn-0000000ETFt-1U9W;
	Wed, 13 Aug 2025 16:51:01 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umE9L-0000000ELgh-0ZkT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 16:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=p6ifxHkAY/tZiF4oxsD8xCvN6uBTURhwZ8wJ5XnK2n8=; b=DS09/O
	0K686u8BmHmwZpkwG52hEbHrnRQR1VlNss8o/Kvt3SNn0m/QeA3gozRxZD6x9Dks
	EywVc2cwPG9nxSiAdv4sAL60NuHiNuaBEOCDKMh+enjxa8djmb1dt5l/6oaDW1i9
	RA9GFHQA49sFMpk4eeG03IiUZrzqPiojyT905bwXrVC0Gvp8n/iaIx0y03HpZZbZ
	bYZb3BgMj5bDTQaS+lN1JH+LDnpW+FhGI8Dud9HtTdCoP7/VyHjKy1LrYkiYAzk3
	RclIPGqY+XhDG26y+Vi/YG1AvrDAr7EWo46yl9G/SEeoDD3tiep+SU8noFhW2nPH
	/XmMNH9PQthPBV4w==
Received: (qmail 694902 invoked from network); 13 Aug 2025 18:16:11 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:16:11 +0200
X-UD-Smtp-Session: l3s3148p1@eqOaeUE8FtttKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 08/21] media: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:14:54 +0200
Message-ID: <20250813161517.4746-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_091627_447012_D6FB7276 
X-CRM114-Status: GOOD (  11.03  )
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

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/media/cec/platform/stm32/stm32-cec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/cec/platform/stm32/stm32-cec.c b/drivers/media/cec/platform/stm32/stm32-cec.c
index fea2d65acffc..1ec0cece0a5b 100644
--- a/drivers/media/cec/platform/stm32/stm32-cec.c
+++ b/drivers/media/cec/platform/stm32/stm32-cec.c
@@ -248,7 +248,6 @@ static const struct regmap_config stm32_cec_regmap_cfg = {
 	.val_bits = 32,
 	.reg_stride = sizeof(u32),
 	.max_register = 0x14,
-	.fast_io = true,
 };
 
 static int stm32_cec_probe(struct platform_device *pdev)
-- 
2.47.2


