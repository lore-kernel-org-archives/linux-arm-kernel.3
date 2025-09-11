Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D41CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 18:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2jcVNZG5ZEX//KdhkQchWo3YzS/HwpPe9b6xmpZ+pA=; b=uXHhYklFb8pOa0hEVNISfHVUCt
	PpWvDmcGXE/V33qN3CFgITxj3wAC9JueRz91rJRCBd6+LW9HidChZGN+Q+j4ZZo/h+dzwkNJfUM3V
	MOGrtEN9GyCjP5s9JFdDhqApgK3osNqZUX2Gm2g24aCYLkq7e36cwiAjdP/Ve0eJPd/xWEE6/4TaE
	DD9oGX0307C63/oT+TtU1U8+j6gxjD604fZ+Sfk8oimvHvYejjYlxYCWLsi/Y+yYObanugV0YeELl
	hdZVwbqq+50rZLvq7Qukw/0cVj32v7l+tVSiZvWH0+bYJgLJvj0SOsLbY9slGQV3Q6/VP/IW/mHPk
	iYOJSxxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmSL-00000004rGj-44GU;
	Thu, 11 Sep 2025 18:55:41 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmSJ-00000004rEk-2NK5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 18:55:40 +0000
Received: by mail-ed1-x544.google.com with SMTP id 4fb4d7f45d1cf-627b85e4c0fso1727510a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 11:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757616937; x=1758221737; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m2jcVNZG5ZEX//KdhkQchWo3YzS/HwpPe9b6xmpZ+pA=;
        b=SyLahNPZQvco32M2yVcJAtF8WEkQV6KuQd05KvS8jFY8GPL8dtVlZo7Zm2aRAXa8JX
         Oie0Nvc5FkCmqFDeS7KqiBalrAXxQQ8nOIQxPGNNuIdULWz2wFgDRcgVxeGOTtMnlIy2
         u8vmiyHf2hppTh00FitCZtl1TgOiu0b+Zoj8nT3/u/wBLTyxdFIo2OGEqLwbLXPLTuB2
         KGZNdNlmMmnVkUxzm+HXxyOn4uTRzCqaegR79npHHVdHkXIh4uCnY1DrFb60hk7Qv0qr
         13EmBrcPeOzJdxY1C203i4V9u8/Jk7QMbLROC4dzzwxtErcPEEy1OlixT3yLlFH5ZIBh
         Q7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757616937; x=1758221737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2jcVNZG5ZEX//KdhkQchWo3YzS/HwpPe9b6xmpZ+pA=;
        b=wu3PiNOTbrPzqtokEWuH2XZvccNjCPyqRATYII2uYeSN3NsqWRxOJ/cRXjMcffgknj
         Tp/ThOxCMm4hWmAa8mjIBYPIqMv5dp3C3+2Cvy1RLQKiKjy3nQhzeYhBYwnaH0WOuDIC
         PCUbWaweaudlP9NP6alUOz7msiYO4mHznEaXEUhTfDAWOpDfH5984v/GmCytFlMsiM37
         queHpDzkoz196qZGZ22lmgLGmG3Wx1GoBdFBxsBH22UCMWOaeIz8fJtCKRuERfMeDANh
         x78iXVcrZFIg5XUZ4S3N1UOb5hxFVDodnGbzt7wmPHVy2f1jQG9wxvv2v7bzacrfCwMT
         OUCg==
X-Forwarded-Encrypted: i=1; AJvYcCWWVM7LuFNZ2MLakkW2HPVVSMh5k1ByM2vR1vdRNRov5I3oIi5b4KtFG8DzIoS0STR/XzHOUWvxcuKYbAaKVvfT@lists.infradead.org
X-Gm-Message-State: AOJu0YyU+BFZhAEBYTNMfIanL6dweUqvx68XTXS6m/j2XIrglVyj2i0q
	c3Oaym+huarar4MiXavogl8sI59NdC7IQ5+ZLwarZYBvd0gWo2xb0tJJGSmVPAHABDD0VJvGM5N
	IOVQF3WRpPJlWwm9wPOw31PiTuNuX73A=
X-Gm-Gg: ASbGncvy4ueFT1JK3MWZL0RIMFNtmk+0P7evxnhSG9T4fqLbU9NKR97KAhZq0OP4oSb
	imcqmO+EZ5i22yfctoM8xA7R8OZdkWh+80h/rsGw2laJjP4Fw5WQEjznSkYAT9HxIH9LH2HapeH
	UHkPfI1JDXZha2sCXE87XgGsBxYEYdU2HflRYPogC6X12xe6CuM3nFL8RE5duG/TosT7IBguwTa
	so2rgldSIg6c118yZWyAgxum14MqNe0bEzedgJIQAsaF1Y2xk4=
X-Google-Smtp-Source: AGHT+IEr/IXWvEUVKNsBGH0b6WKj5dtPERuUwd65HpbSHS/Si0ATzF+dMBUKu5XaI1NgzAcEsMt3X3T2BqcjI5LqX3w=
X-Received: by 2002:a05:6402:34c2:b0:615:5f47:8873 with SMTP id
 4fb4d7f45d1cf-62ed9b83478mr361064a12.14.1757616936967; Thu, 11 Sep 2025
 11:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250911034655.3916002-1-ankur.a.arora@oracle.com>
 <20250911034655.3916002-6-ankur.a.arora@oracle.com> <aMLdZyjYqFY1xxFD@arm.com>
In-Reply-To: <aMLdZyjYqFY1xxFD@arm.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Thu, 11 Sep 2025 20:54:59 +0200
X-Gm-Features: AS18NWBPwTweWbcsaGIAULsh2_u-nhPNn7i8e_4UZM3wX-YxIBKFfG4Cq4wNso0
Message-ID: <CAP01T74XjRJGzT7BV3PYQOQOwZVud3nL7HfcW3kzU_fPFekNHg@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] rqspinlock: Use smp_cond_load_acquire_timeout()
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	bpf@vger.kernel.org, arnd@arndb.de, will@kernel.org, peterz@infradead.org, 
	akpm@linux-foundation.org, mark.rutland@arm.com, harisokn@amazon.com, 
	cl@gentwo.org, ast@kernel.org, zhenglifeng1@huawei.com, 
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com, 
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_115539_610313_7EB25B66 
X-CRM114-Status: GOOD (  14.42  )
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

On Thu, 11 Sept 2025 at 16:32, Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Wed, Sep 10, 2025 at 08:46:55PM -0700, Ankur Arora wrote:
> > Switch out the conditional load inerfaces used by rqspinlock
> > to smp_cond_read_acquire_timeout().
> > This interface handles the timeout check explicitly and does any
> > necessary amortization, so use check_timeout() directly.
>
> It's worth mentioning that the default smp_cond_load_acquire_timeout()
> implementation (without hardware support) only spins 200 times instead
> of 16K times in the rqspinlock code. That's probably fine but it would
> be good to have confirmation from Kumar or Alexei.
>

This looks good, but I would still redefine the spin count from 200 to
16k for rqspinlock.c, especially because we need to keep
RES_CHECK_TIMEOUT around which still uses 16k spins to amortize
check_timeout.

> > [...]

