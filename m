Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D7AE77173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 01:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SaRMbE+HZoOsIQtPSMda7L4vy+I4DSDtTdjlvkuf5j4=; b=P6vAj13QlkduRhHibHCqwi2Jct
	qT0fVhKlICs1V8FgWe3qncHnSVGvoOd7LpQz+IA3YM0tI4wf2inNQdAzH6F79kvLcUvRY1MwEnZjT
	GtB8R9ft/9434uBNf5V1GWiEHuQp+6692hHfWbmcvOvY1lq6baH8TCpBMpAMnRloHxe5a7UcugFVC
	BLs/Qyv8x+IiQ8Ejs8BQb5tzPp3XNOddpBx9LDWLmtHjWKsJ8qqLQpdCFiSIwdS9k5NsJ5sChTTZC
	wYrpXULXUGGLo/rsl+Uclp7kkoSKP0CmlBiFhw1j6j5p6Hxk2oZNY15NZSOEB0SnS9siHWXE09u97
	EUaD2uQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJjWy-000000038wV-0bBG;
	Sat, 07 Dec 2024 01:22:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJjVr-000000038pu-0WS8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 01:21:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8502711FB;
	Fri,  6 Dec 2024 17:22:00 -0800 (PST)
Received: from u200865.usa.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 439923F5A1;
	Fri,  6 Dec 2024 17:21:32 -0800 (PST)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: suzuki.poulose@arm.com,
	gshan@redhat.com,
	steven.price@arm.com,
	sami.mujawar@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [PATCH v3 0/1] arm64: CCA TSM module autoloading
Date: Fri,  6 Dec 2024 19:21:27 -0600
Message-ID: <20241207012128.247522-1-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_172140_151898_564D64E4 
X-CRM114-Status: UNSURE (   5.46  )
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

Provide module tables and a platform device so that the
CCA TSM module will autoload when needed.

v2->v3:
	Fix __maybe_used placement, it does fix CLANG builds now.
	Add reviewed-by tag, Thanks Gavin!
	Ugly commit message cleanup.
v1->v2:
	Various comment updates/variable renames
	Add missing __maybe_unused to the platform_device_id

Jeremy Linton (1):
  arm64: rsi: Add automatic arm-cca-guest module loading

 arch/arm64/include/asm/rsi.h                    |  2 ++
 arch/arm64/kernel/rsi.c                         | 15 +++++++++++++++
 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c |  8 ++++++++
 3 files changed, 25 insertions(+)

-- 
2.46.0


