Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AABC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 11:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xW5d22AyfE5WGuuD+WsgObkxfatUVH6GU6OG+OuxcAI=; b=saNCQtd0ha0DEAALvPaemn438P
	toe0+8lBGMMLzgweaxj705rzG7sM4dGZlpKlUBsMVjFKRL8QD2//1z1UGzI/Rzk5Pa5E5lk70zDLC
	YGvoogbJDoVP3cePrUK3ypm10ct0EWuYS0PSyzH4iiJ0ulroE01HBZwmmTR59Up19mefdiDOxUIKh
	yvMVUKT41uZ7WZoGDevBczaxg7kDYJNVqK+dw06UqVj7B3nkNhWkD9cMTsiVJDUlCCjFSEeYxyGoW
	Fu+/Q8LP2w40vWIGZwYJXsLlNsnBKgjNHRrPIE8JotoyVXw8s2qk9opGXwfcFmCMKtUx1h3dVlk1w
	noaK8NjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEnYi-0000000CDyZ-3vxC;
	Tue, 13 May 2025 11:12:28 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEnWd-0000000CDlM-0j8p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 11:10:21 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cf257158fso37641475e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 04:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1747134616; x=1747739416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xW5d22AyfE5WGuuD+WsgObkxfatUVH6GU6OG+OuxcAI=;
        b=xYDAVyjyvWUE7bISXzQI27cV9p4jYjZ5zRymAz6tpEBw6arGmad9c6dEoKyEeKZcua
         3v83MR7KYbLfiJb/gZRIQC0+M0I6jhtgY85O3QKJL/mIgExkDzOY+9F0dvwnfPM2QSt9
         w88SVko1lEhBY84jfOashLGuvXQ/rUj4yMo1l78WUyr6yHoaMMYutqnNVH5Jl1BRH1EK
         +x6FSNxZ3EF7JEjnBzlAEOPJNnxOacgLfQlpdcH5FBhEQ56ADekKdQ1fsXreDcxmApcq
         zkVz//iianVkHleJ86V+Wmq5J9C5WoRLaKl7hGbMf/Z5TAkWeQ9MmdAhVwv5RJ61nx55
         EjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134616; x=1747739416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xW5d22AyfE5WGuuD+WsgObkxfatUVH6GU6OG+OuxcAI=;
        b=Y7YghaS9Qi6FkD8Vx6s1pFXkFNHya8k6zi2+VTDRc70ns9cSeuT0bl4sx2i035MrNs
         8NPJj8MCGxTYkfnXIP6wNjlNmnqVQ3C6eZ59q9C4Y2WIw+6GWDQTUvwPck+V6kRTyqOx
         Wiqmm10WZuCzBWJNQ3hXIps7Dw8doNtB6rej4mF8n+FS91fPk6ooxtho11hMoHLGyxeI
         v1lCK5kwhK/pPmyh95n0RBHBpTpgky0JSIjcFrVU740dW9lEcIsfKyEy5UyYMhI6lPOy
         SQYURWb8rcBN/P2P65oS+geoMNeaZL6p8U5kBooSKjntGpeqdLTwNn1ccWyOvAhC1n0G
         RYgA==
X-Forwarded-Encrypted: i=1; AJvYcCX18/mkkc2gc3/MfwwXadixfVUtLTVawqza3TA7fwfrnInLmcUXCQXoYA+v/oaMWbUhP0DOxV/rOjqjASlEkvTK@lists.infradead.org
X-Gm-Message-State: AOJu0YyHxc3rQm6LLDx+PAOcyAWKlsTZGIhnlyCkqb6ibF0g8keC+4kA
	v8KYd6QtmyAiEspvdR3MsyEFTIJIggAhv2yg/k3+sxu4Eo7Q3HOlxjY82E3DkoY=
X-Gm-Gg: ASbGncselTw0pJtiZVug/SLb1Ln0xVs/ZYxdn26YHkIbl6KNSOrAVu2MJwN1zdhep4G
	OGVbyalol95Oay9dXmInQuWzXXkj6rdL1MYMXvorn0U1btqiB25Im43f1BPzM4YNZh+jhg4n4Lr
	GCgaXQ9uf9NrxhgX6ovfro10DilKwuZGgtV5gn1DhZ45569OVbWSG989IFOI0z9wC45sQkLiTDw
	ak9UDw1WF3yoEEl4Xki68/DxbMvsjGqCp/5iAJGCxSV1n3qwaIUoiV5q4sBkGt19wIsDBHxPqa0
	Udi6bSBDFNnN/XtzxRqzpzjkQXKxNS5qa+lsItIIx2vBMk6JfqD3Psh1k9dlXnVCpI6P+psfXdl
	Opz92RiDJaqo=
X-Google-Smtp-Source: AGHT+IFuIhHmYNLqyH+zu54PArNHeQDifEpT6IgxsW2fAt6qVuFPJEi1RiNOKS9sGvGl0NdPBZRNRQ==
X-Received: by 2002:a05:6000:200d:b0:3a0:6f92:ef7c with SMTP id ffacd0b85a97d-3a1f64314c7mr13612076f8f.17.1747134616347;
        Tue, 13 May 2025 04:10:16 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:849e:fc74:c88b:cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2d3sm16077941f8f.63.2025.05.13.04.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 04:10:15 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: corbet@lwn.net,
	suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	skhan@linuxfoundation.org
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] docs: fix "incase" typo in coresight/panic.rst
Date: Tue, 13 May 2025 13:09:31 +0200
Message-ID: <20250513110931.15072-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_041019_417304_8C865EF3 
X-CRM114-Status: GOOD (  13.60  )
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

Corrects a spelling mistake in Documentation/trace/coresight/panic.rst
where "incase" was used instead of "in case".

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 Documentation/trace/coresight/panic.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/trace/coresight/panic.rst b/Documentation/trace/coresight/panic.rst
index a58aa914c241..6e4bde953cae 100644
--- a/Documentation/trace/coresight/panic.rst
+++ b/Documentation/trace/coresight/panic.rst
@@ -67,8 +67,8 @@ Trace data captured at the time of panic, can be read from rebooted kernel
 or from crashdump kernel using a special device file /dev/crash_tmc_xxx.
 This device file is created only when there is a valid crashdata available.
 
-General flow of trace capture and decode incase of kernel panic
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+General flow of trace capture and decode in case of kernel panic
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1. Enable source and sink on all the cores using the sysfs interface.
    ETR sinks should have trace buffers allocated from reserved memory,
    by selecting "resrv" buffer mode from sysfs.
-- 
2.43.0


