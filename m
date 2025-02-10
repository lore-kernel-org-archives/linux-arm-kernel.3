Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83097C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 18:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/96u3NNUqcuJXiA7GkTj1P26oKp/ehSs1cHwi+YUpQ=; b=puLCCYDoV7oGLMNdZrBbjtpuAs
	Ltr1Q3AgSk29Q03gOCSY2hV7+/tAAuaGlO4npIFJrfIo3G4GXaTcCc8tQMTl3GKBoxAgXTKzlY5c4
	TpDiaEucm2XVpxGJaikiNmyLy3Dg2YdBIlg+gneI18tOCNixc5ZdGFPn9F60w++0k8KOQnkqs61zp
	ZwcfLLH7BIDvFtglggqWz6ltceenqltVsB9F69EKXme7WGw1gzvogABs+nFZ6jzP39UDHe/rGJ5uX
	w2+YfZPPfx8c0JRvzfJBjGW0rG4Sx2NTVqiLg01iflgDOb0EP6phVNLpUWvztHjnWetnMoxkvqt9x
	rkisapDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thYL8-00000000slc-1ATC;
	Mon, 10 Feb 2025 18:17:02 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYJj-00000000sT8-2ULI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:15:36 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3d146357fb2so2825ab.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 10:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739211334; x=1739816134; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/96u3NNUqcuJXiA7GkTj1P26oKp/ehSs1cHwi+YUpQ=;
        b=W8TxgXiy+mU818wluEWba4TCc4Qcv8ZAOQ1YpLRz6nXzf1m7khezwPVqlWlqKjxIoR
         TQrwv38Ygs7fFI7/a4jE1/g5EXjMoYevQvtpd0S/Gk5CdDSrqtgvkeelppox5WHTyIR0
         PChiaA5EzzSBprAngZnxsqVvWwO+0TvVPJFhvDiVkg/JxdKwfV6PaAD/hxOrQ0nLFADB
         OTikEPkuk/eROgaqB1npCQunzwlPZpo2+wz19jEtYwUmkrRisngpyjL/2M0eWFmuJWng
         64lHU1AmIKZph7K2yX0yvXWMVieQzpWbWXNIsiupk7MqsxeKk7NBd3Hp6qMH2RMqhNXS
         tmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211334; x=1739816134;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/96u3NNUqcuJXiA7GkTj1P26oKp/ehSs1cHwi+YUpQ=;
        b=xJsFUG20yXx9XPRsPxqfImA+1onFmiBwVlIKW6kjO19X0Rj7tQHemnAvsxb/+4twO1
         0Qyg1c305hzn7xc9LHVXUME/Gx1lFB9PRcVjmBlL2MgSTAiDhQvvn9ywz/Pb71ahw+CY
         I1U/FEYpt47m+YIWhQIp5moDva4o8BP62CuVVICyM0Ws34SskWIy7lQ1BxhEM7zNLH/e
         M02ZDVPs87hAahhEnz9yDCwtBL3RtOjn71qwDAMnEhCK46Q1bA5v2bkNymcTnv4mG1gv
         0FFoQbNChMADu11P+PoXU9aCMFckAzifdqY1/T/hQl7xjzQ1r7uXlFwqoSGPqpfZXcdC
         E9vg==
X-Forwarded-Encrypted: i=1; AJvYcCXxV0ugDRB22SD4rAlHtXwg8kspEAQHSA3KF5ei1akUpFiJyvYLfAC4KSU+9xrQ0DUelEqTwNrpnnPtCUZT+p02@lists.infradead.org
X-Gm-Message-State: AOJu0Yxuvn3wBMRjx57fJfE77aj87lPFAeH1ywOuJPA6jK0tcNkqgfFM
	JMnFf2GEzNqwUGZYUUL8WMK3JKoGJHLexxHKjsD6+5hozQrAKAg+6MKDl8wVoYc087MBweBzP6U
	y1uEw82+jVo+HjQlTOqxWUVwJt1ll9vslIzG0
X-Gm-Gg: ASbGncs2alNplKxZkY8Il9jf4We7uoVT+K0cCJK7SIQy87mqx6K+pyFEVpLHukEcrkm
	SwohffeJMMLYKhnKhTsvWnwBu+fIO96xMN+NHjEqF3WTAFchLammX9gaB1WMJp+cHpUh1sNGm0a
	Me3zlWcu4d4yF4O5Nc7H8ozrcz
X-Google-Smtp-Source: AGHT+IFqTvA0kT0d8/s2/LY0/DyAghSw5k4WybfSH3hPb2dd+fkXBPi3nvvKEIQesGbSUsmWCmzVLcTwx/r2AwSYTGI=
X-Received: by 2002:a05:6e02:12ea:b0:3a7:dcc1:9936 with SMTP id
 e9e14a558f8ab-3d14f0f576amr7064045ab.23.1739211333209; Mon, 10 Feb 2025
 10:15:33 -0800 (PST)
MIME-Version: 1.0
References: <20250113194345.1537821-1-irogers@google.com>
In-Reply-To: <20250113194345.1537821-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 10 Feb 2025 10:15:22 -0800
X-Gm-Features: AWEUYZn7d4ZEktR9aWJ_xgpCMfHw12KnOcZgrjIapk5zbV_Lb74ntXY_p46rN_Y
Message-ID: <CAP-5=fVoQRhd-8jyXfjc2dCuwt7_o1sU208aADT1FriwCNa9qw@mail.gmail.com>
Subject: Re: [PATCH v1] perf sample: Make user_regs and intr_regs optional
To: Tavian Barnes <tavianator@tavianator.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Charlie Jenkins <charlie@rivosinc.com>, Andi Kleen <ak@linux.intel.com>, 
	Veronika Molnarova <vmolnaro@redhat.com>, Michael Petlan <mpetlan@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	coresight@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_101535_628259_DE4D2EC4 
X-CRM114-Status: GOOD (  14.83  )
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

On Mon, Jan 13, 2025 at 11:43=E2=80=AFAM Ian Rogers <irogers@google.com> wr=
ote:
>
> The struct dump_regs contains 512 bytes of cache_regs, meaning the two
> values in perf_sample contribute 1088 bytes of its total 1384 bytes
> size. Initializing this much memory has a cost reported by Tavian
> Barnes <tavianator@tavianator.com> as about 2.5% when running `perf
> script --itrace=3Di0`:
> https://lore.kernel.org/lkml/d841b97b3ad2ca8bcab07e4293375fb7c32dfce7.173=
6618095.git.tavianator@tavianator.com/
>
> Adrian Hunter <adrian.hunter@intel.com> replied that the zero
> initialization was necessary and couldn't simply be removed.
>
> This patch aims to strike a middle ground of still zeroing the
> perf_sample, but removing 79% of its size by make user_regs and
> intr_regs optional pointers to zalloc-ed memory. To support the
> allocation accessors are created for user_regs and intr_regs. To
> support correct cleanup perf_sample__init and perf_sample__exit
> functions are created and added throughout the code base.

Ping. Given the memory savings and performance wins it would be nice
to see this land. Andi Kleen commented on doing a reimplementation,
which is fine but out-of-scope of what I'm doing here.

Thanks,
Ian

