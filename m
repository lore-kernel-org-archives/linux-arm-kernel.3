Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0A9C44525
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 10:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6RbzNK+eNCezcWvhoJEyPH0JtE0jxe26kaL9SwOJjI=; b=FHGPELD1VbedQaASyJmvyH4+9K
	wSUmF95Yl8AaRx562ieJQN7xo40TBDG5uWYguwhkCf4/Ao5Lcats2CZXYj7QdbJnl7UR0Rq0rf8iO
	lgFESlBmFhlla7je25OQVdgYpLSDg7gl8vtPfJjEJ3nmmpQmWUnYjQe7dbctfwuso7gxXQHsIgQZq
	IJLaZX+FJhbOq318o5b7oLfsgcH/CFlgDniQHg5ioXKF3102aqhZU9kT3nfR5pQQPcXPk7PL9i021
	kBbl8nmL57bSJ0RAsku6FVBRJtNvjiyF+kd/y5bdrlvOlS/D+CrJagkA6KjDIfXN0Aa1eVefJt4B4
	UUDmyRwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkw1-00000006Rym-2yzY;
	Mon, 20 Jul 2026 10:09:17 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkvz-00000006RyF-2mEe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 10:09:16 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49558ce01afso9759545e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 03:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784542153; x=1785146953; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m6RbzNK+eNCezcWvhoJEyPH0JtE0jxe26kaL9SwOJjI=;
        b=Yk6MopXQFpZlsMHzrHhTrkXYsj1pcXQLQbwSUJJJ1+5e73a32Nuj7o63XWbvVFn/r1
         o2Fnj2iM4Yb9PE6gh816l7ZJLx63lIhg0Weh1Jg919rt2J798HvvsSSm0vMNTf3PVOus
         8TuYVrX0OvBDljSgcf33LGoThOgux0MNDdMIGmMdO9Ksm4nUhuxKa5D/DWbhAvdTDakW
         35D14f+cB4XInRQIFxTvWUZQtuZ3+S4gVz7zZyhcJikzZOewbRiTQr9+edoJSXRLuVfI
         VuRYgYVAadsu5Jz4/sLG9c2HNj/xUXmLDicUbVSgfg/fh3AQClbxO7Y5hTPwB+Pn+l6s
         YQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542153; x=1785146953;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m6RbzNK+eNCezcWvhoJEyPH0JtE0jxe26kaL9SwOJjI=;
        b=oD3KiVRkVMJGytEf0LgYIfGC2GO+gc2wnx1pmT/dnscfxDibhcZiPyROx/coDv83hr
         WICSg8Y8pwDa9Wi3v6O7K+65anH2MRsgwPC9Pc+EausFVN5sslhoiFIRYiV/0yNcxVdj
         iqh5J19YdQHSwc0TGtbsRi6zscQLsebPxYv4Cpor+CFLW6oK7ae/O41Hlt9iafXnw2/8
         3bXdW8jGqM6hXA7hnA9eU+xwQR2QouUnw8sN2SxeavMY0z5MFGP47EdgG60rRmVFY+Il
         9rY5pGg6hZSaGA2KnPuLH1QfG5ZKcFZOFjpw9jzsJGIPi2Ofd259evhhmW8zCHcjr62t
         i7/g==
X-Forwarded-Encrypted: i=1; AHgh+Rrm0/e/P6XgUfkcJRI8S5liagXNXXMQmoLTLZEeZiHWReun8hbCRTiE4FzEi6QKRtfLt5J0LtcDHL2xIzJkMCB+@lists.infradead.org
X-Gm-Message-State: AOJu0YyamRSQCJogUJYslFPMtUKA1sV6FWQEZDpq//exhiHYzuKkr+t3
	19E5dydohAa7OYxz8NJOhAPwJImtg9hF2F3YA1N6adGx0UJnoHUw0mi951tMu/WmRn8=
X-Gm-Gg: AfdE7ckvYAdXIIRN6gHHlsYM0mAhJkhfALsg4UpWaJXUeQaWq5MhODKE7k628QViK15
	acaJWR650s5MZpiScIJvnH81KRbRkpw4V9d4TR5AEDcnXz0ln09a5mUR+DobRy7K8WYDtLDw1VP
	pl9/j4dRCUsSku1OLwdfBfPLbgPeshIbgNSkaXKcOxaGPctu2nrtDuEnVyrc8jiQxOev5Mrd0Z4
	2EFl3Su/QL1hVAt8fCzW58r722fsAcSEr3kp5xzAHeyuq5Wso/j6z9rDfPUFFjWS61wB0J484Lj
	ZG+IbDMdK7pML71W1aQtz0MuDu3IIneuD12sTy7gNYK1FD/Lz36d3MsVV4GcT1NTn+/Gbjsnsvn
	JDlcAhGgf9y9lSPUlKtZ3KnZn549+bsyUvehJnJ0a33G14jvLchUXBQx8ptP0Qi5MIwhGxBLc3w
	pyQ1EwTmeY7XVEURerN7cH6nfdEQ==
X-Received: by 2002:a05:600c:1554:b0:493:c10c:22f0 with SMTP id 5b1f17b1804b1-4954a50d963mr170983735e9.20.1784542153212;
        Mon, 20 Jul 2026 03:09:13 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a2504sm294792995e9.2.2026.07.20.03.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:09:12 -0700 (PDT)
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
Subject: [PATCH v3 net-next 2/6] net: ti: icssg-stats: Move long delayed work on system_dfl_long_wq
Date: Mon, 20 Jul 2026 12:08:52 +0200
Message-ID: <20260720100902.155605-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260720100902.155605-1-marco.crivellari@suse.com>
References: <20260720100902.155605-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_030915_716993_BF72FAAD 
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


