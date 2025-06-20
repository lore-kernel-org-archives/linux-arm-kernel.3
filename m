Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1D0C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 13:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ih0cPhQO9yl9dR3mzLUlHo55Ox0dnBul4xmprtM+Rl4=; b=oLso2K3VcN2k6Pw7ihb4M1xD0L
	TmtHvXXqwDQr3OZn0e2JU/JZqRyu6wMak86MVHoEfMZ6dx4JHrI1liNPG7KNUcpyIeK+Ioov8HjnG
	Zc5rf2EbyJ4CoGXO3L413kvAiWBgWagywc5FeXoIvnyVGNZCtkKM86Bg34Yc2aqqJLSmHyaVS9Cji
	An7IQ7bX7DkjvQ0VW7q1Ace2gWxovkhYnT0R4oysNTHYTIAdqq2QWVHFvCHElQ6VxEM41iFGYsa8h
	sINLOPLwFuSh9oKam7bVcWgc0KlAl0tQHGaExPMIaGTVob8/3XI5SyuEjA8+06vHCL6V/eG66G8Ro
	P/0H0SFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbyS-0000000FkDm-28FP;
	Fri, 20 Jun 2025 13:40:08 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbZI-0000000Fh2f-3Wq8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 13:14:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750425204; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LtFC76nXKkFcv7Pm+hMID0+38hoRWwyfw9Hkc2V7QGmcf927r2g7WVUOBO+W/OXmvjXGgkFBgtYpFdfTSuK6sGRRo+j9MUbdodofRpSFwX/bMtCO3RC/0AWQCC4MG6AAQinSqEaDTYbo+ty6r1K5/zXAXKPL0/40SFmsWBxjN6c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750425204; h=Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=ih0cPhQO9yl9dR3mzLUlHo55Ox0dnBul4xmprtM+Rl4=; 
	b=SUQ4ZyVR+J/0ALRomHqjpSmsozz3fAD3oNOrh7wM/LRSllmSgD/31q4sAyf1nROcuDtQYd0y0mrF6kAe6hRkTyjJu6sDJ/f7X8b5v5g5w4PhQTFwaexh+CHNMi4qm5nDApW5NQbqhZB64sx8b3fKfVQwOAGQRorN03eoLbolw6M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750425204;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=ih0cPhQO9yl9dR3mzLUlHo55Ox0dnBul4xmprtM+Rl4=;
	b=HiLE34CxnUe43B8l8dOl4GSWJyGNGs5wH44+fK9LThUUfOh9NrZw2rY62ovYWVuk
	00WAy/0HMmc6a/Z3WZzfVmVl15ZjfK6mwXYVcLSdqbBd+kj4PQ3X2M89mjsOoiVlS/9
	75OwVo07G1m4ssYC71GY3kTRHAHy998KB7PWuMn4=
Received: by mx.zohomail.com with SMTPS id 1750425202690448.1427826058292;
	Fri, 20 Jun 2025 06:13:22 -0700 (PDT)
From: Li Chen <me@linux.beauty>
To: Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Liu Wei <liuwei09@cestc.cn>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v2 1/2] ACPI: Return -ENODEV from acpi_parse_spcr() when SPCR support is disabled
Date: Fri, 20 Jun 2025 21:13:07 +0800
Message-ID: <20250620131309.126555-2-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620131309.126555-1-me@linux.beauty>
References: <20250620131309.126555-1-me@linux.beauty>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_061408_909703_B791E11B 
X-CRM114-Status: GOOD (  12.31  )
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


