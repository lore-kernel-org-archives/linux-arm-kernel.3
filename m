Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C922C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 19:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vavngEW490W1TVlna35U5JsoXyvTKiOlogApqdvOnX8=; b=ISGjvkKkcEkB6Wq82kcnMJwYa+
	yOOaiwwjnppF2Ni2rXF/KFcjIzMK9BN0yp0iGauO/CT0WVu3yZuE39fcWbVgfFVRdWTu+WI/tjadU
	rzpgzD6lm6F9i8SAAp9ttb+4y8pATGfaos+JkovkGKSsyppa02DgX9FdJOhvCKHirKSzhm6JDIPIg
	TlNp7INwT86pCmGLXbf9+LrVYbUFIkqmMH3l7Swlyl6b5XTB1N6YyDZn7rXuP1RpAi/XUKIoxcMby
	6s36IaaIB2R38uEONPhk6Gy8xY7rwSxSG2VsHCIOe7uZ+HyJXrlpBDkrYkN9Lnlw/1RNan3rqvDfs
	aD1vg3lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLHD-0000000E8fw-02lO;
	Thu, 19 Jun 2025 19:50:23 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIsO-0000000Dm40-0ABt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 17:16:41 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6f8a87f0c0fso9473316d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 10:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1750353394; x=1750958194; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vavngEW490W1TVlna35U5JsoXyvTKiOlogApqdvOnX8=;
        b=YkrPkbIt4JPGk2hPdZBok86BzfN2IO/e1r6c2rTG7eUqUMRCY09rursyV8rOMSt4gb
         7n4KohvEB97TdTohTlgKcqTROpWWbu5eQ2MPm4Yt6HCYW8JdPtUerkfOwTdFvhgnrywE
         uL6wWTNBK1liAPJS9mMHd6LAWBZdADF7TRD7uUTldjVGVn0E7Eg8LjQx2wWfdslcbmhD
         8O7Fb5IEqEJAEbGmKVpph4mDZf53sHy9kl1nObRq4Hb/MKVJpbHdXs3/+89uTjsp7rL9
         wHv5fqLqDP5moVD0O4VKCARDEtCGQwgrTNlq+ISDoFFsQgdPuF0NKem1+u81C3nUB6ax
         MOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750353394; x=1750958194;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vavngEW490W1TVlna35U5JsoXyvTKiOlogApqdvOnX8=;
        b=rx1lTLCz0BQWLUg600UCgU0M5QHVgmXv3wYAXI9AxN7GhawCLA+/FEoBzgMs+J2zjT
         xdAAPC2frd5yk7I6OxcvW5bjg/Pj5xHn+32Uka3di3HN7Tms5UJrKMnjR5hUOJMMuTMX
         dKIIQNLjEIMMrm/52/3n0teNRQg/m8+DGzM3TfCni9sJVWTybMNWn3441tYqZYpZ3k7D
         ZR/bzmWBX/KnFZJdLx1n0EmYB3T99v7XQ8x2zHq4ANX4t7RYWkzEkhzYS3vjNtrUiyJU
         MoO5huK6Zhg/p9iKeyHZXlLpclztzr91TktXyzqawmV2onysr9lVN9euXxVrfVAcqQT6
         WxNA==
X-Forwarded-Encrypted: i=1; AJvYcCXJxfbUKwFxYXfrlOo94KAHMzwyfJAWz1q50+CE4YfJ7qz0CbFUIJjZzj0SAMV1cOnVMmCLd0Di/3o1qWe4nqyg@lists.infradead.org
X-Gm-Message-State: AOJu0YzpjhBJlEhl8hUTvGMn4WZl7qH0gffEhu93rhxjgzKQei7qhAF2
	B7tnv4eUKS39Krzk8wsiof77XRnOQSVYbQHi2Lyjtfg/BZn7lmb9sWBmUJTTjkaL798=
X-Gm-Gg: ASbGnctWRpP6wepEPCyJbjlMfthOc5V2LMe8i6mzdwwk2AnWeEPMXFJe6/z/GPjm+UL
	rzj8udYNNbn4hpnIyOOLg1h7Di/qdIXtjP8IQK7uJhNuocpzH3PsX6IwoomSMGOwheSGinNxfbf
	rQtO4PZ4HYEcovJxdbunJxQ5YzD63zt1aDW4GOoKG2RoYU3PcS4EzNK8VinnWJkYMS1Br3rhpLu
	h3HD1MrEQFP2wKywlcZvjaHPz0vSKqxJOFzc2bEm26K0iZQlRTIck/azU6qTrdj3XL+XfhUkDtY
	0MduIpHgdFqrSxunuxB9UOE/ctUPTZ626GXmGMBZdaEyvzNPtqzyueE+IK3GADUz+ek=
X-Google-Smtp-Source: AGHT+IFZGR1oLZzp6cLHcCiYls3uKiELGOeDzcSxdXOkGm/XLOLstBIyI7bjhXg4re8Xuf3yDJehIw==
X-Received: by 2002:a05:6214:540c:b0:6fb:4e46:7f3a with SMTP id 6a1803df08f44-6fd0a4d68f5mr760206d6.16.1750353394282;
        Thu, 19 Jun 2025 10:16:34 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::5ac? ([2606:6d00:17:b699::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f8e4b0f7sm19537985a.67.2025.06.19.10.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 10:16:33 -0700 (PDT)
Message-ID: <d46d73f84e78daf152962ffb5cce7dd3ae0920d1.camel@ndufresne.ca>
Subject: Re: [PATCH RESEND 1/2] media: dt-bindings: nxp,imx8-jpeg: Add
 compatible strings for IMX95 JPEG
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Frank Li <Frank.Li@nxp.com>, mirela.rabulea@nxp.com, mchehab@kernel.org,
 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, 	s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, 	krzysztof.kozlowski@linaro.org, imx@lists.linux.dev,
 linux-media@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 ming.qian@nxp.com
Date: Thu, 19 Jun 2025 13:16:32 -0400
In-Reply-To: <aFORokzx/sImgDtA@dragon>
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
	 <20250521173444.310641-1-Frank.Li@nxp.com>
	 <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
	 <aFORokzx/sImgDtA@dragon>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_101636_267635_6DDBA47E 
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

Le jeudi 19 juin 2025 =C3=A0 12:27 +0800, Shawn Guo a =C3=A9crit=C2=A0:
> On Fri, May 23, 2025 at 07:22:04PM -0400, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le mercredi 21 mai 2025 =C3=A0 13:34 -0400, Frank Li a =C3=A9crit=C2=A0=
:
> > > Add compatible strings "nxp,imx95-jpgdec" and "nxp,imx95-jpgenc", whi=
ch
> > > are backward compatible with "nxp,imx8qxp-jpgdec" and
> > > "nxp,imx8qxp-jpegenc". i.MX95 just need one power domain which combin=
e
> > > wrap and all slots together. Reduce minItems of power-domains to 1 fo=
r
> > > i.MX95 and keep the same restriction for others.
> > >=20
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >=20
> > Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> >=20
> > Krzysztof, will you take this one once the DTS part is ready ?
>=20
> dt-bindings is the prerequisite of DTS.=C2=A0 DTS patch looks good to me
> and I'm waiting for dt-bindings part to be applied first.

I was waiting for sign of life on the DTS part, we usually get some ack,
which is good sign we can take the bindings.

Nicolas

