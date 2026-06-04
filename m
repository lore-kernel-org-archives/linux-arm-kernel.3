Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A531FCD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 14:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O37nz4oOKmkhBK1UaGgshyWGmZcNcCvfCeUTL2qHnYQ=; b=IANmbof1m7zZ+WpJZ3hdGayMX0
	bZRVRG+8Wb/QHzKjSjm+UimYdMJ57432ybsIsTKdhb25dr3ylUERti+zPhM1tST3IvkKGD+Eefl/R
	0jgbRDEqs1gA2GQYfWD7ll5cDkJfO5bqB1oYMVbVaen+xaLg0s1oVTunrDO8CynUO8DVkbQldZSYa
	WkNp5mYF1XdpSczHX8SH/r5T+vOHV13gO0f59V5G6U21ySDBwLLW+cyw2xUbBfQofGRyL6SFYs0BQ
	ksaSxJO1fJuZdYeATIJsw7mCCGiZlfySOMXlE2hLO6sga+fnp28zn2IuSVOgkDeC54VzHwoaBRR9D
	XWgLIs9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8ki-0000000Grnx-0P2u;
	Thu, 04 Jun 2026 14:08:56 +0000
Received: from mail-244106.protonmail.ch ([109.224.244.106])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8kf-0000000GrnI-1ZrN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 14:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rasmusvillemoes.dk;
	s=protonmail; t=1780582128; x=1780841328;
	bh=O37nz4oOKmkhBK1UaGgshyWGmZcNcCvfCeUTL2qHnYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ab75ZucqTbBs0+N6I3PldxtRoKDMxKeSH1iUdBPuEa8eBUFbUc2qIWaycLQ+GOrxH
	 kOH+N0UGvNqv7+tuubfSm3mvVUWV+GDvYviQwQ0N9H0DRTq8PRqlvmHd1B+qXy8ZOa
	 +pofAInRGLxbFIsdKtvx29BlJE/P+WdXC5xq8jMVSgXsNsrPXcSDsm7FrrecyLUiKh
	 1PMtMz+de756qaHqLAKxHg/l0LS0k8Lou1CRJiIZareUVi+vTCb4ckLjJYbAl33Nkr
	 Q9JzlnRqIgl+tnEQZMSy1CnjfetvFNkUDLZSGO5g0BgAFtGYBmx3maL9uxwoeX747c
	 Tj3IwT6qzSzPw==
X-Pm-Submission-Id: 4gWRHx58W9z1DDs2
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH] docs: arm64: Document that text_offset is always 0
Date: Thu,  4 Jun 2026 16:08:39 +0200
Message-ID: <20260604140839.1930847-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_070854_046701_848ADD0A 
X-CRM114-Status: GOOD (  16.93  )
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

When trying to figure out where to place and call an arm64 Image in
memory, reading booting.rst should provide the answer. However, it
requires quite some digging to figure out that text_offset is set via
".quad 0" in head.S and is thus actually always 0 since v5.10.

Update the documentation and make that explicit. Reword the 2MB
requirement accordingly, and remove the paragraphs that only apply to
the ancient versions where text_offset could be non-zero, as they only
confuse a current reader.

Fixes: 120dc60d0bdb ("arm64: get rid of TEXT_OFFSET")
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
I've included a Fixes tag since I spent way too much time tracking
down where that text_offset might be defined. The mentioned commit did
get rid of all references to TEXT_OFFSET-the-macro, but not
text_offset-the-concept.

 Documentation/arch/arm64/booting.rst | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 13ef311dace8..f4cc25b1fd56 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -55,9 +55,6 @@ not exceed 2 megabytes in size. Since the dtb will be mapped cacheable
 using blocks of up to 2 megabytes in size, it must not be placed within
 any 2M region which must be mapped with any specific attributes.
 
-NOTE: versions prior to v4.2 also require that the DTB be placed within
-the 512 MB region starting at text_offset bytes below the kernel Image.
-
 3. Decompress the kernel image
 ------------------------------
 
@@ -93,6 +90,8 @@ Header notes:
 
 - As of v3.17, all fields are little endian unless stated otherwise.
 
+- As of v5.10, text_offset is always 0.
+
 - code0/code1 are responsible for branching to stext.
 
 - when booting through EFI, code0/code1 are initially skipped.
@@ -100,12 +99,6 @@ Header notes:
   entry point (efi_stub_entry).  When the stub has done its work, it
   jumps to code0 to resume the normal boot process.
 
-- Prior to v3.17, the endianness of text_offset was not specified.  In
-  these cases image_size is zero and text_offset is 0x80000 in the
-  endianness of the kernel.  Where image_size is non-zero image_size is
-  little-endian and must be respected.  Where image_size is zero,
-  text_offset can be assumed to be 0x80000.
-
 - The flags field (introduced in v3.17) is a little-endian 64-bit field
   composed as follows:
 
@@ -135,12 +128,9 @@ Header notes:
   end of the kernel image. The amount of space required will vary
   depending on selected features, and is effectively unbound.
 
-The Image must be placed text_offset bytes from a 2MB aligned base
-address anywhere in usable system RAM and called there. The region
-between the 2 MB aligned base address and the start of the image has no
-special significance to the kernel, and may be used for other purposes.
-At least image_size bytes from the start of the image must be free for
-use by the kernel.
+The Image must be placed at a 2MB aligned base address anywhere in
+usable system RAM and called there.  At least image_size bytes from
+the start of the image must be free for use by the kernel.
 NOTE: versions prior to v4.6 cannot make use of memory below the
 physical offset of the Image so it is recommended that the Image be
 placed as close as possible to the start of system RAM.
-- 
2.54.0


