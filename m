Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB08CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OarwR/ERDNc0Ml+9OWlKLdmjV+iAjoP8ec7vM3/HCIc=; b=Kj4Na7vpA71NC8NtqwOOaUyTIV
	9JtLumRiaRhQlEhDAv/MXZSLb2UTYWaNCnd9Ke2fY0F5xcjF4+yhi4jMfA8RS9asM63gn8lhLzHu/
	uwXYwDHmJfPwu8KEOO8JS0UnS9j6zNC0Sy5aHSH5ElTW+skMHFnANkCdMtB16VaAYKC+tHn4tST1C
	GXZAcfwGSP9nO9E2taffc8wkGZ69OhCx7ROxWbDmtU4VjaF3Sy/A+AeiAnyZ5xzXWTiiHj9o+SU0X
	ZWQINjAhMjpt3zh5jdH2TZ6k1S7hkU1q+UlB6+lcOWFQafrOiU0AakMoBBRbJTmeUe1b+RDsD8jim
	pVmNPtlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYfS-00000008Lyc-1DC6;
	Mon, 25 Aug 2025 14:59:30 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWlv-000000081D6-46Vm;
	Mon, 25 Aug 2025 12:58:05 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-afcb7a3a085so682241666b.2;
        Mon, 25 Aug 2025 05:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756126682; x=1756731482; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OarwR/ERDNc0Ml+9OWlKLdmjV+iAjoP8ec7vM3/HCIc=;
        b=d5KA12bmdj3AI50dUaoWdArcfYWxKFM4fFD1GSO7+ec6KwjlKyhNtDPF0DTvws0MCU
         oVBaC6t6DYjaIOZEkMlaB72PShbKq7G/WwMbDe2hYAO9BIK0NFHpMztJ2Uo2gUn8XRR7
         IgmEAv0aKtjD+lFO4cThHvbGHllCUBxGzHSpdcuS22MpG76Y2Ukjnt1irHK+/PWHcdqe
         EQv9QZD1OK+AuH0NnqFWWRG+vaXiqI0/6AxwtUa8F1QV7hpsF30G8PkVjK6Utvxo5fGP
         T+SwS5GXG3IPiQssTj78aZ9LA+S9NjL9CuKkLVYuk1sbpyIcHBGrzIk0ZJGZjJBhO30V
         N8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756126682; x=1756731482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OarwR/ERDNc0Ml+9OWlKLdmjV+iAjoP8ec7vM3/HCIc=;
        b=YMWkD/0ug8r+1gQYViLyHH5BPZKrPsuaW/i3PYLjxkyuR0OtFzWrCbAZMksCffCckv
         rRaCIYiSzlH2tGcQ6klfMH9RMWLcD3ig6se0TE3m1PGiZGBHMA/KoDacTj9telBj/88T
         RIcJuAeME2phvHZrfsTxl/e/OGx3rDTSLP+lJu5fO4rVTx8CRRNCJvHShPqw5sQi+VzL
         zx5Dy4JOdObTp+p1mWkGE/Yt+8eT8P2TnIYLNp1X9B3P7WBVmCCNsPaMBH9fmHifEUnt
         tpmNqraVbJ81MPO/p8VhMnlKSvlWkp4fqss7ws/sr1e32QoQwtnTuEALA6tX0zyGBCVZ
         lOOg==
X-Forwarded-Encrypted: i=1; AJvYcCVc8zgnLj4ExGBozYk5yE+1MgjEq9vov3ATJmfIuDlGo3nTaRuCAYdx6f3PHxvpJgBhqv0F0/pwQoEKtL4T7nzfLQ==@lists.infradead.org, AJvYcCWlpbEFneKFsXhVzNOT3OgvuBxTBjIwbI3f+fdOXs/jFHeFgj1VUZxk3dZDA7XZzOt0I3OTDJXdpXENPPBA@lists.infradead.org
X-Gm-Message-State: AOJu0YwU9eGK4t3U8Xjqw9e06vJ/S0/AcG6jPz3USlE0mgaKCQs819SM
	dEgrNDLAsVnKmFQ9qQBcwvQatFPQ2DOLLJc98R2GPphHasGmnQSBdDgZjG0Qk2FOYE0M5NRui0T
	9WZ0+cLS+9TEWOO4qLLFMB0OUkEeigLw8o89I
X-Gm-Gg: ASbGncsjWYyPlmYzEn2njqHVxLWuYxNxbbxHDNjUFCTRx1f6T/jeL7WkgvYcZPpeu/2
	1+3Gg1fvIOv/yjjt0esvgPE858Wdf4cpAJ5W66C+HfIRvr/zsgF/It8/ua1AwL6oNbOjEmQBTf9
	OjJsqYf2vslVs0sXMtWqHhkfthqAAY2e69iAioK8BYl3RHIW8VFSxFYqAZ/5HRqu5raPsOmxfH1
	S25MA==
