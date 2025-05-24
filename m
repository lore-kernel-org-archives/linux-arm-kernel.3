Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFD9C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 00:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3vQxLcTpDMFbmhqz80TZkS1cBKQmNM3Hvh7L+Ojb0c=; b=4dI/fK1B8hB42HgzjHnNvb0kKd
	zFJQSKoi8ZkAaXmh12HKs6PwA40DQiMf72AM6LDNQODfq02ypNW3uKpEsxIBRh8p6iL0a80Yg340R
	lfIpoL/wxSuWucYdHZSzEl2gYuEdZ7rdDsbzmZ3nGC3Xee5/PUfNB+gXsGV0kGNl8wUZ8MtOzpHvb
	e7QOW/dK6hBf9JLMdOjwKim2Zakx0VtfVkkdmCtH8d7xiT42qqmXoMFNxlZDslkTkvDiTTGvp8OSw
	E7gK6SPLNcMlX6RCUc87kREVrJgfK2/7ER2TjP9TkPQi87fv8b90IjhrjHFu/T3dO00pUMmRnq/3i
	pQq618zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIcoT-000000057pw-04EI;
	Sat, 24 May 2025 00:32:33 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIcmK-000000057bg-3qBv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 00:30:26 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7c597760323so31914585a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 17:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748046619; x=1748651419; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z3vQxLcTpDMFbmhqz80TZkS1cBKQmNM3Hvh7L+Ojb0c=;
        b=FLLHbX3K0s9fCqizsnxwkejR7+Yu6zc+yLNqO1VekLOGNRcMnfB5uYDPjunAlM3S4S
         UX6D8wkWUzUOyjLFIyX/t7bwfP5ScevjkF12+gucbROweKo4v6aOl6Mb1j/pArwLJGAK
         g6cT/qr+5KfrVVSbX67avn7I5S0KE8iDTnQ7ZwPwNYNRhqRFDR8v7nvvzPw5bzXXLf/m
         nzIYv7ftPLcSboRkx12ZerMEzo5ZiF9EMF8WDrxd7IDWR2QRaKscKmKcPTvDaVMZqiUY
         O2/w96kB1YXy+qcUqk93xQ7JuCBmVKpjmz4Vo7JByWcXwIDaC2kn4S8m7ZJaqtj+isW5
         vNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748046619; x=1748651419;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z3vQxLcTpDMFbmhqz80TZkS1cBKQmNM3Hvh7L+Ojb0c=;
        b=ehdfD5agUV0+yeEOMVWTtHjKiOx2GAnovBRW61nmn8R8F842FbaPxHXNkKJOExK309
         JthlAX4CFnDbScZKhWg9qhyjFkQJzWe9k4XGPtKk7QYKx1d2yXlOXjZZIZROCznK2oMa
         V1lmLciHwnyNHfPlIAGpXjZ1KwubtaENbulPImpzO/t7bW6ILYLp2+eOKUoyucarnRY/
         l9Y6UEjmcpmIqt9CXqiyU7fqEzLRMgz+5O+OkOvEcbyz+lCAhrcn1XR9tkuudgjtWN6k
         hEn7cspQpJ+O/lYlPS0fdlES6T7xfc4upJyTzECY8LGna7zisQvkjul6oj7I+S88FywB
         ngUw==
X-Forwarded-Encrypted: i=1; AJvYcCXnw9nnTcH0nQwAALmPq+bh0dN9t0dn7vce1tC7mq86X6aJ79M4R+Wcfqo8nleQIC9nyHfegCwMyQim0tG3jYFn@lists.infradead.org
X-Gm-Message-State: AOJu0YwdtZmaCVM9WGoywwhTGuQxlsS7DCY02GEKvxX+BWejjCSHfPwH
	/M1p91lTMCkcSwRvQ6favOr8Oew6MRezNt0rNTxZetGfgpyW15LBwis5I4jnMX4MC0o=
X-Gm-Gg: ASbGncsB3U2KjSRxIKr+iBiu3plc1TrXbagAChBdkUOlBT164xmTMlaV2I0r+Zi/3uP
	pF4Xp4k/rUYJ3/rD0vqzbu2dDT8oprfXYC1EReeIFwteyN3u7t09JrdzEYK7WlRGpvxntsW1m1w
	NANttnW6gmFrxppPikycLQ5TSVmk1tZJj6GhJqw0nCysvT4QvhlWgGt331+q5AjjAtuJtDaNFC3
	fm57fthYXQFZRd3v+VpGVJN0dPoQzm0mhRM8msJ2GcMLCoz++pq6to/9aXYJ8lAp0KHKeqQqAJW
	Rzu41H9NJ0z/0DBWXObAEKArXZCd249oDiWLL5suLqFHUSS8uikm0kI/
