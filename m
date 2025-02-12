Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93CAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 16:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wwnDpSs6k4nd6H907qUqxRrSXuSL7kW89rp9oZHglM=; b=3yisIB1otdMFNPFM7bP3NQOJ6X
	PDAC0EDBdpUny0FaWp/YedtWqMGySeE8O3U3b1uiluh8Z5oJ5hPnWf/N8ld1U8m73b4WHSIgLkdby
	+pPfUfBk3YmM8bCY+wKkxjUR1SaxAjp4blYe6X7XyBjdmlx8e0edkDGGlXZaD3k/c186nt8IzVEI1
	XfYij6nu+jHhlP8Mi+dR6f8tYzrm3KtR8OoVExOS4+C1rXnefKgJHUaTWwZV8QFw2Ifuwl7ouiPdP
	V4O8gUdNiduEZBTp8ctMJ5D1vmuSJtPG+IhdO91zQnkZxwSGYZ80Y1+vOQInajOGmitiz1Byb13m6
	GgLLwRAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFeP-000000085hj-0ZhS;
	Wed, 12 Feb 2025 16:31:49 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFO9-000000081ow-1KQG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 16:15:02 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3d146357fb2so167365ab.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 08:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739376900; x=1739981700; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wwnDpSs6k4nd6H907qUqxRrSXuSL7kW89rp9oZHglM=;
        b=oDRxdfvgsXI8sBA3/C+woJZxn2/4RXGg/eueZlyMzNIZQsgjNdHLaiT7Bgy5DzroBF
         nE7aYWOn5aue3fpnNtJG5dpte6d7pEROwVEThrtRjRErq1WHdH5KEyvLALy3/R7tLyIm
         mqxHs5ZViZf+WgNuAZ7qBYPH1qgCh0531WGw2C3wTFiJPEXvINDxk8cIOUMiAfao8jGH
         C/B7CtBahwBNx0vDaT3+mSCRsJqEZ9/QM/J97sMcPoPnoa2ValUp9PQNGrRjWtKou03t
         /kRV1Idd/L0G59++yslB99TLV7lULGLia6ST0Jv6amZO3KsofD3y+M9gcQqrrO2nK9jr
         ogKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739376900; x=1739981700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wwnDpSs6k4nd6H907qUqxRrSXuSL7kW89rp9oZHglM=;
        b=ZdBMcq485pzw9WgXzbd3Ih6fGim8GfrJCetuBTv7UgywGKRJMhrO/TR+PSD1IZo7x4
         VswfqR92qD/QnEhbq3xhPiwGX3lBLJT54PWMMe5tUdTuO1DNgqrmBiYtcgN+UtfDkRVb
         RGUgOC7yAKBjrXyZG+jc0n+2jDCps9Qq5Z6xBXnwlFxC0AaB77S/V70op3lTsHx1fZ7V
         fEo6SEoJzYhc5b+PqDikjOIPnZeDdDpv5cAcQPJbrb3q+to2TaWkTzZViuhcMg3H50/M
         TOkU8U57KCRDCiT1W1tEhfkpLOr+bqB5cTphDgMxWdZlxmL155nIShkB3eCksPnN56GW
         HdDw==
X-Forwarded-Encrypted: i=1; AJvYcCUuy2vhmBGeHke1e8L/ZmvPRFIm2AzyYvvd9+WIEhS6NttsdJFsUFI3O2kqh70mGSThZWvzwGrqce4zUM1RoGaS@lists.infradead.org
X-Gm-Message-State: AOJu0YzSSfP9LnKbOqSpoJFH4+IcCR+01i8pe0Vn2HsdAFxQnzDkT8Gy
	xmlQ7nVRbNxWq4llBeXAOuJH0GLGvPAvgmB6JwMF2XS9oMNjcKuVcjO0Bc6FBCcG0G/jwCqHT+A
	l3DiXgBbYZ8KW/MmU3GL/VM86gUeIXMkoW97s
