Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BEAD73EB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 01:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNEnnUWc0ljhEZKMEfW+sE66aVZ/mqoNGO+gH29mfjQ=; b=bPvvIoTGZJEp3V5088PFdHED0D
	IUqX7Rq5GBWqvtxsxxlbJITEFwB74jy4649EAlD5QVtsmLNy46X/dJ7bX+QDhFQtC5T22hN0BFJY3
	KFcarOTE7wZ1FgX+vgiG3EDCSkgjtAONsT9HNXG9RdiqVR1llSHW7Q+t09ts/oVtnQOvxWlj41y13
	fKoyNvXcy+JfTU8nR8eq7zGQWpLMz0jFwFW6mijHcCYFGsME8NgG1KhkJv/bh1ZX7eOd/Icoco/4x
	iWLHpLZrQfn8vawypPAvx7lyXJn5bTM3WA/hwZWKuyg3zbWQh9RYm09+Df5FZgidRlWd4X1M2MtK5
	CG70yW4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vldZF-00000000ruf-2zwA;
	Fri, 30 Jan 2026 01:45:01 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vldZD-00000000ru3-0b5s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 01:45:00 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-823210d1d8eso861079b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 17:44:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769737498; cv=none;
        d=google.com; s=arc-20240605;
        b=SsDrSRzfvkUbMQ3irj8YupKHkW+OnY3+SYfTovxb2xBuOXcOcESjqjEk2JeAnbmDil
         rhm8qoulGv7P6/mQlP6FhSl9R0IZ6pMDr9Kxe28VDPePiBPxkgJ6/DqPEqDAnR2IPnYD
         wLVURt0PnPfBkv4Rr+UuHWPfZ0/dCo5eCXucabtMpWiFDroXwOEuR7SezzJ/8slJn0Cn
         6d9jRfOghZ6ZWxDpgdCCbMAqUwsXbFEKn2RoMS03BfOfpUwglWfQMkRvRjojoXJ/aYQH
         0T76SQLK/viOAkATDHZKcnF4bfgLOpZN0U1BGyHLqGLaMgY7MST/GYBTb5rcj2u4ZXKv
         SZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jNEnnUWc0ljhEZKMEfW+sE66aVZ/mqoNGO+gH29mfjQ=;
        fh=RUMMAaeplCXGRvtcRSvtoh225UrJNyQhHVirT0bzwFw=;
        b=YwLQF6vTW26dUu0t5T2sQQpvKZDzkGDx0/zdBRIstMD8Lado6p3KuT2p8Jj6jFqfSy
         A7bIMxNROtmMILeA2iquKgrsAzseqDGUYuFM5oi9QWG3YtSliUSXsJz6/8N1Cg+4YyNX
         bQon7XPn6WzDl+TgFZyplFkXB8ZAx2RQPOabAU65yCnFekkI/zpYYvv/wpC01Xegs27Z
         O3UZVqlkEv3lUn5gHV1mqvlTz5Q7yFMPbiVC2EM/Sdy6tGA+OrHSwCjVpvM7wSgTEF49
         PMoFPuX0dA0cNFmmemfCskIC27fdkwodcz1eAjOJtmNV4p7W8Bb7mX8yLGZkHFOnJbAo
         REDg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769737498; x=1770342298; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNEnnUWc0ljhEZKMEfW+sE66aVZ/mqoNGO+gH29mfjQ=;
        b=itccPi07Cj+yYp3v7i0K0nMJjhYMf1JpYFLq6MLLdYzoVWXU0LbM6/ZwmH4qUG35zO
         ZvnfFf08pNElDcc9jIAX15en0Ce0hFwkzqeMNQ2GiORxu7SWZYo+Sbx4+yPPq4uTbwiD
         ++UYmRfFoxmv3VjJrw1CP3ONBR50iByb7m/E94iODrY9qmu3ceVlEaYKhbEaf4O6aqQq
         dx2WZhBqQJmlz2sFkmHYPn1CEjOjP3XTXjmtotQaZIak5IHEscISwGg1CXHnZfQipVFt
         xeZ/MVyNuyBwz2UBcg6yVZD6QYxUVe98KrYvtcuHrozAHT/KQVfoP3PAl7Er2jhHPWu/
         AOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769737498; x=1770342298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jNEnnUWc0ljhEZKMEfW+sE66aVZ/mqoNGO+gH29mfjQ=;
        b=nECKy5yCTb7kQahkLUhU8aMGI0ze+msYpll9iHHM30zcOLnJWL9KUGaTTrq+nTF4ka
         V2Z1NEmT/pyZVPHtEnf4Q/5XtQ0nSMuDkdI3g9PtjohoEM19JyErCAipljigPnsFmes+
         LcRCqm1XwAsHdyaD518/C56NFpNK8XaigzxIsuu4O36ec6eOJShS+8lCK7kg8q9o2aF2
         eqrIBbiv36iTSeYlYpn9uMQFTs5VE9mVOTHnGKbObirV6gkcD05Asv8pAg9yhoVuZRFi
         1qlA92EC9f7kJCwunMz4l4jTnFFV8FHDYI2jKJR8VAk7m3MphROIIuw8v8CAFHcDFJE/
         OSww==
X-Forwarded-Encrypted: i=1; AJvYcCUKC0yWixA5rlraKsZWOXJWWl1Zkm79JkFT7b0+D1dAHenyZgisswr44fxz/DXZ2j3ZrofbA7vC3Y347lSb/uJX@lists.infradead.org
X-Gm-Message-State: AOJu0YztgkOBJdrC+jyp8wAXWbb71Svs/bORH7c4A3Chw+C3b8/oi2H1
	rPqjluqjP/MjhFlY+0N7EAMSgxMky6S84T+fAKkGOTdVeKMEhRNMXP207Zes0gbqpMeZOk1QY+s
	W1z3vNd1tH20ELZ/1ztBX3k4S8iVymTQ=
