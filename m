Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4D81061B06
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUeLzAAwS3AKge6vRe1Y968SmW8eZYwvyvt9/B2qHxQ=; b=LYW5qxYHHQ/lIYMGD5eDePftTs
	j0Ua/oK47kN6z9R58eLW5XjEHwBe5CKuWZFFbZr5YLka/fU+MJ1U4UNaSuJaKa3Dz4WbUx86m7AdB
	M7Vr68yvmpXcdnclgUEzjUYqbWlJmf/6uZyNaB1mAHBdmeuC7PepHpYtEnhbO4oesbkzEspQjbiYi
	TP2I/uyktYKlU5n8bjogNNuQaeEB2E24sNZjso3UoxxFcZBdywDw5egMEjbTGsxnQi+X7Xo6q4d5n
	FW4/D9bWV+Vd6i/AXExC5cPMVl9cjhYSMx3I9uIfyZESrP7cbWh1606daLsaxBQM1DGP1H/DmiTeY
	jbJ/19EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DtA-0000000BS5y-49fP;
	Mon, 30 Mar 2026 14:46:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dt5-0000000BS47-2wZt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:46:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FAC544357;
	Mon, 30 Mar 2026 14:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43AA9C4CEF7;
	Mon, 30 Mar 2026 14:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882002;
	bh=5V9bXxWmYXvrmutVJY6nsrGoOdvZArmahKRGSQilrU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=spme1y9S3UqclPAT4pHAj/Gm6PPg0wyYqc3gZigumyeUc/d4esllbb7n5apOSz0W7
	 P2A9/zuvpLw8qdiuoxBBkOWIxwYMBsu5n2JN0ymE6W2bHN8sm4darlB8MZcaYCGqAD
	 f/jpBy/WQoLNNHNUqsZ1Zafq8YiD1EUd11vTkPQh1Cnvi9ILe1jHz84Og4T8Zd+sdp
	 W8Kt1Gi5p43sia9HH64hJSZ+ycs7Til0AcqfotW07GWdGDFbiEr6jDbu5BZYEU2PJT
	 LQHCKnBRz2yIFU4/EjF7S6NcbuWj5IxISApwEmiXM7tpHQn7+eGq0XU8dlwA9/iinB
	 MIFNzSq+vaGgQ==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Demian Shulhan <demyansh@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 1/5] lib/crc: arm64: Drop unnecessary chunking logic from crc64
Date: Mon, 30 Mar 2026 16:46:32 +0200
Message-ID: <20260330144630.33026-8-ardb@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330144630.33026-7-ardb@kernel.org>
References: <20260330144630.33026-7-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010; i=ardb@kernel.org; h=from:subject; bh=5V9bXxWmYXvrmutVJY6nsrGoOdvZArmahKRGSQilrU0=; b=owGbwMvMwCn83sBh/rljoYmMp9WSGDJP9RyXXunSke/JOvfT9e+75tWpXl72fMMKB+XX5+aly gXNEl29sWMqC4MwJ4OsmCLLTuWc7tcuou/0FSpzYOawMoEMYeDiFICJ7M1lrHfW6Gd5Wv+XK//2 jVx/ttKZC0q3JL9/+m7HP5kLy+WvKX+5wZ+844jHGdWc1XraEyOrJjDWZwmubvoim1h3Sv6OTbP AkQkVe2y2fDv8WD769aTzEZckg7N0RKue35nbpp2wMUM1a+d9AA==
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_074643_776237_988E3947 
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

On arm64, kernel mode NEON executes with preemption enabled, so there is
no need to chunk the input by hand.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 lib/crc/arm64/crc64.h | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/lib/crc/arm64/crc64.h b/lib/crc/arm64/crc64.h
index cc65abeee24c..ab052a782c07 100644
--- a/lib/crc/arm64/crc64.h
+++ b/lib/crc/arm64/crc64.h
@@ -16,15 +16,13 @@ static inline u64 crc64_nvme_arch(u64 crc, const u8 *p, size_t len)
 {
 	if (len >= 128 && cpu_have_named_feature(PMULL) &&
 	    likely(may_use_simd())) {
-		do {
-			size_t chunk = min_t(size_t, len & ~15, SZ_4K);
+		size_t chunk = len & ~15;
 
-			scoped_ksimd()
-				crc = crc64_nvme_arm64_c(crc, p, chunk);
+		scoped_ksimd()
+			crc = crc64_nvme_arm64_c(crc, p, chunk);
 
-			p += chunk;
-			len -= chunk;
-		} while (len >= 128);
+		p += chunk;
+		len &= 15;
 	}
 	return crc64_nvme_generic(crc, p, len);
 }
-- 
2.53.0.1018.g2bb0e51243-goog


