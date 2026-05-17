Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E86ECD4F47
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 17:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGJG9ixedY3dsifAWRpwM476JJR6wZkEpduvZ4yEvkg=; b=MR9D0CK2JDlIFqpWHqQwwdz9en
	QNdtd9T/txvORaUY6X56eUCFZeAKlhxg6ZoOlwoEuKJLrKz4+jN7yji4xU0uWJtu5UjN0wXs9n0Jf
	oilMVTogAiybS3VqK5++ALhk2E0uCMIt5G61CnsrQ6WrEB2Sg6XrZ8KUpp6XPGQabQqT+Evoiugql
	zLz0iVJer2/OerdV9Xl/tB/DKChWb0gXO+0ELg1KXk5ALcFP5OWY9VIhD9jvH6qM4J+TZEHBqtAD5
	jsxgmJEpCQF//7ORvH6YZMd3lsf++sKaUz4o9p4rWQ1j9pVBXfL0c0I+cQBBNIz8dSYLIgYbitZfy
	IXRn34ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOfDd-0000000D6J8-14Az;
	Sun, 17 May 2026 17:24:01 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOfDa-0000000D6I9-26An
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 17:23:59 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so755ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 10:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779038637; cv=none;
        d=google.com; s=arc-20240605;
        b=PFivV3cSJ2dIfw+0AhedfuF5RBj1x5lsmKcbi67BpXyY+3ySZxHmJcH7mlhc20G9lu
         EiiwfE7eyBVsM36OhakHp4aksp6F4XaVX0IZjr9NVrGOBkKzQfXBw5MI3ZOANJ3DPr6Y
         ThcQeMWswThbOHG1f9rsObhk9ifivb4632Ck4Cah0MnJFBMU0MC/FpKt5MD9u7Skau/9
         VYZ4obTNzWwvhFBMyEi/Ea+BiQ7RyVcpKzDihpFP3VGHmZjoCUPZzxwlVqNetxUgNGft
         4JHbrSGq5tFH1N8dGVkvZGY3vghof8G9cinb6IBrC8REHixax6LNP6cjLE4GXUQe+JsU
         kZMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SGJG9ixedY3dsifAWRpwM476JJR6wZkEpduvZ4yEvkg=;
        fh=mkhiZk+yTpy6LTTNC0aS+DRwNc1eOAPCFvai345H6Bg=;
        b=dTrjgiYzvPFWQ6CMmln3Z1gd4rP72uRLVeVtSfnFOVn+86k8/v6YU8/+3xa8V9z9PQ
         PLZyFzmFIr41wooqtBPotk6wY3CIpMP2h+czi+5KnuLHCeSuVAIxWNKCVTCBgEYRRq9H
         3VL7u7KMT1RHykb40NMu3nmu6X+eb34wFRGkFUrdSbzzIHpqJ3wW7tQC0VUiYg46HYBB
         VQhYiSesL3M1HX1vazTH78hAXBV5X3f1UNj5mLugmkb/u+vKQBEaOd6OPqnhTiaYWGTG
         Le1avLr7cuQThNRCK2X+5ILvFVaXB4bBxulOKoohD2sQbqzCkMHok2DaZEuo4opQz5RB
         /YEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779038637; x=1779643437; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGJG9ixedY3dsifAWRpwM476JJR6wZkEpduvZ4yEvkg=;
        b=SulZ2n3ClPdMdA7Nx/Zt9tdaA/PkBfpwO4kPGmXhr3hzAJ+pnxJ8aGCF1hClbed8qQ
         MbvJ2ACX2wx8ud71aT5RVBxXQ8nBjGaq++9pQ9eXAKF01YQ9arwtzfOjAbpF1i6Hz2pq
         gM46H8Y6C+0ervIelWzKwM8klPagZSrW8kN1/tehwDfVCGlEOQVHrrOWwSV0dZJ+0MMD
         9iV+yHy14ZJd9Qpuv2ChjRLlLicoXn8nzpcxLD/+Al/69hMWKORYdnPeuyoxUe3EKo1h
         rIOPV9+NJfJgLjR1dTGZ6qGjYrOyuajpSicM3QTytpO39c5YyxOngzsSjTcCtCsihnDl
         6e2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779038637; x=1779643437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SGJG9ixedY3dsifAWRpwM476JJR6wZkEpduvZ4yEvkg=;
        b=F2UYSpPfCQdrVmHFXiGNtj34h/ea69PzjrPpizd8Q0XAUzw5/yvZ5yQI+mN9W79o5L
         ICludPkwvZdgQ2rfnL1jd4hLsYrIM/kZPqDx5q/3SWQGTt7IvYQ4LI8EJU7yqU2767Ln
         giaC+vUv+tIRh2p+Zi5V/kGNTbt6VqxhvK3XUTUTVRjqLiffdXs2rNtXCjgxq81kuYpv
         EMSOE+DqZPFUKIfxSNBmwWTXxir+RDVfwd9DipOiOatSHHkLHTgUKl7HxUzHT59hQ+mF
         EXjWAwU5562D/WhjG95sYYc4U0kUId0W7rv8UZ3KcmsS8jyQENjt3Cb2YyQ93ENdLmHu
         zAoA==
