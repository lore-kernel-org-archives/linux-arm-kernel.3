Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F2CC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MMRGtc/YdjBCDNnawNBEVkHA44KGSgJESgxXTj3UFMo=; b=DETEcZfeo0HXHc
	1xpM0gHl9ztJhNBgFUZNWio4BoOoiARrU02+23jd0rj600RPuzcx/IkN0S7rheFU069pOIjWFSZQh
	gUHWefLWUx5qN6QtxTGEY6cPwu/+iUlb4v3K8StV7jHiRtAmL+rgjxWpMrA3p7ZqqN1eyNzgVuvwc
	9BDip8KvkArLFxiqaqweuqhTHeUeo1mawwezeISOU4CiY9uzKnXhPVthPaeTaobNQP3xcvR5twT8S
	t/qMEgyFBD297Ngbf2aNQLb2RhtlEpOsiSpXSVwBSEO1kH/JJNFeNSpbv3iT14Fe9v1UfU6N37Zn9
	LafCFCFoqKdspuF0vFUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3dz-0000000CLTk-00Lb;
	Wed, 30 Apr 2025 09:22:19 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3c1-0000000CL16-46DH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 09:20:19 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746004814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MMRGtc/YdjBCDNnawNBEVkHA44KGSgJESgxXTj3UFMo=;
	b=0HpGLRqgYfB+K2JbbFVAHHOtYZAtcCvOcTgmlUi8HqwVny7swKGQPS88+vwfwZPsm3KKny
	CafoWtTExPZxKLBxrod7N5yTj7zAd1U45n4ITxgM4v/vNmhyUjF7MXmMF8jRCg0MKJzBSq
	u8nqBZdELEicIr2dJ8JhTYKXi11+86wCkBUHnnT975rf+pS99GGzn63R8oVHxsU/FY9+Dk
	nGrLgKG23qavsvyTDvVUW0eUDAfVCpIZVrR44+vMaVVEaE/zy3hvNCVQ/wqUrxNBEP+yt8
	q4xKh/WEiE3ql1koPKu2Tvf8lKOSgSJ1ZfFZlExMDSIyGTQ2m/imNsYJqD/aDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746004814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MMRGtc/YdjBCDNnawNBEVkHA44KGSgJESgxXTj3UFMo=;
	b=owWpbGxV7bQiBdT5uJNkafd86cFIs2zF4ShVTcYq4gs+pxHiI1ChB2rxmKKliPCzHoLJje
	VpbPBSt/A6mm5hDw==
Subject: [PATCH v2 0/2] vdso: Work around and reject absolute relocations
Date: Wed, 30 Apr 2025 11:20:12 +0200
Message-Id: <20250430-vdso-absolute-reloc-v2-0-5efcc3bc4b26@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEzrEWgC/22NywrCMBBFf6Vk7Ugy2pcr/0O6SJupHSiJJGmol
 P67seDO5Tlwz91EIM8UxK3YhKfEgZ3NgKdCDJO2TwI2mQVKLOUVG0gmONB9cPMSCTzNbgCNWGF
 7GVRdKZGXL08jr0f10WWeOETn38dJUl/767V/e0mBhLaptdSjUbIv7zPbJXpneT0bEt2+7x9RW
 oCwugAAAA==
X-Change-ID: 20250428-vdso-absolute-reloc-a226293c1761
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nam Cao <namcao@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jan Stancek <jstancek@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746004814; l=978;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=cW9d/Rmy90twKu1nBcAQ96FnqVatSg6nDwNqik5oPGU=;
 b=E4tZW5xu2Y4p5MVLh0Z1lPtgUgZiuJwUW175Ppl7/Mg6uyIxi4z+s1LtWmfYGdOtT6SX7KI7z
 mRhtg5RVmd5BXyj5WpzKtw+/xq1NxMnuN7yrFWEvJK+DEENpNVaSi8J
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_022018_153425_B473B678 
X-CRM114-Status: UNSURE (   5.55  )
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

GCC on arm64 would incorrectly emit absolute relocations in vDSO code.
Work around those and break the build if new ones appear.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Link to openend (invalid) GCC bug containing more explanations
- Refine commit messages
- Don't fail on commit absolute relocations in debug info
- Link to v1: https://lore.kernel.org/r/20250429-vdso-absolute-reloc-v1-0-987a0afd10b5@linutronix.de

---
Thomas Weißschuh (2):
      arm64: vdso: Work around invalid absolute relocations from GCC
      vdso: Reject absolute relocations during build

 arch/arm64/include/asm/vdso/gettimeofday.h | 13 +++++++++++++
 lib/vdso/Makefile.include                  |  6 ++++++
 2 files changed, 19 insertions(+)
---
base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
change-id: 20250428-vdso-absolute-reloc-a226293c1761

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


