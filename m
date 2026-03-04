Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E88EDEC03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 04:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MkjQxqDNkwYe0v6cm54vnCU9hUuWR93LRR4ggzirqFk=; b=LZlm/nhw4qDyWM7MNFxoq1uvLa
	69kNG1TGhqhXlDSpdjMenEDhS4tnHhkQ7zqUmPLnCBLu84H6e0lmoKwm9ePt7yameDnL+cX6RMFrH
	JFqu9JxG4JO8OCIAvzqFHn/bZFzVVPajDr1mvxTtbqtdLxQl1qIct8b0WFn3ia6eL3e4tON5pJ2a0
	P0ZM0p8c7E6eYKm+SXAREjK5W5RhfIa7E0NMMxm14BtJcygsZXxfIWAz2j/4xQHRA3GklNpaWneMD
	zDryy9kv7FWSMiVD1ksNWzgdkLiHz5E16GH7Lfhf98yK2KBw4GpBxSaI/wAJkxvQPTqHE6n7j7H5B
	psbFiX7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdeq-0000000GQbI-2PgI;
	Wed, 04 Mar 2026 04:16:24 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdep-0000000GQae-0N24
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 04:16:24 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-79868cde1eeso70670237b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 20:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772597782; x=1773202582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MkjQxqDNkwYe0v6cm54vnCU9hUuWR93LRR4ggzirqFk=;
        b=mdn56ByDcWEm0981hL8uobYmvBdEos4YfwPF3itUT9/2zoIXoKKXSlmvPKqo1zSQOw
         tKLTd82B33QmyvzhWSA7P2sWhiBqeijiuzwZjLIu7Qh8KU1LdwgPwHZPoQBZ8uKoNphg
         jXlMqhmJ92Orens98Gw7oG35/6ghCCJkFPXCOWb6QTD+QUIpAtcxe5zBad51K0BRjpeF
         KzclgC0fOmfsMqXzjAJb/N9Ejwsew21WtmmjohZtpUkNgGUw4FdcHAzHlq0/90UYUvzp
         ZdfDRUK/+gRdAieO5zdi2n0SOSxDEsiCby6mmH+4lTxvH67N+KKnpnWmjVRS0/eYRJ12
         inQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772597782; x=1773202582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkjQxqDNkwYe0v6cm54vnCU9hUuWR93LRR4ggzirqFk=;
        b=oijhZSE3UnOaoSh4ld4LVUNZ25VTivP8X/wbY4cLHRfUE7u3zKjYyHTFiHX5Ggs4fr
         i1gNeCCJrC2MuLcc2vkOUwskiyADtZilVGSf7UzMRcH3ahnzkpH5NnFHNLWa6gSBOP4j
         R9vHiKUebSwLbANhSXIf8ZrLCUr+GXZQBMNESJxFLYivb0aH7K4+Vz6aBfzjPegrqxwr
         MWgHTf52mCY7EtIjIfuYLMqb0LjrUlknoNFyu5fl6jmakkOeAxcpeMpjCxYBhfvy7YvF
         1aYYHiTxfbN9stU23b5fehIsveBfzVz8qpbsvFxwqKAAmk7HfrmAqz3WKGLtlthxbqyx
         zC/g==
X-Forwarded-Encrypted: i=1; AJvYcCUHzUoaDE7M3FKacb4wRJ/KuTe7Db2LxKXhvarLXlvg2HHmrJilHDaSeeH5t6TQMZW56krTTM6AI8LRfUj1MSXu@lists.infradead.org
X-Gm-Message-State: AOJu0YyXdaaRBAE0tnfMDfiH7y1peGL5X8mWWLIrCWRFio0MBNGc0gHy
	i6xXdpaeVrxIKm6lW+juQFRfA1ln4RNeXFRGVU99xJJYHovMX+emy2U6
X-Gm-Gg: ATEYQzzp6KLAI7HBVAmCWpebA02liIg5l/2mZppwZBhgmIAFv/CSx256TP5aTacWlNI
	szdW1Ot7fBB1e5vS+zj2V8n0MV+L7kF3cSABqHgLPiM7jgMxSF79VtZJ9N4jd7eb2qaRxa479Ec
	w+N8fcfD3D6m3B5xS0CkKUhn2wYWWwlJyQHcV/MeGAP5/APWfAmaHiPDnkbegkLR/urDfnt4GVV
	PkOAgRGEa4xrlOQorAj0arYLSkPRrP/ykjnsB9eke/3b23jtl67pCSh6A6TjIbe+sv7u60PDfxn
	P9cwodQ+I6bIZffxOOI3ukcIsntVKIYMvFFaAGVrMFQNDOU/z+7nw58nFx7frxBbRM46EOWAfTj
	2fKg1MQ+5uiIbZy3pudMeTJGLNvImcz4SiXIQc0TsqOJTePKA9qt5y7NP/LqFPuUCrwYI45RwVx
	IhHjfrz8KYClCua3MXjSRUdlSlDHKhK6ttTKD/pEpuJ4J9XhA/3EhLMw==
X-Received: by 2002:a05:690c:c4f1:b0:798:56eb:f238 with SMTP id 00721157ae682-798c6cc63d4mr5262807b3.36.1772597781827;
        Tue, 03 Mar 2026 20:16:21 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876ca7354sm68570967b3.52.2026.03.03.20.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 20:16:20 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/UNIPHIER ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] phy: uniphier-usb3: no devm for nvmem_cell_get
Date: Tue,  3 Mar 2026 20:16:02 -0800
Message-ID: <20260304041602.7539-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_201623_131502_1E8AC19B 
X-CRM114-Status: GOOD (  10.34  )
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

There is absolutely no reason to extend the lifetime of nvmem_cell_get
to after removal of the driver. Use and free right after use.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/phy/socionext/phy-uniphier-usb3hs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/socionext/phy-uniphier-usb3hs.c b/drivers/phy/socionext/phy-uniphier-usb3hs.c
index 8c8673df0084..c8971eee3640 100644
--- a/drivers/phy/socionext/phy-uniphier-usb3hs.c
+++ b/drivers/phy/socionext/phy-uniphier-usb3hs.c
@@ -104,11 +104,12 @@ static int uniphier_u3hsphy_get_nvparam(struct uniphier_u3hsphy_priv *priv,
 	struct nvmem_cell *cell;
 	u8 *buf;
 
-	cell = devm_nvmem_cell_get(priv->dev, name);
+	cell = nvmem_cell_get(priv->dev, name);
 	if (IS_ERR(cell))
 		return PTR_ERR(cell);
 
 	buf = nvmem_cell_read(cell, NULL);
+	nvmem_cell_put(cell);
 	if (IS_ERR(buf))
 		return PTR_ERR(buf);
 
-- 
2.53.0


