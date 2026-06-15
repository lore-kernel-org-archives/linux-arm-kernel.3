Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA479CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 15:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwMpR2s0Waqr3fJu94xq4fdF3hUjcT7amK+18nHRrzc=; b=e4RTQsTd1K3gEYmX6UcDib2G+V
	YthI0OeZ9881rIHdydZRqpVca3d+Q9HEt+qZAxIqkX5wNUn+s+EFadmW8jnidOxN5zemaHasO0Szi
	vakjK7cYUuvb0/eqjPfXOzeqT5n0KMSRjq3gK6qrHxXGSB806CKijcE9ujKxum/li0rfl0S5OhGw2
	7pSjvzS5RC4PXuO41KkxZ83PYK/Q/x/UDK7TNDZR9Y1l4yDz5SytQF+hFKG0LLGT1j/NOKACms48r
	pYVXgxDAflJZvY6CF3F1rVLNOW/tc7bzFyzqKNSAP89yZQKpAown0DhN+1EqhN7Ylb+F5946mnCJc
	JtMEQMmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9Nc-0000000EVjN-1V86;
	Mon, 15 Jun 2026 15:37:40 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9NZ-0000000EViN-0poW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 15:37:38 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c67ea316caso86995ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 08:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781537854; cv=none;
        d=google.com; s=arc-20240605;
        b=UaURx/ctt7yTDPdkMTcSLCBRbH4XiaEOFwW2ysxztYZwbjaRZd0DwGlGOz8h3VLLCc
         kx0tytSmB0E4jcopmo6d2pYTkBTZx6tdcgHZQoEMbWPWJhNiAN6IosNLsauE2EJsEL1s
         4/6jSLoVXh7/BElMHnQse+Dg4ptHnvxpd5YuKmCw4EFCbRgsnmCU/0sE6BeglYAdnBzQ
         Gb7n9HSw6TlFOyTVrZTIFCCRoZxlSRncQi+P6bHUuceC5MaROPFu54UNfAuhjMwPvgKX
         dGdoP62kTk4gcqXtdzopEqxTlc4pgjEAscWYPXk3eL3pVkAlS8enBMr5b+wPBIzsFfWV
         Aqfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BwMpR2s0Waqr3fJu94xq4fdF3hUjcT7amK+18nHRrzc=;
        fh=f3v/VuBY2IvlA05a5DDHr7W1GjSR77yx37+HjmQ5A5k=;
        b=LusarQWdHRYH9r/67JEvqNui86AEcIcGfPZDUfRiV409qkwCEr60a+nT0yeGxvwa9a
         ZtfvKVYs0wwRhiYAqYefS+wnKUj0ozzH6jGJDmnwaZENFg3kS7818/X1Rc5VA023Cyhj
         C+Olq/J2ZHvXEAumXm0bVoHKwKoDNeG8b36Tcd8h8p9gqjAKXo1QNCHz/TPpFrBL5L8H
         lsnn3fzQ/+QE0kQtVyWNR91f8u3ggI14jG8mpsYbB4xnFQ8/5j/ojrG3xFl3iL+XTLrh
         qlrFjgeLQ4YFZr/X/LIiREV9eFLuuudIq6d4XPS35dd+Tnqu5VLLgGbqzSI4q/fWTBCC
         jSbg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781537854; x=1782142654; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwMpR2s0Waqr3fJu94xq4fdF3hUjcT7amK+18nHRrzc=;
        b=mkROFMaIxEXGrLRAqnrcm0YxJ7kRARjXVB/EMP0aXBn87J+aMTGaDBejHt2dqupaaZ
         1V3ggD1qMgZr0keUiPw+VpnoGZrcJmXtif0whNWgKOQN6D0FClrF/VMJGsSV2KSlT480
         esL6RnsHRSVnGragGdbvrEH4AjqqK7BgizNN+u6zN6X7aISurKhHcmNFcmgyexl4HEP7
         0rtmzh/Y3GftZINigAqQYOd7XrhXZJaNkAfZLyvZKz2RCPE4AQ4XMuT/ImkSzXM4CaFY
         /KhYizvaH49Th+17Y+zgDpnzS6U4U35I/e3PzJFLIAEfeSwgEjRDnIf9iNNVtLUdk/T/
         jVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781537854; x=1782142654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BwMpR2s0Waqr3fJu94xq4fdF3hUjcT7amK+18nHRrzc=;
        b=INsRJrhITs0BHm6r55DGs7vZCVtWYJrbgCtCiR7qF8U3+AXH2tNq4CAtphX1pxjyCF
         knhLQxIWVlW3w/GyOHCFZK3jZS4p8YEnIARtR0s/uVl2PAQwcPCAA9724hM6AczZJt8O
         wueOIRxCzvpKPXMoHjFR+Icly0JKELsEIyA9xhfCO64sqf0jY08ElcJ5MCa2sSgGg0s4
         jju/0wGdsifDm8gQ3YbyHj1rgxRClRKW7VPLbnJ7oVOgo7V7OBUWFjrqhXNIGsDBYpZJ
         ZaUswWzrfnQN3OnFKBPEjZ8GOjiSk3safd9Jym4JCEcrg13MTRrUDo5cmHz6hmY/Ktoe
         k4pQ==
