Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E18C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 16:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9eCpaYMUO4EeWZlvn6GVk/tkNTkULXcGBrHFnW6Sbc=; b=bPVJEvGN+WMDtyEq8gN6f3z1eF
	PVsfIq5ADfqZRXKywjDNGsw4R29uDix5QA3qTvvfUkVKhhOuFmMIOBbrR+rYAVntuSzASoj8eNyxh
	r+9s/PsF3iPzwpHdWBrc+ew2hFQqDf3Q7AE+cExVeLGSTdOqL9zeO9P11t5kV0BvBbeBJTG1ebmlL
	4oS0RCtbNzj3PPSs5Pimi0h50A+3OmeE8P9xxQk+d9TiLfqjZz78bamT1g5m57v1evaLMnp3c/Ib+
	3b0VAsfxya4VgRWE79chFtPHSp6IrPHOhbUqkhBj1lr6KlBsdBu4js71xylUN0/lfnJBYjr9WGXEG
	+RJAiEEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglqZ-0000000CzZ7-28Ib;
	Mon, 06 Jul 2026 16:07:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglqV-0000000CzXX-3PeE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 16:07:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88B45271B;
	Mon,  6 Jul 2026 09:06:54 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7FFCB3F905;
	Mon,  6 Jul 2026 09:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783354018; bh=4g7Ytd0MPyjsSrvRjEeiYDsb2RtqJyQNg8z8cWlum9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bHVBBcng+I847HGIjWG/fHvewidYFlUo7rtP9RuVVf2lk1z7U1KVOdZ06ifyQIYZa
	 e6X6rBt98Tsja8JZ2ugkqaDpwzHJjxdMjY3gG5QJ5rRmHhY7zBOcul5+27T2XlJ4kU
	 R0/zAlMn6egkmsjXTE1rLITBW3T/QRp+nfAZ1IrE=
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
Subject: [PATCH v4 2/3] arm_mpam: resctrl: Add pass-through resctrl_arch_preconvert_bw()
Date: Mon,  6 Jul 2026 17:06:38 +0100
Message-ID: <20260706160639.2136674-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706160639.2136674-1-ben.horgan@arm.com>
References: <20260706160639.2136674-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_090659_890197_633E2CD1 
X-CRM114-Status: UNSURE (   9.76  )
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

Changes since v3:
Parameter order switch (Reinette)
Add Reinette's R-b
---
 drivers/resctrl/mpam_resctrl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 226ff6f532fa..e9dea8c40265 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -167,6 +167,11 @@ bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level rid)
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