X-Google-Smtp-Source: AGHT+IHaOgzAzLmJeyLPt5DqrZUSYGHwc/5ongY9XyH18a2Jkpiqoy7KErW13Szg0Ppe2orviqO2JQkWL38+o+volS0=
X-Received: by 2002:a17:907:3e1c:b0:ae0:d4b1:b5f0 with SMTP id
 a640c23a62f3a-afe29548f25mr992674266b.35.1756126682080; Mon, 25 Aug 2025
 05:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250825065240.22577-1-linux.amoon@gmail.com> <20250825065240.22577-2-linux.amoon@gmail.com>
 <19AB5D06-DEB6-4C38-B90D-FCDD9719312C@hewittfamily.org.uk>
In-Reply-To: <19AB5D06-DEB6-4C38-B90D-FCDD9719312C@hewittfamily.org.uk>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 25 Aug 2025 18:27:44 +0530
X-Gm-Features: Ac12FXwRodlBz_UjLLJd6RTuYXAAOzs3SHAzCQ_66M5mw-OW-pZnPXMBgXjfwxw
Message-ID: <CANAwSgQT7Y9_TKsYVignTOX1AWpcK6xEEU5+Dhy6Yd=ZG4qCjw@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] arm64: dts: amlogic: Add cache information to
 the Amlogic GXBB and GXL SoC
To: Christian Hewitt <christian@hewittfamily.org.uk>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_055804_016982_DCB86AFA 
X-CRM114-Status: GOOD (  16.44  )
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

Hi Christian,

On Mon, 25 Aug 2025 at 13:29, Christian Hewitt
<christian@hewittfamily.org.uk> wrote:
>
> > On 25 Aug 2025, at 10:51=E2=80=AFam, Anand Moon <linux.amoon@gmail.com>=
 wrote:
> >
> > As per S905 and S905X datasheet add missing cache information to
> > the Amlogic GXBB and GXL SoC.
> >
> > - Each Cortex-A53 core has 32KB of L1 instruction cache available and
> > 32KB of L1 data cache available.
> > - Along with 512KB Unified L2 cache.
> >
> > Cache memory significantly reduces the time it takes for the CPU
> > to access data and instructions, leading to faster program execution
> > and overall system responsiveness.
>
> Hello Anand,
>
> I=E2=80=99m wondering if we are =E2=80=9Cenabling caching=E2=80=9D in the=
se patches (could be
> a significant gain, as per text) or we are =E2=80=9Coptimising caching=E2=
=80=9D meaning
> the kernel currently assumes generic/safe defaults so having accurate
> descriptions in dt allows better efficiency (marginal gain)?
>
> Stats are also subjective to the workload used, but do you have any
> kind of before/after benchmarks? (for any of the SoCs in the patchset)
>

This is a fundamental feature of Arm64 CPUs that tracks active instructions
and data within cache-mapped memory pages.
Enabling it can significantly enhance overall system performance.

We can configure more l2 cache memory which is confribable as per the
Arm TRM document.
Arm Cortex - A53  - Configurable L2 cache size of 128KB, 256KB, 512KB,
1MB and 2MB.
Arm Cortex - A55  - Configurable L2 cache size of 64KB, 128KB, or 256KB
Arm Cortex - A73 -  Configurable L2 cache size of 256KB, 512KB, 1MB,
2MB, 4MB, or 8MB.

Here's an article that provides detailed insights into the cache feature.
[0] http://jake.dothome.co.kr/cache4/

I tested with a small benchmark to test factorial.

Before:>
alarm@archl-librecm:~$ sudo perf stat -e cache-references,cache-misses ./te=
st
Simulated Cache Miss Time (avg): 589 ns
Factorial(10) =3D 3628800

 Performance counter stats for './test':

           3017286      cache-references
             45414      cache-misses                     #    1.51% of
all cache refs

       0.054512394 seconds time elapsed

       0.004209000 seconds user
       0.041866000 seconds sys

After:>
 # sudo perf stat -e cache-references,cache-misses ./test
Simulated Cache Miss Time (avg): 426 ns
Factorial(10) =3D 3628800

 Performance counter stats for './test':

           2814633      cache-references
             27054      cache-misses                     #    0.96% of
all cache refs

       0.041041585 seconds time elapsed

       0.007976000 seconds user
       0.032009000 seconds sys

> Christian

Thanks
-Anand

