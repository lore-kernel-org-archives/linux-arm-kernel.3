Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8717D19508
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sM6+XL0Z1N706ifzUzsYRTVvtFRD1Uh/cSFwYdiVX4A=; b=cmeKWbGBRi0SUyAprpgBtCI+df
	TalVXSlEKqmP0+m6dAfDtr4fCk4W0JMu1wWze3zBKKnXVlq2h4+rhrcJdC1i/0BOt2hryCN0Josbi
	UWLUB5NTumU0V0DKoJT2uIvJ5P48mbku4RWelqu5SIddUwByHU+Os2wGdMT6672RXSHc5XTsNWMrt
	hsqPczG26ILWZFx6WNcTA4DyK+qNuHBGHwDj66RreCOVTDY4r3KDxd6Kwt3bJQmnZK8CEPoZ6tBB+
	Nb7hPCblc8de0Q0UKyRlK16mTTWAPcS+FxQFPsMbdR+vOThwnlD/pOOQAze5Epk3a/lHoI/sB/3Pe
	8EhjeMvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQ4d-0000000CvFz-2hjE;
	Mon, 26 Jan 2026 17:08:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQ4c-0000000CvEm-0QwT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 17:08:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 85CCD60121;
	Mon, 26 Jan 2026 17:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FC27C16AAE;
	Mon, 26 Jan 2026 17:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769447301;
	bh=VW73wEDlwm86XhzmqjnzsOO/GIvv7ArJjK3GOMgSBcE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BIx/mUcGY7IEDfDiZCVQgafDJKy21iPx2ubRTWSEFUg8Mwfo2s44CdwTOKHBRfevo
	 a2VyTZmO5tOzbccC+YvvltXOemxUcQ/QOzQ+zd/QZHiT+2rsBy8uuY9JjO41Ss1XXF
	 1j3RdIctz+i69nD6lYtJnE3iOacDUY0QuTexlBGr3ZbyFKY+o1HhddBQTEIdId3SeO
	 6gMqQjUbzkf2LyPiVzFNlbqGywdsOBAUie4KSLAjnRb0jel6xnvxkFPdg55OVyTTne
	 unL0af1erk32KJHje2WyY8G3Jm6K370SRKug+3t5M5CZ/7MTr7S9zqJN5Cf+T95Bim
	 +/keDMKugflqg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEFED19502;
	Mon, 26 Jan 2026 17:08:21 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Subject: [PATCH v5 0/6] i2c: xiic: use generic device property accessors
Date: Mon, 26 Jan 2026 17:08:15 +0000
Message-Id: <20260126-i2c-xiic-v5-0-88a16a28721c@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH+fd2kC/3WOQW7DIBBFrxKxLhGegcTOqveIuhhgKLOIHWHXc
 hT57sVZuWq7fNJ/T/+pRi7Co7ocnqrwLKMMfQX3dlAhU//JWmJlBQZOpgHQAkEvIkGjp7ZLyTF
 1qOr8XjjJ8kpdPyqnMtz0lAvTLtA4Y6C1pyM4bDvdaPLxqxTKN+rfe16mPNyPJFsvyzgN5fF6N
 sNW/ePEDNroBm1y8WyRW7+PbC9m3Ju4M7Ga7M8hWnA2pt+m/c+01bSE7AldYwL/MNd1/QYbsqa
 iVQEAAA==
X-Change-ID: 20260122-i2c-xiic-3ba89ff5ea93
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769447300; l=2044;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=VW73wEDlwm86XhzmqjnzsOO/GIvv7ArJjK3GOMgSBcE=;
 b=8Q/hfEyzU9oetCA/lp4xPmLum414rzPxHu/AuVZD4ceCsOa6W4AvAI49TJN3wt8SDE03wwRB1
 kMApOawg1wHCAYOgM3PsjhSaASlZkB6a0M54v0qBXMkOFfGLn9wUeqC
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
Abdurrahman Hussain (6):
      dt-bindings: i2c: xiic: make clocks optional
      i2c: xiic: make the clock optional
      i2c: xiic: switch to devres managed APIs
      i2c: xiic: remove duplicate error message
      i2c: xiic: switch to generic device property accessors
      i2c: xiic: cosmetic cleanup

 .../bindings/i2c/xlnx,xps-iic-2.00.a.yaml          |  1 -
 drivers/i2c/busses/i2c-xiic.c                      | 81 +++++++++-------------
 2 files changed, 34 insertions(+), 48 deletions(-)
---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20260122-i2c-xiic-3ba89ff5ea93

Best regards,
-- 
Abdurrahman Hussain <abdurrahman@nexthop.ai>



