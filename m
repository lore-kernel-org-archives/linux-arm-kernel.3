Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5834ECD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZyfAFR2B0cKhvW2WvNxW2hQKKC9f/zud3fwLb2p1xU=; b=ykkwtPFd68Oo0iWUfuhs8y2sQD
	H8BN2m5tUFcO4iqefkDxSBd1RDZLljajvFTAHlAkPQ9u+pFa8KPn4w4Y3hvxW9aPlcnKe59kJDWu/
	BKDfMxxk4hqdmngGHVm31PVvYOyJGcdbVXytZZqeVe2Xu14uvXwCM3mrTFDreD+I4OpiixKCLtVpK
	uxqUk//nZ8jhMfaHkS6U9P4VDfQidySItqygGmXpYV1o3APB0yNxsxMkogxs8pWcSzFVE2QoSaTBW
	ZmAItlDFBAaNumnYYYSc/SmgxWwVxscgwpnRdNNGZnV74FgguydXL68OlfAMwH/RDqWqiCl2Ovw7D
	cpCP9s1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMwi-0000000Cvja-0W4C;
	Mon, 11 May 2026 09:29:04 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMwg-0000000CviS-0ebJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:29:03 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso24562125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 02:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778491739; x=1779096539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZyfAFR2B0cKhvW2WvNxW2hQKKC9f/zud3fwLb2p1xU=;
        b=Gfr7bXSxeIx8sn+mwWkdc/fGFnKSBK+Z/SXoGXkeXSkYynzW78xgIS2O0RmFizR/Dg
         OCZLkltmwy5A2zH9a1ln26wdr8me37o36dztWWMzLq3xcjGrCFMyPbPk1fwzRIpnX6UP
         CEYI/IYeGB2c0H0Slp2S4VLpdDOr692vo/FBmQn9pR5s/sEsK8Ac6E9eR0C6MOVT/mTs
         onAPWCv855ZiNGnx0E0QYa2OFqSkTAPZzVWZ3y4e7RrqRrasgaSS5AkNHNwCH1qXrwXT
         ewoKK2p72zkFDN36XrPhk3fRWZ/tLFcKQbs+UQsb9+HuenkkWuD765BfhH0WeHitMVZZ
         LDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778491739; x=1779096539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iZyfAFR2B0cKhvW2WvNxW2hQKKC9f/zud3fwLb2p1xU=;
        b=mEUpD9hgD4PhBY+UJqXcxSE8IAnnVVUqteLPBzQe+z/hdZd897vxd1kklxsXcwZTI2
         cuqUxzZJhUY8cMH3e/jFiaS1VqvWsr0LGWZwxZF5876Xyv8Jq1Kqc+BPtzM2AK1CyZlg
         Zm3DqZZzGy7iVRNE8a7qm/J9+iETtx0mdkuekUq3BYAoHB6Tj4/uPquA5lsxmBiPuhf0
         FXN5/gdR+HYD46Q1THhh00VT25ONEMzfZpMhHMzRjjTxJocMgWg5rELvV/0s5MojXVQd
         HdbclqdJJIaNtbKIfqlWlmLJZweZHNy+zCOz5bB+RVYQ3X4VWXmb42LzizocbLVFtw6O
         NKNA==
X-Forwarded-Encrypted: i=1; AFNElJ8xRu0WwnSmTDwfVzpGgW4TZVqaIfylHdxTqy1VN3R/j5GNZn7phDJyYsNzP2lHVPBxJkBn48YUqovXVXqV9UHy@lists.infradead.org
X-Gm-Message-State: AOJu0YzV6/H+lY77Swg1pnVYZjB70Z582rcXSthjVOprhpOca440eUlq
	xA3eftTukTZJh7AsKjiIj2rDyg0zUwCHXXZL9VLni3z9Hi5j7G1yvCq3mvJUp3YjlFI=
X-Gm-Gg: Acq92OEvZA7yM8BMx1f9L0bfXKbZHXvcZk4mXctmHiK3/pomKId/8Rm5zNZmWnbIQcC
	NsEwE7PG6t9BekT47wC5nkTSpAYvcvtyyLDsXkFTMlflM9weJEsHh7qHRLnsgg53XWCrU3oL+a2
	Q1cSx3SE8zZTe464C8qVmIsLaPNZ4x2BMajsL1KuPcjvdm9oAx96AMKMW4jaByguq7QzFkuc8qH
	OeRJepLVwSUDouv5fVP8dd6EzKeXijloCYADPY0ps4eH5sND2xQ50/qHuUrXUUYiR9ymICUnK+j
	uw0fSi6yO+OR9/uPtYTVDSHXxWEsA/CxlprYvYTchs2Ivmfh5+XYAaf+J2ifzdHnBLmf3vdQXGL
	T2CGYXGvmNwPVG76eIPhjJMu2MIuoXUvuTcJC7UAhF+xxN4N57fI6PZC57Ml+oG3rjuSXuGrycp
	cHhzpqCe2pXBB5BOeJOXmOn6CIXRqsTULo3EoNVyXlBvZrep9zz4R5Rd00Rg==
X-Received: by 2002:a05:600c:4695:b0:48a:76a3:2b9b with SMTP id 5b1f17b1804b1-48e706b26fdmr135960625e9.17.1778491738974;
        Mon, 11 May 2026 02:28:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e89fbsm157606675e9.4.2026.05.11.02.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:28:58 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	MD Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH net-next 2/5] net: ti: icssg-stats: Move long delayed work on system_dfl_long_wq
Date: Mon, 11 May 2026 11:28:37 +0200
Message-ID: <20260511092846.120141-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511092846.120141-1-marco.crivellari@suse.com>
References: <20260511092846.120141-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_022902_210101_F9CE7413 
X-CRM114-Status: GOOD (  13.36  )
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

Currently the code enqueue work items using {queue|mod}_delayed_work(),
using system_long_wq. This workqueue should be used when long works are
expected and it is a per-cpu workqueue.

The function(s) end up calling __queue_delayed_work(), which set a global
timer that could fire anywhere, enqueuing the work where the timer fired.

Unbound works could benefit from scheduler task placement, to optimize
performance and power consumption. Long work shouldn't stick to a single
CPU.

Recently, a new unbound workqueue specific for long running work has
been added:

    c116737e972e ("workqueue: Add system_dfl_long_wq for long unbound works")

Since the workqueue work doesn't rely on per-cpu variables, there is no
obvious reason that justify the use of a per-cpu workqueue. So change
system_long_wq with system_dfl_long_wq so that the work may benefit from
scheduler task placement.

Cc: MD Danish Anwar <danishanwar@ti.com>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/net/ethernet/ti/icssg/icssg_stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.c b/drivers/net/ethernet/ti/icssg/icssg_stats.c
index 7159baa0155c..7d6d6692d819 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_stats.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_stats.c
@@ -69,7 +69,7 @@ void icssg_stats_work_handler(struct work_struct *work)
 						stats_work.work);
 	emac_update_hardware_stats(emac);
 
-	queue_delayed_work(system_long_wq, &emac->stats_work,
+	queue_delayed_work(system_dfl_long_wq, &emac->stats_work,
 			   msecs_to_jiffies((STATS_TIME_LIMIT_1G_MS * 1000) / emac->speed));
 }
 EXPORT_SYMBOL_GPL(icssg_stats_work_handler);
-- 
2.54.0


