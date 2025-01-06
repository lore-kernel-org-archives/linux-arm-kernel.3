Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4C5E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 20:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdc9HujfsRg7VZQTWP86uL6Jay31RcJJzYBF0Dh2UBc=; b=wr7kMELKcomLzQu8BQCgAKP24T
	RZ0g2IdVJ5ac/glWjTwHuDmOSXCQt4Zl78vfBQ5mE2uXA1VlcNb7cRkLY6kUaWkAK5wl5tQe8Ioba
	6K0biFmGHsTVZPMvz9Pxy9wvZwfo7iC+4wOYPiC0aCv1IbcNzp7xjcvsIMLeapHIekrXGer8qvUZ1
	8CuLAJ9WNyNhGPF90Dw/rHRxPftgk2RAP8y9K3vLe5BXCjc3Gb6UCmsZZBiklIIJ+tjeBWzTwA9Vw
	QFinEPOjVudAHzijSqnX/40EXuXskN66bLg0oZfq24F/TwCWD29E9a4IN7M0ujtvMQI4ap2yh+/Uz
	KtJoXFhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUtms-00000002bcV-3Iz6;
	Mon, 06 Jan 2025 20:33:22 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUtlg-00000002bSW-1YGL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 20:32:10 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7b6f8524f23so1617064685a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 12:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736195526; x=1736800326; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kdc9HujfsRg7VZQTWP86uL6Jay31RcJJzYBF0Dh2UBc=;
        b=Q/a8nlsd2T78SoFLq6okvVnWcV16Z/pJTDb0R4eYVIAOyLW08t6wCfBluqbcuVh4LQ
         L5CqywY2KSg1AcxVlA93wOfQGZe454YLNikAdbDUZHmdwCA+eUULKiTWvtEvceQAERd1
         53QCiPdcTZEOaKAF50w3o+8P67V94lhSQJCZEY/yjOEOPHQR7ZlqczTcD8sfyPi++l8f
         m2tt4SRy1FesLPinFziiLDjjLFrofk7qilK64N7PY2jEc16d7TAIOS7XI4F0AZ2V7KZ7
         If37JwP82bpfQH1AT88TeXyvUurCj3KPCsH87cumyOT74AA/n6SgUpouh6PJMbFmSJ8Z
         veDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736195526; x=1736800326;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kdc9HujfsRg7VZQTWP86uL6Jay31RcJJzYBF0Dh2UBc=;
        b=EXvNkQb91BFU6tDIxbtoRWQrymSAeemiuEtskFiL8uuvEVOfJRNIeUqng75q+XRscX
         D82nbmEZ548QNzcl3+F33Tq5YyE5Fc7jtbCpK4jDRNgSsIUwsMpBWGUrjYI35n0Wzq1/
         aU3vuPGvd16WfjFGUySn5k5we/Yz11OFQJN54iIYniVEddbuJF4XYea+pUoO3JG5kRA+
         wR5SiLylSna6EQTCLx+1k60PJIwSYIzBnH7CVlxGW2D8oCPfNUF8PEHpMkEFVftpFnjC
         W6Hm/ndpjxeiwTYB52b632BNz3D401ukcBx6RZaBSj4Z8U2cfEGMXND6XgTRcnlpknox
         vnVA==
X-Forwarded-Encrypted: i=1; AJvYcCUdNlLhTRHU1RJ7wH/JHwKTG7UZ4yu8QY4kO3QskTDMCNCnL1OYtbgxWA12zevH3+zSfrzHq4DpXBuedz7ZqHN8@lists.infradead.org
X-Gm-Message-State: AOJu0YxKbCuArIVtfJ0fLxGiJgWWXvvH0NXt1Wyesu8e23+RPVy7AXKM
	yCczrN93ojhg54zwKtWw26WJ7EOMseg04en7bTcTjbL/emB/spd75Cp6bZL3e8I=
X-Gm-Gg: ASbGncux9WD2doDkvlKivpQpewchqZtoep11v+bXzYq+gLnL3OE2Co9I/eMH9cUVF9I
	WP84WjquLLrwsE3Cuo09hKvqyAns1ymmiOzHuHRh90kjqGFhTR0EON+zZGuJrpeM7ftCwnMYmtK
	WOpLlI5QGG3nupOPxgr4ddDwaevlPTcqSh/z6tU/bmpbAmHBiU7cYpsm8gTnDneMnB1IVWufC89
	to0Eyq2kXds/7XdAlFqZlneThJpfl/hytPpMn+RVUvZR2eznZrwVzj72Q==
X-Google-Smtp-Source: AGHT+IGaJpT+BxFlDBZrV6BBcWmbAI2GjotZUUHH189+Gylpr5iFInf8jOLV4WbFI11Oj7cprPVUFQ==
X-Received: by 2002:a05:620a:450a:b0:7b1:45ac:86b4 with SMTP id af79cd13be357-7b9ba75a9d1mr11531780685a.21.1736195526131;
        Mon, 06 Jan 2025 12:32:06 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac2df39fsm1534988685a.38.2025.01.06.12.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 12:32:05 -0800 (PST)
