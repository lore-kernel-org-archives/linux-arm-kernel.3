Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404BBD0BB46
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 23:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FH7t34m9dnmNlx93O1yGS5tEDefFHyWRqMdXdmIkhjw=; b=yi3KhkJY6atoYl5dd7uIHRxM7B
	Amq8qEgHunXODXjqVS3fbiBgrjPAufdozdZ1jeX6aW5bxiEr0LUP0iz1svI03xjHVFvJfes5vZaZS
	Lgqa6lOjDgZP4yolQwVRKFg7hkAljSptcgsQXigJOmkOE6V1WThNnTVwqrgnjWwzx/i1+WdnJzxYP
	ZgWHXg0qVew4n9KThFDbUB/FaHuBmICFqkOsFeWtIXqyieXFZpyImRnO8nd0e37qdXkgvL3bIeLVK
	XEKGls2XAYsr7M9OWVxAXs2tQYzPHsUi26DeMqZ4g7ca8Mr1LvLWfgitifeSkknpKbeKmOQDXirKU
	f1GxVblw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3l3u-0000000GFp9-3TTV;
	Wed, 23 Oct 2024 23:46:47 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3l2N-0000000GFhS-0hFz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 23:45:12 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so407901e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 16:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729727109; x=1730331909; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FH7t34m9dnmNlx93O1yGS5tEDefFHyWRqMdXdmIkhjw=;
        b=CLJu623jye9w6tO6PvKlGYQ0RIFfLJP/xVYQH2PEoFKdlppxO1OmxfjOS76yfly6tM
         V2v/jASfL+D+Wl0nMkR5I8BMB39H64kQ0uXb1M9Qp1iYhLP3sezoCrtaXItR2lY0izon
         Cbz3cgNKvGUVzSi7ILsIBOWRWjwlrDl+Fc8hzPnvzp04YqB/cChbXXacjvFq1RTJJm/V
         W5V10luIMKpodl058RQwAAKaPF8JU0SpKuHza5mI/gjUP/5eZcpBzjTyAH8mKk37q0FD
         dEPGzqCJ1usuBBQgw2NTDPK5kWkx4EK0pVyxp9UYU3z4ChxihzdE3wTdUM8+TQAlmjYq
         S8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729727109; x=1730331909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FH7t34m9dnmNlx93O1yGS5tEDefFHyWRqMdXdmIkhjw=;
        b=iFRbrK5KbPQAju0wvQUksual2IewwMTFSEVIfV2xOfk/G9LQjfhJ2ydI6zup1T4AlK
         k0UVdnuUmAbrEd08Q/nuOx3VGrdlXPX6lQPp6+TWRAG54w9spXjoelFpeEUMh2gNS+1d
         BIKBwJQKaUOFSUt4l6zt6Jdvn7vyVBNnUBW6lZUY3yma1L3Upt3PVIhbc2Ok6vl8EzGH
         GEkjV+VqJtFW2sU8LPL82w1O46jPhL/zJ9/6of8aidSKIMEolPmlcZU5pBSLGnOzZ7hb
         LTF3ZhPhECIJMH7PQAW98ZV73G/tLeHrMh418DQWABODl9Vs/9++SjfmgCkU7ueNEmnX
         yo7w==
X-Forwarded-Encrypted: i=1; AJvYcCVU7Di1c3Oz8uDoYcTJpUnd7x4EaUvJety6Hm0XbojkhE97d9sZDTX+tKXm0BKljhOTbMHnJuhb+jS/oadNOxtr@lists.infradead.org
X-Gm-Message-State: AOJu0YznNkSb4YnyXoRznhbzQ2hqw/d/6DcYH62Fm4w5eFvlCywagZ/7
	MY5WMKIz32icKXuFpgBA7uLldBWbeuSRdqfmM7OgVHuSGaRZ2R4jaIatbdoeDI3GMZkmCbffovJ
	fcBc/Za+U0iw0DaXyOUWntOlcdZEMdmHM
X-Google-Smtp-Source: AGHT+IEASdtebovTt/XdTVLz8Q7Z69ffMVx0+m03VPWdJ2zICo/83A8gUVc3cJP1yjUZ/fTdn/o+yvavDg7XA0S174U=
X-Received: by 2002:a05:6512:31c3:b0:539:8980:2009 with SMTP id
 2adb3069b0e04-53b23e37dfemr7297e87.36.1729727108832; Wed, 23 Oct 2024
 16:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20241023221112.1393280-1-Frank.Li@nxp.com>
In-Reply-To: <20241023221112.1393280-1-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 23 Oct 2024 20:44:56 -0300
Message-ID: <CAOMZO5AL9nFHbcLe9HP8Rf99UBX-Pk76xc1zU8TaLgA1tgNH-g@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mn-bsh-smm-s2pro: remove undocument
 property 'clocks' for audio-codec@18
To: Frank Li <Frank.Li@nxp.com>, Michael Trimarchi <michael@amarulasolutions.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_164511_230950_6C31A828 
X-CRM114-Status: UNSURE (   8.11  )
X-CRM114-Notice: Please train this message.
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

On Wed, Oct 23, 2024 at 7:11=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Remove undocument property 'clocks' for audio-codec@18, which compatible
> string is 'ti,tlv320dac3101'.
>
> Fix below CHECK_DTBS warning:
>  audio-codec@18: Unevaluated properties are not allowed ('clocks' was une=
xpected)
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

I have already submitted this change:

https://lore.kernel.org/linux-arm-kernel/CAOf5uwmg83-TVQvbNOCnzBh9JdQAC=3D5=
hpgbCeT-6qJ=3D+YBrssg@mail.gmail.com/

I am waiting for Michael to test it.

