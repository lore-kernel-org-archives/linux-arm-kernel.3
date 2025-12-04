Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3E3D20690
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 13:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPEKow+S1V9nD4RjhE0AT2vR6lJZBYGZgAPJj0Y/F/M=; b=u/kuQv2VXFZrM6rv8kFBD1iPbx
	ZcEH6U11dCeEwHk6DaAeg4B1DNA7+DorQNSivm7bhW+obmYKfElj1SkCEnfx5I09ex8O8TLmjF9tb
	SyCCJBxncvEUxP8xXBqAdojVGwOpC+RxRya/Y1OyJPXPSAMcazEDKA473DNdfJNEU4dh2htw2qT1P
	Fzox/LQikCH4DWEHc3nG4EFRpT5JZjCPo51fBX3XLFJgF8AgVixHm0LxlCBM4yXg90L4hmoYtI/A/
	b9zWx3c7lgHP+l1M0BHTV3LXhpPWHtFDNa3lsqas0zZdVgSyi6SkKOdrdfTUkCm3uf+Qhd+4ZJPTW
	ATpzz/NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9M0-000000083U3-3Qun;
	Thu, 04 Dec 2025 13:26:41 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9Lx-000000083SY-2OzU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 13:26:39 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7b7cdcdd8afso42238b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 05:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764854797; x=1765459597; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPEKow+S1V9nD4RjhE0AT2vR6lJZBYGZgAPJj0Y/F/M=;
        b=NwG2P1JgbTmEd+MKEkSq7r0nnCwYXU8I3g6AmyZmJvA/tcBwOt6/Um4Vj1h0PxP7rO
         c1NQzfKwIYJuRwT/k580b9ewAhWo9nAEKlyqVMcr90ymEwuqzJTbL0IqnzDlgySktrQM
         goUPcf96CiLjzOaioYGQ/ECSb3uN6HFWDhPjpKBo61HoDYgsOoJdHlliWWT3DqE3JdDk
         X5f7hJLhbbOhW+MEVPqIwa3lovf5sU2ls5muXW7yJHhcRnT9OAQbpkWQ9XXS/fHbWScP
         +zAVLutXVTxsh0XU/q6dCfkQFYm82L49162kIrjGiW0SaEDWful/cCWix4F3PIkEhDLM
         NC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764854797; x=1765459597;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PPEKow+S1V9nD4RjhE0AT2vR6lJZBYGZgAPJj0Y/F/M=;
        b=dp5Vl8MQkU+EUdxS0R9izUtTNJQNdDXgHSZsSFrV6Da7drOcBSLzbE7DxKZiGNOL2D
         3YXLpvF8duTvQ6hyZnoaLHyjtxhc3lkXga6dIbgTjiYlBUNosDzJOecvB8zrPnW76uI7
         fG9UbIGrSof5BwqR4L5In9bJozKRQba/brjZtFuXbHmKS0R7qyPy1qq7pouT59ISjvZJ
         JE031D0wRmEpGg3h0AcfttPTNH7nAqmuKwyDdu3FRJpPMOeP/325A9W+ujZVb/rNj4Bk
         y+ILgfJ4OUICNUGy9emeLpEQat9dDcDyA6zDJuuRFg2cFN2V+E4JweHt2CBM1uUkP4rR
         x3Og==
X-Forwarded-Encrypted: i=1; AJvYcCXYXOXloFUWCIDGl4phUzT6okkOg74UMQN6aqqGvvk8GrtBiaU/MZ9YZElWs9lErLVSMEwqh4YuJhhtgxFCJDfe@lists.infradead.org
X-Gm-Message-State: AOJu0YyRymb4TSo4VGPtrH6wYu9TvWF/h3g18zdZZ/EO3L8aelZ2wlIR
	Ocpt+K9x04qNm7wPg7AlvizKh2Wmn9kJwcQW3Mvnve/IU2nWA3UnNUBCs7YKpSs/Fw0=
