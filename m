Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CADD77881
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=swqKW/G3UM+k6f3+e2uz1ef9o1dF12z26c9GwoD0rlc=; b=4wen9Yo/HzZL1MgpwU10VU2nUb
	X/ZwZTjZYC+SUVJntfRh3oNqXsAfUOZ5gBf0gpIaOWgd/hrntgdXOsYvArJWHOJI561GtegTmlIMA
	gfiF8TJJcMIEyjPd5geP08zLsjmJ1nW9rvS9lOEzn5s0So81lBV2iNGh69S1frnebqkE6Xw3sWEdJ
	Nh8ZR0m6q6lOU1mGXFzin4Mgl8NHJ6bcBZUZ+t+etrbxMPyIth90q4kN+qzbRSHef/dVB1U/tfqSN
	llxOXZt+3yf5F4CyuWX0/oDYuf2ItVull2f/qRqXeXGeRt0xa9zRnbxZFFxV9hwxhZkfejzYyex+G
	NsP0ZhZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjK72-00000009CtG-0AIC;
	Fri, 23 Jan 2026 16:34:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjK70-00000009CrZ-0jXE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:34:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AF8C600C3;
	Fri, 23 Jan 2026 16:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFEECC4CEF1;
	Fri, 23 Jan 2026 16:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769186056;
	bh=SH2RWWiwpkeWyZQeIGuiuLmQkTXrbQiB6gtTSnYx/14=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=sB4/yzzkOfQLoN8l/lgSi5tZTxM7tgMUq6hWreDNSMaD1xDGceibW2az5uI8+3kzZ
	 DaEeXuOENCQqd5GaaLRjZVnsv1pV1VijOek8nOEXxKRrxPwNiYORyOzg1TcLZPMLqC
	 jo7jDjeeEwsctyuwmiEdcfSUcJOqIsgitv1NqZTh3+lVihmwvMgC8BDdkUhwjLmyby
	 Wz7Ok39SsXjEbZH09zZy/WE3ISqxkqRNpQtGWu5R8sfYTcCIUt7+rXRgTP9ZfraLA6
	 ayNXYViPwNBIeyBywPnQ7lLPHBVEnZdicaNEkQ0zZo19LuTWa8I0PApniCQz5ElpDw
	 Jp+tQbAmzbuRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8534D74EF7;
	Fri, 23 Jan 2026 16:34:16 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Subject: [PATCH v4 0/5] i2c: xiic: use generic device property accessors
Date: Fri, 23 Jan 2026 16:34:13 +0000
Message-Id: <20260123-i2c-xiic-v4-0-4a3eba3510ce@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAWjc2kC/22OQQ6CMBBFr2K6dkiZtgiuvIdxUejUzkIgBQmGc
 HcLK0xcvuS/l7+IgSLTIK6nRUSaeOCuTaDPJ9EE2z4J2CUWKLGQOSIwNjAzN6BqW1beG7KVEmn
 eR/I876n7I7GP3QvGEMkeArmREktdZGhUWUEOtnbvGG142fbW0jyGrs8sb73Aw9jFz/5swq365
 8SEICFX2ht30YrK+hjZXkzqaKqDqZJJ9aVxGo12/tdc1/UL3bsVxBsBAAA=
X-Change-ID: 20260122-i2c-xiic-3ba89ff5ea93
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769186056; l=1708;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=SH2RWWiwpkeWyZQeIGuiuLmQkTXrbQiB6gtTSnYx/14=;
 b=flb3w1tYsbw3Rosf7jIaipmBHlhMiYFVpLk6X/cKjH494wEKjC4uGWHOqcn+Seh/WM9J0DYCi
 PsXPY+dxdfnD7Pt5LDibPjYywOKDLlBX9IKIV7N3hsOt6CzxS1vxM2X
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
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
Reply-To: abdurrahman@nexthop.ai
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Switch to generic device property accessors.

Switch to managed devm_ functions to simplify error handling.

Make the clock optional since the driver is designed to operate without
explicit configuration in firmware thus making it useful on platforms
where clock is not or cannot be provided.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Changes in v4:
- Reorder the cosmetic patch to be the first in the series.
- Amend the mutex_init patch to also switch to the managed pm_runtime_
  variant.
- Link to v3: https://lore.kernel.org/r/20260123-i2c-xiic-v3-0-eb7cd4254dfb@nexthop.ai

Changes in v3:
- Reorder the "optional clock" patch to be the first in the series. 
- Add a patch to switch to devm_mutex_init().
- Remove dup message in error path.
- Cosmetic: use temporary dev variable.
- Link to v2: https://lore.kernel.org/r/20260122-i2c-xiic-v2-0-134f5d743e8b@nexthop.ai

Changes in v2:
- Split the patch into two independent changes.
- Added struct device *dev at the top of probe() and remove() to re-use.
- Switched to device_set_node(...)

---
Abdurrahman Hussain (5):
      i2c: xiic: minor cosmetic cleanup
      i2c: xiic: make the clock optional
      i2c: xiic: switch to devm_ managed apis to simplify the error code paths
      i2c: xiic: remove duplicate error message
      i2c: xiic: switch to generic device property accessors

 drivers/i2c/busses/i2c-xiic.c | 83 ++++++++++++++++++-------------------------
 1 file changed, 35 insertions(+), 48 deletions(-)
---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20260122-i2c-xiic-3ba89ff5ea93

Best regards,
-- 
Abdurrahman Hussain <abdurrahman@nexthop.ai>



