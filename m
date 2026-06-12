Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EFECD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 09:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sOatx03+Y4coDzuWmp5c1p33Lzh+TpfabzIJ4Oj6V+0=; b=E2CDaqJvO8eDb/K7K4gDO5BVsr
	Vg1T178HkE5Ge95ERxicRC2HboO/4Ks73fzzIo/QwS2ZYf97gMWokZG3AEmApxQ0j0p8hAhV+Uurf
	Nqu2ThOIarU3N7yc/S6mHqzZh4Y6ASA4v8HUKAFtBbsu5QS5LRUzRjvFtECh8i3lu8D3HDcoPcl+E
	g/avdoXKSKMy/vTBNRRMqQxczXsS6yWnHX1Z3tjmjf8GMtHu2YNgxF+FwsLh5wDGK20NZWDisbBhb
	pZxhGIYNrguqf7xrrtdFw+ByWHc0VOUJx6iDlDnkcvaVm+dM78fg5SDXkqyandVkwLDp+y+N0qZv8
	MrJHrocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXydv-0000000Ai3O-30oT;
	Fri, 12 Jun 2026 09:57:39 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyds-0000000Ai2U-3Ww4;
	Fri, 12 Jun 2026 09:57:38 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gcFLQ2ZZLz9thq;
	Fri, 12 Jun 2026 11:57:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781258254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sOatx03+Y4coDzuWmp5c1p33Lzh+TpfabzIJ4Oj6V+0=;
	b=s1F3qdd9U4XVjxCBW/i/uPH2pKeTgpyBPgHQYB2f26mQHBVVCg+hktbRcSBV/TfnnGbTnb
	GDCR4sQJbzqCQNRwJmNv8o5TtVfpuECQgmnzlI1pL9whhUAdhMlqu4eJZFtdE3ThZtKJv4
	Y4n3Y9EEX2NkUWey/RJ5gcK1NYu+zUuT/75ITxyH9F5/klMnzJHP9OFCoMg5dXLI6r7EoT
	IC5fQ+Q1wTMrLTRT6FFKYYfimnDJYKDDA03fdSYCHV6GasS/wVK/4hGsk7YXmoIAREL9Ly
	iAKlz+uuA+pvBn2AX6Bn5S27MBtMaOC96LJ+NAvHEG7uWOW4CTIOH2UagGc2Dg==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781258252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sOatx03+Y4coDzuWmp5c1p33Lzh+TpfabzIJ4Oj6V+0=;
	b=P+pZIcb6gjPwDszM++dcZebKJPjN/pOLCFp+5Dy9ZIKa9yWLL0cGC3Qfpenshai3kIv7+s
	Ov29mbsGZnR92TRpwky6/pdCttsHgIJ8K1sjF+c5gy8BQQEChjLB0OxmQ3C8JoKtJf/nTs
	uMWybarE5KyyY8OrfZevyU94beCu7gQWJ5xTQmJzK88VqcdQNQYo+6Nw+1ovUJ8n1dJk9N
	RRrDVC3OAY8PxCl9lp1q9UHy6TDvNDuWvQBFCRtGRLr0/s9pzPyBRumyRtwtxAAgZlI4yy
	YPeRjLIiSXfw6sKOr/hq0vPWLkD5lg2zpZJmk2oTWBFoOzE7HG3qvFcbonehOQ==
To: Vineet Gupta <vgupta@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linux-snps-arc@lists.infradead.org (open list:SYNOPSYS ARC ARCHITECTURE),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT))
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] v2 Documentation: arch: fix brackets
Date: Fri, 12 Jun 2026 11:54:22 +0200
Message-ID: <20260612095432.177759-2-manuelebner@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 060f6ef0ba5af3aaaf0
X-MBO-RS-META: aotyjym6h6hrfmqj4cgbcszockbfspnn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_025737_061301_4DC02420 
X-CRM114-Status: GOOD (  14.54  )
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

Add missing and remove needless parentheses, brackets and curly braces.
Fix typos.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
[v1] -> [v2]
"(i.e cache geometries)" -> "(e.g., cache geometries)"
"Excer[t" -> "Excerpt"
add Reviewed-by: Randy Dunlap
fixed my own typos.
---
 Documentation/arch/arc/arc.rst                 |  2 +-
 .../arm/samsung/clksrc-change-registers.awk    |  2 +-
 Documentation/arch/arm/vlocks.rst              |  4 ++--
 .../arch/arm64/memory-tagging-extension.rst    |  2 +-
 Documentation/arch/powerpc/vas-api.rst         |  2 +-
 Documentation/arch/sparc/oradax/dax-hv-api.txt | 18 +++++++++---------
 Documentation/arch/sparc/oradax/oracle-dax.rst |  2 +-
 Documentation/arch/x86/x86_64/fsgs.rst         |  4 ++--
 8 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/Documentation/arch/arc/arc.rst b/Documentation/arch/arc/arc.rst
