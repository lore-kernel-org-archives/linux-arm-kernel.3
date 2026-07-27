Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0946BC53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uq203R1ZYb1EoosBcCQ2LhjDPAR7gIRz0Ot9zI/XvNU=; b=AlKy3Y9cFne5ZdguJb4ouRvDVy
	SBADfugG+aj9o+lrkm+cE5zpD0HzjZMjs+3vkmAgo4ndmoHcTW30lkhDkJPdXmySWb+xY9ioCTKf4
	HYhGK/8ITtxx2HmDqHKYbZmR41CintnP1GxLHcpoXSzdOybl0IU5xijeX1l5/0OttPg+v0x+wr0Fm
	EQVXxSXu2RjF4H6P0GQ9M2r/JCVzID49IL//P6Fc6eA0evFPzVMgqCHaPW1NwsXJXHjbkZeGi9Lf7
	gOB7IFmNPzB9Lzhf+Tv5PUmARq6bHDgyD5lgvuY0jc+lGxU9C58nvVN+Ws0AipWJBzZ5u6ScqF2JI
	AtyHRy9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS8k-00000003sKM-0bCn;
	Mon, 27 Jul 2026 20:41:34 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS8h-00000003sIb-16K8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:41:32 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-848593533cbso2273519b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184890; x=1785789690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uq203R1ZYb1EoosBcCQ2LhjDPAR7gIRz0Ot9zI/XvNU=;
        b=Nujs4R34OtKxnEu0YPh2T56IDj8YMOclc3Ky5ilX/Bhf8yKD/PAx/dCB5RHa7+ugvm
         n7yidtqkYN5yIwLNHel7iQpFEzofiUqrSzvKs+dgzoEl9x9k5KbubSP/tCIdxIeuk6WQ
         d5YULoOJtABHBx9t6Q4ZuME7mJ5FsdEpJOFkOEUHNetlvqzy3qY08MzmlambGugv7Fd0
         fxyuEtkg6PknfYWZ56wxoOQXuG93DT3pwyQW09fSIuhj3EJ99GMGb7S+nAzTYjN8o/J0
         HH8zslw0MsT7nd6sRxnOjyIFZNfQw9v64O8EVFXouEw2SOgr1FLuJ5kq/wYRobIyU684
         mfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184890; x=1785789690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uq203R1ZYb1EoosBcCQ2LhjDPAR7gIRz0Ot9zI/XvNU=;
        b=Iav4BAeb3IpNWFYz1cg73xbxYIdXwvvWOGZEaEK5ZkmTMya+6DgJ7Psx/wXLJjnq8L
         RbQ9+VuN7xGLsQZYZURZenf+dgUQFnwV7tgqXssQnkYASFgM20z2z1Tcf1zZDYQ1czec
         A6DgVx3ScNogKNf4lw2E6pfz8lwOSIKqAzEpL8MdVAbjPrCq6ygcM6r7fk1EFOyyAchL
         RvMgCJC7Tiw9sxjedBdWLxRzLd4aid5TzCNsAddkSnt3peRb7rdr//bAsX/QFhvmEUz0
         QeZVEWQ2WICUjHleaQVMvKcPKvKKUaaRbMmVL22yi8PyQ2BFh+4lTTpLuOKqCu9jKww3
         elQQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCMLIxGO/W/+dN8uMbxZRx0QCrHXPcb6+TiiNfuyeyLTbSLIo4XqwGMdXwFd2vW7KWNUZSZ8quF4tXnOJJNlM5@lists.infradead.org
X-Gm-Message-State: AOJu0YwHWb7yui200LQiuERP373EbR08VU3E5Gefn9BSUNfOeI9Uyqpl
	I36V3bzcdIzdK8r1759L5vYcAsyjLzfFNgjkPxjfLLMXXZCeFrv8CGjv
X-Gm-Gg: AR+sD133gfplKPH1vF0zSdoYwpFIZLKTPug+GuobsfucePOspIXUvn590VLilGSuk9n
	EBQvgOTPbbmswKvGn8siiQyE5OMBp5h+gRwrE6tNiyAKZalmtLsra6cnYkeSZTPMXXfpkdLXxWS
	xAd4IequDh7a8vupe57Jovg81AJwXU63SivGsuaO55WK5qQPLi6UaSe+Ug0meA1zZUWfFUPNt7i
	PlanKnetEmwPhKmhHP/90gK4OH9BnVjIaWZH8YIecihY/81f8p3X0f5H1sikBu7OhG1VsMiV5DP
	gjpbVn0cSmskGbWPWU+GMwE2lS1nbyORSCCLJGE8017kECedf872VhkjMlveVwpqQ0CBZxuAqws
	oSJd0G1ZRQp2PD37XnqeSvUKPufTkb3fJJ1gZY7z91AO9TSRfdGiZlBlpMuKqk19bwKIxIODQeN
	7RcyIi
X-Received: by 2002:a05:6a00:a88e:b0:848:41e1:473c with SMTP id d2e1a72fcca58-84e8d41cd52mr759600b3a.72.1785184890357;
        Mon, 27 Jul 2026 13:41:30 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:41:29 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sinan Kaya <okaya@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 62/64] dmaengine: hidma: defer callbacks via channel BH
Date: Mon, 27 Jul 2026 13:39:24 -0700
Message-ID: <1648cb3a6b6c85009831e1dd263a6336bd31638a.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_134131_307873_57023482 
X-CRM114-Status: GOOD (  12.54  )
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

Move descriptor callback processing out of the low-level completion
path and schedule it through per-channel BH work. Drain that work while
freeing channels so callbacks cannot outlive channel storage.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/qcom/hidma.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c939635be21d..1f875a499ab3 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -90,7 +90,13 @@ static inline struct hidma_chan *to_hidma_chan(struct dma_chan *dmach)
 
 static void hidma_free(struct hidma_dev *dmadev)
 {
-	INIT_LIST_HEAD(&dmadev->ddev.channels);
+	struct hidma_chan *mchan, *next;
+
+	list_for_each_entry_safe(mchan, next, &dmadev->ddev.channels,
+				 chan.device_node) {
+		dma_chan_kill_bh(&mchan->chan);
+		list_del(&mchan->chan.device_node);
+	}
 }
 
 static unsigned int nr_desc_prm;
@@ -155,6 +161,13 @@ static void hidma_process_completed(struct hidma_chan *mchan)
 	}
 }
 
+static void hidma_chan_bh(struct dma_chan *chan)
+{
+	struct hidma_chan *mchan = to_hidma_chan(chan);
+
+	hidma_process_completed(mchan);
+}
+
 /*
  * Called once for each submitted descriptor.
  * PM is locked once for each descriptor that is currently
@@ -181,7 +194,7 @@ static void hidma_callback(void *data)
 	}
 	spin_unlock_irqrestore(&mchan->lock, irqflags);
 
-	hidma_process_completed(mchan);
+	dma_chan_schedule_bh(&mchan->chan);
 
 	if (queued) {
 		pm_runtime_mark_last_busy(dmadev->ddev.dev);
@@ -203,6 +216,7 @@ static int hidma_chan_init(struct hidma_dev *dmadev, u32 dma_sig)
 	mchan->dmadev = dmadev;
 	mchan->chan.device = ddev;
 	dma_cookie_init(&mchan->chan);
+	dma_chan_init_bh(&mchan->chan, hidma_chan_bh);
 
 	INIT_LIST_HEAD(&mchan->free);
 	INIT_LIST_HEAD(&mchan->prepared);
-- 
2.43.0


