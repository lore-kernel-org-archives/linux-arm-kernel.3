Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75DFC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 15:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LfmHwtO5VGLHZ5qx+q0QzCiOoHRJOgVOO+DpSeTJTXw=; b=EgmybPLA4nahf/C6l6xjhYCIfQ
	oj3mdNNhyyzjSk+pWDPP/V7lCnB6IEVmuqhCmsaxqiRlBvG7OoppRu21uQe8ejvOYDsmOt31MUCR/
	65B9LhBOedS5y10o/U10BBTwsJBIYhZVncZCQiQFJZ3Iy3Tjd8UKnvFxEZ4VKNh7rx1W08+5575Gd
	0ewdEPwyViKkMTygLe01FswKE7N+iN+JyfgrdAxqsuVcbyfe963mUoHtVnTfdAHOJUcZ26RuqLOsy
	xKt8pFhV1O6hi85byRdzebNvyc5xiFQcNqamr+EWoiMr3kupp4T+ueMBeG1PZlo7zSPLglxSHNZte
	k9PLu+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMGw-0000000Btyu-3K1T;
	Thu, 03 Jul 2025 15:54:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKS1-0000000BZK1-0NO1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 13:58:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 539CD1596;
	Thu,  3 Jul 2025 06:57:54 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 32AF13F63F;
	Thu,  3 Jul 2025 06:58:06 -0700 (PDT)
From: Ben Horgan <ben.horgan@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	linux-kernel@vger.kernel.org
Cc: james.morse@arm.com,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH 2/2] bitfield: Ensure the return value of type##_replace_bits() is checked
Date: Thu,  3 Jul 2025 14:57:29 +0100
Message-ID: <20250703135729.1807517-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703135729.1807517-1-ben.horgan@arm.com>
References: <20250703135729.1807517-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_065809_168193_68FFF139 
X-CRM114-Status: GOOD (  10.84  )
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

As type##_replace_bits() has no side effects it is only useful if its
return value is checked. Add __must_check to enforce this usage. To have
the bits replaced in-place typep##_replace_bits() can be used instead.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 include/linux/bitfield.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
index 6d9a53db54b6..39333b80d22b 100644
--- a/include/linux/bitfield.h
+++ b/include/linux/bitfield.h
@@ -195,8 +195,8 @@ static __always_inline __##type type##_encode_bits(base v, base field)	\
 		__field_overflow();					\
 	return to((v & field_mask(field)) * field_multiplier(field));	\
 }									\
-static __always_inline __##type type##_replace_bits(__##type old,	\
-					base val, base field)		\
+static __always_inline __##type __must_check type##_replace_bits(__##type old,	\
+							base val, base field)	\
 {									\
 	return (old & ~to(field)) | type##_encode_bits(val, field);	\
 }									\
-- 
2.43.0


