Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405FFC36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 10:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aocl7KwbvNUkzCO2WrWHJhkuKprouF8zjARuTRimIwc=; b=1Xi830LwpEEbDcgKLJwoOK4Cdi
	qUxdjtT5lmwZ4zBAq3rh7qQ4Nal4CxYMGthe6x72/q54rPW8ZopY4cgz22d0fKG8wVG2CXZIw5UYu
	6XqmvfIm5rO5HZbVGoTxBuu6/1LSVSbHC8IdUcNY7bOovRVFNzn7EC4mrHYbK+6uN1YsTOF2Gqzc9
	MZytLZ2LCglUKh4dZO8EPvmfM1IYQJaF9OcwB/2g4NOt3K+9LNdrqUChTND9Lws6T7lCTlxSsVEZK
	9gGqtvXQLAYwbLF7sf+NLJPEcS/kXnIp3/yrwKkX8YCRWrCOhYnEcbN9IknBmXSb2oQ8/kvskYY9d
	b8kKXfiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYgN-00000002beg-0e51;
	Tue, 01 Apr 2025 10:17:23 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYMM-00000002XYw-1BYq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 09:56:43 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2240b4de12bso81264915ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 02:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743501401; x=1744106201; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aocl7KwbvNUkzCO2WrWHJhkuKprouF8zjARuTRimIwc=;
        b=hbbt/2lKRecgwSBwj/cm8GanRI6a/9jQdPs4rrEbIhrShSZxZ9MYenWLEyOYj2NBmG
         mtydBeot9679uuzhEdLZzJk7Aqb1b9Ev/5YFpda64OyatLgyiDBDHmn3atZrFfk39x5r
         p97WahD7ZahSedGAFAluh3mYf2Vcplaumz1G1Uxi2pknZI3zFcESPjKSF/xJzcGKPfQr
         AHHxTun9IoYDR2K/J2j0WTI16+G2u50wz22+RS1BmX7t+l9Ixy/PkvQyy1N/pBgZ4tWa
         1g800dQWd6AVWWHhNwFzeFHFsBbeb49AAAABEfjXgqTQbh6AQ4Mio9cOWMhfgpcB1V71
         M/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743501401; x=1744106201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aocl7KwbvNUkzCO2WrWHJhkuKprouF8zjARuTRimIwc=;
        b=sBqvoUkY0nUciurXWQQgHFNxfCCFg4IcpT/Uq7v78HMKfrdn46iCFU99T0JxQ+xkW1
         SMxvIswiRYh0RYe92FHtFX4zsZSWW/b2ORSkJ7SqVnzYZm0CLX/qy/sybZNWLTd3Syn2
         aOUNi1ETx/1skZxOrb0ZZiwKvm4y/EweKj+9FurgQYoI9JMnlumpc8vJv2jV4llB5GEN
         +b00blho5hcvoJfBN/v2AKSDcid/n5Q16hL57aCYbfQ4Kggp5+KkKTGEzNZ+BhxS5wzr
         3kjaM9RnNoeBgOChlebGrvyR8+4MK4SV4CQLs24AwpOJ0Rq+IHi+Cyn39eVd2c6/g6nZ
         OI2A==
X-Forwarded-Encrypted: i=1; AJvYcCUb3ndRTx1krkvwXQImA99aGFO60Zh8bLZq1HgNpHii6TZb0+RUTo7qzHI2SdsNe50vi7jyk2xXlJeKOPRSIdAt@lists.infradead.org
X-Gm-Message-State: AOJu0YwJfYr5h1rOtDv6ggE0H+j3WmI0f/K/oTzt16IcUZtEFhooLQp7
	86lIS9cNMD20pv/zIG/N/2bS/GLifE6xD9kuvC8ViP5tzuRX8Wpim4TShlpUJ2lyEML7b6DAkdA
	nAriwMKJRMDklEho1bIICZllcFU923ePor6YQ+g==
X-Gm-Gg: ASbGncv4taU/IIgGbm2mTnQ+JqA09bbBI+w2s7V3igGvhSlGeNxN/1tLt2j+r1YGrW4
	PhP8rmmP3qhVwZMdLkR+wyH4SMZBRqdOrv6bn6TA47rC2mZant0ToAEelW8T91WFUYmdIZEtuWW
	YpWk0Huc+d5DmzamR5lpg2fkVPztWRc5tP9h3+nw==
X-Google-Smtp-Source: AGHT+IHEMnnnmcPGt6SPwgUcHIAgu4byClDUyMF2Ro6APnhVIeAiXBrYYkjDBhhJ0hxiN2KwSVdg1cBseMLltQ3nC1A=
X-Received: by 2002:a05:6a00:b49:b0:737:e73:f64b with SMTP id
 d2e1a72fcca58-73980339eb8mr15251487b3a.1.1743501401272; Tue, 01 Apr 2025
 02:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250401014210.2576993-1-jie.gan@oss.qualcomm.com> <470e4a90-41c3-4974-a4d7-3073a7fcc737@arm.com>
In-Reply-To: <470e4a90-41c3-4974-a4d7-3073a7fcc737@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 1 Apr 2025 10:56:30 +0100
X-Gm-Features: AQ5f1Jou6RuMhYg-mjMPT8QE1MQ92d3liRY4RQMc92_C5x1ac1ut41GmRyDV0w0
Message-ID: <CAJ9a7VinQSx9FYvw4ww0KQgMqapLhWTaU9D2qcc-120YywUu2Q@mail.gmail.com>
Subject: Re: [PATCH] coresight: fix the wrong type of the trace_id in coresight_path
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@linaro.org>, Jie Gan <quic_jiegan@quicinc.com>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Jinlong Mao <quic_jinlmao@quicinc.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_025642_345859_88474948 
X-CRM114-Status: GOOD (  22.38  )
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

Hi,

On Tue, 1 Apr 2025 at 07:11, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> On 4/1/25 07:12, Jie Gan wrote:
> > The trace_id in coresight_path may contain an error number which means a
> > negative integer, but the current type of the trace_id is u8. Change the
> > type to int to fix it.
> >
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Fixes: 3c03c49b2fa5 ("Coresight: Introduce a new struct coresight_path")
> > Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>
> LGTM
>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
>
> > ---
> >  include/linux/coresight.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> > index d79a242b271d..c2bf10c43e7c 100644
> > --- a/include/linux/coresight.h
> > +++ b/include/linux/coresight.h
> > @@ -337,7 +337,7 @@ static struct coresight_dev_list (var) = {                                \
> >   */
> >  struct coresight_path {
> >       struct list_head        path_list;
> > -     u8                      trace_id;
> > +     int                     trace_id;
> >  };
> >
> >  enum cs_mode {

There are many places in the Coresight drivers that assign a u8
traceid from the path trace ID.

e.g.
In coresight-etm4x-core.c : etm4_enable_perf()

drvdata->trcid = path->trace_id;

drvdata->trcid is defined as a u8  - the reason being trace IDs are
128 bits wide with some reserved values.

Will this not just trigger the same issue if path->trace_id is changed
to an int? Even if not it is inconsistent handling of the trace ID
values.

Trace ID errors should be handled by returning an invalid trace ID
value - were the trace ID value will fail the macro
IS_VALID_CS_TRACE_ID(), or separate the return of a trace ID from an
error return in a function.

Regards

Mike



--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

