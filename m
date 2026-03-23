Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533D3F46135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 14:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LI8/dUz99GIMIFX7jL9A6Uqav/8pN6H5Y3gQQrLVq3g=; b=2FIJiI4rPxZIOH7wXOMFP4Mm/e
	jtBV9uNdOUldPt1VP+t+WHbfCEdCICGZ9FWOMCEKqQUuswZndz93X03l8JEgHAa7W4Rheh6arptlH
	QPCWUnKKeRThXVXQBUgYKr1avnjNlaS8u+iCNJ/LZlYFUBuc8g/ZeroLwRcMFBZ7dVhcZNRTnAx20
	QA3zFXem3F2/g4BglI/lDOW8oxGmm3QaxNkOovXwnhAOzICnoXNFEIZI1buiomfjWQ+/gB+YyZgVc
	9fITKmxiJXSXkvNKsxpF2QgpDt+VQElhw03UoA0jHw+gbs5w27hYyMoTTNSshOZ3fcel4fuahKHSG
	sjFMJfPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4gew-0000000GxMq-30aM;
	Mon, 23 Mar 2026 14:53:38 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4geu-0000000GxM6-0b6e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 14:53:37 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2c0e6f5abb5so141161eec.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 07:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774277615; cv=none;
        d=google.com; s=arc-20240605;
        b=XlVgQw/DKVk1Iw+OhSQIgeD+FGZ9ejyAj/ZPYB59yP6ZxQbTWD7jCYRc9FhtlDhlVw
         1mT+fBawKAjNWwf6M5Wh1tkTFGQFxPhIq+Y/dFKiU2I8c2VHPidqjkT4wUgK6UTg9hl/
         KTD9UO6XY0ZsaSTlB/1Z+n+xgg9Irbm4xEsJvD1FYlR2FmRNAo6ySeRbkIBuhq/G4pMI
         R7WcwBfR+EVo/viO2zo1BiKlQWuRCuUr9DdyFDbcYrlnTgD8SINNK2I9b8xepsA5hlOx
         5kyaufwQb2xnAerMAYkjtzSHADTcmMkPAK8ioR3wZp+4ie0iRjmimj9+bHKGnRdRDt/J
         /xqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LI8/dUz99GIMIFX7jL9A6Uqav/8pN6H5Y3gQQrLVq3g=;
        fh=XBM0opagj9WP9LBI62QCrmCX09epn52rymExRx3AvWY=;
        b=LH1rpx2uIsvOp8PqZZn0e1Y1hhTCazUumLn/yof1CMVOuUucLm4jNZpto/Ki8Fk0WT
         4dW3b2n37CyIW/qxdNf+lNheL01EvSWFqsg3LKbCuPNE7WjEcU0oQGNZQw4peVPxsyFy
         tbkeJnbIvviVHuFYWvA5Z2KCrhgXe6bPufkmV5ZkLF4ENY4uG40KLmesDXmRajaho6MH
         pTXKdo5l3f8t3C0TuaJrtoJteUjyQCVg40QW8trLfLJBR/0LqHOM6FXEOfK823BWqZcT
         himE99/7j9KJWHZrEsEHDHVNfc+5jAnSV19YTyCGcq4BfaMBsCOt79OyiIbsMI+39cGI
         tUYw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774277615; x=1774882415; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LI8/dUz99GIMIFX7jL9A6Uqav/8pN6H5Y3gQQrLVq3g=;
        b=FRJlwAWLeQtckrDNCLh8nmQVNn3NB8oNpqSvEUiFsFAoKs6Ism/foEn2EEH3UkXBgC
         p3MZUZyT7FSd7XIF4nHKe1qfhNZHoRa66dHZistfzyZbedjo59X1B9jqaOxbzJkVWeXv
         nt4tYkG5XRRL6OiCDR7LPsdd48xP10zUXkpGdjVd2cmVjQ+sCEgyEjOYh4Ol2to/jRwj
         gxHVE2Tt+hEAt68agCNRjVItNfNtvR+YumFpqrYQCAmXNI+lPv8zkK0ctU/6gEKnFotD
         /KM25/sFvlyAQKPE1Qc8kOebyh4r2lVVyDOStIxNdbqc32dvbw1+PWUF8J71R2y3HSn4
         1eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774277615; x=1774882415;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LI8/dUz99GIMIFX7jL9A6Uqav/8pN6H5Y3gQQrLVq3g=;
        b=S17Kpsu+hYAn6affzTclYV74RqLHzWmRgJARKUV8jGDmrlXH+sTC2J999JOL9O+BFm
         2JMnFsAn8bb2Yx9fQ0nWoxPq6O4hktxGKdPlhPDcB7wxCTVg1U035N1aV744CTk8OK7s
         ZNEFgN7TRdoTbXgCXtPrV3KOAi6sycutpu8ALv8FyZq4qw+zlYdtgncfUyjy64q/biXW
         mA1mE9lQXgq1jOdWo/tMqg5vDUKtITFucIOHi3Pu8EIz60QRY3gG5Qudu7vwQxHpPE/C
         SToHswkSP8mcbjJYXmxczAIqPAzjk4zDAm4nENwLuADbXG+tfd6O7ZJ45wdVFexJslaa
         ajzw==
