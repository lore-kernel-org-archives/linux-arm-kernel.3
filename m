Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3C3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yMYPtbWoioljIi5CGJJ0bbQtImjQrSrLugDRy/Wgxc=; b=mx7ZMzg/m0H9lHhMOXMel9joYk
	lTE7H3hnqgyTWFoEg+1TtWGC1w+CgkbPpcMpzhEWWPOWBN7pf2ALFC3Gb6KPZMRlpZyCIArA/Isi9
	WwyX2l3krrmdX23bCotRCeV/W7hpbam8nnLPUBVITetKvg7XrVJZi3q9mYMtFK7aBff2Uh6UM3sqp
	Y7I2ymmTywjEFf152l5aYxhoH+sqvx2MjA4KTAfATyibv4mTZ8C7Csi8M9G0kq02wjZhwWrW142Jv
	igj2bY/sNv1pd+W7PTf491Nbxs6lPnYc9wRZxzvDIK7uboSsmjE5mXHibFF75AAFaCH+S6jKpUMtO
	tEdANnmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGcK-00000008Ks9-0TOm;
	Wed, 12 Feb 2025 17:33:44 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGSB-00000008IrA-2W4J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 17:23:16 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21f710c17baso83090215ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 09:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739380995; x=1739985795; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5yMYPtbWoioljIi5CGJJ0bbQtImjQrSrLugDRy/Wgxc=;
        b=WwobDTANaX63vh6P/BDYGHVgURtCAU2rUaEBwE6AjB13hB/Uu5zaHt7cwV4oC4Gh0B
         SngzjYFCy6VjyRkS3Y+QgTnF2xmlyrjMLUdRSXpVr06prIsrMDXUGyV4E7i3CNj9w1xa
         A32CvgKKnZW+6BwnYuuzMEtrizNUY7bZHlkecn7XMF16ubntAyQ+3eLkRky7RtDASXLn
         rlqmRh12gz/J1otYQCC9EXpEUB6088LNxk0Ph9VmiguPkSpwRggI3LvOtxy+OsMAG3xm
         xnBlPaoHSE7KFNy7p8Ghs8/co580sD75NQ8UHHYvrSDLhBcdzehIxgsba2AaDUeHqJTJ
         Penw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739380995; x=1739985795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5yMYPtbWoioljIi5CGJJ0bbQtImjQrSrLugDRy/Wgxc=;
        b=J477bBzN5B+AUmdVClCQ6RVqxObKLDF/oQMOr2ZEzb9cPQcGrnPOc/PY7ACRwOi5ID
         Kjpyd7Sr4RQQsizvrNlIwlLKfiTm9ov8tMykkwjNnO/bovm+U8ypBNdKNx+SzyfSiF/m
         nvpju0+nb7jIMfvK/WT7OdjCRBf9ENS6VEadJbv9ZdIWaLQy0fao6NMyEuWHA5KHcUDW
         0996B0FTdZ5M7IL4X/0W7DrOz1XxvBwRKvgJfg1/4/8JcFGdCqCNkcqpx8eetTCOx2Qg
         ksj8/BJEInrTF1GQNZML8iEmkntLle29ND+putnhEq0nUHielsd5j3TY9Q0BKY5VI1xr
         kgiw==
X-Forwarded-Encrypted: i=1; AJvYcCUO5hNY5kH9SOGeS9cxXpuRr8HU+jw4BEA8CYUgQkUJ5cHYF31jEvXJKVH124FvImBhzFqIlMrQ3HKlXStWpYMU@lists.infradead.org
X-Gm-Message-State: AOJu0YzKWGyNxRl1pe+f4amL6MmWqiAfSlbUGQ1v3xIxEdy3/qlt/fuC
	HEK+7XsnGlez1xfLf9uobye4WgJdfHr53XMc119mhfbcXCe3FPFV