Message-ID: <42b656180e4b3f9f720173787075e165509942c1.camel@ndufresne.ca>
Subject: Re: [PATCH 1/7] RFC: media: Add media_request_{pin,unpin} API
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>,  Dom Cobley <dom@raspberrypi.com>, review list
 <kernel-list@raspberrypi.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
  John Cox <john.cox@raspberypi.com>
Date: Mon, 06 Jan 2025 15:32:04 -0500
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-1-0ebcc04ed42e@raspberrypi.com>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
	 <20241220-media-rpi-hevc-dec-v1-1-0ebcc04ed42e@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_123208_603915_E7DA2811 
X-CRM114-Status: GOOD (  24.98  )
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

Hi Dave,

I'm very happy to see this effort being resumed.

Le vendredi 20 d=C3=A9cembre 2024 =C3=A0 16:21 +0000, Dave Stevenson a =C3=
=A9crit=C2=A0:
> From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>=20
> This is probably not the API we will want to add, but it
> should show what semantics are needed by drivers.
>=20
> The goal is to allow the OUTPUT (aka source) buffer and the
> controls associated to a request to be released from the request,
> and in particular return the OUTPUT buffer back to userspace,
> without signalling the media request fd.

My impression is that Hans proposal for media_request_manual_complete() is
better align to the direction we want to take to solve this issue. Mediatek=
 and
Sebastian are currently experimenting with it for the MTK VCODEC driver, wh=
ich
also have two stages (but in two cores).

https://lore.kernel.org/linux-media/cover.1724928939.git.hverkuil-cisco@xs4=
all.nl/

I'm not sure if you noticed this work, but having from more feedback on it =
would
be nice. So far the main challenge we have hit is that it can be difficult =
to
use when the first stages completes before the device_run function finishes
(reentrant). But we believe its MTK VCODEC software design that introduce t=
his
complexity. With the 2 stage single core design, that issue won't exist, so=
 my
impression is that this should be straightforward for you.

Nicolas

>=20
> This is useful for devices that are able to pre-process
> the OUTPUT buffer, therefore able to release it before
> the decoding is finished. These drivers should signal
> the media request fd only after the CAPTURE buffer is done.
>=20
> Tested-by: John Cox <john.cox@raspberypi.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/mc/mc-request.c | 35 +++++++++++++++++++++++++++++++++++
>  include/media/media-request.h | 12 ++++++++++++
>  2 files changed, 47 insertions(+)
>=20
> diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.=
c
> index 5edfc2791ce7..b5334389d846 100644
> --- a/drivers/media/mc/mc-request.c
> +++ b/drivers/media/mc/mc-request.c
> @@ -499,3 +499,38 @@ void media_request_object_complete(struct media_requ=
est_object *obj)
>  		media_request_put(req);
>  }
>  EXPORT_SYMBOL_GPL(media_request_object_complete);
> +
> +void media_request_pin(struct media_request *req)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&req->lock, flags);
> +	if (WARN_ON(req->state !=3D MEDIA_REQUEST_STATE_QUEUED))
> +		goto unlock;
> +	req->num_incomplete_objects++;
> +unlock:
> +	spin_unlock_irqrestore(&req->lock, flags);
> +}
> +EXPORT_SYMBOL_GPL(media_request_pin);
> +
> +void media_request_unpin(struct media_request *req)
> +{
> +	unsigned long flags;
> +	bool completed =3D false;
> +
> +	spin_lock_irqsave(&req->lock, flags);
> +	if (WARN_ON(!req->num_incomplete_objects) ||
> +	    WARN_ON(req->state !=3D MEDIA_REQUEST_STATE_QUEUED))
> +		goto unlock;
> +
> +	if (!--req->num_incomplete_objects) {
> +		req->state =3D MEDIA_REQUEST_STATE_COMPLETE;
> +		wake_up_interruptible_all(&req->poll_wait);
> +		completed =3D true;
> +	}
> +unlock:
> +	spin_unlock_irqrestore(&req->lock, flags);
> +	if (completed)
> +		media_request_put(req);
> +}
> +EXPORT_SYMBOL_GPL(media_request_unpin);
> diff --git a/include/media/media-request.h b/include/media/media-request.=
h
> index d4ac557678a7..c48cfb710959 100644
> --- a/include/media/media-request.h
> +++ b/include/media/media-request.h
> @@ -189,6 +189,10 @@ static inline void media_request_get(struct media_re=
quest *req)
>   */
>  void media_request_put(struct media_request *req);
> =20
> +void media_request_pin(struct media_request *req);
> +
> +void media_request_unpin(struct media_request *req);
> +
>  /**
>   * media_request_get_by_fd - Get a media request by fd
>   *
> @@ -228,6 +232,14 @@ static inline void media_request_put(struct media_re=
quest *req)
>  {
>  }
> =20
> +static inline void media_request_pin(struct media_request *req)
> +{
> +}
> +
> +static inline void media_request_unpin(struct media_request *req)
> +{
> +}
> +
>  static inline struct media_request *
>  media_request_get_by_fd(struct media_device *mdev, int request_fd)
>  {
>=20


