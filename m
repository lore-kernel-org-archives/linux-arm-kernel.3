Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38FCCD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 17:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tys8rcvX2d8y7RMMvwYIUA+lGbFncl79G5WGXwb+O2U=; b=nZcb8ZWYlrxuFE
	xBDkf7VJoEldMmPOhXm65ROWKncn4qLnb+W2+ORLc+lmul39HcLl3OGfxTQ0BVZXQ2ZT5fk/Q4dzS
	eUYiVL7u81Dc2zi9qTM+FyJFfrI41vCEQI+YFmDnh00ftp73SFz0Ko114f9GeNLaEShMvldeSikBw
	bQjuXFXsWLHcZUNUSAFDQu0pNX/IHBZ03IvOCpqx1tioFVLttX17itdJj/LyTx/DZqCU4sUj9Ojum
	V6oZch9kwM1u9AcdJb3qv6vZUeOQjxIyvvAs7qhNteIvi1I8/PCZkPoXR2g66gAcETCCx6ttjKaht
	CMNFnFwinTTrHj+nSLSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPPY-00000007CYA-0OEE;
	Fri, 08 May 2026 17:54:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPPV-00000007CXL-3gZ8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 17:54:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C068401F6;
	Fri,  8 May 2026 17:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2439C2BCB0;
	Fri,  8 May 2026 17:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778262889;
	bh=yRPbUiY7NO4VWGjDKq44pQG8J7mr3eoU1H3qLt4LCHM=;
	h=From:Subject:Date:To:Cc:From;
	b=kiixJSdom0hyuy67zNkWduKDEZF3BtrSepA4rkjOLjC8lGFI+iCBhXtdr2ynKv5Jl
	 lMZsrtpEmbno0Qo9nS2GQQiJMB20JglbUcwl0QCC13bjI1TWHdbUzOrJXkg/UgcbYv
	 D8P3qNGLjIndUKx/6+J8SJfVFdcbG6lofyUZeUoJ/Rs54JPLPgUm6H7wDxcxy47VQ5
	 2V9jBexUhTX72LmYRed427S00G5zVut4YXnTqdmkq9QWY5PpTm4dg8DyYtgBeM5SXm
	 wiJebNvo2KzsfIhMhsCbnWQh2SpJ4/fu2baP7dFdcz5Q8Lg0NoT/UJ+1wZBXbX9MnO
	 0DvsQtF1vR3bA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH 0/4] firmware: arm_ffa: Move core init to platform driver
 probe
Date: Fri, 08 May 2026 18:54:14 +0100
Message-Id: <20260508-b4-ffa_plat_dev-v1-0-c5a30f8cf7b8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEgj/mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwML3SQT3bS0xPiCnMSS+JTUMl1jyyRLi6Qkc8vEVEsloK6CotS0zAq
 widGxEH5xaVJWanIJyBil2loARIIKgXMAAAA=
X-Change-ID: 20260508-b4-ffa_plat_dev-39b98bb79ae9
To: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-integrity@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_105449_952925_21D34E26 
X-CRM114-Status: GOOD (  11.27  )
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

This series moves the Arm FF-A core initialisation into the driver model by
converting the core bring-up path to a platform driver probe/remove flow.

The first patch reverts the earlier rootfs_initcall change. That initcall
ordering workaround is not a proper solution and potentially conflicts with
pKVM FF-A proxy requirement.

The FF-A core is then registered as a platform driver. For now, the driver
creates a synthetic arm-ffa platform device internally to bind the driver.
This is intended as a temporary bridge until ACPI and devicetree describe
the FF-A core device or object directly, at which point the internal device
creation can be dropped.

The series also makes the synthetic core device the parent of enumerated
FF-A partition devices, keeping the FF-A device hierarchy anchored under the
core transport device.

Finally, when protected KVM is enabled, FF-A probing is deferred until pKVM
has completed initialisation. The kernel pKVM FF-A proxy must perform its
own FF-A version negotiation and setup before the normal FF-A driver starts
using the transport, so the platform driver probe path now allows the driver
core to retry once that dependency is ready.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
Sudeep Holla (3):
      firmware: arm_ffa: Register core as a platform driver
      firmware: arm_ffa: Set the core device as FF-A device parent
      firmware: arm_ffa: Defer probe until pKVM is initialized

Yeoreum Yun (1):
      Revert "firmware: arm_ffa: Change initcall level of ffa_init() to rootfs_initcall"

 drivers/firmware/arm_ffa/bus.c    |  3 +-
 drivers/firmware/arm_ffa/common.h |  4 +--
 drivers/firmware/arm_ffa/driver.c | 64 ++++++++++++++++++++++++++++++++++-----
 drivers/firmware/arm_ffa/smccc.c  |  2 +-
 include/linux/arm_ffa.h           |  4 +--
 5 files changed, 63 insertions(+), 14 deletions(-)
---
base-commit: 917719c412c48687d4a176965d1fa35320ec457c
change-id: 20260508-b4-ffa_plat_dev-39b98bb79ae9


-- 
Regards,
Sudeep


