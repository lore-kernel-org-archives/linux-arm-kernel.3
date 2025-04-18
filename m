Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BA0C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 13:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMAgxXTmZLXXT9p3fPBY8vuGF8bkgr7l60OmevMYynw=; b=a+wOWLVuN/XfqmSJWc2kiyOTlp
	t5hXHOYu1kzGPZgX5MA5STBYxP4FGudgxXbSCNuajt02u5tJkX0h8FDMQ1SQWFkBEqGVk+ziZpFpy
	anxgdR+Yqmca6DVwFxjFLdxpLCPX+wX7xa0FfBJV00lUTQwaig+4653TVufCUe4roPVi9UbuAhZLY
	06vctLXbZ4TS4KmElKiZuUkUIih+9aPQ2SGao0LnJFZ7cmeBJfYJr60t45yquHkcLjGpZ7E8MARHX
	YNfgDWvbruEzmafcSJ1fUfOpELrz/n2FeB3NoYCJmy15UE+8st2z0Pix7uEJUfhYVQ68aLm7d987O
	8lsCa1TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5lZm-0000000GBTD-36Is;
	Fri, 18 Apr 2025 13:16:14 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5lVk-0000000GAYg-0NMB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 13:12:05 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7c54a9d3fcaso182263785a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 06:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744981923; x=1745586723; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aMAgxXTmZLXXT9p3fPBY8vuGF8bkgr7l60OmevMYynw=;
        b=PcVTeeQtCeI040yvWNBXIfw2S59g6CH0zfw11LQTUSgTZBm2htb67ps9efG4FaBBL8
         5CRJL5jJfPhBScsjIJ7HLCPdteIYWrO/QepynoGM4Yq63zClitY9CtgOu+d5+7j7Nl4j
         6oct9x1+iQhU+Wa6ex61Ngm+eyooPYwQpV3R+yoErTLntVlCkSIfkfGjziKYclUjI3Oh
         5Gtb/VKkOpveeKOg0xiDBSicyU5OiK5wZnIMuZKjI759I4MXrCgbKjnPCJquZwbKWqng
         aSqazSM5Sw7o4MswoAwWMyF1YQNKn8gPAdcoNk1sw72Y4fQsv3NPAn7mz8hkT3PTbkyS
         iDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744981923; x=1745586723;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aMAgxXTmZLXXT9p3fPBY8vuGF8bkgr7l60OmevMYynw=;
        b=kCRtDY07xpcp/l83YlcdG3Glh2GRrGnuY0KEbgi6CsC1wFd1HgOMoRkMvJcKJR046Q
         lUA+T1/l7O5+Ymic4+KG4Su041CoU6y1rFCU0XzJbQyn0c9hNnmVSRd3m3p8QVpJN79C
         qWO2VMsaYIisH29ldwu+FqXW2rckGwd3lFVOYxi0NR2uiV1sOY4aMogyZvb1jalp/xbF
         mKAZg2Bo0WhPHxZNDfn3zKZ2vQozfieH0PO224GMPQd9kCNr9er2yWlwUOsPijhj6qw2
         8K/kj4/Ns6wkVhGfmz7yeKDv2bO5IOr7xypf5UEiZ9D7iIGLMEGVrCtRoEB1lsDB543C
         yWEg==
X-Forwarded-Encrypted: i=1; AJvYcCU3Cm8G6edslya2jwOfnrHryQwIt7a5aFl7F8pkMKtLkQgXpMAtirHLhrJA7rVQEyQ79SejkgIW5x4mhOStA1Wm@lists.infradead.org
X-Gm-Message-State: AOJu0YzOtBekISIFMi9SEIHCCRjZ8XGtlp8hbcggQ7Nj3cf2oDlyXs08
	WSkUHSPhndrf3+9x/8B8WIPpPXyq+oYDns7TunGbj3dTM6tDqfFFK98ZyudP6ZA=
