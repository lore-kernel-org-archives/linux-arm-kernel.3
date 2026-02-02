Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16990E7FDD9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 20:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sHDBdpCPw65GR7T8f61wKZDPn9+eZ8xok1UPBT64js0=; b=Jnnl5n6QWU/+eYBGAF4EgZwkcw
	PJD/b2JAef6qSy5Z66jZSQfKNh0lS0/zmpYtE2K9CALbV4IZ3rpx9lD3EJrsHS85WhzewIKXfUKvS
	pYul1a869g6i2w82FrFlb61uApkqsKX5EXzeeqKu5jSfOUPaW53ryseIzxqzOZxA3lFD3y0LS1s4+
	p9RsYkZW9isLq8bo+6jNlj5tfUrXiaf8lHZy6+8y5TOVh6WlunQXxQ01wsvjqFEWIex0UxMOjXwUf
	3F3Ou9mHuECA/ohKVXyt6krymF7441ImZ95gZa3Xmi6kFAZC33xDWJGTnvrdom8TDknsV1J9MqZkE
	3EhggaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn0g1-00000005cc1-36vG;
	Mon, 02 Feb 2026 20:37:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn0fw-00000005cXF-3l9R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 20:37:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A914042A2C;
	Mon,  2 Feb 2026 20:37:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B15BC116C6;
	Mon,  2 Feb 2026 20:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770064655;
	bh=A1/zLNhJfjFpBOKRyqAz2kve72MPbHG7NLjWIiqjpsg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=sgRURVy2I93F+eI8Coqcu55cjCX/IQdxGEYBnywl9hyGZ11iHFKpMj4cws7+tS8TF
	 DPqctMbCCT5GvlDbT7iTRRJbgTd1rZJwZhVas/c8q6MM918AxPA59Iru2KG2z7Vcrt
	 X1JWF2zKIkTw9maDX3mYNpYRchtICUo1xwa3btIGYZp8fw1veeLExh5CByfu84qA82
	 IZioCLKTWYWOikIiTgMl7oHQ5F+9T7ZjCN+RsfVHXp531UZZ9boRpNhrJ/KeZ/Xeng
	 yp/2oMZxrqXGkyjLzokK4BT3yx9rEwUPlUqSID8f4M5kbzAEGP6mxcSoi0YLveVkPm
	 cRIsn5n0x2f7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B1FE7FDD2;
	Mon,  2 Feb 2026 20:37:35 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Subject: [PATCH v9 0/7] i2c: xiic: use generic device property accessors
Date: Mon, 02 Feb 2026 20:37:17 +0000
Message-Id: <20260202-i2c-xiic-v9-0-ce4695f5267d@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP0KgWkC/3XOTU7DMBCG4atUWePKHv93xT0Qi4k9Jl40qZwQB
 VW9O043GAWWI83z6rt3M5VMc3c53btCa57zNNbDv5y6MOD4QSzHenfAwXABwDIEtuUcmOzR+ZQ
 0oZddfb8VSnl7pt7e653KdGXLUAibgNCcg1PmDFo6zwTDPn6WgsMVx9eRtmWYbmfMe2/I8zKVr
 +eyFfbqHyNWYJwJqZKOVklyfRvZV6yylbKRskrqbYgKtIrpKNV/UlWpUFKPUgse6CB1K00jdZX
 OoTAIzoIIB2laaRtp9rUOCJJJRtujtK30jbRVWrCkpHLeUjpI9yOBi0a6KiP1EKPQLgr8JR+Px
 zd1YViDPQIAAA==
X-Change-ID: 20260122-i2c-xiic-3ba89ff5ea93
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770064654; l=2976;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=A1/zLNhJfjFpBOKRyqAz2kve72MPbHG7NLjWIiqjpsg=;
 b=Ef7fK8HYs+2jpLp9KFy3BAz5ekxFj5yUdBTxuPbpnvohfr83RaFyw7Op/27m0Je1YyW8u/3mM
 fK6V5pWe0S4DXew9oUMSVGAFbknMiZ0Hi0FdYlSygTgRON+nQSnTWLC
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_123737_019720_205387EB 
X-CRM114-Status: GOOD (  12.69  )
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

- Switch to generic device property accessors.
- Switch to managed devm_ functions to simplify error handling.
- General cleanups.
- Skip clock setup on non-OF systems where clock is not specified via
firmware.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Changes in v9:
- Fix an issue found by the test robot in the cleanup patch.
- Reworded the clock change description.
- Add a patch to switch to i2c_add_numbered_adapter().
- Link to v8: https://lore.kernel.org/r/20260201-i2c-xiic-v8-0-deb2dd158d1a@nexthop.ai

Changes in v8:
- Made the clock change the last patch in the series.
- Reworded the clock change description.
- Changed dev->fwnode to dev_fwnode(dev).
- Link to v7: https://lore.kernel.org/r/20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai

Changes in v7:
- Drop the dt-bindings patch.
- Skip clock setup on non-OF systems.
- Minor commit body rewording.
- Applied code-review trailers with `b4 trailers -u`
- Link to v6: https://lore.kernel.org/r/20260127-i2c-xiic-v6-0-e82e2f6f657c@nexthop.ai

Changes in v6:
- Cosmetic changes to address the comments.
- Added a patch to use resource format specifier in debug log.
- Link to v5: https://lore.kernel.org/r/20260126-i2c-xiic-v5-0-88a16a28721c@nexthop.ai

Changes in v5:
- Reorder the cosmetic patch to be the last in the series.
- Added a documentation patch to describe the optional clock.
- Minor commit body rewording.
- Link to v4: https://lore.kernel.org/r/20260123-i2c-xiic-v4-0-4a3eba3510ce@nexthop.ai

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
Abdurrahman Hussain (7):
      i2c: xiic: switch to devres managed APIs
      i2c: xiic: remove duplicate error message
      i2c: xiic: switch to generic device property accessors
      i2c: xiic: cosmetic cleanup
      i2c: xiic: cosmetic: use resource format specifier in debug log
      i2c: xiic: use numbered adapter registration
      i2c: xiic: skip input clock setup on non-OF systems

 drivers/i2c/busses/i2c-xiic.c | 99 +++++++++++++++++++------------------------
 1 file changed, 43 insertions(+), 56 deletions(-)
---
base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
change-id: 20260122-i2c-xiic-3ba89ff5ea93

Best regards,
-- 
Abdurrahman Hussain <abdurrahman@nexthop.ai>



