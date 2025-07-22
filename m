Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38CFC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 04:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azXxDouz3VhvVI25kVzCdndCbjprC2M8LL1OP84oLB4=; b=YLrmMDl2ry8XNBXnaFKSFz1to/
	soTn1NZR+n6c3agIYdLZqsyCbz8t/5jpo2cMziy1QWMomF7PjUwlA+aqSC8W5KVvcAp1CuG+VzKfj
	unwTu7z387BIgJBDv2vVelX4rEp2gzAns76jzjMvEb2ANmrf6IcOYU579sYQ95L13vxer2JKBP9wE
	fPEzX/dO2fAPa+vwt7D9kvu5hovS3xtf+MFgv/S6fh+GCdssopvOygaK37WoXGBV+9uYMxYe6F5yd
	rJ2U7w7JpVciz7SRc7Ayk39MwOyYfeDVjR9ZARYxRKy28uTO5JbeKPsvLFrM/oC/b3fF/LH6+e87i
	/dN2z8Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue4D5-00000001EEw-2LYn;
	Tue, 22 Jul 2025 04:02:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue4AZ-00000001Dun-1LFh
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Jul 2025 03:59:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=azXxDouz3VhvVI25kVzCdndCbjprC2M8LL1OP84oLB4=; b=mXA6yXr5jMfdRkH70mwzKtK5J5
	Ew4vNdie2OsLKLuK0NVpsMMDH1FOH8yRDB8kHiYZAscsXFCQPNHnhw68VTdNO+pRaMuKNJlGqY0Oe
	1dYkRPDmqC9pRTWc9KOlwpqqh2s461Sk41VdK45IhMBz9B6kYqK5+iTix8zB9vLRmTNYWTZziYNMN
	Vit58cNLLrTG9gjVfpoamsud6AFJ9p+eyFIyvE0tdFBaNfmS6t1RYXCz6+6r9oDgnEt1WCQwV5I3C
	aYuWBOXYtN3WJC7IfgXB8S+8dITh+GdZKXGRAcrmrMBYkZRbQZnjN5Yh5DBNUJVN/UGVQOZ3KpCRk
	tYjTQJoQ==;
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue4AU-0000000BCBZ-3kdw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 03:59:58 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3e293a3b426so49598615ab.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 20:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753156792; x=1753761592; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azXxDouz3VhvVI25kVzCdndCbjprC2M8LL1OP84oLB4=;
        b=qPj89OhPdB+BCgWsbcQhFEwrJFqU0AwjOyrxYSt34ga2IHhrHlDs/ZTlrR5HjSOMUF
         lstpQDrOzvKfNJLB0uXvJavSChYlKRzz3HzonmP2jlM/E0RVYyMjptbU2XWcX2fdRijL
         H4FcSgUzlbk33eY5PR1eKNAtmecOGUqOje6fVjsIObuftmPhs3zaC6Upn1Xt9LUB58zo
         6WWEKqUtIdtJYfwVCt+WQ+1svcnb0wVFXUu8tL8YpzjaPZrBK1Lxo2dCdh3PUE2sW1L7
         jjjLUHeM2LSJBoAxlGj1GGaxm+HPriepHzpDCsZ9ZOg+ps+ik/gZ4ZKd13iXyJUsDR12
         fUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753156792; x=1753761592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azXxDouz3VhvVI25kVzCdndCbjprC2M8LL1OP84oLB4=;
        b=WFJ1fq+CNKC22o+w/efSJZcz1BdORMopkeOBzjW5/KeaQSVDjz3ltBAjzll3Kdn960
         csi7nfK/G/itN5mVnO6VizCFTxEt+eo+aFBNdxjFyMd6Fc6qsX1xzPv69634vUlrOQL3
         nK7IYVcexho/t278a2rwh2k5dDBh/XmWu00KxRWPFdlvQYGmugcpUuBFWeBEiBZuohbm
         DsvP/W46rhgFmB4VJZElPjPx2ZSftR/5dyoMly0S/1Knf9KZ6YCRTqgGJqIQEk6CtXeU
         OAQX46EOwGM+Poag/nyOQwn2mKdmMuGJVOfFKs6De5GBTeSfJ3GWD/NzjgDlP43lxKOd
         OktA==
X-Forwarded-Encrypted: i=1; AJvYcCVzGPph/GPlO/H13zSQtw+SnWun47bi2l5k2O79HQXWbz3gejk1aCyG3N3rDQp8Ey5bGGnrfib1TwsvjU8fydYP@lists.infradead.org
X-Gm-Message-State: AOJu0YwK/WP4oMaTlIsBmkAc9VrdHW9e8IelqmmsD6xl0Q9OwFnqntAa
	Sc1rJRpCN/Ol9MUTUu7NSnE/BsuTAUH0IfLUK977s/N+dfOi2qsEo82hPA7CPkI3j+AAQaYqtVo
	clyAKWMaE9/ayIY8Kh3fjUFYoo1Gge9PKgeGOp7t9JA==