X-Gm-Gg: ASbGncuNd4pcKS6A/hIANIr1OwcFF8t25ofj30588GJJAuGAez2RoXmv6RxkKq6UnIK
	BdREJ62EAQxgj2IMU9LFc30wM/ioGO4AamB6Xuz26cCaTOwxHmr1da9AuOHFf3Yz2+Gv9R88u8z
	QSRaEVXoq1GE9QEPrZSpXB2oBDKl/PK3lbYJ9hrqv+GtdMNEWuDpL8nqmmqhJZrwReLPT4YEixP
	3R+JLlusl9TzpzfkIczUA5yizJ/x2+8et4v/Q6EMRCCAt6YCoXZHNj9YShch0OW8mn140XFHIvu
	KkpfkHmno99jv1st6QHJM5N9YZcPikCiAkNMm8MKW11f8A==
X-Google-Smtp-Source: AGHT+IH/XoxSUArL6cVz4iPViec3wwwSipsn5opstVs0fi+r5E8l1PRZpdXcrSGXm10//nNhqxZmPA==
X-Received: by 2002:a05:620a:c4a:b0:7c5:af68:5019 with SMTP id af79cd13be357-7c927f97bbamr406396985a.13.1744981922969;
        Fri, 18 Apr 2025 06:12:02 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::c41? ([2606:6d00:15:9913::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a7147esm106040285a.14.2025.04.18.06.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:12:02 -0700 (PDT)
Message-ID: <4549d9abf5f93fb6f417d0fb8f73877272d7c495.camel@ndufresne.ca>
Subject: Re: [PATCH] media: imx-jpeg: Drop the first error frames
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Fri, 18 Apr 2025 09:12:01 -0400
In-Reply-To: <20250305022513.2312731-1-ming.qian@oss.nxp.com>
References: <20250305022513.2312731-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_061204_398672_3E6CBC2F 
X-CRM114-Status: GOOD (  19.29  )
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

Le mercredi 05 mars 2025 =C3=A0 10:25 +0800, ming.qian@oss.nxp.com a =C3=A9=
crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> When an output buffer contains error frame header,
> v4l2_jpeg_parse_header() will return error, then driver will mark this
> buffer and a capture buffer done with error flag in device_run().
>=20
> But if the error occurs in the first frames, before setup the capture
> queue, there is no chance to schedule device_run(), and there may be no
> capture to mark error.
>=20
> So we need to drop this buffer with error flag, and make the decoding
> can continue.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

This seems like a relatively important bug fix to be, perhaps you can
offer "Fixes" tag to this commit ?

> ---
> =C2=A0drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 9 +++++++++
> =C2=A01 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/med=
ia/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 1221b309a916..0e6ee997284b 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -1921,6 +1921,15 @@ static void mxc_jpeg_buf_queue(struct vb2_buffer *=
vb)
> =C2=A0	if (ret)
> =C2=A0		jpeg_src_buf->jpeg_parse_error =3D true;
> =C2=A0
> +	/*
> +	 * if the capture queue is not setup, the device_run() won't be schedul=
ed,
> +	 * need to drop the error buffer, so that the decoding can continue
> +	 */
> +	if (jpeg_src_buf->jpeg_parse_error &&
> +	=C2=A0=C2=A0=C2=A0 !vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ct=
x))) {
> +		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> +		return;
> +	}

Looks good to me, an alternative implementation could have been to
merged into the error branch above.

 	if (ret) {
 		jpeg_src_buf->jpeg_parse_error =3D true;
=20
		/*
	 	 * If the capture queue is not setup, the device_run() won't
		 * be scheduled, drop the error buffer so that the decoding
		 * can continue.
	 	 */
		if (!vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx))) {
			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
			return;
		}
	}

With or without this suggestion, but with the Fixes tag, you can include in=
 your v2:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> =C2=A0end:
> =C2=A0	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> =C2=A0}

