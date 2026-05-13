Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C841CCD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 12:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4chqvdfqdlpd51Jc1ZDdzdbFEZgBpj4aJvQtdp2bJY=; b=mxJuZPZhJ9H5LPXTXd5+WvdhO6
	A+OugTyEbO3EIVqNm60ZC7DKgX4qth/57eDVTq5Uz09ptzSob5emSNJ4/c32ZnH6wYMKu9zwwZyl4
	PFq0qzHMYLoxIYbRmSc67PdxDziGOJVnBvLfJJ2QM2tQ52oaCuTdNn7V0BJXUSzBSXuEoQ74t5200
	hGVO0f0aIvqjPHMQLYKEM4isZMauaiZnvAhnnD3kzGv1lDkOwxdtrzVQ7FxR5qud1sf3TEPGftAj+
	2bvxpVzdqA/nqK//tyj+ASq2hguqWTWEFDO6vSldTtIhxG/eWGMG10sF/yoY2nwW86jm4xilTaWIH
	ipMyWr8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN97z-00000002a2W-2E3T;
	Wed, 13 May 2026 12:55:55 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN97x-00000002a23-2pEM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 12:55:54 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ba180a022dso125ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 05:55:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778676953; cv=none;
        d=google.com; s=arc-20240605;
        b=MeKQcomFe9P0HuJaiJaHODeq9P3bHBVnhNCWMM+glFgnhSXLFp5Bu3sdFlL1mKhHjy
         yM6+8TFMMDP9qRKl1Sqcj9+tLxuUzxgTgPGISkNVP5SEauj0v7XO+H4DmsvLb/JlbkEC
         YClF1WZ338PshfABjU5HXWudkVUq+ObToiaLoGw1JtgzxKLeYky2MGDulwj9bnOh7QYG
         XsHmvK9CXBE2MM094jRnfsrC5n+QJVE+vbWYIvMFv2msdUCR+L6B6XhwHbLvq8d0gWyg
         25252Y14ULUI+MKSFcTGQs7sKFKTcr5fExDiMjM3BA5iYcyqNi4IXYM4j7jcogJZzVlA
         00ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p4chqvdfqdlpd51Jc1ZDdzdbFEZgBpj4aJvQtdp2bJY=;
        fh=PJWA7egO3An/OCoGRuViL+MMAZn5PfFIY5oLYz/Kw/8=;
        b=OXPJCDKteephuuCMTOSIwIfLNSyxozyeRBAbdWR0HtyqfeejGIzARGsrprD/odsWof
         bsYLHV5epkonwdT4IahVIOaR0sXXh3XolfpBspwG93qzuqUCMV56RciA6oEOt5lbHov1
         Uc2aaIBgATwEDn12LCrL83f2NWPiPJA7pccdgn95EQN4BEKgjxbK4Bu2osnO1cCGBVST
         AWrdlYlL2+XpA1neybwAJsdwzD1XDi07fXSMkTuzDmiCsQgcusSMLoQRGML6aE6E9QCR
         L/KDXGKFioT3KB7duROSoExoKLDxfNAt+7/Sp7nLqHZuOyKmfzanH2zIox/8I/p4LnKj
         ddoQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778676953; x=1779281753; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4chqvdfqdlpd51Jc1ZDdzdbFEZgBpj4aJvQtdp2bJY=;
        b=Aub+8zKsLzeV6MYo/vkgV1NXcBZSPpCPwZ8foWiIFGXl1rFfXmzuC19Upm4qpmi+OS
         YD3TI5R8KgHp7vCTCptaDDJ63Jzw3bPo8lRqEzeo0Qo/i+GtlBIdaYrhAFhq8L4Ibr7l
         vhnUO6BYGdc4Vdrqp0QC6H2glhqDlYX4GMYSwJ8huf+elOpFoJLFdvtKKrZMsbobjFck
         6h5XBOOtu1SSjMmlpdNcc18PL8M9/Mz4ThtaZWe6v7KkMDxb6cPdj10NTO4/xwP27Lhf
         +8ltrHBZN1nnTDQ+uIEnwuHutXjS8PYEPe1dpZLsFNdrWnS8W+DDBO6ij69cHuXXJ49f
         zgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676953; x=1779281753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p4chqvdfqdlpd51Jc1ZDdzdbFEZgBpj4aJvQtdp2bJY=;
        b=YzhawzW06TCZpQ7nE7Cl51+47f+20CEhYalsHFRy/fd9M4xCBMheAA31/uNHuPeQi2
         tQ3L8NPWgJe3sTXd3h+ES1OjxySXQJU68H4QOiSp3Bi7m57thIy9E8tJVC6DtlZzrfes
         DEXluo0GsNQ2bjjkhIE/anT7TxNj3yFtE/cWOl4lZnsaHkpaELL70/FgI2KIYS6QqeVy
         hwpXd3tx2V6RGb6AMu9Fcm5jprMNzmO1XActbBOEAi4UiGZvBtbe9eOEG5jrrl5yVjoK
         1YbHX+ZyeYe8cc8Cn/LdvyI8DdnS/53tQXXDUhe2p1XoBEl9PKL+Ans9Btww1WwJcooC
         6cWQ==