X-Gm-Gg: ASbGnctmClpO+CsJ3z8BpE3pDBdqstedqRaOgLrSvzb4taHshD5J6IqP5BRtwf8AmqU
	MekqcB6vZgvcnQUxXXe3JF2ijNR3qK9uZty1PO3ZUoqCpnKzFiCmFTNjqveGvRQmmwfnnefEPg+
	OLC2OljG7/L+a2qTx1Itr3UYbWJZP186y7YQk1HDYqxZSsJpTejpbo2Kox48g2QBagg5fYFhC/2
	6KmkqgeFqIlTHHRS67n13q80gMCUE0rA9bdjxnFJZxHyhiB4W5t3BCqKkkZTJDJMfEPVpVcXzp+
	Vk+3J3fUXV1L7+/H6Huxs3plbj4JhxeLA2ojo5FoNBVokEtm+hs29jtjO+grBXOr5zqVIxDzumy
	LzfkmJD3jBz2fOXF8NbEBQvJ5TZD2QwDgthty9+djfOn7wh8pF65vQJcXOzAPCk0TsrZ5JLl+q8
	6HKLGxMrhsubnpAxgrTGN4hL4=
X-Google-Smtp-Source: AGHT+IGrHboW09wMQpU4oVsmDnSvR1IeUr9hXakfYrN3aeCUws3FeuN3UgGRx5C6/MohpF51Ft6eMg==
X-Received: by 2002:a05:6a00:4703:b0:7e1:afd9:9a66 with SMTP id d2e1a72fcca58-7e1afd9bf60mr2011009b3a.2.1764854796666;
        Thu, 04 Dec 2025 05:26:36 -0800 (PST)
Received: from localhost ([1.232.169.190])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7e2adc5c355sm2211441b3a.33.2025.12.04.05.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 05:26:36 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Dec 2025 22:26:34 +0900
Message-Id: <DEPGT7OPYNFW.10L6V344HZE4T@ventanamicro.com>
Subject: Re: [External] Re: [PATCH v3 8/8] drivers: firmware: riscv: add
 unknown nmi support
Cc: <conor@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <luxu.kernel@bytedance.com>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <jassisinghbrar@gmail.com>, <conor.dooley@microchip.com>,
 <valentina.fernandezalanis@microchip.com>, <catalin.marinas@arm.com>,
 <will@kernel.org>, <maz@kernel.org>, <timothy.hayes@arm.com>,
 <lpieralisi@kernel.org>, <arnd@arndb.de>, <kees@kernel.org>,
 <tglx@linutronix.de>, <viresh.kumar@linaro.org>, <boqun.feng@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <cleger@rivosinc.com>,
 <atishp@rivosinc.com>, <ajones@ventanamicro.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "yunhui cui" <cuiyunhui@bytedance.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
 <20251127125305.89961-9-cuiyunhui@bytedance.com>
 <DEP50CD8K22E.1JW7GL6WLK44W@ventanamicro.com>
 <CAEEQ3wkmFXAqBfHwJYbJRc5pagOJvtu-wEYGwXBF2beQiSMT1w@mail.gmail.com>
In-Reply-To: <CAEEQ3wkmFXAqBfHwJYbJRc5pagOJvtu-wEYGwXBF2beQiSMT1w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_052637_635046_3FB5AB7D 
X-CRM114-Status: GOOD (  11.38  )
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

2025-12-04T13:18:00+08:00, yunhui cui <cuiyunhui@bytedance.com>:
> Hi Radim,
>
> On Thu, Dec 4, 2025 at 12:11=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrc=
mar@ventanamicro.com> wrote:
>>
>> 2025-11-27T20:53:05+08:00, Yunhui Cui <cuiyunhui@bytedance.com>:
>> > Register unknown_nmi_handler() as the handler for the UNKNOWN_NMI
>> > event. When the system becomes unresponsive, unknown_nmi_handler()
>> > can be manually triggered, which in turn invokes nmi_panic() to
>> > collect vmcore for root cause analysis.
>>
>> Is UNKNOWN_NMI what we expect the watchdog to send?
>
> For reference: As stated in
> https://github.com/riscv-non-isa/riscv-sbi-doc/pull/223, "Generally,
> an external interrupt is used as an Unknown NMI pin, and an Unknown
> NMI event is sent to the SBI firmware by triggering this pin. Then the
> SBI firmware will send SBI_SSE_EVENT_GLOBAL_UNKNOWN_NMI to the
> kernel."
>
> When the Linux system is unresponsive, we can manually trigger it via
> BMC (ipmitool).

Makes sense, thanks, and do we plan to deal with other crash sources?

For example if a watchdog/sysrq triggers a crash, and then gets
interrupted with UNKNOWN_NMI.

