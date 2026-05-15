Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A870BCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 16:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8X36HUs6rqQl1PIy+2NqoP5v4KEcuNa4UBTx84v5R0=; b=Lc05SLP71us8ZVriqqxPK8tsdj
	t34Q9gwQy+1AbuEC4MUSeSIJkGu65Qkuo5/Piy4/KXcZ6NCScdaPQLg2Y2sl1s4oo2M5fCfU7A3zB
	wVbvhZIu0TRqiyZ4R0UByyQIloD62lmrwO3EGM5b0Ii6MwgwyF2BMiRef5deRlK05VNLdm6Vd8o2y
	bGaA6eVATUnqRTtRgqGyMn48mAQCOFBW4ZA8kN0c69MKyHeLDatUe3RWOU+R0diubjpoy/tGwSeb0
	HMKUfvbVImImC8RYKmyWBL9qzHMB1zkjmdBNEYbbtBC5sZ4A3jQB6/rnA/XIGmhApOplflsYUc+0R
	/WUiNNlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvQg-00000008s78-1dKo;
	Fri, 15 May 2026 16:30:26 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvQd-00000008s5y-3xI8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 16:30:25 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so1915ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 09:30:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778862622; cv=none;
        d=google.com; s=arc-20240605;
        b=eMTf8WL6gAPWs1ZkWcUsd6kITuWhC0WoXdhTgsR1Nug5Q7BQQ/eFSA1LbhD0pYFrdP
         Ips0yqQobw/hn+46znlfmnr9hqIFVSARf+dgr18NLEi+VLc+PlUviX5lHar8M5kGBokf
         9cwcSg3TovjtmWwaSt8E9KkYZB22l8aEe4e9akushmursSzIyzTUSV6wKfiSZbrFzP0m
         iVmfOvD0iqlhp4LT3MlxSBY9S4Eez0x99SG0LSVUcD08CueItq9uUMLKS/ib7ytLYaTS
         Eh60h5KLTUIJRG+hTdhpawYa8o0DQaNnqMCjKMv1UAcDy861kfuHPVB4Hc5O8HVW5lYy
         Ub3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N8X36HUs6rqQl1PIy+2NqoP5v4KEcuNa4UBTx84v5R0=;
        fh=k5VT/mse06NrmDldCR37N4mZmAZ0Hpu+1R8pDa7PYOE=;
        b=iJ0qrBfx2kLAducXOpfmUNpEwSKz5W+xbijNbaCvpA5yQXpYXEf7EO23xPXwkzjrZ4
         BphFyRGz0qdPLXuwXU8izCHknCi71ZX8zIYHDlXIgrOBCyW48d9FDHDfNkPFXtBEEXAA
         BY4jzx7TF4Hne08P0KoLfrS9ikHaaFmsxFqHvkfS1GFFuWkNR47UVYgQkiv/Wy8PUaOC
         ZKMuOhAJtmUu0mWIWUR8YqYXYwkO3pWMgeUaf3+qKK7sABdVpmOxn42epnV9xSctAUvp
         6SBTWI2Pn2WzujNft2FMEi/vmBFtSKRMpV/GxbwSgzxAtky59AM8vjq6irjdj5qx2qJ4
         YYqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778862622; x=1779467422; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8X36HUs6rqQl1PIy+2NqoP5v4KEcuNa4UBTx84v5R0=;
        b=nq4eiLkN/bCgCJkkFxpwy7EWJf2a7JXmrqg+uxcXHfG5ihPGAVQVjVnb7qOhhf3Qoz
         b/QIEwJdfnTEurx1SFVuQBDAt79o3h7e0GFusU9/wO5PG1Eu16B5+5yttkJmEEsAPGw/
         bpOBrwtYNPJEymEMynIFt+mRpopVYr52k5IDxJGxFHnUFeGeLk/9paXw1/qkOOIob489
         2CCJ8/2I8wYudYLJ+1fQ/hfM8KLk2N6KshLThknN3rRWXqiMGvz5gNGY9DrBpoArokYV
         J7fZ5ZXRCudl/1H19v770Ll9pLiTAlWW4594midp0YFrnjovbmdKBMfzGIzmEEB6Jk0L
         t6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778862622; x=1779467422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N8X36HUs6rqQl1PIy+2NqoP5v4KEcuNa4UBTx84v5R0=;
        b=eRJiAW2oUoqKLFZQBRj/DGBPxkoZJvNJ+e0O1DXCZOaEGIwiiGe3W7IYdjM2DtDLSe
         gyq3+UZx8D3J22KugxFFcs1hQ9AM6etyI3WuUOALPlUInxBB9URQa1Acj1XTexkMetRZ
         fK/o54s+A+YAN/vWW0tLBer2ksOBO9qj/z2KiEV5RFN8xkPzFMmRUxY6u7dH0ILTUK0d
         b5790r75fSGRPJaFD1yYfFVjCrZ8j6XWSpnJqhQxXLqrE86DPwnCFfnrCRsZtsB2l1Jr
         i1ETeYFUKvubshL0FQOSLeBnFfs6QQfvcw+2dfs1Khk3vQJPib4u5bltZl3hnqyegYyV
         vgmw==
X-Forwarded-Encrypted: i=1; AFNElJ/QhGVxReuZr7R5y0EWxgesJyti8VD7VMiEfdLW54bDwEGI0iQT7eKnaBMIl7XMxJa/Pky/oa3t9QAYASbfvt6x@lists.infradead.org
X-Gm-Message-State: AOJu0YzOHb67r32qu9AIiLEEI4b24XDLKF0VPIuhiuZ3gDlfhc8Xa9yq
	8Vb99gcDxTKi0iAgLU5n5P/3ltnSkhm7HOo/Abc+QLJ4DJHu88Mp+90kim2ojqoLoaaYFBZBDLh
	DPTweivk5hXTxnmG81qkBwJ9F5AYDymipbhSYjGS3
