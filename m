Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F838C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 03:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N3ro4Yyao5uXofBVuxsMuyd3IafrNj++K0PwR4Tt2N0=; b=h0uF69qcu4XQRR
	ralAuNjcOXUcdh0i/Fvyc08mDVXz2GOAbIJLa/yh9CACAY/lZm2ndYdOu6nMMVPfPQU18NK16BzYp
	MV6RgQpztxW/1GhmV/KwRF0pU/Hsq4w8O7ib6IC2T/cE8S2tWKeFAAhwbC3OL4QraSxG0cRvZ/fj7
	QUdCo+2GFKi+ZNwxlQ1wGsZeyLCu1Xmfu41g/iR/Vucd7hL6f3bJwX6wpRwMnMJA2p5drobxjU5W9
	jrX4i8WrCva0feeyW69C1wfidLEBoHuIjwPPir1kWZD3xOpOuXU8RxkQMf5ZSu/V2nGJ6j4TYscY/
	XS5u9d3ACuoulQsuKGBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3Vz-000000019je-1Tt2;
	Tue, 22 Jul 2025 03:18:03 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3TS-00000001934-1x0I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 03:15:28 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-748e378ba4fso5844962b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 20:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753154125; x=1753758925; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N3ro4Yyao5uXofBVuxsMuyd3IafrNj++K0PwR4Tt2N0=;
        b=yQHqSx/w1TjFbWVaoQnJt6TvC4Ika00CttVb6Pn3faV8qX1H2nGIhEzeFwV0KeVP1L
         RDYUiksyyStOn8ODQoY5zZoNwfL5Fauk4XxfUFk4IpB0EaW0JXZd9uYl8XoujFtZIvGx
         3DXk8785t+Xcr9RTtvKCQobRzx58lzMpkgBui1OX1Bp4WOy5NDW+W6S8LTvg7Rp6fHNo
         YUZGhSw0I/k+2lEFRh8CAI9j95b347rSVGF+3jqv03/uN7rvZh6iYcNafqRaiRZZTb9N
         Tjkfh8b44hE9dnXt5P6ze0ExKS3ac5cr8YuBs3xJS2q5jVaEQi8HnfkkcHCyEPd0cLk3
         K1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753154125; x=1753758925;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3ro4Yyao5uXofBVuxsMuyd3IafrNj++K0PwR4Tt2N0=;
        b=ByCWkXX+PWm8A1drUjXqvljiJl/K7I6ak+sWDEaRB6/F9ZvfXoKTXuFR29DV1JV70d
         7M4juPHmVhFEcAMBkfDVjdpZRvDpq4oK8LAb9XwQto4AvrJTHno6eKVCeYDv193SL/Hg
         AVLWW6EKfkk3IeZKclphBvuw9SVE7LkDEEs9x+mT8ivi18t4AMn1YPk3uBKMKivkL0el
         HkLORuvLn5HhIbz3AkhOCXVl3yEZpwIDuDRKMiBfxEVWj1C/UfB1CKxV3B82utAaH/ab
         iGHJz09Kjl5FOm9rHtTaDjl7ObCUGFFFJJMOp7ehDEv5j2RYVtPSmLYKfBmBEGPMoP8I
         yjbA==
X-Forwarded-Encrypted: i=1; AJvYcCXvxOWdZmhdR5QNto5IUCwUae9OCTneY3VRkBXXkJV3+F+eJNF249pun3dHdBWlgXBgEGd0s/TKr7nwz3mb1i4y@lists.infradead.org
X-Gm-Message-State: AOJu0YyJpfRM1R/09dCH6qT2Ydkju5/oXl0EddHTyfBZY+q6jH58WWvd
	6m6K9WfkPbxp79Imrr4nlSJNAoTm2C9O2HW1zSfJRXikDJNTPvG9o25ZrCRLSOItwMo=
X-Gm-Gg: ASbGncuqC1SboG1O+8PegPvIZUPosV4oxDBoHqINmrY4we+vPNVhdMc5OtBXDyP52Yw
	L0Th+LtNJQEAedidf5MGJFf+hxVz+5ozIBps2n6YDdJBtbfjGEHLc9BvrqUV/W/BIn/+HHneU9L
	vKRTulfsBBJlNbTf5pZ3MAVamsNvXj+r39zLyyZ0PDs+mbN3UAy1krX0hPMeIiIOEMawnRA7LwK
	qKwZpqIz7IiLapQRNJ2CImauO3YEianEVhlxov4BbmNuo3jelg5YxhSKatPQMortw4+/A/79lVN
	1QNbImQK0hLIN3u4/Tz8an+eUCH/2jxQ1SlVYG4A1QPZRbnKR3W21zdKLUPwc50LrzATa5Y3ZTF
	b/Ov5RCMpW6DCMuvAg2lDKI/AazYA5lGHUz8=
X-Google-Smtp-Source: AGHT+IE5Vc7OGRx4QhLjcitwZKIWZGvajhiltbo4bWSxvPQDoCrplva3mLaEOWP7EA2twj6pT6oskw==
X-Received: by 2002:a05:6a21:6b02:b0:21f:5598:4c2c with SMTP id adf61e73a8af0-2390db673cfmr29574196637.13.1753154125053;
        Mon, 21 Jul 2025 20:15:25 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2feac065sm6027612a12.33.2025.07.21.20.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:15:24 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 0/9] Add SBI v3.0 PMU enhancements
Date: Mon, 21 Jul 2025 20:15:16 -0700
Message-Id: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEQCf2gC/23Q3U7EIBAF4FdpuJZNB/oDjTG+hzFNoYPLRekKX
 aLZ7Ls7bWPUXS8PCR+cc2EJo8fEuuLCImaf/BwoVA8Fs8chvCH3I2UmSlFBCYqfpnOPGcPS++B
 mrlWDAiw2ZpSMLp0iOv+xgS+vlI8+LXP83PwM6+lOAehbKgMv+VA53WioBDj1HH2ekw/2YOeJr
 VoW30JdAtR3giBBVQpq05ZSSfOPIH+EWog7QZLgWmOG1o3aOrwRrnvFiO9nmmrZe7IJUxq2qbr
 icasn4De9LdLT7/YPgkRFPWvdiD/80zqgGRJyCpNfuiI3B5A8WkEvX78A6qJO7qwBAAA=
X-Change-ID: 20241018-pmu_event_info-986e21ce6bd3
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_201526_624834_E051F680 
X-CRM114-Status: GOOD (  14.40  )
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
[3] https://github.com/atishp04/linux/tree/b4/pmu_event_info_v4

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
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
 arch/riscv/kvm/vcpu_pmu.c             |  75 ++++++++++++-
 arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
 arch/riscv/kvm/vcpu_sbi_sta.c         |   6 +-
 drivers/perf/riscv_pmu_sbi.c          | 191 +++++++++++++++++++++++++---------
 include/linux/kvm_host.h              |   2 +
 include/linux/perf/riscv_pmu.h        |   1 +
 virt/kvm/kvm_main.c                   |  21 ++++
 10 files changed, 258 insertions(+), 59 deletions(-)
---
base-commit: e32a80927434907f973f38a88cd19d7e51991d24
change-id: 20241018-pmu_event_info-986e21ce6bd3
--
Regards,
Atish patra


