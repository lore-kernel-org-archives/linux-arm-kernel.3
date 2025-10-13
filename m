Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB60BCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lt6afCrReoA0JetcvxGjdIUfBcXG8UG+CLV9XrNIQkA=; b=nxSjjOmA7l1bRZ7B9NvT7/4TsC
	JjrTOchgYeCFT5gJ4DwStt8hPC8W2O8l77H3N1vYOTDbIyvTEH1OXAtx6EH5Yib8Zm9KIiGXMx1kf
	5BX3h35fhLlaBGD1kYpisWKMbHjy/LdXd+dsIXvXmMUkfYL09ljrOFYz1L7Uo1io27qv7sByON5sk
	EQxVpEKUpM33BXa+MmfI7OhWKGhksNb+mIN9uXhiooWXbephEGrYm4asrdUCaQQe+nBvXah14QT8X
	KkYc1FP6+VfjL/ZCUdjp8ix3QbXQEc33w556eU0PoGIep/jaJR3WaljCD2AQB9mUwEmp1yGB2miCv
	sutIN54Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PAP-0000000EMRL-33G1;
	Mon, 13 Oct 2025 20:29:13 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PAM-0000000EMQB-3QQj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:29:12 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-9032edd72c1so542142339f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 13:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760387350; x=1760992150; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lt6afCrReoA0JetcvxGjdIUfBcXG8UG+CLV9XrNIQkA=;
        b=pXlTm2/NMtGwk4tu6pdXKq+6L0LqpaQFXzTYlH2emQBMHhYiGLopmw9qyieIqgZQih
         4vfSpkQhrlngxMyKLBw6obK4YCfFjS4G4yU1CekQr0YKUgKgAH3qZjXE/wTaa3crBrSI
         NtcOSctzqqzAVrcMjThBY/PLYZPmIHwxJ5CjBpnSyDG3y5+cFBreVnH0ltzktKMEQRir
         abQtHVtAgp6aYmus3HWU5aZuK29XkeWR0KFKYy/QFyUW7Kro3S8sFD593uIViqMLU8hn
         /m+xyQ4AkP4ByiaoiVepNv5aMQ2FIldgtJWbLHEr5Sox4exCzkYQrJWcDWqDG4+QQvkm
         snBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760387350; x=1760992150;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lt6afCrReoA0JetcvxGjdIUfBcXG8UG+CLV9XrNIQkA=;
        b=fgVwT4qgpWpWCuKWXHa+tJ6RsqU6sgc/9yPdLX3yy3Ucg6cGuL8RIxr/P5KK2ykgXf
         QPPyAq+1seLIRdea9jLNoKuqtsYjlLCym1IJ8mgbv7vJ0K7FR7jgclpHDGgFYOmV78aq
         pduHH1HywoxvO/uGcwvnLv9KaTYHCELAQXLZkDud8QdazmRT3zDkLeg80V51AzcTEGGw
         oTBDkTxUDV4uofjBi9xhrDl3r1aLn/UMfmNrXVIF7MmweNhHcRippKwcPkgIVzU2Lrjf
         KYurMg4C1vZMyu6Gbr+HMNzAcb7zNVZ+WgHheZGlcsjp7EgV+HmHQGBhWFge5tLHiDck
         E/Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUAa52gqTV9p/vmmnj/+J7rHS0zPQNdBh6t/wpJ42yArNkpi5FjYtwZa2qwYjNrqn7WF5NT3bi66zVPVv/f/OU6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1QjzL3gwfoD2MvJkLIGM8wNqNr/DKcH097QHaxE4ETFgvQTgS
	3PVBT1VezNzGvmm9H8hPpQ4Y34oFd0ivwRlF6BSbM8IQ+dQBmVXUnKL5qAM+WbRu0cKDvOhNuBw
	vuqxFJdk=
X-Gm-Gg: ASbGncvX6tJbmgtIPrawiM+soZoJVxbArxO8q6XoPwGPlASsvQDTxTbWMHNPKYkIy2E
	yHrWnBfLq136mX+wSeBzBN9f4YRt2DGC/FneTwvC7Bw8R05KijsCDQTQMzzYjsKcmKihPVdsdrH
	BiDrelQnNaLPQG8o9AgDv4XcHPla1VH0s3vr962ZQAcPSGQeYYfWFEwcpM0FAMq7kXECW2xG/aa
	G+rDgIvCfefek6F8vh3fe+qtkj0sSot7+pbYluhPWZhD9wOsK2z+abOehTI09NgNE8wDkqDPd2n
	6LT9M0apAHnmE+edbcmA19G9ZXaYByOBW7x9ZmbuNKXd9OH9KmxJktk03s/D9ILbrEhGFSZ7xkQ
	i2mh/DROFgaKM/8S6yAv9w1QMVGd5Rtr9QuqKepSZxWo=
X-Google-Smtp-Source: AGHT+IFAEeOFIgQZsxlTo4ZFQ5S1ZlK+bDlxrvpTDcY38SUWGb8pL41ejoZdXoSRHGQSxWChB02oUg==
X-Received: by 2002:a05:6602:6d14:b0:926:a24b:dce5 with SMTP id ca18e2360f4ac-93bd18a2e74mr2738341339f.8.1760387349638;
        Mon, 13 Oct 2025 13:29:09 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-93e25a97830sm418857239f.23.2025.10.13.13.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:29:09 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:29:08 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <pjw@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Himanshu Chauhan <hchauhan@ventanamicro.com>, 
	Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>, 
	Atish Patra <atishp@atishpatra.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: Re: [PATCH v7 0/5] riscv: add support for SBI Supervisor Software
 Events
Message-ID: <20251013-c5eb76e005d982fa4c8ce2bc@orel>
References: <20250908181717.1997461-1-cleger@rivosinc.com>
 <86817f9a-c601-81e8-b95b-0f2396275f95@kernel.org>
 <628d357c-f462-4dc8-92f2-99006b73e0c7@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <628d357c-f462-4dc8-92f2-99006b73e0c7@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_132910_880475_15DC67ED 
X-CRM114-Status: GOOD (  13.75  )
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

On Mon, Oct 13, 2025 at 08:53:01AM +0200, Clément Léger wrote:
...
>  I would have prefer a bit more reviews and testing before going through
> since SSE can be quite intrusive at execution time (even though the
> classic IRQ path should not be impacted, I expect mostly feedback/bugs
> from the SSE handling path itself). We'll see in a few days if people
> find such problems.

I've been planning to compare this series with the code we merged into
kvm-unit-tests since the kvm-unit-tests series is where I put the effort
into reviewing wrt the spec, etc. On a skim of this series I see several
similarities with the kvm-unit-tests code so I should try to actually do
that comparison exercise, but I'm not sure when I'll get the time...

Thanks,
drew

