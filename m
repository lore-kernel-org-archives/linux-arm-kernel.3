Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB36DCCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 06:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=; b=grd5ouWg1hQknvx2AdZ7zxlHPh
	OjJQIFIxXJFlGgp5VmGCWQ05OnbhlIt0Dq8JQjuVGU7EYjOVfPrmMLhT7YYzV+dOlbIJvOBwnM/T5
	CqdAxN8b2x+1rFhsOuyCxi4FSKvXz9wF4U4JKUKjQyjVDL+MJrj3QuF/7SF9DcwlfXrgfgJHF6u5X
	kciPD9XgAPGnLtiNk9PwbdoV+7seVX4FoLV954VBcf9dk07/vG8vwb8AGQKcIoDN1Qwz3c97aNgEG
	gNwLVealKBEhWsP2QZMehq+7PGSYPv41HS0fYuhMJdRGjlHH/y96TDLfFnNDo5mvzjTa19HX3fVkm
	HgD6hLqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbGL-000000026Hu-38DC;
	Fri, 16 Oct 2026 06:17:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbGK-000000026G2-0xdQ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 06:17:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=; b=pu93NbLWma1+12xNiAZ6PhJj7+
	fFpVWE7bV9HAbqxcsYwW5OXGL8ECqHRhsxDKTDFadkTEXsyrJN/MHFWx6TnS/SSSt9fHbDxUau2nf
	8dFr3suP0iOpTboPLfZkOyq9TXU+ujVjIBwCrHNP0TPXIcHSCjwKOpVzXz4BI/O+456a+j3FuSjt0
	BlJjWh14hUA+vlaA51esZdfGdp6HxEe39hzEo43H9DlNopmATuv5F4xtBIlFoK6cLeBcgsk9o2oXl
	wRtEMfZCu5yQW7eZydYnONmA1BPdQpPYCFxq5EMuRZHe1y7DztrjDoRtjVq+KC4rtqSIb54Ptg3Sk
	c6QotvKw==;
Received: from mail-pz2-x0a.google.com ([2607:f8b0:4864:3b::a])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbGG-00000001SDF-1HT2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 06:17:51 +0000
Received: by mail-pz2-x0a.google.com with SMTP id 41be03b00d2f7-cd5cd8e8104so622813a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 23:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131465; x=1792736265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
        b=qYkfzWew8phzI8+fGLWG54hKmqZzMkgOc8wWznzVXlApKfCS65xsAgLKBfR7ZxOmk6
         UYvn73tjgi/Favpi3CJPqVGRKw3yaWDZ1ndN/jM+8+RL74eivnSPC8iFWD/Tb9vm8Zew
         +cxUdBxJch2tpSIqPYHZjefp2Zz2wPpxCEUpCghfjewO1MfXqgJUmsduVQ9mndmpw/oA
         k3W2z39moXxhUTZpjCc2mmyZdoPKzgv8gq0UxW1oqshbYr/2cF9Yx96V2RzdHnAPYHym
         4X0I8RSsBujrd0JexiqVRNeHHG1oazEnPrWk5gsnjnN1NIRzs5WdxmUb47Rsu7DWKv7f
         ZTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131465; x=1792736265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
        b=YwTRpkH/RDmLtJhBdDgbFNL9rkhi9Xwqvt5sF1vaLpwUqRiG+wlQsjwuICJQTaa3DS
         ErudNwArWA6L4ZoKj3DW6YVESMUMuvg7Wnp/DIFv5JC8Le59grG/C2c/2GCSzalvM8I6
         D0R12q120NNRg/uO4yzk825hFdd9jfth4u51m3FDnGBJNheYeYuEpksVg9XcukJlY8yi
         YMIVIfR1hDxzVzujkumn9RoR9qw2FiCNQqjmO6HidCIoq00PBw0TvnxUfWWc1R8KlyPy
         qBqnuLy1q5MaG5A2dyhgZHY/X/t5ZZrd+jVeY6YqmLg5pa/8Yq0QwPjZyU1l5njDqvy3
         CJKg==
X-Forwarded-Encrypted: i=1; AKwUvByu7daAFzmXG19cwX8a5h/x/U4ai2UZCokwHiun8k1qIJ/qztibUgVR1r+6pJ+xRYjFuOvO4HeQvh08XRcFYUq4@lists.infradead.org
X-Gm-Message-State: AFq9FYIzzseYQpoDhVTamtKwwuEO0AW8Hb33lGb8OdHjHZOub1K3oF2R
	YjjCoUmMdiXfsLt0abj7ZCOzCr21jPoSCWPcdqZdCLAMUYsM3ECQG8r1
X-Gm-Gg: AYBFou3/YK5F08tdZT0C7CpS3V2DUUZvW4xhD/O82V3Gpv1AmTg9MF555PsHX/2I98q
	yd9oys6UHXBE7/7HU+/rr5gH9lgnKdbj9D9nzMrYhSrAMaasU3PGFXW1ShTVQr774V2eA7r2DEN
	S0/mQn9verXnzT74JlAYFtLPAtgPUSrInzM2wlWOP62FXbw9qfbZZMhLnUw+teuZlr8ntljrrwN
	fWlW1zelcQ/N3JuejO7vEysPJOLGq53jBmyb9vomLfvSI7OFBIbuRGupjMGgwcO/Ul1ae5ABGzZ
	q//PMzsy5G5bWjjLg4BseEeAIKIMC3rsAgNoG5VlGZT+kbxrLaK1Eq6vieMctfVFUID7eFjm/Bj
	LxTwq7qnNKFPFKO3mwD4Ae9pShAc6H46owjCS6HgiuagvRje+FbXYRiH3YJ1UjiDw/0O96pHjdK
	C+RUxVf5dSs1z34LsMkICogQPSmDN2YU32REszngYByvB2BHZIdGnkoqINgDo7qB9dniXyHqLnD
	hjppeWL1LgGjJmx2pk0LA==
X-Received: by 2002:aa7:88c2:0:b0:886:cae0:fb64 with SMTP id d2e1a72fcca58-897c700e74emr16786375b3a.31.1792131465299;
        Thu, 15 Oct 2026 23:17:45 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:17:44 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [RESEND PATCH v8 8/8] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Fri, 16 Oct 2026 14:15:49 +0800
Message-ID: <20261016061549.4181390-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061549.4181390-1-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_071748_363833_BA0A0EB8 
X-CRM114-Status: GOOD (  11.05  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Reserve regions (for GPU, DSP, ...) carry no data useful for crash
analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
reduce vmcore size and capture time. crash_should_skip_region() now also
returns true for MEMBLOCK_NODUMP.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index e161c8b65e00..0e2ddc933b22 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -283,10 +283,10 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 }
 
 #ifdef CONFIG_ARCH_KEEP_MEMBLOCK
-/* Exclude NOMAP regions from the vmcore. */
+/* Exclude NOMAP and NODUMP regions from the vmcore. */
 static bool crash_should_skip_region(struct memblock_region *reg)
 {
-	return memblock_is_nomap(reg);
+	return memblock_is_nomap(reg) || memblock_is_nodump(reg);
 }
 
 unsigned int __weak arch_get_system_nr_ranges(void)
-- 
2.43.0


