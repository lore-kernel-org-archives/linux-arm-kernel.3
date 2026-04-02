Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF59D6AAF5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 17:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5ceebF0cNoevtXZxXS/tupzteUV9Qk2AK74OlrZ5xNE=; b=uVXZ+Ar6NtmAL3n9tnhNI4Of9Y
	QEBUWVrL754YCN3Ooaq/iZ8Tt4gBHJ7acy47PsBpxDtPcmzrJ03CEJHgYYc0GVEbb6WXwMmeKEz8l
	8VYB1bnLwNUxMwDFQoonDBbok8k1Fnc6Ge6w0KCeNt+L0cDd9O+X67Hejr+tP4yo9KN9aNpIOW6Ef
	4FcXTSNJCcaXz2A0iqLeaFEHwtZcXMNRqI6mSvngmFVIWzqIWJgRotbNcoIQzm9EE0BmLtIcgtBGF
	v5KF8ydPK6foOhKgtJPTMhHQt2/zop0T5YK4KZoaCGnXGlZu7F1qs0C38KzhU1aWfJG+fHxr+3EZS
	ePrUY5Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LVX-00000000ZfV-3D6W;
	Thu, 02 Apr 2026 17:07:03 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LVU-00000000Zed-35Fr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 17:07:02 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2b0bf2b3879so27197025ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 10:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775149619; x=1775754419; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5ceebF0cNoevtXZxXS/tupzteUV9Qk2AK74OlrZ5xNE=;
        b=Fb8t/8OLs9lVc+lM51/Za1XH2Av699OfqeKCARg1ttgwND64viVznSFM0O7r7L6DTP
         V4JkCpbWBuOk/EwrgJLYaFFQcJQeHr41JL6ieNt6OJVz04AbvkZ9gzeaLm4dsv7o1heM
         307YkarkcToT1rjkPkcDvVa70yRF2JhMNrcuZfVvalFmrXmkNYA+ym9VSjgVV3Rs49kw
         08pg0MyGdkVlB9Pkj4ET+h/nsGcngI/5MtC1bNS5c+/7jScPprBjBVIXuOc5zOyN4577
         S2UJGJUHo7qDE9o69zZ/fbFuZkC+mf5xo8UuQcjiRoKvPJh3BOKzX6IAQBFST7jPISmC
         4IGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775149619; x=1775754419;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ceebF0cNoevtXZxXS/tupzteUV9Qk2AK74OlrZ5xNE=;
        b=F/xcREt9TPoS4w1SkCmz3KoXIJqNZL/lh3WJlxPYKLqMH2GWsul8P/baLJMGt3mJNi
         zNhkqtOBB5slmhYr5N+NNkLuV6wNAP7648PQD9/JCucD/IhpEteJcle65DdxoZaOQGxU
         of/Uf4FUGup9b2DSrkPvJo7dH/CB5zIEph6PowSNbNVA3/QhHqPI/c6Z59M2VuKEcBSg
         6oAbX4f9iX6xJyBGoGFlb7TgOikfJ20VBVCRGEBEuNea+NZTKt1b5IbkdgafT/QX+pJF
         CJkoZ1aVz2qte9gPfE1zBhOt21xXIVZama3tk4VFh2TyTCxHKcb7kSH+oZLZhXhdEv8d
         1G/g==
X-Forwarded-Encrypted: i=1; AJvYcCUqeBYPhO/TIYMvtOipCXuHZr7LuxrzFZ/+T/mrc0fpRPCzx/fc1jcJB9VzsU8oDXLIkfQRepSIcM3Uw5au4tPG@lists.infradead.org
X-Gm-Message-State: AOJu0YxBkvKRnhPHxAcS6dKuM5a+H9Ur9Hi73jK21XjYuGu+LMmkHX8n
	YauWNNWbFlOBMzmok4lVLKNndeI+HR6PbfVkTc0ANjRcbfsWNm3TNyYAagU+dUkHd8VLJCapHZa
	dFYNTK2419ddTqk7VTtXXNKMPLw==
X-Received: from ploe7.prod.google.com ([2002:a17:903:2407:b0:2b0:b03a:16ce])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3d0f:b0:2b2:4cd2:e174 with SMTP id d9443c01a7336-2b281811ef1mr573475ad.43.1775149618937;
 Thu, 02 Apr 2026 10:06:58 -0700 (PDT)
Date: Thu,  2 Apr 2026 17:06:39 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260402170641.2082547-1-joonwonkang@google.com>
Subject: [PATCH v3 0/2] mailbox: Fix wrong completion order and improper send
 result in the blocking mode send API
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, thierry.reding@gmail.com, 
	jonathanh@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Joonwon Kang <joonwonkang@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_100700_769335_E037F61B 
