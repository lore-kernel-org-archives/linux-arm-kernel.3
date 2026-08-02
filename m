Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CF5C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 23:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b2siebzQwyclmXl9OQ0U38WMcozmoMwIPul2McG6A9c=; b=wbTEkhQgQ7BxSB0m0xqoqife3z
	7R55+4zA+/hubhI85Udn7ZJo6eOpCyS2FuQAqyu0FPrtoFXCzvGeyrMmjNLnvm+Y8OFpEsr23UJDu
	zP5+Tgj/Sr8EavDCfqF4u28kkvtCYT4uJVdRTGvuz2mEM3LRj5QCeiVbkXqGK56pBNfDQnXbACrnO
	jvukBtZQ5fy5wU8ljR53QoWfYtDsL7cxYE/KZojiwpDB60Q08JKhjSdeWv3i/lYWFHq11S0+Ag401
	8LnPz9MWv+1bNG80unBLT03UILj0VhxCT1Ka83M8NgFR5lcXlJzdNwiD3KK9Tj4NmFIySOF4Wvcy0
	rqr46Szw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqfZF-0000000G7UU-3rBY;
	Sun, 02 Aug 2026 23:26:05 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqfZC-0000000G7U3-0NXF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 23:26:03 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-8f032b47e3cso18829226d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 16:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785713160; x=1786317960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b2siebzQwyclmXl9OQ0U38WMcozmoMwIPul2McG6A9c=;
        b=AyWezUHD7cIs0Yzwo56IGN7btho2V112r8eueSeFEeFAvFmfNcTtfdtXEfKKyS+DV1
         LYC4psIc3JQmnUIxJ5fKyiLy888RXRCUcsYC5+5leQ/L53n82V/onm+gBn1dHnDVxdAk
         vEqmtmtb5MOOUw4fjQ59OhMSN1P6qYQ6NP/lzRcI463wTDmVZdjCMZZ7YvN/Ku6Z+GJr
         Bl/UUkQ5ILAK/gzmT1mUnG7Avjn2jGWO5nO0RRJ26HK2SEtbVrovhYLmwVHMfdoN752m
         xCBewFmRxSTKjw5oUeselQmEBLc2se5wyzenYdd8Cc2OK92LlJ5MubMCLh9cPSlOLXdQ
         V/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785713160; x=1786317960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b2siebzQwyclmXl9OQ0U38WMcozmoMwIPul2McG6A9c=;
        b=OhLSj9lCViI/oN1fAAEmUeBLfVNFRiRR6eGxvXBcGIsXDGv+drQe60od4SAgdMeQ0A
         F8vMACBXZVzNLwXopO6ctIYP1Xy6/A+ZrtmHBnYavP3NCHCRu1KzbzpTe4165prl7AC2
         JMLTU/CyyOG+vID5c4GC7BbP8BcWpiuGCdjuqoWNNcBuT/ylBhlBJdqRuCn7RK8k5Btb
         /qwfiXZ6aIfFBNnjLmN32ZWHFLduzVaObWUyVZiijPxJp3pljVCl2XhluHT+lBBy88WB
         hHTBDJ1SaEhnSWV+eeIgqPpZJm0jgbmXUua2E9OpElL26wdJ4+Lyvq0ziUa6DZRggbAd
         sHdA==
X-Forwarded-Encrypted: i=1; AHgh+Rouf5r7w5HScRGjdS82BDSehLdWG1AsdNUlosX3yieH3A1AyMHva7DcaBFdiU8JV2MlPasGewvR/FOhBQBL8v4A@lists.infradead.org
X-Gm-Message-State: AOJu0YzzhEj2D7xUf+rxyG/PXlenfwCxP9nLns3PGeHw8qYcIFm1bMFO
	6lnSoO794sNCiq4lOAmlRQagO7zPtUNliKw2i+G7MfOMMjbL0hmTMcuc
X-Gm-Gg: AR+sD1352MNDGbuq2I1KtN8EvOgRVrj0ZuMcv7Slk540lJz08q6Y5zVSLsGAKtjSwh+
	LsxWh1kepGM4IRZOUhexC7KgJOF/g3b2gWHq6pQm9t3N4EBFbkXjzyATo8IHzp29aMBa+KPqARv
	dK/srxYhtyURtWL6ycQDw3CYXAk++1OHTbsyPBAP7tpufZcjO4XotIndPUoHbXlseS/tfEiaDEj
	8QKzCkWPx9v8A0FijQNf1H5Q8Oou+Vi+A7lgeUI/k4RFRmMXFp31XOq2eFSyji/FKm2jx7fh0JK
	YuXyZQKXi5KTXHSYy+8cfuIsuJZhtgS+hO0EAhQK2UHFnWKSm6l33gQd9tXziMO4FZ8zvQ80HiF
	kfKIhs+RX6dP0qEzZaJoOTG0tOr2HLeLr0HStQFQdBgRhvsNcXRPW9ieQIinrScKxVi9ROcB8ud
	WK3bnTL7DbML4M05fZdJSkeHzzJelpKaL4FeX2cBygo2XhOD6ixpyQC2eY4M6n4j7H30Hw4hO+u
	rE7iT4wnGdj/U7HFBtSHN952BxXqGgslQbKWF7SnjW6p0X6wjXZ7Up8lW9VNUA=
X-Received: by 2002:a05:620a:4549:b0:927:59bf:46ca with SMTP id af79cd13be357-934a0aa676emr1508739185a.40.1785713159973;
        Sun, 02 Aug 2026 16:25:59 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9349c1ee678sm540076585a.44.2026.08.02.16.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 16:25:58 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: suzuki.poulose@arm.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] coresight: Check runtime PM resume result
Date: Sun,  2 Aug 2026 19:25:52 -0400
Message-ID: <20260802232552.593435-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_162602_154145_059DFF48 
X-CRM114-Status: GOOD (  12.79  )
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

coresight_get_ref() ignores the return value of pm_runtime_get_sync()
and reports success even when runtime resume fails. A path is then built
and the CoreSight device may be accessed while it remains powered off.

Use pm_runtime_resume_and_get() so a failed resume is reported and its
runtime PM usage reference is rolled back. Drop the module and device
references acquired before the resume attempt when it fails.

Fixes: 5da5325fa856 ("coresight: moving PM runtime operations to core framework")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 6d65c43d574f..77d05b360484 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -843,7 +843,11 @@ static bool coresight_get_ref(struct coresight_device *csdev)
 		goto err_module;
 
 	/* Make sure the device is powered on */
-	pm_runtime_get_sync(parent);
+	if (pm_runtime_resume_and_get(parent) < 0) {
+		module_put(drv->owner);
+		goto err_module;
+	}
+
 	return true;
 
 err_module:
-- 
2.43.0


