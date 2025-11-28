Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BC0D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 11:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyro9jN90iGCxECrZzIh+AlYInS8+3lrkcT7HPL7BFQ=; b=wYDuAwwqGbFz55mfRzMgZAfUXC
	XBMEybevuutOX7IG0qifZBcneCuAqTICFw9FlWBMth1ie4CXdzYbEDNtHlt/RTVVG2MrEVaqfzRNO
	UPclKqMtpBOq/n91NmcnInJ7iRENDa1NWbb3ft5Imld4Sv6U3yL4mHVCkM72yegRM0LYvjUruoqn9
	EpfK/7+6sWJrTlgHIn2AcbEC1U9FaDN+czVSazMbjfEwmOl4AI+9hYONv+smKZa9rfWYGrViJOe+v
	4AweqKr+PLwJPmvv37J2kbEToBPBuqDu287OPEybpS6t8Y1f5Za9RRb7lqhQ7maTi+fyP/nF3QcCk
	zDBGocqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOwV4-00000000LkB-09xV;
	Fri, 28 Nov 2025 11:18:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOwV2-00000000Ljn-0Kfa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 11:18:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BF3B42A0C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 11:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE2EC4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 11:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764328731;
	bh=vyro9jN90iGCxECrZzIh+AlYInS8+3lrkcT7HPL7BFQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EijMLYsahEk7DCNnhBHacZD3W5Yi5CQNEB1RQoums8axtakR2UrXOreyXvUfqzciy
	 ZtDGbOwbRTBslHYOhohN158SKfnWoyw+9ZfXdIRuZHVItf5/uKfGkHlmEA+ZPp7Q4A
	 rn3QENsJR5NVfqLLtXtiQDkBUDy4MUuuHFyZK+QzaV7XHMZIaQfcORBFMqJivTrL44
	 BXnw/0A8Drs5ikSJRLYssOMglnvuCJAMDfXtdJdkOLHg2MvPlZBhEyPWafCKX+2s7a
	 QGEqSBpQdCDKn6OmWpHfXq85vwnKpMZjYOEwYdr/P8n0PqTQYCQoqbDU87+7eSa5Cw
	 BLoBsieI/fQvA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5957e017378so2003579e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 03:18:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNxTDGHpG9YaImmaDbwE2LZdzLUjUWc31yZ7UXYATZWkxc+RHgxaCrAcT3oEPF0oQ4RF0XEXPmbIQQwyNASQ0w@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+bP657WhcQlG4q6IYqx82FqnYBa6drbd978ctGieXeGg7HpZ0
	OIaKC9ne8OLQwZWQhjpUFWvIyDtBzzPUjBTsrLv+Ecg/+z4LCy+1lWN/5Jm9VVVTs16DhKuUXsD
	2tPJeS1gfJyi2ENJCC44sM9NShnec6tc=
X-Google-Smtp-Source: AGHT+IG2qQ7qlhxCjrlRxa0MKVrhLpLN7YYPaElrHrojeXDqHhKg/qPydZu8WA2v7cxHIiB3gRKqsgWt1niY8Z3pLWw=
X-Received: by 2002:a05:6512:31cf:b0:594:346f:4850 with SMTP id
 2adb3069b0e04-596a3efd562mr9429122e87.49.1764328729401; Fri, 28 Nov 2025
 03:18:49 -0800 (PST)
MIME-Version: 1.0
References: <20251127092226.1439196-8-ardb+git@google.com> <20251127092226.1439196-13-ardb+git@google.com>
 <20251128111328.68354182@pumpkin>
In-Reply-To: <20251128111328.68354182@pumpkin>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 28 Nov 2025 12:18:38 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFnfjGXwNZDSE1yhXhXyNdMP7DWa9es4VoHStF-g7pC7g@mail.gmail.com>
X-Gm-Features: AWmQ_bmyFIm1VlcxoU_DWSIiVKaLy-haPp7u_t_knb3FeyMJHbNwQNyBmHYuHS0
Message-ID: <CAMj1kXFnfjGXwNZDSE1yhXhXyNdMP7DWa9es4VoHStF-g7pC7g@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH 5/6] random: Plug race in preceding patch
To: david laight <david.laight@runbox.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jeremy Linton <jeremy.linton@arm.com>, 
	Catalin Marinas <Catalin.Marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_031852_140068_5541D769 
X-CRM114-Status: GOOD (  13.52  )
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

On Fri, 28 Nov 2025 at 12:13, david laight <david.laight@runbox.com> wrote:
>
> On Thu, 27 Nov 2025 10:22:32 +0100
> Ard Biesheuvel <ardb+git@google.com> wrote:
>
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > The lockless get_random_uXX() reads the next value from the linear
> > buffer and then overwrites it with a 0x0 value. This is racy, as the
> > code might be re-entered by an interrupt handler, and so the store might
> > redundantly wipe the location accessed by the interrupt context rather
> > than the interrupted context.
>
> Is overwriting the used value even useful?

That is an interesting question but it is orthogonal to this series.