X-Gm-Gg: AZuq6aKA75ByLuhU6Oq+VqefzJyU5ufXtrK7Iluh2jyZ/WxM9HAOZCnXHfwwrrnhDrq
	sTeDKFDP1J7HgAsgFqgieY4vW2njLgL9vgM7C2+YYO91KOoU8bbip00KoeATZh0C5H2al3h2Ruf
	7/QYszYCRQUMSSD5FBnFQzwTNZUkOosT7rYYitWplrcTPNNofJqxq9NH2pK6yvW6rkz7jZIgzFJ
	m2U8J28q6E/G+BQ/YE+Q38diGZvM/Ozao0sO2/3zSE8bqGJSIkk2nRU4l+PjI1Fr/mTVh0=
X-Received: by 2002:a05:6a21:9214:b0:366:14ac:8c6f with SMTP id
 adf61e73a8af0-392e01842cemr1045926637.69.1769737497875; Thu, 29 Jan 2026
 17:44:57 -0800 (PST)
MIME-Version: 1.0
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-3-shengjiu.wang@nxp.com> <aXuVXruPir7hasdd@lizhi-Precision-Tower-5810>
In-Reply-To: <aXuVXruPir7hasdd@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jan 2026 09:44:45 +0800
X-Gm-Features: AZwV_QgRSYSkN9m3U3HWfvC48m_G_i-4n2rGz9NZqS3r9F4yXRNiuZDo3HAYyaM
Message-ID: <CAA+D8AMYEVbFTgTaVhTU_ZJ=eoyQAj4zygLsfuK+Yt+=8qQk1Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_asrc: Add support for i.MX952 platform
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_174459_212471_E9BC18C4 
X-CRM114-Status: GOOD (  27.96  )
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

On Fri, Jan 30, 2026 at 1:14=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Jan 28, 2026 at 03:18:52PM +0800, Shengjiu Wang wrote:
> > Add a compatible string and clock mapping table to support ASRC on the
> > i.MX952 platform.
> >
> > There is a limitation on i.MX952 that dma request is not cleared at the
> > end of conversion with dma slave mode. Which causes sample is dropped
> > from the input fifo on the second time if dma is triggered before the
> > client device and EDMA may copy wrong data from output fifo as the outp=
ut
> > fifo is not ready in the beginning.
> >
> > So need to trigger asrc before dma on i.MX952, and add delay to wait
> > output data is generated then start the EDMA for output, otherwise the
> > m2m function has noise issues.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_asrc.c        | 39 +++++++++++++++++++++++++++++++++
> >  sound/soc/fsl/fsl_asrc.h        | 16 ++++++++++++++
> >  sound/soc/fsl/fsl_asrc_common.h |  3 +++
> >  sound/soc/fsl/fsl_asrc_m2m.c    | 29 +++++++++++++++++-------
> >  4 files changed, 79 insertions(+), 8 deletions(-)
> >
> ...
> > diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.=
c
> > index f46881f71e43..296e13a16490 100644
> > --- a/sound/soc/fsl/fsl_asrc_m2m.c
> > +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> > @@ -253,15 +253,28 @@ static int asrc_m2m_device_run(struct fsl_asrc_pa=
ir *pair, struct snd_compr_task
> >       reinit_completion(&pair->complete[IN]);
> >       reinit_completion(&pair->complete[OUT]);
> >
> > -     /* Submit DMA request */
> > -     dmaengine_submit(pair->desc[IN]);
> > -     dma_async_issue_pending(pair->desc[IN]->chan);
> > -     if (out_dma_len > 0) {
> > -             dmaengine_submit(pair->desc[OUT]);
> > -             dma_async_issue_pending(pair->desc[OUT]->chan);
> > -     }
> > +     if (asrc->start_before_dma) {
> > +             asrc->m2m_start(pair);
>
> Does other Soc also work if ASRC start before DMA enable? Suppose most li=
ke
> work. Then needn't start_before_dma.

Yes, should work.  but I don't want to change the original behaviour
of other SoC.

Best regards
Shengjiu Wang
>
> Frank
>
> > +             /* Submit DMA request */
> > +             dmaengine_submit(pair->desc[IN]);
> > +             dma_async_issue_pending(pair->desc[IN]->chan);
> > +             if (out_dma_len > 0) {
> > +                     if (asrc->m2m_output_ready)
> > +                             asrc->m2m_output_ready(pair);
> > +                     dmaengine_submit(pair->desc[OUT]);
> > +                     dma_async_issue_pending(pair->desc[OUT]->chan);
> > +             }
> > +     } else {
> > +             /* Submit DMA request */
> > +             dmaengine_submit(pair->desc[IN]);
> > +             dma_async_issue_pending(pair->desc[IN]->chan);
> > +             if (out_dma_len > 0) {
> > +                     dmaengine_submit(pair->desc[OUT]);
> > +                     dma_async_issue_pending(pair->desc[OUT]->chan);
> > +             }
> >
> > -     asrc->m2m_start(pair);
> > +             asrc->m2m_start(pair);
> > +     }
> >
> >       if (!wait_for_completion_interruptible_timeout(&pair->complete[IN=
], 10 * HZ)) {
> >               dev_err(dev, "out DMA task timeout\n");
> > --
> > 2.34.1
> >

