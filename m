Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B65FCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 02:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MQNR6L+7huHKuwbkqLdL2TsWGeG92RjXJK6NBbCqQZ4=; b=tqrs0Q8CN41IDNDdxHk81mAXlF
	X3U95/5L44UR4xOxoqRSsn3c/yzusRCxdpW6/eSzdkqm+fgqAtXGoeM9v2y6HZbDX9ElvkfsGDAxs
	ebavCyWSXj4z8NDS0fiIavmjHzsPLbpDML+YmZeqBxUqAAwfCkvpaN9c5+BWBD1NHXywzImN17ChJ
	aoo1iNnGdPExs2OnCOEz2TXjcRsWxAzMHyOEy4VwuLx88eZj17+gT7a7MEuSYEnEwxovFOMfUHMNn
	WP/Mp9EvpeXAdXgW6jwynhu27l4DsSwUL/Cblf+cTZQ4iiQ60ojIWxnGezppriqsZnneEEG7+7yDG
	8g+fEkpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGoxx-0000000ENTE-0XuA;
	Wed, 14 Oct 2026 02:43:41 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGoxu-0000000ENSp-0Wec
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 02:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1791945824; x=1823481824;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=EbWJXjbzLCreNhEpEEU9+ZYBf/El/DBW2b1LyD7YylY=;
  b=Ygf/M7hYg5WTCml1rfMd6XoFDyjsrs7S6tmW58X4r8J8y5eWCkvt4o0C
   EvwJeTOaz8prhuw2/zPLpcMJ5UO8PrS4EiS5jDgPBazmuJn2IsP4/nvAw
   EpNCoTFh5FFPWKi2VS4dXvBQ8GYTLjBLVWZm12eAMgYQr0xQk4SjVwx2m
   zjlHI1PIKS10MbicKhUCi1t1vvhiBrfhkqgyvKdcV0ZJvbiDi2l32RdVU
   Ae1uMH7AOuXWZMg7lEFVCLdeW5TaLMNGNvcLPEZc4HTP1M3WkWmYpZQPv
   PS+w7GssZDBFp8r9sAe+1Cffl128YBf52O3FhFiLa4otcVpfPmFaqS5MG
   g==;
X-CSE-ConnectionGUID: 0DXwf3RDRVyzo1xlIjJcBw==
X-CSE-MsgGUID: dCrtfCpWRNO02HZJV+AjEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="258110777"
X-IronPort-AV: E=Sophos;i="6.27,156,1786978800"; 
   d="scan'208";a="258110777"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 11:43:41 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A791C1C1C705
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 02:43:35 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 5E290C02472
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 02:43:35 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 5863820002BE;
	Wed, 14 Oct 2026 02:43:31 +0000 (UTC)
From: Kohei Enju <enju.kohei@fujitsu.com>
Date: Wed, 14 Oct 2026 11:43:23 +0900
Subject: [PATCH v2] arm64: rsi: Correct type of realm_config::hash_algo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-cca-b4-rsi-fix-hash_algo-type-rebase-v2-1-6cb0ae13c8c1@fujitsu.com>
X-B4-Tracking: v=1; b=H4sIAErszmoC/5WOQQqDMBBFryJZd0oSNWBXvUeREuNoIq2RTJSKe
 PdGe4IuHzz++xsjDA6J3bKNBVwcOT8mkJeMGavHHsG1iZnkUvFKVmCMhqaAQA469wGryT71q/c
 Q1wkhYKMJAfNCmLbkreKcpakpYJLPzKP+Mc3NgCYe24dhHUUf1vPHIg7vz+QiQICqcmk6rrXi5
 b2bBxdpvhr/ZvW+7183M4B47AAAAA==
X-Change-ID: 20260929-cca-b4-rsi-fix-hash_algo-type-rebase-e341cd50d600
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Suzuki K Poulose <Suzuki.Poulose@arm.com>, 
 Sami Mujawar <sami.mujawar@arm.com>, Steven Price <steven.price@arm.com>, 
 "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, 
 Kohei Enju <enju.kohei@fujitsu.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_194338_509611_43E4F04A 
X-CRM114-Status: GOOD (  15.07  )
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

The RMM specification defines RsiHashAlgorithm as an 8-bit type, but
realm_config::hash_algo is currently declared as unsigned long.

There are currently no upstream users of this field, so the mismatch
does not cause an observable issue today. However, a proposed series
adding support for Realm measurement registers uses this field and
exposes a bug caused by the incorrect type.

Change hash_algo to u8 to match the RMM specification while preserving
the size and layout of struct realm_config.

Link: https://lore.kernel.org/all/20260413084957.327661-4-sami.mujawar@arm.com/
Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
---
Changes in v2:
- Drop the inner union and padding around hash_algo (Catalin)
- Link to v1: https://patch.msgid.link/20260929-cca-b4-rsi-fix-hash_algo-type-rebase-v1-1-6932cf0aa605@fujitsu.com
---
 include/linux/arm-smccc-rsi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
index fddb77986f70..cca881ddfdba 100644
--- a/include/linux/arm-smccc-rsi.h
+++ b/include/linux/arm-smccc-rsi.h
@@ -128,7 +128,7 @@ struct realm_config {
 	union {
 		struct {
 			unsigned long ipa_bits; /* Width of IPA in bits */
-			unsigned long hash_algo; /* Hash algorithm */
+			u8 hash_algo; /* Hash algorithm */
 		};
 		u8 pad[0x200];
 	};

---
base-commit: de7b38167981bb92d8e4b2ad8ad9f151ce72a838
change-id: 20260929-cca-b4-rsi-fix-hash_algo-type-rebase-e341cd50d600

Best regards,
--  
Kohei Enju <enju.kohei@fujitsu.com>


