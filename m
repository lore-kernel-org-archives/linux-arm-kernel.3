Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AFACE7B0A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 19:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqFSHDCPRksQdHdUyv1FMM63cJMW5yRb5MbRUz9Ot64=; b=jIvS2Gd5g7mVegVMYYeNcNvtSM
	yr5WLZKUNWhGxf320GjPhOUenDmZCRFJw0dlzEsoVRH7gm5clwc2QsWp8M5uz5LZAlh6p1VaqVJkv
	eUnkDdcDM0Bkn137k8ykVWq56J9kdKph38ijGYzC5XPRXGLyZ5qDJT24/vv+IXfUXRMQUj8g+kmPm
	AKUndoe69KLg8+7b43sCYe3gtqmdIwgYSSHilkTgBVFaF5sYLZUWjq3yw0ZpuXDFt49UNLAubWytA
	aWBi5Sh5o61oSdONCz380qiC0DDXSeZftfJTWKBg123TByS+7/UkfEu5AN2lkfJ/fUElwos+XUlCq
	LeWX2rTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzKw-0000000D0xd-42R8;
	Fri, 14 Nov 2025 19:19:58 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzKu-0000000D0xD-2CnW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 19:19:57 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so364344666b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 11:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763147994; x=1763752794; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqFSHDCPRksQdHdUyv1FMM63cJMW5yRb5MbRUz9Ot64=;
        b=MGU40DDUtozx7XhnvJcWgpyIraAI2GW9zxaEQ3DaRqb4Qi4RaeJLTbXCJ8OPc8XOIR
         w2y9ODb6LVzuasSK4VufauaAtPRtJj2uuqn0Zr2HPKKI10T9FVnyEwY/SJ3j5PCfDieQ
         qZ6iPXwK/0hsmGokF4fxOLaJcvFuL/jF5Moqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763147994; x=1763752794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sqFSHDCPRksQdHdUyv1FMM63cJMW5yRb5MbRUz9Ot64=;
        b=ikK5BKbS1iv+hNZMIT9Ix+hzvKGJmTEB4UXLxba/itCatz5buIhcec+eTDMsYV8h3d
         fMDC9QkCHCqPojdN0TYXBshlLuu8c5sqNGHPPfHIWMPtMGOVvByFkrWAC30LOkAydSqE
         D5qArvOmMTnmmATewW/LNtdyqhbrtbb0PJRSsHB+Piy+sZVTi8OTs9vKZmlX6lbPcJTC
         zLQpPIPrnEv4/bPbDwXVwmW19N/sRrkC0NQgIEtBNdBEBkOMOr3bGmUbPfZBDY3OKWKa
         712ENOW3xa0/sasum3vwsNS2GUeZv/0RI4y6GTHhrpc/KEu5JKlfajJG/SS6yXfgOUD2
         0jMg==
X-Forwarded-Encrypted: i=1; AJvYcCWykfukz2KJuiOocbZHLE8/T6aJA5ro1P3eEk7JotzZiGJ9iuA+mVTBDlpZnpz39vpVh3Wu1O5hC6sTdCsgd3JR@lists.infradead.org
X-Gm-Message-State: AOJu0Yynyx0drZyz71tvLrZEC2kh0npqB8ELjPMqZES0u2+cBwy6WSXE
	v9+9XfqlCC2buNspZworweSVdJHkIeT+Gv3OQD60jodoomigwH4ArMCOILiUR/QSectCwikeXWl
	rYn2ziA8e
X-Gm-Gg: ASbGncuJBpuJDvR0uOgfgAMpBCeabkkuV3prj+NQEBiDT8Md09MgAviUXMJHVMMqVIG
	CgHs3FJWuG7MNUb9uAFjaDsAywon5hxRS22pMblbeJbyCurWpNAkcHHc9saGEa+lkudf1MjkCmO
	YNhGcBan1wZwWz3l8wQMU14DhESEn4HODDLqfANAabYZZjTQMMxDrMcOexaUvG00BJQTC8Kr+9B
	Jze1kHGp1uSjSfRUnSbGkAM1kbI4FXimLeqGA51h32R/kfSxd2uqMtjJDiBQgtKTX3QDtQ6dzPL
	qQor+litW8I0FhKEX6eQG1AYfojkPRAS9I9tCGcaWn65rQg5B+4A0F0/cvUusTxzGhcyyRCjvYK
	9BLL1SH7qi00+VfluHQj8nILOdgsixfTvhtdg07MKw9qOxx7qQDcTWLThiR5g1zGR53gQnOwhUR
	j9+ONy2nSOKHgYJJ6uNfQzGHcrwKGNtRTTg4iWXVUs3+OZ4JOepQ==
