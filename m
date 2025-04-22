Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14536C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jy9n9cFpVQUkUpiWIEsm4sdpu3oKdgg9Qw5HeontsNc=; b=diVUFf3wCmPx0ihITifGvunF35
	CKYJwWAUYeLPIZiabNQapJ8DhmzJx0f1F+tVpflhvGk/1WAQAP/SJ4NS/wyek9ZvTqLJjwy1HSTCH
	A9LYv6wXH4BFlWerMVayhUs+xGvuQTGiIhTThjpCMpqFdSmuvssIjJHP9RMZTn1Tbz4KSGs+IMEpz
	ylZmygkfRVCvae24n64bFDS4j9MGRc7rwJ9dVPrAdnZb1BSIBjT03An4p7fKUrDugrW/6ubxwjtN0
	+ALv/FyzuhgKer7lY4/npWvNChibaeWaHsEJfJGd4x3DkeemXNvgiVkv5lo7AP9gmYUfpjKloQAFM
	dVqHcgeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CbX-0000000754U-0GZ7;
	Tue, 22 Apr 2025 12:19:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BrR-00000006x58-1fgU
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 11:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jy9n9cFpVQUkUpiWIEsm4sdpu3oKdgg9Qw5HeontsNc=; b=PgT/U03FJ2gXfdqji9gkDU5Y5f
	FMpPKZLLWYcBxSMjwUoZa3+khpdzMrboFqcpnGaROnxN866irTvDza3H/D2PD7aP6Y5v7rgVWxoCC
	/OsZFLQOfm4soCmm0+txvu4ru5b5Q1/1eM5F34YPD/5SKLmkFrtx6ISHkMecQ7Vc4DWSaKNTmN7B2
	ZWHc+FjBVskbPE9ihR2ZRKvV7O6c6q/Bhb3ckV2zccRXQORyfpKISpiASRGTtqqQmybj4IQcIMPVu
	pAkAeMrOXwelIjQcJIrVS6wLEvOEmHopTfx28KT7rDfLIcszDiLaWFBlaKNU9sI9c50mN6MU4hHXU
	UVdGMbsQ==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7BrO-0000000BCJ7-295B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 11:32:20 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3913958ebf2so4499424f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 04:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321537; x=1745926337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jy9n9cFpVQUkUpiWIEsm4sdpu3oKdgg9Qw5HeontsNc=;
        b=K3weW4XNC5abcFEv3zgBGmN6XEHIL2IaiXHMzLCHb78SAl+4e4TS0x0cvtElMR790i
         vuz0Nvjt4DqQQ+c/UBjV3BdlZQosgKuAnLhM+yRupTdHF0zm69JIR3xgE1TMqJP+N36D
         VbnTv8NRatqGPFqvi3khPGO1XlDMzBKc0rNXM6YksM9bvDEI/NVfdQEZ5xhdEckkDQOD
         QTAI6LYilVrp3hKv7+8+uobLeUpvtpzFtul+Nk55CPLq6DUdbMs4zGsf1c+yJqKmXjBN
         WxHNHVtW8BkaExgJrc9fMwg132YG393zwKkwcoyVJNeIYU20OJlRwSnJ6rRIypMeFzkg
         KCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321537; x=1745926337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jy9n9cFpVQUkUpiWIEsm4sdpu3oKdgg9Qw5HeontsNc=;
        b=kYNwZaCXuXhAcEXMWgAPKOmsrGY5zSV7qyvNCnIlCBI0OiIXpx2Yv/e2cbOCaguIOO
         QyTpRU0ZTRSpVhpDlCBPPUemeUhNWg6f9Xh1tlMgqsmxUBrN801v+CmJjx6rGgBnLlGd
         fVjSGXGTqM0i5Eq8WA0kfr25L4JqCTo0kbYo2kxIrnsKFxxoaf1ezPy4HKQHfalIftd+
         mVn0Gzl5P2iHp9a9/nQvTFsioh8JZ7UOE3/xtSXIaMhsVi7iXbsqkzhrjOlbYSV5LH6j
         gMV3c1WO/7UGQK7oCCXhvbF8EuCA90qwIZnDZuFI42qlVvvLoyloQd04FCHcASZfJ8px
         1fKw==
X-Forwarded-Encrypted: i=1; AJvYcCX7IFdizzRtVaEdgE7CDw6jDAnoSWyJMzpIwnCgGy884Y1Q+kdM1Yn+4PKZK3YfxzrKfcgpreW/B2OuVN8rBAZG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6TXTre5Gcp2m8cxzna75Nf2ugPKkbTTApn/TzacXLht/RCcrL
	rX48bE33SYzbjVE4+/vxV6k6GPgPQimfjs1wU4zblZs5Z1Se1KhCTnyLdpAMMhE=
X-Gm-Gg: ASbGnctnMcUBtHK2BVdVDcdF7N0wxoXfgtME+xNZCMF0Qq4fHPPKNImMVspwLRckGYU
	5K59DXl8i4wAnJ5BPGLEQmzLpA/rjfW86jVCej+Tu0O5vv7pbIN9PEIm5Ge9YuLxqPSG/dINJxW
	eYf93qXmwHxZ9fZN0grRHinJ3srH5ZtwZDUlDh8Hw3eAMaiNS3niwgqGkE0veMBNnOwajp/fkfi
	1+SMTH481WAl6QCVjpB1fXRYmyety1OSG0et5I/WrSC/OmTJDTc+V7yU4bz7mJuw+swDNRBgT9V
	WHJLSmNrWeKu9SFmUQ43JM/Md0Zx8hAkl56Q1sxzcxZaMXUO8WhnhA5gAU4ARqU=
X-Google-Smtp-Source: AGHT+IENApvlIOcfQcL0LZP5BuyV0lmfNKeMfWGxAbuT+pNZSoLQJuZ1V8if61aOzV5wetgPKLvcAw==
X-Received: by 2002:a05:6000:2510:b0:390:f9a5:bd79 with SMTP id ffacd0b85a97d-39efba5a86fmr12045598f8f.26.1745321537318;
        Tue, 22 Apr 2025 04:32:17 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:16 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 05/14] Documentation: kmemdump: add section for coreimage ELF
Date: Tue, 22 Apr 2025 14:31:47 +0300
Message-ID: <20250422113156.575971-6-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_123218_636109_E265FC0E 
X-CRM114-Status: GOOD (  10.05  )
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

Add section describing the utility of coreimage ELF generation for kmemdump.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 Documentation/debug/kmemdump.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/debug/kmemdump.rst b/Documentation/debug/kmemdump.rst
index dfee755a1be1..b67dc166905a 100644
--- a/Documentation/debug/kmemdump.rst
+++ b/Documentation/debug/kmemdump.rst
@@ -17,6 +17,12 @@ kmemdump allows a backend to be connected, this backend interfaces a
 specific hardware that can debug or dump the memory registered into
 kmemdump.
 
+kmemdump can also prepare specific regions of the kernel that can be
+put together to form a minimal core image file. To achieve this, the first
+region is an ELF header with program headers for each region, and specific
+ELF NOTE section with vmcoreinfo. To enable this feature, use
+`CONFIG_DRIVER_KMEMDUMP_COREIMAGE`.
+
 kmemdump Internals
 =============
 
-- 
2.43.0


