Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C3DC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 18:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/ajGRMGn1FxbsN+PpYAIsQKTZUngiruAaZC1M7x3JFs=; b=EGNj+6KaZjsj7R
	Sq79gE0CpcIweV5/0Lgus9zFHbhkpJ5pmZ96Rdy2Oipo8krMWXtSVjjlRvetCrSDN2WmDcrSyKe44
	9WmBd/PgrkrRJfzotzNyQ+COZwRvDoafWLCOkXj3meRTx65CuQiOqn6N0Udl00b9SnwmGFAGePykq
	XuDVesXJdEPi5v+bISY8LAsc1lsOTj6hNVTw/n+essRFI8DQ62mr5uosfG/uf9AZYbBidFwsLDqdw
	BZQNnMCgAJ1UvDbRNi8Bweob2BOjJEa0BkK0siOCgRE0OsQRfG5M9aaskbQPA20YFwoN4guyMzm0d
	1z76JihLiJhI9X7B0VyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8Be-0000000ClhS-02fZ;
	Wed, 15 Jan 2025 18:32:18 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8AK-0000000Cl7G-1fe0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 18:30:58 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21654fdd5daso122338645ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 10:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736965855; x=1737570655; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ajGRMGn1FxbsN+PpYAIsQKTZUngiruAaZC1M7x3JFs=;
        b=udUACYozp/mvJGuPk9/HHeHdXfo8zfThLka/42LNdY/lWaQmpX+cRCPscl9I9qMMq2
         GN6Skz/IHzE44kMG8Qb0ZY9GwX5minQ5a5JbiP3o4mNpdku2Rwo5Iuq9PMwmxzOYPgUM
         hqLNb1Fy/vhK1kXUMYlsBTB7xgfxDyzpkWmkjru9C95pQNCPIGUwFVxn/IU/XIl05TUZ
         9f1vuhQdyMgiKEfiJLThjVVVm1wYMEI2sa11mgZC8Yv+bqmr+DYBpny1wohluMbeEIZD
         995e126YArBADeYpC1QyrhCZKXSmKG5sKMPunXk1HHOw+Vek/JWCHVT0DXSm0Otsf/97
         eKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965855; x=1737570655;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ajGRMGn1FxbsN+PpYAIsQKTZUngiruAaZC1M7x3JFs=;
        b=lA6ZdlYQB0CKz9Vs4PTrPboJ4ty10L9YQsJdn4u+03EC7o3pLm9o90rhcVsvMIuID6
         trL6l5EbqR7hNUCJZNCW/m7QoVlQVHdPbXZRNqq0So8YtwlCixkuuSKs1qlkpDTLUo09
         SqDIlzaBhrW9beicTphwX45N9jEeJiaEg1AdoEk3vGFZJDR5Uhs6FwBpnJK2TmFK3wiv
         yGZXOrjDeHTwOsD1NGi8crdwQStr+AerqEIK8akK3z153eLtEUzcbu3ryEv9V43D8RWS
         n335Fl8DpV1jXHjhwWdtI3RwMYjieDFXAlUwM96jTLUJ0g9ru1b542JUCyy2828YTOse
         efRg==
X-Forwarded-Encrypted: i=1; AJvYcCVgzKEHZk41ymJDOHXEzvymyDoPxKlVLAsCBVzKwjKjLSLZokxbyR1xjsCxoH/0XQsfyxpqPN1LWl2G90LI8dlZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzM+iUiRCcz+372OSJ7QBSCoQdqwSY0IlNi7aqX9Cmes19hqiqK
	bfB3zXFCyBrgS9+NA8C5etj+2wUtkHEPWVIfndYLjQs3ASjftwlsbjhCiMTDshs=
X-Gm-Gg: ASbGnctE0TF7n5uiAN9O2MZ/BsXx7HBpXLmKV8C9Q0/xltGNF2qPtxiiw3dcJmQhDfW
	Db3cfRF63ypdDrMXcWu6hoA+CjMa6tbLFeOvm2sItpwJ06wOnC8Uhk2Z6WgFKFFi9yId8bGk/W+
	WW+7C65yzBcGIq037aObQ5JQEIU3nsyY0SHAgevtNdvqjTO5Twzo2xOc02U/XEn29ATa4aYpb9p
	3Hd2freY01BEAoNvwP+JZXy3UFltAbtmraaJdmwv5Yp049qdjOcc2HZrBMfsqWfVmFdbQ==
