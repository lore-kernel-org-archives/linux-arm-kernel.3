Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AA7CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8OL5DGdAs1Ke1xYHYGgjRzxbCwv3AJAqnhCVyHXFumc=; b=3kXQHd4mFnBqSbiQdFnGMCWPuF
	MXN2ZAiVzgR9JeuWPrcJUWi/pYqeDSJT5hWWWY00/2HPzXRYibAaPF2rkIOfgFmx0pBhsjGWGhg9f
	dB6qrhck8OIhHZLcWm7bn6NSfNq9n+/lUgV7NX9HuY68sp4IUWbIIZpVodNEp3RTudXGmgiw2V8IY
	iVsafiE/xc9XB7nuB2QOwW54E8a6ae+Q77AqD94EGnXvvKfLHFP6ov4YNQomL/UaPlS6KeRNeGuxy
	hTkPTi61SZhileTBlYZf5TT8DqFtMEClAMdn5ubusB+g06dEj/Y22Z3uCQ9Tq+zOiK7DWkS976htR
	+aKYIENw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChEs-0000000CBFR-37wE;
	Fri, 02 Oct 2026 17:40:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChEq-0000000CBDJ-0nYe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:40:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AED80169C;
	Fri,  2 Oct 2026 10:39:59 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F6933F85F;
	Fri,  2 Oct 2026 10:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962803; bh=EUu2gZsSkEPrYy1r3ulTWkIvXCtJuUzIRzKsZX65mqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qkg+crjmn0QXhIW0gN7Cp748KV1vyZpeCLX8Rv61rxBWDdk0aStbLkx+fZyqScW3r
	 6vdTzk+77fmRn7T7lZ+qXlPJXKLme+AXB9Nd0bCduBsoIF+CbJJVeXCdbGPVVTcyg/
	 VCOdrZFhzc5Z3G2VO+vr7PjdNc/oDZsb8ZiBOGZI=
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Gavin Shan <gshan@redhat.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 02/27] arm_mpam: Restore the error interrupt enable from mpam_cpu_online()
Date: Fri,  2 Oct 2026 18:39:15 +0100
Message-ID: <20261002173941.292319-3-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_104004_299936_8105A793 
X-CRM114-Status: GOOD (  12.22  )
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

From: Ben Horgan <ben.horgan@arm.com>

When all the associated CPUs to an MSC are offline, possibly caused by
PSCI_CPU_OFF, the power supply to the MSC can be cut off and all the
registers lose their value, including MPAMF_ECR.INTEN. Afterwards, we need
to explicitly set MPAMF_ECR.INTEN when the first associated CPU becomes
online and the power supply to the MSC is recovered.

Restore MPAMF_ECR.INTEN in mpam_cpu_online() when the first associated CPU
of the MSC becomes online.

Fixes: 49aa621c4dca ("arm_mpam: Register and enable IRQs")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: James Morse <james.morse@arm.com>
[morse: rephrased commit message]
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 580d7ed38569..32bde94dfbc3 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1856,8 +1856,14 @@ static int mpam_cpu_online(unsigned int cpu)
 		if (msc->reenable_error_ppi)
 			_enable_percpu_irq(&msc->reenable_error_ppi);
 
-		if (atomic_fetch_inc(&msc->online_refs) == 0)
+		if (atomic_fetch_inc(&msc->online_refs) == 0) {
+			mutex_lock(&msc->error_irq_lock);
+			if (msc->error_irq_hw_enabled)
+				mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
+			mutex_unlock(&msc->error_irq_lock);
+
 			mpam_reprogram_msc(msc);
+		}
 	}
 
 	if (mpam_resctrl_enabled)
-- 
2.53.0


