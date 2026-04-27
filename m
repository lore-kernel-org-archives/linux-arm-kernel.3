Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C24FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 21:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8XKtJc4DO9XTE2eYRlXe/gcxi3hvK1ItEFqJbW+SysQ=; b=TjBpd6DEp5xx1ZrCFpBvcxmk3I
	hFOyS8yTu85h4d8sw7NIvA5I9zov2VNGxHJsVO6uHLnkshGVCI5q9EpUqg4S8am0UVm79eKtVJGIm
	JQlp3RMdixgFHDRYs76U1SF2IVo8krifFKLj7HUHOV2VqtpfSjq93Lpc2ase+4sD3lLeAsy1QBSMI
	VadrRyM+BtFrTyTCHSznyLCpZan2nukp+UtyTSK98W2q5nvaKCe/csVIRdww4j5+ohHvyoDOG9iTR
	0cOQ4F9jjNKNidIOBLb2RBiqUOQjsTTul6z6k16mV6LXpI3kS4rBHOoxZl3djY8SIcBPvpjpx5vBC
	WPNdVy/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTdt-00000000BST-0BWW;
	Mon, 27 Apr 2026 21:37:25 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTdq-00000000BS6-1mn7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 21:37:23 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-12c45281a06so14568168c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 14:37:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777325841; cv=none;
        d=google.com; s=arc-20240605;
        b=Y5pjY/eAH2B+CYhTk8CDd+kb3uLIfxj5aSYnRpwJ++kDbjV2uf9gjctPNEM9tHl97g
         WUBALF9ls+j5CFdNf4FakfZ2Bi9avCeZT2h1hnkEGiVSgAaylkfn92eEke8MGWHsA6Vo
         npfNpLwR0L1ZN3IH2SiUnMTPx85dTLee2W/3aGktBBAzSl7zZX7NyAc19486z1jlG7Cn
         hXkCorSaPiEJnm1ilZ05D0FOY5JpSvJyDbZ5bEIII8aSkxhYFLH3Wyt8hxut08LtEmHw
         5ypLp/Bnfil5LE0XUWooTe8R9DBKSX925DI7FjyyZ2U2mWu4Day0w0nzqo5xc1vDkKc+
         011w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8XKtJc4DO9XTE2eYRlXe/gcxi3hvK1ItEFqJbW+SysQ=;
        fh=uvuXMobY/jYYtyqslh5EGA6GlwrwH8E3DnietUgaAdI=;
        b=IuNSWJZZrEeYOkgYE2qEPmH2q6K26qZ3GhEgjMiMX0pI3t/+OCe0CNlThe4E2fKXWk
         3OXRiQtCH+QQW8bRoq5MhRtPqWa3wZwCJqVqMEBq0lw++QwxoQ8UooOvTOqKD1OQMDkL
         GuSskrnhuhMWCpWKR/Z2VBHEUeg8jYrNsloFQ4abeHZt0ekoZIjuRSFZtC8yPN2MqQe3
         qfuBAsdskI8zHq3Vd8MLl58NmN68aFtr0x5+jw0SmycXgL97lPf/bStC6ouSPEV/XTM4
         vbh1xC1a82RmwzhZnWxLspyDHcjRA+UwAjsjr3lhRZRiicdRJn7+a7lg7OdYL9h4YKEU
         +i5Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777325841; x=1777930641; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XKtJc4DO9XTE2eYRlXe/gcxi3hvK1ItEFqJbW+SysQ=;
        b=YWFZ3tSEZ7Xxd+QnqaQh5DtZgtsyGAE8WDS04cD62GV1RUvPaW+I0MSu/suM0YeesO
         WwWrVrPzLocn1NNbK3AHIYh85+UfjiVWav4VwHuwORsVCTAWTsxrHu0etIib0LlsG941
         ae6j5lWdDY1DQB841VYj5eW4ePS7waTGJi4rFkvOZvEj7A1FpE3D5HhZ55TjqviSeVrh
         ilp3ankwmYUvW3j+1aprTVNFaKASjp2vwsa6ci5PtpzLzKQcELDo+wmUdScSb4GNa56F
         eSEfhzi96zVXMbHMbS+v8tVI4XgwDyMTYdicEAYrLJi9xEUGeOh9CmegwDsXvYG5nfVY
         BjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777325841; x=1777930641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8XKtJc4DO9XTE2eYRlXe/gcxi3hvK1ItEFqJbW+SysQ=;
        b=lAfftj5hyevFvyeXdyYrDyy4J8Ltai0e0iqq9CyLcWCw3i6lKyV0W/GaMbka4Lr2Uw
         nDaaZv9UzcERghbniYJwgzzdXXLtFDT7HvAxvKSH33N91xpd1QmoO5psojFmhpxfX/v9
         aNm8aLXJ0cgADyiADRes48SwYTSV61goCmqCtNXWo+LRI7ZaFpcq2iYdZ08NrLSEZEGH
         K1/fWHaWBP15RVJrMbyh5NCTxFqLKaGKeiNBSQGNJO3430Q3fkGNiPemOHfvZgBXu1TL
         wixal7JDOgj4Blq3GA/mTblrEl5rNrqI3yNBg08TDK/U+C4QHqVgUEVn9M8n1vx+0laV
         YiYw==
