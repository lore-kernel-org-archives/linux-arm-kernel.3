Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F07DEB7ED7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 11:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbtOTZEyDRKjxabRC490eCkoRx0H/oDiCdXHd+Ic+XI=; b=DP0CvagOfXCMvOOOqnOKU3X/z7
	98hxbCVlyN2SHR1Z3ZB/KuXLtLKAtDkaLBmHQv+DoWw1iZN6NPXnb08PxV+hPGLX64ZWZylJX6pFd
	OOQGUbYOMa73yp4TtG+YUpBWpk+KZa/T4Qwqo4E6ypPxbrRPcCTr9CPas3j12iRgalMUpPfT0dyE6
	tDzOLriK1OvkhIpo7OdvEtWDwHapavbxwr30HurTV/TNVFpl2SupdWDQZXd3TcfCAQuhvw2P7fQJ1
	5/duPw3u6pbM0+MmQ7i8NrdOE9VnFYwPSYw+rl9/CFEz+y62/oAQp3GyhVxFKFA/l+2/cpNg6Sw0A
	Cmxg47Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkaQ-0000000H7Qd-3hAx;
	Wed, 04 Mar 2026 11:40:18 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkaO-0000000H7Pw-2MFs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 11:40:17 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48069a48629so71881665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 03:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772624414; x=1773229214; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PbtOTZEyDRKjxabRC490eCkoRx0H/oDiCdXHd+Ic+XI=;
        b=Y+ctrMQQGD8a6EEsEXqcpJEC9F/x2mMYm7+FTQJ0vaLyaOYqmOAeeSITmqAEb3m11i
         ZVMcpCLuq3ZL5/h/YoDjCY42Y2UFsVesEP3upwcsSHXVjf+hcadRmIBx2p1rQZYy1PBH
         VGQ4fbSdzNrxJJFH02oZ8ES4IR3nG0sEK0JnjKTg9Ld1UgeFueSzsqfcEbm1xHZDj1f1
         6fLLrAQDAdV2ob+hQf5FUE46zl/t0XStBI0AmNYV+6iY+mMlenQjKXiFM6oMaFWNbf3i
         BtEpnYg+my+g2IctVxjV9kFLJPXc+30uEf7+iSjsJVOUgWjJSdi0AFpu3/i/UNaEI613
         oHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772624414; x=1773229214;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PbtOTZEyDRKjxabRC490eCkoRx0H/oDiCdXHd+Ic+XI=;
        b=grlc2j/zWq1RRiqd0op9fkuY3WLQBBccQvLMJF9uFHu3ppifEMQkW7O55/WACo/PN0
         3CLarT1d7rScWHSlDaA22y8LKCWvOZ/lTvH5ssVU4iUJIwNt82fZvY1zM81+IixLt7tg
         2eWu5BjsIeb8TP+XUxx7X9jGftHZdTkAH9B/SaZ/erRxAWLbFRF07Ipdh5KVQO+ce6G5
         /AGq8jNFPQuR8ldArlWLBwuz9K9iaSOFDkK+S/ie8El2iThptj97L0uVduitvyvWrT3a
         KHUygkUJxo57oz5TuAt4kdeHuyg5EySk8jhvJPvCMctm59vWtENvxSYZucAKUVE4pWfs
         ELMA==
X-Forwarded-Encrypted: i=1; AJvYcCUginmmJd+DaSC0oH6JaNITON7zUL3CLMbZdQzx5wj2kjC3BGV0C9ORKs6F39nLJZamJV6rme3ouK7IWNL0q2+v@lists.infradead.org
X-Gm-Message-State: AOJu0YzRqC0M6URA4ovLxNUc2TzPFzObkG/FWZgA2hXeg0bbRybcJ9EX
	0D48KOeu+FcCCQ8QpaGqbYQEkoqraQ0q+fkpTQutqf4HGdjaZGzZ37zO
X-Gm-Gg: ATEYQzy6j9NSC56Pzhie2MozWxIXtNyjxixXV5vrYiyG+z3LpBlP5ShdVDgdTjkGY82
	aXGd6mmH1O5t6vlH6DqxCFBbKzvkARrwDt82u9IzHvuWG6hV8d06AmKdedywzoTIJJbtyx5PPi4
	CDLaAtsPSU7VDb1uXNniGt3fd6pIrGAv2ekSBHNYL5LiePuBEk8GX4yyt7psQOQ4WXEGxHLtgwB
	7xihjSICmLWTTvuFmPRHiqE1ueMHn8suwB2z/JL7EaQpIdm0Q9r/K5c1axh/HsJ1ZYEwjEqZg3y
	9x3VmiL1jOMj1CW99Rg+n1EpaoVzQM1fxwqsxzeq4X+tQpDmawo3Vy5YJRsrcIfWqqDqZfiIrwn
	56c/G17FhTMdWxlezRweSdC8Z47E0KUwqFurBHnxkrHYCs0GIkkg5+4yAWnmxAICSX+xc7FTzIX
	skS+QeF8CmNxENvS2utxLJpnFWAWDYdhU=
