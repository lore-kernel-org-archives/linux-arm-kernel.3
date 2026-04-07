Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC99FF5135
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 19:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s7BvHIXUu/KyBlp0Bh64m9iU1jIIBC4g+vpzAyrmhA8=; b=DtoaiaV6WrUVmcWabp3BWy5OCR
	XGxe10x0oC3WRUMu6xtaxUiAQiLCBFBIxBMAkGUn4/Nk3aE0TY3jTKq3ufE/Oo64fYPPKQUGCfWr0
	WKU1oFQnIH+wWxeI7vbbaGPNJYDFUKRo6sazqAOvOvMDorlq894aOwr8ZfrJbBAGurnHNH1Waekd6
	A9sDsJnDQXlRpswKcO/b0oyfVqy5RX1L+qxSVFkfkXxl33y6tCixVhxtgeZowJD2G/vD6xrh3/fO5
	35nBuBOKD0uC41RlK8ljCZ6EaYFYwOnvH0+mDbDz0jbCgVhDD95DrxrRGsLnPLi7USa6SIU23rwSy
	JK3uKhQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAC7N-00000007Dhh-22S5;
	Tue, 07 Apr 2026 19:29:45 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAC7L-00000007Dg1-1cJO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 19:29:44 +0000
Received: by linux.microsoft.com (Postfix, from userid 1216)
	id 0337820B7135; Tue,  7 Apr 2026 12:29:41 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0337820B7135
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1775590181;
	bh=s7BvHIXUu/KyBlp0Bh64m9iU1jIIBC4g+vpzAyrmhA8=;
	h=From:To:Cc:Subject:Date:From;
	b=AExyMAdr/2moVZ3cwtjXrEfUHWE8ytLxMd0Bi3A3BWIfMTPoNYqZgo6ige9DgkoAu
	 eAbIdTsod9SyuHLV177tEg9OwAnZdUZa/hgWdX1n7vGFk0b8lohV77HAHWxXFUD+FP
	 k0W3kNaUohEn0/X3HcoAoTUNCvkqDkRbHH39wz84=
From: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
To: linux-crypto@vger.kernel.org
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>,
	Jeff Barnes <jeffbarnes@linux.microsoft.com>,
	Paul Monson <paul.monson@capgemini.com>
Subject: [PATCH] crypto: tstmgr - guard xxhash tests
Date: Tue,  7 Apr 2026 12:28:59 -0700
Message-ID: <20260407192859.270745-1-hamzamahfooz@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_122943_475967_5EE9A32C 
X-CRM114-Status: UNSURE (   9.19  )
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

If the kernel isn't built with CONFIG_CRYPTO_XXHASH and booted with FIPS
mode enabled it will currently panic. So, only benchmark xxhash64 if
CRYPTO_XXHASH is enabled.

Cc: Jeff Barnes <jeffbarnes@linux.microsoft.com>
Cc: Paul Monson <paul.monson@capgemini.com>
Signed-off-by: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
---
 crypto/testmgr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 4985411dedaec..9e4a040029ab8 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -5609,7 +5609,9 @@ static const struct alg_test_desc alg_test_descs[] = {
 #endif
 		.alg = "xxhash64",
 		.test = alg_test_hash,
+#if IS_ENABLED(CONFIG_CRYPTO_XXHASH)
 		.fips_allowed = 1,
+#endif
 		.suite = {
 			.hash = __VECS(xxhash64_tv_template)
 		}
-- 
2.53.0


