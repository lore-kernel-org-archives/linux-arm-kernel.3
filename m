Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42981C88E58
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 16:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jbB4IfqX+isLVUA7oEEtfBDnsKZZxVODhPI/PGo+B8=; b=1JMeBF3aIrlUJ6yqzkl9dZJrVX
	QF8gXblPVjOu00TmxbszIixOVZ2Z8HxQma6DDkVtofduldfSuVI+V8uNsf2AS6J1QP66VgEL9uk9I
	ugxySsfCPkd/z2amFuO8Dnkg36YeWjM6Om/GYvzVq22hTuHV2DBqCSu+EWjsawhnn8wpWwMiTo954
	mGE47qZP9fQ7s6+yK61qmqFoo+wRxvwem5/jyyx7iWbdtTzI1dOH0RFrJuBdtDH5hYFdQoM3Iygc0
	gKjcn8IeZs9LAnVsSm6oF8TwB/Wun9oupFDoUkFM1q0iJkhkKEWZ1ps2xKw5dBiqVNNTEJ3W6CAT4
	s8LClV/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54Eu-0000000HEjq-27Hx;
	Fri, 11 Sep 2026 16:36:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54Eo-0000000HEhp-44YR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 16:36:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA0F52BC6;
	Fri, 11 Sep 2026 09:36:24 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C5F8A3F7B4;
	Fri, 11 Sep 2026 09:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789144588; bh=ZgKXKOLm2sYRf235h4zu/DkzNsUkg7Z3/2TgHyl4z9c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u2RygQWRT3uOLI+4If3Ryjn1uxH4/dkKQX9AekeN1gGRpLuuXdT3h9RuWpKuvDnYB
	 d8ujEEnNiHxLD/A4NSMpYyQd0k/hQLUpuFa8MoQ08YFpOju6V4toDTRwpBeRmX6EF8
	 sg8ZGEMySu4emD0Yuh2QjWGvl0M6oMKGwtegndOw=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	corbet@lwn.net,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	dave.martin@arm.com
Subject: [PATCH v6 2/3] arm_mpam: resctrl: Add pass-through resctrl_arch_preconvert_bw()
Date: Fri, 11 Sep 2026 17:36:12 +0100
Message-ID: <20260911163613.1131447-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911163613.1131447-1-ben.horgan@arm.com>
References: <20260911163613.1131447-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_093631_061987_EB143286 
X-CRM114-Status: UNSURE (   9.54  )
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

resctrl rounds up the percentage value of the MBA based on the bw_gran. As
MPAM uses a binary fixed point fraction format for MBA rather than a
decimal percentage, this introduces rounding errors.

Without this additional rounding, if the user reads the value in an MB
schema and then writes it back to the schema, the value in hardware won't
change. However, with this additional rounding, this guarantee is broken
for systems with mbw_wd < 7.

resctrl is introducing resctrl_arch_preconvert_bw() to allow the arch code
to specify the conversion resctrl does to the user-provided bandwidth
value. Add the MPAM version of resctrl_arch_preconvert_bw(). This does no
conversion.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
Changes since v3:
Parameter order switch (Reinette)
Add Reinette's R-b

Changes since v4:
Add missing tearoff divider, ---
---
 drivers/resctrl/mpam_resctrl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9d223057953a..f2c651e9f6ea 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -148,6 +148,11 @@ bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level rid)
 	return mpam_resctrl_controls[rid].cdp_enabled;
 }
 
+u32 resctrl_arch_preconvert_bw(const struct rdt_resource *r, u32 val)
+{
+	return val;
+}
+
 /**
  * resctrl_reset_task_closids() - Reset the PARTID/PMG values for all tasks.
  *
-- 
2.43.0


