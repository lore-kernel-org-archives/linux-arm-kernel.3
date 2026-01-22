Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C08C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 08:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vwW8IDXkqMvABMcJ3/3TswD7cwMa2d9rG/SJRnyai2A=; b=kgxNBPuDRjVajftIVuyj6Q4Pzr
	BYrbPR2FdUVpPaEs8HSS3tv96xE/BTHOz95WgJpsRXqWFBGXVMXJGtPfFPnuoguAgwTRic/LMM/qG
	cac/kq25SWJOg+nJNg8OJLy6+d/1YUGnqpeWZH8hQvfTOvctveBHJOUMwMj76XQCkQcVTZY59+mqC
	4OOVqYFt37bPFIvZB48kBazlOu1yC0wTToi6CBoHDLeWXEzGIdRM936dUh8WqS5x8ZPNrSFfK0gb6
	h+XGc8bsWhsoL7QRW5LDq7PcPYJBbci0MI8b2gZLnu96vKcLfZXy2KLpI7BVKUaNLh3PU4XXWuN4H
	0b0bqOrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viq7P-00000006eVJ-4BYP;
	Thu, 22 Jan 2026 08:32:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viq7J-00000006eSX-2jIl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 08:32:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2850F41987;
	Thu, 22 Jan 2026 08:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 005B8C116C6;
	Thu, 22 Jan 2026 08:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769070756;
	bh=LLhB3J4m5a0dTpoW8ctYFKn5mu2uLbvwih+4M0rsLMw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qciHDGOcWXwHztpkMdmH5sLi8OjH1DY+ZUWSXH601WIdcAWIP9ISwgcYJnGOCb2XP
	 Y01ALQVWn+WrE/cxwMPMR14HQu8nGNDzVZEUBnJGdqKzeNfKLe8IJogQxWtnh0rVgS
	 0+XcpadOE9ZsgTlJDimoXUjSm13GpZ/b63WsSVPyOyNHYOZ86hckTJJFCtp6rsXsj/
	 mJ0ZPBl/3Rdki1ks5bH8xfCHHwjXrHQ0ScCXJ/JLYFnP+9MTdd+8LeVL1+VZUkWvwd
	 Q7C0a3QioPL6QJSdmJzh/puEvq28qZMtv3+0wionsM+QUMwbFqWkeHdqn7Hz1hnXoq
	 v5Ad19SPOIFUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1820C44500;
	Thu, 22 Jan 2026 08:32:35 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Subject: [PATCH v2 0/2] i2c: xiic: use generic device property accessors
Date: Thu, 22 Jan 2026 08:32:30 +0000
Message-Id: <20260122-i2c-xiic-v2-0-134f5d743e8b@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ7gcWkC/03MQQqDQAxA0atI1o2MsYp21XuULqJmOlk4SsYWQ
 bx7h666fPD5ByQxlQS34gCTjyZdYgZdChgDx5egTtlAjlpXEaHSiLvqiPXAXe99I9zXkPPVxOv
 +Wz2e2d6WGbdgwn+DqnGOumtbUlN3PVbIw/Q24zBzvEfZt7CsJSuc5xfG2wXWmgAAAA==
X-Change-ID: 20260122-i2c-xiic-3ba89ff5ea93
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769070755; l=951;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=LLhB3J4m5a0dTpoW8ctYFKn5mu2uLbvwih+4M0rsLMw=;
 b=+tZ5Zf3eiPLTTqfzu0IBnoNfd1f4U1RPJdxysXHB1nD2bss1wzmnJw6G50cAfKiONnI38O2zC
 /Y+ZUkpeoGvAl2HZE38t5EzilD1jGZquagjFfSeVLJwpxFXF18IjUyc
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_003237_721926_5F17EFD7 
X-CRM114-Status: UNSURE (   8.52  )
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
Reply-To: abdurrahman@nexthop.ai
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Switch to generic device property accessors and make minor code
refactoring.

Make the clock optional since the driver is designed to operate without
explicit configuration in firmware thus making it useful on platforms
where clock is not or cannot be provided.

Changed in v2:

* Split the patch into two independent changes.
* Added struct device *dev at the top of probe() and remove() to re-use.
* Switched to device_set_node(...)

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Abdurrahman Hussain (2):
      i2c: xiic: switch to generic device property accessors
      i2c: xiic: make the clock optional

 drivers/i2c/busses/i2c-xiic.c | 60 +++++++++++++++++++------------------------
 1 file changed, 27 insertions(+), 33 deletions(-)
---
base-commit: 944aacb68baf7624ab8d277d0ebf07f025ca137c
change-id: 20260122-i2c-xiic-3ba89ff5ea93

Best regards,
-- 
Abdurrahman Hussain <abdurrahman@nexthop.ai>



