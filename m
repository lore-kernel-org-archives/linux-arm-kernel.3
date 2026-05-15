Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FD0CD4F47
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 14:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0CUS98Dl/LplF90aLLRJAdk1hUFxDgglnfPEsJEWmQ=; b=KwB+qtibJYYzXcb5pm0HN3liSM
	ZXR8e2TyJ2AfSyoOOU7s+sy7DFnxuIrsbeOh1M6Cuj1CUZNVLOvVDF9oIqoNeP8ZrTyqZEuBxti+7
	hkdSMMX8+wnQXeegh+oF5JiPqATZFpn4LA0gIuoAnUgJajjNz33VL5vlgr6/5ySqHW4mMuOZQ1jkU
	0K3shtrEl+JmphwIv/t4E4zpt1PfADZFWYmXws6mQ71zYhcgYs89wa8r0PhYTZPUPYiQ2BSxIkO2p
	mAJf4wzkuHO/peuX0fC61yQYCfnNuVtXANBVYyrSsZtftGHrTLItxKQ+jFSaJ1+AFgT+7Eod7z+BR
	pWy7SnmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtBW-00000008Wdh-08a1;
	Fri, 15 May 2026 14:06:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtBS-00000008WcS-3EYN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 14:06:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E05B35A5;
	Fri, 15 May 2026 07:06:27 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8EBAC3F836;
	Fri, 15 May 2026 07:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778853992; bh=fT5zpgH8sZLDiwtCzmI9hNrpGxEbBAiElP2J+OjSfBE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pD2IjQeBH+1GQ1NS2tAG1aYTe2GJEqgOTjSK1cL2ERK5RsOOOk4Ll68ip1x7JFrJ1
	 H9B+MEkAITgwj1AqjcpcDvRiHU3hC3BkR71JfhskWPmgFhjZjH288M2boxDj9rO8+x
	 UcJlhirlQwuDw2SYY5qHidF0AjIaTvCUaO+ZewX8=
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
Subject: [PATCH v3 2/3] arm_mpam: resctrl: Add pass-through resctrl_arch_preconvert_bw()
Date: Fri, 15 May 2026 15:06:11 +0100
Message-ID: <20260515140612.1205251-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515140612.1205251-1-ben.horgan@arm.com>
References: <20260515140612.1205251-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_070634_925480_574D4905 
X-CRM114-Status: UNSURE (   9.23  )
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
---
 drivers/resctrl/mpam_resctrl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 226ff6f532fa..5a2104af22cc 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -167,6 +167,11 @@ bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level rid)
 	return mpam_resctrl_controls[rid].cdp_enabled;
 }
 
+u32 resctrl_arch_preconvert_bw(u32 val, const struct rdt_resource *r)
+{
+	return val;
+}
+
 /**
  * resctrl_reset_task_closids() - Reset the PARTID/PMG values for all tasks.
  *
-- 
2.43.0