X-Forwarded-Encrypted: i=1; AFNElJ+QUaQrmrWz1sqvScfFodsv8TcfYbvG8GJtmnkSQkNVyJp7/WRWqNkj2EhI0o6fbeR4H3ewpcUMbXI6oYHSAYaI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+w3zihJJTBYUyfzbCcqKZMf9DdbTCdvZe7Dgcp5Ze6suz72tY
	kg3xXoGVVT6wZfSUUM1xz+l38qGRgwB6y/WBFeqgAa5PRPTrS79QSG9UBnBzJoeZFEOO2or3gfp
	RE3eF7KB9c1DgmA0UYGuaQTONs1lkv/dn7b5jkv8K
X-Gm-Gg: Acq92OHUV2keP0cpGIpEFa2SYV23enIynZrI7ZyGuq2U+TZIQLLEh2LsWUciG2tVDvE
	zBLQQAhCSGy6jspztoPCQTKTL3OSaduzSUp+D4DmjyfGM/nN0CVzjD9vf9i5TgMJC9JgpKGcux9
	nNf+co6jR0tVQLOKcU46SdHXLeVRptNqD+lWrtIbuWSbQ+EiuJN8uUHdAOjxnxnLiGMyvtFUr4E
	THlEnIE16por4hw6n7goQqjeO9n3kEFR+6CQz4fcRRRjD/ksDw2GeGZpMminl1r0E5ZpNX2FaGK
	Sf7WkaT2dizJ7Dj7kLo=
X-Received: by 2002:a17:902:d4c4:b0:2ae:80a3:98a9 with SMTP id
 d9443c01a7336-2bdb32c2d37mr1167585ad.11.1779038636024; Sun, 17 May 2026
 10:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260413024805.1316480-1-irogers@google.com> <20260513233151.572332-1-irogers@google.com>
 <20260513233151.572332-5-irogers@google.com> <agdyluuau3wPQOtX@x1>
 <CAP-5=fUeGOSH1LO1oSbWnpmXfv_RzxfFE+YCQ07PC19gLHDEsA@mail.gmail.com> <ageGsOVhDDKnvQhQ@x1>
In-Reply-To: <ageGsOVhDDKnvQhQ@x1>
From: Ian Rogers <irogers@google.com>
Date: Sun, 17 May 2026 10:23:44 -0700
X-Gm-Features: AVHnY4JUTcrJTBzz5U7-VpKwbcc8eerSQ_000WG5_wnMHmZQGZGfdOC7RDHXMOQ
Message-ID: <CAP-5=fW9aJyt7VojbZqkiHdiFgEcofKHpYrd9BHMSAOLRkfApw@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] perf unwind-libunwind: Make libunwind register
 reading cross platform
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
X-CRM114-CacheID: sfid-20260517_102358_565325_EE098578 
X-CRM114-Status: GOOD (  20.61  )
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

On Fri, May 15, 2026 at 1:48=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Fri, May 15, 2026 at 12:38:48PM -0700, Ian Rogers wrote:
> > On Fri, May 15, 2026 at 12:23=E2=80=AFPM Arnaldo Carvalho de Melo <acme=
@kernel.org> wrote:
>
> > > +++ b/tools/perf/util/libunwind-arch/libunwind-ppc32.c
> > > @@ -23,6 +23,8 @@ int __get_perf_regnum_for_unw_regnum_ppc32(int unw_=
regnum __maybe_unused)
> > >                 return PERF_REG_POWERPC_CTR;
> > >         case UNW_PPC32_XER:
> > >                 return PERF_REG_POWERPC_XER;
> > > +       case UNW_PPC32_NIP:
> > > +               return PERF_REG_POWERPC_NIP;
> > >         default:
> > >                 pr_err("unwind: invalid reg id %d\n", unw_regnum);
> > >                 return -EINVAL;
> > > =E2=AC=A2 [acme@toolbx perf-tools-next]$
>
> > > Ok? It was the only issue found in this patch.
>
> > Looks good, the NIP is in the original code that I copied, so I don't
> > understand how I lost this, but good catch!
>
> What I have is in tmp.perf-tools-next, doing a container build now,
> still need to look at the other findings, but they seems either trivial
> or complaints about making  the build time more inneficient by not
> caching some feature tests, so I think I'll fix the trivial like I did
> in the above case (posting diffs to the list) and leave the build time
> for later so that we make progress.
>
> Will try to do this later today so that I publish it to perf-tools-next
> for it to soak a bit in linux-next.

This is great! Thank you Arnaldo!
Ian

> - Arnaldo

