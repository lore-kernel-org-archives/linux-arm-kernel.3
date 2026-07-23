Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186E5C531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 09:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=upJm9Q93FoQ32YOmgLd56LAW++MWJuCBKbNFi1vKSIY=; b=NC/kJJ3+XWkZTmtTzceEH4wD9/
	TT11sVlMw9rj+62Mdok5fGbqMxZY9WdJJAzZuPw4GEWAspkTIJQw/r8Avd0SeEX6dcUodji3R0iMA
	kDAOllbgLrm4L1sZz5zEyQtSEWo9GqXy7oylTFPvJYgaW+1vwG5WbwtboTOWhK4MJRUqp4AuduA4a
	jvJqu79LAp5BnKsmSC0a5aa/dITw+EOvjaPyS9uUKrf6xznQjy8ymD8WcFuPtYrV4Sar3QGn5I6rQ
	Tkl/5nkXyzMVY6QdVMg0cRAvBts9wErxULZxJkebpYdkz/cqaMhc9Wj4zR4u+TvxgXhrEN6twtcG5
	vXXK/aNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpyo-0000000Dw4X-1MYS;
	Thu, 23 Jul 2026 09:44:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpym-0000000Dw4A-1aPw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 09:44:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AA70C41071
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 09:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8E31F000E9
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 09:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784799875;
	bh=upJm9Q93FoQ32YOmgLd56LAW++MWJuCBKbNFi1vKSIY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=VpoekalQ6c9YpvCl4kSQWCci27Dq0tQUcrkkiS1Nsrlvjm5XUwJGy9TZ2tt0q0y/j
	 8c/u2v6c20p2nCnS9w94kooxxbLfyQGb29M7FGnCOscDcXGtvAOs2waqyKS8PQy+Hr
	 QIoui/fAUNQt9qIsl9rhltosjhT9uGgMBRFg7z1dz0BpPj2zT4xdCIGAdcwedzK4JC
	 OzKKuNFIQKn/hQzsmzoHaRr+LE7dQwjQwZC2JLPzKC0s/ogqjxTH8Zp6RcNSw5AJlI
	 LM6VDTfgXvS4wq5HCQhSll2Mk2rNc2jPhngkeowm+wDPQN7u3Pc8Vp6IlvNS+62YCA
	 qfSLzyPX79tAw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b2a22c52c1so507069e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 02:44:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqHhGQqZ55ndj4YpPZjmJnKoo+viqcemeloWbHQuvOwHUyuNHiTVews8zgXIIm46N5glohj4c+ziMCGU0/70l9T@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/eKTthDxmNW71qmPL13WjPF5tqFqf+qO6wx6pWXVwz67qne3l
	FzcA4+rjHn/GTFclJhCCsaNFIvZN8bH50ahN2IFwSe1bL4glHju8wLHduz9HFTheR3M5iecOiXr
	q2XuUEobzsclTbyivQ8jj7R1nUOlu9XZEP9FrfyC/KA==
X-Received: by 2002:a05:6512:340a:b0:5b0:23c3:4f55 with SMTP id
 2adb3069b0e04-5b2b2f72e6dmr483668e87.53.1784799869499; Thu, 23 Jul 2026
 02:44:29 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jul 2026 02:44:27 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jul 2026 02:44:27 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260722162040.GC2794619@google.com>
MIME-Version: 1.0
References: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com>
 <alnlaCXmoLRAlr96@gondor.apana.org.au> <20260721082501.6128-1-bartosz.golaszewski@oss.qualcomm.com>
 <c826b73d-6307-4237-a065-b7a8487350ce@gmail.com> <CAMRc=Me55rUmjjR+ZzdWd2ss9JJMZzJch0zKd4GqONBjCzFMYQ@mail.gmail.com>
 <20260722162040.GC2794619@google.com>
Date: Thu, 23 Jul 2026 02:44:27 -0700
X-Gmail-Original-Message-ID: <CAMRc=McTUmyCNvW6qECR4rnVQNLAWLnOr8+fdcZEyDfKESifHw@mail.gmail.com>
X-Gm-Features: AUfX_mxedXof9O40mfMVKV-BEEyZQWgJJjJYjRe7y_syomCjENHofNVGIye_ej4
Message-ID: <CAMRc=McTUmyCNvW6qECR4rnVQNLAWLnOr8+fdcZEyDfKESifHw@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/crypto: Mark QCE as BROKEN
To: Eric Biggers <ebiggers@kernel.org>
Cc: Demi Marie Obenour <demiobenour@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, stable@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 22 Jul 2026 18:20:40 +0200, Eric Biggers <ebiggers@kernel.org> said:
> On Wed, Jul 22, 2026 at 01:33:51AM -0700, Bartosz Golaszewski wrote:
>> > Also, what can the current driver do that cannot be done better using
>> > software crypto?  I understand that you have future plans to add more
>> > features to the driver, but those are not relevant to this discussion.
>> >
>>
>> We can offload crypto operations to the QCE saving CPU cycles but more
>> importantly, the QCE provides HW based isolation which some vendors care
>> about.
>
> Do you have any concrete proof of anyone using this with a specific
> Linux kernel feature and actually getting a benefit from it?
>

I'm not required to produce a proof of Qualcomm's clients using it. That's
never been a requirement to keep a driver in mainline. I'm saying that Qualcomm
wants to keep it and I've stepped up to fix and maintain it, which is what I'm
doing.

But yes, I know about companies that do use this driver as is for whatever
reasons. I'm not sure I can mention them so I won't.

> Just for some additional context, I've been on the Android team for many
> years and have worked with lots of companies shipping Android devices
> with Qualcomm SoCs.  I also upstreamed the support for the
> Qualcomm Inline Crypto Engine (ICE)
> (https://lore.kernel.org/all/20200710072013.177481-6-ebiggers@kernel.org/
> https://lore.kernel.org/linux-mmc/20210126001456.382989-9-ebiggers@kernel.org/),
> which is what people actually use and isn't the same as QCE.
>

Yes, I know about your work. Thank you for doing all of that.

Best Regards,
Bartosz