X-Gm-Gg: ASbGnctyU3ut3RU/+16q3+0zkVgavF1yzx3ZQliYDkjcQypXJylkjfBRraPsavYq2rp
	B6F6pRdVb7/uWHV11bZlpfKaSBN5Bligmv/7NkEsayZ3Qzhbhjxwf1d+C0rkI9pBUDoKqvqWTrx
	6OqdjXrvV4c4w+YV6466kmjlSAJ2rfdlzY4KiTCNneBdx6smNpo/wChuqy9GjwurYYZ+Vy0YO5e
	xP59ZU0CJqXYC84b/eRYzRWczxjC8y4tzwfWd5MISOYefxN5Q2ysRxhjPiTSSxT3HG6dJvYqze6
	XBIde/E3fS6WW5Kjdg==
X-Google-Smtp-Source: AGHT+IF9Hqg1hDtMETPcTVQMDIUifIcDM3rTf0I2IXiMK50CYiFNlKKpQ8vQz3ex521MFyS0zANQ0A==
X-Received: by 2002:a05:6a21:6f10:b0:1e1:bf3d:a191 with SMTP id adf61e73a8af0-1ee5c83db7cmr7106147637.33.1739380995098;
        Wed, 12 Feb 2025 09:23:15 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-ad54f1691ddsm6001705a12.61.2025.02.12.09.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:23:14 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 13 Feb 2025 01:22:28 +0800
Subject: [PATCH v2 05/10] drivers/perf: apple_m1: Support
 per-implementation PMU start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-apple-cpmu-v2-5-87b361932e88@gmail.com>
References: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
In-Reply-To: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2211; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=/4qXPFHVNQhhoJUabUe1xtQ/R9DQ+Ipv3G6eXZu+6Qs=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrNjwdQLJ8DKd8ePzg7bkvfftYg1GlHSWGLpkf
 g+nrc1zB+uJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6zY8AAKCRABygi3psUI
 JBfpD/9guHkkdm7MB9Lf6dTLwpTEkIlSUVy2My1ORooQxfsc1CRRCjYApVz+pI1XTsydkT535XU
 /T12u8brSIgFHOpgmGXTvedcWQL7JmVEvbRG6i6vnN7j4ymwR/V6jgRIoamXh9AAAf/n0Dteret
 N+3WguwH2fqY+64yR2/PYkJwSuyRxFr2YiY+Hqroo67BD/bXk0RMSqTfPkmhYu7bRMjPLeRrkUB
 6SOsYDSnwFuVbUSvv/LJZHAqsYAsXL5RLQUzDNTCszx+xIpr2kFyWrm5S8x64xVVaKOJSHPAi/M
 RvFyWP3s5LWfgy3FotRwZ2TyQpl2Ai5FMF+Yv9GJW5Bv04h/sAWwfGfmJMOAFSF7wIcWw02GP6b
 rQ27MB05ApxpnGE6OU2L2PbwZYD7JqqRF2UqueCkJ2kDR8HtO6c04u6p+7pCBMbtms8uulLdnPT
 XbhywTNKNvja6+5Bz0etrJ53Z0ZzRGnNMuvsYxpWA0cVLYn/bUbzZaPk0wAQo5PkFHwk6Ml2JLc
 HtZU7z3mb+94BJin8Y5EgcCh7DljwnubxtfSOav9jdEanL9o+8BwX1SnWROQ7jYQH8wK1A7/GUy
 Om9J4NzuAcIu9EPJyDk64ZQQMMPYhSwXOMNojHc+nnLXiV9Rh96SQk/seTbLBuQpzkgrELVsc2G
 SiqiRMKS6aqAO/w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_092315_643550_800661FC 
X-CRM114-Status: GOOD (  11.56  )
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

Support for implementations that deliver its interrupts in ways other than
FIQ will be added, which requires a per-implementation start function.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index e7b898aef45e9e18899693774ad673fd370b19d7..12eba1075b36768afc29e211926331b9a426c54f 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -605,7 +605,6 @@ static int apple_pmu_init_common(struct arm_pmu *cpu_pmu, u32 counters)
 	cpu_pmu->read_counter	  = m1_pmu_read_counter;
 	cpu_pmu->write_counter	  = m1_pmu_write_counter;
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
-	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
@@ -622,6 +621,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init_common(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -631,6 +631,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init_common(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -640,6 +641,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init_common(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -649,6 +651,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init_common(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.48.1


