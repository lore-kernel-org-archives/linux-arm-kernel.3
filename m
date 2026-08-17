Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF95EC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 11:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OwP5HDWaliFgti3Iscv9ilvEY9jqmGVYGbAyk7tFDg=; b=PX0Mj4i4Zht7eZrFdBRiAhVng3
	T2JCtHBnEoShUBetQMNpEZXRgnx2bBeg9e0PZhw4g3FYX23E7GmTS357Vz6B/ahJ6HkCX1LMx4iU6
	6XcLPVzRkfoaSzhEv6RGrOe9uVWMqCwqYlEUYCv5m9zf8JnGijuYiy7uGq0Sd7eh/mZGGmcqAeYVx
	LcBvYDt05UDeRU5OxM4WXxUsYYCu+meOxmmWvGlH0wNHQ9kIQL05JcDbV9RG5P1jRD+pSL/L92nyh
	OSapsQ1FMdn3iYU6BluwXQHNWBgUVNEq/9RpTKtqSw7CwfzkYfMW6b0SJPG4q5LeIvAE/UiSPwHYg
	CU/PbumQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvAh-00000005zgC-0tYd;
	Mon, 17 Aug 2026 11:06:27 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvAf-00000005zfP-0u55
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 11:06:26 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47c2ae992beso208602f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 04:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786964783; x=1787569583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6OwP5HDWaliFgti3Iscv9ilvEY9jqmGVYGbAyk7tFDg=;
        b=Nz+AMxK8WWFSXSA/Zk5Ygr1EfvHPcD9n0w8TKZYzJ/dM2aZ+k7n5TNo6aQEfAThaeO
         HblMb+SNKn6E9jDIB3S7Tupa7K0QgXTSAfIJd8e9wACKGFZIQ8Sm6/nCokEFETls7Qj8
         OtNj/B++fI3bl975oIhRtPJi9DE6YXJbKOONFgm7Chv5YnN5PjTLh611SjyFlGyxd/lX
         pCeBLdjduDA00629N62s8k/0o1G33BZT3mpfceWOanvLnVOdtcpHIPPRr6hJY6TWczO/
         ABOJFEa+6uFcuPQEAXO4tw4RrufGgolX/vG9+QY6J9L5dZ/6Px5DuEiSR0VfFRoQG/V1
         SR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786964783; x=1787569583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6OwP5HDWaliFgti3Iscv9ilvEY9jqmGVYGbAyk7tFDg=;
        b=dz18d3AMkW6xAgpRK1OwoSv/Nkm5gBrQ1s92DIMPPk2Hvwyppmbi+izKJ2indyMzbP
         XmcOnBYAobfpefBTDkEds6WyT2TQh7pknBcxbEXoZMSJ1KK0bg518pg2RosFwTvJdg9i
         S18NdyB5BYOHia3lGuM9Tz9BUdk5AghkBo5+YCH0YFirzZTW1xNl69wHQAwRFaAG5YWy
         bbVL7rcGstuCASwxWZ77ZUk+UgY/ufaCRR84u9uIbn1qXyR4g/XugOMXewno5lmRaIbG
         gYKmiPPb2TfKK1Zs/e5FJHX/M2GEA23KLcZb+ZqjjwRC2vrJEcj7UpDhLdg5EtSeGwp2
         70mQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1xWjDpwMhZkIcCML4zItjPNVq9GoW/NaYlxwxkUvCHMiNvdvn1qa2u4xoTN2FfCLHJUEHnOvciwsK6narlAbU@lists.infradead.org
X-Gm-Message-State: AOJu0YyKKGvpA5hWO69pE+eFt4RKr+bgsme2B7iXeuqTRMh585PT8z9h
	VFGpc8lvvEZ0vECiw5IgV8DrrIoWM9AyIpCCNvtPlZQHmfeORbKzqZ2I
X-Gm-Gg: AR+sD13F6lNm5z4sK3wTvvFSeVa8AlqmreGhNsLp/xUgK4M5GzHzuQxkI1/PWN/rtbG
	7i8uxE9RPJfTs36Ofu7b6jcWMaHRnTGwLzcJS1IKN06/CwhPlYxmwn4QOtbbFheSNRJlF+Xnp00
	Ole1aDnWcP/nWrM6PecT/BcddIMbfzthYILvSN2+q+JZDYeeGvwcOM426zDKkMiqi2KZUZM4UFx
	nLJ4prLwll4N7oKL+XZPnMz17hl+fDM36nqnEN0+ej69xD/on/cpzNUMsUPqiyHLH+vw0EHZoaM
	zD6HgNR6M/lHtXT0l92a7OgmHcPsmRwhF/bEVybvpYZthiHOa8YczJCSL/I3b7zb2QLlIaB99nl
	uJiVZzPhNAcUGsjxT8EqD6zQZEm3T8+0EeslHZPwg/v1wZHfhq8al2z6y3hBeyeCrzooxRLHo55
	2hYYUa2Z4KOm2RmYBClFWJb6/eas4INTA8kwhjy7EI/NqyxwYevFlccbEUltHJ42M2Jf23aTCMs
	vm7BwkbYzdYy8PU5m5wvP/ncL3B2NL7qx+9AwiBdy4QPMy1G4ABD8RV5G+/UzjmEgzgtA==
X-Received: by 2002:a05:6000:2585:b0:46f:7d90:8124 with SMTP id ffacd0b85a97d-481607738d1mr17922081f8f.2.1786964783101;
        Mon, 17 Aug 2026 04:06:23 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8FC50027494B64639367E4.dsl.pool.telekom.hu. [2001:4c4e:1b8f:c500:2749:4b64:6393:67e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b43dsm2982833f8f.12.2026.08.17.04.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:06:22 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Heiko Stuebner <heiko@sntech.de>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 08/10] accel/rocket: add RK3576 NPU (RKNN) support
