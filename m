Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754C4C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 18:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6MbfDRCc6A6mGBsw+fhL6wjTkBIFejSaI+SDSiajdA=; b=OhFEDbAoHgkphUZaZvGtKNLvXz
	zH21cANMOTou8cpor8na18cDZQN3r0R+yiBpykLPPHgFav0uodO1oobVcAGD8L14nh8iLxOaMgj1B
	gV87MqOI4ICMfPplZIzfVoACkoLdzLruT4HKMdG1J+5R0v9uev92P8KuW2a0Doi5mPR8Y6+d9n0Eo
	fSNGG8RVuwHdoY2JD7gFAOIPo0gw5lTG+DlKKfCfFKfKApC5h5tfZEpWN6JPclqblN3S4BKNvN8i7
	Bf/ay6mO6amh3WaMoW4iEA1f3UH1Ewc4FZGBpGuGyVrbK+1dsm5APSgWsfF319vtbVEfP53rt8Dpd
	v2sh5f/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8Cu-0000000Cm7y-47yE;
	Wed, 15 Jan 2025 18:33:36 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8AL-0000000Cl8d-1HTI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 18:30:59 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-216395e151bso1993635ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 10:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736965856; x=1737570656; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6MbfDRCc6A6mGBsw+fhL6wjTkBIFejSaI+SDSiajdA=;
        b=JbBJhzksa1B1U282EUSJtPqm3lhRTZChH8Mllx1Q9p+tF/FpXh07NDYX0fuZGFB0mX
         Kuu+4FpR7a/91y2HFkLTeB0L0Kr7o5Cg1BeJYkUC8viq5iUoU/mfADXaETiOLXuS7ro3
         zRXB7XbuHSzsLioxtifL4qZD7BwkFIqFI4x3kv80/SVZUp2UWxqGGmo6WLFQHK7EFPBb
         yyFXbhnhwKuxBhspALx+Gw9JBq4TFQLOGWcHRQx0IUYOjSR+MKWRhGJAT9OJJSzRnAAV
         z2SvWg8vCjKPGwE4hUT8lAgNtoPy3wzUWq6a7NjsEkozXUuiw2m42nAVcoVvD+XsReUX
         v8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965856; x=1737570656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6MbfDRCc6A6mGBsw+fhL6wjTkBIFejSaI+SDSiajdA=;
        b=w5L/Bwj0zqz6jbrKleWC6KxkF4XST6OhWwecS+nuq9gxI+GFJ93GOMSJup6f/vWGFA
         l3r+am8DfVN6W6U5jelnrEXsco5lHZufnlMld7n8nHZwHsowQsHvrGtq23nNbZMMviFa
         gV/WmWZyKzaBq92KwCMY+EE6BdBVFSrFfSXZktcjWRK5EmrYm86VljFp3IOBa2/MD/0O
         ER/m/OsFDHYSvQYuZE0pNWxQOJ3UbfhBBejGxjmTrgXsijr772DvQPOSZUxwXbCReNrQ
         XfJjesjbEJyn5vVtnkJ48Nz+ftE3qGB+ez6ehUsam73R9lc53wa4flpjYe0IMsINaKcs
         xylw==
X-Forwarded-Encrypted: i=1; AJvYcCX58plSblJCd88rmL4RK3f39M0HlSsRCnlLBSXjcxWAPUnxwn5N3WWveHzPvovcpefhDnPQNu/3aEDNPYzqy888@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9n9FGlcBYy09zHw/oJkH4idJe7ewjXRhhn60q7M9XSeuAhD23
	HGjankP7UkkwZzxE/d5BBbck1do+7zNum18vTRV25cJR1hGXitGKylboFuscxGw=
X-Gm-Gg: ASbGncsePyC02DlGyhKuTNEEMfXJGeTQ49Kqcw72GWLSW82562WKrb+kkwgl0RNXzlF
	JohEE1TsDEfmrAzctuc3sXu5RTctwK5Sz7F+aPTykZjbJvisaJFdU7WWRcFIlseN6VJ9qAtjcuE
	0HaRRkhUikNsblC/KTzsq/soWOOLXFA36zlxoTxBNJdjE3rUe2xCgrCiB06uVn0nB+GQVISMJw9
	ZB6NJxBUvFUDuXMOGvL/lekRmPjithQ03VRjXbSIN8AIZ1yEckWaotCwSkKb1sXRGoB3w==
X-Google-Smtp-Source: AGHT+IGH5/giAEf8Q/ecUlIbOiNlBZurjf3IoH6KsqiI1EGl06ksaFaVD7yVqQ1dvhjlbV18FEvXig==
X-Received: by 2002:a17:902:c40b:b0:215:ba2b:cd55 with SMTP id d9443c01a7336-21bf0b76a12mr58588755ad.2.1736965856596;
        Wed, 15 Jan 2025 10:30:56 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm85333195ad.139.2025.01.15.10.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:30:56 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 15 Jan 2025 10:30:41 -0800
Subject: [PATCH v2 1/9] drivers/perf: riscv: Add SBI v3.0 flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-pmu_event_info-v2-1-84815b70383b@rivosinc.com>
References: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
In-Reply-To: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_103057_346509_CEF0C17B 
X-CRM114-Status: GOOD (  10.80  )
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
index 194c153e5d71..170aa93106b9 100644
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
2.34.1


