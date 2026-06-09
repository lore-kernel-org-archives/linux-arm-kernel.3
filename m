Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07739CD98C8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 18:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6U5y8R6Wx1WxLc5abqrL4wjg/PnqLuzex2uy4KtmCI=; b=b+dTX8nXNqVBlVdvwbrqP+ab+n
	TMIGn17MHVoSNy1plqcHMc+cfLoG1q05UvoqvmIZFyp/7rEEHKq6XNVKLgowA37YjbGJ8GlrPH5tZ
	/7qwJczj7zaQhCTFu2DFpAcQgAkABzUXgFlkHs1K+2e95qd4n1A7pH/CgZ3vRJFoIQdZJwPY6TBFH
	+zwMB5CmYh6Z3SnkVQX1lBWk+e/NFjzoF+hBAxd+b4cEle+bnz29v7TbLPpxULVBlo7K/I9U3F9Sz
	SGVwEOJU1OMvTl1Yj2edd7rwnO94DSnGt/aJPmII4zR3/BAwUa59VQ50ujv5u2TtwtNTcY+cJkfHE
	jzNw8BTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0uf-00000006Ai5-2CXD;
	Tue, 09 Jun 2026 18:10:57 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0ub-00000006Afr-2oQu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:10:54 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id C725120B716E;
	Tue,  9 Jun 2026 11:10:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C725120B716E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1781028633;
	bh=A6U5y8R6Wx1WxLc5abqrL4wjg/PnqLuzex2uy4KtmCI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kY1SAuYMcQFt3y6h/ohfDsmhFTn3ZYVzESqBhMomG4GWFFbINpyWic4uaVXjVRCq9
	 /O4uD9tyawCs6CHlEt11mZLZbidpvUMHcY5Z1bf+51ReUsiQljAYnbHDyQO+CmZr0j
	 1Cs4ptudVI1gg1OLXM/GtBWBLlOiAcFKQyZQYWrQ=
From: Kameron Carr <kameroncarr@linux.microsoft.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	arnd@arndb.de,
	thuth@redhat.com,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	mhklinux@outlook.com
Subject: [RFC PATCH 6/6] arm64: hyperv: Implement hv_is_isolation_supported() for CCA Realms
Date: Tue,  9 Jun 2026 11:10:30 -0700
Message-ID: <20260609181030.2378391-7-kameroncarr@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260609181030.2378391-1-kameroncarr@linux.microsoft.com>
References: <20260609181030.2378391-1-kameroncarr@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_111053_819194_CBB80868 
X-CRM114-Status: UNSURE (   7.52  )
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

Provide an arm64 implementation of hv_is_isolation_supported() that
overrides the __weak default in drivers/hv/hv_common.c.

The implementation deliberately does not depend on
hv_is_hyperv_initialized() because hv_common_init() consults
hv_is_isolation_supported() before hyperv_initialized is set.

Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
---
 arch/arm64/hyperv/mshyperv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index b595b2b9bdbbb..b9b1c2f8e3ec7 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -213,3 +213,8 @@ bool hv_isolation_type_cca(void)
 {
 	return is_realm_world();
 }
+
+bool hv_is_isolation_supported(void)
+{
+	return is_realm_world();
+}
-- 
2.45.4