X-Forwarded-Encrypted: i=1; AFNElJ9D5EQNc7PFkvAPfaFkxyep4ivuZUfKGsqD3MCMSW+fxOO12Sn3ZeJjVn+3KjYZ45hDB5pfPMQehCI6cTTgrs2O@lists.infradead.org
X-Gm-Message-State: AOJu0YyunaBXHo3y85V2dE8go3m6+OuenG4vIyGJQ8mqQDGY8d/TC/gD
	2j97oB0Bh/SsRHuRsu31u8sctPUPu8I0ddKocFcP66MNENU0CADCUlQGS0iEGSNDAw36ptfMiGq
	1AjaHs4exMLOLSNpv+f3XQmB4uhGWfT8uzzsTAC1u
X-Gm-Gg: Acq92OHxr3lxmt1Eh/7JL7sNQ1QdMdqnZ9rFDtwwjRO2aHKGrGOhnGjxZslRW/8Klea
	ofqlmUyrmvPdv/VyKmUHA/Ex7xbY6Eyvb0/QSnnnrpMx1/lIUbEZCqsEpssa5xHcyAASw/S5hGr
	pVG3SlnHlQyDWSKnn1MhDGCYGh8zoNjWVSZnKq1EaLUwFPnRVKhdSsFwUdLBQIImhaCznQg1a66
	wXwBakkvXc3gJ62MPNh9uSle/gnoSHLSF4ARmUr/l3RmRJ3/8kOQhL9qnUy7fYQxfOqYLHh18ej
	wu/t2b7Cwtse6oa5xe2+0glU626zTQ==
X-Received: by 2002:a17:903:1a8b:b0:2bd:3c1b:3073 with SMTP id
 d9443c01a7336-2bd3c1b31c2mr972875ad.16.1778676952003; Wed, 13 May 2026
 05:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260410-james-spe-discard-warning-v1-1-985c02756ee4@linaro.org> <20260513102024.GE34802@e132581.arm.com>
In-Reply-To: <20260513102024.GE34802@e132581.arm.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 13 May 2026 05:55:40 -0700
X-Gm-Features: AVHnY4InNk-bInjoavdvMv1aeYxqzotXH5pd7IbLWmqSVKfM-woL6gSaSwwZyiA
Message-ID: <CAP-5=fUoebOVhWvTbgkyY6erZJjbLRbRVk6oauVKjtHGGgMyaQ@mail.gmail.com>
Subject: Re: [PATCH] perf arm-spe: Don't warn about the discard bit if it
 doesn't exist
To: Leo Yan <leo.yan@arm.com>
Cc: James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_055553_713209_9F4CE45C 
X-CRM114-Status: GOOD (  20.90  )
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

On Wed, May 13, 2026 at 3:20=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> On Fri, Apr 10, 2026 at 12:05:12PM +0100, James Clark wrote:
> > Opening an SPE event shows a warning that doesn't concern the user:
> >
> >   $ perf record -e arm_spe
> >   Unknown/empty format name: discard
> >
> > Perf only wants to know if the discard bit is set for configuring the
> > event, not in response to anything the user has done. Fix it by adding
> > another helper that returns if a config bit exists without warning.
> >
> > We should probably keep the warning in evsel__get_config_val() to avoid
> > having every caller having to do it, and most format bits should never
> > be missing.
> >
> > Add a test for the new helper. Rename the parent test function to be
> > more generic rather than adding a new one as it requires a lot of
> > boilerplate.
> >
> > Signed-off-by: James Clark <james.clark@linaro.org>
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

