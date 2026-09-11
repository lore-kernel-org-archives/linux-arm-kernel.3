Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA96AC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfA4gKLRjMNP2H10G64YdooBaWutPGm7Kf7SsyC2UwA=; b=J4CpYyC16UyvN9t+aiDuNWtQO3
	+KuyGgyQjlq96nF22ewvCr4XnFY+fJhjGWjnqOpBqxaWcnCFqWELyhno+zROyP7ruRXo6XM2f0sJR
	etPaxK4Q6Cu388Qr+SPLOwiLnZ9nAB3QFZ57EBU6zmCurie6m5pGWH1CR4h37TS/sYJ9bFoxzkwyR
	gWTiFQVOR4TjL9Xk4TJcSTfbAfHAnd0anAFRmvF79XSZLjbNcqJ9rtKku3GiU/M2AJFyL/qVU4xLo
	sr9LyB8VpJXKaM/Oq7cUWalIAYE5RtVwGnAWf6jSqFl4WkG+D1T/I984gb7LR8dFjbHdez/GCGm8a
	D7z8rb7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53Ob-0000000H6Pg-1CMz;
	Fri, 11 Sep 2026 15:42:33 +0000
Received: from mail-oo2-x0e.google.com ([2607:f8b0:4864:31::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53OK-0000000H6Cs-3bvL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:42:20 +0000
Received: by mail-oo2-x0e.google.com with SMTP id 006d021491bc7-6beed321ad9so639900eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141336; x=1789746136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UfA4gKLRjMNP2H10G64YdooBaWutPGm7Kf7SsyC2UwA=;
        b=aTJsTyDnUP8OQ97DW1oD2jR1xXg0bsem9qCnDBH0ANxuOZTDD2z1gFLd8dEu/M/62V
         V3ZlA+xkNWVWh89q2kyPtHktn8sVIItNzmozae/8LTrYmPHOhAkeMIwUTDCEe79DP0BA
         +3xT+3PvhKVZ3nWFEqq+Nmf5PRgUXAIfuiu6C80Ap+NErCaM5cErO3iknst7NrCpcV/z
         vGJJsBFsH7DbKmNtF+siYgiIutObvQJF1bBFtZNg1bQ8JV3nlXWvbFhntR3EWRvoiKYW
         fwrkeWplPmfleTqRjhTMscb0nyzH2WFWqaUXyvuyQGnCjbUC82IsEMdMAWTGe5Cx3KKd
         h2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141336; x=1789746136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UfA4gKLRjMNP2H10G64YdooBaWutPGm7Kf7SsyC2UwA=;
        b=rKR8NTDGtavpsN2M9XmJghgCn5se1Y+GOnpvCuygMCLRX8MUhyLF1gnw+xyp9lra+6
         6MOchIN1xqo8fzCi5hcDBzem2II/+IN0+/P9qM0hiuVe+5hmKIogXMTj4wwkWGXN165u
         66IfKr/Tq3Fx82XEb4YaqJ4xNDYqVrb5GrpcA3xCn/M5rXrCLxI8v/zAHAPFB4Xw6r+q
         9OcwPweIQX/T4OOpq8BBdSboYQowuFyTolY2KbHQ/G+/n+NWnih/LJr8nsIVw8YOjazi
         vA9qcFBmWtTYHO7bENt52ztOFHfzDSqUp+n9a/G172O2NIdJTX/3Hykgm5OxGm5VkldJ
         4zCA==
X-Gm-Message-State: AFuF++kbziyOzEVZMqOQ7u9g/GI1ULpgp79wkhjNw33HzNAUa58UnUnC
	u2lYOIdDLdyEGu3/BuQNFsm+verlTn6Q6syreGYGBr6m7Osu5Xk4fUy0SzdSnPvoJOI=
X-Gm-Gg: AYBFou0QL/THVc7rFz7KSb/OMNFm19cQKHcrY24M/aeCHKK6BXCn5m6EVfMJoy3VDjc
	xtYyugNwIU9ukHUd/d/uf7kqpj0O49iLb+MCQPiP29PH7g9syf51rV64UsH1pxzI/fK2KMamWoC
	5VexPLEfoAILzlBW229IM+ANCEYddW7y+5oJmxoLNNgBMPdODpKDICkQ9l9bId8rlReimw0YLWX
	UYFszAIeGywWbWG+029N+4Puem8QV/oaFiNWVlE1X2tfJPu8GMnE9yLQNFDAL5NozIwibYmBEEf
	/Q+Sz37uShbusNN4XGWBfUWwKT1IFSpaOjTG1/tnvPR1n7TDUvuAcp9ELUP181JLnUUpF/kVY8c
	JtCQPPYbFD4zDCT0i8o4fVFa5CdY83Iq8+uCDPCljrDcFArpikizBQKVIfCZrrLOODfYWKliROm
	4yEuLCYL8DOmavugIUqzvNgKf95SM2NEJiJ5X7VL1zpeueOWOeXO+j8/OMmUpHMNglFt5xBpw5S
	5Jm+BB99TYPIpY+ySmaCG+X+VT+DYHfucBIzk1YBqQ=
X-Received: by 2002:a05:6820:f00b:b0:6bd:cd33:b885 with SMTP id 006d021491bc7-6c0bc4c8a27mr3367535eaf.42.1789141335900;
        Fri, 11 Sep 2026 08:42:15 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:42:15 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 15/15] io_uring: issue IOSQE_ASYNC requests inline when a handoff is possible
Date: Fri, 11 Sep 2026 09:41:05 -0600
Message-ID: <20260911154148.644489-16-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
References: <20260911154148.644489-1-axboe@kernel.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_084216_946601_E5093BA9 
X-CRM114-Status: GOOD (  13.26  )
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

NOTE: undecided if this should be the behavior.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/linux/io_uring_types.h | 3 ---
 io_uring/io_uring.c            | 5 -----
 2 files changed, 8 deletions(-)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 37c56ad37e05..dadbe3655138 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -651,7 +651,6 @@ enum {
 	REQ_F_IMPORT_BUFFER_BIT,
 	REQ_F_SQE_COPIED_BIT,
 	REQ_F_IOPOLL_BIT,
-	REQ_F_ASYNC_USER_BIT,
 	REQ_F_HANDOFF_BIT,
 
 	/* not a real bit, just to check we're not overflowing the space */
@@ -748,8 +747,6 @@ enum {
 	REQ_F_SQE_COPIED	= IO_REQ_FLAG(REQ_F_SQE_COPIED_BIT),
 	/* request must be iopolled to completion (set in ->issue()) */
 	REQ_F_IOPOLL		= IO_REQ_FLAG(REQ_F_IOPOLL_BIT),
-	/* IOSQE_ASYNC was set on the SQE, not just by prep */
-	REQ_F_ASYNC_USER	= IO_REQ_FLAG(REQ_F_ASYNC_USER_BIT),
 	/* vetted at submit for an inline blocking issue with a handoff */
 	REQ_F_HANDOFF		= IO_REQ_FLAG(REQ_F_HANDOFF_BIT),
 };
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 7c2aa0cfacc8..04e2fbdcb3dd 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1771,8 +1771,6 @@ static int io_init_req(struct io_ring_ctx *ctx, struct io_kiocb *req,
 	/* same numerical values with corresponding REQ_F_*, safe to copy */
 	sqe_flags = READ_ONCE(sqe->flags);
 	req->flags = (__force io_req_flags_t) sqe_flags;
-	if (sqe_flags & IOSQE_ASYNC)
-		req->flags |= REQ_F_ASYNC_USER;
 	req->cqe.user_data = READ_ONCE(sqe->user_data);
 	req->file = NULL;
 	req->tctx = current->io_uring;
@@ -1919,9 +1917,6 @@ static bool io_req_force_async(struct io_kiocb *req)
 		return true;
 	if (!(req->flags & REQ_F_FORCE_ASYNC))
 		return false;
-	/* userspace asked for it, keep the explicit offload */
-	if (req->flags & REQ_F_ASYNC_USER)
-		return true;
 	if (req->ctx->int_flags & IO_RING_F_DRAIN_ACTIVE)
 		return true;
 	/* the file decides on pollability, resolve it now if fixed */
-- 
2.55.0


