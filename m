Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F900C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 13:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sE7NSB29qsmfs0sI4wgf6B6ZQGe4IKQtX92E6yxep1o=; b=LmrxHZ69U7AOTQjUeCdcCGeUJF
	a0zyYpX+N1krE2nUMtRI4pUq/TUHFRPiUXPOMdLB3tiESPC01xfCEKl1P1A7MxFxQ+fqwGYbfvo79
	O/dL43RWlWIJgur8lxryawQi2seNW8D8nVrkBOUvGSMXxq9wWyaEA2pPu+7ivoFJpye6r7E7TqAkq
	4Y8zoF3yt0bq5V09JCZoDcBNnYUvnm+Iyc13m/Y2JEFrHjMZFsMn8Yqdk6hRLfW1CYsMSlI+Cvfl9
	hXLf+yJd7xjN86QwsA/TRBdG2ToIc7O1PnjwRxHeEEdWIrQQy1EWBh2/ME5MLTOTQwUhtOA3ETu1w
	se545e6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISe7-00000003zPg-1dEp;
	Fri, 23 May 2025 13:41:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISUt-00000003xkf-1rqz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 May 2025 13:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sE7NSB29qsmfs0sI4wgf6B6ZQGe4IKQtX92E6yxep1o=; b=PtFkkcsv8pEjuvuHn4a377d3si
	YlCFw7j8/4Q9l0p64aOI5VrICGSXcEl40rdvr9wAYgzn1Co78zIBWHy6obAwxzf4+OcAK4x18OTKH
	jFpa5hjVwjy8iwVccN1A6gkDwPxjDc/puxgrxkx2P1i08auyERk5dVw8PB/repkaMQ3TGUb4smMAn
	FnJZDJ2BXTXrneZHADXbjFabixjaQl4m6YST+6HeQLwbIGnyMLb+ta9qGxiEg016kVxdACaYPBGR2
	on76akM/q6U/Gr0YHq71VtTmECYFHynUUiKsUtWho8r2NY4p/gSUWi/6ZWd42ByS+1ZhObfeC9LAa
	fpTov48g==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uISUq-00000001KX3-2eSD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:31:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso4092135e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748007094; x=1748611894; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sE7NSB29qsmfs0sI4wgf6B6ZQGe4IKQtX92E6yxep1o=;
        b=aWuxvYiguhPiVqddRe9ITBvF8r4rjy64XUYWh1yWPa+pKQKY99eSWcqPmH+DkM6bp6
         1wD21+cLj//1lQX/BZja0p0otlO+efKw3GfhEM5qvuTykBJanixNzRhXs97+doqV9buN
         rvlVvggYiDbnOrY7I9Xl7saxs8CvPvJkwOsyIgv3R0XZM5MpdUEU8sBpHNUfl4Y609wK
         SW3PFa9NqU6h9iCspWnQi4xQ+5qyr//+A8NuLMuZT0vfXcdR6jCUGNWyoleH/u1UWF1+
         iQORVQDYJkXzKJriJOHlxaDiew/xd+eFjln9kng8+9BpPvnYnFqC5cFtRP2Iw5wvN76o
         9FFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007094; x=1748611894;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sE7NSB29qsmfs0sI4wgf6B6ZQGe4IKQtX92E6yxep1o=;
        b=jqAcB32CQiCU7N4zHs98POFkKvE22fAWETCh50ko+S+rXQsinY438RHQMc5b00AJHJ
         5uPzGyy0GTWdPXZt3wFowsqOWQrMXmr84mino5jxNfWKjLoQtCUUaZsAQwzeMPZUu7t4
         Uc0hNlK0PDtg5l7+W4tZtb4FrM0aWBQkFFNT3dS6F2oeZooG1rw35xyACFXBQj4BM1QV
         uAVMQs7VyZeNDMbscCp2iZAsDauuzeRNmsU7NqpL/4IieaU6CcqQEKL7YIb+qdh8u8i6
         LcLsz/KZ5c9BUBHucvzj0ff/I4dOZXm4DwMEdRTueBHVRimbWkv6JlYSHQqOK0G+R/S/
         u/2g==
X-Forwarded-Encrypted: i=1; AJvYcCUgOAGspJFTgVosTBYk+Unwk0VSZwpbCfAZTaMioJpQMpIxaFgfPfSelZoXniNMMnyqvaBCRY39DjmcihVIomyH@lists.infradead.org
X-Gm-Message-State: AOJu0Yxubnfc5nCzIfCya+hFZS+00vE2ucBVr6tkugQzZvz3OsF7CvmZ
	XExNAF0UP7QolgrqO1HwcOyWyxi1CRqDkoRTrO8BxnuYnkD9pOh7N3AWYVkLJBy0ePs=
X-Gm-Gg: ASbGncu8eT0w391YAoay9OealXaf2nFXhrXI41IiwtVgV+0yOFJhauNcHcA8pXUjFKR
	g0GbLDvDJ5mc6zQb09gAWApJ7pdBwyZRM8UlBDQ9y8/EWHp1UI0kzsAQb+q5LxJnbT/AFZKF18S
	rcUtqbwWZfvOvcNPcuI/v8awv/XBgt0YmnJe+S4HXFlr+GE5UyqbA069kyNVwFJBf2q4KVgb2iZ
	McgKPp/y+9VuxZz5T4kvjhbj1/Yb71D0SxedfzcNddm9xNs5U2lhyCeugDGmbi/zG2O2RN7iSac
	CzwehztQfxqDsqjM5KDrnJeNL01/PeeywEdUYb63noDvkDPeFLsKzOfxzT4=
X-Google-Smtp-Source: AGHT+IH4B5YjATsLpzFQConVuBPC8YzXe6dS/7DO0gd92eFJugpX4BslSSwZcD/zqo2WMw5EUo7NzA==
X-Received: by 2002:a05:6000:400f:b0:39c:1401:6ede with SMTP id ffacd0b85a97d-3a4c2b3a659mr992493f8f.3.1748007094151;
        Fri, 23 May 2025 06:31:34 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:be84:d9ad:e5e6:f60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8d005sm27248141f8f.90.2025.05.23.06.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:31:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 May 2025 15:31:32 +0200
Message-Id: <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version
 to 3.0
Cc: <linux-riscv@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Palmer Dabbelt" <palmer@rivosinc.com>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atishp@rivosinc.com>, "Anup Patel" <anup@brainfault.org>,
 "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Mayuresh Chitale" <mchitale@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_143136_764624_56742021 
X-CRM114-Status: GOOD (  10.95  )
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

2025-05-22T12:03:43-07:00, Atish Patra <atishp@rivosinc.com>:
> Upgrade the SBI version to v3.0 so that corresponding features
> can be enabled in the guest.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/a=
sm/kvm_vcpu_sbi.h
> -#define KVM_SBI_VERSION_MAJOR 2
> +#define KVM_SBI_VERSION_MAJOR 3

I think it's time to add versioning to KVM SBI implementation.
Userspace should be able to select the desired SBI version and KVM would
tell the guest that newer features are not supported.

We could somewhat get away with the userspace_sbi patch I posted,
because userspace would at least be in control of the SBI version, but
it would still be incorrect without a KVM enforcement, because a
misbehaving guest could use features that should not be supported.