X-Forwarded-Encrypted: i=1; AFNElJ92ktHr7tsZNll13uWFOIwHOjwRdD5sn11QHoLShbKr1qA3CAJQAmoZ/KvYfqUeOmBKWKAwDln3RnslLG1oobFi@lists.infradead.org
X-Gm-Message-State: AOJu0YxD//et5zlrR2r3hWH82eSiyQevppmhGdyMShFvpVdP8Pn5qSh2
	efxYjlhd77Iu2SkltnLx58fsqyHzL/kSAu6AHxsKQzQsc/KQanRzBODyf7c9qyX56l/orxlYmsx
	kQJarsT8tR7hp1XUt7AhIMpQTgpCTixc=
X-Gm-Gg: AeBDietVCrhujlFF62m+8qesoY9D7jY+72Kr3u03kZF4f1v9pEZngTspOilH1eyxtob
	+lh6TDCTXRTltmZaywAo3lc7U9AE0PiqOtmG8SFe1CjRVee6RRdAT0BpQC2awicwJLY+jZAIuBq
	d2o+8ywibMACuUWcSOuSIHSH7XHb4nGq1qaQNDLrvFsmFlcl+nZGLFv7BS87v5zDokILYlnDDOs
	k4xqTE0fqAlcvCDskUpt2dCtsLv3uAI9un1vRDNdYQ1fbCJLr5NdQTIqVcctPB3jIDDkTOoMoDZ
	ordS8EED8W8eWA==
X-Received: by 2002:a05:7300:d513:b0:2e2:4979:eb5 with SMTP id
 5a478bee46e88-2ed09fcc180mr311495eec.10.1777325840960; Mon, 27 Apr 2026
 14:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260426210255.73674-1-titouan.ameline@gmail.com> <84c292d8-d2a0-4c29-bd28-cc00f66c2f43@linaro.org>
In-Reply-To: <84c292d8-d2a0-4c29-bd28-cc00f66c2f43@linaro.org>
From: Titouan Ameline <titouan.ameline@gmail.com>
Date: Mon, 27 Apr 2026 23:37:09 +0200
X-Gm-Features: AVHnY4JpWy4zf4LeRSNZh6T-aSXl5OGcXxX7HkXcB9Hcxkw79B-CQPA74hur6GM
Message-ID: <CABvHBc71N5NvYZ29W8hn9-gjOo40eh-hgcTAP3Nn1jrAfrgr2A@mail.gmail.com>
Subject: Re: [PATCH] firmware: samsung: fix stale response flag in acpm_prepare_xfer()
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_143722_472690_FBD0595D 
X-CRM114-Status: GOOD (  24.66  )
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

I was reading through the driver code and noticed that
acpm_prepare_xfer() only enters the

if (xfer->rxd) branch to set response =3D true
with no corresponding else to reset it to false.

Since seqnum slots are recycled, I traced what happens when a slot
previously used by a response-expecting transfer gets reused by a
fire-and-forget one

-> the stale true remains and the wrong branch is taken in acpm_get_rx().

Le lun. 27 avr. 2026 =C3=A0 10:48, Tudor Ambarus <tudor.ambarus@linaro.org>=
 a =C3=A9crit :
>
> Hi,
>
> Thanks for the patch!
>
> On 4/27/26 12:02 AM, Titouan Ameline de Cadeville wrote:
> > acpm_prepare_xfer() only ever set rx_data->response to true, never
> > false. A reused sequence number slot could therefore inherit a stale
> > true from a previous transfer that expected a response, causing
> > acpm_get_rx() to enter the response-copy path for a fire-and-forget
> > transfer whose rxd is NULL.
> >
> > Unconditionally assign the correct boolean value so the slot is fully
> > reset on every reuse.
> >
>
> How did you find this?
>
> Sashiko identified this too when reviewing the ACPM thermal patches.
> I sent some fixes last week, where this bug is squashed as well:
>
> https://lore.kernel.org/linux-samsung-soc/20260423-acpm-fixes-sashiko-rep=
orts-v1-0-2217b790925e@linaro.org/T/#m1c32aa4c84ea7e3909bc8fe7599585b71e95d=
8b5
>
>
> Thanks!
> ta
>
> > Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
> > Signed-off-by: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
> > ---
> >  drivers/firmware/samsung/exynos-acpm.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/=
samsung/exynos-acpm.c
> > index 16c46ed60837..2fee6bb60efc 100644
> > --- a/drivers/firmware/samsung/exynos-acpm.c
> > +++ b/drivers/firmware/samsung/exynos-acpm.c
> > @@ -380,8 +380,7 @@ static void acpm_prepare_xfer(struct acpm_chan *ach=
an,
> >       /* Clear data for upcoming responses */
> >       rx_data =3D &achan->rx_data[achan->seqnum - 1];
> >       memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
> > -     if (xfer->rxd)
> > -             rx_data->response =3D true;
> > +     rx_data->response =3D !!xfer->rxd;
> >
> >       /* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) *=
/
> >       set_bit(achan->seqnum - 1, achan->bitmap_seqnum);
>

