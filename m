Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C672D49792
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 01:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4zKKihD/i6qJFYYj+uDjT4cXnxBWrrZolbSrdlui6A=; b=TCUeXFN+alaVckAwqPa/uE1RD9
	WLvtxPXP8eK+Au73q3xP0WUDS4ez0E7hnFe/m9116zxJolA6Hnrr2iuS1+O2iT85560ahlcZwqKWK
	ufLyhVkEStffAC77tQS5wlNmkzNJoCM3ZaEQW6X0PZo0lcbJGFa+o13rv3RlRaxPTDIIz5jKqLYuV
	a0dZMksMwygNJR31ECcgpQpJiKyT4N9zEb7WwU3H7ZezlZxOSUT+xM4GkBI0T5sLcPUyJjL4TPlid
	gIBqw2JDAtSqrOd9B802olwyoCp3o6bBSSxMp2t71KxCEBr77vE/8sUQFvlfjpK0Vmp8E64xiq9hL
	x75VtoZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHvAt-00000004i8D-3406;
	Mon, 02 Dec 2024 01:24:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHuwU-00000004dkQ-0SGU;
	Mon, 02 Dec 2024 01:09:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00D88A40C18;
	Mon,  2 Dec 2024 01:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA70C4CEDB;
	Mon,  2 Dec 2024 01:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733101777;
	bh=sAzD90I338AaM/8blk/uCSyjht7bgmdBUwOqBKuzNIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VKU68uRvYLBaRovzroTHtIutPCgKC6QkWzoPlcXn8VLM2AALjN1tsYCrjDYauffPh
	 vV6r/DOWuGw63oGNuEpGfQeGp7R9lS7LFFszoCHGml3UntRKROIAqiRLuW7StNARAh
	 0Ci9DWmxpBAX6yOIkEhsEz/hYmPWznYUul/CrbWG5pymjMcUeQP7p/YkmMyjb5GzJK
	 39oZsqc7xqfpiGZ3M6uxZoPUSFSrArat5L/oUnvlg0O/o//5/6kQMa9L/3ikiS0It+
	 vQmd5gbRiBDmGq+W6WGs4X/oXNr4Sn9tEdFlgPqNpLYdtbNGTsCzwXVjggoYAnUbKy
	 F6ON4jIkYHO3Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [PATCH v4 14/19] bcachefs: Explicitly select CRYPTO from BCACHEFS_FS
Date: Sun,  1 Dec 2024 17:08:39 -0800
Message-ID: <20241202010844.144356-15-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202010844.144356-1-ebiggers@kernel.org>
References: <20241202010844.144356-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_170938_227072_3E4BB7D4 
X-CRM114-Status: UNSURE (   7.28  )
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

From: Eric Biggers <ebiggers@google.com>

Explicitly select CRYPTO from BCACHEFS_FS, so that this dependency of
CRYPTO_SHA256, CRYPTO_CHACHA20, and CRYPTO_POLY1305 (which are also
selected) is satisfied.  Currently this dependency is satisfied
indirectly via LIBCRC32C, but this is fragile and is planned to change
(https://lore.kernel.org/r/20241021002935.325878-13-ebiggers@kernel.org).

Acked-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/bcachefs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/bcachefs/Kconfig b/fs/bcachefs/Kconfig
index ab6c95b895b3..971ea505e7b0 100644
--- a/fs/bcachefs/Kconfig
+++ b/fs/bcachefs/Kconfig
@@ -13,10 +13,11 @@ config BCACHEFS_FS
 	select LZ4HC_DECOMPRESS
 	select ZLIB_DEFLATE
 	select ZLIB_INFLATE
 	select ZSTD_COMPRESS
 	select ZSTD_DECOMPRESS
+	select CRYPTO
 	select CRYPTO_SHA256
 	select CRYPTO_CHACHA20
 	select CRYPTO_POLY1305
 	select KEYS
 	select RAID6_PQ
-- 
2.47.1


