Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48113C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIu1t/2657EaB+VrCIFp6sfHSKgjEaSX/eWEjXMGplk=; b=XcGJFOTS5sZXTY4G3BCAQhFAjV
	35zoDbBZ2FTySx8NU9V4O8Zet9d8HjIEM4leJeifnmGPZVMpAFZ7PxsJ7T8AFfIp9FCXrRVMv+vPE
	FLJ+5g6frU/RnCCSFV+Qj5dxwFWqODnrMWMAz7vuE4YBGcuX+HMBBgWRXNjpPycfpKgJhKXgPV3Cr
	c+t//1MzG4dJsIMLKVRxUVxE4Ecny9Ktc1GyZsOPfKa75+Hd2NQ0MWdAj9S0yF2dhdKnzaCZXG+wf
	gBzFfROOYa3U98ghg2K4WmTEn6G9O6ZBZX0T5dT9G7VVTp5RmN1dinhqTtq8eWC6SlINQHcecvkOr
	45ZhJ7jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kXB-00000008dla-1wx4;
	Wed, 16 Sep 2026 07:58:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kXA-00000008dlJ-19Fm
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 07:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uIu1t/2657EaB+VrCIFp6sfHSKgjEaSX/eWEjXMGplk=; b=CmB5Tf27EXfU6z17NqVGpGTJ5v
	me9wNxj3Lms0cqJXrwshTH8f1o9itauF8tmmreU1W9ait7BIqsTaXAOJo5ApKTc2zL+s3i9omAQ9f
	KWermHuc14oHCk7iQ9bq9O/HA9E+HMLEnuokLPl+xjnaYGsevJP8YS+sTmrDBxN3j3mJhLPenS+a7
	YouYROAjn7xM8Z3o7YyFhN6id8SGtS9B33coZQjkpU4JNCru/u22bzLQ/Moz4J29AJawoLyDU7hIj
	RnXogN2dg/NaaHQHVp/FtDOhAXYFs/B7/jNYCA+SRoZK2S3oXflG6XDPE7MO9jqLlMA2yEEVoDB42
	nF1oOJXg==;
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6kX7-00000007bSq-0Ggu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:58:23 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-90cdfbd3208so5953156d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 00:58:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789545497; cv=none;
        d=google.com; s=arc-20260327;
        b=ARCgYpAekxCl8ddqK79lOEriKhNK6//eelMFnVLaypqeQKvI+EYpD7RIezXoRT6bsN
         uRdJ+FW4LVu87M6i4jvCSNPxsoRobcDJO8SSXZSUVp49/Gx+8qRZF+NmW2ov+l4Cn4hU
         DdQPqKm1TY+J+uNPdGysoW70xs7eHYPBpRGBLT1ECYVCgPti8RpS4J7xg9wjsjqxjt0Z
         SGzR6ByCyxuiI+ypp9cQP1de8uwlkU+BHAbhWQIdb4/vRWxHUeX1hGvMFSDnQcRCEg/h
         goL+aTqjiWnnMqQsHcDvIX3Id0XaLHpr1kqWAe33f7BafzRBi4HTqBXQodUXrYf8S30i
         jLGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uIu1t/2657EaB+VrCIFp6sfHSKgjEaSX/eWEjXMGplk=;
        fh=92tyJIde4VNl/giPbSFpjaYfY0uRTBpmT7MFgXpS4xY=;
        b=PttKgPolsSp5vlPJmylYAQ2RtQKt4TZaM1U0IMQNbGa75mZP528thVfG0KrTgByNJY
         C7Jqp96fXm7kS9jIp+asvoya5/0BYWkHMECugd3CSUB1JWTZKDrva50671fbq1CnBD1U
         3tlh+4/FpaVtjq+Jbd/MSKZLNOvjp5bnmZ8TlrF1O6JTfGXvWKxT4eds+zBiZupOe0Tr
         q01vFipl4A4EwczVl3sNSWNBmsjji+lB/lUZjkYQji549PfrJZIFqzoEJ60zvafVyX2W
         XbUJRRFrvMuZdBl6AW3MMeTpIRNIDs/3iJj8w77hBGCaLNHRMmRVLRvHftqRt60ChvnI
         lPmw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789545497; x=1790150297; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uIu1t/2657EaB+VrCIFp6sfHSKgjEaSX/eWEjXMGplk=;
        b=MI55F5XsJWQzAN/hdm7gACOm5Hn0UixNZXKgtHvZhRjI2FqCT62wltXmepSxMwDpCN
         uE3lxRlZEobaF8Lz2K7AXrowAcnjKfi8DLFOBdEX7HHwHGLddmmVMtXYKxmZis/DLn6D
         VKx0tyOySvXawQLN+alH7z6uOeM83mJGCfPyV3W8h2SGgffC+qtnFOB0Yp6TDqaIvB+a
         pWzovbD6eijpz8zLwZM9/rH4gyxrPuF3sWnAqOfyC3CDQvEe0KxwtCAJWazk6mRE/x3Q
         A3cz7aaEps8B5PAsBMcTr/QzgQTHt8X9jtSu1kQmZCyN8iUv1eackUOl5kP9WJSogAvw
         9YcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545497; x=1790150297;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uIu1t/2657EaB+VrCIFp6sfHSKgjEaSX/eWEjXMGplk=;
        b=Y8vxRpKJCtklaUMKR4OKG4HpXlpVM8XtH91DLVmWQu4Z1xEdkEB2um4egvg363rPT6
         NczCj+3T2gz8KewRwtOJJg1LqOCe/CVAz6+cdRC0xxhL9DCBZTS4axY9gf7VgDFruJKq
         jdNjaBAZ7DVk/gEtLC7c8gLnusGQ3zZFxOXDXm5W7+1y93IHluoDv4eJX9r4fLM1bCoJ
         HmLs7fH5qLKtVSwrPg6iPRQE/pcFpb2m+JRKrg1kZNqyCxW2kN0aokwSRKHB8Z1Gc7XT
         PU3/b1v1QB+uf+S/m3X/fO4arVt46bzBzhZhHCUFfm93kQIiP8wvm5zQ2xsFZFcUckVw
         FtLQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/rdkTHgnEKtBDWNSpFI61R6OJIGV93x89pwPOvzpGYX2zezaPdUXViZWjl4j4g2w0s+z87wwfCLUZQnp+Ip+i@lists.infradead.org
