Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D79CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 00:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoV13e3nXsd3llTg619zxCPg0yBMRrfboFWdssakaXQ=; b=fVt6tn7xdF6BM7JxfmMiWihoSz
	9ulyAYoq2er2s28Up2k4/nOJD2S7mjdTtdabeANpcZY90MWvCsC+0xkoQbBWUjsz43XVdwJfECjA9
	d7KDFJ+X/koSEFbkVcJBwUh1RgDdbAlR5EPMeqw+ywuXTskyFaFdLl3qQaH9d2qGvt1NqyBUGHAj5
	5UfBLbkciOCK5VvrOGq+ssPL6tMx3w4/NaWsAqug41XM1lcfnjB1ITEVVOYLiwKocZbQkLMSpS/a+
	WyN0meTadUWjx/bQqRkoJRF0O1vRhQ1UR/v93BL9suOdj6G2h/b5KXb+SoBtotUPyqWjDs9XbXL93
	SDPqJrUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVx-0000000CniR-1ZcJ;
	Sat, 03 Oct 2026 00:22:09 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVg-0000000CnHc-0WfI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 00:21:55 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cc7e6720b31so73407a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 17:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986911; x=1791591711; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RoV13e3nXsd3llTg619zxCPg0yBMRrfboFWdssakaXQ=;
        b=YYIz3a6LkF9FK2ATEfuBV4m9TE2Sx3lA5eoKWTdaUf8I1JIuppk8dfx4Rm4uqHTbtd
         7/0NnGNOtpT0mOMZdL433ucDitvg6SHjaXreWvI9kEfFd5WzesYeZ6SyBpofWKTRO9Fc
         l1zOTJt3mMugtn6Rp6M6sF+rsiBscOV4eCOXcb0ri/+YzbwVxZSEbVkNLyhWxEt8tj/A
         C7/ynPrRZBPa6DnhgvCYQZL6+Ohv/R98Qa2cPsgjd2h/6I0ILhihiHMMHi7RtZPSDMOa
         ZmD+57pga/YhX2V+V9vFqK19EhXDMuNxXxfU0yloxH3xJd1gjVa4iCM6sT0kYB4Oyu0e
         Nepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986911; x=1791591711;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RoV13e3nXsd3llTg619zxCPg0yBMRrfboFWdssakaXQ=;
        b=JoxcZQu9NJfeXAP6C9H28q9SNDcpa8JvvgqrDhPRa+Qrp2vDloR7+mltooHZOSYokU
         Ehf9tjbnYADM+eCgex8JCJykA0PGBnBvKMwcZ090OXXDER8LJV8ZJyuyIb2oDxNkpUdt
         /xnQDNzUs6ren6pKU/V8K/p4T4WBP6ITIH619biwHZTm4Jfwf0C0kVg2+tQf4sA2ArIs
         snXm58U+v94M1FAklhecOgQC00D7yvbyr3IK/HYTweGdtuMNosuGxsJCelEWqzelRHYL
         M243bX78K9dJKmbLp43CTLREYyOElwGpF1K8pdefykqiglw3CNYjRe3QuwNeul0JK5FI
         g2hQ==
X-Forwarded-Encrypted: i=1; AKwUvByOjY0oWgLpVWXkYrnM6l87zJPCrq4as9zXVXu1AspAqrDK/lEZyakpgVDdpGxtFa/00MJiTPvMNRgBeldhA6/o@lists.infradead.org
X-Gm-Message-State: AFq9FYJVffE6bXKz/PGXh6kiDz5/dRobi/iERsadGQu1pLdgyTRA/kIK
	n7uGqeczwBYrRkoUV9fMlU3fNqqzEWjtKEjUmUAndDXRzhmhRhU78JaoLN2r1qmyrWi7WVzozCJ
	B9tN3bh7zfWWy01Asyfsa6A==
X-Received: from plbmm8.prod.google.com ([2002:a17:903:a08:b0:2e4:a5f7:883d])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:181:b0:2dd:c053:d73f with SMTP id d9443c01a7336-2e49b681d7dmr43902775ad.38.1790986910713;
 Fri, 02 Oct 2026 17:21:50 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:21 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-19-jthoughton@google.com>
Subject: [PATCH v2 18/20 DO-NOT-MERGE] arm64: Drop BBML3 requirement for HVO
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_172152_171543_0E0B81FC 
X-CRM114-Status: GOOD (  11.85  )
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

With PMD updates being done with the Access Flag trick, BBML3 is no
longer needed.

Dropping this requirement vastly widens the pool of systems this
optimization is valid for.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/kernel/cpufeature.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 448d4ef085de..f3fd6d0b0e41 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2206,11 +2206,10 @@ static bool has_bbm_through_af(const struct arm64_cpu_capabilities *caps, int sc
 	}
 
 	/*
-	 * We need BBML3 to support Block -> Table transitions without taking
-	 * faults, and we need HW AF support to support changing the OA without
-	 * taking faults.
+	 * We need HW AF support to support changing the vmemmap mapping level
+	 * and OA without taking faults.
 	 */
-	return cpu_supports_bbml3() && cpu_has_hw_af();
+	return cpu_has_hw_af();
 }
 
 static void cpu_enable_pan(const struct arm64_cpu_capabilities *__unused)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


