Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBD0C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 07:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nb5Q2Se78rLq0fXFEmBN2MgTVK3UgvxyIXmhlVfKh+w=; b=p0JS+pW4mw2+ntiLaNiz/Zol7e
	OAQnO53uWaZk+bqsrtxnMuJXXBxMe1tPHqxFDnUWguWfOrkU0BHhxaPjIGO1hROLlXbtf6lz4fCcG
	Ca9eJm6/ivwKeuPYip71G3PMX0V4x9Ij2gjvX2T98lDlBscKtRWmjN/Img0BhiQiobe7PG1dxx/xQ
	4kKHc/ckUg/PhB4c9sD/dBzR7OXu/8ZSoGYo4wcM1jxuIp/BuNzj7SBiuUsMinuWgkFXoEbwlvs4W
	kiNPpiz5Q0fydFNfAT5k/A6QUBaBYMjJogGydJdQYQgxE5nF3YyWxEPHiS2dbokxX5SnZ1oh45ZGL
	yZE3mMAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fUr-0000000DxPj-016Q;
	Wed, 02 Sep 2026 07:35:01 +0000
Received: from mail-pz2-x0b.google.com ([2607:f8b0:4864:3b::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fTc-0000000Dx6o-0UhQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 07:33:55 +0000
Received: by mail-pz2-x0b.google.com with SMTP id 41be03b00d2f7-cc1cb94b583so255266a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 00:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334423; x=1788939223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nb5Q2Se78rLq0fXFEmBN2MgTVK3UgvxyIXmhlVfKh+w=;
        b=F7MXSFNQC7lN7mWAImdv78D2wRBdtBQwMR2uldOxjj6ia1+HqbiETEtq3JdDyTM/v0
         lcuQNxWzjgmkWEpF/lG0MURaQyN91w4pl71OrunzIgV1OSOzSDzkITmriOsW+STQ+wsf
         A0vGwgg5W2Pc4ovLiKX0EnTmQjQk1UzwL1i7m1+BKAothuVKfyfwBta61VA2GBdMhlWe
         44HGpakdWFGan5XKvXWoAD9cMOhHWiCw6s2G8Lo+iy89bSp879oePLdt3cEk/gExs0C/
         DUiwcuk5sIdjLNJzMtBYj2IuyKhrXx8cB4cmrdMAjsfsWRka6pKYOZpLphOD0+pbS3zh
         MB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334423; x=1788939223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nb5Q2Se78rLq0fXFEmBN2MgTVK3UgvxyIXmhlVfKh+w=;
        b=ZzVc31vy0QJLrPfnoh94/j8zqAmwhm56gLJ7RCK3iZQG9Tkxc/ayS+2xvG33TfspBx
         dUDPzN+Je1wADxvJTP2vzxutTqZ5I+PTXtfPD4rFs0ppntgTR6cX4d4HZ5r463yONlb6
         3qUcosncBTzXWi4WjmVRznArBCXCfWRGbyz1axXM/1skOwMdq5l+t9/8yMAVE2L2F3GX
         tb1w7PAcwLRDoFweYI264A2g/EN3wvqdXV1mIVwDSJ1oUYkIsGFHYeBOuRgKXGnBhzng
         s1uch8jN6RaTTAGNIF50QeHyjXj9Q5yH3hPSssSbQjX6Xo1c3LgHpV8SbpYJI/otM5xL
         ngjA==
X-Forwarded-Encrypted: i=1; AKwUvByYi/v3diAf41HcjeJ5zWWNSinpUN1doYB8MqwRai+9POxlzx/6xcMFMwfdIC06fb7fT66m6RGwjtYD+Tja15Qb@lists.infradead.org
X-Gm-Message-State: AFuF++l61y97BPWC1z5k1joE+X2fdzaheUOr0PuWVR1UmADRqpqJPRfr
	jb63TQ7MpIQtM20zSj9ckX3SvRCIE6lnytkBpBU1ATCOnfA84iQcSQN8
X-Gm-Gg: AYBFou0E5E8x5mXzoVmiFvKUwdte4n+Ac8Twppw6WoT+zoaZpAT4Ve0MD+HLa3jMh8n
	VOGB2dku1BYDDIIeZNCed4MLuH9nBQ+FKHCjUHykaxalupanbI9YcDq4RMB/wY+XcvwpXCKIx0d
	XDKpKfgLWIkOIfLF8F5hUY31zlwZH4tq3i72gOjt3pCtvliKp9aNN0C5M1hEoAR9PSvkXXwdXYv
	+uLLJpmhIQa+rhT/B7FeeYeWVrtHtTM5USycdGREOwspKsSbL+DnlXvbNg+Tu+Ye6qELiKatARb
	D8Ek0XySI4mhchKZffWS2yoFXctY5JgCwXvkWn+Xvw6OeeZBE5oMjiWVxfWm32D6PqQQ/uZ3lA2
	iVRhWRiYcZtAv3PtWqItd7qDngePC7cjgZcaMj/QueLqxYTb3q9HH8BhWQSnAedxZxMMBhyWo2t
	KelGdtL9vhlw0LCtVBI+x/zLAn98EMgvQRFbkmPu82Mcjq7QXAvW1ythvlUxMIjs/hIJHfSOOO
X-Received: by 2002:a05:6a00:6ca9:b0:84f:77cc:63cd with SMTP id d2e1a72fcca58-85ed4449927mr5116039b3a.17.1788334423379;
        Wed, 02 Sep 2026 00:33:43 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:33:41 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com
Cc: mark.rutland@arm.com,
	kernel@xen0n.name,
	alex@ghiti.fr,
	hpa@zytor.com,
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
Subject: [PATCH v6 10/10] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Wed,  2 Sep 2026 15:31:16 +0800
Message-ID: <20260902073116.802752-11-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_003344_685403_7C40312C 
X-CRM114-Status: GOOD (  11.62  )
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
---
 kernel/crash_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index bd64cf585795..b0e618e13588 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -270,10 +270,10 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 	return 0;
 }
 
-/* Exclude NOMAP regions from the vmcore. */
+/* Exclude NOMAP and NODUMP regions from the vmcore. */
 static bool crash_should_skip_region(struct memblock_region *reg)
 {
-	return memblock_is_nomap(reg);
+	return memblock_is_nomap(reg) || memblock_is_nodump(reg);
 }
 
 static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
-- 
2.43.0


