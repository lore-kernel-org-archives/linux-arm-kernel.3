Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD7DD7234A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 08:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v7F8COFysCCzTecabUlEzr7zmToa2j0DQRi95pTHuPM=; b=fpgp1mkxX73OazKzslX+pRLYPn
	hslgfqKbDL8K/b8cgiUOOlMtohnpWZbGutPLIll9iHT6pRp9oQjB+4KAAaRIU0KB0Zferudx7+y7x
	Jfj+3vS5TUFgRkTFreSNX4tCWImjUkzzzs3DGyca4QGZIByj90U20wakoVRudW+m9wxRzxN2nkfhg
	tWLz07q8FpiPNFd3tL+7VB4K6+Rm4IHRJufCfO1182V+Bdc91R0LcF5qmIWOJGgRJIHkIiUahePbC
	excq3I5kqj/coRPQvTpIissz1xt/pm12s/36DMVvCC5eDS0kFv3Grxaw3Lc4uSH0a5z4J9AweN1oR
	WhS08Odg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjC8R-00000008PWs-456D;
	Fri, 23 Jan 2026 08:03:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjC8H-00000008PSk-4ALn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 08:03:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3124043765;
	Fri, 23 Jan 2026 08:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 012A6C4CEF1;
	Fri, 23 Jan 2026 08:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769155385;
	bh=1rwOw+x2PuObmHQg0PSYLfFOWrx5Tza0EXXyewj+reY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=h5M3ZMURzTxI5wPf2Ucxh6Gy0tAq52oWGxoXz0fhRkDeXGOJU+5E9cIilh91suocc
	 4n8FLg7ULFGtkJ0q+Z3PXKiSSkhRTPvFiUfP3/cRGxCb6OP4zGZb10FuyrfZvJ6KzB
	 smFmTcA6JTywPdx90BerdWprydp8lv6Fk7w8uEiwQRYEx2ZEAXCo1OHYa/m4Rx0KPF
	 2IGuAHP84P+CZmEXg6BBSQCXPJAKqPLeekD4HjQ84CsJorHt7CEsbj6ZJHLLD4UGpE
	 bgallqBYDaL17+O3L8PTiAVI4PWAbt9WLjwIUbvrYgEpl27wZieH7hkfLgKYH1nq/L
	 TBvbmzVBv0TKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF05DD72349;
	Fri, 23 Jan 2026 08:03:04 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Subject: [PATCH v3 0/5] i2c: xiic: use generic device property accessors
Date: Fri, 23 Jan 2026 08:02:43 +0000
Message-Id: <20260123-i2c-xiic-v3-0-eb7cd4254dfb@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACQrc2kC/23OOw6DMBBF0a0g1xlkj4GYVNlHRGFgHE/BRzZBR
 Ii9B6goUl7p6eitIlJgiuKRrCLQzJGHfg99S0Tjbf8m4HZvgRILqRCBsYGFuQFdW1M6l5Mttdj
 nYyDHy0m9qr1dGDqYfCB7AVQuJZqsSDHXpgQFtm4/IVjf2f7Z0zL5YUwtH57nOA3hez6b8VD/n
 JgRJCiduby9Z5pMfUWqbdt+Nx4SmeEAAAA=
X-Change-ID: 20260122-i2c-xiic-3ba89ff5ea93
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769155384; l=1405;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=1rwOw+x2PuObmHQg0PSYLfFOWrx5Tza0EXXyewj+reY=;
 b=USCULF/Lt5spK7qklBMl8/C7UImXxBOgAQSZhQzHy4Un6pnZOdalSTsrFx40NPp29mtap4Ceq
 2mnIqUUI5wRDBX1nEhY0RzJZBjQVzfpPeu33DzJW3XmvnaZBlvBoABY
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_000306_055979_9003A7DB 
X-CRM114-Status: GOOD (  10.02  )
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
Changes in v3:
- Reorder the "optional clock" patch to be the first in the series. 
- Add a patch to switch to devm_mutex_init().
- Remove dup message in error path.
- Cosmetic: use temporary dev variable.
- Link to v2: https://lore.kernel.org/r/20260122-i2c-xiic-v2-0-134f5d743e8b@nexthop.ai

---
Abdurrahman Hussain (5):
      i2c: xiic: make the clock optional
      i2c: xiic: switch to managed version of mutex_init
      i2c: xiic: remove duplicate error message
      i2c: xiic: switch to generic device property accessors
      i2c: xiic: minor cosmetic cleanup

 drivers/i2c/busses/i2c-xiic.c | 74 ++++++++++++++++++++-----------------------
 1 file changed, 35 insertions(+), 39 deletions(-)
---
base-commit: 944aacb68baf7624ab8d277d0ebf07f025ca137c
change-id: 20260122-i2c-xiic-3ba89ff5ea93

Best regards,
-- 
Abdurrahman Hussain <abdurrahman@nexthop.ai>



