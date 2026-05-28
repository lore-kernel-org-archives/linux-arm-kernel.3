Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37904CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 20:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CggQBmAuhU/vixgo6EEwOoNqb/en0xhwekKbF0wLXKM=; b=qYsQNKPkXasSxDMEDK73miHhrn
	lcbA4qUxJxLUA+cwNzlwyN8gIudyPpLUk170slogkBxLL7uN2TyPDHwUNSNup7aDB3QLcWXxh8iaH
	YRDFJytR8zidUGn2N6EHqILrnXVkJVTwoboUtKXOlFv8K4AAzZLqbULa0btK+7i6m8/J+M+5QwjcH
	ZHhJKuc/8/XuC6hzmQ4izr00rBoTbfts0E20QDh4isdf+ni6EijkgifwCXMqI1cH/GBfaR/kboxO2
	xutuxHMLjoFOPNgVoXuXAP+I/QdKTju5iZsAw4RmHYoY7Gfbuu0bNAZeqZf1v8/aUoahl47xjWqsi
	q06kRItQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShI6-00000006LUX-0qRd;
	Thu, 28 May 2026 20:25:19 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShI2-00000006LTG-1gUS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 20:25:16 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3697f25d26eso7111803a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 13:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779999913; x=1780604713; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CggQBmAuhU/vixgo6EEwOoNqb/en0xhwekKbF0wLXKM=;
        b=cO4aSrqFoZDdNJ7MwXQ4v7inUDc27AS/ZiMJ+C9VPquibcF3uMwounTG5k9pXCze38
         3I5mTzDsb9Y+FqCVyGgUu/vuX64CKEQIiMCgGc+Dh7VnsAVdbp5aJehbLktfkls4cK8L
         koDt1NgCQbAtt0Hjie/nURIBH6kEgFu9+DthfrifUv6gnDwKjxO18PxBs2Dyoigq/1Pz
         0eTWZcUdB2eu4MrJE6EM922pp6r/lx/ilccceLOVVPqBTew9Spjrq6nJKpSVTNbUqm5a
         MGUbnQiVH9qVPyEkUzU6rVA6pvYEiGq0ERNdS9i+9tGPqN/cdnngectz7oIEXSErd5OQ
         auzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779999913; x=1780604713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CggQBmAuhU/vixgo6EEwOoNqb/en0xhwekKbF0wLXKM=;
        b=AQQFUR9FbpWHT3LtyxkJd8igqGs6hP+RyRUiGkz4Wyu13K5OQVnnCjOFXxutyvABa3
         WTkDUA74YTEPu2MhcnHZvo5bzVAMEEH5mY9VbcjDHBlPz2NBH3xnmlfc8MXpyclspz6o
         HDpUoPAGXo6LP49jKgxpmqlvnVNeTC6KceQpqikNvg70fnPVISKp/CZhGHFlNL+qB7Ar
         ntLcNXr74lKes53JFdIE8vzlq9zUMnD5AL24A3BZaLiMYpqucDQiMWtodrHaWzJE9Wli
         tOvUah4U4vJLj1wHNu2axLIsfLZF1JfQpxM+WdIh8mZNkuIDsw317MNMD2VAanljnGCb
         TjpA==
X-Forwarded-Encrypted: i=1; AFNElJ+kePkgg9Vy3uKcMR4uM2d3sKMBJfWwgZSM1blkfhA8TorAH9EFuOGma2qe7cPmpdmUp7gekqCUIdvJ1mw5bIda@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1THOrXwYqltnPkadftnA30ZSS0VGi4yszCJldEe4iio3h2rhQ
	rnd71AqSdrZFeAxGH8yb5nWhGenLVfMBkK3MtcxdM0BMsAgQaTFg2Jv5
X-Gm-Gg: Acq92OFMvlds7VZ9IUUanCnzTPrbYMozZkeMF//adryWLMbqmRJ3mqDpCFAWOi/PQFc
	91dr2qCc4V1nayFfIZZWTfwWkpeJeJFv9Js37ONyshYbGE9/yQf0Kk34hqutcg1EQA5hyTNOyl6
	wkE6IXJRE4KbUS3vC/TAMnbiK9rF3dQUfG6kYRpkht8Rk4Tiiw1h6SO8PBhj0NU/k2Fwex37VMm
	FuLgZZoMrBcaS76dONdwSoe/a6kxxPFHRhDFXB2ZmoPrtWovo3Ib/NZLEli7vuBwYS6uZdWOZdO
	3KFetWtWb8JO3DYxcGv+/eb4Ym7kStD98iKoyzdGy/aEnqjMADR6pNsJE48vw3LGPQ+l+iuaJck
	0hmdl/NgNmTYCvkZ57kYm6putMGUME8JSXSYAduNe6CpOngzI+JxbuFu9Resa6rkcjP2QkTxcvt
	vE2F7LWl/VjOf7d7eIJOdoAy16jo3JoKbWTKTJk8iaL/QL8jPmttBvbY9461DhL8upNPwW4WmoK
	tMVga7+fp3MGC7l3LnQ+5NmtTwpI/Olzb84KjWW/f6ReSLISFD+IVIV
X-Received: by 2002:a17:90b:224e:b0:369:7f25:cec0 with SMTP id 98e67ed59e1d1-36bbc6c18c7mr197960a91.0.1779999913014;
        Thu, 28 May 2026 13:25:13 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbdcda52dsm4343a91.4.2026.05.28.13.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 13:25:12 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Ulf Hansson <ulfh@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] pmdomain: mediatek: mfg: move __packed after struct name to fix kernel-doc
Date: Thu, 28 May 2026 13:24:55 -0700
Message-ID: <20260528202455.136618-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_132514_439630_7180B162 
X-CRM114-Status: GOOD (  11.52  )
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

The kernel-doc parser cannot parse 'struct __packed mtk_mfg_opp_entry {'.
Move __packed to the closing brace, which is the more common kernel style.

Assisted-by: Opencode:Big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
index 3ce6fb74dd53..53bdab66cf15 100644
--- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
+++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
@@ -236,14 +236,14 @@ struct __packed mtk_mfg_ipi_sleep_msg {
  *
  * This struct is part of the ABI with the EB firmware. Do not change it.
  */
-struct __packed mtk_mfg_opp_entry {
+struct mtk_mfg_opp_entry {
 	__le32 freq_khz;
 	__le32 voltage_core;
 	__le32 voltage_sram;
 	__le32 posdiv;
 	__le32 voltage_margin;
 	__le32 power_mw;
-};
+} __packed;

 struct mtk_mfg_mbox {
 	struct mbox_client cl;
--
2.54.0