X-Google-Smtp-Source: AGHT+IHDqERn84GSNvXPsgO7TWXUwJZQN5p7pKE983gsi2Ux5g/PVrkveHHbimXLNxqRe6wRYXxWkA==
X-Received: by 2002:a17:906:1457:b0:b73:6d96:9c8d with SMTP id a640c23a62f3a-b736d969ec9mr244458666b.54.1763147994180;
        Fri, 14 Nov 2025 11:19:54 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb91bsm443032066b.70.2025.11.14.11.19.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 11:19:53 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64198771a9bso4395796a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 11:19:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX33dSATRWxHZDcw0IbJXj2c1jwnKWLkaWW4dMOPlIeTnm65eiTLQax/IKJnKvXr4t3L6PU2mIJfECht4VCP7I3@lists.infradead.org
X-Received: by 2002:a05:6000:178c:b0:429:c14f:5f7d with SMTP id
 ffacd0b85a97d-42b59367935mr4118712f8f.29.1763147649019; Fri, 14 Nov 2025
 11:14:09 -0800 (PST)
MIME-Version: 1.0
References: <20251114033243.76509-1-cuiyunhui@bytedance.com>
In-Reply-To: <20251114033243.76509-1-cuiyunhui@bytedance.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Nov 2025 11:13:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vh-guJS+5BAqhao9aECtkRFgoqEjpzhuDYEsRVqtVA6w@mail.gmail.com>
X-Gm-Features: AWmQ_bljLqXqDOKTQP59kORhab2-SwO6F5Qm44XiGdi2quOMGlF7tExq5Grrg24
Message-ID: <CAD=FV=Vh-guJS+5BAqhao9aECtkRFgoqEjpzhuDYEsRVqtVA6w@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Add HARDLOCKUP_DETECTOR_PERF support for RISC-V
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	johannes@sipsolutions.net, lihuafei1@huawei.com, mark.rutland@arm.com, 
	masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_111956_595225_E98B1733 
X-CRM114-Status: GOOD (  14.45  )
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

Hi,

On Thu, Nov 13, 2025 at 7:33=E2=80=AFPM Yunhui Cui <cuiyunhui@bytedance.com=
> wrote:
>
> After discussion [1],[2], hardlockup_perf cannot be completely replaced b=
y
> the hardlockup_buddy approach, so this patch is still being submitted.
>
> v1->v2:
> The contents of arch/arm64/watchdog_hld.c are directly consolidated into
> kernel/watchdog_perf.c.
>
>
> v2->v3:
> Add CONFIG_WATCHDOG_PERF_ADJUST_PERIOD to enclose the period update logic=
,
> select it by default on arm64 and riscv, without affecting other arches
> like x86 and PPC.
>
> v3->v4:
> Place the line "select WATCHDOG_PERF_ADJUST_PERIOD if HARDLOCKUP_DETECTOR=
_PERF && CPU_FREQ"
> in the Kconfig files for arm64 and riscv in one line, with no line breaks=
.
>
> v4->v5:
> Remove __weak from hw_nmi_get_sample_period()
>
> v5->v6:
> Removed the dependency on CPU_FREQ for WATCHDOG_PERF_ADJUST_PERIOD in Kco=
nfig, which fixes the
> issue reported at: https://lore.kernel.org/oe-kbuild-all/202510240701.eB6=
r97V3-lkp@intel.com/

I haven't tried compiling this myself, but it seems like an OK
solution for the compile-time error to me.

-Doug

