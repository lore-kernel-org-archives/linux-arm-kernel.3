Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E44EEA853
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 00:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sKQ4e9FJS/11rd89l6wVpDw9AhD/lNLaw5X9//A6MSk=; b=PI7cJwwMLq2i2gVV1Yp56UyngD
	Cq0bv/GI52SK1oFSR2sNUDJnwvQur1V3bt9N3pYVnjIu9Jmg4mIG9R5No2PkL1zopZ+x9LD1ezpYF
	TPTGyxI+aQye90/e6LBOkzgmH2IL1b1VkEEonN/MTqIw8KCZZZpdXMWv1J/T77UCUKYj0nyxN9ybW
	oPT+qrTKOJDZZClYSl3KfkZGkypiCnluO4YzZ1qfe45hSyFc5d89n0qSG2dYtgXBEvSqGe+xKlUma
	96nj73AjR6M9NG0slAGXk+clk7TbDSI7Am0+O9pi90/hGEDi9biH3SldFfdbbeW1GmpxpcvSEo934
	9t9yHgTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgqD-00000002lZu-44hB;
	Fri, 13 Feb 2026 00:15:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgqB-00000002lXD-2ZIq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 00:15:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A307C4457A;
	Fri, 13 Feb 2026 00:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BB21C19424;
	Fri, 13 Feb 2026 00:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770941722;
	bh=Sb1Z9ToRtr8u+pAOPxIENcrNfGSnJsAfpeH6JTyv4M4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=At++tvikIcZRbahk7Vd1EDRf4auXmWXTUDF+crnKr+9OVuvlPOzrMUYXx3zaOHUHd
	 mV4uVB+XgyAwZ10Re53SfowvIJfO3SXxiPiHf/rO/1SGlH+g3ox3Mb6/4PJkorVgXn
	 7LAvP25o8UhuIoqAFrS42FNc1cVqADyg/Zs7AZ7gmcyJSwSfjTpNUxCX5jZJs/2MCz
	 Ky+wxXegbZXGE3qLX+Qz1a8KS35Vf9NWcirS8sNHSx15myp0uYUIHJEaV7jjNxnCbS
	 9DYJ/jlpNZIwjn4DX9bdK6v+WpQ3NKkemGcuhFcasjvM52wtsjCrV/HwaHIjhTodiR
	 BHFXRmzscPfjA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4E7EEA870;
	Fri, 13 Feb 2026 00:15:22 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Subject: [PATCH v11 0/7] i2c: xiic: use generic device property accessors
Date: Fri, 13 Feb 2026 00:15:15 +0000
Message-Id: <20260213-i2c-xiic-v11-0-5d18aea11bde@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABNtjmkC/3XRPW7DMAwF4KsEnqtAov4z9R5FB8miag2xAzk1U
 gS5e+UsZaF2JMHv4QG8DyvWgutwOtyHiltZyzK3QYiXwzBOYf5AVlJbDMDBcAHACozsVsrIZAz
 O56wxeDm080vFXG7PrLf3Nue6nNl1qhhIgNCcg1PmCFo6zwQLMX3WGqZzmF9nvF2n5XIMZc+by
 npd6tez2gZ76h8lNmCcCamyTlZJdJGG7C02SaUkUjaJ0Y5JgVYp91L9J1WTKkiMQWrBR+ykptI
 QqZt0LggTwFkQYycNlZZIs7d1gJBNNtr20lLpibRNWrCopHLeYu6k+5HABZGuyYQRUhLaJRE66
 amkX/FNjqiM11mDsamTglOqCBV8txC9N+0xIPUv+3g8vgEqt8RTtAIAAA==
X-Change-ID: 20260122-i2c-xiic-3ba89ff5ea93
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, Andrew Lunn <andrew@lunn.ch>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770941721; l=3438;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=Sb1Z9ToRtr8u+pAOPxIENcrNfGSnJsAfpeH6JTyv4M4=;
 b=PZ0XbQV8s2UWSCFbiogIumjF/qg7yBN1gXJJy+KjQPg3jmjsMZcpIscrCEGlRBpjjacXq9IGD
 o4SKeCIUAiwDq/ZxZmRqIN6lNHpQoyiLAU9itKro+9ayaad7sYYCV0U
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_161523_699351_49C77DFB 
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
Changes in v11:
- Cosmetic change to return 0 in patch 1.
- Remove pm_runtime_dont_use_autosuspend() in patch 1.
- Link to v10: https://lore.kernel.org/r/20260204-i2c-xiic-v10-0-c2b996425235@nexthop.ai

Changes in v10:
- Moved dev_dbg() change from patch 4 to patch 5.
- Reworded description in patch 6.
- Addressed Andy's comment in patch 7 (&pdev->dev -> dev).
- Link to v9: https://lore.kernel.org/r/20260202-i2c-xiic-v9-0-ce4695f5267d@nexthop.ai

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

 drivers/i2c/busses/i2c-xiic.c | 98 +++++++++++++++++++------------------------
 1 file changed, 42 insertions(+), 56 deletions(-)
---
base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
change-id: 20260122-i2c-xiic-3ba89ff5ea93

Best regards,
-- 
Abdurrahman Hussain <abdurrahman@nexthop.ai>