Date: Mon, 17 Aug 2026 13:05:53 +0200
Message-ID: <20260817110556.31613-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817102021.1226525-1-gahing@gahingwoo.com>
References: <CAEWPSH7ETfw2TDjUfOvcVtDm19FC43x2vP=Lh7m+XPOGptnPWA@mail.gmail.com> <20260817094544.1159366-1-gahing@gahingwoo.com> <20260817100046.24872-1-royalnet026@gmail.com> <20260817102021.1226525-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_040625_285354_90DF8AF7 
X-CRM114-Status: GOOD (  22.77  )
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

Hi Jiaxing,

Thank you for withdrawing 40 and 72 before I built anything on them, and for
the field table. I checked the table against registers.xml and it is right in
all eighteen cells, including RESERVED_0 = 34, which is bits 12 and 16 and is
not obvious. I also confirmed the part of your reasoning that matters most:
your two words XOR to 0x100, and 0x124 against 0x80011111 and 0x024 against
0x80011011 both XOR to 0x80011035. The five-field offset really is common mode
across the two arms and cancels in an A against B.

One thing I cannot resolve on my own before I write code.

You wrote: "Use your own constant with bit 8 cleared instead, 0x124 where the
predicate is true and 0x024 where it is false." The merge request line you told
me to take instead of your branch reads

  R_DPU(0x4050, (DIV_ROUND_UP(output_channels, FEATURE_ATOMIC_SIZE) & 1)
                   ? 0x80011011 : 0x80011111);

which puts the SIZE_E_2 = 0 word on the true arm. Read with that predicate your
sentence gives me 0x024 at oc = 64, where your merge request emits 0x80011111
and current upstream emits 0x124, both SIZE_E_2 = 1. Read with "the predicate"
meaning output_channels % 32 == 0, your sentence is exactly your modulo form at
every count. Both readings agree at every count with oc mod 32 in 17..31, so
your five discriminating counts are unaffected either way. They disagree only at
oc mod 32 == 0 and 1..16 - and oc = 64 is the count you said you most want.

So, concretely, so that I do not guess: at oc = 64, do you want SIZE_E_2 = 1 or
SIZE_E_2 = 0? And if you meant your own form rather than the merge request's,
send me the expression.

I would rather we name the arms by value and by count than by the word
predicate, since it now refers to two different things in this thread.

Now the part I think is worth more than the A against B.

I went looking for what SIZE_E means rather than which value works, and I think
it falls out of the padding. In upstream rkt_task.c the output channel count is
padded to a multiple of 32 for the normal case (line 87,
align(MAX2(oc, 32), 32)) and to 64 for depthwise (lines 88-91), and
FEATURE_ATOMIC_SIZE is 16 (rkt_ml.h:18). So the padded bank is 2 atoms of 16 in
the normal case and 4 in the depthwise case. Upstream writes SIZE_E = 1 and
SIZE_E = 3 respectively. That is 2 - 1 and 4 - 1.

  SIZE_E_n + 1 = the number of 16-channel atoms in the final output channel bank

If that reading is right, your parity predicate is not a fit at all, it is this
same statement: I checked over oc = 1..512 with no exceptions that
DIV_ROUND_UP(oc, 16) being odd is exactly the condition that the final
32-channel bank holds one atom rather than two. Odd atom count means a
half-populated last bank means SIZE_E_2 should be 0. That is the reason you said
on 16 August you wanted for the field, and it is arithmetically identical to
what you already wrote.

It also explains why my eight counts said nothing, which had been bothering me.
Upstream hands the padded count to the write path, not the real one -
rkt_regcmd.c lines 201, 226 and 247 all take task->output_channels, and only
ORIG_CHANNEL at line 225 takes output_channels_real. So on RK3588 the final bank
is always declared full, the atom count is always 2, and SIZE_E_2 = 1 is simply
correct at every remainder. My five new counts could not have discriminated
anything; they were confirming that upstream never under-declares the last bank.

And it predicts your losses arithmetically rather than describing them. An
under-declared last bank keeps floor(oc/32) * 32 channels, which is 32, 64 and
96 at oc = 56, 88 and 120 - your three numbers, including the lost ranges 32-55,
64-87 and 96-119.

Please treat that as a hypothesis. I derived it from the encoder's arithmetic,
not from a TRM or a vendor document, and it assumes the three SIZE_E fields are
independent, which is the same assumption you flagged. It also does not touch
the timeout, and I agree with you that the timeout is unexplained.

What I will run, once the polarity above is settled:

  - oc = 64 both ways with the constant forced, no predicate in the build at
    all, so the ambiguity cannot reach it. I will patch only the non-depthwise
    branch at rkt_regcmd.c:239-241; clearing bit 8 in the depthwise arm would be
    0x36c -> 0x26c, SIZE_E 3 -> 2, a different move. I will verify the emitted
    word from the submitted register stream rather than the source, because at
    oc = 64 real and padded are equal and a build that read the wrong one would
    be invisible.
  - oc = 20 and oc = 60 on stock upstream as the reference arm. Those need no
    patch and no answer from you, so I can send them whenever. They also add
    residues 20 and 28 to the table, which so far only has 1, 4, 8, 16 and 24.

Generator and scorer are on the way in a separate mail.

Two small things. Your sentence "modulo true implies parity true and never the
reverse" is the wrong way round - parity true is residues 1..16, which is a
subset of not-a-multiple-of-32, so the implication runs the other way. Nothing
downstream of it changes. And your five are a sample rather than the set: below
128 there are sixty counts with oc mod 32 in 17..31, and odd ones are fine since
33 already ran, so 17, 25, 51, 83 and 117 would do just as well as 20 and 50.

Regards,
Igor

