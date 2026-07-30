Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483C2C5516E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 18:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iOaF3ZXO4NAKK9OaRMocQnwJ3uO4yIZBEYzzq3ZGTvg=; b=jSO/rJUTA6SOeWrjsc/RGV/PLj
	kEgIjH00ZI1IFSn54WC19jYEyY013V8zQ8ZvjdF+c5WqDZ0wWzg7ky1L3A7XJNtFBJawE1e8jjwXP
	1fZ6+V/nD/uIMMYMiDvHZiuLOrALewXTnxejoZEpKOXsFIxqD9ISEOUs7Owp0u380Wg9z7n1Pr4m7
	gq+a1ZMCjo4ZWsrdMVpmHwnDs4+qQWffl+2+Cxs/8CC3YEsOoUgaObdA4+vJwfr4A/D0loXy7bSvu
	O1nWSLxj+OrvhsEzB1zoIENlI0Kke6zp9CP2iGqD3VVv2u3jXmiridWAkEMk2TCyzvVInVZf3zxj5
	VEgeMUzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpVFO-0000000B8Oi-0WPD;
	Thu, 30 Jul 2026 18:12:46 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpVFL-0000000B8O8-42wG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 18:12:45 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso774415ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 11:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785435162; x=1786039962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iOaF3ZXO4NAKK9OaRMocQnwJ3uO4yIZBEYzzq3ZGTvg=;
        b=d/1SRVBxVyNXIQH5GZg40L5gSOfU8Xxwt8uGRAi5CIsYOcCkbwXephvHVyAWLRyz1p
         hK2ylf7OvCEpHFBc4Nng2f0NCLgc+dfXs72wjTIUa52W84BX3feCSDqKr4VQMvkAqoWd
         qeOku4vW5UkySWjB2/GTUA6lhGpr16ZBJDwfRin+j3Jr+tS5XNYiwM4tQS1LE2CwMd53
         eOjFmHhptTPUiarCoTz5RdRgZzI3j5FAamDZqD2r1xnljIuEUYzbPiBomPC4JwcW6HOX
         phdOXMEl0iAZsqV5XvtH968Ti21npJsCzEns5Rqf8Ki87nzHB12qeJXhqkHlTuqAo7WK
         Yogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785435162; x=1786039962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOaF3ZXO4NAKK9OaRMocQnwJ3uO4yIZBEYzzq3ZGTvg=;
        b=SweVvv4L/HhPSqEd8T/gUymJvRo6kteVUXHPiGKs2Daapc1vEIHU6phP4WQssCndAP
         uMSafFMW2Tszfv77ZNpT6P8K8Ui6E1a24fpuIWIrA2amSusleY6vQ/GpFL7+bsAySJdf
         sNw2CcaYB2VyVSGEUFjDuqDAi7Yy+vJbD4NGdvIc42pvGq04drHRpOjk8qe0K+6ZH+KN
         CO3x2iqQmG3+5BhOGYK5SEpf1kpXLSMjAj3XciGWCZJMWan2gfp5ohef6H2aiQJjH2hr
         ahTka3PCsFv0YCowZ2dOENPj2BsF6XXnuw8KvAuFXmkKlLWB5HklsXJdmpRZ7EckzP/i
         5TOg==
X-Forwarded-Encrypted: i=1; AHgh+RoBmp+z6VKOK/MrSrXTR0X9xdEAryYeBZ15WUNUam0GKCgAq6WOJ9MCX/m9MibrYcddHXwvLQJ5UL51uWSGSidb@lists.infradead.org
X-Gm-Message-State: AOJu0YwK0fNTvA72LpbqAWAYcZ9Aga0dqFWc0kgd+vj6K9e54RHA/M5h
	blQ1j58icwByJfaBYBGjklBmvjjd8zNIRwERU6X5qUDh4/UKg1PqvjejGVmNwQ==
X-Gm-Gg: AR+sD12m7MYWeKpLu08q1qiAfVgTVjieBqmxfFfSrIY39G0tHDFVycjnIRD0qXHDMHu
	ESYMYDyeeFanD4LA4LGXFcGtoFC7FntmYQTiQ/JLanZjNTo/pgbwUSBYR4cnxzo24f+a+JOJe3n
	11uuBH7bRbiRrVh/M7YpurHYgcCLWA0hDgMfA7tvLvukuCq80O6H7fInkP6VjxF2RsdiyK+tdW4
	ZRC8pvQ9ZXhEtc0s2KDZ469aEiAEBjaxD2nzGKc+PqteFiFLMvm85iEMu/r0JVreE/R5SHUMJMc
	DBMY3wFPO8GaVF2Bne9SfKYONzM9phEMjZTmAdx0D5TTuFmipcICpJz7Vm5jy22Jtyvaq+VYFyQ
	Onuww2/5J3xiN7ua4lKvJLfVQ/SPMShbeBfEMUyH9ZFcvjM2XXC2XKhTu4pWdbZZYFO3GX3IrtH
	kSn5Q0z4E2xQfMWKudBQ848QOUA6uXvv/b+nkxY1JH+FiMTDuYR9XKKZKUoy5tkPo7M6cMKvURM
	K0TMuavzHh4LACHfMEBClCJG33OeDT+l96uV1tDHur1eTLhMpVXuIYLAcXGFAk=
X-Received: by 2002:a05:6a20:6a2c:b0:3c3:bee9:8eec with SMTP id adf61e73a8af0-3c9004c829emr3373312637.19.1785435162443;
        Thu, 30 Jul 2026 11:12:42 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (131.197.81.34.bc.googleusercontent.com. [34.81.197.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b124e4sm21998197eec.6.2026.07.30.11.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 11:12:42 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: will@kernel.org,
	joro@8bytes.org,
	akpm@linux-foundation.org
Cc: robin.murphy@arm.com,
	nicolinc@nvidia.com,
	cychu@google.com,
	hhchung@google.com,
	amitamishra@google.com,
	marscheng@google.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 0/2] lib/sort: Clean up sort_nonatomic() and sort_r_nonatomic()
Date: Thu, 30 Jul 2026 18:12:14 +0000
Message-ID: <20260730181216.2709088-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_111244_034519_9D2E210A 
X-CRM114-Status: UNSURE (   9.53  )
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

Remove the sort_nonatomic() and sort_r_nonatomic() APIs from the kernel
library.

Currently, the arm-smmu-v3 driver is the sole in-tree user of 
sort_nonatomic(). Because the array size being sorted is small in
practice, there is no real risk of triggering a soft lockup. Therefore,
the periodic cond_resched() calls provided by the _nonatomic variant
are unnecessary.

With the only in-tree user updated, the _nonatomic APIs are no longer
needed anywhere in the kernel. Removing them effectively drops the
wrapper function and eliminates the may_schedule branch from the
innermost loop of the core sorting logic, slightly simplifying the code.

Kuan-Wei Chiu (2):
  iommu/arm-smmu-v3: Replace sort_nonatomic() with sort()
  Revert "lib/sort.c: add _nonatomic() variants with cond_resched()"

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |   6 +-
 include/linux/sort.h                        |  11 --
 lib/sort.c                                  | 110 ++++++--------------
 3 files changed, 34 insertions(+), 93 deletions(-)

-- 
2.55.0.508.g3f0d502094-goog


