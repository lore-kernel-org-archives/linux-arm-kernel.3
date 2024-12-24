Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF52E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P3RM9O+2nmg1AdkOu9g343NzLBGKmaiZRF1XHPaxj4k=; b=PMS99LYefZ7zmjFwWhB0cm9TG/
	OmYsNsBkVELomjz1YYu+kknQzqbPQRf9RBXTngPkr2wP42Mr5lgwfdb8euNZQe4DAsYfyacQL4rNa
	a3WdQeVwqdLS/vCZWZbDcdzkoL0nJEFqEbuQDRwwC1iTpKt+/R66HUviylCvLEAvnI9LiTD+2mWIM
	JOgvbifJbhv42EVjgM730CsnBEEDyT9ZWOQuKJ2wbUuT8v29/sPzkTAufUUqF/TojJOwAJa2K91A8
	Jbx9wdhl49D2In9oCeuUWZZekV8UyPbnsTVc4bv8q/OTk0lrYPwTBXROmyGxd/PL8NIH4dyojvCqv
	okrPsXZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5Vh-0000000C6NO-0vyU;
	Tue, 24 Dec 2024 14:03:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5TG-0000000C5xX-0DqP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 14:01:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6814E1688;
	Tue, 24 Dec 2024 06:01:38 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD6AE3F59E;
	Tue, 24 Dec 2024 06:01:09 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 0/5] firmware: arm_ffa: Few updates and fixes
Date: Tue, 24 Dec 2024 13:57:47 +0000
Message-Id: <20241224-ffa_updates-v1-0-01233aba3e1e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN29amcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIyMT3bS0xPjSgpTEktRiXUMDs7QU45Q0S+MUUyWgjoKi1LTMCrBp0bG
 1tQCdyli5XQAAAA==
X-Change-ID: 20241224-ffa_updates-106fd3df93d5
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1327; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=dZA6JJZix/Z0WWqKvf65lJ2pnYHf1j7Sl1iLi/4ATmA=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnar6lehVrUhmAkM2k+69U0I1LS4ci7srxd8CEb
 qVRTxIddM6JAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ2q+pQAKCRAAQbq8MX7i
 mLnNEAC+rw1H2PPaDKOUiMV2CaKVd7ub6kC+ytnX08eIVXwxzxzI5y4m4NlF6LSqO/vL1Wuqp3I
 oSVYAZbzU4SYZJGu1Pt2v+X9DVbnQ+ZDyxWvtsFVr/DoqoeTEIvDk2JwZGmIvtp6jyAiT3goOez
 gxS84zUJA4Nx5xZk2HkjCNCqpOe9h5lLYCLiMHDXax87PBx3/BCuGb3YhPFtSOHrnMjfZuNGsk6
 ISQh7qXmRiqTAAroFjjIqEvu/n0p6h6aH+JPRZh5ffff4X0oXQfqXW8Znd/gP/v1/5qULfUhn8u
 ZghbRt/SgZ9tLSfJLVQXdCucUuCcnGaYVc8ETfM9jGZr1QvZUyTltd7WnIts1Z/UJhl/RqHk5GO
 WRzbjJP0RDhTPuLvH3OJ54uhaENIfluIdJc9T9HgogIsn1FQmIaskCo5lMOpxqKCtpgu4HpyQnZ
 XqNbSVjc7UkA+Bhrapkf3SVRTJnLQ05frqw+hU2paixaIp7U/iy8UC8wwfTME+RaYWtevoRdM0H
 RGXm3nOiDLFwQGKh+Gu7u0Kydf6+XHL/EKknzXSPYCjffVBc/pSkYSOV0GeLk7TMOPGDZDSRYja
 Ncs6Imk8+bJHhdphkbX4tMbLclYWEMcduV2hocvpfyYvUMmKHCHWulkBwd7OT9yhjjrsClCQGfk
 ohrsFJO0c/S3QWA==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_060114_142430_CBCCEC88 
X-CRM114-Status: UNSURE (   6.65  )
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

This set of updates fixes big-endian support in couple of functions:
__ffa_partition_info_regs_get() and __ffa_partition_info_get().
Big-endian support is still not complete. Only these changes can be
verified at the moment without any additional application or testing
support changes.

It also fixes the mis-alignment with sync_send_receive{,2} function
prototypes.

It replaces UUID buffer to standard UUID format in the ffa_partition_info
structure and fixes a typo in some FF-A bus macros

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
Sudeep Holla (5):
      firmware: arm_ffa: Replace SCMI by FF-A in the macro
      firmware: arm_ffa: Replace UUID buffer to standard UUID format
      firmware: arm_ffa: Align sync_send_receive{,2} function prototypes
      firmware: arm_ffa: Fix big-endian support in __ffa_partition_info_get()
      firmware: arm_ffa: Fix big-endian support in __ffa_partition_info_regs_get()

 drivers/firmware/arm_ffa/bus.c    | 10 +++-----
 drivers/firmware/arm_ffa/driver.c | 53 +++++++++++++++++++++++++++++++++------
 include/linux/arm_ffa.h           |  4 +--
 3 files changed, 52 insertions(+), 15 deletions(-)
---
base-commit: f07044dd0df0c9d0ad177c3098b62ccddb735a2d
change-id: 20241224-ffa_updates-106fd3df93d5

Best regards,
-- 
Regards,
Sudeep