X-Forwarded-Encrypted: i=1; AFNElJ8LSTyGy3m047gTIeONU7kA5zaTXXGZh606/i46Nrt459wmSDsscXuRWRjI1YK8HsH0et4C6oWDNSr7iG4oP6tc@lists.infradead.org
X-Gm-Message-State: AOJu0YyGId61ubhZ6rm+s++FHtPw1fViuNALGPGA9Y9o0ABz4cLLjn0l
	aGphU647vsISVuKXlCgZ6qxXKm3VVHlWa+FidCwlaift7CB/sG9w5i20OX5x3Uhimm/+fs60ReB
	bx7g5XtT8oQqQNM32awHzMzzNKDbJo5xtHAsawMil
X-Gm-Gg: Acq92OGYxMpEya7qj9k+D9yWxE26sXjG8SPI2Eh9xM0+7r4fvNvAJdGkG6q8K0JrC0p
	m4UyzYhu7NfaqvFzgNGAJNLLvjS4549oRErbL56kY4nIz6TQXrn12qinhbQGht3JTKQj7echuzw
	g/CR0+L69Lirecul3XzeFy3XXOsAUVCB5YFQCdowt3PsEBHA6TPI+KKNQO2Y7l8Tr4FO5stZkgF
	6HRiExcQEHNtaiOa+W9RAxd6sicne065q9GMnPbddWOghjy+iwkytb4arXgU3sjNqGtF3oEwpHc
	lP0b6L3IK+b8QKjadLgXIwwJWuldRjTuPCx/lA==
X-Received: by 2002:a17:903:19cc:b0:2c1:4a67:5f31 with SMTP id
 d9443c01a7336-2c6968305bcmr600355ad.9.1781537853083; Mon, 15 Jun 2026
 08:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260609215046.2391903-1-ctshao@google.com> <0b6d58d5-f802-47dc-ae71-31c45184b738@linux.intel.com>
In-Reply-To: <0b6d58d5-f802-47dc-ae71-31c45184b738@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 15 Jun 2026 08:37:21 -0700
X-Gm-Features: AVVi8Cc7N-HxLTVS7DlAr9qvARu6rk_YKZRh7Ttf3nd4FIB4jf6MO19ixXcfaOI
Message-ID: <CAP-5=fU1EsSAo-f9zEVX3gWAVhpjbaCjqgA2M_xWo+qLZ_6AZA@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] perf vendor events intel: update
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: Chun-Tse Shao <ctshao@google.com>, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	afaerber@suse.de, mani@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_083737_235291_4BDFD397 
X-CRM114-Status: GOOD (  15.39  )
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

On Sun, Jun 14, 2026 at 6:32=E2=80=AFPM Mi, Dapeng <dapeng1.mi@linux.intel.=
com> wrote:
>
> LGTM. Thanks.
>
> Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>

Reviewed-by: Ian Rogers <irogers@google.com>

The tigerlake update is just the version number. On the perfmon git
the change was removing zero fields:
https://github.com/intel/perfmon/commit/8353ffb63efcad6b6fac1a8c05d76e2d631=
7ae23
but zero fields are dropped from the perf JSON, resulting in no differences=
.

Thanks,
Ian

> On 6/10/2026 5:50 AM, Chun-Tse Shao wrote:
> > Sync with the latest perfmon events from:
> > https://github.com/intel/perfmon
> > by running the script:
> > https://github.com/intel/perfmon/blob/main/scripts/create_perf_json.py
> > and copying the resulting json and mapfile.csv changes into the perf
> > tree.
> >
> > Chun-Tse Shao (6):
> >   perf vendor events intel: Update arrowlake events from 1.17 to 1.19
> >   perf vendor events intel: Update emeraldrapids events from 1.23 to
> >     1.24
> >   perf vendor events intel: Update graniterapids events from 1.18 to
> >     1.19
> >   perf vendor events intel: Update lunarlake events from 1.22 to 1.25
> >   perf vendor events intel: Update pantherlake events from 1.05 to 1.06
> >   perf vendor events intel: Update tigerlake events from 1.18 to 1.19
> >
> >  .../pmu-events/arch/x86/arrowlake/cache.json  |  30 ++-
> >  .../arch/x86/arrowlake/floating-point.json    |  45 ++++
> >  .../pmu-events/arch/x86/arrowlake/memory.json |  18 ++
> >  .../arch/x86/arrowlake/pipeline.json          | 129 +++++++++-
> >  .../arch/x86/emeraldrapids/cache.json         |   9 +
> >  .../graniterapids/uncore-interconnect.json    |  10 +
> >  .../arch/x86/graniterapids/uncore-memory.json |   2 +-
> >  .../pmu-events/arch/x86/lunarlake/cache.json  |   2 +-
> >  .../arch/x86/lunarlake/pipeline.json          |  27 ++-
> >  .../arch/x86/lunarlake/uncore-memory.json     | 208 ++++++++++++++++-
> >  tools/perf/pmu-events/arch/x86/mapfile.csv    |  12 +-
> >  .../arch/x86/pantherlake/counter.json         |   5 +
> >  .../arch/x86/pantherlake/pipeline.json        |  29 ++-
> >  .../x86/pantherlake/uncore-interconnect.json  |  10 +
> >  .../arch/x86/pantherlake/uncore-memory.json   | 221 +++++++++++++++++-
> >  15 files changed, 728 insertions(+), 29 deletions(-)
> >  create mode 100644 tools/perf/pmu-events/arch/x86/pantherlake/uncore-i=
nterconnect.json
> >

