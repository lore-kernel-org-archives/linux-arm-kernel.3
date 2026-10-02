Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EA5CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DEeBJUidFxfqnNZZV0zA/4w8lcgnsjtlF2gVlAklAk=; b=C1C8xRi4tcM81yH7Kgv+UKaIyf
	CNy+9Z9O8qqHDAVpPM/h3ejq3kG+v1YsWvIhBm7x0LnvSG/bIVePaTE4AFJN7nLerh0UFaezLJTQ/
	Q9lwHS4pW73QEaCl8PXAasxtyFf3B9/yjUwJXJ7d6vbq7W2MrzyWH8QzpZ+WpA19wUxfdwzHYiWq3
	ZXQlQCtt/t114prVeOAolKaw0a8Xov0vCzZCguczOSuRkU91zlu7BadWbaP5p5MYxdQIIlHCEqJAj
	4wQ/i+AanL42kpkVuJt24hjiEbi1SDKw+w8sWKaipgNEDxoOpLppBgdvqXEclu8ZrmcVs/Bt6a9aO
	u7lBLDAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChFX-0000000CBxl-3LPQ;
	Fri, 02 Oct 2026 17:40:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChFE-0000000CBd0-1kDv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:40:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7911A175A;
	Fri,  2 Oct 2026 10:40:24 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE8123F882;
	Fri,  2 Oct 2026 10:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962827; bh=2qqS+qVrvkie1mExoEOldqaEvmwCsbKcRTLaTb0h1LU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cX/rDoVQ7cLeYVHO+Pn79vmXhKKsv33ofOWfTLyKu3P6iASgZ8qJ22mOvW9vrfEOx
	 yMlJsYWAWbcYYLlytDEr+SEJhrqivTHj+85/Ha1FDaG8UohnnxbkgIz4lTtjMKszYw
	 lroYvT9w9zoc5ZSWSUGoUBUPDIahOL8Q3jzrgOM4=
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Gavin Shan <gshan@redhat.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 20/27] arm_mpam: propagate MSC access errors for state saving function
Date: Fri,  2 Oct 2026 18:39:33 +0100
Message-ID: <20261002173941.292319-21-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_104028_530719_07EC70F1 
X-CRM114-Status: GOOD (  10.08  )
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

From: Andre Przywara <andre.przywara@arm.com>

Allow the mpam_save_mbwu_state() function to return an error, and
propagate read and write errors from the lower level up.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Gavin Shan <gshan@redhat.com> # on NVIDIA Grace Hopper
[morse: Fixed merge conflicts in mpam_save_mbwu_state() and __ris_msmon_read()]
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 853e5c5d7158..39437361ed7a 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1859,6 +1859,7 @@ static int mpam_restore_mbwu_state(void *_ris)
 static int mpam_save_mbwu_state(void *arg)
 {
 	int i;
+	int ret;
 	u64 val;
 	struct mon_cfg *cfg;
 	struct mon_read mbwu_arg;
@@ -1877,10 +1878,18 @@ static int mpam_save_mbwu_state(void *arg)
 
 		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
 			  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
-		mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
-		mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
-		mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
-		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
+		ret = mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
+		if (ret)
+			return ret;
+		ret = mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
+		if (ret)
+			return ret;
+		ret = mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
+		if (ret)
+			return ret;
+		ret = mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
+		if (ret)
+			return ret;
 
 		cfg->mon = i;
 		cfg->pmg = FIELD_GET(MSMON_CFG_x_FLT_PMG, cur_flt);
-- 
2.53.0


