Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251EAC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELjPly7GR36YIzSkxqnCCbI/tjI0YA2AC2jjG4KaPeQ=; b=aVdoZvyXZRvv1nLlBZzQoE7ZHM
	tRsYEN3UjZyunRZJxwUDRH0InyWcpo3fV2hlDjKPbggdGQBuV+hqamTAytiFP3nJ8gAMXui1EF7xL
	iqh1sWyXM8+utDEqTGwPmkBOzmv3O7K6qnAPrV5p/8tabei+4LMhR8FlVlCDpSGRNSuO7svedVQYp
	U0+YVMgq5WPvGz/b7ZxwLjMAPAXEb49ohmTjb8Iuqm7F+GjkBw8otxiYKHn3wh4PwZm20DFoZi0fS
	WZx084O1wiCcLuYU+MfGw8QEOVpdhDUSWl2Uw/o4kp5U+lbV1j5vFYJ/JSVJO2VJ7hByHXWgOWcCZ
	KbT4IU1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS86-00000003rvq-22F3;
	Mon, 27 Jul 2026 20:40:54 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS7q-00000003rlR-3rYV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:40:40 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84864086bfeso3048598b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184838; x=1785789638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ELjPly7GR36YIzSkxqnCCbI/tjI0YA2AC2jjG4KaPeQ=;
        b=F8z2N2VQEMi2ZaoOk946LdnPgcajQtiIKSk+/cf2AzrBR4LPBiOJ5gt12jjmxpWY9Y
         tmE3NjsqDZ9zFiWKllRxLmBgqHAdgXPH1yVa9CH5r9/BY/0IVThN9UuKJ2/EP+JIwjOz
         e0m6bQGOKkYS//28WPbP4It3to/O25Lmwp73B3ugWSv6ooq0ItYbrPIO+Kp/BN0SMuzl
         2uHmWKT5pZeYCDXNvkD6LiXckXYQaLnH+oWsgDMLFRbnCEJeXFUUMvQVERukoJ0Q71CP
         u/B9Nlu42peF9W28SeqKc1IFcKHdwPbVEDAJUQAwLDJGzV45pgjQNPcGiB5+XSwG2FvC
         VdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184838; x=1785789638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ELjPly7GR36YIzSkxqnCCbI/tjI0YA2AC2jjG4KaPeQ=;
        b=BCJR5Ms/5qQ9Aulmfw8D9gr1lteBIT6tdIB9tZe6yymbxPhu/R2wRv5ew0Kt1vV25g
         UigXD2DpNxXY3k/XC6Tx0yO55xq+3gXO1c6oPBB4yYDduZj3IrgBi8LKUgE3r3yvcXLj
         d/5NA3g6hKkewpSDWKfmXClVgnNy8oyd070Xq2TT19fyat2paB2ulq6NWWiBJ3hjRPEt
         3NTY7CDPX1y6TXTnHHGi4ERJvpQldS6hIoQK9+/8ANQXHTyLAryvXYmkhuQbxgEUSuWa
         htltY7B4PmSwx3j5jEbUuj5RYGPTlVXvYI/ukvTKNQwbdHJs8Ayplh9d9hkbzOndi7sY
         O3Tg==
X-Forwarded-Encrypted: i=1; AHgh+RoLlr2TLzn1HxtU/EVZGi2osg+kQf+P3E4o26O2UWZ1999bO6tn3/8c2ybM7VM1HKS0Cle7wXN8C/jcbF6EBoS0@lists.infradead.org
X-Gm-Message-State: AOJu0YzrxeldlycbDa8A2ZTt7J0TSVgDXM9Gt5kZh/WfbDDC8jyZ7QRU
	WyGG+mjh0kj1dE3nJkWIC6Soc1QBxhv/63Y72f3Hw6jfQbM/mInzKHEn
X-Gm-Gg: AR+sD11XcZKaURWGubf/Zq0GxS6J5fPenwC/tLgzy/1D/eDVcryGQQ+hfCUbdqgOlZx
	6QcodM7IEdrq4IWJbk5iPfEkLJl27DAS1dCEhbCtUxnHRWDJMsCF8tHNeXM71qN+vkCdkk+rG5K
	mhuyteg9WjzY/bynPck3620Ry77cdXDqn9x74lG9J0Ae1Dfm1zhO5wkGreQQyUbbNaJEB+R6BJ8
	P8myM1Wb60oRgRs7HhjdIYdnaLs4S2Uxm7DJL/e+mQ2bZU/VxC+sMeDhR1XUmKeW7OqczLcP5FF
	M0aGko7SpsVKKRoh1I5r7v6soDfzl0n6wZ4CysxzI3z5xUVNSeukTLrHycXBgDJz3RvPqdgrwNO
	kzBJ216i7nXmoICuDx93yGhk6kb9hA8xI6H715mAnYWpFFHBlkdtOvBc7fbrqTS+N281MvwRp6Q
	4MAr92hFE3iPf/W2w=
X-Received: by 2002:a05:6a00:c85:b0:845:da74:5d7c with SMTP id d2e1a72fcca58-84e8cfa9197mr901724b3a.32.1785184838288;
        Mon, 27 Jul 2026 13:40:38 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:37 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org
Subject: [PATCH v2 48/64] dmaengine: owl-dma: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:10 -0700
Message-ID: <36654fac68081c725fc25c3cce5db571567d6985.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_134038_969013_C1B9C799 
X-CRM114-Status: GOOD (  11.61  )
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

Use dma_chan_kill_bh() for virt-dma cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/owl-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
index 7c80572fc71d..5f2140dc01ce 100644
--- a/drivers/dma/owl-dma.c
+++ b/drivers/dma/owl-dma.c
@@ -1055,7 +1055,7 @@ static inline void owl_dma_free(struct owl_dma *od)
 	list_for_each_entry_safe(vchan,
 				 next, &od->dma.channels, vc.chan.device_node) {
 		list_del(&vchan->vc.chan.device_node);
-		tasklet_kill(&vchan->vc.task);
+		dma_chan_kill_bh(&vchan->vc.chan);
 	}
 }
 
-- 
2.43.0


