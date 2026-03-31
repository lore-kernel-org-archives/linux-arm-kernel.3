Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00C210F92E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 17:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l98tvJP33qg7yUNaZsXGxPv2Z0+17QhIZr8805RPT0Y=; b=FlKZKkZyWYQvPINCpiisxzX7l6
	xsqNITSVkh3LosRSf8EIw77JCg5CaUy+YwFoTDJpy5vn1RoeqsUt6qdtTXBwFRJxjhDqtAkYMdAVv
	3wgX//w7LJ6XNM34qoK5wCgf+SIyen0eLtRr/eRSG5KUPlfws/pMUH8NeLNoKz3Z787o2cSDS1Cgq
	qgSbOCZ4jACLVyz4DlLiWz1rWC+dj7ccpgWpGbXsk6hHJpgjLwwPm6A0fYLzeJfdPt46kyOU2yXge
	AYcHm62rzjIle92twQaAXFJyAnxh4pCwLLVUVptYyGbxh+pTImqDRGa+egFCfL/+9dM5BDelEWjlM
	G+bQ29vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cTK-0000000DIIO-4AIH;
	Tue, 31 Mar 2026 17:01:47 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cTI-0000000DIHY-1hHQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 17:01:46 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-126ea4e9697so11910c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:01:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774976503; cv=none;
        d=google.com; s=arc-20240605;
        b=ed7+Js9VTzGCLuVLF75+zuXT0loKYoSOpYdPqitdr1C0NPDvfdVsjRuzPbrqExYI0R
         fmzd1gDRIM9uj8wwfnAn6ck88mWbUU2RW2l5/zulWoHmMSZKlImSDiag7U7/76396qDj
         AicI9VhKjnYalUWnC23nI/OTgWDRUHQM5SzhIMfIigRvouiL5ndBw2gaCSB30h4eehvh
         ylQAuOuv+Wh+jIsSVCU8djL3BgYPGFdYq6VXu9xrUfxI4TIK/PwTNuQpTAi2nK+/YgV2
         ujw1RNqWANMYejqAYfFwkUXs+i2UjFW6wkHev4j3XIxtbUldjhF+2SrvuRM2nYznbzDu
         z6Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l98tvJP33qg7yUNaZsXGxPv2Z0+17QhIZr8805RPT0Y=;
        fh=UCnUn+gNo0Ste+KsJYAsPt6/zOUH4BUyXLLcwJrwjcw=;
        b=fcHAJi2LkWB0Y4I307XwTF2Tm2Axoj1JrXRSu0JXslwjUDzM4VMEWgyaPDfaNaCnZS
         fCR7ek6x2iTW9/xdSKr8G489Ji9id2dLcXqXtYRMUMpncq4w8U4QyWIIZ7T7BBBOv1Vg
         ZtoVdzBicOSrPyw17JhPcmCU9G7WAAfGxdaLAHu1qvzp/v+3r03Void2uAEQvRkcJplH
         xRnMnMABl+Gez+jzX/cIuCVkOJnpHiXDsvS1HqP7lxBlksb0Km582Pa4Icem+TmBPphE
         Ac16cFZi5SVgdapjYONJt94EwodSACaXiLl1CCVf/QY/3kMZQH3Oix1/5edFnAHnu7O0
         rOEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774976503; x=1775581303; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l98tvJP33qg7yUNaZsXGxPv2Z0+17QhIZr8805RPT0Y=;
        b=dt/wgGqC7ZHEQEw+Ksy98SrbFUC1Cf6lnKdycCNFfPXHhDCgkV3G6xf/D9q3qF9G67
         iR8Poc+d10XcVc1OEfoHdgsdYT/TGRyPMbVwC1UikXmXfjRf7A54l2XPt4gGzIzipsSF
         l4PPx0H5krAHCV0M2o0XLbpwgAzw0RApJDJ/TnBsRndKjdHKRmdOwcLogxEEADgTLnAN
         gefOKMlsRBoC2sq81PZDXkWNMJOhtwPcws4yEar/4dtRoP10VIqAvWNitfu/UIjBMV3k
         NOwWAwtCIfk0ieF21wp10Kh7mOpHPNYRFFliVMeILwHrsD0IFTDq0PlA+EHBIMtSWkFI
         AVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774976503; x=1775581303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l98tvJP33qg7yUNaZsXGxPv2Z0+17QhIZr8805RPT0Y=;
        b=X2fTuLKbkb562W3ve++oCQy2Ml7/mInq+BgICwQsBZWfW3YdslyeSpVfSp4UV0uMZA
         ejCM5tKUPfbc2BtK4SKcfXUFsvWH8ZttTT4Vq6c6FLeCLO+JA5wMJdC7PLCK564y6WXA
         XRrQkOy/SGsmH3BNNGO+Vqjl7hRVTVLrmgAoKnnsG2wC26NCH9Ts+AgfCjqMUNdNjoux
         7T/uqIEdnJ3tkS9k6i3/kmJE/jNraHz5sC6f+xN2TrV4V9hLJ0bfFgznb4POtDPHzjd9
         a3RGb/o4yBYm0LH+H26z6gPYx6ux4JJHhXZfT16ZO7OiPdKPKcj9ZUL8WdEm6+2nfDI3
         dQWw==