X-Google-Smtp-Source: AGHT+IEdDR8OXzB8US60Ph044RM+6ozSx842gNCE6DrnFPv+fhbjtE54fFC5D64DrrpFCuVDHM+uHA==
X-Received: by 2002:a05:620a:45a7:b0:7cd:53cc:c60c with SMTP id af79cd13be357-7ceecc2b5d3mr205043985a.37.1748046619377;
        Fri, 23 May 2025 17:30:19 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::c41? ([2606:6d00:17:b2fc::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468b7400sm1254895885a.66.2025.05.23.17.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 17:30:18 -0700 (PDT)
Message-ID: <b1d8b6407bcaea4e12ff1c6c206c8d3b591ac2a9.camel@ndufresne.ca>
Subject: Re: [PATCH v3 1/5] docs: uapi: media: Document Raspberry Pi NV12
 column format
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
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 23 May 2025 20:30:17 -0400
In-Reply-To: <20250423-media-rpi-hevc-dec-v3-1-8fd3fad1d6fb@raspberrypi.com>
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
	 <20250423-media-rpi-hevc-dec-v3-1-8fd3fad1d6fb@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_173021_219617_5E92F4F8 
X-CRM114-Status: GOOD (  15.21  )
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

Le mercredi 23 avril 2025 =C3=A0 18:20 +0100, Dave Stevenson a =C3=A9crit=
=C2=A0:
> The Raspberry Pi HEVC decoder uses a tiled format based on
> columns for 8 and 10 bit YUV images, so document them as
> NV12MT_COL128 and NV12MT_10_COL128.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
> =C2=A0.../userspace-api/media/v4l/pixfmt-yuv-planar.rst=C2=A0 | 42 ++++++=
++++++++++++++++
> =C2=A01 file changed, 42 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst =
b/Documentation/userspace-
> api/media/v4l/pixfmt-yuv-planar.rst
> index b788f6933855..b5b590f234b0 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -827,6 +827,48 @@ Data in the 12 high bits, zeros in the 4 low bits, a=
rranged in little endian ord
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cb\ :sub:`11`
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cr\ :sub:`11`
> =C2=A0
> +V4L2_PIX_FMT_NV12MT_COL128 and V4L2_PIX_FMT_NV12MT_10_COL128
> +------------------------------------------------------------
> +
> +``V4L2_PIX_FMT_NV12MT_COL128`` is a tiled version of
> +``V4L2_PIX_FMT_NV12M`` where the two planes are split into 128 byte wide=
 columns
> +of Y or interleaved CbCr.
> +
> +V4L2_PIX_FMT_NV12MT_10_COL128 expands that as a 10 bit format where 3 10=
 bit
> +values are packed into a 32bit word. A 128 byte wide column therefore ho=
lds 96
> +samples (either Y or interleaved CrCb). That effectively makes it 6 valu=
es in a
> +64 bit word for the CbCr plane, as the values always go in pairs.

Could be nice to mention that this has a verticalement alignment of 8, allo=
wing
to represent it as a 128x8 tiled format with a column layout. This was hand=
y for
the GStreamer integration your showed me.

Nicolas

> +
> +Bit-packed representation.
> +
> +.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3=
.2cm}|
> +
> +.. flat-table::
> +=C2=A0=C2=A0=C2=A0 :header-rows:=C2=A0 0
> +=C2=A0=C2=A0=C2=A0 :stub-columns: 0
> +=C2=A0=C2=A0=C2=A0 :widths: 8 8 8 8
> +
> +=C2=A0=C2=A0=C2=A0 * - Y'\ :sub:`00[7:0]`
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Y'\ :sub:`01[5:0] (bits 7--2)` Y'\ :sub=
:`00[9:8]`\ (bits 1--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Y'\ :sub:`02[3:0] (bits 7--4)` Y'\ :sub=
:`01[9:6]`\ (bits 3--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - unused (bits 7--6)` Y'\ :sub:`02[9:4]`\=
 (bits 5--0)
> +
> +.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3=
.2cm}|
> +
> +.. flat-table::
> +=C2=A0=C2=A0=C2=A0 :header-rows:=C2=A0 0
> +=C2=A0=C2=A0=C2=A0 :stub-columns: 0
> +=C2=A0=C2=A0=C2=A0 :widths: 12 12 12 12 12 12 12 12
> +
> +=C2=A0=C2=A0=C2=A0 * - Cb\ :sub:`00[7:0]`
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cr\ :sub:`00[5:0]`\ (bits 7--2) Cb\ :su=
b:`00[9:8]`\ (bits 1--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cb\ :sub:`01[3:0]`\ (bits 7--4) Cr\ :su=
b:`00[9:6]`\ (bits 3--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - unused (bits 7--6) Cb\ :sub:`02[9:4]`\ =
(bits 5--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cr\ :sub:`01[7:0]`
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cb\ :sub:`02[5:0]`\ (bits 7--2) Cr\ :su=
b:`01[9:8]`\ (bits 1--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cr\ :sub:`02[3:0]`\ (bits 7--4) Cb\ :su=
b:`02[9:6]`\ (bits 3--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - unused (bits 7--6) Cr\ :sub:`02[9:4]`\ =
(bits 5--0)
> +
> =C2=A0
> =C2=A0Fully Planar YUV Formats
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

