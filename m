Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF75CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVFVSCKYu4LMX2OyBp2Sx2+yDSioFsB6HDpmMFcR8pE=; b=eaRSQA4rxGvSogju1CkmGIOiJh
	ozhGvSbfFxIF5q8bN6eVt/un8qrk5HveHoMNPbS1ZsEmD35f+xcoEtZpCifqhyNi/nEcSd3hTHAOO
	YYVQqo8d5Pzm2bJXt0rUULvRt/fyqWWS+mmK5PxkdkwkCoa5wFVomthXSTnIJqKllP37epdM47RDn
	QAPWGa7IGIsjNZLILn5D6uVgJ8WP+RlZuEiKxeb7hpc7GUXXANz7gtUl1KhxPuafMtVyJmCw10Z6O
	jzPqqP4NYkPuon1VCqbtd3VbATwTgMotFYq01jM6bc7kPfXi/dtHQRz9Cnej+Kz4LSkPQl71uREi/
	UQAeZTwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCkU-0000000A7bd-3082;
	Mon, 12 Oct 2026 09:55:14 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCkQ-0000000A7Xs-2cn3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 09:55:12 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48c411d6615so1086287f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 02:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791798908; x=1792403708; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kVFVSCKYu4LMX2OyBp2Sx2+yDSioFsB6HDpmMFcR8pE=;
        b=B466Occdhti3qRNw8lzaG4qms3o55DmH1V9JHI0GQMP5QP907I8k+e3ODA8mACwpu7
         NY0Q2BntZbqkpY1ann9QMokgGaBTJotUPCfBIBkl3MHeEcrV6K1oxWKyo4NDvpzuWI/N
         B1QR2b8gWvuIyQLbXwFHTs0pl/tMy+JWJyLeqBPst6TYmvcvo+QkxN/0jm/1cXSack3w
         q/eyTXTjbHDVK1UKXIP4MFH2Hktt1F6+k27pEVob75IoMrygPnwqeaRR7ZyMjGk7LD0S
         ihQ0rj2XxGb31JRNo8cqmqPb3i3DqyJz8+GrQTcDw3wfqE9d6vRhoqMN+DDrWey/ZkMn
         2WLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798908; x=1792403708;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVFVSCKYu4LMX2OyBp2Sx2+yDSioFsB6HDpmMFcR8pE=;
        b=02oeKXkkTZGjTVQL5/CPh/9/EgGM6HaLERgaZXjxhV20ItgEHO9hrdTEsVesGt2Uv3
         gIDMZrQsa9pb1BlQKxlcngz9MTl9PdIo8Gt4wrl9uHtKZI2/WWM55GRlnGEKCoMEiM7r
         A8P3S7AJvjdtMLveR3SK4L+9UFQp9QFrRg9mszZKUnjVN3RSsnLteWDtRG1A7lhZDiBA
         DvZCX+ftPFy7ztIcdARgTs8wtNFxLBZLGU6ez+Fh2S1sN0/4rm5pmnCq8uhJ4cjYMJAy
         EVHV8fEm2SzQwtp3u30IIzJyUJ/tukkGvdcRCWY4Ykwz9BRnocqX5XEgp2AAYUIQyVo7
         Oqnw==
X-Forwarded-Encrypted: i=1; AKwUvBxWJ2KqSHwZ0YUSWIkQNcaoXWzh9+a+C7XwZG6ENKPMdBgMYj2HmeNC4q4QI8zMnxYipeY4AaI4NNN1c67eITdI@lists.infradead.org
X-Gm-Message-State: AFq9FYIqSgr7nutrj5iM2I9gYnZHgugemdL2BUUshWM5GgtHaCoYwHw1
	IIYTAyPRyKT0fGvZ1Yd09XwsyHf8pHB1VRoYtP5N/YtWGpPAonH8Y6SIwjGh3hbv1kI=
X-Gm-Gg: AYBFou0Xn4vuGbRYYQw7XluMP6u+d6sl4E7xXU5/1KDY4n1b+CdnTH+JAFQDf29yVW7
	S1bTry3WTC8FTTIGF1dsZbegdgvd0QOfeeQMHGktXJXFezU7Xz8BPsMm8LqUAJdwbuoCr6xiQl+
	6Ra1GLT/vydW6RYXzYkTrt9S3ZuIgLsyWGh3Nn/r73WJk7GVxXjQMxFIWtOw2D+LRP7tn7nnYMc
	GHN7LXxlbvKSE5gSwoFdEeQk9tpZMplqfep2Ae5gBJVZ0ca6YEuEZJStdDp74FFIg8IKcNCo0yp
	+FVDpTUn+dy++35nezCEpUhb5LDevv1569Dsitr78zORFSAewg2Je00+KXmh0VRtpijMS2TGJXi
	yPiBKUtyZPeeQm+BQZItu12XS06oNcI/w/wmL+kKeDBCaJ1DP/yWmrsfThXkpurl6O1G9BgXGaU
	AR/CLDcwB2tppmnjpYKOaZloCDMCneEgQHmUWzDn0fN5KDe+Ap9/ol57/chz3XToJBScBlLG8A1
	OPh2PxPE6vg4E+BDlNZoA==
X-Received: by 2002:a05:6000:2505:b0:485:8a47:5b91 with SMTP id ffacd0b85a97d-48dbacf6fc4mr14133924f8f.46.1791798907696;
        Mon, 12 Oct 2026 02:55:07 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c2800sm18539103f8f.26.2026.10.12.02.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:55:06 -0700 (PDT)
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
Subject: [PATCH net-next v4 2/6] net: ti: icssg-stats: Move long delayed work on system_dfl_long_wq
Date: Mon, 12 Oct 2026 11:54:41 +0200
Message-ID: <20261012095452.135828-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012095452.135828-1-marco.crivellari@suse.com>
References: <20261012095452.135828-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_025510_688359_EE3C905B 
X-CRM114-Status: GOOD (  13.22  )
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
2.55.0