X-Google-Smtp-Source: AGHT+IEFG9EqfNb6O2FfoTObOooM3/6B60y7w3sfOaKZm6tCWCH+RNJht379tQ8uKw/jXGcfHEEVRQ==
X-Received: by 2002:a17:902:f644:b0:212:40e0:9562 with SMTP id d9443c01a7336-21a83f69651mr458458845ad.25.1736965855468;
        Wed, 15 Jan 2025 10:30:55 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm85333195ad.139.2025.01.15.10.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:30:55 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 0/9] Add SBI v3.0 PMU enhancements
Date: Wed, 15 Jan 2025 10:30:40 -0800
Message-Id: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAND+h2cC/12OQWrDMBBFr2K07gTP2BWSKaX3CME4yriZhaVUc
 kRKyN2ryJu2oM0TzPvvrhJH4aSG5q4iZ0kSfAF6aZQ7T/6TQU6FFbXUY4sGLst15Mx+HcXPAaz
 RTOhYH0+dKkeXyLPcqnB/KHyWtIb4Xf0Zn7+bCtH+V2WEFqZ+ttpiTzibjyg5JPFu58KiDo9NH
 /nrWjLXbUMtnNJUM4fmraoJ6Ze61oyZoLwWDHZsysar1fRH//6MP06JocAi69BkvcMOoqOy/Pg
 BmvULkCgBAAA=
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
X-CRM114-CacheID: sfid-20250115_103056_433210_F6EC7B71 
X-CRM114-Status: GOOD (  14.46  )
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

SBI v3.0 specification[1] added two new improvements to the PMU chaper.

1. Added an additional get_event_info function to query event availablity
in bulk instead of individual SBI calls for each event. This helps in
improving the boot time.

2. Raw event width allowed by the platform is widened to have 56 bits
with RAW event v2 as per new clarification in the priv ISA[2].

Apart from implementing these new features, this series improves the gpa
range check in KVM and updates the kvm SBI implementation to SBI v3.0.

The opensbi patches have been merged. This series can be found at [4].
This series will conflict with counter delegation patch series[4]. This
series is gated on SBI v3.0 freeze requirement while counter delegation
series is very early. I will rebase one of them on the other as we gather
more reviews and closer to merge.

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/vv3.0-rc2/riscv-sbi.pdf
[2] https://github.com/riscv/riscv-isa-manual/issues/1578
[3] https://github.com/atishp04/linux/tree/b4/pmu_event_info_v2
[4] https://lore.kernel.org/kvm/20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com/

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v2:
- Dropped PATCH 2 to be taken during rcX.
- Improved gpa range check validation by introducing a helper function
  and checking the entire range.
- Link to v1: https://lore.kernel.org/r/20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com

---
Atish Patra (9):
      drivers/perf: riscv: Add SBI v3.0 flag
      drivers/perf: riscv: Add raw event v2 support
      RISC-V: KVM: Add support for Raw event v2
      drivers/perf: riscv: Implement PMU event info function
      drivers/perf: riscv: Export PMU event info function
      KVM: Add a helper function to validate vcpu gpa range
      RISC-V: KVM: Use the new gpa range validate helper function
      RISC-V: KVM: Implement get event info function
      RISC-V: KVM: Upgrade the supported SBI version to 3.0

 arch/riscv/include/asm/kvm_vcpu_pmu.h |   3 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h |   2 +-
 arch/riscv/include/asm/sbi.h          |  13 +++
 arch/riscv/kvm/vcpu_pmu.c             |  75 +++++++++++++-
 arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
 arch/riscv/kvm/vcpu_sbi_sta.c         |   6 +-
 drivers/perf/riscv_pmu_sbi.c          | 190 +++++++++++++++++++++++++---------
 include/linux/kvm_host.h              |   2 +
 include/linux/perf/riscv_pmu.h        |   2 +
 virt/kvm/kvm_main.c                   |  21 ++++
 10 files changed, 258 insertions(+), 59 deletions(-)
---
base-commit: e32a80927434907f973f38a88cd19d7e51991d24
change-id: 20241018-pmu_event_info-986e21ce6bd3
--
Regards,
Atish patra