index 6c4d978f3f4e..5923dee37a98 100644
--- a/Documentation/arch/arc/arc.rst
+++ b/Documentation/arch/arc/arc.rst
@@ -36,7 +36,7 @@ Important note on ARC processors configurability
 
 ARC processors are highly configurable and several configurable options
 are supported in Linux. Some options are transparent to software
-(i.e cache geometries, some can be detected at runtime and configured
+(e.g., cache geometries), some can be detected at runtime and configured
 and used accordingly, while some need to be explicitly selected or configured
 in the kernel's configuration utility (AKA "make menuconfig").
 
diff --git a/Documentation/arch/arm/samsung/clksrc-change-registers.awk b/Documentation/arch/arm/samsung/clksrc-change-registers.awk
index 7be1b8aa7cd9..48464397088c 100755
--- a/Documentation/arch/arm/samsung/clksrc-change-registers.awk
+++ b/Documentation/arch/arm/samsung/clksrc-change-registers.awk
@@ -163,4 +163,4 @@ BEGIN {
     }
 }
 
-// && ! /clksrc_clk.*=.*{/ { print $0 }
+// && ! /clksrc_clk.*=.*{/ { print $0 }}
diff --git a/Documentation/arch/arm/vlocks.rst b/Documentation/arch/arm/vlocks.rst
index 737aa8661a21..b0ac33263086 100644
--- a/Documentation/arch/arm/vlocks.rst
+++ b/Documentation/arch/arm/vlocks.rst
@@ -102,10 +102,10 @@ Features and limitations
 	if (I_won) {
 		/* we won the town election, let's go for the state */
 		my_state = states[(this_cpu >> 8) & 0xf];
-		I_won = vlock_lock(my_state, this_cpu & 0xf));
+		I_won = vlock_lock(my_state, this_cpu & 0xf);
 		if (I_won) {
 			/* and so on */
-			I_won = vlock_lock(the_whole_country, this_cpu & 0xf];
+			I_won = vlock_lock(the_whole_country, this_cpu & 0xf);
 			if (I_won) {
 				/* ... */
 			}
diff --git a/Documentation/arch/arm64/memory-tagging-extension.rst b/Documentation/arch/arm64/memory-tagging-extension.rst
index 679725030731..e6fe428f0e2a 100644
--- a/Documentation/arch/arm64/memory-tagging-extension.rst
+++ b/Documentation/arch/arm64/memory-tagging-extension.rst
@@ -222,7 +222,7 @@ programs should not retry in case of a non-zero system call return.
 address ABI control and MTE configuration of a process as per the
 ``prctl()`` options described in
 Documentation/arch/arm64/tagged-address-abi.rst and above. The corresponding
-``regset`` is 1 element of 8 bytes (``sizeof(long))``).
+``regset`` is 1 element of 8 bytes (``sizeof(long)``).
 
 Core dump support
 -----------------
diff --git a/Documentation/arch/powerpc/vas-api.rst b/Documentation/arch/powerpc/vas-api.rst
index a9625a2fa0c6..1d0d055356e3 100644
--- a/Documentation/arch/powerpc/vas-api.rst
+++ b/Documentation/arch/powerpc/vas-api.rst
@@ -293,7 +293,7 @@ Simple example
 				//Format CRB request with compression or
 				//uncompression
 				// Refer tests for vas_copy/vas_paste
