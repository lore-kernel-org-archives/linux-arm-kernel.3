Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05CCC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 20:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w3dsGJFTiBkO6vUJfSMJiQIbIsPhl/gjvFttRno2+Y8=; b=TxlXhtDmyZcNqnssN3hJmc4Z9L
	fNAQ3cSUwZt+FusN/TpKeL1IkrNGkvqib6Q1DESKRBurBrrEwbqpl/MaMdiCbjW+S+6JVrbMmL+vk
	sZXTe/m+GK3GmDfy7QWVqhSnKi5LEVMCSJbS2kN7tX0pEa+5/SO41xE3wZ+GC0OBF7HhxJRkQcsuF
	eTkkA4Qw6HmaVKm5lXN0Sy8+BjnUOdIrLf/PqPqnX7PT117Ngin/z1VBMQvKlF+T8sJiHjBXqpZI1
	ejx42PpEkMXCj/zq6okc71/FhgDIWpW2pA0k3yR2UY1kLyHY8Jk3xUnqwQ7TH0UDYymIVJ5iGt6Yt
	yA1lCikw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txX5I-00000009Wql-1CO7;
	Wed, 26 Mar 2025 20:10:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txX3Y-00000009Wdv-0yLw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 20:08:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D877A43F42;
	Wed, 26 Mar 2025 20:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB4FFC4CEE2;
	Wed, 26 Mar 2025 20:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743019735;
	bh=JMrDTh2NrkPqeRepEnKBT577obBBPYQ5/itD6gkKEWY=;
	h=From:To:Cc:Subject:Date:From;
	b=dnmk5jtRR/g+K3In1vGVEL3D4xR6trCdgNs4LotylIoGdZR7K5ZNvSdbpUWQmS0Hr
	 rRU56SxbKry0Pg8FBAhpmuL3CugyqasjqfwLJcgDU2elbTUz2qRhO1LsfGxrRnH4uR
	 V5PnL1ybx/Sl+De7RmQ1CBQqwA5n0FTVNSSQSflFc9/XuPtbZPPQK3Rx+WpCqJpv23
	 TH/00pWBZ1L9+4E+OehW31Fe6+dcBJUqFhj/W+oj+E44A5rkKn6adok+Swk6eSoz6t
	 jKIAxN6XmGrxILvn/NpBR0pvUZV4Y5CQ4eBCovVJowm67JDoeHGyueeSVSW9H9xamV
	 Z/k/V6AnC1PBg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	stable@vger.kernel.org,
	David Binderman <dcb314@hotmail.com>
Subject: [PATCH] arm/crc-t10dif: fix use of out-of-scope array in crc_t10dif_arch()
Date: Wed, 26 Mar 2025 13:08:12 -0700
Message-ID: <20250326200812.125574-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_130856_292669_C90D5D75 
X-CRM114-Status: UNSURE (   9.74  )
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

Fix a silly bug where an array was used outside of its scope.

Fixes: 1684e8293605 ("arm/crc-t10dif: expose CRC-T10DIF function through lib")
Cc: stable@vger.kernel.org
Reported-by: David Binderman <dcb314@hotmail.com>
Closes: https://lore.kernel.org/r/AS8PR02MB102170568EAE7FFDF93C8D1ED9CA62@AS8PR02MB10217.eurprd02.prod.outlook.com
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm/lib/crc-t10dif-glue.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/lib/crc-t10dif-glue.c b/arch/arm/lib/crc-t10dif-glue.c
index f3584ba70e57b..6efad3d78284e 100644
--- a/arch/arm/lib/crc-t10dif-glue.c
+++ b/arch/arm/lib/crc-t10dif-glue.c
@@ -42,13 +42,11 @@ u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
 
 			kernel_neon_begin();
 			crc_t10dif_pmull8(crc, data, length, buf);
 			kernel_neon_end();
 
-			crc = 0;
-			data = buf;
-			length = sizeof(buf);
+			return crc_t10dif_generic(0, buf, sizeof(buf));
 		}
 	}
 	return crc_t10dif_generic(crc, data, length);
 }
 EXPORT_SYMBOL(crc_t10dif_arch);

base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
-- 
2.49.0