X-Gm-Gg: ASbGncuR8mkiF69fB92QcQRYGXFHCnCVo9H2G6QYS6eyqLzlelQwEjrgP90gizP/BxX
	9cSB6jKq/aFLQi9++bLjAPngZH36axljaHQbi/iIBJ6eVxLHtdVQJOba/1Kn8i8EYgcNXudEWE1
	rftQwj644i5uQOb7H6r7kGAthsJr1mWu2MSQC4F33Rcc/1b4ORNCWzop8SmoL+TOoH867EVYvri
	4GsOqiY
X-Google-Smtp-Source: AGHT+IHpX4gv3L9qRgmkg5vRrd6Bn1uOwCgW3ASTBkfj3oy85sashnMtNel4xRNvCLmx3HyMPs1rhWWMG3wCUitrJq8=
X-Received: by 2002:a05:6e02:1a2d:b0:3e2:9f01:a87f with SMTP id
 e9e14a558f8ab-3e29f01aacamr172092815ab.22.1753156791976; Mon, 21 Jul 2025
 20:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
In-Reply-To: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 22 Jul 2025 09:29:40 +0530
X-Gm-Features: Ac12FXzjUPyCjGixcXNmSF9Z7RGo8cjqQ1deNGPVZVPzKJzPPazl7D1wVYDTxbU
Message-ID: <CAAhSdy2XM+3UQD0FZehJnmCbjwRMCZQpt1cEkb4gmJu+LFsaKQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Add SBI v3.0 PMU enhancements
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_045955_295865_9AC758CB 
X-CRM114-Status: GOOD (  21.88  )
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

Hi Will,

On Tue, Jul 22, 2025 at 8:45=E2=80=AFAM Atish Patra <atishp@rivosinc.com> w=
rote:
>
> SBI v3.0 specification[1] added two new improvements to the PMU chaper.
> The SBI v3.0 specification is frozen and under public review phase as
> per the RISC-V International guidelines.
>
> 1. Added an additional get_event_info function to query event availablity
> in bulk instead of individual SBI calls for each event. This helps in
> improving the boot time.
>
> 2. Raw event width allowed by the platform is widened to have 56 bits
> with RAW event v2 as per new clarification in the priv ISA[2].
>
> Apart from implementing these new features, this series improves the gpa
> range check in KVM and updates the kvm SBI implementation to SBI v3.0.
>
> The opensbi patches have been merged. This series can be found at [3].
>
> [1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0=
-rc7/riscv-sbi.pdf
> [2] https://github.com/riscv/riscv-isa-manual/issues/1578
> [3] https://github.com/atishp04/linux/tree/b4/pmu_event_info_v4
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
> Changes in v4:
> - Rebased on top of v6.16-rc7
> - Fixed a potential compilation issue in PATCH5.
> - Minor typos fixed PATCH2 and PATCH3.
> - Fixed variable ordering in PATCH6
> - Link to v3: https://lore.kernel.org/r/20250522-pmu_event_info-v3-0-f7bb=
a7fd9cfe@rivosinc.com
>
> Changes in v3:
> - Rebased on top of v6.15-rc7
> - Link to v2: https://lore.kernel.org/r/20250115-pmu_event_info-v2-0-8481=
5b70383b@rivosinc.com
>
> Changes in v2:
> - Dropped PATCH 2 to be taken during rcX.
> - Improved gpa range check validation by introducing a helper function
>   and checking the entire range.
> - Link to v1: https://lore.kernel.org/r/20241119-pmu_event_info-v1-0-a4f9=
691421f8@rivosinc.com
>
> ---
> Atish Patra (9):
>       drivers/perf: riscv: Add SBI v3.0 flag
>       drivers/perf: riscv: Add raw event v2 support
>       RISC-V: KVM: Add support for Raw event v2
>       drivers/perf: riscv: Implement PMU event info function
>       drivers/perf: riscv: Export PMU event info function
>       KVM: Add a helper function to validate vcpu gpa range
>       RISC-V: KVM: Use the new gpa range validate helper function
>       RISC-V: KVM: Implement get event info function
>       RISC-V: KVM: Upgrade the supported SBI version to 3.0
>
>  arch/riscv/include/asm/kvm_vcpu_pmu.h |   3 +
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |   2 +-
>  arch/riscv/include/asm/sbi.h          |  13 +++
>  arch/riscv/kvm/vcpu_pmu.c             |  75 ++++++++++++-
>  arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
>  arch/riscv/kvm/vcpu_sbi_sta.c         |   6 +-
>  drivers/perf/riscv_pmu_sbi.c          | 191 +++++++++++++++++++++++++---=
------
>  include/linux/kvm_host.h              |   2 +
>  include/linux/perf/riscv_pmu.h        |   1 +
>  virt/kvm/kvm_main.c                   |  21 ++++
>  10 files changed, 258 insertions(+), 59 deletions(-)

Are you okay with this series going through the KVM RISC-V tree ?

Regards,
Anup

