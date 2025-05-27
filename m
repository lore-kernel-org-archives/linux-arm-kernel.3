Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BEDC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 14:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+M4G1HOIYzO3zH6634YUQensr31XqNL9E1Ubp3gcMeM=; b=xATd3OYDiVKeuCNcT1rUeadou0
	zHjN5SNAiqWNXFGGVSHOJbU78ShgO/rJfy9TclpyiDfNN/CrYtkvg0UNgZtbuB2fUvBtV0QOat7wy
	6qGC6sybvp18XybfUC+A++NsCfjZQBDhSczbEg8SCoAqtx35AUYiAzSOHk6igFHaOeD93S67Qi3PV
	a1eQbJQstNbZX8etUmOaO0M/GF4Se1qaKI5s4ojjXkG/hlI5NBkw1xgWOUpi7HOo1c65jdsOjvkt1
	wKjMWDQvugJF58wOu6qMiLfCFfcp+4JYk9o8C6SoBFX4eb+LU3BeGKzUsiG1IKpqxndVuu0f0SM81
	iPif2Orw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJvHs-0000000Aw4q-3odm;
	Tue, 27 May 2025 14:28:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJvEW-0000000AvXH-1Jdq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 14:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748355886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+M4G1HOIYzO3zH6634YUQensr31XqNL9E1Ubp3gcMeM=;
	b=WlPfFDbIBfnW2bWx6PxCLs9Ed/G6tDTdMKMAwFjVzMfl4CSm+BdxJezMvue+BfHxoJXh96
	lPIw/CSA1zqNp7C9NmRh+o9VwOgT69oxRavLfwT5xzoE+Hmsh2pj0PvV6qTq5QUxHGHluo
	2E3d7t5jko5Mgufqkmc58ApyIId8yT4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-TiCJ85u-NTOI4a1orsMNmA-1; Tue, 27 May 2025 10:24:44 -0400
X-MC-Unique: TiCJ85u-NTOI4a1orsMNmA-1
X-Mimecast-MFC-AGG-ID: TiCJ85u-NTOI4a1orsMNmA_1748355883
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so23373655e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 07:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748355883; x=1748960683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+M4G1HOIYzO3zH6634YUQensr31XqNL9E1Ubp3gcMeM=;
        b=Ijk4TjzqQOJsztOqciEJZ6HC3x5sTmgW7+1qZQ7uWZGOi1fCBIRd7Z/GwGmpjiP8fK
         faLZtvRa8spFjRj/sFRzQGjNPdpE1B4hlUzQ4wk4+G9jgiVO+WxI41TjTY1BFWsnkRCU
         6TTZglxdUZ4hmiSYM0xrRxjsGVeC2sYSMR0iehdlWGnKVuSZAABrrwHrs3ly6F7qvAQk
         wwmCagCEQ79sDYWrCPgg84s33Ufl+CB3q2Z3QgBMNOLfv0d1h6Og9RvCPdDVebEB/tiP
         +k9z1VtjlZ78A6/9ikZyKe2y1bA4xOK2SgXsjlDT5tYtdMsDaDIbwl9uRbiGY/BhKKL3
         EJIA==
X-Forwarded-Encrypted: i=1; AJvYcCULW4gqKVzUmiTs5TfDMBtMnNzdW2M/jyu/P/p42y8yg4fm47YbrVfB4iATTIGmqrP5ApOH9XmtIMriSVVfCjLE@lists.infradead.org
X-Gm-Message-State: AOJu0YyHBDfxn96261xdHOTxUxyfEzbLY7DEsITyzJxtWaSVkUyzzwrZ
	WfAzK3szNcuPkfOuQMFKmj6+PlkS+5WIfmmVDCQ9FUfNq9x7hVgryIfMlG4BzJ3/GXv5EL/vQPr
	OijsL4Zacdv474PUo5SF6ruiUowJBPpexZTdgwT/dI8QDUbmWXDinp9M+gt87Og5eeO3C0UlHXM
	yG
