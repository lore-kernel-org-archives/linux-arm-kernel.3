Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2826CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 14:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FpGkbSZTH0YknQyYJZMYGzUvtXXPiBXKw7DK+s5tWTc=; b=iSapxRwaLxyxRnyVhPXGT3Tdor
	iegX69zKmGYg5W04PFOECdl7pEr4SBe/7SY4C2Oc90LnL8OJ8DK7srha+M8iRG4jAB54JjzGLFLyE
	QVWTvXKsCjbduP5LxO9mT+fVbB3TWzO7YSDp0jpvEKOmOhnmb9KbrDHny3d28l2PGsw76w2wS48rn
	gNKL3V0Y9Vsn6pmcV992ITnSq/rO6bNq0A5ophXjeXJEmIDgPSR7kt7eDhxL1bKD57F3F03OChfKr
	GGTe4PoDOBNet4QYKVMF/ILzWEyxuVRKI802B45oTzwHQ8D2gxuV01QN92VYBkZYTWspbAsoSqb3d
	gTj0x/ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYkv-0000000HCnK-08zF;
	Thu, 14 Aug 2025 14:16:37 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umV9F-0000000Ga8p-4BGA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 10:25:32 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-32326e71c31so756039a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 03:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755167129; x=1755771929; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FpGkbSZTH0YknQyYJZMYGzUvtXXPiBXKw7DK+s5tWTc=;
        b=CbJ6wQ1kXy9RJ6rwe1UOxiJYrMGPARiGZz5FFiWStz/iFRT7txy9CejHJxNCtg68u/
         8gXMVM1magKmf9YJ85vHtsHjJ7+SxttPdf9q37UgZ539n69X+CyfoOe1xcSD6USG5wIK
         RqcqUnz1FfClzih9lSR4y0NqFV4EsPwv+mF5sLVYOon49a+PK3C+OLIKXB9ixgrjfElz
         yZS8W+MtLxdJgqGDfZb0varMJfNN0xwTCIj5sUTpla2DQV+WtKs2PUUPsosKw499joC5
         1CQc0pO0DYchgQm9yX847qoILCLlMgX4EDEaNP3GF916Lf6ar3KMCpVDlqKo6oirwLOP
         R1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755167129; x=1755771929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpGkbSZTH0YknQyYJZMYGzUvtXXPiBXKw7DK+s5tWTc=;
        b=m4vZJatc+yhoJaVCLzaHfHlCZQMl5/GRBiz0NhHlJLLVrU+x4ndSNZmLX8HTCmRvWw
         a2rhAhKoCq9hbwRMBkVdRIXcxID+n6dphCLpkzMcI783uz7HEQNbisQyd9PSA5X+8AXy
         Dg4uoyJQ6a0gaDql0x5ox+Xl/7bIwL0943ZJNk/61H1Nwa9hZbaKk/a3ayMTYWvDbiqK
         eI5ou+pzkjnW1ly03j1o1FeKqwy1Z9dRpQOIvOM9ts9uIFDYv2GQCLK03RRCCNaJaIcF
         m7VwsY9tpsX2k2jy1wcsqOTjIKCBJxQJYuyKRjRGbnCU0dDGhOmnMau12v8OrmzIRV64
         e3yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWevhM+nxB/FWb2sXpNN0ZQWEOvuLRhhNUxIk8At2RIMg2PTQMZf9aPVoOcHGljEqOSnxMNcGp/Lvo4Z0rdMgmw@lists.infradead.org
X-Gm-Message-State: AOJu0YyKzVAyrQI7eA74/4Er5FWvRM2ZeK0bvwd/DfZpZuBf/ZEWzDz0
	25nsyBW/AF+Y+IUQNQhaWbphmYK01wS4BVU7n2u5+cI3Q0NqQ3gX4n87H6qPJfuAJHCBAkt5vZG
	uCoACLKyN1LDX1s3MrdvGPMERcDja3A73utCJjHzN2w==
