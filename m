Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66907E63FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 11:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=caNJZmidNUi2KrtVmAG5nh9Qqu0tMEHHjSt0ZowEnBg=; b=K/CFciK2E0qjwERU+0Z9kX6Uh6
	yXDBqxIZeSM+Wh5A+Z3L1Ghx+yqnFbhjRUuLLb9T/XIZipVSMdz15mrUx87o6WkL78RSvkDPbVEpK
	xJXuDs+ifVfGpG/R8WzNVh2InbpOm6RNARaAcMFVm5E36ceqwg/6Q8g1irnKlskPORp1S8CujVpJ4
	doGZa9U7JrHo/KYpqPn7k28zyd+thRX45UIiZGx855CE3Vn14LZhC8K5d2R+YDxjRLgBmrDAuneXa
	hRgMA+nlplzj8mK/WzS+UxF2lV/bhS3Sl/0hQz6fPyuOlqYh2v7e1CeIa0QPgGwkgbnxSK0TG91eD
	h0ZUSixA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9Ltf-00000004Asp-1H1X;
	Sun, 05 Apr 2026 11:44:07 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9LtZ-00000004AsH-1tp3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 11:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ca
	NJZmidNUi2KrtVmAG5nh9Qqu0tMEHHjSt0ZowEnBg=; b=VmKpu7AGNw5RAvMXyw
	sf7vHBT0YOS1PrEYjJwpZWp4HE1MsWnGHVvim1jEZq6ccUKBb3GUqKVKQZ4tzeCX
	EXdxVIG1qtnaxHWCSzBEj4qNk67hvyaXSMn07MCs51zTDc1Fmw7ltGpxVH9UTsd6
	s8mUYH+OstGpv9JobSKumze4w=
Received: from wang-MACHR-WX9.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3v1zkStJpbsmwDA--.50470S2;
	Sun, 05 Apr 2026 19:43:33 +0800 (CST)
From: Wang Wensheng <wsw9603@163.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	mrigendra.chaubey@gmail.com,
	pasha.tatashin@soleen.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: wsw9603@163.com
Subject: [PATCH] arm64: kexec: Remove duplicate allocation for trans_pgd
Date: Sun,  5 Apr 2026 19:42:31 +0800
Message-ID: <20260405114231.264761-1-wsw9603@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3v1zkStJpbsmwDA--.50470S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFWDtr18XrW5KryfCrW7Jwb_yoWfXFXEkr
	s7Aw47Jr1rtr97Z3yfK3yrtryI93W5u34jgrn7Za98Aa4Yqr1kJ34UJF909rn3Zr93GFsx
	JrZxZryjyFW8tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRXZ23JUUUUU==
X-Originating-IP: [2409:8a20:5630:17d4:afe0:bfeb:12cb:5254]
X-CM-SenderInfo: pzvzmliqt6il2tof0z/xtbC+QXa4mnSSuWP2AAA3H
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_044402_383682_D7E063C2 
X-CRM114-Status: UNSURE (   7.55  )
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

trans_pgd would be allocated in trans_pgd_create_copy(), so remove the
duplicate allocation before calling trans_pgd_create_copy().

Fixes: 3744b5280e67 ("arm64: kexec: install a copy of the linear-map")
Signed-off-by: Wang Wensheng <wsw9603@163.com>
---
 arch/arm64/kernel/machine_kexec.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
index 239c16e3d02f..c5693a32e49b 100644
--- a/arch/arm64/kernel/machine_kexec.c
+++ b/arch/arm64/kernel/machine_kexec.c
@@ -129,9 +129,6 @@ int machine_kexec_post_load(struct kimage *kimage)
 	}
 
 	/* Create a copy of the linear map */
-	trans_pgd = kexec_page_alloc(kimage);
-	if (!trans_pgd)
-		return -ENOMEM;
 	rc = trans_pgd_create_copy(&info, &trans_pgd, PAGE_OFFSET, PAGE_END);
 	if (rc)
 		return rc;
-- 
2.43.0


