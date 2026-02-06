Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2218DE9129D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 03:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mW/EfJpQhsdTtrBsXN3a2TdnMMqaf3m3vrLFSZ1aNSc=; b=DqIkYQuzrHdugV8MaUhWalT3Pv
	X40DOzFFr5LSK97fUc2Nht3uH1PM+P8WfOy4BwNNlFaOr6SgbVR+BU7JqNQPMw2jLiti5/doFhSjj
	QtZtgl4Rt86xatJGxNmLw1GKHHjTmqm8I1tXw9R3P9IdDQpmvvU6ImofCFVhZvwt6cEYSYorxzNNj
	XjMT1DC5hP5Hvch8rzLWCi5g2rbYRBg2ND9mASyg0txQx/+LwddDoaE/eEms0AtzCjUphTRPhv6tp
	wrrvThizE1MI+nJ3Xg0Kn11JDOqvfntgNfQsZqUVnk0+0/QS4kr5n7+29XqMCpUcAh+IlMFcVVIvM
	X+yx6eLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voCru-0000000ApKe-3VjI;
	Fri, 06 Feb 2026 03:50:54 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voCrs-0000000ApKE-2WDz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 03:50:53 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2a0c20ee83dso13756415ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 19:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770349849; x=1770954649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mW/EfJpQhsdTtrBsXN3a2TdnMMqaf3m3vrLFSZ1aNSc=;
        b=CJnWxlhQesN+aJHpd617OrNr/hta0UilFTgXLFMq5OTRe0aWzZC3NBAP6fqdToTdex
         dha+oYyf8T16gNP7Zag6PxmZvsjVWFDGKk/n4/0CP4iwG6Q1qqqxxKuhQRJB31zj7eqK
         x0HZhpv+j9B9j8kAs+CXPi5ePphxvwdFsfaw/3ByGpUA406NQuzgzImEHUTBhwRKHI7G
         fHlemIwtRxinqwJ3faMufnMofQYcMrPEcybT5MOZPPHvJT3aI7yiL+u4EZXVCxP3Rjo3
         +YpaDH/illM6bm4Ls4xw+gW74VV6ZgB+joxnle8vwtIjqZf9ee7sh34EcpTheTzUL2Vj
         JQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770349849; x=1770954649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mW/EfJpQhsdTtrBsXN3a2TdnMMqaf3m3vrLFSZ1aNSc=;
        b=N6vEJzY5771mXbFCuuk++GBNgfAxn1Zfr8V9PGYIgsEw5N25cS396li5a85sMo4Gad
         Bk19U7og5r2eZ1m16RVmVSSejbmvdvCwdi7IZ5Vor1AN54ln4YBJVjfPzsKUXRC8NoXo
         c7/iO1VGO7jlfBlMIoYGRWMlt+FJamlK1keuNTpfAKDakQF6jxqiy2eKbmCP1/uudJBL
         xcZEJDxDOPcLolZcU6MEc3dr/1wn1ALhsVJ1x8XfKSZYt64AoRI0B57C9zBMFLXkU64S
         qHsIFlh7Ok5Pxl9lrmUvt3tv4Ts+BRPokygPkimO0JVRKQ0PRJj81SdZbfCFP67GpYrE
         CUDA==
X-Gm-Message-State: AOJu0YzEkDM77W3vH8CkNEJaF3g6KCPkMhT8MgjBwSxDW+U58Ix5wQsW
	SV+dC/7pKGvplVqtYUGNNdPDYom+tRvWoZ0YOU6nek1/OLC4227Dz68KMGOHCUKT
X-Gm-Gg: AZuq6aKOr5NKpHY/p7Q2WENDUQVDTAvyvYDPf2gyeEKeURTn04HsSvAXJ9rXsLNuLfx
	2Y1Ks2MuLbO6Mzyi/CPc+X+LzqPV9Z9BGccKFAS4KOHwQr1ZYGeQl/jbKdiUSxoYfpPp0ZtDFWw
	qUUvI07/djS+WcRQWbz72v/8chIYaNg/SlaUmyhk8P90ca6+R/reD4qCjB5rNshn4azT8OKDlx9
	RnqHQSK4KK6HswpXCNVtp2JQa1doFUzWsSRkJ+tgXlxdlZUJEkUqGSafh9pZPK6fUkvJANECWLW
	1eAvupkgyjmGT1Xw5m/+otqd4SP423uhbFauhtHa66lSqNJ/QsIdUOHlU0aV6Tj7de4GzqoO61R
	RByfqAXfYmJN8ze6uCM/4+mByPjyLAQwutwXpyHwplwUuDIp9zfkpYpa7EQ57uTkBB4d7IB+sGh
	P1N/G8c7//GHhYJLz7R03TBt8nDuKFIGd87E2MoLo=
X-Received: by 2002:a17:903:11ce:b0:2a7:5ee5:ec50 with SMTP id d9443c01a7336-2a9516237f5mr17121575ad.17.1770349849276;
        Thu, 05 Feb 2026 19:50:49 -0800 (PST)
Received: from PC-PF4KNQBS.Xheart.com ([202.46.41.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c8605fsm8915925ad.31.2026.02.05.19.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 19:50:48 -0800 (PST)
From: "feng.zhou" <realsummitzhou@gmail.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [QUESTION] ARM DSU PMU: 32-bit counter assumption and handling of 64-bit event counters
Date: Fri,  6 Feb 2026 11:51:38 +0800
Message-ID: <20260206035138.1377-1-realsummitzhou@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_195052_640089_0A9268EA 
X-CRM114-Status: GOOD (  11.51  )
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

Hi Will and Mark,

I have a question regarding the ARM DSU PMU driver implementation in
drivers/perf/arm_dsu_pmu.c, specifically about the counter width
assumptions.

Current Implementation:
======================
The driver currently assumes all event counters are 32-bit wide, with
only the cycle counter being 64-bit (lines 69-71):

/* All event counters are 32bit, with a 64bit Cycle counter */
#define DSU_PMU_COUNTER_WIDTH(idx)	\
	(((idx) == DSU_PMU_IDX_CYCLE_COUNTER) ? 64 : 32)

This assumption is used throughout the code for handling counter
overflow and calculating deltas (e.g., line 344 in dsu_pmu_event_update).

Issue Observed:
===============
I've encountered overflow issues when using perf tools on newer ARM CPUs
where the event counters appear to be 64-bit rather than 32-bit. The
current implementation causes incorrect event counting and potential data
loss due to premature overflow handling based on the 32-bit mask.

Questions:
==========
1. Is the 32-bit event counter assumption based on the ARMv8 PMU
   specification or DSU-specific hardware documentation?

2. Are there known ARM CPU implementations where DSU event counters
   exceed 32 bits? If so, how should the driver handle this variation?

3. Would it be appropriate to detect the actual counter width at runtime
   (similar to how num_counters is probed in dsu_pmu_probe_pmu), or
   should this be handled through device tree / ACPI properties?

4. Should there be a mechanism to query the hardware for the actual
   counter width to ensure compatibility with future implementations?

Thank you for your time and any insights you can provide.


Best regards,
Feng