X-Gm-Message-State: AFuF++m/fe1NM+zcJ342w/6qSp5UpqTRINCavfnZX4b6E63svfWz0Jca
	8DhQFvT/oZF2Da15NtHNgXP/og3w2weighdMt3unnNhCxaAY99t/bwCwSkix+sELMliBb9mOx0Y
	qAm27Qqo3PpYQIhfM/520wb5Qn+eS90Y=
X-Gm-Gg: AYBFou1J3gAANikASFfsFfekyqLwcW9xqiq10FGv+UFwRioxycwNy555CB2sAmklhMf
	TbPhh1VnTHlLDxIYid8hchhe6UXLoh0chzfEY630powBuRpzAmuL4v6Gq0AvevwFiPKju4EIoAA
	jp7v8eFECcq2Uwsl4rqWt1x8zsqfVn1AGyPOaKv1vy7ya9HuRaIRqP7aVrArMjjlMyb2XVo+078
	QqqcgkJoO1hEuSZVDU2idHkKqimccC0H2cAY1zM1WxyltQEdkdjtem0wCTvn8QAmUwWe9gigU7L
	8sDtzA8N0ruFZlgDImBLYD+vRbYFCLcIvxNhikF1tvBo2UYs49tR5ctApnKahF0xcw==
X-Received: by 2002:a05:6214:5012:b0:910:39f5:3747 with SMTP id
 6a1803df08f44-9123d723fbfmr31420176d6.2.1789545497533; Wed, 16 Sep 2026
 00:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260910081020.86227-2-zxyan0222@gmail.com> <20260915014931.873912-2-kuba@kernel.org>
