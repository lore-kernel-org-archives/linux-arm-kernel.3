Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059EDC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FS/FALPUjabMB7pEZn3N2o0m3+yBNogJAw0/WPnz1HE=; b=gs2oYVsFZO/LULt8WvwRY3zgZJ
	PEPqzmBssfFNMeT0paJYqkGL/zf5tNzwwRyR/ZGlAi/umXBe5/le7eQw6fkMjYfGDI9ePncqoYEPy
	Vc6A7gmN27bKaXAE86Yqs4Jg/r/URnUh5rATpDex3qEt37WKkCzHLvxHnHzR2H/88re7e1wka9O35
	r2Do4O3w2MwKFYyy9ykyaoJkEon4t8HuNyq/d96FeN2B/IHGCppd1jRBzj81EGuvqvwhyObtmpbyz
	HFJpmbNETEw0C2aXrmfIj7rQcwgFK45tl/AcdjcT6k0ySQPtFBE2HjNNxPqyzOQK6rMt2X47Sqo6H
	YNxAOdqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fEA-0000000EX8W-0mSl;
	Thu, 10 Sep 2026 13:54:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fE8-0000000EX8A-1jXr
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 13:54:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=FS/FALPUjabMB7pEZn3N2o0m3+yBNogJAw0/WPnz1HE=; b=TLz3nm0wSz1Tzi4UFKEmbOfqJw
	KxPCk9vnZ6zjeaGXUivDes7mzpUOAbhe5dOEwwbobm50ouwbnryltnwoDHzKaeKlHB2XfmJQTjFuV
	AYKxsqk/wahGAx5/dHi9u00/wB4ci3N+hLkyXaAHUFcIAhgFjJBdSa9GnwU1FX0Ag/gTXNv+6Mhom
	B5WCJ+lhqEYHzhKw+ymkGihytFTSHwb3hi4fQhK8UhWPYh6xU2s+cTNa4Q9C9Mgfo4D/9J8LRr0/5
	19PvdDoNxSfjD6zG0AqOggGnC0pl+MJ8sXRYOMeE9XTdIeZxwqEuup2ik14EbtGyYoMkwiMVNZhZn
	tlPUEhOQ==;
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4fE5-00000002YxX-2jrU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:54:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=FS/FALPUjabMB7pEZn3N2o0m3+yBNogJAw0/WPnz1HE=; b=aoWVN1dsMBN1eM9ZuHzrKvA8px
	BHA4v6j6ntywHm8B+gFZ4SkNTGaq4iaBjmX9OfA0R6NbbP32NQEfX+zxcY/P2GeCRI92lIH8REJal
	RY6fSBZKtFog5CTy9PpVlw15htkzpDmwKhztqYBlmoGkwmuwbVTJHfnnotJ4UzBowuyyk68WQrlRr
	Bpvft/dCFhCSQB38sYS2hSx4+t0uUSceE+r1HhSzNNMBrw8zZtZ0PeSsS9I2uq3RcsH6cf4qItVVC
	gIf4AlLLGRX7irpEps9s2f3ouA3AqgeejqMJuZnrhXSQ3yEoG2Z89+NWvqTzR7t7Fa5kWHCe/UNOd
	kWUxCbXg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x4fDy-000YaT-2o;
	Thu, 10 Sep 2026 13:53:59 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 10 Sep 2026 06:53:27 -0700
Subject: [PATCH] arm64: hibernate: clone only the linear map that exists at
 runtime
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-arm64-hibernate-va52-v1-1-a584d9a7d65e@debian.org>
X-B4-Tracking: v=1; b=H4sIAFa2omoC/x3MQQ6CMBAF0KtM/ppJ2loRexXCospUZmExU0JMC
 Hc38R3gHWhiKg2JDpjs2nStSOQ7wnPJ9SWsMxIhuNC7u3ec7d1HXvQhVvMmvOdr4HK7DDJL8DE
 WdISPSdHvvx2n8/wBXMtu7GYAAAA=
