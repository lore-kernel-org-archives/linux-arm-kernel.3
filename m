Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E72D32D9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 12:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XUe71YecPH7XQ8UJJ5yU95TDCXx24YG8e7+/RrAak7Y=; b=y2Pn9lvMgUHu0+SFn3UN3HWSq5
	tMu4QdVNTkTY/EeTh3wADJRHDtd0HDhI61LSN2d7pGLWsHn4f3/kRcOVGpyv6GAuToVwl4BD9Z6Iu
	2M30ly7CZxdQZK2NkXZgpTQeSMW8uqka35w702/2xCIN5iD3PWxEw9sKDSKBBY5fvjHFPQqJaZ6JK
	cJJHSs323FtNbhcM/WyBEyr4USjXz72Z9lpNxNIIWBdoeeO7aTucuWTqM8xeYIdyobO2pW1J7Ofcf
	L6KUNsfBu4TUS23VhOnw1cDQVsl5bK37N23n+nkYS0KuptWG05jyY8weeGXVdn+uwcK1knqCIauU6
	MrDAVPDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApnr-00000003MYe-2zx5;
	Tue, 12 Nov 2024 12:15:27 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tApAA-00000003F8N-3PwB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 11:34:28 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d5aedd177so3247221f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 03:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731411265; x=1732016065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XUe71YecPH7XQ8UJJ5yU95TDCXx24YG8e7+/RrAak7Y=;
        b=RrcZKdnWprdn5pHqx6LEDNjUvwCDOZG53m5NZy8WdImV9n684eeGAS81/t4O5JR8nR
         nrJsZ7IQqueeCbF7pIF2FwZ7HZg8hyM5kHK234AEv4XbxmY+a4RXaTREwhzyxuwR4Eo9
         wtkOoT866LGZ5O1E3NC0A+Mkl/qyfCmjBw2tLwp5uZmT6xz2JwzjCQsOZik0Vw1r0L2a
         wM2mU/lfT18bLujJnCZJS6qqLrIE+fJsxuo/DWLU2gbpN7GKqWK0h5GyoNOm/28yXmOk
         leiaq8luVs+POXQJuOrxl6/P4gPY6lezGobS977uRss08QPpmHvJayuCx+6sbFd4WMXi
         1Ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731411265; x=1732016065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUe71YecPH7XQ8UJJ5yU95TDCXx24YG8e7+/RrAak7Y=;
        b=eFgdSOLAwUbUwhDsY3WerK/8sy0PiO2hat8MAKSzVuWsjiVn6mOwgflOWkD5I7f3bG
         Zg4rVegDYw58l6whelxATyQOmtfzfCDcI4tCerU8LqC9ISBeuFW/YbD2dK/zbhdk0Vtu
         LxwsCM30MuP6ojdJmwU1HlC1gvUGfO56GsGH0eiN8f9AqI4upW9Yc5vT1JxRjB4jvd80
         xHcWQ+GaIN6RSOdsAFp4rZdb0TkgCYb2M3Ju2gCweAl7zXsLys4JMFJ8g2IOj/Aiwwpr
         Q6iDtkEpame/9rdXLgY2wmeaF9BgKfi+wIC7xNJl5mlDcyiCbWSNksvbjn/rXD73+dYi
         RR9g==
X-Forwarded-Encrypted: i=1; AJvYcCXNro1IKhFBCx+iXtfB/lE4OTtZX7/cZbi0REsBAC0MIQEBTOk2F716IKnftPUVwwgD+gxGvR5Sktay308m+z9H@lists.infradead.org
X-Gm-Message-State: AOJu0YymaJ/bnOkb31AbB6GL4p4rJ7pVPC2muIJRqjpZh6o30b5DeuLO
	70oWLsl0CxruFWmSM07ixXcRXKuOlcsokbE58tyc+gCtw/H3CKO5N8jnCSV6X+0=
X-Google-Smtp-Source: AGHT+IH7M/UX7fkmVreC1luerEEXE6GOHNSoZB9sCqED65rS6AXsEUNqfA2l6fwGjpmBaETaxjbK2Q==
X-Received: by 2002:a5d:6c69:0:b0:37d:94d6:5e20 with SMTP id ffacd0b85a97d-381f17261d6mr14681736f8f.4.1731411264652;
        Tue, 12 Nov 2024 03:34:24 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97fe9bsm15071138f8f.35.2024.11.12.03.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 03:34:24 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH -fixes] drivers: perf: Fix wrong put_cpu() placement
Date: Tue, 12 Nov 2024 12:34:22 +0100
Message-Id: <20241112113422.617954-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_033427_085907_1A949A4E 
X-CRM114-Status: GOOD (  13.87  )
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

Unfortunately, the wrong patch version was merged which places the
put_cpu() after enabling a static key, which is not safe as pointed by
Will [1], so move put_cpu() before to avoid this.

Fixes: 2840dadf0dde ("drivers: perf: Fix smp_processor_id() use in preemptible code")
Reported-by: Atish Patra <atishp@rivosinc.com>
Link: https://lore.kernel.org/all/20240827125335.GD4772@willie-the-truck/ [1]
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 391ca1422cae..1aa303f76cc7 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -1393,8 +1393,9 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 			goto out_unregister;
 
 		cpu = get_cpu();
-
 		ret = pmu_sbi_snapshot_setup(pmu, cpu);
+		put_cpu();
+
 		if (ret) {
 			/* Snapshot is an optional feature. Continue if not available */
 			pmu_sbi_snapshot_free(pmu);
@@ -1408,7 +1409,6 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 			 */
 			static_branch_enable(&sbi_pmu_snapshot_available);
 		}
-		put_cpu();
 	}
 
 	register_sysctl("kernel", sbi_pmu_sysctl_table);
-- 
2.39.2


