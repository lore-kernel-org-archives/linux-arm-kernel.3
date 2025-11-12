Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFE7CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 12:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nCLGdNg0B7kK9ihswq7fVace/Pjn+bodu3kR1lh3t8=; b=mmoFOOEkc4I8YHM3xVDLU5eg7G
	FYSNV4zbyjUzxGfaBHZKPsce69mYa31Djfv04XDs2EcXIS8MPWDaXyaKXh79kohID1E0hQNL/K1O6
	3h1YZqIhl43nfkaBYz5nnaU6kNSR1PZ3ftSphO1w7GLPYldGqSOyalBmFzIXGskdkSMY+kgn0UU5x
	42m+XGXIDZaPguglF97J0dMxrDI1dTQuvqczYsNFM8xIWgwdnOdOT7SqCOXX603OBJnLe0q3BgyX5
	Pi8kwQQPVUGoNvLff5Wvi81eBK92qaBUxPkfZWICHNXorZbkQoS7mU+BZJciMW+4+cCTGWEXqhhls
	o/cNKjYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAC8-00000008nBz-2HQq;
	Wed, 12 Nov 2025 12:43:28 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAC5-00000008nBc-3t4t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 12:43:27 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-65677b3aa4bso338190eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 04:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762951404; x=1763556204; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nCLGdNg0B7kK9ihswq7fVace/Pjn+bodu3kR1lh3t8=;
        b=bumcXbdURZ5NDmESq1aqoqubtaQCqctcfND8Sp6STwKM5qWdMJ1j26cDpuZzUVNPaN
         Shna2fhIFvAht+dA92I8Q/wKmpNIr0oRI6zwgvsnG6HzQFykILQhTLTUfPfLkgs7KSAa
         pBBW4zZ1Cj4YQjvy2732s8+A4x9Sj0pdKS+DYe7tGPQq7LhuTMV44pz9DqR91o6qiksQ
         eXt7mMaboyyMj73dKZra/f54gI7AgObRy3QB+6TC3hW9q5wqIbZ6uppP4MxWkJpW3wfZ
         6k5fmtFujRldT4spPbVWh5rF7KqNKTUOVsDGHz5QwVadCJiVllKe0vE174PDtQQobwm4
         ahmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762951404; x=1763556204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3nCLGdNg0B7kK9ihswq7fVace/Pjn+bodu3kR1lh3t8=;
        b=L+Eu3TQmOh/pVo5tvkwYkXlQoK+ED+iwtUy1cNwZQLxctcmUGdN94yxQUbpZSfVyJK
         X5jgmG2fnS5piiKBEvALHoTUSU27rvXzY6u8LtUIQDFQwFWelBkfMijttrI69/g8OpnC
         HtmvJrS9wZiCiwbiUMLSVnm01V5y980rudsRZLJtYJwASxkN4p9wIeiTRIXBmVhtKgEr
         O/+YGDk6u94Edo9/CNxDhGYRaAxC/o9YsVucp4SI+q4ZEh5eoNdyi9yYY4u2fQHCm4Eb
         Lo3S8xrV2jl5fuZjIfAaX9IXSparLee71b+2m2W//GcZVmqbPb2OhfIp+IGBv+s/Jth2
         lqDw==
X-Forwarded-Encrypted: i=1; AJvYcCUtMFAW4fSw0Tj0nxjPTq9uFGCWDJ2yd9YaMziJms/fmK/iObGd8MWPyZtG/CVBErXPehBRbCVhTaI/zdBDOHeW@lists.infradead.org
X-Gm-Message-State: AOJu0Yyhdq/lT3m1eE6DLvHzoz3H0qyIhrF4gaKzVhMCMi4zgeli8buE
	BFIJmF+V7gAU40T/tqC5V3oI/gD7bcrDpo8At4aU7SECsU+JhKNOG5A/uKcgyctL9LBMtqNM9vN
	OSMjXTQ4o9PZP9z/b/FWtq6OsUNb/u3y4KHwASq6qrA==
X-Gm-Gg: ASbGncuUz8W3Op84G9kpzFpAKZhyOjqsS0nAa8D9pouc4UchEZzxNcV+l0eUKhQw0l5
	b5/wvgvPDDSAmjWGQhzayBgvbVuoZHX6aTqigwm0Y2xTuVN3AFKVdfYE5C62q2ewrDs0MJNyPev
	oMFcBj2NCrEIkYWhXeCbGlHlYZUlDtgr1pNGOO6lzv7h6jejJA7s4ySBZy5NZ4/kFcYVTh01y3I
	BGwidY4f6786fmAhP0celGuVmdMzQWqm3muigNIUlf4qugk8T/JiV8zimeZWQ==
X-Google-Smtp-Source: AGHT+IF56OFOYiIqZ0djA3ZvTwB3pXvmWTE2Y/2e47Acadn9UwrR6l4mgUbLbvMhjjLW0TKRt/QCjKhcWzj8fAK4e1A=
X-Received: by 2002:a05:6870:b14a:b0:3d2:ed44:67b9 with SMTP id
 586e51a60fabf-3e83416c4e5mr1230844fac.23.1762951404616; Wed, 12 Nov 2025
 04:43:24 -0800 (PST)
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.3.I35b9e835ac49ab408e5ca3e0983930a1f1395814@changeid>
 <b55d94f2-6b79-407f-af58-b9847db3c9a2@kernel.org> <CADrjBPpCKfd_0PY=DULnmqfb8veqH-SQ-kr5gC6Y28uBVo8iRA@mail.gmail.com>
 <CACRpkdYN=FN92cuS3U-XBVoyD3DcKkfzEXYVNnQNK07rxJJZ=A@mail.gmail.com>
In-Reply-To: <CACRpkdYN=FN92cuS3U-XBVoyD3DcKkfzEXYVNnQNK07rxJJZ=A@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Nov 2025 12:43:12 +0000
X-Gm-Features: AWmQ_bmPb1_M5A-rGtzHjXMiQBLBGQHTdvPma_dayyNctbSOvz5HTwmZK5JuVGs
Message-ID: <CADrjBPo+EhJ5iLCm=HpzLCWjv+QCX3ft4e4eC1CPzeCk+trpKQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: google: Add dts directory for
 Google-designed silicon
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Drew Fustini <fustini@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_044325_972322_76009840 
X-CRM114-Status: GOOD (  11.18  )
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

Hi Linus,

On Wed, 12 Nov 2025 at 12:36, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> On Wed, Nov 12, 2025 at 1:26=E2=80=AFPM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
>
> > There will be some Laguna SoC
> > drivers for pinctrl, clocks etc,
>
> Oh new pin control, interesting!
>
> Will you be doing the upstreaming of that?

It will most likely be Doug, not sure if he's started looking at that
yet though.

Peter