-				vas_copy((&crb, 0, 1);
+				vas_copy(&crb, 0, 1);
 				vas_paste(addr, 0, 1);
 				// Poll on csb.flags with timeout
 				// csb address is listed in CRB
diff --git a/Documentation/arch/sparc/oradax/dax-hv-api.txt b/Documentation/arch/sparc/oradax/dax-hv-api.txt
index ef1a4c2bf08b..49be62a9ce86 100644
--- a/Documentation/arch/sparc/oradax/dax-hv-api.txt
+++ b/Documentation/arch/sparc/oradax/dax-hv-api.txt
@@ -457,7 +457,7 @@ bits set, and terminate at a CCB that has the Conditional bit set, but not the P
 Offset   Size   Field Description
                 Bits         Field Description
                 [15:14]      Secondary Input Element Size (see Section 36.2.1.1.4,
-                             “Secondary Input Element Size”
+                             “Secondary Input Element Size”)
                 [13:10]      Output Format (see Section 36.2.1.1.6, “Output Format”)
                 [9]          Padding Direction selector: A value of 1 causes padding bytes
                              to be added to the left side of output elements. A value of 0
@@ -656,7 +656,7 @@ Offset         Size            Field Description
                                [18:16]      Secondary Input Starting Offset (see Section 36.2.1.1.5, “Input
                                             Element Offsets”)
                                [15:14]      Secondary Input Element Size (see Section 36.2.1.1.4,
-                                            “Secondary Input Element Size”
+                                            “Secondary Input Element Size”)
                                [13:10]      Output Format (see Section 36.2.1.1.6, “Output Format”)
                                [9:5]        Operand size for first scan criteria value. In a scan value
                                             operation, this is one of two potential exact match values.
@@ -793,13 +793,13 @@ Offset   Size   Field Description
                 [18:16]      Secondary Input Starting Offset (see Section 36.2.1.1.5, “Input
                              Element Offsets”)
                 [15:14]      Secondary Input Element Size (see Section 36.2.1.1.4,
-                             “Secondary Input Element Size”
+                             “Secondary Input Element Size”)
                 [13:10]      Output Format (see Section 36.2.1.1.6, “Output Format”)
                 [9]          Reserved
                 [8:0]        Test value used for comparison against the most significant bits
                              in the input values, when using 2 or 3 byte input elements.
-8        8      Completion (same fields as Section 36.2.1.2, “Extract command”
-16       8      Primary Input (same fields as Section 36.2.1.2, “Extract command”
+8        8      Completion (same fields as Section 36.2.1.2, “Extract command”)
+16       8      Primary Input (same fields as Section 36.2.1.2, “Extract command”)
 24       8      Data Access Control (same fields as Section 36.2.1.2, “Extract command”,
                 except Primary Input Length Format may not use the 0x0 value)
 32       8      Secondary Input, if used by Primary Input Format. Same fields as Primary
@@ -880,7 +880,7 @@ Offset   Size   Field Description
                                        [18:16]     Secondary Input Starting Offset (see Section 36.2.1.1.5, “Input
                                                    Element Offsets”)
                                        [15:14]     Secondary Input Element Size (see Section 36.2.1.1.4,
-                                                   “Secondary Input Element Size”
+                                                   “Secondary Input Element Size”)
 
 
                                                       524
@@ -895,8 +895,8 @@ Offset   Size   Field Description
                                                     causes padding bytes to be added to the right side of output
                                                     elements.
                                        [8:0]        Reserved
-        8              8               Completion (same fields as Section 36.2.1.2, “Extract command”
-        16             8               Primary Input (same fields as Section 36.2.1.2, “Extract command”
+        8              8               Completion (same fields as Section 36.2.1.2, “Extract command”)
+        16             8               Primary Input (same fields as Section 36.2.1.2, “Extract command”)
         24             8               Data Access Control (same fields as Section 36.2.1.2, “Extract command”)
         32             8               Secondary Bit Vector Input. Same fields as Primary Input.
         40             8               Reserved
@@ -949,7 +949,7 @@ Offset   Size   Field Description
                                    [31]        If set, this CCB functions as a Sync command. If clear, this
                                                CCB functions as a No-op command.
                                    [30:0]      Reserved
-       8             8             Completion (same fields as Section 36.2.1.2, “Extract command”
+       8             8             Completion (same fields as Section 36.2.1.2, “Extract command”)
        16            46            Reserved
 
 36.2.2. CCB Completion Area
diff --git a/Documentation/arch/sparc/oradax/oracle-dax.rst b/Documentation/arch/sparc/oradax/oracle-dax.rst
index d1e14d572918..a5d53f240dc8 100644
--- a/Documentation/arch/sparc/oradax/oracle-dax.rst
+++ b/Documentation/arch/sparc/oradax/oracle-dax.rst
@@ -438,7 +438,7 @@ that in user land::
 The output bitmap is ready for consumption immediately after the
 completion status indicates success.
 
-Excer[t from UltraSPARC Virtual Machine Specification
+Excerpt from UltraSPARC Virtual Machine Specification
 =====================================================
 
  .. include:: dax-hv-api.txt
diff --git a/Documentation/arch/x86/x86_64/fsgs.rst b/Documentation/arch/x86/x86_64/fsgs.rst
index 6bda4d16d3f7..f8d483a7fb06 100644
--- a/Documentation/arch/x86/x86_64/fsgs.rst
+++ b/Documentation/arch/x86/x86_64/fsgs.rst
@@ -182,8 +182,8 @@ address spaces via an attribute based mechanism in Clang 2.6 and newer
 versions:
 
  ==================================== =====================================
-  __attribute__((address_space(256))  Variable is addressed relative to GS
-  __attribute__((address_space(257))  Variable is addressed relative to FS
+  __attribute__(address_space(256))   Variable is addressed relative to GS
+  __attribute__(address_space(257))   Variable is addressed relative to FS
  ==================================== =====================================
 
 FS/GS based addressing with inline assembly
-- 
2.54.0


