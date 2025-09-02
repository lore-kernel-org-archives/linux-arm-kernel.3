Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810EFCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qu7oI07YNcVitvn0pSxPBUEkZ77HuJvC5/b+wqv9gLE=; b=zNyj9KzGGOzKzXLAS7B5YZbe+l
	1w/YOQc+tI4lMWtQibeOJ6knbhA4SL+28CAkiRwRXMGek6pduNXBC1NRjZu/ESHjNM1MpAg7jX/TF
	fp7dGldriTQzWLbrlr5+xcJX30trVB/omczSAm2dn/6hOhe37mz7JOXsDpXKFa69qc2ZUrocAmz0z
	+QCGhKBkqKXG98Y29QEtf+YmlfK/MZhYkGpaU6HYsHNlrklX0sQxYYO1aeqy+zamq+DCO0I1n+EJq
	7WXZjQ0lJjWc7ifCOUl1WY3L9IOJWOSiDWuE3G44oWC1AkF4+cxYTgtIyogOpRMAOx9xGuDHOJZ/G
	OGIC5NPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNo-00000001ZVR-0OsA;
	Tue, 02 Sep 2025 19:09:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQpj-0000000HYjW-0dZ9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:14:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65FF026BE;
	Tue,  2 Sep 2025 06:13:48 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E1013F694;
	Tue,  2 Sep 2025 06:13:55 -0700 (PDT)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	catalin.marinas@arm.com,
	will@kernel.org
Subject: [PATCH v2 0/2] KVM: arm64: VHE: Debug fixes
Date: Tue,  2 Sep 2025 14:08:31 +0100
Message-ID: <20250902130833.338216-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_061359_233384_2B13C0FD 
X-CRM114-Status: UNSURE (   5.81  )
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

This is v2 of the patch that zeroes PMSCR_EL1 [1] at boot, hopefully now it's
not as bad.

Picked up another fix - patch #2 ("KVM: arm64: VHE: Save and restore host
MDCR_EL2 value correctly") is new.

[1] https://lore.kernel.org/kvmarm/20241106122654.38234-1-alexandru.elisei@arm.com/

Alexandru Elisei (2):
  KVM: arm64: VHE: Initialize PMSCR_EL1
  KVM: arm64: VHE: Save and restore host MDCR_EL2 value correctly

 arch/arm64/kvm/debug.c                  | 20 ++++++++++++++++----
 arch/arm64/kvm/hyp/include/hyp/switch.h |  5 -----
 arch/arm64/kvm/hyp/nvhe/switch.c        |  6 ++++++
 3 files changed, 22 insertions(+), 9 deletions(-)


base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
-- 
2.51.0


