Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB980D58D5A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 15:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgpHxSHYeE0VVV4u3LCoM/00cqoc+ttcWa2jSqqak60=; b=vIsgHvMS7GkIyRNlZo0EBNAqUY
	fv5yn/FYQ1cCyq69B2BSVPo/n5l9Qb6/GkaPZt0/ni1OQgzQxjequdPlAIYqP+kcJARNEi6bMa7kp
	lI7ZcNfhLg2dcZL+1KHTYzEMF/zK3AkLY0XHYYJa+apYSX5E1yUO8/iQ7BoQjNlAWXmXEJ6GZY010
	Yyf14C7q0lWZckG2F1BY5UAp7glIZQCGGFZNuZr4eTw1eWhIMmlR/Wti4Dw1fvnu2G3IBw8FU9Css
	3pLwnyzPRJWPVpEmnxSh/oJTRkKtFAKF1TMqPzTKCezbauoL1/6shNL2j/p6g/bhyPHLOjM1pWbcF
	qsMENmdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFab0-00000008NQg-3yww;
	Mon, 25 Nov 2024 15:01:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFaYE-00000008MqC-2WrW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 14:58:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 404C3201B;
	Mon, 25 Nov 2024 06:59:28 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E27E13F66E;
	Mon, 25 Nov 2024 06:58:55 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	sudeep.holla@arm.com,
	guohanjun@huawei.com,
	gshan@redhat.com,
	prarit@redhat.com,
	Jonathan.Cameron@huawei.com,
	dwmw@amazon.co.uk,
	ardb@kernel.org,
	hagarhem@amazon.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nd@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 2/2] efi/fdt: ignore dtb when acpi option is used with force
Date: Mon, 25 Nov 2024 14:58:48 +0000
Message-Id: <20241125145848.506347-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125145848.506347-1-yeoreum.yun@arm.com>
References: <20241125145848.506347-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_065858_680095_1EC59BEF 
X-CRM114-Status: UNSURE (   9.98  )
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

Since acpi=force doesn't use dt fallback, it's meaningless to load dt
from comaand line option or from configuration table.
Skip loading dt when acpi=force option is used.
otherwise it could produce unnecessary error message
while scanning dt if passed dt's format is invalid.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/firmware/efi/libstub/fdt.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/efi/libstub/fdt.c b/drivers/firmware/efi/libstub/fdt.c
index 6a337f1f8787..04a054393d87 100644
--- a/drivers/firmware/efi/libstub/fdt.c
+++ b/drivers/firmware/efi/libstub/fdt.c
@@ -251,11 +251,13 @@ efi_status_t allocate_new_fdt_and_exit_boot(void *handle,
 		if (strstr(cmdline_ptr, "dtb="))
 			efi_err("Ignoring DTB from command line.\n");
 	} else {
-		status = efi_load_dtb(image, &fdt_addr, &fdt_size);
+		if (!strstr(cmdline_ptr, "acpi=force")) {
+			status = efi_load_dtb(image, &fdt_addr, &fdt_size);
 
-		if (status != EFI_SUCCESS && status != EFI_NOT_READY) {
-			efi_err("Failed to load device tree!\n");
-			goto fail;
+			if (status != EFI_SUCCESS && status != EFI_NOT_READY) {
+				efi_err("Failed to load device tree!\n");
+				goto fail;
+			}
 		}
 	}
 
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


