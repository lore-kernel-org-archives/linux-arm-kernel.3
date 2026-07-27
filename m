Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7040C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0IHSYEqP/JaWlXEBlk0DX7t1dhJCuZAYJeNyk0qp2ns=; b=IWPgNURReuemOH4e1kz0HzEAlm
	YY9phvci/OevRSj4WPwvaMfgJm4jkeu1luYc5KXzp+gq7nQwHoxnHUc5a2g6js5K8lj4BnKoDJA1H
	eswJwan+092o+XSVq8y3rRodFaWpgx/ETYU1IqJ9wViX5T1RyPcASt1JNKGVWWGjcaQTIhp6FhX63
	yDr5gxaVGZ9d8dtQtk/BKdRFO7+CysAwaX98QLf9mkmNmCr8GpxYZMnXSLGx0/Ne+RFk44gtCROgf
	6xDrFU1zKEZLXY4Aut9kFynC3eRbHco9Eho+r2uQ4JXF11W2AgxR9VBqhdmz/oN9ySipPc/p7n1H9
	IdJza/jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO3m-00000003I7A-27Rc;
	Mon, 27 Jul 2026 16:20:10 +0000
Received: from mail-pj2-x0a.google.com ([2607:f8b0:4864:39::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO3e-00000003I48-0yew
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:20:03 +0000
Received: by mail-pj2-x0a.google.com with SMTP id d9443c01a7336-2cf41b07aceso18505265ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 09:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785169201; x=1785774001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0IHSYEqP/JaWlXEBlk0DX7t1dhJCuZAYJeNyk0qp2ns=;
        b=AXTFOAA9TydlxRnkAZtiki4O4q+6aqB+YuUs02sYOnp5LAP7/3VwTakE1z4uUSrDrG
         jYRgP1T2uhf6YAcOKJ42c53EBRut5VfvUBeuPVdTp7ONFWHcMAQNWR0/AjB15Ww5fTHS
         PnbCIx3MZFWBznWSgJ/P8k1fgxbiycVElGHEd9kcfZnfZSVQnvVMRqB5hcJcd0k5VaCv
         VkM+jdZ/dk4/cqz3gc+t6l0gtUiF9S20pSa1Si8yWk2Y67TmfZ0pbOeceFtW4xA2ocF9
         zZdzc5cGJi4ieYUGGggiF6FTbJgpoiz+Q0UiiImYT+Fd7+VddhOGnT18HcbN32B3Mjns
         QdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169201; x=1785774001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0IHSYEqP/JaWlXEBlk0DX7t1dhJCuZAYJeNyk0qp2ns=;
        b=M6EgBb1+dVGXl4U7XhmZku+WxgyOQJwR0PTTVKpiGVeIrjd9Bik1EOliqB9BDn4Dgs
         fkOo3leayXh8iysWapwD8biGBeUZ5jEuxdRcdgOi3W+Hv+KRoE9W2DvdPXZOc1eN4D9Y
         /DomDeCBoCyTa4puttsxvniGOeHj0f11DqUYoUpLuAANH7mvyHUcelmV79bLxgl+eILm
         ZG1qSMOU0Zr4S7BAfP2ELqfM80tuTzsOXx0h68jch+yYdzaSSj9zFB0F9V9zjTL+ZLET
         xXGH3WD52UBemYBh0kxZpniWZSwdIXER1KkMVwgCmlhYlmCObkX6P99SvwZoORJF0oQL
         E79A==
X-Forwarded-Encrypted: i=1; AHgh+RrgNQdQ9oSQJ9aYXNJFkd8VXe4zxQ9T1u5c4P0jSaYX4RxhJMG57QdmN1HF8wc6LvyNcwXd9gipbFB6U1+nBENx@lists.infradead.org
X-Gm-Message-State: AOJu0YyBGFaIh6gpSHBeqYIdQ35PeX+V+yzCqICaewb+g+U1cxlXdWdr
	ilBs+F3AHkmt4alEY2GSnhuJIFaZN7+HJNQycYQzNoN1nbD9JSCBoDrI
X-Gm-Gg: AR+sD11SLc6J5girWZDZe6R8SMKIjilQt7GCaJ4L+5LQAifQBjXgAdLqgCH5/idm7Oy
	HtfWfwCSSN6SZJCNRPJVxqPwA23XIU8YYmKR2YGUon7qv6qsBMKV17s2W5PB1Li+iODnZjjkJ1d
	r8ngSXtlvxzD/pfm6AW85PLpHCxFSLnjXtuxzbKbc4QNnR+GwiMbUAPWY2YC6jKk4q0L98VnSbr
	+SmwrZTQ+HfpdJ/0bYLCQJbyYat29hA4HzrKMvEQTRpCQBaLdPvAeOm6D08DDhSK6W2YRHbskMM
	P+7QcuYGoVH2K97AsCYgSMH9v47tSPIch8KqE8wPUBINhzLVh1s9tFoRwfIcZW08VDohu9gnQwU
	8vrzTJB2fC/amfId6hhjKG22k8PX4SdxrGpRNF/b6nS55eG0gEI6ch8Jp3s89Ze58fik=
X-Received: by 2002:a17:903:2f4d:b0:2cb:3f5b:6663 with SMTP id d9443c01a7336-2cfde78b5ecmr87867845ad.11.1785169201307;
        Mon, 27 Jul 2026 09:20:01 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81d849sm37758895ad.81.2026.07.27.09.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:20:01 -0700 (PDT)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	andrew+netdev@lunn.ch,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	aleksander.lobakin@intel.com,
	horms@kernel.org,
	magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com,
	witu@nvidia.com,
	alice.kernel@fastmail.im,
	dtatulea@nvidia.com,
	yoong.siang.song@intel.com,
	martin.lau@kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	leon@kernel.org,
	AutonomousCodeSecurity@microsoft.com,
	"Cen Zhang (Microsoft)" <blbllhy@gmail.com>
Subject: [PATCH net 1/6] xsk: require at least 16 bytes of TX metadata
Date: Mon, 27 Jul 2026 09:19:54 -0700
Message-ID: <20260727161959.885642-2-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727161959.885642-1-sdf@fomichev.me>
References: <20260727161959.885642-1-sdf@fomichev.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_092002_274302_0E54D9F9 
X-CRM114-Status: GOOD (  11.78  )
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

AF_XDP accepts a TX metadata length as small as eight bytes, but every
supported request needs the flags plus at least one eight-byte request
field. Such short metadata also lets the kernel read beyond the registered
area.

Require 16 bytes rather than sizeof(struct xsk_tx_metadata) to preserve
compatibility with applications that do not use launch-time metadata.

Fixes: 341ac980eab9 ("xsk: Support tx_metadata_len")
Reported-by: AutonomousCodeSecurity@microsoft.com
Reported-by: Cen Zhang (Microsoft) <blbllhy@gmail.com>
Link: https://lore.kernel.org/netdev/20260720155210.34229-1-blbllhy@gmail.com/
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 net/xdp/xdp_umem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/xdp/xdp_umem.c b/net/xdp/xdp_umem.c
index 58da2f4f4397..cd8643360eb3 100644
--- a/net/xdp/xdp_umem.c
+++ b/net/xdp/xdp_umem.c
@@ -210,6 +210,8 @@ static int xdp_umem_reg(struct xdp_umem *umem, struct xdp_umem_reg *mr)
 	if (mr->flags & XDP_UMEM_TX_METADATA_LEN) {
 		if (mr->tx_metadata_len >= 256 || mr->tx_metadata_len % 8)
 			return -EINVAL;
+		if (mr->tx_metadata_len < 16)
+			return -EINVAL;
 		umem->tx_metadata_len = mr->tx_metadata_len;
 	}
 
-- 
2.53.0-Meta


