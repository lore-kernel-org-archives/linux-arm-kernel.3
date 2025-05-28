Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E978C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 08:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g0cfF4qEZbAXOJIUPRdk9jaOuCso55vAZ3mnyUehlgw=; b=lEzdIxLEpu4f6bMk96dwYRYgeC
	jpNIkPI3uKBjgWve2HO4kmLkmGLs7eT+t3nH+Ibvd6wQi2YxMJYKcAh5H2KPMs2p17COkA7fzFDwd
	jDkBi7nQ1OpTZTNcWwlMCLaoS4Sl78Y08PHAihr1ZW9o6qIWNui48bEHP1OIkUQD2hHzajQ5gxunc
	yAIi1klMrvKKigiws0npKC8pqRe8+m8koCvCU2g5wx0FVSXV2QOH34znW8xsFXqJ4dcmkHjfVxCvU
	z9sSRghiE1DV115URiQruo+gxkm8vVEQo4ZO5JMyKFiHll/peK1UMW9KHAWb7JAhMwP3mqsPT/ySb
	Xp/kMhAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCYz-0000000Cdh9-1TcN;
	Wed, 28 May 2025 08:55:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCUX-0000000Ccri-1GVP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 08:50:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA5B51FC7;
	Wed, 28 May 2025 01:50:09 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 191FC3F673;
	Wed, 28 May 2025 01:50:24 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 0/3] firmware: arm_ffa: Fixes for FF-A notification
 handling
Date: Wed, 28 May 2025 09:49:40 +0100
Message-Id: <20250528-ffa_notif_fix-v1-0-5ed7bc7f8437@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACbONmgC/x2MQQqAMAzAviI9O6iVgfoVkTG11V6mbCKC7O8Oj
 wkkLySOygmG6oXItyY9QoGmrmDZfdjY6FoYCMmipc6IeBeOS8WJPkZ67LH1xCvOUJozctH/b5x
 y/gBWLYp+XwAAAA==
X-Change-ID: 20250528-ffa_notif_fix-f90903a2ed0b
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Jens Wiklander <jens.wiklander@linaro.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Forissier?= <jerome.forissier@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_015029_436826_1478719E 
X-CRM114-Status: UNSURE (   6.24  )
X-CRM114-Notice: Please train this message.
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

This patch series improves the arm_ffa notification callback handling by
addressing safety and memory issues. It replaces a mutex with an rwlock
to prevent sleeping in atomic context, resolving kernel warnings. Memory
allocation is moved outside the lock to support this transition safely.
Additionally, a memory leak in the notifier unregistration path is fixed
by properly freeing the callback node.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
Sudeep Holla (3):
      firmware: arm_ffa: Fix memory leak by freeing notifier callback node
      firmware: arm_ffa: Move memory allocation outside the mutex locking
      firmware: arm_ffa: Replace mutex with rwlock to avoid sleep in atomic context

 drivers/firmware/arm_ffa/driver.c | 71 ++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 35 deletions(-)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250528-ffa_notif_fix-f90903a2ed0b
-- 
Regards,
Sudeep


