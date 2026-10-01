Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F4DCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GT5RB+tv5fr77NYm7TiockhYzFijEjg6HhMwBqbf0Vc=; b=Ax0Mqy6Yw2Bx9ZGQG4Hebl3pvR
	McaQzlvdASPGSb2ZI0AxhLGh2c1Msw5sJPEwgiNQz9dG8ZeNQZg/dU81B0gehiivWpmAraytJm+se
	NA0VjcS180qxD6YvhIQYk9g8QLHwX3PVRilXl239NOIsqwJxGzBqyUJswl6ZpxTL7tjpsGU7ZBqtQ
	pMXLL4jafWcXPLjG380Sy2L8tv1Rj7Qo/UyRoqkws+csVHGjA4Mrb4gGsn/seRDCY0wGp0P5vMv6Z
	kE+IC2rBomJ2YPe2GNy7x1G9mArzulSVXXMEU1bhcpKz7e82thX8ECLYcpkYVMRG4XQag6wdf7xE6
	CJJiFI8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCRT-00000008Fn9-03zn;
	Thu, 01 Oct 2026 08:47:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCRR-00000008Fjw-2arQ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 08:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GT5RB+tv5fr77NYm7TiockhYzFijEjg6HhMwBqbf0Vc=; b=lrzY9TfgisqONADI7Hk1fAUKjO
	QGekr4inBvp2XIuTYO6hbuiVs54ZvkqCtvUWNH65FlMKRdQiZJO8Jfb2QSRAun2J6f9N2miezbSnd
	1tZfhaRuuvoVa8DG0/43GeeT8vmeFxbZRuHK7q2FB8tOco4ZDL21ok2KKkcAPaihBwGtvXV/CLgju
	V9dI+l63U17GKin09BZrDiAgtj5rWNwMTZ1V3mGjvcExpceHVKZhwG3iN1M2e0TGJ5zMtyDoN4U/t
	Nz9kR35EXusZsV15S34IHJewzYjYQe4fBksDYKSsW+qHe7Ywexz5jp6h2OxPlH1aZ2DTeTp1jL9Y5
	C3qQjOgw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCCRN-00000004kuI-1xhS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:46:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F759169E;
	Thu,  1 Oct 2026 01:46:53 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 596103F85F;
	Thu,  1 Oct 2026 01:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790844416; bh=/hbqQXvydI/cbOiE3kBOkvhziUA1TXNotJV14+0m5x4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kE7v9iciE/7+WAnqZqeUn3Pr2zvxK8K2TQskagzUbY91Xxm2KwiNTmNQtJCo1ZQh1
	 k5DGHfM5n4Z8eVkBoasw04xMX/buFJp6/XMz1zEL0fQxpmfpSXM0pRBpgUG8mXZ9z7
	 NFWtoCORAOkrS5/UHeJFNEgr8FF2Tmy5+XKkiQR4=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	David Hildenbrand <david@kernel.org>
Subject: [PATCH v21 9/9] firmware: arm_rmm: hotplug: Skip memory added to ZONE_MOVABLE
Date: Thu,  1 Oct 2026 09:45:55 +0100
Message-ID: <20261001084555.1456543-10-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001084555.1456543-1-suzuki.poulose@arm.com>
References: <20261001084555.1456543-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_094657_751584_429A9C80 
X-CRM114-Status: GOOD (  14.63  )
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

If the hotadded memory is in ZONE_MOVABLE, we could allow that to proceed
without the RMM having fine grained tracking, as we won't allocate pages
from there for guest-memfd or kernel allocation

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v20:
 - Use is_zone_movable_page() and only check the start_pfn
---
 drivers/firmware/arm_rmm/rmi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
index d0842d621cd4b..a01ab69a64c7c 100644
--- a/drivers/firmware/arm_rmm/rmi.c
+++ b/drivers/firmware/arm_rmm/rmi.c
@@ -1043,6 +1043,17 @@ static int rmi_memory_notifier(struct notifier_block *nb,
 	start = PFN_PHYS(arg->start_pfn);
 	end = PFN_PHYS(arg->start_pfn + arg->nr_pages);
 
+	/*
+	 * If the hotplugged memory region is in ZONE_MOVABLE, neither the
+	 * guest-memfd nor the kernel allocations can come from there. So we are
+	 * fine to skip this.
+	 * For boot time memory, we don't allow this discount, as the
+	 * decision to move boot memory pages to ZONE_MOVABLE is purely
+	 * a kernel choice and the firmware must have decided what it covers.
+	 */
+	if (is_zone_movable_page(pfn_to_page(arg->start_pfn)))
+		return NOTIFY_DONE;
+
 	ret = rmi_prepare_memory(start, end);
 
 	return notifier_from_errno(ret);
-- 
2.43.0