X-Gm-Gg: Acq92OEU/VgARr/sOHxcDHHGXTvW/6Ge4aOVLtteyHEaLSBzHB4ipHQrhkYhXy0os9D
	sWV7t0kYWioCS46R544ZhyDFz69LaP8C6FUnsWxJLiiSRp9Z0pe4ejyx5dANCmKl8pRKYvPhK2p
	b4RCapySojUPwzJjpzBJGXpSktIZ1oQcupJD2ROnZmgF4Fxe2uKJbznDoNyK9rs+Lr82xdTS5JO
	QevVwQ3RON9pfUAmt6jyGcEY7zjVo3Wsei+Sn9RrfRB8v2xSeJWFdXNDvcOFX8KP4cYmAV9StC5
	HLEF3M2bkYAXD0STCCc=
X-Received: by 2002:a17:903:3203:b0:2bd:907:2ce5 with SMTP id
 d9443c01a7336-2bd855b3f82mr2291875ad.7.1778862621458; Fri, 15 May 2026
 09:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260413024805.1316480-1-irogers@google.com> <20260513233151.572332-1-irogers@google.com>
 <20260513233151.572332-2-irogers@google.com> <agZk-CCrLUMTyWE4@x1> <agcDOac0qbP1KZ4Y@x1>
In-Reply-To: <agcDOac0qbP1KZ4Y@x1>
From: Ian Rogers <irogers@google.com>
Date: Fri, 15 May 2026 09:30:08 -0700
X-Gm-Features: AVHnY4Jj3RombHh7dzSY677EqlEwmw-S-zqP0uGxlB6k_ARgnj2jPXbNAf5RD5M
Message-ID: <CAP-5=fUO67hKRV0C48uT5zF4uj6ptT+ApYE1jOitnJ=Af700=Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] perf unwind: Refactor get_entries to allow dynamic
 libdw/libunwind selection
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, namhyung@kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Li Guan <guanli.oerv@isrc.iscas.ac.cn>, 
	9erthalion6@gmail.com, alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	howardchu95@gmail.com, john.g.garry@oracle.com, jolsa@kernel.org, 
	leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org, 
	shimin.guo@skydio.com, tglozar@redhat.com, tmricht@linux.ibm.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_093024_012026_CA779120 
X-CRM114-Status: GOOD (  25.14  )
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

On Fri, May 15, 2026 at 4:27=E2=80=AFAM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Thu, May 14, 2026 at 09:12:40PM -0300, Arnaldo Carvalho de Melo wrote:
> > On Wed, May 13, 2026 at 04:31:45PM -0700, Ian Rogers wrote:
>
> <SNIP>
>
> > > +++ b/tools/perf/util/unwind.h
>
> <SNIP>
>
> > > +static inline int libdw__get_entries(unwind_entry_cb_t cb __maybe_un=
used, void *arg __maybe_unused,
> > > +                                struct thread *thread __maybe_unused=
,
> > > +                                struct perf_sample *data __maybe_unu=
sed,
> > > +                                int max_stack __maybe_unused,
> > > +                                bool best_effort __maybe_unused)
> > > +{
> > > +   pr_err("Error: libdw dwarf unwinding not built into perf\n");
> > > +   return 0;
> > > +}
> > > +#endif
>
> I also addressed this local sashiko review comment:
>
> -------------------------------------------------------------------------
> Since unwinding is performed per-sample in the hot path, will using pr_er=
r()
> here cause console flooding if the user explicitly configures an unsuppor=
ted
> unwind style?
> Should this use pr_warning_once() instead, similar to the UNWIND_STYLE_UN=
KNOWN
> fallback behavior in unwind.c?
> -------------------------------------------------------------------------
>
> And in one other place, please ack,

Acked-by: Ian Rogers <irogers@google.com>

I think Sashiko is heavily biased toward warning about too much
printing due to how the kernel handles printk, log spam, etc. For perf
we have a problem that there's lots of verbose logging and logging
something just once may lose the warning. This is somewhat the
opposite problem to the kernel's. Do I care about the change that
much? Not really. If someone is having a bad time, perhaps it makes it
a little harder for them to know why but the priority is to not make
people have a bad time.

Thanks,
Ian

> - Arnaldo
>
> diff --git a/tools/perf/util/unwind.h b/tools/perf/util/unwind.h
> index 28db3e3b9b513401..69ba08afda792d17 100644
> --- a/tools/perf/util/unwind.h
> +++ b/tools/perf/util/unwind.h
> @@ -53,7 +53,7 @@ static inline int libdw__get_entries(unwind_entry_cb_t =
cb __maybe_unused, void *
>                                      int max_stack __maybe_unused,
>                                      bool best_effort __maybe_unused)
>  {
> -       pr_err("Error: libdw dwarf unwinding not built into perf\n");
> +       pr_warning_once("Error: libdw dwarf unwinding not built into perf=
\n");
>         return 0;
>  }
>  #endif
> @@ -81,7 +81,7 @@ static inline int libunwind__get_entries(unwind_entry_c=
b_t cb __maybe_unused,
>                                          int max_stack __maybe_unused,
>                                          bool best_effort __maybe_unused)
>  {
> -       pr_err("Error: libunwind dwarf unwinding not built into perf\n");
> +       pr_warning_once("Error: libunwind dwarf unwinding not built into =
perf\n");
>         return 0;
>  }
>

