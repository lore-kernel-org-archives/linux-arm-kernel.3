Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79949C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 20:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gImwe61M4RDYSrzjXW15HHCfHXp3IzZkdvS1cIlK9ow=; b=sXD6FLRVUIpg74BTkk4s1DsNI2
	4dKRHXxR/VSg+WGChL+6lUQNZ4L9Uc1zmMTj1yWrQ4H+s9N4P0JnsNNTmkgwhl5bdgC5pL+QdI4Is
	8E+w/D60G8IbAfVp/wyutthznZG7aTqNpj/FW4txrWdXmeLXDnSyYQm2rcMCkNkKVlxkr2cWC6YEy
	vHzOsiJjR6hSMubSVpDPZQwvOy4yyHwXhOD9bbQZRZ6tIoHyIunxz+kDDHfPD8QN7dk2km7ggFD5x
	OnL3C1ck9J5A2vSzD9pHCuzCdVT4OvORCqDug+7SimzfLM1zl1FQYbTGNKiVr16RglIRDANPfrBFS
	yrzbIWmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuyKj-000000038H8-0guV;
	Fri, 14 Aug 2026 20:16:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuyKh-000000038Gk-2Yrg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 20:16:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 027F64050E;
	Fri, 14 Aug 2026 20:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1F8DC2BCB3;
	Fri, 14 Aug 2026 20:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786738610;
	bh=kyXZxlfFjxRc8A1yzHEvXAwoUlJDSZwiNaHsfRS0PTc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hTId0bm5yrpJIEKoeZF8yV3C2li6Tl2yYGw0Wv/3HgWZ6htrDHX37PdyWHTGgsF70
	 2YjJ2W3FQ1iiSbxa9ziZDRehKKblQm1IvIEcYwY7ML5Ih7oJWHVOdrxukkzXED2PK1
	 em0S6LhCqygFDNC6HXrkOaJCi0KeRSOXYoK8/CS2Gv8aTZXZaMPN0rEJYivvTOBfFD
	 FVW19pSEH0YhjhohRbalqez5CUdLfzWtl25XnWzYnehTwILAN2DmLse1YvKGfYlmc+
	 nbnWjCS4xZvFVNEvtvgwdG1Q8Rvqe3cpNSLCQYXoscxeSpOMiid4+BzmW28s0oL7o3
	 Sq6Mfi84+vXfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD572C5CFCF;
	Fri, 14 Aug 2026 20:16:50 +0000 (UTC)
From: Roland Dreier via B4 Relay <devnull+rolanddreier.rivian.com@kernel.org>
Subject: [PATCH 0/2] Couple of SCMI race fixes
Date: Fri, 14 Aug 2026 20:15:32 +0000
Message-Id: <20260814-scmi-async-done-race-v1-0-335b163d77ee@rivian.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGV3f2oC/yXMSw7CMAxF0a1UHmOpjsqnbAUxCM4rGIkUxYCKq
 u6dAMMzuHcmRzE47ZuZCl7mNuYKWTWkl5jPYEvVFNqwaXfSsevNOPo7K6cxg0tUcOhFtkMS9HF
 NNb0XDDb9tofj3/48XaGP74uW5QPeOiOYeAAAAA==
X-Change-ID: 20260814-scmi-async-done-race-29117fd1e9a5
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786738610; l=965;
 i=rolanddreier@rivian.com; s=20260814; h=from:subject:message-id;
 bh=kyXZxlfFjxRc8A1yzHEvXAwoUlJDSZwiNaHsfRS0PTc=;
 b=fklnXBet195Xl7+9WUzlKKApBOJT/7ophRWBEu3jZJc8RCaHZJiU3N8XIGeV9zKyUoUWqu5zt
 o+iT2qg8zcMC8dp/gPXNdObtdLNh1NnL1yd21kGJdBVoC8JO/IhqaLP
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

Signed-off-by: Roland Dreier <rolanddreier@rivian.com>
---
Roland Dreier (2):
      firmware: arm_scmi: Protect xfer->async_done with xfer->lock
      firmware: arm_scmi: Don't reuse raw xfers with async_done still armed

 drivers/firmware/arm_scmi/common.h    | 23 ++++++++++++++++++++++
 drivers/firmware/arm_scmi/driver.c    | 36 ++++++++++++++++++++++++++++++-----
 drivers/firmware/arm_scmi/protocols.h |  9 ++++++---
 drivers/firmware/arm_scmi/raw_mode.c  | 29 ++++++++++++++++++++++------
 4 files changed, 83 insertions(+), 14 deletions(-)
---
base-commit: a5161661ae99f497affa83a5b8654e457cda6267
change-id: 20260814-scmi-async-done-race-29117fd1e9a5

Best regards,
--  
Roland Dreier <rolanddreier@rivian.com>



