Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D202CC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 15:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcqZE4qPTQHVucGSFwcIhAMd1jR70HnZWUK0ZLVzwjk=; b=GDUShmUeKI3/DCpcKsd9W+A6Ml
	4evAktfjzA8qXrPmg2bKsip9NrLErKlCWvmHrJHJNXNy2drGtspigganTBZa8009Mhy4taYKf7OS6
	EdXsfVZTqNaI067i+q90ImVmm1mouv8B0hTBjuew7JoZgPhgHGPHHA7y3/eO2zHdkp2DvGNiyOpwx
	bMc+L/yGwQ9XQL8GEHeYmgPFUoizoTYQcBFZImvGRk7hqVmubyss+T0j8r4vuxsogKXvHku/1bh99
	LdNrwGW9qwldrjodLckrPEvLNsaAiYB+1kaWIHVJ6m/Npwh25uaEBZfk8FUcgog8YkZsMnyu0OYb2
	ikE3DHhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twk4b-00000003YV4-0VcQ;
	Mon, 24 Mar 2025 15:50:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twk1u-00000003YDN-0cCB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 15:47:59 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cf257158fso30692055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 08:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742831276; x=1743436076; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kcqZE4qPTQHVucGSFwcIhAMd1jR70HnZWUK0ZLVzwjk=;
        b=MLI0ovBGpR2WyXyKpO4CmxG63Va7HvDvBLtSLWWsLNTjy5dmAhVUoMWoCXkfG0gXKa
         qftJ3XbqjGof2PtbQtq4Mm0/uvHU8405MXiINtQukAVdd4XlRGMIOGiQkzwvQlTdS8FL
         hVRysRsh+O01VHAC3AHWFGwdHJjeamqdXspDJ7rkDwST7F1P5rJ75dkLK4unloxiu8wx
         U2QVx5A8RuPTVlPdQsNcYe7xc9qgj4SPG0rDYTctc0sRuyBwOaXTd/a3uLxD7O6xNr+X
         BtqUQ0C+yF7b0q+8uYm8/xs1iT04iaaD8bX58SNG9jlE5BQlh5gN/PAmNnxykCdG1Ll1
         9wLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742831276; x=1743436076;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kcqZE4qPTQHVucGSFwcIhAMd1jR70HnZWUK0ZLVzwjk=;
        b=eHWQMhNh6vu49gh2gzItn/tbMN1E4dns42CZFQh0TsxXdLeks4axZzwM2x8GiZyQSS
         x0UG3p2fXFmJTLsZ2Kch8XabyC73I8mbJ91U21pPtApGosKIt759c4pd9TJNSxfjED8Y
         OtfbdeQaaWVBdzSe4bToBbKIbrTD0NdBwLonLLXX3/UGmQvrJKhEFa0dc5y+hx33q5Pt
         rHFn6f0UDOZHJB+OOGZBRSF2wT0z4XAPoNsAGoNzbwDtiK6Hg9lO1bf+zjLhC/WB8a9k
         8PI3koMmrb2dK9HvHbj4LlYRZvcAiCNUZj8AuvtiPCLKPfFVkt0KIKlMJz5fuU5/5ksj
         hiww==
X-Forwarded-Encrypted: i=1; AJvYcCV+V9I7S+oR4PEDj6rsBvQ17XS3bcNu7JKllTgfVs7FGdvYhKp4KIsWNwMxmDx5zaAgJDgvtZrATv6TO9GJxhXC@lists.infradead.org
X-Gm-Message-State: AOJu0YzRUpN1hOtuL8yW5NaK+dwWIHdgR1bN9nQZSzFPSyWVBYNwWMNG
	QE/nRyNAPyKtN1j3xaFUHjmTV1rSiSGZJplS3cq/5cejfz77pZOeuj3/OsdCYDs=
X-Gm-Gg: ASbGncspBi7jnNgEMAzdOzDylYizQSGXW2Qq+Yl20wwKqYa7AI6SiMIuZs3Bdy2+CMi
	UbMmYaTmYSfALAR6h1ZqxnQv+mXHxR7kl04EzUOCnE4sMSDn/3tOJbMIJW/KH5TSET1hVIurUEy
	oWxIRyCerxPgf5tphh6OyHg86Uo9MOty+EA4A/fTrefxh7Y91Mg+fNjun5dI3ruCEuOC2yeiapP
	FfMu3bZOAGKq8rlqi8nyHNwXdtF6lSf7IcBtFQiEIqLX0CPvCW600URtDKxhG8P5yRjoVTnTmBc
	JbGmvbYY5mCDOvJxE/LLb2AhWtdKv/wUhOUHzfhVkAlRk/Kn
X-Google-Smtp-Source: AGHT+IGBzu+vnV60NdP98eMQrfOkuiF88fG++TSS8EYBfpDvUraev3a4vJjdZ7/Vc2osVqddWPPKJg==
X-Received: by 2002:a05:600c:249:b0:43d:cc9:b0a3 with SMTP id 5b1f17b1804b1-43d567a2f59mr69800355e9.22.1742831276256;
        Mon, 24 Mar 2025 08:47:56 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f3328bsm174640485e9.1.2025.03.24.08.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 08:47:55 -0700 (PDT)
Message-ID: <8c453ce602ab10e09104184fca5310233a9f67e2.camel@linaro.org>
Subject: Re: [PATCH] firmware: exynos-acpm: check saved RX before bailing
 out on empty RX queue
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski
	 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com
