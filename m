Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E755CF589B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q76kHi3aTcSg7O4rk2jstLQj95vNaQvrKNEZQjnBiXc=; b=yjbSIKJSnn9tVvoBc9g+fJpiZk
	eIpU69DZO9SI1mCoitvLzHIK+wQqYDTAm9aqEwQkw8sdt44crl/mjigY3fr5DV4g3NQmzZsuLUg7Y
	I7Z3+qxlcOZ3DOdu1Qh/W71Y94WrUjjaAYvX85UDqxJDGkvgsQ3g2xX/jRqpi/ztfNVZJ6uEzCxtj
	eoyeZ/e7JZqref/fW4H6+qiwP33ulwSBaua46Ye0JVLMQpITc84A9yn7Az1Z/IlQ9gygj503sMhS/
	cDSOiEp6naGcnAISRxCdzog6ZHPaK4XG3jHCtahxPYPguXYlIoHvqX6J4521hO6Cpj1uE8irLo1rC
	1f2y4LTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtOf-0000000Bdv5-0BQZ;
	Thu, 23 Apr 2026 12:43:09 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtOY-0000000Bdp9-3YLw;
	Thu, 23 Apr 2026 12:43:07 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.18])
	by linux.microsoft.com (Postfix) with ESMTPSA id 527D720B7167;
	Thu, 23 Apr 2026 05:42:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 527D720B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776948182;
	bh=Q76kHi3aTcSg7O4rk2jstLQj95vNaQvrKNEZQjnBiXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kdfK+cNKF7P5mLQrePhjWhMrUP6eSRlh5W0NUH46xhS7kvsAEkw46O2Mmpt2oiuMV
	 n1LTlHyLATBHcLD8VCm0Uj+Zz7RtO6UoWzJE2KKhGGK9Glv8QnC79mPIAFsRfq+uui
	 9Myf/BY8wGV9TnMow/+qSmn15wPrRIPwpGhE10oA=
From: Naman Jain <namjain@linux.microsoft.com>
To: "K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Kelley <mhklinux@outlook.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	vdso@mailbox.org,
	ssengar@linux.microsoft.com
Subject: [PATCH v2 05/15] Drivers: hv: Export vmbus_interrupt for mshv_vtl module
Date: Thu, 23 Apr 2026 12:41:55 +0000
Message-ID: <20260423124206.2410879-6-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124206.2410879-1-namjain@linux.microsoft.com>
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_054302_907843_B31734B3 
X-CRM114-Status: UNSURE (   9.75  )
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

vmbus_interrupt is used in mshv_vtl_main.c to set the SINT vector.
When CONFIG_MSHV_VTL=m and CONFIG_HYPERV_VMBUS=y (built-in), the module
cannot access vmbus_interrupt at load time since it is not exported.

Export it using EXPORT_SYMBOL_FOR_MODULES consistent with the existing
pattern used for vmbus_isr.

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Reviewed-by: Roman Kisel <vdso@mailbox.org>
Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
 drivers/hv/vmbus_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 052ca8b11cee..047ad2848782 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -57,6 +57,7 @@ static DEFINE_PER_CPU(long, vmbus_evt);
 /* Values parsed from ACPI DSDT */
 int vmbus_irq;
 int vmbus_interrupt;
+EXPORT_SYMBOL_FOR_MODULES(vmbus_interrupt, "mshv_vtl");
 
 /*
  * If the Confidential VMBus is used, the data on the "wire" is not
-- 
2.43.0


