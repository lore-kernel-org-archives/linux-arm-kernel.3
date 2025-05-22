Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A632C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 18:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKDF0rG/fer+2OkTia/V0rbvp3EJG9E9bbf9h1+yVQU=; b=KhRWmd7h4sML8YMO4VQDbZj6RW
	lctE1gGCBRvw7tbZ2z7rtmg7WIYXakPVrbDlpIscmg8z9fvD2gjI5OcPIirxutqXc+2YxtwU/JMpW
	mQCz+CxdkUN7j/LrgHFd9PcelKhHc3/gFUBeNdnRlAUJ9cqG4p+MqEKjKeRK0tbidtd4Jv1UZjo93
	Tp46VqXxHrjPtqN1w73IxFHuTf6Kww5UtiTGe5jKhMZolxTMIvUMiW7ZT+cYmpnrTAk7SZKoOYRip
	SbXrI1OeTB51x+UbqAG01hSEcJRj3aQrrEJoggf/0GK5Y8Ome/c5tq5eqnbGbqBHPw7/BOJjkYmva
	OBebPtnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIB8d-00000001vYE-3xbE;
	Thu, 22 May 2025 18:59:31 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIB6a-00000001vKK-2kEX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 18:57:25 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c54b651310so1197750685a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 11:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1747940243; x=1748545043; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bKDF0rG/fer+2OkTia/V0rbvp3EJG9E9bbf9h1+yVQU=;
        b=YgBnXEjRR37EOd0iemWUOmQmUBETbZwOcxlxjZ3Y47bj73YBRvr1OSUDC5EyIvMRpG
         uu4xd7Ik23gEh1JnQ4wGOuTJLAaUZNQQDpzjzxW+ZLYOPOGb5unGsPYRmPfj5eqcOYbM
         wxmjjrs6h7pxhcnP3HincvU4+gkuhpRtdlN2g0siQPxKHRcm0KfVf8z3VpFJV1ELnKAh
         LWlecUhpuOVLqQSlEoKlUDMPxB7C7c6yQ8zk0HKTIzrV8BYk1OtfQR9aVIawoiUoZZnE
         treDNwxM74U/C7RHB0EKejgXrJq+oll5DMzQTTLZsOK8akb0SLerKy9U6HtDpT33I+z6
         Irbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940243; x=1748545043;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bKDF0rG/fer+2OkTia/V0rbvp3EJG9E9bbf9h1+yVQU=;
        b=RT62uTtfuTHThjEoHYwKjSnA73wsnhiKemjf6dG1vsXU81XLPh6DSxK6KorXzz/6EY
         tvqSxueYs8D2gUyg783Gdh4qSwNLPb3yi8jf3K5MGErOSYvLWP8NnvkNRWWQrzO6+HxW
         UtoHoEe37N1v7Jh6SHESqefVn6w3D7EwnZO36EnM6HidPMyEgpRLXEtxeHz/tf7dTujg
         HeoSi8YJthJs3MeL4KICE+Tljg1Ar7KjRN6GuOzDoTsuoT4VBJ5SgOACVii8KDUB4j3d
         KNDeYgsjmnzj77yIwFwBVGApv2xl+ADnzY1yqpc/F4UBjJ1aSTzkYkbj6SvndGC0urPl
         ShMg==
X-Forwarded-Encrypted: i=1; AJvYcCW+rsxAMYIlfIpZkrTVvT2hYoaSiF4WeZXOL/6yIrGLZhGZOlgt0nP6Bwucm1qVlrfYv0nitIkwzu++NPLrcexN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8AHER8dyQFX3NNfTEaimui6WlD0jjh1mD9VrGmZfS0a+4NXoc
	FJWLH/8pkGUE9vnL14YbVWP+v4H+IwHraA/V8upDSsZKMq0Bb1zND078I/6AMJRhm6s=
X-Gm-Gg: ASbGncu1ZR/WHBFAckzsHBddmvGNvpY5IyurBeqz3P8G4OKWW6ERwAwcHvAdSmhozkR
	oHVds/tDs4gN3BeZGaqHt9cbXnh2bI4MzyWcbDk21G7vawcvV6sVL8K8Zn611gWiyyd7FPBw9RK
	w917XjxiVGDiveEY6SdNCkEfbQ/gBCzpBhI27KYumz+V1EpSZ2RM3rln5Y709YAP5X+aWbF2qSn
	VhVIS9NuaBl49Ka8i2bnkA7LWJBDqF/KjSj9JzOkQDk9izTfh2dQiqsQ9bLAOE+ZhM3Qq/NZ81J
	hGdrJpnUIaDzo0IYPXlr8/Leges/IssNuOOh/lZ/0gsjtD1v0k4TF6yo
X-Google-Smtp-Source: AGHT+IGODjylhCbxxluSCJxWwfw2LSUZOhOlLONS1CCWl3mGWECFOnr+7cX5kbAgDceujcx1nVam2g==
X-Received: by 2002:a05:620a:400c:b0:7c7:a524:9fe9 with SMTP id af79cd13be357-7cd47f4bbafmr3554668185a.27.1747940243241;
        Thu, 22 May 2025 11:57:23 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::5ac? ([2606:6d00:17:b2fc::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467ecf98sm1060304285a.61.2025.05.22.11.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 11:57:22 -0700 (PDT)
Message-ID: <b97c254c5169acb32b9f65f71b363a3eb1cfc8a2.camel@ndufresne.ca>
Subject: Re: [PATCH 1/1] dt-bindings: media: convert fsl-vdoa.txt to yaml
 format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.li@nxp.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Shawn Guo	 <shawnguo@kernel.org>, Fabio Estevam
 <festevam@gmail.com>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
	devicetree@vger.kernel.org
Date: Thu, 22 May 2025 14:57:22 -0400
In-Reply-To: <aC9xv08a5k5Pz1t+@lizhi-Precision-Tower-5810>
References: <20250411213601.3273670-1-Frank.Li@nxp.com>
	 <174448105342.1415739.9619142538994119426.robh@kernel.org>
	 <aC9xv08a5k5Pz1t+@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_115724_692302_0EF56B79 
X-CRM114-Status: GOOD (  13.52  )
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

Hi Frank,

Le jeudi 22 mai 2025 =C3=A0 14:49 -0400, Frank Li a =C3=A9crit=C2=A0:
> On Sat, Apr 12, 2025 at 01:04:14PM -0500, Rob Herring (Arm) wrote:
> >=20
> > On Fri, 11 Apr 2025 17:36:00 -0400, Frank Li wrote:
> > > Convert fsl-vdoa.txt to yaml format.
> > >=20
> > > Additional changes:
> > > - Add irq.h and imx6qdl-clock.h in example.
> > >=20
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > =C2=A0.../bindings/media/fsl,imx6q-vdoa.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 42 +++++++++++++++++++
> > > =C2=A0.../devicetree/bindings/media/fsl-vdoa.txt=C2=A0=C2=A0=C2=A0 | =
21 ----------
> > > =C2=A02 files changed, 42 insertions(+), 21 deletions(-)
> > > =C2=A0create mode 100644 Documentation/devicetree/bindings/media/fsl,=
imx6q-vdoa.yaml
> > > =C2=A0delete mode 100644 Documentation/devicetree/bindings/media/fsl-=
vdoa.txt
> > >=20
> >=20
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>=20
> All:
> 	Anyone pick this patch?

Thanks for the highlight, this is stuff from before my time and I had not a=
ssociated it
with CODA initially. I've picked it now.

regards,
Nicolas

>=20
> Frank
> >=20

