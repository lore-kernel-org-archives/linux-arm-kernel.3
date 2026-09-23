Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7205C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 16:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ptp1S6PEvwhlOiXeXKp9TFp5hhbpIwPkATNA+GKV8f0=; b=vGmh8kQ+agUog7Er4PGA3a95il
	1EMOVaRxYFILaQEGLpS92d8gxmjjQHKfcj79SzufGzkysIuDTjyN/DaY4uY8NTRMpQiHr48dfN3lB
	EO6CCIsNkGhddcyDq/ZqORqWC1pngUu9TF3qsbk6BE29coHXRZIYV7hoir+JRY1KoxzgRNpJhqhLB
	qOuPEmVeoZdJ5oTpqz+VRqa2+geL62K25yDmQT5ArcwgOVfDvUZH+kBnCM5otzYnKVKUPHs5mJSNa
	cpMqpek9jfG4PfRB4eUSIosjwIuJISkqAz3E4/1OmRdB3C4Xu4tG8KR9TfUqPH/5cR0fBeFd6p1g7
	G0QtlJLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Pai-00000008qd7-2IVU;
	Wed, 23 Sep 2026 16:13:05 +0000
Received: from mail-qk2-f43.google.com ([74.125.230.235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Pad-00000008qcA-1ki4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 16:13:01 +0000
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-530301ff353so15136751cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 09:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790179976; x=1790784776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ptp1S6PEvwhlOiXeXKp9TFp5hhbpIwPkATNA+GKV8f0=;
        b=oABxZBfI9wyJG/hGmv+A6I76LXIYYjNQTsYzg1sYd/ftvqy5SGIGClpgDw9hglgIkE
         UiJrB8COBD2orbrtMijl7voR0KMJvrIwbz9llHJQ0gJyugUCsgL9qstdePU0zBgHBhuO
         okJ0Ngw458+X34xuBAlLn+9g1lXrXcf6eUo5mjw/hnSONNCdDfDv2gq0T3qLl3Znrw/W
         ohq32jsHNgdsUvtALGP1wY1rFNviGGIf/8izOD86CSJ/mptudJj7LLMrpzhSczB+o0El
         Nga7CEG9i96XJLuXh/gWZymUhhxEXkiKrSjqIrQn+1lOw2QJHVmHYKgaFyatT77YayN8
         EaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179976; x=1790784776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ptp1S6PEvwhlOiXeXKp9TFp5hhbpIwPkATNA+GKV8f0=;
        b=gMVQ7Qu8JIwHSEoY4XaIJp1dTLOr9JpefbL9w1fNxs63Jnu72bnFPekl0HITa9dM/K
         SuELN8TZID0J9QGiqEo1AM2KZS1KgBvxaxhrT7SAO+GgvVXxUGSII9Et6ONFJNNAoGPe
         Z0zz+D1ZzLYJdmHvn0zolTN11i20QtYkC+EA43YrayyMZXh9ZlozQjtwoTYw1pJJphAL
         7NOhtvRrYqeEJR1qiE29dtWXC+kpCx0aG0NboMpcw/OheyN/UpWitOUDC6La8iEOK78i
         BCVkJUiaxeJFbSCfWt6tOJiR3vZDsMgQKzBT7FWSk0oRquBJSfHy81OL1sr1pa8BoEqj
         Ph2w==
X-Forwarded-Encrypted: i=1; AKwUvBylIig3H7DYSVHolCgKwxra1z93eureFAyMK829C8ZwtkQ3Kp4/Pp95J15yd33QLjaRyskAYqu9QFSV/WRdmlfQ@lists.infradead.org
X-Gm-Message-State: AFuF++nfF4zMbYpyunENKKp06bjzIrVC35cPBw8tgpdf/cMpXEpRdcUT
	tCqelSY4eoT4ZY1wlfUkzMai7BylhHNE+jtXbcJZIUOkBuTaRVyA8x/U
X-Gm-Gg: AYBFou0q+QB+13ukjAWe+yI8Zxr71qqnjsZ3+tz9MdHXyxBZ+Say2yz98SCk6JqU3Af
	r5IxAUO2pWOD3LT6WVm3JNyQqjSVmddp4/o4Jn1Dk0DMmy2OcDwSgRjAApZLFlnOSTyZXWyPMH/
	6rpTcrVoAdd0lbQ9sL2JauPY4aM16+c8oQG2mnhv2ail/qFE0H6BsiT1y5+TSEuhgikM9kNrVcN
	ArD4NZy1vpAMgr7c0avk4EYMEySqH/ArDY6sASWdb1SG3izaK9buld/iqYqsZEL3AngQzUjpINt
	lhiBMXIUwBf+laj+lKZ9U4q4P7LEdDnQ6nMt3qn0CmHfhbrt4o+HL16o/P2s71s/95Ov1T5ZqK4
	LToNDVmw5QZ8YgfAmGDxLPrHD/nuvPZvqykkcZdKGWDxhHqMC7khJhDyuW4ah7MteBAvwYlQaVv
	Nne4ohhqXcphSpT4foUzV98Y24PQcfvzrdQ1kNSo5CBnuQXEb7xINdPPCNKfj8Ogej39mVATqb/
	cFe+ak0AU0sEmnyZ29E0LHrpGaszNlE+w==
X-Received: by 2002:a05:620a:370d:b0:93b:d7a0:d9db with SMTP id af79cd13be357-93c2520e6a4mr500584785a.53.1790179975757;
        Wed, 23 Sep 2026 09:12:55 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c248223dbsm259134385a.10.2026.09.23.09.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:12:55 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] ARM: socfpga: Fix OF node refcount leaks in sysmgr init
Date: Wed, 23 Sep 2026 12:12:37 -0400
Message-ID: <20260923161248.586695-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_091259_910728_ACA1B170 
X-CRM114-Status: GOOD (  12.56  )
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

socfpga_sysmgr_init() looks up the sys manager, reset manager, and
SDR controller nodes with of_find_compatible_node(). The returned node
references are used to read properties and map registers, but none of
them are released before np is reused or the function returns.

Drop each reference after the corresponding mapping attempt. The MMIO
mappings do not depend on keeping the device node references held.

Fixes: 9c4566a117a6 ("ARM: socfpga: Enable SMP for socfpga")
Fixes: 44fd8c7d4005 ("ARM: socfpga: support suspend to ram")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
 arch/arm/mach-socfpga/socfpga.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-socfpga/socfpga.c b/arch/arm/mach-socfpga/socfpga.c
index 4332af2d8b862..663765280d0c9 100644
--- a/arch/arm/mach-socfpga/socfpga.c
+++ b/arch/arm/mach-socfpga/socfpga.c
@@ -34,12 +34,15 @@ static void __init socfpga_sysmgr_init(void)
 	sync_cache_w(&socfpga_cpu1start_addr);
 
 	sys_manager_base_addr = of_iomap(np, 0);
+	of_node_put(np);
 
 	np = of_find_compatible_node(NULL, NULL, "altr,rst-mgr");
 	rst_manager_base_addr = of_iomap(np, 0);
+	of_node_put(np);
 
 	np = of_find_compatible_node(NULL, NULL, "altr,sdr-ctl");
 	sdr_ctl_base_addr = of_iomap(np, 0);
+	of_node_put(np);
 }
 
 static void __init socfpga_init_irq(void)

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.43.0


