Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9A5CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 20:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VMizGUh+POPbF7otugfIKTfkSOnb6axk8qMjbvMG90U=; b=DbnKHp/u6RtXD2WTDU7TEbw5nR
	v1344dOOfoQX15vVTCIoT1DbFCDeMrtUT9iqDRmGlEXUWAjoE30xUSzD36g4z66CZr4XlNDENt9z7
	F1tqRrzp9cvmVWH0TkUnO7KVOTuoWcvMHVT3rUj3lyX+G0Qh8kkSdyp8LPm9m+bUFxsFb2TwNItBj
	gkyxcz4WOtT/7TtcOi9P6Qvg60i6D8iyydWVz6RhNQ9Rlc9crVRVqKNHOIVTYqaoStHqSFebCZZRU
	Vv8pu33mWcqDWA6xEVTTsEeMrfatortwKJiwkPb3n4lLCpAU0sLFLBh/C/vCjLQKjAj55sxjDZuVX
	KFUXwrfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waePz-00000002tfV-3yyb;
	Fri, 19 Jun 2026 18:58:19 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waePx-00000002tf7-0rJR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 18:58:18 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-91587626a3eso276146285a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 11:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781895496; x=1782500296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VMizGUh+POPbF7otugfIKTfkSOnb6axk8qMjbvMG90U=;
        b=k3VbAGmG43t1AS8eoFfeDYL9P0J/jONiYxxRz2SJcWOMh4AYIqv6qobH9Bz+4t4kZq
         gKZaeo61IUtS711HICBlxyEgav4jhYtJesHOB0hWCkODiZ5521xu7oCGJfDccDUZSYYJ
         fkwe7AkUOi/+Rze5By7AOB8IzeUwlcGgZYFQVyRhUt+kucWtmM+E0iwHqsA2dezVlClD
         dgwwTi9Esv+4w707+SuNMF0AsOlamLsXQOM/2BOAq56fXe8nAhkci3DfOn+CqDgsoBeA
         oC9kioLWCcIWXvPyk2Jivnt/1QobkCineEPeVQSbG3YNaoKTfjbbZKutPrZNnSaSAiQ+
         IuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781895496; x=1782500296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMizGUh+POPbF7otugfIKTfkSOnb6axk8qMjbvMG90U=;
        b=cVsqmflMWv5JPUtG2zx5ykHwcmPGIC0D2muFv//jShnrRHjI0BAJaP5PmWxo9kAoiR
         5DH2BAAElEA8RzVFBVAZbQTKLRJ9l6XKlOGuOdbSgeTEaGG/2QKLg9xECCQ83prff9rX
         w/nDH0oAbkAJTDL3O8JwNG3RfVictNtf46I4+WBaVhB2Ecxkwz3I31xJF9I1l3+RNp0w
         Al99J5SEGiuHdPQbpGjV43PXJAQOHSbG0jMZ/m18cTIhoxCH0BpGbraGigguqh/0awKu
         BH+M8VGbo9QGhG/Hv0I7NxS/cpoBTybdlRPfMVgiYhagWc6y8PwqHqNia/8Gv8bgWYkI
         Tlgg==
X-Gm-Message-State: AOJu0YyS8cB/TspUnIyZep9yu6O6QyTCX3gDRn6QgYsuXuQrMavd8Nnj
	TqzwFqXGPYCpelz/xp3xypuR18/JOb5tZn+2TmxD+qoZ6v15Nh9C23fv
X-Gm-Gg: AfdE7clNiLBJ45e++mlZEX2M08Gv+vmj1gXwMcVO0cgZSrPvaUbqq7o3bMvzDeQ17Xr
	oDXd5JRCtAZGWBK0uGLFxC9L3QA0Eb+6Lt69ze9vpJ1dG0geJgx8QEg232qUtuB+7LQl4F7fWWO
	WWbvBWT/nxtMZ9LCcn63Lm4m4SuW5Dw+0Uk64kocADpA2R20jxDX1+TtFAAsWhPdKinpab2c2jp
	vBxBr/jm5UdZ0HkJH0cRGRH66cbiFLL8UtWaXFE6nnhUwRiamROarSoi4hubL4E7hFrfWm31Aqh
	KcBfNRmc96Ndnvl4U4zmcJFsTfTxIKLw7qEkAJ5TlPGjUqsyqqndSH8awWDqzJBRCqUTXkN9bgQ
	OZ8zP64ShiBnWbmtSWyQUtGPXvKCMe4XQxFXMtpr/e8uboiknneRbWS3OpfMvMnUSGQaFmX58/q
	s647yl252fUEiULWO/V8kAjG7gXxQeIA==
X-Received: by 2002:a05:620a:4483:b0:915:cda5:2805 with SMTP id af79cd13be357-920d53d1cf8mr573961085a.52.1781895495737;
        Fri, 19 Jun 2026 11:58:15 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-921d7f46046sm75947185a.15.2026.06.19.11.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 11:58:15 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] irqchip/gic-v3-its: Fix OF node reference leak
Date: Fri, 19 Jun 2026 14:58:08 -0400
Message-ID: <20260619185808.1090575-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_115817_250178_59317FA4 
X-CRM114-Status: GOOD (  12.40  )
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

of_get_cpu_node() returns a referenced device node. In
its_cpu_init_collection(), the node is only used to get the CPU NUMA
node for the Cavium 23144 workaround, but the reference is never
dropped.

Store the NUMA node locally and call of_node_put() before either
continuing with collection setup or returning early for a NUMA mismatch.

Fixes: 920181ce8469 ("irqchip/gic-v3-its: Add ability to resend MAPC on resume")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index b57d81ad33a0..f82035eb77e5 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -3291,10 +3291,14 @@ static void its_cpu_init_collection(struct its_node *its)
 	/* avoid cross node collections and its mapping */
 	if (its->flags & ITS_FLAGS_WORKAROUND_CAVIUM_23144) {
 		struct device_node *cpu_node;
+		int cpu_nid;
 
 		cpu_node = of_get_cpu_node(cpu, NULL);
+		cpu_nid = of_node_to_nid(cpu_node);
+		of_node_put(cpu_node);
+
 		if (its->numa_node != NUMA_NO_NODE &&
-			its->numa_node != of_node_to_nid(cpu_node))
+		    its->numa_node != cpu_nid)
 			return;
 	}
 
-- 
2.43.0


