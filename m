Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CA6CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 17:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K2lrHdcKmrkTxvpli74gP5hQ6IevGZ88LGVyOLlviNU=; b=aUe6snGrWu+k7tm0ID+30D/3OZ
	HcrRsEiFFmc9JgRZhj+VBnby+nKPbaaYyOIZ5c8za5mXQMhcKHGQusVWv03F5rGtQ+L3ntvdzZ/qj
	oFhYzEzPhFgU6jU2rLFN+HlBauHuLNYb9vGFr4vulJnpEAMU+mhzXMG/wdI/m30klu16e/rSsWWvT
	PAIb74wf/crca6ejnEcTM+aohyca12ktC6KPhp4R5fQexA3VtsS3/CdRNAGDKBpUcMi3d5o8wPP00
	VErVImEIqhzmWnZt8LHNGzGc4ORUoBhMlrR+XjxlvTbfdR1mVR4k5UpbYhoUpHmQ4MFtRalRcY4/y
	pup8DLwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQU18-0000000Bblu-2bFX;
	Fri, 22 May 2026 17:50:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQU16-0000000BblO-0nni
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 17:50:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D06742A28;
	Fri, 22 May 2026 17:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76A11F000E9;
	Fri, 22 May 2026 17:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779472235;
	bh=K2lrHdcKmrkTxvpli74gP5hQ6IevGZ88LGVyOLlviNU=;
	h=From:Date:Subject:To:Cc;
	b=ie6Ah+utwjQRDk5xVq212bvzeHsRbLgmKcIYus0irSmTQHGHvyNzF/Vb9PFUse0lj
	 Tw4AN2PxQUOGYnzrX50KF7tG9AWjOyEdKRVIVB7tnS+GNKIeZYdWwHcIQ38gd+tlIx
	 FC8HL7IXySr7lxVnEM6tHiEa16kopMwq+j75wcIokFK8OIIxq7pw7u7lM6GaWWBGhT
	 K8ACo93mjyealzfh5GwSNCy6qgZ98BgoZghCFAYxqifZ5k/5KuH0JY3vyHytHQbPjz
	 oFWEFzZFa3TLSQBxKcgsVxcgkxf82veApl0+GeocITRgtgtY8hc2OvtLhdAJ4qiPm0
	 /NdmVvT02E1ow==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 22 May 2026 18:50:28 +0100
Subject: [PATCH] arm64: Document SVE constraints on new hwcaps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-arm64-elf-hwcaps-sve-cleanup-v1-1-07b0cedfc6fa@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGOXEGoC/yXMwQ6CMAwA0F8hPdsEFmDGXyEeyuigBseyCpoQ/
 t0px3d5OygnYYVbsUPiTVSWkFFdCnAThZFRhmwwpWnLxhik9Gxr5Nnj9HYUFXVjdDNTWCNW5O3
 V1jQ0vYVcxMRePv++u5/WtX+we/1OOI4vFkkpfYAAAAA=
X-Change-ID: 20260522-arm64-elf-hwcaps-sve-cleanup-1af7874ad5b7
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2000; i=broonie@kernel.org;
 h=from:subject:message-id; bh=85EOPZprIF603n27LeZgWXjBlnhxpFg1sY/9vXoRiMk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEJdoFDoU5qxbTx15+3Np45Stlnj4NAz9Lg7W3
 gTZyIbX9L2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahCXaAAKCRAk1otyXVSH
 0EB+B/44aGs3sudgZQ9Jbc0x1Os1sMRNkopU3J6wfKCWe6+QT0u3vT8EBlTNHdysJWSNmzGV0j4
 Yuc3priS7d/ZUraMq2oBn1MWHzNXkcTRI5x1LlIuX6Bn/qVirkFupzWx/F+yAoE0E5618hAKkuf
 ugxVANNTCitZVY0Y4tIQKrdehWeY61tAwD+Yzi0w6/82NJn593jUZtz87Mz6rHFR7olUJWgS4SX
 tcajIB0uauzx2ktwLakf8W8WdgzPIc8Ap52vOlsQGGpFKn8qnEWZ7aS5gJu0ZbAyhngcA293oDy
 gkvvYG1Ivb7TEI17iXiRi/xeMGJJpLS5krC+5oSk4eLcQUbT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_105036_283256_831C2BB9 
X-CRM114-Status: UNSURE (   8.65  )
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

Two of the SVE hwcaps added for the SVE features in the 2025 dpISA did
not explicitly call out their dependency on SVE in the ABI documentation.
Do so.

While we're here reorder the SVE and fature specific ID registers for
HWCAP3_SVE_LUT6 which did have the SVE dependency but listed it second
unlike the other SVE specific ID registers.

Fixes: abca5e69ab626 ("arm64/cpufeature: Define hwcaps for 2025 dpISA features")
Reported-by: Will Deacon <will@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/elf_hwcaps.rst | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
index 07ff9ea1d605..f60ca5612daa 100644
--- a/Documentation/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/arch/arm64/elf_hwcaps.rst
@@ -452,10 +452,12 @@ HWCAP3_LS64
     memory location, otherwise fallback to the non-atomic alternatives.
 
 HWCAP3_SVE_B16MM
-    Functionality implied by ID_AA64ZFR0_EL1.B16B16 == 0b0011
+    Functionality implied by ID_AA64PFR0_EL1.SVE == 0b0001 and
+    ID_AA64ZFR0_EL1.B16B16 == 0b0011
 
 HWCAP3_SVE2P3
-    Functionality implied by ID_AA64ZFR0_EL1.SVEver == 0b0100
+    Functionality implied by ID_AA64PFR0_EL1.SVE == 0b0001 and
+    ID_AA64ZFR0_EL1.SVEver == 0b0100
 
 HWCAP3_SME_LUT6
     Functionality implied by ID_AA64SMFR0_EL1.LUT6 == 0b1
@@ -473,8 +475,9 @@ HWCAP3_F16F32MM
     Functionality implied by ID_AA64ISAR0_EL1.FHM == 0b0011
 
 HWCAP3_SVE_LUT6
-    Functionality implied by ID_AA64ISAR2_EL1.LUT == 0b0010 and
-    ID_AA64PFR0_EL1.SVE == 0b0001.
+    Functionality implied by ID_AA64PFR0_EL1.SVE == 0b0001 and
+    ID_AA64ISAR2_EL1.LUT == 0b0010.
+
 
 4. Unused AT_HWCAP bits
 -----------------------

---
base-commit: abca5e69ab6268cbe1913b19da5a98c3383f8bb3
change-id: 20260522-arm64-elf-hwcaps-sve-cleanup-1af7874ad5b7

Best regards,
--  
Mark Brown <broonie@kernel.org>


