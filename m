Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143E4C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 07:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ih0cPhQO9yl9dR3mzLUlHo55Ox0dnBul4xmprtM+Rl4=; b=ZydvSDr9tO+4XINRZa9ZZZxMe4
	zVYsnCTewKFbLZ3UoDoE9gmekVuJjwX6sJzHhfppHfoj0vgVWzci6m+YI84y4hETRSUzdUflhAgSb
	wYFcF28kPcNtDwxxc9pfonbpwmUG84h06U7D82q4SWLAzM/6J7Nriq0if5AQNfaJukGoNSUUfk2ry
	ClOQEk/9l8H9zqPKSfco47yLgQzaGG32j6d4gbHLkvEz1CEAZqR29ckL4K9kbyQHPb+3BcHOS0/cL
	GSEDfvuFSegkDlxXH4GF1bnftwYC5Rf1dFbVmGgKmkwm3VNswSwSRnXQMWQ02U9yV7cMLOqroFKtS
	pfyW2xRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNRZW-0000000HJRM-1YOw;
	Fri, 06 Jun 2025 07:33:02 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNRVk-0000000HJ8P-2bt7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 07:29:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749194901; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jT+1H/LxEAY3EbsWnqWj8dczRAs1f6ZSKFQIg/lwPFbyEkHO+Tun2f1+rh6qFF+e1TzzbN++r6JSY2izPRyTnlbKh2kp1eUsT6TgNH0/KNd25HBnxB4WBR7MNlGTbeyoRjqXlX8cUF3JORya7eIsUOPtAi2rWVY4uwiJC1XWo+I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749194901; h=Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=ih0cPhQO9yl9dR3mzLUlHo55Ox0dnBul4xmprtM+Rl4=; 
	b=OLlGPuzdj5ulnL4RZklEU2WRqnPAVm+P/Pb9P1TXYIwaSD5M9EeShYHfjEy5wH7Ubr/cIX6+/oYnfcCO+wvzDg2CgNmQB+ghkvQcaN4v1ZJDrCHe4S3Ij4XDKrKjocH6D5Lp9YS9d76VjjAU8OKNDBZ3Wc7hfxBzgUkL9BzLajE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749194901;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=ih0cPhQO9yl9dR3mzLUlHo55Ox0dnBul4xmprtM+Rl4=;
	b=YUTj02IAxGNPvp3Z1gRnhCzZoY4/mxo8Q7Ca7H1mnM6/mAg27xTxxgKRmkG0PRuE
	hfqW64lknvNHvEYq2PfSijGwikxu3KwZHV3NliLZSaD3I9CFdjmAYJJ6YwtcSfhqeQ3
	CyNg4RV/AkAD6lBKf3wtjuNNwTB+6ERwzjtdKzg0=
Received: by mx.zohomail.com with SMTPS id 174919490049757.462558800920874;
	Fri, 6 Jun 2025 00:28:20 -0700 (PDT)
From: Li Chen <me@linux.beauty>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Liu Wei <liuwei09@cestc.cn>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Li Chen <chenl311@chinatelecom.cn>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH 1/2] ACPI: Return -ENODEV from acpi_parse_spcr() when SPCR support is disabled
Date: Fri,  6 Jun 2025 15:27:44 +0800
Message-ID: <20250606072802.191580-2-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606072802.191580-1-me@linux.beauty>
References: <20250606072802.191580-1-me@linux.beauty>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_002908_719364_2B3F272B 
X-CRM114-Status: GOOD (  12.62  )
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

From: Li Chen <chenl311@chinatelecom.cn>

If CONFIG_ACPI_SPCR_TABLE is disabled, acpi_parse_spcr()
currently returns 0, which may incorrectly suggest that
SPCR parsing was successful. This patch changes the behavior
to return -ENODEV to clearly indicate that SPCR support
is not available.

This prepares the codebase for future changes that depend
on acpi_parse_spcr() failure detection, such as suppressing
misleading console messages.

Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
---
 include/linux/acpi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index f102c0fe34318..71e692f952905 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1503,7 +1503,7 @@ int acpi_parse_spcr(bool enable_earlycon, bool enable_console);
 #else
 static inline int acpi_parse_spcr(bool enable_earlycon, bool enable_console)
 {
-	return 0;
+	return -ENODEV;
 }
 #endif
 
-- 
2.49.0


