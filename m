Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB40CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4tnLzSgoyH5Nmr+fmB4heyANSklWEBYDavEKVFkzKtE=; b=fMKF6Ks659uXgzQOgB7UCYoEB7
	xzFh/OJG4Qd69A/nTtE53eHg5j8IH4qg4hTDiSUgn1OcxPCaKcaphfKInEN06kYyklBhzxAX2jNXr
	6x+hLMz9LmvXik1qCtcvv+jTM5SNcDtuKgCiiZhDMyDLa/QljvAtCKV0/dVTAx2B9R69JKJL2Yqxl
	V6PKC+yq8WUXPqQ6UVTSZLr6sneq8nywD/KaW75+C1O6qquvCXZM3pkBEMFk8Lkn9cWi4RvwcAyrc
	bVA9yxx9WIaidU69frbVz11/kDFbLd4qOV5ODxvhiXfaNi9+xaUNX6PSiuU5LXiS3kxrrobBcyjHQ
	mxMku/cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsHj-00000004wrG-1CX1;
	Tue, 09 Sep 2025 06:56:59 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvonq-00000003tlK-05U3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 03:13:55 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-30ccebab736so4426784fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 20:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1757387628; x=1757992428; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4tnLzSgoyH5Nmr+fmB4heyANSklWEBYDavEKVFkzKtE=;
        b=MPgc+i6yC+6b0ZpRXK7TvWPVqdxPHELr/aLzapHM5jVE4SnueyD5fk66IS+ASxtgjg
         aUeTRQD0B74TUirDEC4kJWrKnWqpoQCKFzHQx6oPjfQ/7G61wYoQCri59enrl14uESQ8
         mbA3icJuPUAVEtjrcw96VlZPltFMxkO0gXaH27feNvtS7hPfXKhp3I1vXrS8lkd1TOQ8
         l9dpN1Ipr6emMAgU0IlS73lpBVrjXXPywhv3CiynAWoTLdavMgR+XieBPgaMzfumFola
         rr0oYs5KKvSin4q5+6Timn0gfFLlOWRhQN+uBdb5cjN4Ivo16kwouiJ2jkHfmvOr2vIL
         R0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757387628; x=1757992428;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4tnLzSgoyH5Nmr+fmB4heyANSklWEBYDavEKVFkzKtE=;
        b=EqGkAsp4PAxA0MaJTSiluSJaLCPeZ3V62NGt+TRdS00xwwgOzhLSQjjXiQRmX37QR9
         Q7FQb+qN7ICfe2B+mquaUIgXFHnk/qntiVQX3U1fvm+8sNk6OCKttgi++Rze6fagmZqT
         LyQeBiSeG59Wy+9pmkcigkv3t41ssPxW5gE6XEawiyq5x8P3UsTYFTTa8fHA+hEKNTkv
         FJ0+6tvZIt7lfbjWp3nKgs9YjB5OGGUUWVdnfQ1qduWAb11zAZyQPMD9auzgDUiM77eD
         Y3AVmCWiuHxdsjlmJvqA6bIo0WaW+wDo+oFdSqVrTWBY9EVA+nLa3ArGQhkfFWIGiyzh
         GgPA==
X-Forwarded-Encrypted: i=1; AJvYcCXYF7zqiX1Vpt1QilMI7gdtzubw/EecG35yVHjoWPVmZnAnhqIIOyEB5QuAalYxWZK+Pe+lG9EN1bBicYPp1Cl2@lists.infradead.org
X-Gm-Message-State: AOJu0YwUjrgOyHOJjqAofkO2nrR7lCD/WYfPyZHP5J7fpsPZ0QtkP8DC
	Re89fIu5+CW0Yd8nzXTnuRSgKQLRPLHcUwTRAz3WEv5xkDbQV+mA5UOXSi7LqMKzfwdFAwxj6gu
	MBGYzbtUnQQ1UDIEAGaCyEPtwj869S9p9af6tr1mPYw==
X-Gm-Gg: ASbGncvR4Fsz0wZkjDdD4QGf0UQwlSvTztUviP4tw4AAF3jur2INBIX3fFmwfdLi57P
	mK0PXwFn9/glcdLpB4jTiuuQNk0IziA+ZzWTztpOf+QMPaQuJsAQIDMo1xANT576Ms2ZUrrwi7L
	4hSR1wEP7lTTCg+upUObY+3QA3dPBWotfrX/sJupTqIM0qhjDbJidK0zHUoAZUtwihFjVxXjrmH
	5DbOJiKarRkkhQ50UNwv8d+6BXo47I=
X-Google-Smtp-Source: AGHT+IEjRnKVoKvFFA+E6GmCVRCB5SlIscn/ZuyjOxoBfVf+jCSOBjaZ+L0Ztd/wOGk5yQEwow86CDzdQXH1tpXYsRo=
X-Received: by 2002:a05:6870:9713:b0:321:2680:2f82 with SMTP id
 586e51a60fabf-32262955201mr4819276fac.1.1757387627362; Mon, 08 Sep 2025
 20:13:47 -0700 (PDT)
MIME-Version: 1.0
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 9 Sep 2025 11:13:35 +0800
X-Gm-Features: Ac12FXyRlupJTj4FkuA2woE2fvmmsdddZIrbELQIbDuD4dgkvkFHAjvltNE7XBA
Message-ID: <CAEEQ3wmjRuC-Z1PRTw1chP40KXFksBgHu+dayjYA9KXE9Q0Cmw@mail.gmail.com>
Subject: [REPORT] Should rdcycle be deprecated?
To: atish.patra@linux.dev, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, 
	lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>, Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_201354_065775_BAB53096 
X-CRM114-Status: UNSURE (   7.10  )
X-CRM114-Notice: Please train this message.
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

Hi All,

1. To use rdcycle in user mode, one must first go through
perf_user_access. However, in reality, the return value of rdcycle
remains unchanged. This is because SBI_PMU_CY_IR_MASK in SBI includes
the bit corresponding to "cycle", and the kernel's pmu_sbi_stop_all()
function disables the counting of cycles.

2. Currently, some application software (e.g., DPDK) uses the rdcycle
instruction. In fact, rdcycle is affected by WFI (Wait for Interrupt)
and CPU frequency variations.

3. Some applications mainly run on server CPUs. Therefore, the
precision design of rdtime should be higher. For example, the TSC
(Time-Stamp Counter) of x86 architectures is generally around 2 GHz,
which can meet the application's requirements for timestamp precision.

4. What are the future plans for rdcycle?

Thanks,
Yunhui

