Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B21FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 13:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGL2ON+fY7rc/DLjrgmdVLzgpG4X0fa0OqzQfBqPl78=; b=hCBdVYhX05OLXSXvXF5SjbsGNq
	iwW4sDQxecdfyFa9a0wdkXMAk86tHWeIj9I9zibWWfl5nJ1jFsPbDPDDzXf1GGQ3z3P3S+GP7mdjC
	xNkH8ILg98x2RS9+jmZRWsovGixZPuwrnPahhGhsS2tLCsVs2EHjC6TFkq72MdHUOiiekUgHXLy/x
	mGxXd81KRHZkqM8vwRgCZ0JP4D58z8kkmwZFd9wGYf+RX+WUdZb0t1+mTCvWjtBF2qJb0WdJs09N7
	43k1b3UK+dWnAa20wPqzoLYXVpgpUst92iq3TTzsQ+xv++ZUkxUnvzLZ/fTQ/kabHfqLsoFkGWwr5
	Fs9LkbtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmkv-0000000E7an-1riD;
	Tue, 11 Aug 2026 13:43:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmkt-0000000E7aP-3dRL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 13:42:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CD6F43D72
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 13:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C2B1F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 13:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786455779;
	bh=oGL2ON+fY7rc/DLjrgmdVLzgpG4X0fa0OqzQfBqPl78=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=BpB9+IN2EktpZlwbaW/abyZTkq3FyAM1VgonyxsDOF6/vWRs3SHfwfjNAt8bK2Ta/
	 IMqyeeJkKJw79rmkLM24A6nq+dpmQVF6hBzb9uqB3sXItxVseBCc7syz6av+nlFi+y
	 +RNQnHhjD9yPsFEFMaJtwDCqS3uJ24sBLX+u8oX70nZ16PuWElWsqnqZj1nuXqL/tT
	 fLIrV0nivVzPGe1affq32ALi59n4ep3U5sNuhd2vdFQCALX0yWMCfB9n17/eOWNCRV
	 6xt8AT41D1+LZ86/COb6h/Ou9kn7E36EscZdprREsX9YQSEJ0uTjAG1B5+QVA3wExf
	 vf6cXn4X7iq6g==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39f91ba1ef7so18758601fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 06:42:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqBThIFec0BhtEHaNHQisIaS6PdytUqGcPE4dYiQY/tMe5H/cm2DRQWRo32HiiQXC6AWBzXGvfDFMMuvZtKJFFv@lists.infradead.org
X-Gm-Message-State: AOJu0YyYQ5Tebfz2DmlB9NDSxAbbxKvY7rL5qV9+JgdfulNaccO69TkX
	zPoEJeG4GlUhCJI+y7qvzYcJbn48ORJv4z110EX0zQ3mZFN3l5f3XYUf2f5IuyxsZxg0tmhA4/m
	d2f6r3+Jxd7zJbCwwKhRL5rWS2HXDL8VaWNRP5psLRA==
X-Received: by 2002:ac2:4c4a:0:b0:5b2:b004:ab9d with SMTP id
 2adb3069b0e04-5b448633cccmr554909e87.34.1786455777968; Tue, 11 Aug 2026
 06:42:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Aug 2026 08:42:55 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Aug 2026 08:42:55 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260801171242.GA3567@quark>
MIME-Version: 1.0
References: <20260731050838.158825-1-ebiggers@kernel.org> <a28c2903-0976-4559-b870-4de5553ba9ab@kernel.org>
 <3ba57269-3305-4d80-b3f2-aa82fa59b59d@gmail.com> <b9b655a9-c683-4c4e-ba0d-f98577dd2912@kernel.org>
 <20260801162900.GA2021@quark> <e7aeec9b-11aa-4635-bde9-fb8c7ca38260@kernel.org>
 <20260801171242.GA3567@quark>
Date: Tue, 11 Aug 2026 08:42:55 -0500
X-Gmail-Original-Message-ID: <CAMRc=McL5QQRk8C8zzkHm+FUj-SAVi5PLJr2pXo8eNpaxXuALg@mail.gmail.com>
X-Gm-Features: AUfX_mxPZ9dCN1jSvjbQwqq_cAREJeltmA9cJmtfDea-v8VxD3gCP4H0x5h0r80
Message-ID: <CAMRc=McL5QQRk8C8zzkHm+FUj-SAVi5PLJr2pXo8eNpaxXuALg@mail.gmail.com>
Subject: Re: [PATCH] crypto: qce - Replace with stub driver
To: Eric Biggers <ebiggers@kernel.org>
Cc: Demi Marie Obenour <demiobenour@gmail.com>, linux-crypto@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk@kernel.org>
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

On Sat, 1 Aug 2026 19:12:42 +0200, Eric Biggers <ebiggers@kernel.org> said:

> Well, that again brings us back to the core issue which is the actual
> current functionality of the driver, which is to register crypto_ahash,
> crypto_skcipher, and crypto_aead algorithms with the crypto API.
>
> It isn't useful functionality, but rather just a footgun that allows
> users to misconfigure their systems, an issue I've seen happen multiple
> times.  CPU-based implementations of *every one* of those algorithms
> already exist.  On a typical SoC that has this hardware, the CPU-based
> implementations are ~50x faster as shown in tests.  Pending patches make
> the difference even greater at ~100x.  And the CPU-based implementations
> actually use significantly less CPU time, as well.  There seems to be no
> path forward for significantly fixing this issue, either.
>

You've repeated your point about performance several times. Nobody ever said
you're wrong. Performance is not the only reason for choosing one provider over
another.

> An alternative we could consider is dropping the cra_priority further,
> to further decrease the chance that these algorithms are used.  But I
> feel it's hard to justify why they're there at all, if the rationale for
> keeping them is "we made sure that no one can actually use them, so they
> can't be causing problems anymore"...
>

No, the rationale has never been this. FWIW it can be that it's used for
testing of the crypto module on a supported platform and that is already
enough of a reason to keep it upstream.

As I've said before: we don't just drop maintained drivers from linux.

Herbert: it's been a while, would you mind chiming in and deciding one way
or the other, as Greg seems to have deferred to your judgement?

Thanks,
Bartosz

