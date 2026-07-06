Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863FCC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 13:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6RbzNK+eNCezcWvhoJEyPH0JtE0jxe26kaL9SwOJjI=; b=lFGbjyfNYYesRitEZ5hDLYp9ve
	qouxAgKBA68Drxi1aTzfFvB64ApdGw+rbTnW3rRsUcnNI0BogFY9YDmyXKU4yjYtrHsyO76gKsB92
	gh8kaVhM4TFqENgDBwPWvolM2HSCwTiL5UXXCz5EndmVJtLrupUpr25QxcTjOaYq2+F1f+L/7ENMf
	uyRw2/WEo1u+725rx5FvMHxvUSWEhe8zu6pL3XCQKCHXi33J/FALMBIctueCi9hJFe5/fvz81FEeQ
	1nfNR/StBD5Xahi+TqH0j8ox2DJptwjoNzs/f57t2UX4HssUUVYRvuzWPELpONYj/4nR1gBg5IooM
	rGC3dtxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjZ2-0000000CctP-0YI8;
	Mon, 06 Jul 2026 13:40:49 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjYz-0000000Ccsh-1kzw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 13:40:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-493c7902f47so18255245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 06:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783345243; x=1783950043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6RbzNK+eNCezcWvhoJEyPH0JtE0jxe26kaL9SwOJjI=;
        b=Ht6BvdS0uoiSmmdTdPESkQxL9dg/B5aGUprMbP4oOUR2vjHlkcfHEjs3xt0WGpH6de
         9x1Z2o2egqOFD4XIFY78cWquVKlx6a/+UbmQ6DEi9s0Z9KebwVWi4vuIJQc+gxaviZle
         QqwJnd45KNZ1Y9p2idXQE1k1/Mzt7+mqwHySTT141iC5qramY7zrbVxi5ft0ScQkxuSC
         2xq2m7UKCwWYNfZgYGuGYa78tnm3jLiAjk0eyAFtkzdu6ofalIqVzPubwddGFT4WNxPW
         a6zRavBxmKXfwzU2vkwOALsIocvHUV+yOTGaOHtNkLr34oQwAHeQaDkIBVBAe+7ofpnX
         hX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345243; x=1783950043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m6RbzNK+eNCezcWvhoJEyPH0JtE0jxe26kaL9SwOJjI=;
        b=BpzCIn5nt8y6PYIBV+QSHQUIkVhrgxLbQwaPECwAmwTQieIjDULADdfteTpKq46Sak
         jYxDXC0a9GLXEYEYEvbhmaUtq6JMkH/DJL0PC3tdjYVgwz42VR/caEYoT4w8Hg6lxouD
         jLobV+iaJs4Nf8DYw42G+LdPRZ6NouH4IiSC3G/M5AZHvIsaTwp82kufuEUx7qZRKo2A
         fjmZvcjFv+SG0plx1dYrXF6SYGWejWnVxnbnRpUoC5h5UFI0ch92KWefMAGnOirjvbvC
         wjFRDl5+iTdO44+1ameShwsA2ESbaRC7DdBJ8FDsZPndQ2p3D5AOHGCZ6r5QXmJxXukY
         RQPA==
X-Forwarded-Encrypted: i=1; AHgh+RqwtFYQvAY2mnw1uTaPGA8MCpxHPH9GRYHxBmgpzeqqzK9YjVjhX+zFHM7qzgS2WjAHHPjC9FDoSV4JlcefEWsI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3DxXIXY0k9d6JzJXDJX41YbgnET5FZvEDd91zvtaOkympdTkO
	5vOojmQdo+Et2NbidYa95jHdtgnJtWW0vAjWOTfhcMbaOCMp82I2TLLFzaF/2Pyf9VF1AR/iMOp
	NrEZYyIk=
X-Gm-Gg: AfdE7clFDy42OsZCO0Jzx2M2Bc0E9K2KBUfhpLrKKW4m+3+b29XKOF3iIeaJM7otywn
	tDGzV5IORQ+b6q4Mlc5fMQStMKANRDlKvQW0GGV1tL32whkRU6zojm3zMyNDsA5XMeSmT+2Z2XL
	bSmjaiqomdhqtpyUGjM/iqRgPa4N0RAzJmfoJFngF26Yj1odhEwgFEEFaYBOzOqHwpuZO5HkLB5
	xHBqw7HVbIqL5MX0O6YQ/W3qZg5Y8qedtzFbcodagQeuGJRgI+6h8HL6Yj7Jj+qw8OT0PqbU/jZ
	hVU3rSTyEyFLnAvVD+KXvlG6byMR6Jv80BV3gxRZpO0T5/tyI+a2EMS4hqoyTVBSupGl6v24Em6
	rsVsZHW8CuvggHYG4dpYwobS5BY8OuiOjc7cIbUEmk8MKPK5vErfEwz/eLCnME7KbQrZBbF2c/Y
	3dBcJUGGDiJDlK97WrKS13nOBPaoz/nPKVLRs=
X-Received: by 2002:a05:600c:8b70:b0:493:b6e4:fb2b with SMTP id 5b1f17b1804b1-493df06e943mr6108015e9.25.1783345243589;
        Mon, 06 Jul 2026 06:40:43 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm24424868f8f.33.2026.07.06.06.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:40:43 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH net-next v2 2/5] net: ti: icssg-stats: Move long delayed work on system_dfl_long_wq
Date: Mon,  6 Jul 2026 15:40:25 +0200
Message-ID: <20260706134033.244295-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706134033.244295-1-marco.crivellari@suse.com>
References: <20260706134033.244295-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_064045_477562_5E424E36 
X-CRM114-Status: GOOD (  13.24  )
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
Reviewed-by: Richard Cheng <icheng@nvidia.com>
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


