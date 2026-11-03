Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89353606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 17:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pJnkR9Cm;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nc+TFfd3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qi31N6FLLr5CvBbEX306qs395sf+fpsGjv6D4cBZe8Y=; b=pJnkR9CmDwpoKBZBmTTiA6UCLy
	CcaIOyK2Cz5kx+eNe+3DeoTBFNPnOY6JZzvjo7fztyeONGszwUyzA1A3fTUGtdMFNpzEjtC/K9Bg/
	2+dJa8qpfctwGB8/a/w/LDaexCZH/+U0H/MUK+cTh+jFpmj0Ki5WfZX7uztzIc3DY/EP1p6+xV1jy
	Rykap8+I/PqhKNmSG1TSN+EOBlpWLRp80pdx8Yua/5M2hKl8vzns+4KwuZMHYwp72f7wPh16mcOrp
	ii8GtCFqG932SAfPlRgVW+Hx7bzQyAUwS/emrzPAUBlWRUBYjkeeQLHzX1SmT3VeIZV9FqFh+O6Pi
	F5DpkBWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOITe-00000003K44-0q9v;
	Tue, 03 Nov 2026 17:39:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOITd-00000003K3t-06Kn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 17:39:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A6D5435A1;
	Tue,  3 Nov 2026 17:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0161F00A15;
	Tue,  3 Nov 2026 17:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793727556;
	bh=qi31N6FLLr5CvBbEX306qs395sf+fpsGjv6D4cBZe8Y=;
	h=From:To:Cc:Subject:Date;
	b=Nc+TFfd3eoGHScAVVuQyyci8+gBu3y+2HHDkIlXYe9BE8rm2QhZFNC+rv8RtbnP28
	 RxBe4J2trJP3qHIIm1ZYpgBh/xHKXNMxxREi7nKaodwEFR8l8ZMAOBH19enV5W8LIR
	 ww5tStQ/5Kl0tArlJIOrsGACk5HHS0tsu5RllQfD7gUIXG3SaeeCJnWLfn6DdkW+lZ
	 ec3A+llXC7yfjrx0+PYGD8UPD6rawxtKkvuAiED/hcxZKDWm3hXe8J0Pto2LMJSXel
	 893WS1OG5ehiqq6IHmArwLl+vNl0Ql7kkRyc/SiIwZ/0bq/mr7g806hKnOaLL4tARn
	 js8y04jRFmuGA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Jamie Nguyen <jamien@nvidia.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dat Mach <dmach@nvidia.com>
Subject: [PATCH 0/2] ACPI: Arm FFH: Add support for OpRegion Offset 2 (FF-A DIRECT_REQ2)
Date: Tue,  3 Nov 2026 17:39:05 +0000
Message-ID: <20261103173907.1996118-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This patch series extends the existing Linux kernel ACPI Functional Fixed
Hardware (FFH) Operation Region support to accommodate FFH Operation Region
Offset 2, as introduced in the Arm Functional Fixed Hardware Specification
v1.3.

Background
----------

The Arm FFH Specification v1.3 adds support for FFH Operation Region Offset 2.
An OpRegion declared with an offset of 2 triggers an FFA_MSG_SEND_DIRECT_REQ2
call instead of using legacy SMC/HVC or standard DIRECT_REQ variants.
This mechanism allows the platform's ACPI firmware to interact directly
with secure partitions by evaluating a service UUID.

Implementation
--------------
- Upgrades the arm64 low-level FFH handler beyond generic SMCCC calls to
  natively support the FF-A protocol. It negotiates FF-A v1.2, identifies
  sender endpoints via FFA_ID_GET, translates ACPI ToUUID properties to
  register formats, handles interrupted/yielded calls via FFA_RUN, and
  returns standard FFH status codes to AML.
- Leverages register-based endpoint discovery (FFA_PARTITION_INFO_GET_REGS)
  to resolve unique receivers from service UUIDs. This approach completely
  avoids RX/TX memory buffer ownership complexities, keeping the low-level
  ACPI FFH subsystem cleanly decoupled from the main Arm FF-A transport
  driver.

Sudeep Holla (2):
  firmware: arm_ffa: Share FF-A register field definitions
  ACPI: FFH: Support FF-A direct request 2 calls

 drivers/acpi/arm64/ffh.c          | 227 ++++++++++++++++++++++++++++++
 drivers/firmware/arm_ffa/driver.c |  48 +++----
 include/linux/arm_ffa.h           |  19 +++
 3 files changed, 263 insertions(+), 31 deletions(-)

-- 
2.43.0


