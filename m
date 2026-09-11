Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FD8C88E5A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xN5FMpx5BomrnwwRlZAaFF7UH1EwB4frjE8eycmnS4k=; b=XOmlOAdqOB3ILwJH42vktxE/lZ
	LtjXiyOhQ0/lwtXqsFPBDnR5d245r0AG/wcanSFIB2k6x5tiiVx9bFPHqFyyBN+gOAkI3mYy2RSN7
	Jlzq39KfcJcdAO+YA2FL7bIxvTv03FZi70nHZDJqcwmzpOKS2z/Z5Dtl2gVdbYTIscH5wjm62Bl3z
	eakuR7w2CBBNxKjA6r3pOkmfC1W4dcd6mjJLoaXSOqPDot4HEWPBX6fCkWNZNXdeYoj+tmS21ALYG
	RDjR4FvC9G0al/QXIo8/aQwGESWvaA3fqh2ZEtNOL9Jn4HIVualUNGXDQCti0kQmZina5rLk3JZi9
	Nx5q+fWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53OB-0000000H63V-3X7t;
	Fri, 11 Sep 2026 15:42:07 +0000
Received: from mail-oo2-x0f.google.com ([2607:f8b0:4864:31::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53O6-0000000H5zE-3oZd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:42:04 +0000
Received: by mail-oo2-x0f.google.com with SMTP id 006d021491bc7-6b1ae6f5fc7so682032eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141322; x=1789746122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xN5FMpx5BomrnwwRlZAaFF7UH1EwB4frjE8eycmnS4k=;
        b=u6jWlFbdTprg5XKqHAEND1g92KkzKY/9hv7MATH8bnf5b9zxZYseDJOvPqwwECYThB
         ccd7FblBQC96gqOZg6jvypIsEZOAVJ0MOyi9YqXZyIi389PswkYc92lEdS+K1IMGpMvH
         9TStIeLTfh7/TZIAH+XqC0+zLisZEApeZrr+7xkOkPmHM3PyI09Ct6ZuhFAQkezV/ajr
         /5we7VfFljkK6oXavhwAIWTlSJ0EcaG7vKpckOhVGDvPZWhLm+ZEHgRaUAjBevsE6w9D
         wrOTuRLECbujgHGTNsThBnS89wa8aKIsCoQ6lZccTuGMtkoRTYASNgV9t5fxgmEK5WSo
         axjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141322; x=1789746122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xN5FMpx5BomrnwwRlZAaFF7UH1EwB4frjE8eycmnS4k=;
        b=DmbdnqQccN47Vw9sUyK3KFZQbPyx14PoxFWPnATv1OSJQnXdfyTTrSSr/lH/IlajK7
         zEK+/V4YMnAQ14uLsgl+2XqFZIBdBL+MCoUZVj45K7uD50ljjLAWNeI2m0Lu6U9SU4ZO
         8i56YGGDzhPYJprmgitjKo2kRqGrkBjKc8q3VhGHTeMiri88JfvROHkRrZ9V+pkCFOOM
         CXv2veQaD7/WAouFSkJeAPnzFKTIWxICZTJ6PfURk0m6++hskefmvVd+6pHr8udgGKio
         vqG2XzuWaQhlcLzF5vrcr8UX+A5V+bY07XaMvErCEPT5t3aE9+jX35My2kKPAbBWlzbH
         tTUQ==
X-Gm-Message-State: AFuF++l8m2DCwH84aghaxVt4bB5nDoqCDnX1EP1+vxHpEEkTLq2MHzaM
	EiheHJ5k7GFLohNzN09q1UFPsnXfZi/Lef3Ka3HaHVBtqMYGxcyjgKeCfWlqT2w2Z8U=
X-Gm-Gg: AYBFou0ujRfaHsKmWYRsnuI/xZmwkwZ6vgwRbghRCdzwrdV5URiMY+Uu9vkrXjIOB3i
	xo5m2thI8NpLQcbTrJU1+UJJPonXsybBWo1Asb/mrkxB78igCRj7W4yvadvHAyRXiY9MkEmxr2i
	/pKnUc0Eaol9ZdZxyb7qwnhm/URFPCaahBfyj5FKuNq7BkT9dh/BHfH7BT6ncR5sTDLDxRnXyJ/
	jLjF4tEuWdSRWdiDVRyZIvZXlGWn3bRpxs+qNxHoHe9WHNL4EzdUHYn1XGK4cb1DUaiar/b9ChG
	wRBrF1R8jlksea6K383BH3IRsiAYWLEmQ+zSu+rd3059K38u+ST41/0pA1zdz7k5U9A4b2OPq3m
	6n7e1rwq+ZK3mwJ5BqhLdZa5K/DJ5tTs+Q8VgHyUgi2+1BYpgFdfiaNmuSAxdHZBSrqfBrQWsXU
	j7jY/hlADlERtDwpWCwNUV/TXtSbD2kuDpCV2diQP5zokJOCgQZTLFNPZo3s2ygXV9gvIIRjuux
	mls5Obx90GYoF7bIgkwvY96bZF2qFWJB2TSW4sAcSw=
X-Received: by 2002:a05:6820:208b:b0:6b3:50e5:c625 with SMTP id 006d021491bc7-6c0bde62624mr6480780eaf.32.1789141322172;
        Fri, 11 Sep 2026 08:42:02 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:42:00 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 05/15] io_uring/kbuf: use io_ring_submit_unlock() helper
Date: Fri, 11 Sep 2026 09:40:55 -0600
Message-ID: <20260911154148.644489-6-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
References: <20260911154148.644489-1-axboe@kernel.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_084202_956206_CEC4AC37 
X-CRM114-Status: GOOD (  11.23  )
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

io_buffers_select() open-codes how it unlocks the ring based on the
issue_flags, use the generic helper instead.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/kbuf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index 7c309173dd19..8f04e6cc773b 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -371,10 +371,9 @@ int io_buffers_select(struct io_kiocb *req, struct buf_sel_arg *arg,
 		ret = io_provided_buffers_select(req, &arg->out_len, sel->buf_list, arg->iovs);
 	}
 out_unlock:
-	if (issue_flags & IO_URING_F_UNLOCKED) {
+	if (issue_flags & IO_URING_F_UNLOCKED)
 		sel->buf_list = NULL;
-		mutex_unlock(&ctx->uring_lock);
-	}
+	io_ring_submit_unlock(ctx, issue_flags);
 	return ret;
 }
 
-- 
2.55.0


