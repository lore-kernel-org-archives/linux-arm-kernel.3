Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD70FC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 09:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aOO3uoL9dHlF3J1MQewZ674HNYb6SMCTZDP8iIlVM+s=; b=EDVjJa3NCS34JaZJpBz4yRYSYu
	B2osEI905MhjgDnETsQls5kTorjANZoVDVCZYSPuaAzyF2wkv5dDyPKzX54sfJVuu3Cw2cKNkzLw/
	A9n5fe3tDNWypDlI5QUhdkfSa38xc3Ku5a/RoOYicsyEBjRm/KAjrJ8yd9rfqIf93B11GqpWBrp8s
	oYMSDaP/zjU/0CA/o5sn7gCsQ1oSpOPebnu7/kdSZmYfYtmYs5+jqngHx3nwYcxpWUQkZ46+b3ERy
	pzF66Y6nUi391GygS2DgI3aacxfc5Sf3/Z1+4dkKoyBbO8FWagsIS04l/rux9vM9C8SRxrrhdsdxN
	Kk9oQLDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzst3-00000005TZ2-274u;
	Fri, 28 Aug 2026 09:28:37 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzst0-00000005TXz-3rUP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 09:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=aOO3uoL9dHlF3J1MQewZ674HNYb6SMCTZDP8iIlVM+s=; b=H09l91JL4LjOvblcdAOe8rRR0v
	rruRwcjm7V+2CmdBIFNmw2PumM02xCQHUcWM2oLxMDhKFuuslsWG/UGvxCyNid3EyJPmsonYd8QBt
	UkXCF7l45+N7+htuBtMUSbfQQAw2qqnwCyEqUC0gS7NV+eqB6/z7bCIS0nuJoZED6TkYmFCayHBtg
	kQUqURX1wAOXJdf/z0Ec3tFy3rkSeZwhWq/+ehzHm2gaKAVppNWYZGtOyRm7NSGnU4qb7VK3lF/pn
	fCFB4wYR4fKpLlnereTQUFho2jFbhGXHjXElocKQHyFvWudWS11OVzvszwA6MrVEVKkjm8ihjEzH7
	LRRjlTFA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wzssp-00Gfqh-13;
	Fri, 28 Aug 2026 09:28:23 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 28 Aug 2026 02:28:18 -0700
Subject: [PATCH] arm64: trans_pgd: clone only the linear map that exists at
 runtime
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-arm64-trans-pgd-va52-v1-1-a66644372673@debian.org>
X-B4-Tracking: v=1; b=H4sIALFUkWoC/x3MQQqAIBBA0avErBswMamuEi00p5pFFmNIEN09a
 fkW/z+QSJgSDNUDQpkTH7GgqSuYNxdXQg7FoJW2qtMWvUEnuzV4iYsJzzVgdq1G5X3vjQmh6y2
 U+hRa+P7P4/S+H7liOFppAAAA
X-Change-ID: 20260826-b4-arm64-trans-pgd-va52-0bb9b44dd896
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1655; i=leitao@debian.org;
 h=from:subject:message-id; bh=1v4rUGAHqeIIUzXoY17LIgUNFnttk6dN9Qs+A+XFNmU=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqkVSz8oIPrX6B495JDhRFq+yFUIe/STTeiiW4u
 CXbQubqER6JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCapFUswAKCRA1o5Of/Hh3
 bdoHD/sGwFPrHJ9c7e0LCnK8ea+wnBksKBSIGYE3q6mm0qWym0odFdExThRRRJOW1GG0U+7dESV
 Tff8EKQF1Utkaqt74ovR0FBAGLUs2fCdzG8aXYWIvH56O5sB/L3Ln9d18dNya+floP+QTQ9djuy
 S7D0yDfwwpLfOyYYpeQcWA6BHoNqiK6Ljw2k6ZQnwDn1QJCxHQ5eg/TVujToD8Cfwbj6vycxTri
 D+/fFhBf6toA+ssFGCIe28MsBGE/KEE55lao3ICCbGuuH/4iVfGlXRynfPE2aDIk6tqlb2lGh4P
 gUv9MA89Uvf9B8Y+odDX+9uHdur2BFUb6P8CAIImIoIuYYL4NPqrInvdEF7sV5KCF9iSX/pNccu
 YxrbRqZC3H8Ryf5gkJfsSjbC3ZkquTI9wCWgjZ6yxr9hspHqBxWjZCsPQxvdc0SuiHlaQDbEhbZ
 02oXUFp6Hz6y41l/5qp6ToburZsH9ebSGPrNw2cDY2H0XTbfpBVotk1ZFn9kaJOyazY+VnYAkig
 QhHWWFM5m1L5uE5Zc0T7eeElQtk38kwB9vt/rlLQikrSKV1acJJUMWnZEAtBnZoCc2LdiZ9rZu4
 XehH/+JzGIc1Ap3Z4w9yZw+hGGNZKYd8dZ0iyqfpBebvDYciEqNHYefHNsKjX7IWvp6aC/UxVwI
 Cp7vNA/7LBZydcw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_022834_967887_CFEEB53C 
X-CRM114-Status: GOOD (  12.63  )
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

kexec_file_load() fails on arm64 if we have CONFIG_ARM64_VA_BITS_52 but
it runs on a !FEAT_LPA2 host (such as my loving Grace machine).

That is because trans_pgd_create_copy() uses the compile time
PAGE_OFFSET (VA 52) instead of the actual VA size (48 -- due to the lack
of LPA2). With the fifth level folded, pgd_none() is always false, so
the walk cannot skip the 15 extra PGDIR_SIZE slots, and they all alias
back to the same table: the whole kernel page table gets cloned 16
times, KASAN shadow included. Without KASAN it does not blow up, it just
wastes ~RAM/32 in page tables.

Fix it by copying the linear map that is the actual one, not the
compiled one.

Fixes: a6bbf5d4d9d1 ("arm64: mm: Add definitions to support 5 levels of paging")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/arm64/kernel/machine_kexec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
index c5693a32e49b0..8f9bc2327dc85 100644
--- a/arch/arm64/kernel/machine_kexec.c
+++ b/arch/arm64/kernel/machine_kexec.c
@@ -129,7 +129,8 @@ int machine_kexec_post_load(struct kimage *kimage)
 	}
 
 	/* Create a copy of the linear map */
-	rc = trans_pgd_create_copy(&info, &trans_pgd, PAGE_OFFSET, PAGE_END);
+	rc = trans_pgd_create_copy(&info, &trans_pgd,
+				   _PAGE_OFFSET(vabits_actual), PAGE_END);
 	if (rc)
 		return rc;
 	kimage->arch.ttbr1 = __pa(trans_pgd);

---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260826-b4-arm64-trans-pgd-va52-0bb9b44dd896

Best regards,
--  
Breno Leitao <leitao@debian.org>


