Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8FAC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 20:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MfNl25wFSRgK5o7R/bebN5Gzyn+rlHq2D4Fg3kQZuuo=; b=pVOL085XFdAN61Yh2Ygnr1GQJ2
	jusWziV9/QpM6vYlw0usiBI+sVLuOTGGt8iK1Uy0hACOsT39LP0GMfAXryMY7/ox4cd0KZG2vl93T
	2xaSzYr71oc6t0/4comLpG1teWRqaJvzRIyEa5zEdTHi5ryqba2o7d5e9GERsHfIyGT+p/2OV8D9T
	imk3fYYYoeotjCP/hZIyVg8Cvf4p+v7H7gLqxQRzdfMlQPCARTKc7pYzomD4aFpA3fQjnhbNo6N2f
	llk+/9a/YFiWb2Lo1t88FCDUIXeVABTA232e9bqsMrhapiUBPdlwQe4nh4n+vlkRv5i9mgx+duZAV
	wg3thkDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txX6z-00000009XAE-01oO;
	Wed, 26 Mar 2025 20:12:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txX4S-00000009Wig-367h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 20:09:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 227D343F42;
	Wed, 26 Mar 2025 20:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B221C4CEE2;
	Wed, 26 Mar 2025 20:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743019792;
	bh=32KmifOOGoqSmOn9dvxSLSt7llFi98ixPAQF7D8wpcc=;
	h=From:To:Cc:Subject:Date:From;
	b=tYsG9+uSmMlzNU68yDKOcPAH/hj4JOWVzXq05wujHeibPJoBIVKL9S4yYHTODlzDZ
	 IFRTG+PnoqYA4Usbc8NG/aNQxHO+STrtC1ZigYa9nImSe+EuSCEfE6Lv7BDfKg/bj/
	 T42+jYO2l3TzER4JMJPgChcE2/Hok1jo4irdYvYk95WAIYfM71aS9Fk2aOEmC9V924
	 X5wytt6w5QY+/0Ae0U73HRphlb9IfP5UU5UauAiat2suKcckK4SGgodnCaIbhZjDrL
	 BfTaYU3OD6AkHIGKpk4uJ7solP3YUGpggOYVG0TX9L/emUKA5aiC5bJDF22zQLWd1V
	 RDPL6mrJABKrQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	stable@vger.kernel.org,
	David Binderman <dcb314@hotmail.com>
Subject: [PATCH] arm64/crc-t10dif: fix use of out-of-scope array in crc_t10dif_arch()
Date: Wed, 26 Mar 2025 13:09:18 -0700
Message-ID: <20250326200918.125743-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_130952_796586_F5F95F2D 
X-CRM114-Status: UNSURE (   9.25  )
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

Fixes: 2051da858534 ("arm64/crc-t10dif: expose CRC-T10DIF function through lib")
Cc: stable@vger.kernel.org
Reported-by: David Binderman <dcb314@hotmail.com>
Closes: https://lore.kernel.org/r/AS8PR02MB102170568EAE7FFDF93C8D1ED9CA62@AS8PR02MB10217.eurprd02.prod.outlook.com
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/lib/crc-t10dif-glue.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/lib/crc-t10dif-glue.c b/arch/arm64/lib/crc-t10dif-glue.c
index a007d0c5f3fed..bacd18f231688 100644
--- a/arch/arm64/lib/crc-t10dif-glue.c
+++ b/arch/arm64/lib/crc-t10dif-glue.c
@@ -43,13 +43,11 @@ u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
 
 			kernel_neon_begin();
 			crc_t10dif_pmull_p8(crc, data, length, buf);
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


