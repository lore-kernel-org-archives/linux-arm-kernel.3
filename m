Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A274CD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 04:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1W0WSOPePyu7VycvkA0dFLtFzunvd3MES835fx1lG5Q=; b=UnTNEsiMLGI4zsrS2x3gJ7C2Si
	1A//GcCgT8HaCHWj9gZAFvqlCnO7IYmmu+Cf+KCY8xj32XRI4llEfHeW8GLJZkk5k2OriH4ZReLOi
	AEobfLOekXD9KVN9Y20wXG1zbsNxsqddiTI1TkiDGxeB7+ZxWH/YIgwvd6+lJ1hIp8OMq598Fa0rk
	8SHwWqRHSQU7Wzk+TmM5R7dY8WKlFiOQpLMklxlwkmW1j7fmoEEGlFFePPH8LnBJeNoejN4LTOloG
	iu/y+MAr9UAbybLGeJhwb5hKDwscUCaXzZCP6hESv9kpsCotoZCC2xdJPO+2t7U2mydYykf4QuNe2
	L6stWEsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWRWd-00000002nK4-2yqN;
	Mon, 08 Jun 2026 04:23:48 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWRWa-00000002nJZ-1Ye9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 04:23:45 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-8cceb2ecc03so33969536d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 21:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780892623; x=1781497423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1W0WSOPePyu7VycvkA0dFLtFzunvd3MES835fx1lG5Q=;
        b=JZ+Ho7K8E7M6jWnU8HFJki2/CUXtRaUVX6rufrXBBzh8F6ReWkhSDm3DSERiivOwyp
         LcVYw8PGXBuQV4nOER3re4t1ZgN4m00Swlcuoy4KhENkG/Z/XJsvwzTo4C1gsakyvKDH
         SxhDsnj9+2ZOST7zfq6UtMqFO1TJh+Of3e3pckOcRmDrcjr35XvhhwzPoIlvrufsUigu
         XRQPvKHyqSYgKKAYE85riBcnTW8OnIUtBhs6YjpRqA4JVcrjjQwRcIV3rFZVA+AbVDQu
         BNgQzx2T6TIggbdyoVGquBaxHLASGZNNqdpIZZ/ItoTMm5/Gq5LrYOlPLbioaHAcHCy6
         h9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780892623; x=1781497423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1W0WSOPePyu7VycvkA0dFLtFzunvd3MES835fx1lG5Q=;
        b=CssETB2utaECVKcKpf2akzPqgOr8j+zfDlzdgD2JLy9zurAI5Swyp76HR/TD9CnH4u
         56bKk5oVnTg7Lk65spjGl5QIMmsw4fQiLFS7q/s77jKe4LhMfr3aFaiJDIovgQXvWoOs
         MyBPw0/O/b0p2DVR5sNwvImNB7+KWm2P0IOWtIOTPW9EOv6zzgMtieA+epQ65KlFuxc5
         DrF6AZpWvYmVNdwcIsvsFqMuUGnRKD6WA527FU1+AWbVk/+9qRCPKn9M8LBQxssidVts
         2VwTUHnq4yck2cWMI3LkjQkmzLIzGMLPob+5utHxaLyHELoS0P/Z+7WU6X7M2GSEu89N
         Jofw==
X-Forwarded-Encrypted: i=1; AFNElJ+o8GLkoYHb69T4NXZuBGU6M0BOdAcAbP8mZ4qmch3GWBvMVnsli/ryyBbhlxLSXj7ZPbRLB5AFNMrgo+a2Lwab@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+UktDlr9WvvrwKavgbZwt2milmvagREXLobowEf3a2SvE3j26
	urjTmB9WZJDSAM+Qywfe/TlM/Nclj8eg+HAVbbzowayqjPT6Dx+/MmYX
X-Gm-Gg: Acq92OG1hsFsSfAM7RVJGLh9kr6uSlzamFtIYf/FFLTNJxckxg3dldOjrxnvOpMkv5N
	ymmcg3TEestYUwxFOHBXFnkdT1scQ/tVJ2eI0EDTsPExVTH45freKMi3sqxkfhm5CizLZBKqkj9
	os0wj8oN6GXK2gVw+vUErn5VS/Y624CR7Q6edGcukulBw/Qq5OJkO6psE+Y/Nk45kVeFRC7zai9
	0JgUhUKugITOds3+PsnGPNHDXLJFlhBhkhpRfPWsQwm7yUDmRzpQ56Vp+OAIqa3TFIg1JiECNKA
	SEFGM6WVm/oC8lRWTSUJZm8QKZludNXs6yC1YMRqxt5DYSF/KnXKxVHs8ZmMGmBZvCkx47Ht8u8
	/TFn24Uk7qs6ddOcYEvSwTUg/otbXDm9RWGCZFaAl3UGAYeTP8PES0XHQ9u7ehlfD3l7I/VVTyr
	34DUjJoIIwbfeX8N4HrLFpv7pWwGbbu2vbbOG2PkHFGeviHnzgLgI=
X-Received: by 2002:ad4:5c45:0:b0:8cc:d756:802b with SMTP id 6a1803df08f44-8cee61529b6mr236711036d6.26.1780892622947;
        Sun, 07 Jun 2026 21:23:42 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd06f5eesm154721996d6.37.2026.06.07.21.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 21:23:41 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] ARM: l2x0: Fix OF node reference leak in l2x0_of_init
Date: Mon,  8 Jun 2026 00:23:30 -0400
Message-ID: <20260608042331.2633217-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_212344_442609_5BA0CAE5 
X-CRM114-Status: GOOD (  12.84  )
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

l2x0_of_init() gets the cache controller node with
of_find_matching_node(), which returns the node with a reference held.
The node is only needed while parsing the cache controller resources and
properties, but the function returns without dropping that reference on
the resource/ioremap failure paths or after __l2c_init() returns.

Use a single exit path after the node lookup and put the node before
returning.

Fixes: 8c369264b6de ("ARM: 7009/1: l2x0: Add OF based initialization")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm/mm/cache-l2x0.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 470867160076..e20ac79dd500 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -1767,17 +1767,22 @@ int __init l2x0_of_init(u32 aux_val, u32 aux_mask)
 	u32 cache_id, old_aux;
 	u32 cache_level = 2;
 	bool nosync = false;
+	int ret;
 
 	np = of_find_matching_node(NULL, l2x0_ids);
 	if (!np)
 		return -ENODEV;
 
-	if (of_address_to_resource(np, 0, &res))
-		return -ENODEV;
+	if (of_address_to_resource(np, 0, &res)) {
+		ret = -ENODEV;
+		goto out_put_node;
+	}
 
 	l2x0_base = ioremap(res.start, resource_size(&res));
-	if (!l2x0_base)
-		return -ENOMEM;
+	if (!l2x0_base) {
+		ret = -ENOMEM;
+		goto out_put_node;
+	}
 
 	l2x0_saved_regs.phy_base = res.start;
 
@@ -1821,6 +1826,10 @@ int __init l2x0_of_init(u32 aux_val, u32 aux_mask)
 	else
 		cache_id = readl_relaxed(l2x0_base + L2X0_CACHE_ID);
 
-	return __l2c_init(data, aux_val, aux_mask, cache_id, nosync);
+	ret = __l2c_init(data, aux_val, aux_mask, cache_id, nosync);
+
+out_put_node:
+	of_node_put(np);
+	return ret;
 }
 #endif
-- 
2.43.0


