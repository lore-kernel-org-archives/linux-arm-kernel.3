Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8E4C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 04:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rD26B2ni0kFYa0g/4XAZMUuuJ/9QmM0zCW4jxKOYC40=; b=SvWcv6InU7NpB0QaTce3r0LGNb
	9nEAh9KYYe+XS5ARgzzoooZTMAu2O1LZVIuKUWSZSIX3kBiBevNfTTwRjL2JwNIsAA7JO3xrmrD58
	oKctoFFy6QHwHZCC4pvgnlHJH+E7kNNKifF3zYbtarUbwHXKmssBz7cIYtDdenvj0q6TgzZlsvbUq
	ms2ReD5f8GdOkw79WJIgq226yMyl9LRlm2VLjBK6940AsNxhpitFeJ/iXDjWkfDGNtkbLlStb8DkS
	pl2A7BkxSZqI6+IWpFXSXdqkOYWC7NR1Naw79dotd+To77XTcSJFKhq/kkaC/NxnpeK0KjBHLljfH
	2UEKxtMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x49zD-0000000Akvi-2g7Y;
	Wed, 09 Sep 2026 04:32:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x49zA-0000000AkvH-0LA4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 04:32:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13095601FB;
	Wed,  9 Sep 2026 04:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3413C2BCF4;
	Wed,  9 Sep 2026 04:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788928354;
	bh=GGvaoobDFjXxyynB7itBjEHKaBgEXjrPgUkJXaWfKWw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jY6xz3W1EvUxHcRdA6eX3BSqnMaa2l4xc2ckHvmM975G5oX0SV4/UzXL6b7wjAhH7
	 vUPJFLtgNDnpkMQgHBlQdOCEMHYTseB7EE1ACbjMtHpyV/4hJghLW2MxvGVjwvEcLG
	 d6b1nVi2b2bFv5efA1kVKW3Wca2xqDUutKXojOrieULgB/wzspgL6jwKsltVEsZRCI
	 OnpE+anrh65/s2OOLoigrYbWUDpPvh/70L50N9JxKfOYxPFN+pNxmepPMv71Jz5TZV
	 saLhFYxVCuQoQ5yGsCKbVM/6gjpQKF7+dGsrgsKNbufpLmZ1Aj6u6crWN7viNJVbT1
	 aYM35ZBUoEpoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A33C79FB5;
	Wed,  9 Sep 2026 04:32:34 +0000 (UTC)
From: Roland Dreier via B4 Relay <devnull+rolanddreier.rivian.com@kernel.org>
Subject: [PATCH v2 0/2] Couple of SCMI race fixes
Date: Wed, 09 Sep 2026 04:32:26 +0000
Message-Id: <20260909-scmi-async-done-race-v2-0-cc5dec25c6be@rivian.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFrhoGoC/4WNQQ6CMBBFr0Jm7RimCKgr72FYlHaQMaE1LTYSw
 t0FPIDLl7z//gyRg3CEazZD4CRRvFtBHTIwvXYPRrErg8pVlZ/phNEMgjpOzqD1jjFow6guRHV
 niS+6hHX6CtzJZ8/emx/Hd/tkM26tzegljj5M+2+izftzkQhzLIqypaqwdc18C5JEu6PxAzTLs
 nwB6wXKZcsAAAA=
X-Change-ID: 20260814-scmi-async-done-race-29117fd1e9a5
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Roland Dreier <rolanddreier@rivian.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788928354; l=2176;
 i=rolanddreier@rivian.com; s=20260814; h=from:subject:message-id;
 bh=GGvaoobDFjXxyynB7itBjEHKaBgEXjrPgUkJXaWfKWw=;
 b=Wd3xx9+HBZXxwiSDuiO7nMb+AEUibpqrk8KVUL3jzg0Bh28DAiyPw4TOmweKDH1VM+Mg5SHLi
 tzBihPf2lgkABSv8mRAU7bwcEeXfDyZXtFMpa+B81Vyce6sluDwTlQw
X-Developer-Key: i=rolanddreier@rivian.com; a=ed25519;
 pk=C7SBXsDIlarq7BpINqyDL67XV/AGNqNt09NCCpFcExk=
X-Endpoint-Received: by B4 Relay for rolanddreier@rivian.com/20260814 with
 auth_id=952
X-Original-From: Roland Dreier <rolanddreier@rivian.com>
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
Reply-To: rolanddreier@rivian.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Noticed a couple of races in SCMI code around delayed responses that
time out. These are probably nearly impossible to hit in practice but
the fixes are pretty straightforward and it seems worth having the
code be sound.

The v1 fixes were correct as posted, despite Sashiko warning that the
new "delayed_response_dropped" debug counter might never increment.
However, that review made me think that a new debug counter for a
one-in-a-gazillion race condition is probably less useful than a
kernel error message. So the change in v2 is having the first patch
log an error for a delayed response that arrives in the race window it
closes (matching the existing "Delayed Response not expected" error in
scmi_msg_response_validate()). The new error is expected to be
extremely rare but it makes sure there is no path where a delayed
response gets matched and then discarded without any logging.

Signed-off-by: Roland Dreier <rolanddreier@rivian.com>
---
Changes in v2:
- Patch 1: replace the new delayed_response_dropped debugfs counter
  with a dev_err() log message, since the condition is rare enough
  that logging is more useful than counting (per sashiko review of v1).
- Link to v1: https://patch.msgid.link/20260814-scmi-async-done-race-v1-0-335b163d77ee@rivian.com

To: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Roland Dreier (2):
      firmware: arm_scmi: Protect xfer->async_done with xfer->lock
      firmware: arm_scmi: Don't reuse raw xfers with async_done still armed

 drivers/firmware/arm_scmi/common.h    | 22 ++++++++++++++++++++
 drivers/firmware/arm_scmi/driver.c    | 38 ++++++++++++++++++++++++++++++-----
 drivers/firmware/arm_scmi/protocols.h |  9 ++++++---
 drivers/firmware/arm_scmi/raw_mode.c  | 29 ++++++++++++++++++++------
 4 files changed, 84 insertions(+), 14 deletions(-)
---
base-commit: 786262be6048deab760f68c8acc2c85607165894
change-id: 20260814-scmi-async-done-race-29117fd1e9a5

Best regards,
--  
Roland Dreier <rolanddreier@rivian.com>