X-Gm-Gg: ASbGncsXANszC9opoZF5FeAFRYVwSS5o+VWAWJgrizwiez6Gt7lfTj4MORCpa3CLm8Z
	g2nqr5E/1+fe76tGOR6obnPA6b1H+Cp77x3HhEUMuuVajmzfoCrLopSNWsvYhcM4e7yXC3pVflX
	WRnV97Zuen7WVJLyOjGWrMCbXhw9+2bcbwFAo+ZqEx7ZKftZaCZcSC1A4KPGaF4mSAoubq5VJGn
	ec+GPqs
X-Google-Smtp-Source: AGHT+IGz30+Hy3gFiTg1KnKcd85era+jIMkvNCETz576JOwHJ8XIWA/KFX2Wu3mbC41FRqHMX/pJpTpFJUrAJtDL5aM=
X-Received: by 2002:a17:90a:d888:b0:323:284a:5c3f with SMTP id
 98e67ed59e1d1-323284a5ce1mr4106502a91.8.1755167129058; Thu, 14 Aug 2025
 03:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250812-trcextinselr_issue-v2-1-e6eb121dfcf4@oss.qualcomm.com> <272077d5-12b1-4922-b924-a96c34b3b1c9@linaro.org>
In-Reply-To: <272077d5-12b1-4922-b924-a96c34b3b1c9@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 14 Aug 2025 11:25:17 +0100
X-Gm-Features: Ac12FXxwDyviVwWfUtpF9l-HP2Uc7nKXb1Mzv3kyYVuoGcSStUR2CgS_3D4d4W4
Message-ID: <CAJ9a7Vif9__iXasPWi0uUhXNJ63xQBtBksT17MvQ-+rDMVxuAQ@mail.gmail.com>
Subject: Re: [PATCH v2] coresight-etm4x: Conditionally access register TRCEXTINSELR
To: James Clark <james.clark@linaro.org>
Cc: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, kernel@oss.qualcomm.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_032530_107567_DD27B421 
X-CRM114-Status: GOOD (  24.29  )
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

On Thu, 14 Aug 2025 at 10:51, James Clark <james.clark@linaro.org> wrote:
>
>
>
> On 12/08/2025 9:24 am, Yuanfang Zhang wrote:
> > The TRCEXTINSELR is only implemented if TRCIDR5.NUMEXTINSEL > 0.
> > To avoid invalid accesses, introduce a check on numextinsel
> > (derived from TRCIDR5[11:9]) before reading or writing to this register.
> >
> > Fixes: f5bd523690d2 ("coresight: etm4x: Convert all register accesses")
>
> This tag isn't right. Although this is where the register accesses were
> last touched, the root issue was present from the introduction of the
> driver.
>

Memory mapped access to unimplemented registers are RES0 so won't fail
- the issue is the system register access where an undefined exception
can be triggered.

Mike

> > Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Add fixes tag.
> > - Replace "if (drvdata->nrseqstate)" with "if (drvdata->numextinsel)"
> > - Link to v1: https://lore.kernel.org/r/20250811-trcextinselr_issue-v1-1-ed78f3215502@oss.qualcomm.com
> > ---
> >   drivers/hwtracing/coresight/coresight-etm4x-core.c | 11 ++++++++---
> >   drivers/hwtracing/coresight/coresight-etm4x.h      |  2 ++
> >   2 files changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > index 42e5d37403addc6ec81f2e3184522d67d1677c04..4e411427303981104d11720d3c73af91030f8df3 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -528,7 +528,8 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
> >               etm4x_relaxed_write32(csa, config->seq_rst, TRCSEQRSTEVR);
> >               etm4x_relaxed_write32(csa, config->seq_state, TRCSEQSTR);
> >       }
> > -     etm4x_relaxed_write32(csa, config->ext_inp, TRCEXTINSELR);
> > +     if (drvdata->numextinsel)
> > +             etm4x_relaxed_write32(csa, config->ext_inp, TRCEXTINSELR);
> >       for (i = 0; i < drvdata->nr_cntr; i++) {
> >               etm4x_relaxed_write32(csa, config->cntrldvr[i], TRCCNTRLDVRn(i));
> >               etm4x_relaxed_write32(csa, config->cntr_ctrl[i], TRCCNTCTLRn(i));
> > @@ -1423,6 +1424,7 @@ static void etm4_init_arch_data(void *info)
> >       etmidr5 = etm4x_relaxed_read32(csa, TRCIDR5);
> >       /* NUMEXTIN, bits[8:0] number of external inputs implemented */
> >       drvdata->nr_ext_inp = FIELD_GET(TRCIDR5_NUMEXTIN_MASK, etmidr5);
> > +     drvdata->numextinsel = FIELD_GET(TRCIDR5_NUMEXTINSEL_MASK, etmidr5);
> >       /* TRACEIDSIZE, bits[21:16] indicates the trace ID width */
> >       drvdata->trcid_size = FIELD_GET(TRCIDR5_TRACEIDSIZE_MASK, etmidr5);
> >       /* ATBTRIG, bit[22] implementation can support ATB triggers? */
> > @@ -1852,7 +1854,9 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
> >               state->trcseqrstevr = etm4x_read32(csa, TRCSEQRSTEVR);
> >               state->trcseqstr = etm4x_read32(csa, TRCSEQSTR);
> >       }
> > -     state->trcextinselr = etm4x_read32(csa, TRCEXTINSELR);
> > +
> > +     if (drvdata->numextinsel)
> > +             state->trcextinselr = etm4x_read32(csa, TRCEXTINSELR);
> >
> >       for (i = 0; i < drvdata->nr_cntr; i++) {
> >               state->trccntrldvr[i] = etm4x_read32(csa, TRCCNTRLDVRn(i));
> > @@ -1984,7 +1988,8 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
> >               etm4x_relaxed_write32(csa, state->trcseqrstevr, TRCSEQRSTEVR);
> >               etm4x_relaxed_write32(csa, state->trcseqstr, TRCSEQSTR);
> >       }
> > -     etm4x_relaxed_write32(csa, state->trcextinselr, TRCEXTINSELR);
> > +     if (drvdata->numextinsel)
> > +             etm4x_relaxed_write32(csa, state->trcextinselr, TRCEXTINSELR);
> >
> >       for (i = 0; i < drvdata->nr_cntr; i++) {
> >               etm4x_relaxed_write32(csa, state->trccntrldvr[i], TRCCNTRLDVRn(i));
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> > index ac649515054d905fa365203bd35f1d839b03292f..823914fefa90a36a328b652b0dc3828b9bddd990 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> > @@ -162,6 +162,7 @@
> >   #define TRCIDR4_NUMVMIDC_MASK                       GENMASK(31, 28)
> >
> >   #define TRCIDR5_NUMEXTIN_MASK                       GENMASK(8, 0)
> > +#define TRCIDR5_NUMEXTINSEL_MASK               GENMASK(11, 9)
> >   #define TRCIDR5_TRACEIDSIZE_MASK            GENMASK(21, 16)
> >   #define TRCIDR5_ATBTRIG                             BIT(22)
> >   #define TRCIDR5_LPOVERRIDE                  BIT(23)
> > @@ -999,6 +1000,7 @@ struct etmv4_drvdata {
> >       u8                              nr_cntr;
> >       u8                              nr_ext_inp;
> >       u8                              numcidc;
> > +     u8                              numextinsel;
> >       u8                              numvmidc;
> >       u8                              nrseqstate;
> >       u8                              nr_event;
> >
> > ---
> > base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> > change-id: 20250811-trcextinselr_issue-f267afa0e5ed
> >
> > Best regards,
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

