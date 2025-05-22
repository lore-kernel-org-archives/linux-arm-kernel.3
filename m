Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99306C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 19:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1p4+AtteizaQRcJNZKx3uxkrKCkThIoqx663iDBnv3Q=; b=c2zfWkwPvoetMsoYHWvnZhdkHe
	OtJ+3yY+zUNuEx6AE41AZZxpOog4GXlfp3YqOSFvx4dLYrLdurv933GVPJgyuGwr4oIU8adz5b9J5
	l93ka598mn5g8V8MVMzzKUlj+IFea6Ps2nt5iFKJUErooMj2UnP9UmzNHKBO9RH4tNoYt8HuL7dLn
	gihZLd113TeDWWAyOvtjuwShySB6XBak5dYqq0hIL7O41ygXIPmXVTQVNaC9dORiAZWax7dBkLaMS
	1kTLhZ8oe8L0HqmUacLzJCVypw4qe/dP/MJyxJWb+Bm9YXmNUMf9lx/mlvwQSCse3di/pZWL3S4nJ
	Yj7BVgxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBGr-00000001xpr-2iJ3;
	Thu, 22 May 2025 19:08:01 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCk-00000001wJz-20uP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 19:03:49 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-231f5a7baa2so48163205ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 12:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940625; x=1748545425; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1p4+AtteizaQRcJNZKx3uxkrKCkThIoqx663iDBnv3Q=;
        b=g7xfVixSDqssAwetdlQA8iXef2n2fdmbszILS6sFBGgxQuqT0KYTsSaoc6iFALJi4k
         I457tUyqdX6zqhGkCA6deQ7co78y+YcCz6BhHvQXzsCKD7dMzJjTZngQXTKNNFOAikol
         gYXk6lTw2piMNFAf4r+PEIolDL36c1GxhZSmSEtinDUX9o47RW3KHgwNAoK0FVT/q7Bp
         Arhvncjt5fNzRYbFtNrRVODqCx0oxRzGwpqDAZit+vaoEhlqvR+U5m7LPBDAY/aAhRoF
         fra2w1BkWruHsZPCIvjo+jL4lFckgmj/Dnja7NAMjL9b9m7mepF74QbQOOLFH+J4QnNt
         4vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940625; x=1748545425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1p4+AtteizaQRcJNZKx3uxkrKCkThIoqx663iDBnv3Q=;
        b=QC67NWDL7Tb7Kv70F09SCSuewrZlzJMmnGwAke7nPBNgCNSdQKzk1fLv5SxWMgF3Qx
         62yX97BmnDZq0WNKYhh16t5Es/0xgCvQ4Pid1fTgzkdHZhrhUH8f/8x/HBjDixCbh3cO
         28XGSL958hMLR2vQvsgsy/4EH1sGeSBIhHwp6RjvTeVg3rPSWF2ICVBl/Z0waTTSZU8B
         2MzTVU+j0O6cm2GiNTiMKOVKEbdYr4ugQEIuzNflmUWbgd7MptnfqOrt4pCjgwOtm3yk
         4YHE+6LmvsqA63qNmeL/u7B57WPexyI+bkcT1MZrah0SK5a4WhehiYvns55MTZTC8TcI
         4sHg==
X-Forwarded-Encrypted: i=1; AJvYcCVAy+nbo6g0mLEZQjKUbdERTANJB+7AkPRjtmigu8II395ZHcBOclAjXLdW6iens9V07rr3kxU0+tJM/1wgO1zH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5TCdjhLM0q9KxyRLiHh72/JWbpb2gR785Q4T0lyHxcH4MBhhc
	OIGogI+fUXQsD4PV/Pq2f1ZZYXcYXys2+t5V5WO9Fkpp1zVrLYLuIqDNJ1LB/WmUJpI=
X-Gm-Gg: ASbGncsuQG0IqSxQL13U0N4vp7xdukvvgNx6dtEYXR90l4yqb2S6FQjKub4rnezdX5Y
	PEbZcJ2iucZcV+bYaL8si+CvBreknYEMgvqYHPMRyyX2luBDCbC/gZ8XnPP/FRqoDIj4HYX/7ga
	YWMWiNbwY+envWTrW7S1eYXbug5la4i8fyV5N1cDCmZ/4xJr1SPDCVoP91TouM6faHD2Ht+ZVGQ
	af3+r4vPizfW+a4aHS+yTzgsZIexI6eplLqso2EUdUhtx0sl38yeoR7py+gCioZuBkptIMUyC1K
	MTYmdEHs/75N2Ks5zRQycQvAAfw7OE27C9VaYRAMMhyZNA4ZZgalxnuolXjvcNIo
X-Google-Smtp-Source: AGHT+IF60CjGVS+XkZOaK5ku4lafcj/BktLeKZMLaYLRiMYA2gu0KSgvj+oaPNmS3vGSkFgOpISftg==
X-Received: by 2002:a17:903:18d:b0:224:c47:cbd with SMTP id d9443c01a7336-231d3257fc6mr374153715ad.0.1747940625547;
        Thu, 22 May 2025 12:03:45 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:45 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:35 -0700
Subject: [PATCH v3 1/9] drivers/perf: riscv: Add SBI v3.0 flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-pmu_event_info-v3-1-f7bba7fd9cfe@rivosinc.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_120346_531393_BD0D1191 
X-CRM114-Status: GOOD (  10.59  )
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

There are new PMU related features introduced in SBI v3.0.
1. Raw Event v2 which allows mhpmeventX value to be 56 bit wide.
2. Get Event info function to do a bulk query at one shot.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 698de8ddf895..cfd6946fca42 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -63,6 +63,7 @@ PMU_FORMAT_ATTR(event, "config:0-47");
 PMU_FORMAT_ATTR(firmware, "config:62-63");
 
 static bool sbi_v2_available;
+static bool sbi_v3_available;
 static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
 #define sbi_pmu_snapshot_available() \
 	static_branch_unlikely(&sbi_pmu_snapshot_available)
@@ -1452,6 +1453,9 @@ static int __init pmu_sbi_devinit(void)
 	if (sbi_spec_version >= sbi_mk_version(2, 0))
 		sbi_v2_available = true;
 
+	if (sbi_spec_version >= sbi_mk_version(3, 0))
+		sbi_v3_available = true;
+
 	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
 				      "perf/riscv/pmu:starting",
 				      pmu_sbi_starting_cpu, pmu_sbi_dying_cpu);

-- 
2.43.0