X-Received: by 2002:a05:600c:a51:b0:47e:e20e:bbbe with SMTP id 5b1f17b1804b1-48519889928mr26061705e9.25.1772624414000;
        Wed, 04 Mar 2026 03:40:14 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851884225asm47072305e9.6.2026.03.04.03.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 03:40:13 -0800 (PST)
Message-ID: <7888782857fca26d6562c5cf1807fc7488c9dde8.camel@gmail.com>
Subject: Re: [PATCH v2] iio: adc: xilinx-xadc: Fix sequencer mode in
 postdisable for dual mux
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Christofer Jonason <christofer.jonason@guidelinegeo.com>, 
	jic23@kernel.org
Cc: lars@metafoo.de, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, 	michal.simek@amd.com, victor.jonsson@guidelinegeo.com,
 linux-iio@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, 	stable@vger.kernel.org
Date: Wed, 04 Mar 2026 11:40:58 +0000
In-Reply-To: <20260304090727.1800289-1-christofer.jonason@guidelinegeo.com>
References: <20260304090727.1800289-1-christofer.jonason@guidelinegeo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_034016_615361_9B488643 
X-CRM114-Status: GOOD (  22.76  )
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

On Wed, 2026-03-04 at 10:07 +0100, Christofer Jonason wrote:
> xadc_postdisable() unconditionally sets the sequencer to continuous
> mode. For dual external multiplexer configurations this is incorrect:
> simultaneous sampling mode is required so that ADC-A samples through
> the mux on VAUX[0-7] while ADC-B simultaneously samples through the
> mux on VAUX[8-15]. In continuous mode only ADC-A is active, so
> VAUX[8-15] channels return incorrect data.
>=20
> Since postdisable is also called from xadc_probe() to set the initial
> idle state, the wrong sequencer mode is active from the moment the
> driver loads.
>=20
> The preenable path already uses xadc_get_seq_mode() which returns
> SIMULTANEOUS for dual mux. Fix postdisable to do the same.
>=20
> Fixes: bdc8cda1d010 ("iio:adc: Add Xilinx XADC driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christofer Jonason <christofer.jonason@guidelinegeo.com>
> ---

From a code standpoint:

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> Changes in v2:
> =C2=A0 - Align continuation line to opening parenthesis (Andy)
> =C2=A0drivers/iio/adc/xilinx-xadc-core.c | 11 +++++++++--
> =C2=A01 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-=
xadc-core.c
> index e257c1b94..3980dfacb 100644
> --- a/drivers/iio/adc/xilinx-xadc-core.c
> +++ b/drivers/iio/adc/xilinx-xadc-core.c
> @@ -817,6 +817,7 @@ static int xadc_postdisable(struct iio_dev *indio_dev=
)
> =C2=A0{
> =C2=A0	struct xadc *xadc =3D iio_priv(indio_dev);
> =C2=A0	unsigned long scan_mask;
> +	int seq_mode;
> =C2=A0	int ret;
> =C2=A0	int i;
> =C2=A0
> @@ -824,6 +825,12 @@ static int xadc_postdisable(struct iio_dev *indio_de=
v)
> =C2=A0	for (i =3D 0; i < indio_dev->num_channels; i++)
> =C2=A0		scan_mask |=3D BIT(indio_dev->channels[i].scan_index);
> =C2=A0
> +	/*
> +	 * Use the correct sequencer mode for the idle state: simultaneous
> +	 * mode for dual external mux configurations, continuous otherwise.
> +	 */
> +	seq_mode =3D xadc_get_seq_mode(xadc, scan_mask);
> +
> =C2=A0	/* Enable all channels and calibration */
> =C2=A0	ret =3D xadc_write_adc_reg(xadc, XADC_REG_SEQ(0), scan_mask & 0xff=
ff);
> =C2=A0	if (ret)
> @@ -834,11 +841,11 @@ static int xadc_postdisable(struct iio_dev *indio_d=
ev)
> =C2=A0		return ret;
> =C2=A0
> =C2=A0	ret =3D xadc_update_adc_reg(xadc, XADC_REG_CONF1, XADC_CONF1_SEQ_M=
ASK,
> -		XADC_CONF1_SEQ_CONTINUOUS);
> +				=C2=A0 seq_mode);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> -	return xadc_power_adc_b(xadc, XADC_CONF1_SEQ_CONTINUOUS);
> +	return xadc_power_adc_b(xadc, seq_mode);
> =C2=A0}
> =C2=A0
> =C2=A0static int xadc_preenable(struct iio_dev *indio_dev)

