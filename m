Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77561C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0x2qbND6Sa3WNSOYkn6lqr5Ld4Ihzkg79AVpCRYTR1A=; b=ETLWYoaxFS8soq8NkRzo+/a2dY
	z6cFB59O9qdcRuF3p7pmkNh5ipDosCyIZ/T6T9JZviTfLAQOdirXeGM/H0WUAN/ypySJluYrH5Fu6
	7BrHqmlo+VGsq7Gdx7WuOCecTy8Ak18yP6aMXUWlQpqIa4Tkg7ejyPp6Xg/n3MSeAI7mzDCphrXhe
	70et9B44CCZssjdADmQBZhtKeJEXKJoGpya4hc6TxNezt1HYkZ2e2xfFjQim4nKMoaLF15/FT+wZV
	ln20MCzw1NSocQlxOTVBoa2gMph7i3xkJ5i0gQyYSB4xlLxFXzTeemWjuUMiTMBR+sf9NpaS5PSzW
	owsL7yeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYo-0000000EOyr-3znp;
	Wed, 02 Sep 2026 10:51:18 +0000
Received: from mail-ed1-x547.google.com ([2a00:1450:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYl-0000000EOtH-3Qzy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 10:51:17 +0000
Received: by mail-ed1-x547.google.com with SMTP id 4fb4d7f45d1cf-6a6108d2987so1019309a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 03:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346273; x=1788951073; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0x2qbND6Sa3WNSOYkn6lqr5Ld4Ihzkg79AVpCRYTR1A=;
        b=HaXwccIVcj4AOSZ9D14a+ROfR9x+bD+OEpzcPTds7JoDvOq1CODCOhDJ52PoNY0SPE
         QP8U+Dxcp4Z4kWLh5klIxVMKJyF6+jTpzHGX4PwGTAh1F1iimePx4T/MD9ZWSHU7+V2t
         Pnr7rWVQ5SRvhpA1WVoznyfBBi1oqKxaTwzOdXdaYTUiYpaMf5opjU3QN2ldsZ88ueUf
         8uVsQWFvUltKuvxzNbWkzn54SAD9DDOM06ZHQfFOGUVED8t79tOzGfHINfbvx6VI6RdY
         4P8DKtdk3m9folAvaPbW5JDdTnFemE0fn3VtP9y3hgp6RZyvO4VwbE7yxOCFSl0lVG4Y
         81pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346273; x=1788951073;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0x2qbND6Sa3WNSOYkn6lqr5Ld4Ihzkg79AVpCRYTR1A=;
        b=fqV9T68BUMt2NYbW2GFWLiOclY+7XNhdLwIFD9026ClCy4KKHo8u3TpxdlrZqoG8nE
         kwmkMDiBnjezHMqd1ObP/QGx1DpFE4bK7nirJqLkV8e++CzzwcNhVqH7AdxHurYb4/XB
         01T64N5aO0lN505oLSqkktfc42uOBUHAK5GV4UOu1n6Ehrm22IjlXNQpVvnZlrAIV+cF
         EBxU0FSab+VHEBiwSBUewNE1iLXsnvqDUP+41sd7a50jSojYrAg6LNjKE1mMSv9ZQbLu
         +mWNtj+uLIg8oHxPB+QZQvRTaf48DvSUEVCaei3xv1kSfl6KEZ4rKAJrrOf/7/AQADx5
         8dSw==
X-Forwarded-Encrypted: i=1; AKwUvBzaPsqTc09g7hWbDXBL/PwEqVImwWvz+oYLpvwCgOMNFkKmsu9vFkU8hgy5albVkH7aurQn92BLOP5iBt3S335x@lists.infradead.org
X-Gm-Message-State: AFuF++klM7I/U5CQmVm5Hngb+TbaCaYh3Ton63JzBDXoy/r/2Kji83BZ
	vm8qrdOznfPLKTilsBUlS5YZBe2OTl0IbY2E++TBubJQU6hM2RUzo+/NpiL9pSYZPxAWViZq5cK
	NhjsXSFVDdGb3U9FM+7++mg==
X-Received: from edyf4.prod.google.com ([2002:a05:6402:684:b0:6a5:e070:f1f6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:46c5:b0:6a3:f47c:969 with SMTP id 4fb4d7f45d1cf-6a68224ce3emr2605259a12.3.1788346272605;
 Wed, 02 Sep 2026 03:51:12 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:07 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-6-vdonnefort@google.com>
Subject: [PATCH v9 05/10] arm64: can_set_direct_map() if BBML3
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_035115_895569_0FBD9560 
X-CRM114-Status: UNSURE (   8.19  )
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

Systems supporting BBML3 can split blocks without risking unhandled
page-faults. It is therefore safe for them to set the direct map
unconditionally.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index bbe98ac9ad8c..58898ae53f5d 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -99,7 +99,8 @@ bool can_set_direct_map(void)
 	 * Realms need to make pages shared/protected at page granularity.
 	 */
 	return rodata_full || debug_pagealloc_enabled() ||
-		arm64_kfence_can_set_direct_map() || is_realm_world();
+		arm64_kfence_can_set_direct_map() || is_realm_world() ||
+		system_supports_bbml3();
 }
 
 static int update_range_prot(unsigned long start, unsigned long size,
-- 
2.55.0.970.g62bdec98f9-goog


