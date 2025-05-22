Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026BFC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 19:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uAfLd2+eW+OIWxtnxvjxahlHfrrw/biV9Jvjs+l5fkc=; b=5BmgcdisxgQp8H1Pktm+jaMYb5
	jQv4vY4CKJ/DoCWf1LyNIdetngHPyQliFI58xqRy2CEB5jRepJ6R3muqHMxOe7AGK59ISjnjE0r/K
	ZLySSokc1MYHeH+XESFbf0p0pZS5HKCjSpAtbKhgo0liN3ZyHmZ4gYxIlI38Lipzh45+rk/ZMeKXJ
	m3SPPqo5ahbm/S0PcHPq/VxXfpcNzTfAJprX4rFT1uoON5H4dcog8s6gCAOz/Rr9iM8xSIe+AFR3X
	hNU/86btuf/hb9yR9DNBqIX+L/Zei/WF0QGcUOh9J2weMdrKm+wpj/n5PHrBidP4VKhJDYgrhFcY4
	CjJkX+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBZH-000000021Y1-3Bss;
	Thu, 22 May 2025 19:27:03 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBEx-00000001xLI-2SpC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 19:06:05 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6f8c53aeedbso118971336d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 12:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1747940762; x=1748545562; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uAfLd2+eW+OIWxtnxvjxahlHfrrw/biV9Jvjs+l5fkc=;
        b=1GeQAs0GoDemQsGc1jwjbzt5F19iVNY6Yant1LX0qTJBSRClRf+fM3Z3aQ6YT0M3gg
         EY/51jc+lDO9KSPUEFgl3PhUqjIdKhDxeZORplYHacYEOd6/rpxTtDIZO2Z8ccf0JIHj
         8nBh0DfofL1bX7exQLjl4syn+mST8S4vlIK0YBhQ7kXEE3NmtvF5A2gTAZB0cuNdv0yH
         /vmNTFO/AKGSySphPdEnT3lAReNmCEvN2hOC1dl+8QiDD8+QgYOGPsmSLhuKKHq5Z5+b
         91MygbR62e9g0xiPbzhMLFdLaPSGE8Eq/pouQGzmSfeNYmoyFEVRooZiUVBbLMPjNpbP
         XJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940762; x=1748545562;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uAfLd2+eW+OIWxtnxvjxahlHfrrw/biV9Jvjs+l5fkc=;
        b=mfcqthLgVdsrwR5n0T3SxMdgIZ5asptGdMv54OB6lpRF3lfvgE0vjdaFNBHYMpGIDi
         uHXJzFVLNTq+bTWE2ZBIYQEH/9ld1K2VX6T1W+ha9aeh9QdG94Ez2WXt951OLDXCWMKI
         rlP0pOQ/PRL0Tq87cz48W1I3V2BnMvDQdLCV+dQNbPLMp3HauipqdP3uchMsOcmwdx3F
         HNzyXgrUcMth8NzKVqLZIphj4RGeGbbYjJvx6SZD2dqMmMZcY/PUgUF5EHmXGHIanyjB
         D0LyYpY67SMKDrfAKiNTAAvp65VcaZ5ycsN2jGocbKrlVU+jka/PXEGY9Tsq44SxD+Oc
         Cwcg==
X-Forwarded-Encrypted: i=1; AJvYcCWUCGV9YMVPbc85iUx3jvKoHCKRDGctIOCWeHeI1SvfBF1GM/L2axO2sbOK2aKZKurCBYPmbOrI45ifCQnbEjuM@lists.infradead.org
X-Gm-Message-State: AOJu0YyrdlJhPRYf+ab1khPc1VzrMlCCnhoSpxQJ1mEpxn2oe078Czeu
	uE43KUfjQqOyiAEB8vuFrFj4Rc+MPZhGDRQ1Zw06m7hoYqyHJmEr15v4k4q6oxyvYcY=
