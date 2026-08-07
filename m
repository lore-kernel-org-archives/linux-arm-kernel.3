Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A118FC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 09:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e6t3+tBS5sN1Dfvci+p8e/0NE4L3dqjBbVzFjBmD5o0=; b=d32E/a5vraYIlhMraEp9DiuF6x
	sR1GcnfClLBEJcqFJE6X4sKquQQVcgeVJ6WiRx/cJcUif0owA6ywc0Ngqzb8d29SetYDkEPj58qi5
	nwBpAEtKuOc/pXdjNtYBtBJARXl8pRnOQ6MTvP3GtvmSFEKF+oUNyNJhzueAaB0pajAgcrUW0BBFI
	4Zvd4wjmlhUMVvIKcYGmGzOETCfYs3f71s6Nn57W8EkUB+1eFCVsHT/o2Jxs4WuJdhQ4Lhghz+J2X
	TnWYRm8duVOQehSxTDSNudF4/YLjQlqPJvrabmlamjd4PfJVFzgALp795OzUP0qK2gqdgOk5fuRhP
	NtcnTsDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGfj-00000007Ur0-2y2v;
	Fri, 07 Aug 2026 09:15:23 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGfh-00000007UqN-0oJw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 09:15:22 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2951290f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 02:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786094119; x=1786698919; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e6t3+tBS5sN1Dfvci+p8e/0NE4L3dqjBbVzFjBmD5o0=;
        b=qcnYmaRF7xtIo+KF7Tbiu4lx+Th79jitrpVD1QvvSeCf3JTLNETsP/JIlsAn7pCyp9
         EzdjvtoNVfLANrmTlbjXsj7YLldxE9J94i4O3tqSWBAxYpziU/8DgJarVDWSDz6XbS6g
         6yMpZFu0b9DwGL3IMFBucA3murMPvhcTGiOAhb0adOaYnUXrLeSQ/Le/YllqgCOWVsyg
         AQxMsp5KRsFaWqBnM5ay4bnhSKpdZ3sCEihRiTIoH7S09uKq48Rz4A/U5O8JWDuwpXff
         Kl1CUa6/WbMgbl7SWUiTdYfxEWiUTdZeAGg3JbV/ive1HUpqY62KEIwTlsZojk8NujLI
         Hd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786094119; x=1786698919;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e6t3+tBS5sN1Dfvci+p8e/0NE4L3dqjBbVzFjBmD5o0=;
        b=hgtKaHpMW6rxjuxXSfgnjMbJ7kIQet495xW5viAr/744hNIOoW9ZV3d/F5NG81tolX
         PQ949mMkaXykATNi92IPpMKFICvFaxJRkKvKmvd2weDbIaNCj4r+xgAfzCtFIfDxlDr/
         IW2Tg9g3/lfAQNa0gXn9Vr8LSub5r427z4AKI/39wie0Y7+mzmMQtxUmC7y8NRCFJo2a
         xHH2qMcCJ0rKDDfOOkI3HNBtQmE+F76jihI47MSN3chWluLCo5CdsTWXTplJLt7LOhDW
         a6DqZJxmklUcQOt6mZ4cAPi6PxFm+KoYQibJhY9r5MrvBYlkNY/i/d8CPCwLIFajwUga
         csVg==
X-Gm-Message-State: AOJu0Yy12AftdJkZ6HTe8DP8VuzQSNLado04NbS5IwWzAPEOVP/kTwrP
	TITe3PqgOdkI9NjTVfkAwZzsFZsz2fpwp6uukBIyi8LTimWO8U1VyleCAXtRnIM0ZrU5AiTuobp
	X3tlGwww=
