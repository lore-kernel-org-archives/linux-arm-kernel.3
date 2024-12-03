Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE885E69E9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 00:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aAEe2ELiQg/l08HT9xgDb7J946a+e/2ijlVRx7s4RQY=; b=ycqfD5tSQp64Iu8l8lGYCqZH5t
	pzWcM/yOEilcDYDWGnj4MbVhvCOvxtOH4dqMpQHXbpSNVtt1DgXwp5KLzlXFyp2wBEsGOuBtTISlj
	ZP5sfqbVN/fmUqKysXuXNB5LYEiCRDL9Vazx5M3sIheJ43+WV1Tjk9mCrIoAtcMhxKVVcSRjqGZo6
	de+nrf+oSZ5iodqG6In/9F6mvzX6mrmZs1KICPyZRXmgOBgVMg3J50AHr+Zr3CRRzIsnJzdPcJ70a
	yqYLMqJ/fxlCETdKRFI5ewU86jYOqDh+90HxjxJsg4UgGuJHGuJn456YLszbUOvBpWS2y5J6gq12D
	pgzd6OWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIGNp-00000007lUS-1BHC;
	Tue, 03 Dec 2024 00:03:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIGMo-00000007lH9-2t5z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 00:02:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6278EFEC;
	Mon,  2 Dec 2024 16:02:39 -0800 (PST)
Received: from u200865.usa.arm.com (U203867.austin.arm.com [10.118.30.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAA903F71E;
	Mon,  2 Dec 2024 16:02:10 -0800 (PST)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: gshan@redhat.com,
	steven.price@arm.com,
	sami.mujawar@arm.com,
	suzuki.poulose@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [PATCH v2 0/1] arm64: CCA TSM module autoloading
Date: Mon,  2 Dec 2024 18:01:55 -0600
Message-ID: <20241203000156.72451-1-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_160214_766879_83D82E21 
X-CRM114-Status: UNSURE (   8.29  )
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

The TSM module provides both guest identification as well as
attestation when a guest is run in CCA mode. Lets assure by creating a
dummy platform device that the module is automatically loaded during
boot.  The TSM module will be loaded by udev daemon after it receives
the device addition event. Once it is in place it can be used earlier
in the boot process to say decrypt a LUKS rootfs.

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