X-Forwarded-Encrypted: i=1; AJvYcCWH4JRAurKzaXA7ogpmdlrqJWH0BYrkek8MNDB0rBJUnpXcZT6/pvJM1uZ/cEJscySswfnxAfXb8MlctFvV/SQU@lists.infradead.org
X-Gm-Message-State: AOJu0YytRDfQxMnYlhAi79R6Lrhu5tA0zzAiBkYRL0t+q+nJMpkB9Q1W
	NxgPwrnkxWRpWIwjQkuxi5+b0ysLtW0sF/p22Ww2ALp3zJXcLyhq76n/WniHqFf34bLXjPoV0jR
	Ts9yJ75KCP/e01gRAyC/c+HY8Y3EjMwxFHf67J0fi
X-Gm-Gg: ATEYQzyrSYEUPenllmtA+gL6s1R1WiADYAgRHsQCxMpQnjtl/WXLrPKv6hr4vQJ91VH
	wZsK3Hol2kmWy2YRGqMKDqIaXbpuLjB5dfhUmjQk6GmuesE7K1ezhmQz/UEV4XAYj/F+DvCcl0Y
	WAVOSsTrOS75vMcPj4SVR3p+fGxPHKPl+FkVOqY7ZjoBehAFBIQNEavCeGmFggnRq+3lWhBQYRt
	kFzp7bRNbwJX9hLhD8Kfto4hQrOM4MmgMje0vrfcYkbiAT+UIhZ+GJPacl9pn0WxxGZR0Y3WWsR
	lmZZjDGq4b04w1CvBSmw+EfYy8ECHEVyNSwhCQ==
X-Received: by 2002:a05:7022:6987:b0:12a:8cf4:65d8 with SMTP id
 a92af1059eb24-12be6159009mr19765c88.14.1774976502067; Tue, 31 Mar 2026
 10:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAP-5=fWVU3ktkGAnZQrjQJf+Z5AtQo73BVUhj-nr3H95GdcEJQ@mail.gmail.com>
 <20260305221927.3237145-1-irogers@google.com> <20260305221927.3237145-3-irogers@google.com>
 <acrln3IwOebvb6yj@x1>
In-Reply-To: <acrln3IwOebvb6yj@x1>
From: Ian Rogers <irogers@google.com>
Date: Tue, 31 Mar 2026 10:01:29 -0700
X-Gm-Features: AQROBzAxOb5Fj0tz8CFxXnvG80J893x9iFJ4Ie0P731uMqrcv3OK1B9SMHLInoA
Message-ID: <CAP-5=fXn+uNEfZ71a5zZ5BdKw8-LfWgpzye8+eTJH32gL1=b_Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] perf build loongarch: Remove reference to missing file
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: 9erthalion6@gmail.com, adrian.hunter@intel.com, alex@ghiti.fr, 
	alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com, 
	aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, blakejones@google.com, 
	ctshao@google.com, dapeng1.mi@linux.intel.com, howardchu95@gmail.com, 
	james.clark@linaro.org, john.g.garry@oracle.com, jolsa@kernel.org, 
	leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com, 
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com, 
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org, yuzhuo@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_100144_446392_D8B3DD4F 
X-CRM114-Status: GOOD (  16.86  )
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

On Mon, Mar 30, 2026 at 2:05=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Thu, Mar 05, 2026 at 02:19:21PM -0800, Ian Rogers wrote:
> > The file was removed in commit e62fae9d9e85 ("perf unwind-libdw: Fix a
> > cross-arch unwinding bug") but the Build file not updated.
> >
> > Fixes: commit e62fae9d9e85 ("perf unwind-libdw: Fix a cross-arch unwind=
ing bug")
>
> Removing the 'commit' part.

Thanks, checkpatch caught this but somehow I missed it.

Ian

> - Arnaldo
>
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/arch/loongarch/util/Build | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/tools/perf/arch/loongarch/util/Build b/tools/perf/arch/loo=
ngarch/util/Build
> > index 3ad73d0289f3..8d91e78d31c9 100644
> > --- a/tools/perf/arch/loongarch/util/Build
> > +++ b/tools/perf/arch/loongarch/util/Build
> > @@ -1,4 +1,3 @@
> >  perf-util-y +=3D header.o
> >
> >  perf-util-$(CONFIG_LOCAL_LIBUNWIND) +=3D unwind-libunwind.o
> > -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> > --
> > 2.53.0.473.g4a7958ca14-goog

