Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A8EC369AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 16:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3OAUNtzrYtxLdmxfVBvMY5Gk3k0kx42SFNBtSsQElR4=; b=ctFmp90Rjgz6Lq0jO3sDcJM/TX
	QhVrint0BNNmh8ed8KZb3k0kTWmtgQRlo2OUjABFLw9FHeHVEPhI5cNywG8AbG/0+Tvx2ydJyBt+m
	2QRpk+vOQ1BmlgBPKpRyPsqXJMa88J/G10l79CfiJZhnMJhzxmrJEQl8i9PSZOQw6THM5mNj2Edz9
	IrTTd2+9DMQzowsGWaGm+PfRZkT1AZUmYcC4NxUSrjY8GL98PgPz9BRq6d5znBb2J5yJ/+765RQM5
	pna97G/CDI+rg7XhC8h+4oqYRngQy5QYwlis9k0w8Jh/ipRFvNPOdnr6lCLqM+NO5bLM0RFmIxIo7
	PLK4P6xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3eC1-0000000GAeT-2HxM;
	Sat, 12 Apr 2025 16:58:57 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3eAC-0000000GAYP-2m3L
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 16:57:05 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7c5f20d512fso55384585a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Apr 2025 09:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744477023; x=1745081823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3OAUNtzrYtxLdmxfVBvMY5Gk3k0kx42SFNBtSsQElR4=;
        b=bICusiEqJ81Ba6O4d00ejNL1Qdq6q3rdoxNhwkwoJOeYPwpnztYtwfG+NfeMkEhU6n
         LAbtB98qvJ+pouZF6l81bgE0ubpL2+DPFQ869tpZi4J+TKMukSuEDLo95rNRu642LjTw
         /TCu+XXuvBviF67WbaUiXa+E67fB8XwQRFHn4v6rxCkz7JfDvRyAxzw73+lulP1Pv6yX
         PV8HJ8/+GDo0ze+NRRX0+Hhh3VU8KqtLw8wWQhUXCz3Kcria5beEVWP3DYbLljs46/dz
         TI1mD3oKou6GNsBZ9KiDirFu46vosAjxwyyKKGOyeuWcp2rSOYrBJ8N3c8ZIJn/Nm+c1
         DCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744477023; x=1745081823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OAUNtzrYtxLdmxfVBvMY5Gk3k0kx42SFNBtSsQElR4=;
        b=XQnKzP7bnj8RZ3q6I6964voiNz4wp6NZUBlE516+cmp93edlKW9lCpezNAmyMHfihR
         hCX1P2D+KpMD4q9JEgq3QtqWKB/ftc7JgZLz4PuH6NpQCvgO23U4zQcR1ptx0zY+B3Fl
         kSFfVFC7cBonpUd8Sei0na1H8/4AV4UzbUkhhieLQOFbQICTTBXiwnJZ0R3usRt/zGxA
         nEGz/ELpLReGb2CEVB3sAnVFeoqq6eXr2HghdNCCq8izHfQTkmta2w/KFNpW9WghG5c+
         zG6uZlUPBY/k+DVBL2z+6fp/m3KT4N8rqb1E0o8X7kBlyvNnqsOLilaZEaUyntbQ/YKA
         3KUQ==
X-Gm-Message-State: AOJu0YwyClg2BxcxRa4hhJiEFq3Br6QhefNNtCC6dzKKTvFyUElidbua
	GGj/FnfnmzJ4Vs2fxVC0AAy2FBroCCp7MQ+CX5lX5uLeeXqfFHQ=
X-Gm-Gg: ASbGncszY57RnEPw8G4rIRQnkPHCpRzf+mcqmLmY8NzZON+PaJbbidDOHIMK3Xx/1qF
	cowjYpGSjuh4CPg52ZCaCGkYHo3jn0+gMG4UW0CViCFjn1a+BAnFUS9KheYoZdlFhvKlBEYvCec
	feQwKyXU3NtdZ0PsV3xOZjq3Q+8u7LV1bIJ3wQJC80qzNy98yaO85AVx06FggOPBukItnkV4ZIB
	8GBA5Jd8WCeQNTvaFtrRzt8uo6q6/AgFZf0phoTeoznCtoO1bNkj2R207ytS2Uu+ve1lsVRwUiw
	8qZMsFu1ygi84+2rDpNKjY72M0djfCSrylI06YtOoF0tKV9r
X-Google-Smtp-Source: AGHT+IH8bGQWXcYiS6oP92AvgrToxoeCNlaJKrS6pTKqr+tWtGd4xgrw6ujWrk7k9KKOoduS3EC6pQ==
X-Received: by 2002:a05:6214:1ccc:b0:6e4:449c:ab1d with SMTP id 6a1803df08f44-6f230cb46cfmr37544306d6.2.1744477023136;
        Sat, 12 Apr 2025 09:57:03 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0dea106a2sm52300916d6.115.2025.04.12.09.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 09:57:02 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	arnd@arndb.de,
	hdegoede@redhat.com,
	mripard@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] drivers: soc: sunxi: Fix possible null pointer dereference
Date: Sat, 12 Apr 2025 11:57:00 -0500
Message-Id: <20250412165700.2298733-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_095704_699981_4BF05DCC 
X-CRM114-Status: UNSURE (   9.79  )
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

of_get_address() may return NULL which is later dereferenced.
Fix this bug by adding NULL check

This is similar to the commit c534b63bede6
("drm: vc4: Fix possible null pointer dereference").

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: 4af34b572a85 ("drivers: soc: sunxi: Introduce SoC driver to map SRAMs")
---
 drivers/soc/sunxi/sunxi_sram.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 2781a091a6a6..1853dcc806ea 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -122,6 +122,8 @@ static int sunxi_sram_show(struct seq_file *s, void *data)
 			continue;
 
 		sram_addr_p = of_get_address(sram_node, 0, NULL, NULL);
+		if (!sram_addr_p)
+			continue;
 
 		seq_printf(s, "sram@%08x\n",
 			   be32_to_cpu(*sram_addr_p));
@@ -134,6 +136,8 @@ static int sunxi_sram_show(struct seq_file *s, void *data)
 
 			section_addr_p = of_get_address(section_node, 0,
 							NULL, NULL);
+			if (!section_addr_p)
+				continue;
 
 			seq_printf(s, "\tsection@%04x\t(%s)\n",
 				   be32_to_cpu(*section_addr_p),
-- 
2.34.1


