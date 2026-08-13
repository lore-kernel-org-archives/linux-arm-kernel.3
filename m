Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD58BC5DF64
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 06:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QevU8zqR57gnVydkv8ewKiACEVl739ECisJmMR/oK3Q=; b=RNaO0u/Q7DzWae
	u7VSaKDklRfclmtPwQZpJT3Q/PlVf+v4b2RQbQoG0oNxzX3xdYLeUGtcV/OedREZII+p7mtOLAglA
	cDCMIYZBVTRDWFQ9O6BniJuBOD3PgLZHKGVD8FuIvIyEhF63aqUBBzs1tBx9nDV3CVkL0bY5qzfOM
	dJ8/it/yVqGt2uWNkk21mXSCbh/fKu55CWlFwjPYBI0upse4525bcOibwStzHIgqSxoX5VuVbYDLh
	Y1BF0v6tbFf/pK8UYieWuGnyns03XQygQHgtc8RvG6MoIPZiEqAQD6QYqeDj1O7h4QsavsOhPeGx1
	oT2YT0WlE7LV097ucOYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuP9O-0000000HVFx-2GNf;
	Thu, 13 Aug 2026 06:42:50 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuP9H-0000000HV5T-0gdw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 06:42:45 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 13 Aug
 2026 14:42:33 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 13 Aug 2026 14:42:33 +0800
From: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
Subject: [PATCH v2 0/2] ipmi: kcs_bmc_aspeed: Support multiple LPC
 controller instances
Date: Thu, 13 Aug 2026 14:42:30 +0800
Message-ID: <20260813-upstream_kcs_multiple_lpc-v2-0-775b1db3fe95@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFZnfWoC/32Nyw6CMBBFf4V0bU07yHPlfxhCoIwykUfTKURD+
 HcriVuX5yT33E0wOkIWZbQJhysxzVMAOEXC9M30QEldYAEKUpUByMWyd9iM9dNwPS6DJztgPVg
 jszgpLgBaJyoXYW8d3ul1tG9V4J7Yz+59XK36a3/V+E911VLJrtB5m0Cm2jy9NmwRO4+mP5t5F
 NW+7x+FcsuTxwAAAA==
X-Change-ID: 20260722-upstream_kcs_multiple_lpc-735942211508
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Corey Minyard
	<corey@minyard.net>
CC: Andrew Jeffery <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openipmi-developer@lists.sourceforge.net>,
	<jammy_huang@aspeedtech.com>, Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786603353; l=2839;
 i=yc_hsieh@aspeedtech.com; s=20260721; h=from:subject:message-id;
 bh=T3p08Mixb/u4ni/RDlvjAkSIBn3qHMVaciIoHqagm9M=;
 b=fnig07TEfuecXa6JTRfT91GpXACWIBVvCKuFrTLVUV7epepRZ87Wtat90R+8CLuA9Mis5XU27
 epM6OLJpnPYDmdwobZJsltNVLjo3cxlcY50NXh0s9yrmbFt+4OCRupk
X-Developer-Key: i=yc_hsieh@aspeedtech.com; a=ed25519;
 pk=7KnU2ozXGF2IATT+Hvu7RbRwPxBA3/b+zhfM+UsPJMs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_234243_225185_AFD68C6B 
X-CRM114-Status: UNSURE (   9.11  )
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

Hi,

Aspeed AST2700 SoC exposes more than one physical LPC controller
instance. Each instance provides its own KCS1-KCS4 devices, with
identical IDR/ODR/STR register offsets within that controller's register
file.

kcs_bmc_device::channel currently serves two purposes at once:

  1. Selecting which HICR0/HICR2/HICRB bit-group to touch within a single
     LPC controller's register file. aspeed_kcs_of_get_channel() derives
     this purely from the KCS node's register offset, yielding values
     1..4.

  2. Naming the misc chardev (/dev/ipmi-kcsN) exposed to userspace, which
     must be unique system-wide. kcs_bmc_cdev_ipmi.c uses "ipmi-kcs%u".

Both happen to be the same value only because this driver has only ever
had to support SoCs with a single LPC controller. On AST2700, KCS1 on
each LPC controller computes to the same channel number, and whichever
instance probes second fails due to the duplicate miscdevice name.

This series keeps a driver-private channel value (1..4) in struct
aspeed_kcs_bmc for register access, and computes a globally unique
kcs_bmc_device::channel as:

	bank * KCS_CHANNEL_MAX + channel

where bank identifies which LPC controller instance a KCS device belongs
to.

bank is derived via of_alias_get_id() from an optional "lpcN" alias on
the LPC controller node, mirroring the existing alias-based numbering
convention used by mmc/i2c/spi/serial. For example, with aliases
assigning lpc0 and lpc1 to banks 0 and 1, their KCS channels are exposed
as /dev/ipmi-kcs1..4 and /dev/ipmi-kcs5..8 respectively. If no lpcN
alias is present, of_alias_get_id() fails and the driver uses bank 0,
preserving the existing numbering for single-LPC-controller systems.

This puts the numbering under DT-author control instead of deriving it
from probe order or DT traversal order. It also generalizes across
however many LPC-compatible instances a future SoC exposes, regardless
of tree placement, while preserving compatibility for existing
single-LPC-controller boards.

Changes in v2:
  - Drop the RFC tag, per Lee Jones' feedback.
  - Keep the alias-based bank-numbering approach unchanged.

Link to v1: https://lore.kernel.org/r/20260723-upstream_kcs_multiple_lpc-v1-0-d918b5270b86@aspeedtech.com

---
Yu-Che Hsieh (2):
      dt-bindings: mfd: aspeed-lpc: Document lpcN alias for multi-instance SoCs
      ipmi: kcs_bmc_aspeed: Support multiple LPC controller instances

 .../devicetree/bindings/mfd/aspeed-lpc.yaml        |  7 ++++
 drivers/char/ipmi/kcs_bmc_aspeed.c                 | 37 ++++++++++++++++------
 2 files changed, 34 insertions(+), 10 deletions(-)
---
base-commit: f0e6f20cb52b14c2c441f04e21cef0c95d498cac
change-id: 20260722-upstream_kcs_multiple_lpc-735942211508

Best regards,
-- 
Yu-Che Hsieh <yc_hsieh@aspeedtech.com>