X-Gm-Gg: ASbGncuomzBBnyk+RQJHqBshVr4C7Up/l+TGSCo42jFbjyjNCOu3743e40Lg4ASqx7f
	Ii3dy52QL8vhBrKA15kda0NVHTxRnf+rHlWPPiVF4kluz9vlOTomTfNQPTVMxDU5N5Csaomia9Z
	KJrzTQHKph6qSbOGsUi6Azc1DadC/6m6zWbRkrn1WkM30DOTasZmx60dKklm93IfEFrCp0xM6gx
	txtHmEngJLM4UbL6N+sp+CIaJV+BntjFRp6jikfbyAy9OTfxdanV6lSgmiGlWmuS0UZquBY8bc0
	Mf8JvMUVZT32yhwLyFJSoLe1C9+Q9DaD37PClq+kqcvVWZKDW0KPB74z
X-Google-Smtp-Source: AGHT+IFMHoWCgYSKrp77j14dN4ezA6lfoJ+4Q+N0FgBs+1y4jyW6o9IHP3m48s9bZ43HqbDB/3wpZw==
X-Received: by 2002:a05:6214:402:b0:6f2:c7b0:3b16 with SMTP id 6a1803df08f44-6f8b2c32addmr375505626d6.6.1747940762274;
        Thu, 22 May 2025 12:06:02 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::5ac? ([2606:6d00:17:b2fc::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b096dda9sm102909986d6.71.2025.05.22.12.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:06:01 -0700 (PDT)
Message-ID: <8b18533170e7ba395c574de69768dcc27f718767.camel@ndufresne.ca>
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
Date: Thu, 22 May 2025 15:06:01 -0400
In-Reply-To: <b97c254c5169acb32b9f65f71b363a3eb1cfc8a2.camel@ndufresne.ca>
References: <20250411213601.3273670-1-Frank.Li@nxp.com>
		 <174448105342.1415739.9619142538994119426.robh@kernel.org>
		 <aC9xv08a5k5Pz1t+@lizhi-Precision-Tower-5810>
	 <b97c254c5169acb32b9f65f71b363a3eb1cfc8a2.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_120603_755532_7890F518 
X-CRM114-Status: GOOD (  17.52  )
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

Hi again,

Le jeudi 22 mai 2025 =C3=A0 14:57 -0400, Nicolas Dufresne a =C3=A9crit=C2=
=A0:
> Hi Frank,
>=20
> Le jeudi 22 mai 2025 =C3=A0 14:49 -0400, Frank Li a =C3=A9crit=C2=A0:
> > On Sat, Apr 12, 2025 at 01:04:14PM -0500, Rob Herring (Arm) wrote:
> > >=20
> > > On Fri, 11 Apr 2025 17:36:00 -0400, Frank Li wrote:
> > > > Convert fsl-vdoa.txt to yaml format.
> > > >=20
> > > > Additional changes:
> > > > - Add irq.h and imx6qdl-clock.h in example.
> > > >=20
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > > =C2=A0.../bindings/media/fsl,imx6q-vdoa.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 42 +++++++++++++++++++
> > > > =C2=A0.../devicetree/bindings/media/fsl-vdoa.txt=C2=A0=C2=A0=C2=A0 =
| 21 ----------
> > > > =C2=A02 files changed, 42 insertions(+), 21 deletions(-)
> > > > =C2=A0create mode 100644 Documentation/devicetree/bindings/media/fs=
l,imx6q-vdoa.yaml
> > > > =C2=A0delete mode 100644 Documentation/devicetree/bindings/media/fs=
l-vdoa.txt
> > > >=20
> > >=20
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >=20
> > All:
> > 	Anyone pick this patch?
>=20
> Thanks for the highlight, this is stuff from before my time and I had not=
 associated it
> with CODA initially. I've picked it now.

Actually, before I do so, any of the following warnings should be addressed=
 ? I effectively don't
see a clear entry for that bindings, but could have miss-read and there is =
a second warning,
which based on having Rb is likely false positive ?

---
[[ATTACHMENT|junit/./0001-dt-bindings-media-convert-fsl-vdoa.txt-to-yaml-fo=
rma.patch checkpatch.err.txt]]
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#21:=20
new file mode 100644

WARNING: DT binding docs and includes should be a separate patch. See: Docu=
mentation/devicetree/bindings/submitting-
patches.rst

total: 0 errors, 2 warnings, 0 checks, 42 lines checked
---

Nicolas

>=20
> regards,
> Nicolas
>=20
> >=20
> > Frank
> > >=20