X-CRM114-Status: GOOD (  23.35  )
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

Hi team,

This patch series fixes the two major issues in blocking mode.

1) Wrong completion order in the send API as described in [1]:

        Thread#1(T1)               Thread#2(T2)
     mbox_send_message           mbox_send_message
            |                           |
            V                           |
        add_to_rbuf(M1)                 V
            |                     add_to_rbuf(M2)
            |                           |
            |                           V
            V                      msg_submit(picks M1)
        msg_submit                      |
            |                           V
            V                   wait_for_completion(on M2)
     wait_for_completion(on M1)         |  (1st in waitQ)
            |   (2nd in waitQ)          V
            V                   wake_up(on completion of M1)<--incorrect

2) Send API does not return the actual send result.

This patch series contains two patches for each issue:
  0001-mailbox-Use-per-thread-completion-to-fix-wrong-co.patch
  0002-mailbox-Make-mbox_send_message-return-error-code-.patch

The first issue has to do with multi-threads support. Given the
discussion in [1] with the mailbox framework maintainer, it has been
long thought that the mailbox framework is designed to support
multi-threads although it missed the completion order issue at its
introduction. The first patch of this series is to fix it.

Alternatively, we could instead declare that the mailbox API does not
support multi-threads [2]. However, it would be a sudden big change to
the mailbox users after the long standing implication of supporting
multi-threads. Plus, it would have disparity with the non-blocking mode
which supports multi-threads already, which could also lead to confusion
to the users by saying "non-blocking mode supports multi-threads whereas
blocking mode doesn't". For this reason, the first patch in this series
does not choose this alternative.

The patch series rules out the case where tx_tick() is called twice or
more for a sent message on the same channel. In theory, it could happen
when timeout occurs. For example, one tx_tick() by the mailbox core due
to timeout and another tx_tick() by the mailbox controller or client by
accident or for any other reason. If it happens, the internal mailbox
state could become inconsistent even on a single thread. Thus, this
issue should be handled in an orthogonal effort later on.

The second issue forces users to register tx done callback to get the
actual send result although they are using the blocking mode send API.
This behavior is different from typical blocking send APIs, which just
return the actual send result directly, and so confusing to the users.
Without knowing this additional requirement of the API, it would be
prone to miss the send result check entirely. The second patch is to fix
it by making the blocking mode send API return the actual send result.

Change log of the first patch:
 - v3: Rebase on the latest for-next branch.
 - v2: Consider the case where timeout occurs and so tx_tick() is called
   for a channel by one thread while another thread is having an active
   request on the same channel. In that case, we mark the inactive
   request as canceled and do not send it to the controller.
 - v1: The previous solution in v0 tries to have per-message completion:
   `tx_cmpl[MBOX_TX_QUEUE_LEN]`; each completion belongs to each slot of
   the message queue: `msg_data[i]`. Those completions take up additional
   memory even when they are not used. Instead, this patch tries to have
   per-"thread" completion; each completion belongs to each sender thread
   and each slot of the message queue has a pointer to that completion;
   `struct mbox_message` has the "pointer" field
   `struct completion *tx_complete` which points to the completion which
   is created on the stack of the sender, instead of owning the
   completion by `struct completion tx_complete`. This way, we could
   avoid additional memory use since a completion will be allocated only
   when necessary. Plus, more importantly, we could avoid the window
   where the same completion is reused by different sender threads, which
   the previous solution still has.
 - v0: This first attempt tries to have per-message completion: [1].

Change log of the second patch:
 - No major change from v1.

References:
 - [1]: https://lore.kernel.org/all/1490809381-28869-1-git-send-email-jaswinder.singh@linaro.org
 - [2]: https://lore.kernel.org/all/CABb+yY39rhTZbtA21MecYk-R9fh7VQQr5kZUgCw4z92mWhZ1Rg@mail.gmail.com/


Joonwon Kang (2):
  mailbox: Use per-thread completion to fix wrong completion order
  mailbox: Make mbox_send_message() return error code when tx fails

 drivers/mailbox/mailbox.c          | 98 ++++++++++++++++++++----------
 drivers/mailbox/mtk-vcp-mailbox.c  |  2 +-
 drivers/mailbox/tegra-hsp.c        |  2 +-
 include/linux/mailbox_controller.h | 22 +++++--
 4 files changed, 85 insertions(+), 39 deletions(-)


Thanks,
Joonwon Kang
-- 
2.53.0.1185.g05d4b7b318-goog