X-Change-ID: 20260910-arm64-hibernate-va52-f738ede2144f
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=1951; i=leitao@debian.org;
 h=from:subject:message-id; bh=Pc7559Ay0oPivlYgMSEO05noCpMOYyrNO5XdB54ryyQ=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqorZzIH+ECtYHS/zmVZm8rjGbjNEHlz7+gpTLf
 fmWcGEH5JSJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqK2cwAKCRA1o5Of/Hh3
 bUzDD/4ginBBzwJ5sRDi8kVuONdKL6KTOEF8XDDWEGRok3npdYvd7Yk7BJmitEKfrGQ74OF9V8J
 lJDD5VVC3ROcaEO4EjBAWDw6C9e021qVtayxbAQ0uPRz+ir5kEDF0stnNMGXk18xrdi+F4x2OYU
 bvUlCNyJ5AupBwNVXHuUT6+nLYLWy8Q3xyG9zDR8E6Sx2JjKAEBlEHuSZSfxRJSl7TejdpAixG2
 opDvyAGf7sn8aj5z86o4slJGXAjmCUZnK5lLioNI54GvnPe46KIqkUg1/51VqeFWn4g2A+R8f57
 Jg4hhkQDc+Kb8ElQjmXWDm/zKR5DsHLOSy6jnyyF/c9QVmVxmmofEXMxUYvjnypKKplqebv/5xN
 SP1q2v4aSHjkzPtVBfdE/rCgNNQoK4nzxbT28lhdqa1JZE22/ys2j961+NErEDx9kvUVz+M7t+8
 E2VtI+Q/Z39VokD57SF117IrKiXweWqIvI7FuNvqRbzcGrMOjM340G3fEPBaTea0IAaykwcI8XF
 l3H434B/oSrGiKVpapn650cW7qbvcEqlpuAIszJfxqMp1UK2lUSXGY5lV2hYdDfnTgOj8qTnz5m
 shJxcvmiIz//FYcMgh2c6wQ/jwXTnlJa90zIfWrnxWqARM4f2exQhcPbssdh6jRchZiB/GyICV8
 SMk8BQE4LSevfbg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_145405_837696_5CD1C0E6 
X-CRM114-Status: GOOD (  14.21  )
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

This is similar to commit 1537e55728ec2 ("arm64: trans_pgd: clone only
the linear map that exists at runtime"), but in a different place.

swsusp_arch_resume() clones the kernel linear map with
trans_pgd_create_copy(..., PAGE_OFFSET, PAGE_END). PAGE_OFFSET comes
from the compile-time VA_BITS, so a CONFIG_ARM64_VA_BITS_52 kernel
booting on hardware without LPA2 -- vabits_actual is 48 and the fifth
level is folded -- hands the walk a 3.9PB window while its linear map
only spans the top 128TB.

On a VA_BITS_52 4k kernel with CONFIG_KASAN_GENERIC in a 4GB VM, I see:

  swapper/0: page allocation failure: order:0, mode:0x920(GFP_ATOMIC|__GFP_ZERO)
   hibernate_page_alloc+0x10/0x1c
   swsusp_arch_resume+0x70/0x320
   hibernation_restore+0xa4/0x138
   software_resume+0x15c/0x270
  PM: hibernation: Failed to load image, recovering.
  PM: hibernation: resume failed (-12)

Fix it by copying the linear map that is the actual one, not the
compiled one.

Fixes: a6bbf5d4d9d1 ("arm64: mm: Add definitions to support 5 levels of paging")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/arm64/kernel/hibernate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index 7bf1174277772e..424291c547f02a 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -423,8 +423,8 @@ int __nocfi swsusp_arch_resume(void)
 	 * Create a second copy of just the linear map, and use this when
 	 * restoring.
 	 */
-	rc = trans_pgd_create_copy(&trans_info, &tmp_pg_dir, PAGE_OFFSET,
-				   PAGE_END);
+	rc = trans_pgd_create_copy(&trans_info, &tmp_pg_dir,
+				   _PAGE_OFFSET(vabits_actual), PAGE_END);
 	if (rc)
 		return rc;
 

---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260910-arm64-hibernate-va52-f738ede2144f

Best regards,
--  
Breno Leitao <leitao@debian.org>


