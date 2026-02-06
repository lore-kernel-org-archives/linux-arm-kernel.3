Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8300EE6B4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 19:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gftHVR+vy3nM7U0t2O69oN1ej/ezopf8Hrbjo9I60w=; b=0uVO46G53xNDnX7/z/Mz5td82+
	m0cZu7YT/W8Xau7m1lwaPBNJDfx6Zz0vB82Mt2ZC4tiBoVIvwZgSlArN9iJQOnKzgd8ELpCJS9ULt
	3H9EUOxtjvuv8EHxf8jBOUQfdcflFriZ3mbbNiF7F5XhZOsk1Cdq55f09XjxQEcmA/rfK+mmWQ5Hr
	Ssvv3pdtVlzFQJD+JKNM1Y3B84UdfQTOPNpn977A6JkAPLL86lmmpBZ0u8yiO7pAItOds1yaS/8LW
	MoQrckw9I5fuTxdevXWbrcDSOwwdC4+ZqKYPYOwpe3/zG6z+40dnDiiRCbEaLSuObfVHRfpAjqDpi
	KhYYDd/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRUW-0000000BkCv-2ueB;
	Fri, 06 Feb 2026 19:27:44 +0000
Received: from mx4.wp.pl ([212.77.101.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRUU-0000000BkC8-0TRq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 19:27:43 +0000
Received: (wp-smtpd smtp.wp.pl 44129 invoked from network); 6 Feb 2026 20:27:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1770406056; bh=6gftHVR+vy3nM7U0t2O69oN1ej/ezopf8Hrbjo9I60w=;
          h=From:To:Cc:Subject;
          b=dpUiM22RLFPBbQAugmoBY09/ozjCxd36za8mP3jSPbA8DUE/5negt7hmbZvi5I3bK
           b75NKhr/uAsH7gei7BEsEf3MnKvLOAjjw9uODhnspzRomJ6wyQ0+3aAJVugAcHVVp4
           1+YyLcnL3s9VpzN2EqdCY2YDBDmjkqFBWLl223Syrgo91anxfMz8Vm8D/BZu2dAqgD
           3xvuu2TFrHJPHFDdNQK02dZ+p3rlroLV9KtNwS76XR+na0s9hpz9HLrzKhWoH/a1Hu
           QFEQgBXCPqEzW3ferqao6k+40MwE7iQLYOmxgsZL6uFXmtE1P1ootpgn7owbt0LCIj
           6Sf1yj2nDg2QQ==
Received: from 83.5.238.100.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.5.238.100])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <herbert@gondor.apana.org.au>; 6 Feb 2026 20:27:35 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH] crypto: tesmgr - allow authenc(hmac(sha224/sha384),cbc(aes)) in fips mode
Date: Fri,  6 Feb 2026 20:26:59 +0100
Message-ID: <20260206192732.478178-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <linux-kernel@vger.kernel.org>
References: <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 51800c7626cbd9910c5677c24232fcb4
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [MEMU]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_112742_643415_D5D130C4 
X-CRM114-Status: UNSURE (   8.72  )
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

The remaining combinations of AES-CBC and SHA* have already been marked
as allowed. This commit does the same for SHA224 and SHA384.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 crypto/testmgr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index bf286a4f5351..b230d651f9f9 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4134,6 +4134,7 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.alg = "authenc(hmac(sha224),cbc(aes))",
 		.generic_driver = "authenc(hmac-sha224-lib,cbc(aes-generic))",
 		.test = alg_test_aead,
+		.fips_allowed = 1,
 		.suite = {
 			.aead = __VECS(hmac_sha224_aes_cbc_tv_temp)
 		}
@@ -4196,6 +4197,7 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.alg = "authenc(hmac(sha384),cbc(aes))",
 		.generic_driver = "authenc(hmac-sha384-lib,cbc(aes-generic))",
 		.test = alg_test_aead,
+		.fips_allowed = 1,
 		.suite = {
 			.aead = __VECS(hmac_sha384_aes_cbc_tv_temp)
 		}
-- 
2.47.3


