Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3B0CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 18:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2e9nJ9wUb+VNUHZnaOg0k/Urr8dN7s/5sJvd32soOTw=; b=yogf0ME270EJCn9Y3MHtKZ/GNd
	iM2J7qkJMZRDqYIsETFFM5lqbYCroMJJ1yDGIywT1f0LeLHMcZR9CScp9YBKE74L4fz1E4uzVZ0EL
	dyFN17eG5ByPx+wzNdfjsAdtlHbCuMOiKPZkpNqYJrVLuQRqTfJKfK3iWF16UXwV+UvpBBV841+d/
	WzRTge0oFJ8eQ7ejNErxnb8W3Dh3MWtWcyWsjtS8HhnLhlBsPyYuNIQhisswB6+XQeyplABdfkShu
	yrk8p+3TbfG1bu21lVJ+TLzRo2t+eSAmO496hIKL6gmOggK1r7kjBYh3EfWQbHwGDDFhMtYVA7Vbk
	6KEfHt3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI96J-000000054BX-1tea;
	Sat, 17 Oct 2026 18:25:47 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI96G-000000054Aw-42PE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 18:25:46 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cd5e6f0a22bso362988a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 11:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792261544; x=1792866344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2e9nJ9wUb+VNUHZnaOg0k/Urr8dN7s/5sJvd32soOTw=;
        b=mhd+tN3J1sB6EF5zaeBq3MPshtZS9NJiVSDiWXUMzosB/vbkD0X1N9F0/NfpxGahi7
         vDI3O/Rf65l/nbY/BSsSyjqZLKiutw+mzgIR4KBC2ucxt9aPU+fVJ4OjNzv04MeibE9h
         55yMa/OruTqL3cLBfmFhqm7maGKvlN0u1f/uk1CgQ8THn6s4k4TM8jmhR2v90Htih5+2
         cLIMz2mZMxDR8/WT0MALbbiPTlt210LCEQ3esTbNUGeKGHyxp9GU3Hq4fb+DBKDxJsNt
         odaZRYwu4dI75MoWNSUEtalo9cQ6efn/XtxI1USco8oyeQbiwAwT9fYRWEhQA3R2PxGd
         tTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792261544; x=1792866344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2e9nJ9wUb+VNUHZnaOg0k/Urr8dN7s/5sJvd32soOTw=;
        b=0M+7iHY4Eggq1mH12Omm3w1KEsFq5aEO5nYxdB0Be9pOWH65plMbFjeEW4p2BG1+mE
         CQ+wPuJvTx9Vv8t4bo/UM+Iv1XxEWKEt5F7+WZk58vNB/qlJcolkM6+LnWoGwTpIN/q7
         NMUge9XNM9rHGdcjeJxWFiv6L0Br9PJaaDL0ZRngWGxClRV4OFC0xnI9friC4smduKFM
         BKGLbsE23mwe2CG129L33PkpdwpvjaX0lYC3nBulILtwfnZ1qMRg8kckytJnC5c6l3hI
         V2bZHkB77yG3jpgxKPDFbs66sn17Qq2pGpDG5qZRrvj0mczpX8RxBHdo+aN7Jdv4CK3M
         E8ag==
X-Forwarded-Encrypted: i=1; AKwUvBw5luI2wsIaS+MV0SgWTOsfrgvL/3o5ughw9qn1kC4bq6v9GFfV166yokAAEVsjU4GZN8AbdMS7hinhVJA2FkKg@lists.infradead.org
X-Gm-Message-State: AFq9FYLY3X2N532nNVLy6zXQx3p4Gdub0EzvImu+DxiiDpZS3brvk4Qb
	jf924VsQrtSu5X/X945Pr9ZP6DGsHptUgopvqNVFMP/ipMRTekMWp5XU
X-Gm-Gg: AYBFou1J1gyYTiNi9im1lfHjzVVuLRs57utteJJ3S+XVIKB+q37IUEQv3t2DGQP9Mn7
	91qkydBGTSHnDliDv1/l9QRxfXz3Ixh4ISqkIMn8KdFja2xizpeks/VC52WXqIE1aNMt3ErxjUF
	JsKmMuo+9JHxNpOVzfhULJ4Re0Ma0UfTUs3LAg2LUA0WdJDkJbcjnVf5IaSnNLd51kt9cj7ZtpZ
	f3/6wKf66QwtLSTnANw9U4LIgkyn4x19/PljS822h/I1+VNN1s3RV4vdTMsSlxJYiNRFaPOEMh4
	P5i85QFD0T2eWswUuMkQi84Jls9nKzEFxE9gJvGaaJkqghu5S04vGjww822aZoMftsAZWuvWHrq
	GKU5se5FLiYh8G+MHh2DzjRfVnY5YWOJ+GcXIzzgPq7erc9ZxkN1tfL99TVfmMxOSf3S2MYqBA+
	cI/OM22rCLoUP5mO66LHcvh8n3x+CMz8Sh5QF59u33vx+hZWWwreavkrminD+GyedBR4gAQoXUk
	Ts9FWuPoS5ya4WNGTGaQS4fhpYZmEu2CmNu7D5ZJehySexyWSv5tcfnsmu8gFX10FdmwiCeWeoX
	IA==
X-Received: by 2002:a17:90b:17d1:b0:3ac:a7ee:6772 with SMTP id 98e67ed59e1d1-3acef5ea843mr3055404a91.63.1792261543994;
        Sat, 17 Oct 2026 11:25:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:56a:78dc:9300:8846:761:63e4:6d67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ecd32sm9241586a91.3.2026.10.17.11.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:25:43 -0700 (PDT)
From: Abdalla Eldoumani <aamsdoumani@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
Subject: [PATCH 1/2] kselftest/arm64: Report test failures in vec-syscfg's exit status
Date: Sat, 17 Oct 2026 12:24:53 -0600
Message-ID: <20261017182455.1884-2-aamsdoumani@gmail.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20261017182455.1884-1-aamsdoumani@gmail.com>
References: <20261017182455.1884-1-aamsdoumani@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_112545_012855_0AEF099D 
X-CRM114-Status: GOOD (  11.91  )
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

From: Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>

vec-syscfg ends with ksft_exit_pass() whatever its tests reported, so it
exits 0 even when tests fail. The kselftest runner decides whether a
program passed from its exit status, so failures in vec-syscfg are only
visible in its TAP output and the run as a whole is reported as passing.

Use ksft_finished() so the exit status reflects the results. Unsupported
vector types are reported as skips, which ksft_finished() treats as
passing, so systems without SVE or SME are unaffected.

Fixes: 95cf3f23877b ("kselftest/arm64: Add tests for SVE vector configuration")
Assisted-by: LLM
Signed-off-by: Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
---
 tools/testing/selftests/arm64/fp/vec-syscfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/vec-syscfg.c b/tools/testing/selftests/arm64/fp/vec-syscfg.c
index 8dd932f..2c8ccbe 100644
--- a/tools/testing/selftests/arm64/fp/vec-syscfg.c
+++ b/tools/testing/selftests/arm64/fp/vec-syscfg.c
@@ -792,5 +792,5 @@ int main(void)
 			ksft_test_result_skip("%s\n", all_types_tests[i].name);
 	}
 
-	ksft_exit_pass();
+	ksft_finished();
 }
-- 
2.49.0.windows.1