Date: Mon, 24 Mar 2025 15:47:54 +0000
In-Reply-To: <20250324-acpm-drained-rx-queue-v1-1-577774335151@linaro.org>
References: <20250324-acpm-drained-rx-queue-v1-1-577774335151@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_084758_191887_DDBB9E54 
X-CRM114-Status: GOOD (  26.78  )
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

On Mon, 2025-03-24 at 12:35 +0000, Tudor Ambarus wrote:
> When we're polling for responses and get a response that corresponds to
> another request, we save the RX data in order to drain the RX queue.
>=20
> If the response for the current request is not found in the request's
> iteration of the queue, or if the queue is empty, we must check whether
> the RX data was saved by a previous request when it drained the RX queue.
>=20
> We failed to check for already saved responses when the queue was empty,
> and requests could time out. Check saved RX before bailing out on empty
> RX queue.
>=20
> Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
> Reported-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> on top of krzk/for-next
> ---
> =C2=A0drivers/firmware/samsung/exynos-acpm.c | 44 +++++++++++++++++++++++=
-----------
> =C2=A01 file changed, 30 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/sa=
msung/exynos-acpm.c
> index a85b2dbdd9f0d7b1f327f54a0a283e4f32587a98..15e991b99f5a384a299c1baf6=
b279fc93244bcf2 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -184,6 +184,29 @@ struct acpm_match_data {
> =C2=A0#define client_to_acpm_chan(c) container_of(c, struct acpm_chan, cl=
)
> =C2=A0#define handle_to_acpm_info(h) container_of(h, struct acpm_info, ha=
ndle)
> =C2=A0
> +/**
> + * acpm_get_saved_rx() - get the response if it was already saved.
> + * @achan:	ACPM channel info.
> + * @xfer:	reference to the transfer to get response for.
> + * @tx_seqnum:	xfer TX sequence number.
> + */
> +static void acpm_get_saved_rx(struct acpm_chan *achan,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct acpm_xfer *xfer, u32 tx_s=
eqnum)
> +{
> +	const struct acpm_rx_data *rx_data =3D &achan->rx_data[tx_seqnum - 1];
> +	u32 rx_seqnum;
> +
> +	if (!rx_data->response)
> +		return;
> +
> +	rx_seqnum =3D FIELD_GET(ACPM_PROTOCOL_SEQNUM, rx_data->cmd[0]);
> +
> +	if (rx_seqnum =3D=3D tx_seqnum) {

To help the casual reader, maybe add a comment to say that this condition i=
s true
if/when the response was received, and before reception rx_seqnum will be =
=3D=3D 0,
because acpm_prepare_xfer() clears it - i.e. it is not ever supposed to be =
any
arbitrary number. It's kinda implied, but a comment like that would make th=
is
more explicit. If I'm getting this all right.

Other that that;

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
Tested-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

> +		memcpy(xfer->rxd, rx_data->cmd, xfer->rxlen);
> +		clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
> +	}
> +}
> +
> =C2=A0/**
> =C2=A0 * acpm_get_rx() - get response from RX queue.
> =C2=A0 * @achan:	ACPM channel info.
> @@ -204,15 +227,16 @@ static int acpm_get_rx(struct acpm_chan *achan, con=
st struct acpm_xfer *xfer)
> =C2=A0	rx_front =3D readl(achan->rx.front);
> =C2=A0	i =3D readl(achan->rx.rear);
> =C2=A0
> -	/* Bail out if RX is empty. */
> -	if (i =3D=3D rx_front)
> +	tx_seqnum =3D FIELD_GET(ACPM_PROTOCOL_SEQNUM, xfer->txd[0]);
> +
> +	if (i =3D=3D rx_front) {
> +		acpm_get_saved_rx(achan, xfer, tx_seqnum);
> =C2=A0		return 0;
> +	}
> =C2=A0
> =C2=A0	base =3D achan->rx.base;
> =C2=A0	mlen =3D achan->mlen;
> =C2=A0
> -	tx_seqnum =3D FIELD_GET(ACPM_PROTOCOL_SEQNUM, xfer->txd[0]);
> -
> =C2=A0	/* Drain RX queue. */
> =C2=A0	do {
> =C2=A0		/* Read RX seqnum. */
> @@ -259,16 +283,8 @@ static int acpm_get_rx(struct acpm_chan *achan, cons=
t struct acpm_xfer *xfer)
> =C2=A0	 * If the response was not in this iteration of the queue, check i=
f the
> =C2=A0	 * RX data was previously saved.
> =C2=A0	 */
> -	rx_data =3D &achan->rx_data[tx_seqnum - 1];
> -	if (!rx_set && rx_data->response) {
> -		rx_seqnum =3D FIELD_GET(ACPM_PROTOCOL_SEQNUM,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rx_data->cmd[0]);
> -
> -		if (rx_seqnum =3D=3D tx_seqnum) {
> -			memcpy(xfer->rxd, rx_data->cmd, xfer->rxlen);
> -			clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
> -		}
> -	}
> +	if (!rx_set)
> +		acpm_get_saved_rx(achan, xfer, tx_seqnum);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
>=20
> ---
> base-commit: f0dbe0d40d08199109cb689849877694a8b91033
> change-id: 20250324-acpm-drained-rx-queue-ec316d4cbcdf
>=20
> Best regards,