X-Gm-Gg: ASbGncu+YiaCBhhFbS76HBzL/57Kjyan+ESDXVdgM7OdVhK8HaLbT9KOhEI4yOkOo5F
	hl7uLpOwn8/Bz/oicbDq8A0/ksRueNTe0DICaRJlZPB/v5ezyUObXv0toEFNEUwboiNoZ5uuVjV
	AgZioQTAfB1f4UktB7NQCjOIitLtKDmgjYBiZ6CtWvDiehjxAWVYcHwr3Z9OZXqVYlHhDusK3/U
	Y7Q1pFxxLc9bCKY4P4A7gpWkVoRF/CTzEXO0AMKNXbDf9TTOfROxUYURm4oAEE5tdIz4AhpniDq
	ROJE3JrLdnV3hpjcD3TJRVQ4SS2vnaBJSUzCNxbmJ6vlO5qYPmkajTxkIr8SCRrHsDRfWUCudQ=
	=
X-Received: by 2002:a05:600c:3ca6:b0:44a:b478:1387 with SMTP id 5b1f17b1804b1-44c9465c97cmr126923815e9.17.1748355882713;
        Tue, 27 May 2025 07:24:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2Y1uyM7+4XnYXdfaOr89AGuzVgzEd4y5M+LgOhzm3Rp5mg6OEofI/yliTAkfcRwsyfx9W9g==
X-Received: by 2002:a05:600c:3ca6:b0:44a:b478:1387 with SMTP id 5b1f17b1804b1-44c9465c97cmr126923535e9.17.1748355882319;
        Tue, 27 May 2025 07:24:42 -0700 (PDT)
Received: from rh.fritz.box (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3edcsm278766415e9.20.2025.05.27.07.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:24:42 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Cc: Colton Lewis <coltonlewis@google.com>,
	Ricardo Koller <ricarkol@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v2 0/3] KVM: arm64: selftests: arch_timer_edge_cases fixes
Date: Tue, 27 May 2025 16:24:31 +0200
Message-ID: <20250527142434.25209-1-sebott@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Cdmh1_l_I1QFIafyJaEmsnPqPdFxFM0akzTfRN_1d2U_1748355883
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_072448_421258_D02C4B4E 
X-CRM114-Status: UNSURE (   9.32  )
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

Some small fixes for arch_timer_edge_cases that I stumbled upon
while debugging failures for this selftest on ampere-one.

Changes since v1: modified patch 3 based on suggestions from Marc.

I've done some tests with this on various machines - seems to be all
good, however on ampere-one I now hit this in 10% of the runs:
==== Test Assertion Failure ====
  arm64/arch_timer_edge_cases.c:481: timer_get_cntct(timer) >= DEF_CNT + (timer_get_cntfrq() * (uint64_t)(delta_2_ms) / 1000)
  pid=166657 tid=166657 errno=4 - Interrupted system call
     1  0x0000000000404db3: test_run at arch_timer_edge_cases.c:933
     2  0x0000000000401f9f: main at arch_timer_edge_cases.c:1062
     3  0x0000ffffaedd625b: ?? ??:0
     4  0x0000ffffaedd633b: ?? ??:0
     5  0x00000000004020af: _start at ??:?
  timer_get_cntct(timer) >= DEF_CNT + msec_to_cycles(delta_2_ms)

This is not new, it was just hidden behind the other failure. I'll
try to figure out what this is about (seems to be independent of
the wait time)..


Sebastian Ott (3):
  KVM: arm64: selftests: fix help text for arch_timer_edge_cases
  KVM: arm64: selftests: fix thread migration in arch_timer_edge_cases
  KVM: arm64: selftests: arch_timer_edge_cases - determine effective counter width

 .../kvm/arm64/arch_timer_edge_cases.c         | 37 ++++++++++++-------
 1 file changed, 24 insertions(+), 13 deletions(-)


base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
-- 
2.49.0