X-Forwarded-Encrypted: i=1; AJvYcCVtYzNAqVdzxlZCi1qcX6N6hO1lfRgAwPJjkXZDq90M4B+NFKIAttqpgX+trB9Hkuy+mcco/pdhPfW0Ethl560g@lists.infradead.org
X-Gm-Message-State: AOJu0YxNFEiWplx/iPrng0ZRne387W54JHbg+CbsMpKHrZgwjhNTfWUk
	C8pGQgsC5WhAfSqID8Vy9Reh2FBY24tVvhe0bfHA1ZtPb+xuEhW6Jss65sbLs0d19NcierFtj87
	JCQr5TFx5gYEdO8Vyp4Cij3GjZRPrfLU=
X-Gm-Gg: ATEYQzwrUNlTmRpoPAV1MtSdM3kUpE8EowJdTMNl3XarZfg6b/Ibmi1+ec16VFqgBIP
	BmtTdnMVl9VXHYWHlzwyVMrfh919fTbKkFDzHp4wzbNBUbGTJwYYBlQO7GXBWxS2p9t0GT7hOtl
	RRWrTWVBlWjSriU0qsenDlfeY1Y+POozSpJeROCQDdifm9U/J707loI+RXuLuyEy1Icqf3XiXMW
	uzqSsJ3W6hDpAvn7csQgC+BSW0I/lBGkdkL/WpirCiB3k8W69Gkkv75gUsW07PI5MiNytAjlmc7
	RM6p1PfaErTJROCdxSJmEp8MXRCGg9jwwLVFp+FBHT4cmddYBWH1NhINRwU7VQhgQqeeyJc6ACl
	+k/mfpup9g62WUWbHCd4YW6w=
X-Received: by 2002:a05:7300:3215:b0:2c1:27c:758c with SMTP id
 5a478bee46e88-2c109938d44mr2357139eec.8.1774277615132; Mon, 23 Mar 2026
 07:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260322193830.89324-1-ojeda@kernel.org>
 <4fba0163-547e-4099-8b37-5d8429bda6da@sirena.org.uk>
In-Reply-To: <4fba0163-547e-4099-8b37-5d8429bda6da@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 15:53:21 +0100
X-Gm-Features: AQROBzBN4j7-1buNPtn5ON4A_wtJBuiQQ3UlTVe5clvsCt_bKh7FB_BsDwGf67A
Message-ID: <CANiq72nmFsnoP3dv_-0PWH0XBpf0OuPzNR2CP9Hw56Z+RVifAg@mail.gmail.com>
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Miguel Ojeda <ojeda@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Jean Delvare <khali@linux-fr.org>, 
	linux-kernel@vger.kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-mm@kvack.org, linux-um@lists.infradead.org, linux@armlinux.org.uk, 
	llvm@lists.linux.dev, lossin@kernel.org, mark.rutland@arm.com, 
	mmaurer@google.com, morbo@google.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, nsc@kernel.org, 
	peterz@infradead.org, richard@nod.at, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, urezki@gmail.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_075336_185594_726D1FB0 
X-CRM114-Status: GOOD (  16.17  )
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

On Mon, Mar 23, 2026 at 2:54=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Callers should never treat NULL any differently to any other non-error
> pointer, this is not a value intended for inspection by users.
>
> Having specific handling for NULLs is very much not a preferred
> interface, and most things shouldn't.  The caller should probably have
> it's own !CONFIG_REGULATOR checks rather than using the return value.

Yeah, that is the understanding I got from reading both the docs and
the comment, but I think the docs (i.e. not the comment in the stub)
could point that `NULL` is one possible pointer value (perhaps
including discouraging relying on particular values at the same time,
and perhaps mentioning `!CONFIG_REGULATOR`).

i.e. to me, "Pointer to a struct regulator corresponding to the
regulator producer," sounds in the docs a bit too much like it will be
a valid one... no?

Another perspective is that, when one reads the rendered docs:

  https://docs.kernel.org/driver-api/regulator.html#c.regulator_get

one sees the postconditions, but they happen to not apply in all cases
(in fact, perhaps not having the "Returns" there would increase the
chances one realizes that, but I understand that you want them to
treat it as fully opaque as much as possible).

It could also help things like AI review systems which may only notice
the docs and not the comment inside the stub.

Perhaps it could be at least a one-line comment in the real
definition, even if not in the rendered docs, to have a chance for
others to notice.

I don't know -- I hope that helps, in any case. Perhaps Daniel can
tell us what he thought when he was writing the code, as another
perspective, i.e. whether it was the docs or not the issue.

Thanks!

Cheers,
Miguel

