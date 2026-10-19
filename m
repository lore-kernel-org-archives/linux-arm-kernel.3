Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C13CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 12:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/T4dpTCgBomTD6eEwaA8Ybu6I7bQ2brZD+Mi2z7v1XE=; b=JsOCv4E/LJW9oruJBMvfMhilUN
	5kB31hJkgvnYI4mkHlgOeAnQqtTyvayuJ1ffX9khqbhMXMaLNU3ZrwNfR9wYL7Y4Y+Abr1QiseTn2
	0Q3Sr8M94ShLbqXFpSYosHVoVs5o+ZFK1rEomg510EVZbUTSePuLVs1SxJkplwrO3t68JgcJ3ZAsi
	H7VhcUJJkLL1j3x3Ygcec7q/YadHTmY2QVguv8Kp7AwEJSXMmdmvwS16BgXBa8E5i71ThK2y6tVA7
	GxfyiZa2XZ5iEAXBM3Vqc7FgxEMex23O8P+cG1BKD5tte8NlEBhYPesF0UvpboZeW01QRaLDGyPRx
	UrMpYYTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImlY-00000007QhH-2uBz;
	Mon, 19 Oct 2026 12:47:00 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImlV-00000007QgS-2ZDu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 12:46:59 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1775214a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 05:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792414016; x=1793018816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/T4dpTCgBomTD6eEwaA8Ybu6I7bQ2brZD+Mi2z7v1XE=;
        b=c0S39j2oYIYoWjK5A5NMfMKnoHC+6lqvwPPHbHce8cNEJ/fk5uG79I7s1NP+HUNSQr
         O67/f9alnHgXKIBt7YQgiYjYmWO/Pp5UNz7SEIp+Ust2adtyEMePPubKDjy0Vyo5p/Q6
         O8SEWDRLedKc4LZOvbPYCl/B8so64ot6OLB23IoXTJiEhBeL02o11/uys6POatk+mX8W
         BWi/yZ73sVJVgKQ2Y/5sOozxADYO0uwDitH/d5XfCMDkcNwnEPLW/K7Z953L01qBygQk
         bzMYZvwteNqQFTa79cFobBO6+EDWIadLns2TAXWMduuynQZZlet73e358aN9EzcJY2Tq
         ytfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414016; x=1793018816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/T4dpTCgBomTD6eEwaA8Ybu6I7bQ2brZD+Mi2z7v1XE=;
        b=PSIoQVg/ttL9xD+8WvBJ7jf7qX+e52QNFhcJ3oUt+oX+5P2iL9M3Zx2MGkABFFKQkJ
         muT74VvSF3zgzXoiQI+bCcZvW0yTU2Veppr8QM9WlUmSwJufRUEfFPq+zwewlrYuc9FU
         fK03Q57Ez9hQa8uz7D59zMfKKQLRwp2s/FGpVFujatnwcATRjGuMP87fteQ13evXkMjB
         DevqtEIsCjanfeSvCDG0GCOWhhuafSN6LEra0kVaEpCsIXoDdswvPS3VgfdzdrlpgNLd
         lsJSn9fedKlalLpRJ2TUtLS/7ympXt6v4yx3UDNjbU5KySu2X4AprsRAzCv8SlNScIrT
         hlfw==
X-Forwarded-Encrypted: i=1; AKwUvBx6jWdknhIKxSIJLaV8xGT5kkBCMJMvzaJJRZw54VA7zF2YpqS5umS5ZzZrTpOSjlCB0I57QxVk9TgBffQg/qEU@lists.infradead.org
X-Gm-Message-State: AFq9FYIFKMUcG5jLUcz3zze0ONBlyph/SyvZQna6lD0kQRUq6AdP6iMl
	fARjHiwZnjIpyoPKYXXCwBJQRCJndiPGDgpWo3csl835E63qsohgCkY+
