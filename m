Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37ABFD185F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 13:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dZ/Y9BypzaL1bP+ZVOo8lzO9wWG2aThKQKn+hyN7N24=; b=UWfzl1dsWzdl2XhK4rhW0x7LVf
	ocYJp8BxsyWHpr3Wm9RaKIEEV3bKzRPy7kSXTHJukgkfh7O0htS+Il/SEV/9GkhKcESc7YFAjEvRq
	Zsb2YhUsRCAKa2yHLCJQAaid8V4f8iW9Ojwqdu/Qeb66wxHvfiB9Ovh255ZkKHUOztbKnX5sPmmTU
	a4Scv1Qk/E1viqR2trjgsPmjX0LLOdETOXMxQvOeWSMUsA/P43DAoYQM6N2fBb1YbYos+IA9r+Ybh
	Gsj7xR0Yqb6cW3WEriQgpRt0Yuq0MBXR4RvUGW60f6Re4DT7Yuqc35P+/YhGjpiD0/okFLt09yehm
	68ZIikSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpuh-0000000H8I2-01Mn;
	Thu, 08 Jan 2026 13:18:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpue-0000000H8Fc-08DX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 13:18:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC8D1442C6;
	Thu,  8 Jan 2026 13:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2AF6C19421;
	Thu,  8 Jan 2026 13:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767878330;
	bh=ULItbI1yU0oVHXTe0/S32I9HO15qLNcu+lgP97nBouQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ckJ1DLSgXXYnDVSkHtrYWID9qghyP6AEsu1Yb5McBu5NvFvkpy2fmcxf0N7TaYEXV
	 5jR+ztCoTT7jqa19TwTCE4tsco1ryEx9OWU4NC7ESMvqH3nTsD7unNaSZxon+3TkCl
	 kRzSVos4lcNnHBzSt2ViMJ5pWMbd1be48WMdEzORlOEf29wYIfwQUE5lj3fZh2NAO4
	 5OO9qGWq6Mf43uvUNdAIcmIZIpcNNnBiV/dp3TK8jCoYVKUrZMldgTVWoMGlFomzbW
	 mymkxHKnCeNobHCGvJNc/ZZjYD/+9LjSjibYYT2rMnd9vpr6q+fYMIe8opKdDv3qTu
	 /8oxjaIk5AlBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90369D185E7;
	Thu,  8 Jan 2026 13:18:50 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] Add Apple Silicon SMC power driver
Date: Fri, 09 Jan 2026 00:18:47 +1100
Message-Id: <20260109-b4-macsmc-power-v2-0-93818f1e7d62@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALeuX2kC/3WNQQ7CIBBFr9LM2jGA0EZX3sN0gVPaTiKlAYOah
 ruL3bt8L/nvb5BcZJfg0mwQXebEYamgDg3QbJfJIQ+VQQnVCikM3jV6S8kTruHlIg5CdkTdaE6
 WoK7W6EZ+78VbX3nm9Azxsx9k+bP/W1miwFadjSatrDHmOnnLjyMFD30p5QtP5UOgrgAAAA==
X-Change-ID: 20260105-b4-macsmc-power-d017cc7f53ac
To: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Michael Reeves <michael.reeves077@gmail.com>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767878329; l=1754;
 i=michael.reeves077@gmail.com; s=20260105; h=from:subject:message-id;
 bh=ULItbI1yU0oVHXTe0/S32I9HO15qLNcu+lgP97nBouQ=;
 b=nPEwliGopv3tiHSTW55ltR9k7IAzFxUGeMQtuM3HZAEmI8bCau/pgyINeKM2ZSPnUnxCl0ajA
 Y5M3G9B279gDQJ1ndb8X8qMopbNEJrDuivf9tPlqQ3VcpAtCYAC0Jvd
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=QIrgWBGCm3LG0YYc6MLCDkwuVXLTGGooVBdWX/KhSiU=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20260105
 with auth_id=591
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_051852_120741_4805A245 
X-CRM114-Status: GOOD (  12.08  )
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
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series adds a power supply driver for the Apple SMC found on
Apple Silicon devices. This allows the kernel to report AC status,
battery charging status, and power metrics, and modify the charging
behaviour.

The first patch adds the driver itself, and the second patch wires it
up to the MFD core.

The driver is based on an original out-of-tree implementation by
Hector Martin. It has been refactored for upstream inclusion, 
including support for newer SMC firmwares, devices without batteries,
dynamic property detection and improved state management.

Tested on: Apple M3 (MacBook Air, J613)

Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
Changes in v2:
- Added Reviewed-by: Neal Gompa <neal@gompa.dev> to all patches.
- Fixed Makefile alignment by using tabs for the macsmc-power entry.
- Upgraded physical battery exhaustion log level to EMERG.
- Downgraded software-triggered orderly poweroff log level to CRIT.
- Added check for CHIS key to skip AC registration on desktop models.
- Link to v1: https://lore.kernel.org/r/20260105-b4-macsmc-power-v1-0-62954c42a555@gmail.com

---
Michael Reeves (2):
      power: supply: Add macsmc-power driver for Apple Silicon
      mfd: macsmc: Wire up Apple SMC power driver

 MAINTAINERS                         |   1 +
 drivers/mfd/macsmc.c                |   1 +
 drivers/power/supply/Kconfig        |  11 +
 drivers/power/supply/Makefile       |   1 +
 drivers/power/supply/macsmc-power.c | 883 ++++++++++++++++++++++++++++++++++++
 5 files changed, 897 insertions(+)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20260105-b4-macsmc-power-d017cc7f53ac

Best regards,
-- 
Michael Reeves <michael.reeves077@gmail.com>