X-Gm-Gg: AR+sD11uv9Pt8VK4cIwM85YwY7+qxz1hdczKdygO/45qcGIuec6URPEcsTaQADz0Nbb
	tZueeVI8YeGLAkjkt6wIj7fhe60E1gO7Vd2gRDe5oNadNQxOy1kCNELrA5uJ8TIEDQybdZNhk04
	4wXq1PebvRzk441UIukEfJylTZ3Qsp9kOwKMTJnN4iq5Hn/PSrYXm8E/oOxhFDLb8pWIL0UMvWR
	lq0p7pcW4v+bQJQp9LCC7WmUYKRf0CE7qakAhNM6qyJg2eHqpiDybTneRRiiurtvPb144HJWp4x
	OKi3YMuON62clzH9X6mByaRKu6OKSsyWyRkA8tTsYTymCf+lCmrBBH/IDO7Wmv8lmk3Wj6dDYpp
	t7yfYRltmdgukMD80fM1sRMChB2aezA/Iv9FGfbACrbI6EwpwQydDDlkvjPbTPa60aXPjbl1nA9
	mGaH1uB0KeRoS/2ByDShcTTxgbfCUteXUMeNCO0DoNGtaKXqKy9mQu1PfBjxShaZVE
X-Received: by 2002:a05:6000:d0e:b0:47f:9557:8d77 with SMTP id ffacd0b85a97d-47ffd2236f6mr9845559f8f.10.1786094119255;
        Fri, 07 Aug 2026 02:15:19 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021fd392sm3809077f8f.31.2026.08.07.02.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:15:18 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 07 Aug 2026 10:14:59 +0100
Subject: [PATCH] perf: arm_pmuv3: Zero initialize hw_id branch stack field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-james-brbe-init-hw-idx-v1-1-009d1843960a@linaro.org>
X-B4-Tracking: v=1; b=H4sIABKidWoC/yWM0Q6CMBAEf4Xcs5fUKtX4K8YHWhY5EqvpoZIQ/
 p1DHye7MzMpikDpUs1U8BGVZzbY7ypKfZPvYGmNyTsf3NmdeGgeUI4l2pJl5P5rj4nrQ4tUHzv
 4EMjkV0En0y98vf1Z33FAGrcaLcsK1wyFaHoAAAA=
X-Change-ID: 20260807-james-brbe-init-hw-idx-53dec54fe266
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Suzuki Poulose <Suzuki.Poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_021521_251687_42281BF9 
X-CRM114-Status: GOOD (  14.86  )
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

PERF_SAMPLE_BRANCH_HW_INDEX is supported by BRBE so hw_id is passed to
userspace, but it's never set by the BRBE driver. Zero initialize it as
it should be according to the docs:

   * For the architectures whose raw branch records are
   * already stored in age order, the hw_idx should be 0.

It's probably too risky to remove PERF_SAMPLE_BRANCH_HW_INDEX from BRBE
now in case anyone is setting it and reading the value, but zero
initializing the whole struct also protects against the same issue with
new fields that are added in the future.

Fixes: 58074a0fce66 ("perf: arm_pmuv3: Add support for the Branch Record Buffer Extension (BRBE)")
Signed-off-by: James Clark <james.clark@linaro.org>
---
Very small fix spotted by Sashiko. It was probably always zero during
testing or never looked at.
---
 drivers/perf/arm_pmuv3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 8014ff766cff..b9a8592bf112 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1361,7 +1361,7 @@ static int branch_records_alloc(struct arm_pmu *armpmu)
 		struct pmu_hw_events *events_cpu;
 
 		events_cpu = per_cpu_ptr(armpmu->hw_events, cpu);
-		events_cpu->branch_stack = kmalloc(size, GFP_KERNEL);
+		events_cpu->branch_stack = kzalloc(size, GFP_KERNEL);
 		if (!events_cpu->branch_stack)
 			return -ENOMEM;
 	}

---
base-commit: f9a2394a23482bfd330911e9c8295b71724feacd
change-id: 20260807-james-brbe-init-hw-idx-53dec54fe266

Best regards,
--  
James Clark <james.clark@linaro.org>