X-Gm-Gg: ASbGncto8DROjLCi6MTDwmyR40pu/sCyX77a6sXxAmY+wpbHrjQyXanoXGiIWkBgSx9
	HPrtRqiBJLC769OvLFT10oMbjDI+36sFyjMM1Zp/yOdF1CzSgC77Hl/lg3sSvaBRP4fZQttMeJG
	XJQOq5Nq8LNuhompQIMc5J9H7v
X-Google-Smtp-Source: AGHT+IFViHLwQLmi2S4fRUAHfeLMmKJzllXKVBj5UiLdy2wf7Yhu89RSuIkkeynjo+yeyKpP8rOlVPse9pvCr3q/7BU=
X-Received: by 2002:a92:cd8c:0:b0:3d0:bd4:e46e with SMTP id
 e9e14a558f8ab-3d17cdf7875mr3578465ab.22.1739376900297; Wed, 12 Feb 2025
 08:15:00 -0800 (PST)
MIME-Version: 1.0
References: <20250205121555.180606-1-leo.yan@arm.com> <CAP-5=fUH6X2F5S5eH+iU+-hT0vNvMKPTqbGt=E9W06sG=MzxEg@mail.gmail.com>
 <20250212085439.GA235556@e132581.arm.com>
In-Reply-To: <20250212085439.GA235556@e132581.arm.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 12 Feb 2025 08:14:48 -0800
X-Gm-Features: AWEUYZmSFu5F2ImV4w6AzGF-ggSlE124u-8a9PvKBUylFvr5MdJbF2XYRhCN5Y4
Message-ID: <CAP-5=fX6veqJYbTRfOiOqtpg8Dq+m3nZJRd4zEBCZeNiwB5Xpw@mail.gmail.com>
Subject: Re: [PATCH v1 00/11] perf script: Refactor branch flags for Arm SPE
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Graham Woodward <graham.woodward@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_081501_356380_13ACDBB2 
X-CRM114-Status: GOOD (  28.82  )
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

On Wed, Feb 12, 2025 at 12:54=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Ian,
>
> On Tue, Feb 11, 2025 at 02:34:46PM -0800, Ian Rogers wrote:
> > On Wed, Feb 5, 2025 at 4:16=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
> > >
> > > This patch series refactors branch flags for support Arm SPE.  The pa=
tch
> > > set is divided into two parts, the first part is for refactoring comm=
on
> > > code and the second part is for enabling Arm SPE.
>
> [...]
> >
> > Reviewed-by: Ian Rogers <irogers@google.com>
> >
> > Built and tested (on x86). A little strange patch 5 adds a new bit not
> > at the end, but "Sample parsing" test wasn't broken so looks like it
> > is good. I was surprised the use of value in the union:
> > ```
> > struct branch_flags {
> > union {
> > u64 value;
> > struct {
> > u64 mispred:1;
> > u64 predicted:1;
> > ...
> > ```
> > didn't get broken. Perhaps there's an opportunity for additional tests.
>
> If the branch stack's flag sticks to a hardware format, then the patch 5
> is concerned.  My understanding is the branch flag is a synthesized
> value (see intel_pt_lbr_flags() for x86).  So it is fine for rearrange
> the bit layout.
>
> The "Sample parsing" test is for big/little endian test, it does not
> test for specific bit ordering, this is why the test passes.
>
> If you think it is safer to move the new added bit at the tail of the
> bit definitions (just before the 'reserved' field), I can send a new
> version for this.  Please let me know your preference.

I think it is fine as is. I was worried that because the bit fields
are checked here:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/tests/sample-parsing.c?h=3Dperf-tools-next#n35
```
/*
 * Hardcode the expected values for branch_entry flags.
 * These are based on the input value (213) specified
 * in branch_stack variable.
 */
#define BS_EXPECTED_BE 0xa000d00000000000
#define BS_EXPECTED_LE 0x1aa00000000
```
that the adjustment would break it. But I ran the test and it passed :-)

Thanks,
Ian

> Thanks for review and test!
>
> Leo

