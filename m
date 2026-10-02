Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B02CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTh7vCMM021v8lAXSHRZyuGo2XuTLOM60VVyuw9csbw=; b=S+kvoMP2gXMZPH13nzdSO6R7MD
	TQMiFCIhhfLjb6rLO422LqOD2BMnq8krXTqfSf7vvQMfp2X0lsLcULdSqUW45To/7L/WKBw4x0/8T
	vPhMeTIdBhDZLdOZcgyoz88FZwK4dZVegDvVamUrHiygu5qpOUnJwH1tTNQTJPiq6I5VtQdmYka5u
	d45TSLPKOq71x6lyL2kS2F7x4NUsi/BN4wqv7WwZ5Ox0Y8EcbyNEa0Va8tjA8sb9+FY6Qi8gKDLQi
	4FVoYd2VO0yxPTlVCUPbcijvFJmZpVK4etQ/r6BoxYzcoRpfBk5vLPpGNM3cMtjs1HVQDCVnxVT5K
	850NgTjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChFN-0000000CBnY-1g9j;
	Fri, 02 Oct 2026 17:40:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChFF-0000000CBeB-2AT4
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 Oct 2026 17:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZTh7vCMM021v8lAXSHRZyuGo2XuTLOM60VVyuw9csbw=; b=Ui/brusK/0n7MX/ue6sqpyFUCs
	yZP1MjYJ4ZTm1aA1N22XEMfZHmFqMFVmIyujL95zcBUqi4SsJDEPTwzpI/UZLCkya9ICsT1EJHYoT
	PHJxNYZ9ak/QD/wwSCPmZL5MFEAsOt6FLbOJbmcgo0xqK/KSafq59HX1ARdrdQZwcAFBIzdmKBJYt
	8BtK//bKyR0usg0ZJP9WdigRkjdEHxcX02qQDg37oDG6VDCyHSaFencVXXi/GslfLVMRaWEzS4aeU
	w9QR2yVoLOhDz51Nn+1fijhghD32icivoX8WqAsPq/Zoq2vKLZ4uyF2JQuVBqql6FRgVq05xONuT/
	1Fm/5b3Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xChFB-00000006BLf-0Vwe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:40:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30418169C;
	Fri,  2 Oct 2026 10:40:20 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 734EB3F882;
	Fri,  2 Oct 2026 10:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962823; bh=QJUU10lwK5Sw4Tq+neZ4BhNUAsbqgWLbetG9KuRfRK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CP0IHnmXWJA7+Rh9ymNfpJCMMaxukVF8xCIJ2/Up3nPPUbYL7iW3K+FGx++uHUdpq
	 RjotEd9zgswmiq4muMd3bgVL9oW7gDNCE8y3O3JaRocJpGp5itbRTl8bK+I/d/PUpO
	 QybUNtnu8fdcJURaIOFGzDaL2n1u+s2cKNfYB/VQ=
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
Subject: [PATCH 17/27] arm_mpam: propagate MSC access errors for MBWU counters
Date: Fri,  2 Oct 2026 18:39:30 +0100
Message-ID: <20261002173941.292319-18-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_184026_286404_2C46A62F 
X-CRM114-Status: GOOD (  14.82  )
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

Allow the mpam_msc_read_mbwu_l() function to return an error, and
propagate errors from the lower level up. This also changes the users
of this function.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Gavin Shan <gshan@redhat.com> # on NVIDIA Grace Hopper
[morse: Fixed merge conflicts in mpam_save_mbwu_state() and __ris_msmon_read()]
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index a5365b56b1e7..c573fe08ce01 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1139,8 +1139,9 @@ struct mon_read {
 	bool				waited_timeout;
 };
 
-static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
+static int mpam_msc_read_mbwu_l(struct mpam_msc *msc, u64 *res)
 {
+	int ret;
 	int retry = 3;
 	u32 mbwu_l_low;
 	u32 mbwu_l_high1, mbwu_l_high2;
@@ -1150,20 +1151,30 @@ static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
 	WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
 	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
 
-	__mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
+	ret = __mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
+	if (ret)
+		return ret;
+
 	do {
 		mbwu_l_high1 = mbwu_l_high2;
-		__mpam_read_reg(msc, MSMON_MBWU_L, &mbwu_l_low);
-		__mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
+		ret = __mpam_read_reg(msc, MSMON_MBWU_L, &mbwu_l_low);
+		if (ret)
+			return ret;
+		ret = __mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
+		if (ret)
+			return ret;
 
 		retry--;
 	} while (mbwu_l_high1 != mbwu_l_high2 && retry > 0);
 
-	if (mbwu_l_high1 == mbwu_l_high2)
-		return ((u64)mbwu_l_high1 << 32) | mbwu_l_low;
+	if (mbwu_l_high1 == mbwu_l_high2) {
+		*res = ((u64)mbwu_l_high1 << 32) | mbwu_l_low;
+	} else {
+		pr_warn("Failed to read a stable value\n");
+		*res = MSMON___L_NRDY;
+	}
 
-	pr_warn("Failed to read a stable value\n");
-	return MSMON___L_NRDY;
+	return 0;
 }
 
 static void mpam_msc_zero_mbwu_l(struct mpam_msc *msc)
@@ -1381,7 +1392,9 @@ static void __ris_msmon_read_locked(struct mon_read *m)
 	case mpam_feat_msmon_mbwu_44counter:
 	case mpam_feat_msmon_mbwu_63counter:
 		if (m->type != mpam_feat_msmon_mbwu_31counter) {
-			now = mpam_msc_read_mbwu_l(msc);
+			m->err = mpam_msc_read_mbwu_l(msc, &now);
+			if (m->err)
+				return;
 			nrdy = now & MSMON___L_NRDY;
 
 			if (m->type == mpam_feat_msmon_mbwu_63counter)
-- 
2.53.0


