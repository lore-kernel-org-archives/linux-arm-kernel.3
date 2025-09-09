Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3F0CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 07:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RNthXv7xmnVgNBJdwKS6Eu1LchZyxPFP+JzXVAI2vr4=; b=KjKobepBbgAeAh
	MhhXfTSn+a0Ju0hSCn2Gz1mIZplYPT8ZzJCqJP3bRNRQ7fkU25rz1qKK/h0jmwY/6jcaLmoJU1/gE
	c45Wh6y1SWn+YYePmWjZuh6j3+cmeyFZUnKlD747uKDjh6sEprT0fdtiT7jJbSZVVugd2X84OqmjW
	ryToHR3Qho3yg6CEa3KAbPwj6bEdYWmL3FLauzGg6LnI5T5BYlRUhxz5qDzkQ7Vtb4jJD11LL50ZL
	qWztvDRdOb1T8owa203UEb6nYiXTM/cictLVQTNONZelllI/dTlDk6it77B0UX8bovSDNlESwdA/o
	OMErBM6AfWDidb4Y7k8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvt7G-00000005KyG-35xC;
	Tue, 09 Sep 2025 07:50:14 +0000
Received: from mail-pf1-f171.google.com ([209.85.210.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsNx-000000051fk-3dTw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:03:28 +0000
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7726c7ff7e5so4457979b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 00:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757401405; x=1758006205; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RNthXv7xmnVgNBJdwKS6Eu1LchZyxPFP+JzXVAI2vr4=;
        b=WvG8pMFMSj8QcM30H1bsSA7/f/zTtnMdDQjUapdr6wfCwgeYnv4qwJbPsbY0i1q5j1
         4TMxDUeycDtUr0aV/HS+UNiWLpcO40zaCjgW5bgwFinhPINHghcT8/m+HJk5wyy17MeZ
         zcOl7OAwp2gc0LmIUEFoiuTfIIZ/wuVhQECWMQ3hGWJuQKVtv/x5oNKE1++uFoExBpd4
         nCZVqEAWUPp+6pNpXQW80Qf84n59j4xUf3ukeI1dR4MMz/10FXWhv6D1dCfzsXPyDrHn
         lsRQx31udKdeMlh0wgnSaxZ16WJ2AuzVrKAhPJUz9LGHv0Kq75tuR/7mjDVsT3ZQIe+o
         A21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757401405; x=1758006205;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNthXv7xmnVgNBJdwKS6Eu1LchZyxPFP+JzXVAI2vr4=;
        b=q4og5qYSWey94ChtzYEvnb99NcJkgvTgzivJY7V4VzZIZVxeojsMqJ+HtLsqKUTVl0
         AEF2mz6DKCZ6QYkVizo0HbFT3iwIBdRJG90/mzDZSPaFxOlYHQjRnPOkYlMfcIAsA26D
         gEbgwE3aVHYou4/Tyw47CM30S+ykeh0PckDHaKvmQ+T/nUzn+j+pNbJEuNPyMgJKYWMO
         4whmP3R30m07j3PspYUS+0xX4uxHhFAgVrrjBrNdVOkAFcYUMntf5zP630Pqh0//LgJI
         bv4392GG5WrRMEdH7w7tQFwJbLg1rYeWchpV+f4n7RbagWfTxgTimD3p8z7poDj+1wQ1
         z4tw==
X-Forwarded-Encrypted: i=1; AJvYcCUZF/H+xv657b/l/088rBpMuulAM+W5+WPCuI+aX+YGxwYTlGrFhK+Oj84f6IrpstLe4G5UIeQdcdApgFwBZXTA@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+9Kx/8oT2cNmHxkSQcvEZN+37o2E1H4bOc63qUFE7Nx769jtO
	jx5Gpd40oVXZJxkTAUKJQEa6FuJCbkV6OR+tnfqqIDxXT3bSjrCk7stdaachlZxLh0o=
X-Gm-Gg: ASbGncvxpYg2Tr78rohh4JzPO9POosv1GLEF2d5IpYNvt8fI4sxqHknPDh1eCKGAb30
	0v8uAK86kDBl66thuMy4ILMbdONiGtZEqLlvT8miga+Bfr9FacVM0clP93v5uzgp0HAHf7gZ8Rd
	5kqbh/hUue8a9ItGcurKv/ZQpSi1vjCf+UMXvkajRefXjoUM/OSNU70LDF27PmMRqBoT8hrtVN0
	HGRyhXokdUNBZfd/ZmvhEqTXHdM4unXamCTzhH6xtHKENwMdbV+iduDor2ScvtU9uPI6NiffH/C
	F7sRNyg/4KNjEBVVH6e8lJNTYj4/HjaeQfqdpmslre0zk14eYa7w0HsNUx0WwDQEo63hMbhx/0/
	s/XjbYihUlvsJ0FeUmo5OOtJNcc3/6bU0aJM=
X-Google-Smtp-Source: AGHT+IFVlHtNE2LMGS7gSQLQT0W4LugB0ERiut2YB2J1SVxQq4kRk0S88rF/oo0Map16D7hoJpjjYQ==
X-Received: by 2002:a05:6a00:c94:b0:772:332c:7976 with SMTP id d2e1a72fcca58-7742db6308dmr11948119b3a.0.1757401404738;
        Tue, 09 Sep 2025 00:03:24 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7158sm1025535b3a.72.2025.09.09.00.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:03:24 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v6 0/8] Add SBI v3.0 PMU enhancements
Date: Tue, 09 Sep 2025 00:03:19 -0700
Message-Id: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADfRv2gC/23R32rDIBQG8FcJXs+Sc/wTLWPsPcYoxujqRZJOU
 9koffeZhNGt6eUR/On5vgtJLgaXyL66kOhySGEcyiCfKmKPZvhwNHRlJlgjhxoUPfXng8tumA5
 h8CPVSjoE62TbMVIunaLz4WsB397LfAxpGuP34meYT1cKQN9TGWhNDfdaauAIXr3GkMcUBruzY
 09mLeOvIGoAsRGwCIorEG1TM8XaBwK7CQJxI7Ai+KZtTeM7bb17IPCb0CBsBD5vYRvZCGU4Sv1
 AEDdB4TYHUQTdWYMSmDaM3QnXNeboPs+lrmnNmvQuJbPUta+el4gR/q63tHIoCa0hAXPle15oi
 f/4l7nE1iRHy9CHaV9luQNGo8Xy8vUHDuHwgjACAAA=
X-Change-ID: 20241018-pmu_event_info-986e21ce6bd3
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>, 
 Sean Christopherson <seanjc@google.com>
X-Mailer: b4 0.15-dev-50721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_000325_941252_CCEDCA68 
X-CRM114-Status: GOOD (  15.26  )
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
The SBI v3.0 specification is frozen and under public review phase as
per the RISC-V International guidelines. 

1. Added an additional get_event_info function to query event availablity
in bulk instead of individual SBI calls for each event. This helps in
improving the boot time.

2. Raw event width allowed by the platform is widened to have 56 bits
with RAW event v2 as per new clarification in the priv ISA[2].

Apart from implementing these new features, this series improves the gpa
range check in KVM and updates the kvm SBI implementation to SBI v3.0.

The opensbi patches have been merged. This series can be found at [3].

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0-rc7/riscv-sbi.pdf 
[2] https://github.com/riscv/riscv-isa-manual/issues/1578
[3] https://github.com/atishp04/linux/tree/b4/pmu_event_info_v6

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v6:
- Dropped the helper function to check writable slot 
- Updated PATCH 7 to return invalid address error if vcpu_write_guest fails
- Link to v5: https://lore.kernel.org/r/20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com

Changes in v5:
- Rebased on top of v6.17-rc3
- Updated PATCH 6 as per feedback to improve the generic helper function
- Adapted PATCH 7 & 8 as per PATCH 6.
- Link to v4: https://lore.kernel.org/r/20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com

Changes in v4:
- Rebased on top of v6.16-rc7 
- Fixed a potential compilation issue in PATCH5.
- Minor typos fixed PATCH2 and PATCH3.
- Fixed variable ordering in PATCH6 
- Link to v3: https://lore.kernel.org/r/20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com

Changes in v3:
- Rebased on top of v6.15-rc7 
- Link to v2: https://lore.kernel.org/r/20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com

Changes in v2:
- Dropped PATCH 2 to be taken during rcX.
- Improved gpa range check validation by introducing a helper function
  and checking the entire range.
- Link to v1: https://lore.kernel.org/r/20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com

---
Atish Patra (8):
      drivers/perf: riscv: Add SBI v3.0 flag
      drivers/perf: riscv: Add raw event v2 support
      RISC-V: KVM: Add support for Raw event v2
      drivers/perf: riscv: Implement PMU event info function
      drivers/perf: riscv: Export PMU event info function
      RISC-V: KVM: No need of explicit writable slot check
      RISC-V: KVM: Implement get event info function
      RISC-V: KVM: Upgrade the supported SBI version to 3.0

 arch/riscv/include/asm/kvm_vcpu_pmu.h |   3 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h |   2 +-
 arch/riscv/include/asm/sbi.h          |  13 +++
 arch/riscv/kvm/vcpu_pmu.c             |  74 +++++++++++--
 arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
 arch/riscv/kvm/vcpu_sbi_sta.c         |   9 +-
 drivers/perf/riscv_pmu_sbi.c          | 191 +++++++++++++++++++++++++---------
 include/linux/perf/riscv_pmu.h        |   1 +
 8 files changed, 229 insertions(+), 67 deletions(-)
---
base-commit: e32a80927434907f973f38a88cd19d7e51991d24
change-id: 20241018-pmu_event_info-986e21ce6bd3
--
Regards,
Atish patra


