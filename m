Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A909CCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 00:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oW3NBxoz0h1ByrSqH5tPVmY3lr7CHCdPxDnqXMlrypY=; b=169/7+tb1uGISYpv8ZEMVSsqG5
	HxK0wJbDOM9xlhp5K2xOIPvPK9Hrlbmm6epGwF9v9KVO7HVbGCf9EY4QIpkbNp7lVZQU6hNFmzHzm
	4nMgAfOPq42RqRK/fhNenvTMmPSUViLQka1U22QCnQwxK3JtVXdZHeZqwJ9aGKg7x3sdwuc7vP7oS
	YdtHNznB6VXgF0C722KTvDZy9+1FScyL4qIUr+0XpY5nELS9lfkixx4JafV+qDeV8RRmMy8kFnrBz
	vPOde95Ovh8oseBOWknRFt9CjTxOHo4wOh+YpWOCFPe+uEEbS9e2HHqt3DM7HnTr80dfcwJWk0OUW
	ltUrD0kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZeOp-0000000GRSr-3vbZ;
	Wed, 17 Jun 2026 00:44:59 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZeOm-0000000GRSU-3RQo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 00:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781657086;
	bh=oW3NBxoz0h1ByrSqH5tPVmY3lr7CHCdPxDnqXMlrypY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZL2rTl7ZbPOIJdHwOxroNvNWUC/kgtRAbAsWGXCKonHXLRrmL/CwWU+Z7+Gkh+iwA
	 rkleWiff1R18xZXbDHV+V6vMusxH4YNZC0aGcNbfh4HOuA7mznwR5ltcHkR4fT3sDm
	 x/mZEoOJHLzPyiLd/vEHJeeIGlfhNiMfAETpc0G+CkSpDn7tzt4F4t1En5OBL/lM76
	 LzFyNucIhKKmtxaZyCp/u1GAB7I+Mr7Ul1tYOBMQ6EbabGD4O1M8frojJ/D/NRwiPU
	 Iu+YKrclcxY0vsp14NBVCDcBduvG3TjzN8iwbtZkI6ijucd3m8yoAvkqE898hdaM/q
	 MxOsQal375ETw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0A1D7659B9;
	Wed, 17 Jun 2026 08:44:45 +0800 (AWST)
Message-ID: <b50b84b169b632200ca348971451baca83357c7b.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6] soc: aspeed: lpc-snoop: Fix usercopy overflow in
 snoop_file_read
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Karthikeyan KS <karthiproffesional@gmail.com>
Cc: joel@jms.id.au, andrew@aj.id.au, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Date: Wed, 17 Jun 2026 10:14:44 +0930
In-Reply-To: <20260616073053.1144730-1-karthiproffesional@gmail.com>
References: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
	 <20260616073053.1144730-1-karthiproffesional@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_174457_105491_71EDC15F 
X-CRM114-Status: UNSURE (   7.98  )
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

On Tue, 2026-06-16 at 07:30 +0000, Karthikeyan KS wrote:
> Hi Andrew,
>=20
> Happy to. Short version: ast2600-evb can't hit the SMP timing window,
> so I reproduce each missing piece deliberately. The driver code under
> test is unmodified -- only the stimulus and the post-race state are
> injected. Stock qemu-system-arm (Debian 8.2.2), no QEMU changes.
>=20
> Three obstacles, and what I did about each:

This looks like a lot of heavily LLM-assisted effort. Please review the
relevant documentation, starting here:

   https://docs.kernel.org/process/submitting-patches.html#using-assisted-b=
y

I feel the testing strategy is pretty questionable. Any invariant
violation is possible with that type of meddling.

I was interested in whether you drove the interrupt sequence via
emulated hardware. I asked because upstream qemu doesn't currently
support the snoop device.

In v3 you said:

   The issue was observed on physical AST2600 (dual-core Cortex-A7)
   in production under heavy POST code traffic during concurrent
   userspace reads.

   https://lore.kernel.org/all/20260527175939.2939714-1-karthiproffesional@=
gmail.com/

Is this true? What platform did you test with?

Andrew

