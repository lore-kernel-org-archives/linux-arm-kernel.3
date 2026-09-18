Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D10C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3OEyPLUju59/39dkHiKB7wvauJx00RLbv2DdCx5WdsU=; b=Kcc2LMjsSX5iodjaU7z9dkT3YN
	ecGfK4nylFAI0Amr+p7PjVGVsWLCPc5ltdIVoFoSwoTq9APmSdkBNnaYv7LZ75Tmng48sa1CwsGYS
	eHRGZL5KKqjFRQfZubJSp8yez4jJdnsNq9oYsbQsIdruQ3/ycm7pdtCrs1+KaYkWbyCiTlPAJIegG
	9RJ6xZzQLSbgTWeOgs159/KeyzqWN0P+hDrMERz5hcGQQM/lY+yRXVIhpX/KajXFluBEn4gp+YXRj
	9h1cj4res2Dwz+/uFvpq1tbr7qdFvrZEO/ORswVfIJPp+LY0u/R2ys+Hn2laMTZQRNy4BEJKptMMB
	bd29AjKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Zxa-0000000Emih-0AVz;
	Fri, 18 Sep 2026 14:53:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZxT-0000000EmdE-3MGX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:52:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BE1E43DD5;
	Fri, 18 Sep 2026 14:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50121F00899;
	Fri, 18 Sep 2026 14:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743179;
	bh=3OEyPLUju59/39dkHiKB7wvauJx00RLbv2DdCx5WdsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=imnPClmVGdWUmAHuP36XywZkaX0YE7MeYpDqPv9GvSIIU9YAgIeuz1hp/uE3BnUtx
	 wlhcZonpXMDSF4P5j/9RwZ34w8zo3Mgw/P9Gfe1GsK+cxsLigNzcR+msofZGoiOBi4
	 793iHZvHcBeV982XukUfqKsAh+Pee+or0XO0uUSQuVG4v6CAYYEp/JtD3vW8D3pQYP
	 XpNiUmzhC/JPefbD9WjBvDfpzYdPIFBwXtMlQJ3IvhSGmVLElZhm8QJd0+LV8O8At7
	 ZIF8Ay4KLBmfPjS+YPTlRrFrIzHJLD/SyTHYir+Ln4WKyAe2UpQ70Zzn4hA0tzwzhS
	 gcud6zHV0L48g==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>,
	Chenghai Huang <huangchenghai2@huawei.com>,
	Weili Qian <qianweili@huawei.com>,
	Zaibo Xu <xuzaibo@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>,
	Kai Ye <yekai13@huawei.com>,
	Wei Zhang <zhangwei375@huawei.com>
Subject: [PATCH v3 11/13] crypto: hisilicon/sec2: Remove check of CONFIG_CPU_LITTLE_ENDIAN
Date: Fri, 18 Sep 2026 15:52:13 +0100
Message-ID: <20260918145217.1669-12-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918145217.1669-1-will@kernel.org>
References: <20260918145217.1669-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The hisilicon "sec" driver targets arm64 but can be compile-tested on
other 64-bit architectures. In preparation for removing the definition
of CONFIG_CPU_LITTLE_ENDIAN for arm64 (since it will be little-endian
only), invert the check in sec_set_endian() so that it behaves as
little-endian by default.

Cc: Chenghai Huang <huangchenghai2@huawei.com>
Cc: Weili Qian <qianweili@huawei.com>
Cc: Zaibo Xu <xuzaibo@huawei.com>
Cc: Longfang Liu <liulongfang@huawei.com>
Cc: Kai Ye <yekai13@huawei.com>
Cc: Wei Zhang <zhangwei375@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/crypto/hisilicon/sec2/sec_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/hisilicon/sec2/sec_main.c b/drivers/crypto/hisilicon/sec2/sec_main.c
index 752565200c16..03523cfbb28e 100644
--- a/drivers/crypto/hisilicon/sec2/sec_main.c
+++ b/drivers/crypto/hisilicon/sec2/sec_main.c
@@ -484,7 +484,7 @@ static void sec_set_endian(struct hisi_qm *qm)
 	if (!IS_ENABLED(CONFIG_64BIT))
 		reg |= BIT(1);
 
-	if (!IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN))
+	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
 		reg |= BIT(0);
 
 	writel_relaxed(reg, qm->io_base + SEC_CONTROL_REG);
-- 
2.55.0.1082.g2b9226bbc0-goog


