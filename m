Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05871EEB579
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 15:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7cu7M1If+mjSSs4ioK+w09azy9ovawcK5+/YpibqgM8=; b=aYPSePfxNsJTTGrfqnXL7bGfKe
	T1E2BPMRx1ahvYTkkkUKn8CcqNIxjfdyjizZbS6nSRQwbrB7DYD1iWJiY+DGTIuRWmMTPqmB8Y+dr
	PSmTiRfitI9pHRo5uv/btwxUyxsON+5m2l2IW0WfyAc2LLSEWR5Uv2BeVOh0uJ50NZ4sI6vxSLixh
	OiHWqqVl9uOuDsQViAipWtMowVd2IZG7ohSir1mWeH1tHo9ji0ViN/qDY1RFthbBrHo32+dqta0Nu
	/0e7u9qzA26ccB9QeES0p/oWzk5fruyqPjSD2RA0ufBK2IfMBUEolMBUPFtvQWLGdg8Oqo4j3OGtF
	c1EXHcfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbKYR-00000007JfR-3vR4;
	Thu, 01 Jan 2026 15:25:35 +0000
Received: from mx3.wp.pl ([212.77.101.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbKYN-00000007Jes-3tfV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 15:25:33 +0000
Received: (wp-smtpd smtp.wp.pl 14939 invoked from network); 1 Jan 2026 16:25:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1767281125; bh=7cu7M1If+mjSSs4ioK+w09azy9ovawcK5+/YpibqgM8=;
          h=From:To:Cc:Subject;
          b=LvLFAdZpWUUMzDA1zgdW/FuMCUj5cWqFvhVhdkXXnRl/Br308jaaXsJYTQ7B5SkFV
           47tdbVTJ6JeVs0M/OadAyrbgRssQAlIqs9oOvQNDPCmVlBQdFhGxFD2inRall3ljLT
           8epU2JFardX/h21XNYysMIB2Rrp/mJueNWtw+ekaiZDtd5hC/sYIMglegFIbYpaMMK
           fGydhGRq04BAQc+GvDR5Oa7p7IHkPITJKXr7vsYevtLkctdzWEWXjMBWoHF0irUu4f
           9zFmf1+WLMbDDye/hs7abx7uG75iwzXyAccHUvmdgdnyUaldW54E+4+riQgnf4iuHS
           Fb5g7gHvWLzPg==
Received: from 83.5.157.18.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.5.157.18])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <herbert@gondor.apana.org.au>; 1 Jan 2026 16:25:25 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH] crypto: testmgr - allow authenc(sha224,rfc3686) variant in fips mode
Date: Thu,  1 Jan 2026 16:25:18 +0100
Message-ID: <20260101152522.1147262-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 52d700e05a9885415d344fe1ce7cddfa
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000007 [YbRR]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_072532_461672_B91D6552 
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

The remaining combinations of AES-CTR-RFC3686 and SHA* have already been
marked as allowed in 8888690ef5f7. This commit does the same for SHA224.

rfc3686(ctr(aes)) is already marked fips compliant,
so these should be fine.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 crypto/testmgr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index a302be53896d..5bae4871690f 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4137,6 +4137,10 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.aead = __VECS(hmac_sha224_des3_ede_cbc_tv_temp)
 		}
+	}, {
+		.alg = "authenc(hmac(sha224),rfc3686(ctr(aes)))",
+		.test = alg_test_null,
+		.fips_allowed = 1,
 	}, {
 		.alg = "authenc(hmac(sha256),cbc(aes))",
 		.generic_driver = "authenc(hmac-sha256-lib,cbc(aes-generic))",
-- 
2.47.3


