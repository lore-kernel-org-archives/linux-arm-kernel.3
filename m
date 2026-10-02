Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09CACA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMnc/sn8RFcTPxBuCZYlvg36NYttqvqKYfyD0ixNpZc=; b=3hvmt4LFomkoVbY89bajN3NGY6
	cfA0lAwo50f1zqAbaV21N/B5FsnfblaSvDNomZjF4QoEJu24eqbGePUAKCgngxMMo98FXZ7xwDzQC
	bkHf+2GSJvZIMbow5Gw1579Igz3NvXlPE//cH3c+tHbScge37wm/uytiTj6o7wsdZDUDOamJv/Lwo
	QgaJKql4PMOxeHB9ljtLBwS1xG85F/n23OFVh9dZOHhqD5ukOrW85wtnMVIHnonb/v14xQjVDsZvu
	OuTmj4AXPlBkm8C0bKUpYki0snGnuL37P8LaWPsLR4wDJq1VD6AFYgbPC6sV0pGQObad3O1P+Fr8m
	hh6G5ZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChFF-0000000CBei-1mfD;
	Fri, 02 Oct 2026 17:40:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChF3-0000000CBSk-3EF3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:40:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 265FC143D;
	Fri,  2 Oct 2026 10:40:13 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A3A23F85F;
	Fri,  2 Oct 2026 10:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962816; bh=UqEnxo2j1dAgfpGwdXusq26Q3am8jQP3CfHxKZ3cuNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GVuIKj+CzctF98QrBt5GgXuOPNznh05VvgtOXOX7GTxvJ5EvMCz4a3q/MwnxDRtKO
	 R3L5nE44DdZXcxHvq3wJYeHc6KxwczBHvxdjFY6KPHF8shdk/AFOAxJd5o9au/Tupl
	 dy+VsWGrpDVJFt+OSJDmFl3ZJroWWsCNPhUJpv20=
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Sashiko <sashiko-bot@kernel.org>,
	Gavin Shan <gshan@redhat.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 12/27] arm_mpam: resctrl: Don't stop early when tearing down a class
Date: Fri,  2 Oct 2026 18:39:25 +0100
Message-ID: <20261002173941.292319-13-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_104017_855528_8F707519 
X-CRM114-Status: GOOD (  14.25  )
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

An MPAM class can back more than one control and more than one
monitor. mpam_resctrl_teardown_class() iterates through all the controls
but stops if it finds a match which means classes backing more than one
class aren't torn down. The same for monitors, in which case the mbwu
counters will be leaked.

Stop terminating the loops early.

As we are already changing mpam_resctrl_teardown_class() remove the
misleading comment. It doesn't call resctrl_exit() and isn't required to do
so as the only caller does it first.

Fixes: fb481ec08699 ("arm_mpam: resctrl: Call resctrl_init() on platforms that can support resctrl")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: James Morse <james.morse@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 321741a702fe..9cec5843e8fa 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1943,10 +1943,6 @@ static void mpam_resctrl_teardown_mon(struct mpam_resctrl_mon *mon, struct mpam_
 	mon->mbwu_idx_to_mon = NULL;
 }
 
-/*
- * The driver is detaching an MSC from this class, if resctrl was using it,
- * pull on resctrl_exit().
- */
 void mpam_resctrl_teardown_class(struct mpam_class *class)
 {
 	struct mpam_resctrl_res *res;
@@ -1957,17 +1953,14 @@ void mpam_resctrl_teardown_class(struct mpam_class *class)
 	might_sleep();
 
 	for_each_mpam_resctrl_control(res, rid) {
-		if (res->class == class) {
+		if (res->class == class)
 			res->class = NULL;
-			break;
-		}
 	}
 	for_each_mpam_resctrl_mon(mon, eventid) {
 		if (mon->class == class) {
 			mon->class = NULL;
 
 			mpam_resctrl_teardown_mon(mon, class);
-			break;
 		}
 	}
 }
-- 
2.53.0


