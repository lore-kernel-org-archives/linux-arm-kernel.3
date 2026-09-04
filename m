Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97479C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 17:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QsLUI6iuIsDgESFlcz3ntuSKxj+BnKcu80wPoUNQMsA=; b=EbST4J5cDRplZFJ0VWQcUvtDVB
	ynHbsQE0WW/z+qhrtbBD/iQQb22MpWOFJ9OIkghYTz1oB6mogOBJETh2CF8sxW8xjdVOtOqZQHNl8
	vx6XupiRTw3CPT+bTuK3Mq2geRZJnMYrkRW5alEh0XnFZbhRvyi2toNxbyDOlxsPg4ATSNTbHPcF6
	CGNjYNuHECXuwgjSuECYyIunWOfxn86VcI8FnVTnM8WVCsKLul2CdLJFxl7KuGulHXGNUV4OCZbYe
	CRakpHaneevbF32kzSIbndlHEUTKFtoooEsSNF9YiRjYmjbVITeYfopVySdcZL91yCGz4Hv4duKN3
	i74HFntQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XWT-00000002qIV-4A89;
	Fri, 04 Sep 2026 17:16:17 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XWR-00000002qHa-395S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 17:16:17 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c255e9a2282so101008766b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 10:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788542173; x=1789146973; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QsLUI6iuIsDgESFlcz3ntuSKxj+BnKcu80wPoUNQMsA=;
        b=kmlk4Jqq1fnEyzZcCvBcvs9W42X1k+xeJ8Yirc03kqcvS6Wdb1Kx3jzKRvto2AT4DQ
         dBLI2naqQCDfJCv546dasAT6dE8egJ+r6NRanPU1KGXiTOAriRzR/c9Kt5QDekF3srCF
         RZuEItRNGV6qBB/NcR/F6Q/khZqyq6adYH6dM4mldGNv4exE0s8rMcBpzgjbGcVHODJa
         cHh/543HK7ZVuY19qsSMAMHKZvUvp/NsclknReEXoN+QBB5nLi4gxEA84V/LYFTj06yp
         ekPhsmPptowGGAiM9fM/f20gQRguAZ+oEKGbAMP68/0yyo5vuSNFufzzXp9IT2FFJl8X
         kzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542173; x=1789146973;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QsLUI6iuIsDgESFlcz3ntuSKxj+BnKcu80wPoUNQMsA=;
        b=eFgKgOI51T7iBBvgAouWwMnYiDB7/RHQh5HfrzEf+WAtZ88ObB3MC9J1fZ8T+XyXwv
         1nrcs8ZT9dhtcVpJGp78F9HxVpgmI88Hc3P+2vy2VzlUXzZA21xb399ePGrkfBxizo0G
         P+VBlF2lc1sN6Uuo/i6P5rAfGdzkVL6u/OOF9wtOnyEfvzPljUWTdg/tGmGP8KVxE5QA
         u6FDOIpEXjHJheEFm6xwBIGZmYl8zeWtA0221JV65UiUWSbcnD0MMUmsm85Aj9P0rfNd
         3k0eb9TMaqp3dwgQrnDf2aYHj/h08D/ivLBrDiH135rjPoREl9Pgefp3PQnd1TApIRPe
         pEPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwuI33neNGxeGzBB2ldt/GtTHNOp0kTx+RAh8p+72oWksffJa4RAoTKPeEVQrnqHBMfoc0Yj7C+7ySwhjXYi/3@lists.infradead.org
X-Gm-Message-State: AFuF++k2Cg48G4zirAuVgLjypTGC8mqroW6h3UHUk8M/OfB/3EIL72Nf
	z8Fi6mUfQvr9ZtIpNyjnvupriOai0LdJD1/QghEnO1e2wPT+Y8KgFfAzT3UKe6uxBtjW+BJ2fE9
	yzWWp1cmXUx5XQa4yYQ==
X-Received: from ejcag13.prod.google.com ([2002:a17:906:9a8d:b0:c15:cc45:3883])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:72c2:b0:c25:2e93:289e with SMTP id a640c23a62f3a-c260ca19c04mr527353766b.16.1788542172819;
 Fri, 04 Sep 2026 10:16:12 -0700 (PDT)
Date: Fri,  4 Sep 2026 17:16:06 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904171610.3342398-1-tarunsahu@google.com>
Subject: [PATCH v4 0/3] Convert manual kfree(dev) to put_device()
From: Tarun Sahu <tarunsahu@google.com>
To: Russell King <linux@armlinux.org.uk>, Geoff Levand <geoff@infradead.org>, 
	Masakazu Mokuno <mokuno@sm.sony.co.jp>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Paul Mackerras <paulus@ozlabs.org>, helgaas@kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	sourabhjain@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_101615_796953_73EF1438 
X-CRM114-Status: GOOD (  11.01  )
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

Hello,

As per the kernel-doc guidelines, Devices that are tried to register
with device_register or to add using device_add, must use put_device
on their failure path (not kfree). This series contains 3 patches
for updating such instances. Same for kobject_init_and_add or
kobject_add, call kobject_put instead of kfree in case of error.

V4 <- V3
1. Added Fixes tags
2. update commit msg as per the suggestion on v3

V3 <- V2
1. Updated the commit msg of each patch to mention about the kernel-doc
   guidelines.

V2 <- V1
1. Removed patch [1] as it is part of another series [2] already.

[1]: https://lore.kernel.org/all/20260810162814.1398016-4-tarunsahu@google.com/
[2]: https://lore.kernel.org/all/20260724171945.2812749-5-shubhrajyoti.datta@amd.com/

Tarun Sahu (3):
  ARM: locomo: Fix device reference leak on registration failure
  firmware: edd: Fix kobject reference leak on registration failure
  powerpc/ps3: use put_device() on device_register() failure in
    ps3_system_bus_device_register

 arch/arm/common/locomo.c                 | 13 ++--
 arch/powerpc/platforms/ps3/device-init.c | 83 ++++++++++++++----------
 arch/powerpc/platforms/ps3/system-bus.c  |  2 +
 drivers/firmware/edd.c                   |  2 +-
 4 files changed, 59 insertions(+), 41 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.55.0.979.g7e5102b832-goog