In-Reply-To: <20260915014931.873912-2-kuba@kernel.org>
From: zhu xin <zxyan0222@gmail.com>
Date: Wed, 16 Sep 2026 15:58:05 +0800
X-Gm-Features: AcwNN1XVGxCGbHGoiSEmykI50OQOFMqMRNNP8SCOpWGmQIGcYGxB4Ix5qBxjtfk
Message-ID: <CAP7veT+QX9ytS3umMg8HOafpoYYyQz43oBwOLZ5Xmorv+JuvpA@mail.gmail.com>
Subject: Re: [PATCH net-next v5 1/2] net: stmmac: dwmac-socfpga: complete
 cross-timestamp on ATSNS
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	richardcochran@gmail.com, maxime.chevallier@bootlin.com, 
	muhammad.nazim.amirul.nazle.asmade@altera.com, rohan.g.thomas@altera.com, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_085821_557305_BFEFB989 
X-CRM114-Status: GOOD (  39.95  )
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

On Tue, Sep 15, 2026 at 9:49=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> net: stmmac: dwmac-socfpga: complete cross-timestamp on ATSNS
>
> This changes the Agilex5 smtg_crosststamp() handler so that it waits for
> the PTP_ACR_ATSFC FIFO clear to finish, then polls the ATSNS count in
> XGMAC_TIMESTAMP_STATUS instead of the transient TSIS bit in
> XGMAC_INT_STATUS.  The snapshot count used for the FIFO pop loop is now
> taken from the value the poll read back rather than from a fresh register
> read.
>
> A few questions below.
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/driv=
ers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> > index 1d7f0a57d2889..ee6f28637878a 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> > @@ -340,6 +340,18 @@ static int smtg_crosststamp(ktime_t *device, struc=
t system_counterval_t *system,
> >       /* Release the mutex */
> >       mutex_unlock(&priv->aux_ts_lock);
> >
> > +     /* Wait for the FIFO clear to complete so a stale ATSNS count fro=
m
> > +      * a previous snapshot cannot satisfy the poll below before the n=
ew
> > +      * snapshot is latched.
> > +      */
> > +     ret =3D readl_poll_timeout(ptpaddr + PTP_ACR, acr_value,
> > +                              !(acr_value & PTP_ACR_ATSFC), 10, 10000)=
;
> > +     if (ret) {
> > +             netdev_err(priv->dev, "%s: Failed to clear snapshot FIFO\=
n",
> > +                        __func__);
> > +             return ret;
> > +     }
> > +
> >       /* Trigger Internal snapshot signal. Create a rising edge by just=
 toggle
> >        * the GPO0 to low and back to high.
> >        */
> > @@ -349,9 +361,17 @@ static int smtg_crosststamp(ktime_t *device, struc=
t system_counterval_t *system,
> >       gpio_value |=3D XGMAC_GPIO_GPO0;
> >       writel(gpio_value, ioaddr + XGMAC_GPIO_STATUS);
> >
> > -     /* Poll for time sync operation done */
> > -     ret =3D readl_poll_timeout(priv->ioaddr + XGMAC_INT_STATUS, v,
> > -                              (v & XGMAC_INT_TSIS), 100, 10000);
> > +     /* Wait for the auxiliary snapshot to be latched.  TSIS is a
> > +      * transient status bit that is set by any MAC timestamp event an=
d
> > +      * cleared by reading XGMAC_TIMESTAMP_STATUS, so it is not a
> > +      * reliable completion condition.  Poll the persistent ATSNS coun=
t
> > +      * instead: it is cleared only by setting PTP_ACR_ATSFC, so
> > +      * nothing can clear it while we wait, and it reflects exactly th=
e
> > +      * snapshot latched by this trigger.
> > +      */
>
> [Severity: Low]
> Is the "cleared only by setting PTP_ACR_ATSFC" part of this comment (and
> the matching "ATSNS is cleared only when the FIFO clear bit
> (PTP_ACR_ATSFC) is set" in the commit message) accurate?
>
> ATSNS is the auxiliary snapshot FIFO fill level, and popping the FIFO
> decrements it.  get_ptptime() in stmmac_hwtstamp.c does the pop:
>
>         ns =3D readl(ptpaddr + PTP_ATNR);
>         ns +=3D (u64)readl(ptpaddr + PTP_ATSR) * NSEC_PER_SEC;
>
> That is also why both timestamp_interrupt() and the loop just below in
> smtg_crosststamp() iterate exactly num_snapshot times:
>
>         /* Repeat until the timestamps are from the FIFO last segment */
>         for (i =3D 0; i < num_snapshot; i++) {
>                 read_lock_irqsave(&priv->ptp_lock, flags);
>                 stmmac_get_ptptime(priv, ptpaddr, &ptp_time);
>
> Would it be more precise to say only that ATSNS is not cleared by reading
> XGMAC_TIMESTAMP_STATUS, rather than that nothing can clear it while the
> poll runs?
>
> > +     ret =3D readl_poll_timeout(ioaddr + XGMAC_TIMESTAMP_STATUS, v,
> > +                              FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, v)=
,
> > +                              100, 10000);
> >       if (ret) {
> >               netdev_err(priv->dev, "%s: Wait for time sync operation t=
imeout\n",
> >                          __func__);
> > @@ -364,8 +384,7 @@ static int smtg_crosststamp(ktime_t *device, struct=
 system_counterval_t *system,
> >               .use_nsecs =3D false,
> >       };
> >
> > -     num_snapshot =3D FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK,
> > -                              readl(ioaddr + XGMAC_TIMESTAMP_STATUS));
> > +     num_snapshot =3D FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, v);
> >
> >       /* Repeat until the timestamps are from the FIFO last segment */
> >       for (i =3D 0; i < num_snapshot; i++) {
>
Agreed, the wording was wrong: ATSNS is the aux snapshot FIFO level,
so popping the FIFO via get_ptptime() decrements it as well.
v6 rewords the comment and the commit message accordingly.

> [Severity: Medium]
> Can this reuse of the polled value hand a fabricated timestamp back to
> userspace?
>
> Everything from the ATSFC-clear wait through the GPO0 trigger, the ATSNS
> poll and this pop loop runs after aux_ts_lock has been dropped:
>
>         /* Release the mutex */
>         mutex_unlock(&priv->aux_ts_lock);
>
> The STMMAC_FLAG_EXT_SNAPSHOT_EN test at the top of smtg_crosststamp():
>
>         if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
>                 return -EBUSY;
>
> is done without that mutex, while stmmac_enable() in stmmac_ptp.c sets th=
e
> flag and writes PTP_ACR under it:
>
>         priv->plat->flags |=3D STMMAC_FLAG_EXT_SNAPSHOT_EN;
>
>         /* Enable External snapshot trigger */
>         acr_value |=3D PTP_ACR_ATSEN(rq->extts.index);
>         acr_value |=3D PTP_ACR_ATSFC;
>
> The PTP core does not serialize the callback either:
>
> drivers/ptp/ptp_chardev.c:ptp_ioctl() {
>         ...
>         case PTP_SYS_OFFSET_PRECISE:
>         case PTP_SYS_OFFSET_PRECISE2:
>                 return ptp_sys_offset_precise(ptp, argptr,
>                                               ptp->info->getcrosststamp);
>         ...
> }
>
> So after the poll observes ATSNS =3D N, a PTP_CLK_REQ_EXTTS enable or a
> second concurrent smtg_crosststamp() can set PTP_ACR_ATSFC and flush the
> FIFO, or drain it itself.  The loop then still runs N iterations against =
an
> empty FIFO, sets *device from whatever those reads return, and returns 0.
>
> Note the read_lock_irqsave(&priv->ptp_lock, flags) inside the loop is a
> reader lock, so two concurrent drains can interleave pops of the same
> FIFO.
>
> Before this patch the count was re-read immediately before the loop, so t=
he
> same race produced num_snapshot =3D=3D 0 and a skipped loop, i.e. a detec=
table
> failure rather than a stale value.  Given that, does the commit message
> claim hold?
>
>         "derive the count for the FIFO pop loop from the value the poll r=
ead
>         back so it is guaranteed non-zero on the success path"
>
> Would holding aux_ts_lock (or another writer-exclusive lock) across the
> ATSFC wait, the trigger, the poll and the drain, and re-checking the coun=
t
> at drain time, be needed to make that guarantee real?

Agreed.  v6 drops the "guaranteed non-zero" claim and instead holds
aux_ts_lock across the whole sequence: the ATSFC clear wait, the GPO0
trigger, the ATSNS poll and the drain loop all run under the mutex,
and it is only released on the way out.

v6 will be posted shortly.

Best regards,
Zxyan

