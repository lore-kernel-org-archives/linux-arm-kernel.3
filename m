Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324CCD6A226
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 18:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPgttRKqIwbel5Escl1oq0suAUqJ6hGmn2l42WFD7Wk=; b=WTAgFZ6ip+56GDNmd7uKty9ARE
	gidnPTe3ADUQrZW4mu6yOV23J1r23EYbDgA8ErnVNa5I8b6VmWHsc9QH8m/JS5vx8X1GV5ORiVl/e
	qxKsmAjAE1jpW/aPJoALSVNO9w4aHBnM1QtXSxECFnyhMxJX/upv3jlD1oLbpgtTpMROnuig4XyDM
	KzGtjTOibxT2rQNBVcEb+hsqhhoC/iOUhWOFi9kQXHIPVe+rbR9Xs1kQ8wsfPmSONNKXhjYPKkadQ
	D4D6t8oLcxCwnDutpoTKDD925LoMh5ZLgAxzDN5NT03zJBrRvsDnCcEQK/m4L7PCTyKVJnbBXxCdP
	Mrki1W2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBedd-00000000Ubw-3PHX;
	Thu, 14 Nov 2024 18:32:17 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBecf-00000000UNe-2YHq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 18:31:18 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3a71ef98bc4so7745ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 10:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731609075; x=1732213875; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPgttRKqIwbel5Escl1oq0suAUqJ6hGmn2l42WFD7Wk=;
        b=G+S11FxEz6VR8n7TvTn9KNUV/XsYXMTF7F0KT2PFF8MPwSTYkTLFgx/q3bCrnrk7a5
         RJDHQDSCkHTrNTh+4ZgFMxkRxh5+CNm7PDVxyjxn5bZAbOURQUQb7qAnuQlVrOzq7flf
         DOvd4u4YKsYGkgkfvTfRhn97C6Mn4TblZrmTDddQf/7y0xknIwpKnwZj2fL8hibQAm74
         kGiaqRnwbBpoUU6lIN3CZ4FfgQTJexTNSbKyqfq7pZWA08Veev5ZcbrZVaYFJ83cHfHU
         hxDkbYIMNb89a6XviZCi9VxAc9eF2Ai6GH8yqo3fB+WmmIVHi7P6p7idQ7pDV3twGMKD
         Q8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731609075; x=1732213875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPgttRKqIwbel5Escl1oq0suAUqJ6hGmn2l42WFD7Wk=;
        b=MzwQ5YP9dAPO5ZE1WbtRV+OkIQjVweXlEklajx09bvBqMldSLU/ytdO3xZMkS5zWg0
         SYgCH8qMMmL+vRRgPlnFnmkYI+KlzI1taODJVzzet0yK0oUeaWNe5/0v0x1LsQ00UceS
         nhHqmI7dhvU83SNsINCFQPy1OQ/2rVuXl9MnCSDg++KRr3rwalux4RSusZvfJb06EjY2
         3a5HeBD291ZhCU/bZXQwnMWHlvSiL2b4GBVwZxyJk1vySswJ841YIJ8XWabUxneGrKZ3
         6mVnaq86RyRVZoxErOjpmsoj2ZAgetiBzhDNvJt91ni5YfOO5XbbZfU9gZv1o2l6PdP3
         gN3g==
X-Forwarded-Encrypted: i=1; AJvYcCWaDpOCNXP/dYSgUTfrCB0RGkxSL/U5cp62UvKI1aKDMdKEfoeOWV6M+npWChsmCBwkfk0WNWYEvqZLfRdgt7ux@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv+HjHKV36aO+JMmYxlooQWoPmZFq+umz1RkpmUagB+on6ZprX
	bH9QZEFCRVxSAvkltqIrTMDFsz5yPVVR3f6hDaZG1Dr4Rb6AzsH7Fnrqc4xlBWEGzfK/Rah0NlQ
	p96+zXtvg8VHAwFj23YatWduIizJxhiyOf4Dy
X-Gm-Gg: ASbGncuWEOLITc3TaZnwOMImIRrHc0jLVDFk/O/W57EsBDZx2kGoL1ijhOOa9MetmhG
	OJAk8dAAipPEeoOzATeAl8SmgzfB+i10ZV+0mKpxs/dbufwFsg8eBHRLhTNqXSuU=
X-Google-Smtp-Source: AGHT+IHbt2clAsvEm2GCWE3HZL8c9XYanWoYZmP6qTNs/eamsLOQaZgatLIMPvRuQ3+hmYVnmRaUTEoaA8PTfGw6NT4=
X-Received: by 2002:a05:6e02:1a4e:b0:3a6:af68:668a with SMTP id
 e9e14a558f8ab-3a71e7a2d67mr5483705ab.18.1731609075190; Thu, 14 Nov 2024
 10:31:15 -0800 (PST)
MIME-Version: 1.0
References: <20241107162035.52206-1-irogers@google.com> <20241108025535.wfhke3btch5af4fu@hippo>
In-Reply-To: <20241108025535.wfhke3btch5af4fu@hippo>
From: Ian Rogers <irogers@google.com>
Date: Thu, 14 Nov 2024 10:31:04 -0800
Message-ID: <CAP-5=fW=RXz-A=xndhs8wkXaKCz-qXB=PemAMvbZpUagvObUoA@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Refactor cpuid and metric table lookup code
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, 
	Bibo Mao <maobibo@loongson.cn>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Ben Zong-You Xie <ben717@andestech.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Sandipan Das <sandipan.das@amd.com>, Benjamin Gray <bgray@linux.ibm.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Dima Kogan <dima@secretsauce.net>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_103117_648731_3069FFAD 
X-CRM114-Status: GOOD (  14.79  )
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

On Thu, Nov 7, 2024 at 6:57=E2=80=AFPM Xu Yang <xu.yang_2@nxp.com> wrote:
>
> On Thu, Nov 07, 2024 at 08:20:27AM -0800, Ian Rogers wrote:
> > Xu Yang <xu.yang_2@nxp.com> reported issues with the system metric
> > lookup:
> > https://lore.kernel.org/linux-perf-users/20241106085441.3945502-1-xu.ya=
ng_2@nxp.com/
> > These patches remove a lot of the logic relating CPUIDs to PMUs so
> > that the PMU isn't part of the question when finding a metric table.
> > For time reasons, it doesn't go as far as allowing system metrics
> > without a metric table as a metric table is needed for metrics to
> > refer to other metrics, and the refactoring of that resolution is a
> > hassle.
>
> For this patchset:
> Tested-by: Xu Yang <xu.yang_2@nxp.com>

Ping. Would be nice for this to land given the ARM fix and general cleanup.

Thanks,
Ian

