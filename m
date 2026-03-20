Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC88108B8E1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MeYQRWtpyoz4pJi30E77WFExzgm8N7NsrkcrHIJmdr4=; b=vAVlxqdQQ9K/SsuY7MdVpKLc1V
	Ma4Oq0t2+9sGLtAJ6xAkqjxrxJCVHSZYgBUlXM2jF+hFlvxxFsjqnqzR63eie3mPazQQtcRwZmacu
	h2oZ1cQ89NIqk1AcxI3DHNwPmKTVO8zqs1/QzKj4PY0YWrkKRmlOmocjm2cMQEpZzPTFbIcCBtFDD
	P5MS844Z6ON3UwwFolhF2NN54CMx7fa5wT9q8u2sOufS78t9cIz1LQaPDQwuO4rw6uMgQSKGIpfgz
	g68x0ZYboV9EwUqghGMhJmlg/+AP8SzPv+kFuUYZ87hytoRBSoZclY6qAlp5ZN3+KGolSUOhLuRQI
	KYlqzEQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WO8-0000000CVVI-1KeX;
	Fri, 20 Mar 2026 09:43:28 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WO6-0000000CVUI-043h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 09:43:27 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-667acaeae82so2566258a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 02:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773999804; x=1774604604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MeYQRWtpyoz4pJi30E77WFExzgm8N7NsrkcrHIJmdr4=;
        b=miYWAArHo3rRHzFW9Sgo4Q2r/93GhGfvLkENDhLHN97Mdt3W5tSxOn5p3SppVMihSO
         sxca83HPYiY/uA/h7SdWfzMEIoIWJ9el11XYE8x3N3p0cyLtOAWY7PEJaqPmUt/J9cFn
         g7GZgZmBCPL/G5AJvUrE/ZOdKAx8DENLYf7fo2TEbMM6uPOk6dnEeuwWcBFz5VduqaQU
         hZMI88sTRFR75/O0vMSL9xYp7Ja+fQWnny3wEo4sVpI0+M1RvoMgHla1WmNI0+t7VexV
         pbfjfoVM6SHaQF/W2IVtRHo2HTScXkwcgbhRTpx3H7SwF9eU+oxlX4AKyRf3BS9FQQTs
         4SnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773999804; x=1774604604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeYQRWtpyoz4pJi30E77WFExzgm8N7NsrkcrHIJmdr4=;
        b=RsDjZNO1SRvlKZZboxAc4/clbP5qR/cN3tnZk7oWCLQpr8blut39VDsgOeaeomcsjv
         uQkm0Zfc8Oouy4WOpVqga81aH44VZfh1xRgHdEXxd+oWQoBZ4SDXPEt/5Hh/w6M7jL0u
         1p6+xtu2OncEHIRbh5xj/mJAYhC5RCk3hhYtyjhsq44qh4TlTkEKzsBQjtPOj9MmL8HR
         ihzeex9GIEQU9D35uvGkiHSL3BydYp8oqRMaW8O+vj23JnBXX1yBe3BD9ElvT+l2SlCA
         XFIoyt5vQ0U4k9glTGR7l6qHcG0yfi7FVeYSKpqLZGfZ6W/5m82SzqSeCXjFB9986w2S
         cd7w==
X-Forwarded-Encrypted: i=1; AJvYcCUT7xcl6jnrfk9irLVaLvvQSFyh3W6D4Ut0gNvVffDVj7vIwUYWrIgGzs4fmd5aqOxhliMTPsH7j51dQcZRaql9@lists.infradead.org
X-Gm-Message-State: AOJu0YwcoSnQ2MpDMeOwKGkm8oduRCg+cwPR+ZVnfXM35U96CuFfIf9P
	/zo8gM9k7UDrH2bnqeY7sbv2s71zjZQf1bx9XolXLyk28cmFIR5knk95
X-Gm-Gg: ATEYQzz/yOGvyROawgHc8zxZeuPPc2YKbDVrouhIuJn1rJM3XwVZTb5MNR43G7d+eL4
	FcPQCM+XGvUL0SMP1F7ZEGuEC/F2Eiw4GazrjglcBZRPzs1ghjh4Dppx/TgaMiXEamNHo+NSr7K
	xNh4abi1xwK1tViHiaqAwwzIAR1xu4W26UQqmrOP5NzeoxxawBZGvU1kKds6rWezQNskYuG0tZF
	YO3GCinDW3GNRuc4ytBzRKJPYhAyuSX1oFtKafmyYwCoNHgI/UlBniccwIie1QbbJ9nhvvX7ide
	U+P7whHPMr3AOq4O/ACHD2mrw2PZj99CahRMkBF7lkgG5/Y0yYCIn4eSk4tZnUxa0282+jVsuPj
	STd6WzHgdatG9V9NcTSICLA1lrQK2YDMv0r3xO5vQ17JUdIhaWxGzR+gEZIVLDyLs3Ur7XEo6+X
	ZFa8J3tCQSOqFRRA==
X-Received: by 2002:a17:906:7fd0:b0:b98:1425:2977 with SMTP id a640c23a62f3a-b982f39bba4mr150387866b.49.1773999803776;
        Fri, 20 Mar 2026 02:43:23 -0700 (PDT)
Received: from gmail.com ([2a09:bac5:4e21:2e3c::49b:47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8dff5sm131318366b.24.2026.03.20.02.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 02:43:23 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net v2] net: airoha: add RCU lock around dev_fill_forward_path
Date: Fri, 20 Mar 2026 17:43:15 +0800
Message-ID: <20260320094315.525126-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_024326_063579_D971125B 
X-CRM114-Status: GOOD (  11.44  )
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

Since 0417adf367a0 ("ppp: fix race conditions in ppp_fill_forward_path")
dev_fill_forward_path() should be called with RCU read lock held. This
fix was applied to net, while the Airoha flowtable commit was applied to
net-next, so it hadn't been an issue until net was merged into net-next.

Fixes: a8bdd935d1dd ("net: airoha: Add wlan flowtable TX offload")
Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
v2: update fixes tag to the flowtable commit
  - https://lore.kernel.org/netdev/20260319032649.337812-1-dqfext@gmail.com/

 drivers/net/ethernet/airoha/airoha_ppe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index ec5ce41dad80..02deb739a1c7 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -227,7 +227,9 @@ static int airoha_ppe_get_wdma_info(struct net_device *dev, const u8 *addr,
 	if (!dev)
 		return -ENODEV;
 
+	rcu_read_lock();
 	err = dev_fill_forward_path(dev, addr, &stack);
+	rcu_read_unlock();
 	if (err)
 		return err;
 
-- 
2.43.0