X-Gm-Gg: AYBFou30obdpvUMinCeDxYoioZ94KPNWixdAZiM3mIQVd9ZNf8N/NyiE0zW3yA6Y/KR
	A3cxyJrZVSpk+ajZ0ufmZLFfmnfTmWAFK3MVzkQIG3+FOVC13k079FMWr2wJbbm5Z0uGcdepbaa
	2r3+vYTa1k+hYaMwR0/+HMSLAuikI2C0JSloGbtycVmQLuDk43ypOrM10uKtCgzODfTFBp0CR9J
	+zhu/YfjSvUo/f2Wflx1bSfoyl0lUa+jwgKtNXis+NlWW4PO6TjO6Gd3LRZEogO/98/kfnGrKPW
	W+gAFscHNRPr8XkNXg04EsAK3IdR9OGZEELv/Ogc6I39K5n+fXL9Ksvt8dcgGEW7diS/uNB9/6R
	F/u68VScTp1tYlYD+lFc5fOhZ6esYqCZPcdafFp8H6JVDytGpDTX5rmxsB8VQ4Sh0Dx7NQBaune
	+rH3VX+8r94D0QndVDipjWOa8RFlomGb/u2iK5rN3/LVlirpFzcz9CkqPi9+Wh5P1AA4KhMe4B/
	BM=
X-Received: by 2002:a17:90b:5487:b0:3ac:9c37:9426 with SMTP id 98e67ed59e1d1-3acef0c8743mr7123863a91.31.1792414015871;
        Mon, 19 Oct 2026 05:46:55 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad48dc2f1bsm1729020a91.4.2026.10.19.05.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:46:55 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH] arm_mpam: Do not access MPAMF_ESR on MSCs that do not have it
Date: Mon, 19 Oct 2026 20:46:12 +0800
Message-Id: <20261019124612.134035-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_054657_652522_928B495C 
X-CRM114-Status: GOOD (  12.35  )
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

mpam_msc_clear_esr() and mpam_msc_read_esr() read MPAMF_ESR
unconditionally, but the MPAM architecture only provides this
register when MPAMF_IDR.HAS_ESR is set. On an implementation without
ESR these accesses reach unimplemented register space.

Read HAS_ESR from the IDR during probe, make clear_esr() a no-op on
such MSCs, and have read_esr() return -ENODEV as the register
cannot be read.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/resctrl/mpam_devices.c  | 7 +++++++
 drivers/resctrl/mpam_internal.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 48adc49b833c..a473b2872183 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -388,6 +388,9 @@ static int mpam_msc_clear_esr(struct mpam_msc *msc)
 	u32 esr_low;
 	int ret;
 
+	if (!msc->has_esr)
+		return 0;
+
 	ret = __mpam_read_reg(msc, MPAMF_ESR, &esr_low);
 	if (ret)
 		return ret;
@@ -415,6 +418,9 @@ static int mpam_msc_read_esr(struct mpam_msc *msc, u64 *res)
 	u32 esr_high, esr_low;
 	int ret;
 
+	if (!msc->has_esr)
+		return -ENODEV;
+
 	ret = __mpam_read_reg(msc, MPAMF_ESR, &esr_low);
 	if (ret)
 		return ret;
@@ -1205,6 +1211,7 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 		pmg_max = FIELD_GET(MPAMF_IDR_PMG_MAX, idr);
 		msc->partid_max = min(msc->partid_max, partid_max);
 		msc->pmg_max = min(msc->pmg_max, pmg_max);
+		msc->has_esr = FIELD_GET(MPAMF_IDR_HAS_ESR, idr);
 		msc->has_extd_esr = FIELD_GET(MPAMF_IDR_HAS_EXTD_ESR, idr);
 
 		scoped_guard(mutex, &mpam_list_lock) {
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1f86cc158100..b648c006e102 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -80,6 +80,7 @@ struct mpam_msc {
 	int			fb_id;
 	u32			nrdy_usec;
 	cpumask_t		accessibility;
+	bool			has_esr;
 	bool			has_extd_esr;
 
 	int				reenable_error_ppi;

base-commit: 8ea457f746d915d55f78b43d33b1cd618f3d93ad
-- 
2.34.1


