Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2D3CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 04:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+jwWkOtWpqGA2mCooLBKv/cdqdGX0MJyoUmLTtd4n8=; b=PeEz6E9AB7jFwM1wzENSuMbU8Q
	3FzCVVnrYRbuLIfLfXSb8ZL+8vbpXDiuIVz/WKv6ydM2WUipUWfSAB5n3vAYRiAmoM1X/XsfNH27o
	nRfGem0OFa6mvxGIRN5kH/QDABbsZ3OEKA3UHBwaBKn7WsKeUQl9jfdPOYdtH95ic+fUrbm3DdUQU
	tVNRZf38X1260v+V337arxAqq9GNjY3dwhq9DmxLc3+c/8NrZNJprWD7NqKX52fm36zWx3Uo6zQqF
	qoWRtTFtEV438ixE9MltAx/mKpPRv2cPRqzgGMGHyj8ydAJStjv29hNN/fL9el0fO2bHLjbdYnRW3
	sfMCyvBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9yg7-00000009VK4-3N1r;
	Sat, 18 Oct 2025 04:36:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9yg3-00000009VFb-2OBz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 04:36:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BC9B4B4DA;
	Sat, 18 Oct 2025 04:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA0DC4CEF8;
	Sat, 18 Oct 2025 04:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760762183;
	bh=X9hF360ZBLNWRhousM988AHVWLEkL48cUoMgTVwucLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sb23HCS4QCh3TeBOORyo0XcWYXTjnpuh28lZ/FeQFQITTDlXUlSk3qJdx61evPp6N
	 iG0UoPIZoyrf6IcXQf5ZLc2g1liQa4HtYl/o4vtnpjH3ciIkKJeKb0c5nXNTWVPg08
	 U8pH/PHRsrrdid//8CGsNDtqZyZFve8sfaaT1QlMRjQEy0/fMESWF01VP7LsR3ZfWY
	 WwK4tuNwxuRAg64PmYu83eTcjBYWz7k4Em6sQ/Sm3QyldQIf1lR6WcaTMR4CnJoLKF
	 rnGzh2r3TYJYaLyd+NycLYIXaTb8i03BYbXXx5jt291/GrtxgTmASjU/dsMPk9bw+x
	 mxv2Xm083jhvA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 05/10] byteorder: Add le64_to_cpu_array() and cpu_to_le64_array()
Date: Fri, 17 Oct 2025 21:31:01 -0700
Message-ID: <20251018043106.375964-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251018043106.375964-1-ebiggers@kernel.org>
References: <20251018043106.375964-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_213623_710326_0E251908 
X-CRM114-Status: UNSURE (   9.60  )
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

Add le64_to_cpu_array() and cpu_to_le64_array().  These mirror the
corresponding 32-bit functions.

These will be used by the BLAKE2b code.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/linux/byteorder/generic.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/byteorder/generic.h b/include/linux/byteorder/generic.h
index b3705e8bbe2b8..55a44199de872 100644
--- a/include/linux/byteorder/generic.h
+++ b/include/linux/byteorder/generic.h
@@ -171,10 +171,26 @@ static inline void cpu_to_le32_array(u32 *buf, unsigned int words)
 		__cpu_to_le32s(buf);
 		buf++;
 	}
 }
 
+static inline void le64_to_cpu_array(u64 *buf, unsigned int words)
+{
+	while (words--) {
+		__le64_to_cpus(buf);
+		buf++;
+	}
+}
+
+static inline void cpu_to_le64_array(u64 *buf, unsigned int words)
+{
+	while (words--) {
+		__cpu_to_le64s(buf);
+		buf++;
+	}
+}
+
 static inline void memcpy_from_le32(u32 *dst, const __le32 *src, size_t words)
 {
 	size_t i;
 
 	for (i = 0; i < words; i++)
-- 
2.51.1.dirty


