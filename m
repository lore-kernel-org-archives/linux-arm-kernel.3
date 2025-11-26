Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B932D10389
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 07:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwb4gEZQsVssNNQKKaHnFD1mEjqfKdCKrDRZhkYlGCU=; b=FsbLavUQVgnJpDB5lfepx/XOnT
	fmlEyh4Tke0FljkcxyMtbSyD5rF7CyUM0R8UjQMzVvj8HCailvWJgeOFomUCK5pv5YWhPtPnTHJpu
	kn9RvmhJrHB4Zn0kNoqkRIwpvNHuiLN3b5cep62PUjOPV+Q71WQ5AGHdMD10yqTkfSHrGdzzBk/TL
	pPp7IAh0c7bob1GJYayMQLAnFI9q4R6BxFdIgLZJfGiJ//IbBzE5kqAxeJNQPQzHnw7as7Pyo/JZo
	Wwe8Dz0LTypD+FjuiuFK4i0bS0DH+Asv6uwxtyTKLObJ3NYOXCH/KcQGsveUyXSwN4++XHIjryJ3D
	+u1wbYfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOA4e-0000000EWp2-3mHX;
	Wed, 26 Nov 2025 07:36:24 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOA4c-0000000EWod-3KqC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 07:36:24 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-42b39d51dcfso3823318f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 23:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764142581; x=1764747381; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uwb4gEZQsVssNNQKKaHnFD1mEjqfKdCKrDRZhkYlGCU=;
        b=H5KLOixdP5a+R/6hKS0hidAOgXCkiwRFQUkScGexy+q7vgMzsBZOHm6jgm6NVy51+2
         kdtPOP4oAOS23FP4AiUogH43ChkkEN2/VRz0dG2pql8TF5E1Jf2i7utPqAcmhLqIwiNA
         zcrbeyjj4jRruS1lInnNIbXL+QuGzD1ckNLhZQm2ooqzP8S3meOZTZ6uf4hJko+my2Tf
         R2A+v2z/+yFm6CKuxOQW261xL8JBG1s05vjqygiY9Un3vPFY2OrhWKXtMDh7gW13dbiC
         p3mpSgRxoefNAH14HTbzBnXIfJhcqIHWhNa7HGWe5Fwxh6eoujafQd4yftLkImHVVZxj
         6Bvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764142581; x=1764747381;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwb4gEZQsVssNNQKKaHnFD1mEjqfKdCKrDRZhkYlGCU=;
        b=nfNHIXiLmYtXidsNwZLE85/v1zlxkF2ZSlAYhuJ9jfMyF2ZOCJ0lbfcL5X/BvNdCIo
         udLRmWIXd4fUGhCsfPxeyrFFaYpsPXKPQUtgSJfk5pWBCuQIC2HYIA4JE5BAa4pDErQx
         0IjOzytxICraDbpN5Jj8722uFj7QwW7xAMiK8h/i+GIywuHXpk+GPkGxc8B9Qi8yqkY2
         ZCzpja80AB2ig+sohY2BSpfrf2XMlWeVq4L48Hpa9/ZpvOdE2o0NGdgZ2XXnCuDhJkHS
         w4oAbPA0ulVnhEwrwp/6Hode7pz7/94KCKLMncktykonJncHr6O9ES8vsLKDdbVAuRRo
         XRqA==
X-Forwarded-Encrypted: i=1; AJvYcCUYASE+QpaCmjhnUHPeafD8vhmHB7cctAS1AtEGvLfruo0hUVGQTpqFz20YaU3DhGcx02a34htWmjwM9Fdqzw/2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9LTQW8op5wQdvV/YHKW/1kdEM97AEk9AI60UqG3N8UZXuVCjJ
	9Qh3m4mbqxeF4Kp0wvf9S+UPGJ9BoucWR0qwL+3kKl/0qZ8Cmglz6bACcOH/QJII7DU=
X-Gm-Gg: ASbGnctBX04pcbLFl2mraW9wHQCvaUUVDVvTBXXzomT+jhuP/cRxQRmQjSvCEx9i/m9
	pROIsogvJFEU29lwJTjkf1wdXRhfqTGaXMax6uZexhrwfy7GFxs1O+t21gJO65tM/FDDqgfYaYK
	qXmDqboDgnx12Y7ZB3G315a+2815eMM2bxroGCMy5z3TBA/gveKrv5gVp1BlViWLBdjGwayWABn
	fdD8TC/IVzAW7Oji2LDmrXxMOJvmPUuqL0FenzCrw6DkmYhKx0tvJoa/p1sqYsjdewxQFik0luY
	KEWZIVqCREuEZTjou6cviAilPCEjux9lIjjKweefCIcB7OumhpBc4C2LY9Q43w6JvAKH0pDAPIr
	PvfpYg1AvJx2WlRqKUdPM2OBL4KDqj0f+kjbvszntsFKX7+VsOCe722u4uqkGKIzdA1HKBW81OI
	Jhck60Vk2S6RQ5QhbF
X-Google-Smtp-Source: AGHT+IEkJIVmft0K1+fBvK9APlqevDyQqqLhuiwQwAv9PNhWzAVjw6Cn97feu3xnWTKXQ+ps5Ed2JA==
X-Received: by 2002:a5d:5f91:0:b0:42b:3bc4:16e9 with SMTP id ffacd0b85a97d-42cc1abdf6amr18484142f8f.4.1764142580820;
        Tue, 25 Nov 2025 23:36:20 -0800 (PST)
Received: from draszik.lan ([212.129.87.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb919bsm38547158f8f.34.2025.11.25.23.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 23:36:20 -0800 (PST)
Message-ID: <1fafb9117a9faa32222a55efc77794156635d105.camel@linaro.org>
Subject: Re: [PATCH 4/6] mfd: max77759: modify irq configs
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Amit Sunil Dhamne <amitsd@google.com>, Sebastian Reichel
 <sre@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Lee Jones
 <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Badhri
 Jagan Sridharan	 <badhri@google.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>,  Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar	 <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Wed, 26 Nov 2025 07:36:35 +0000
In-Reply-To: <e25ff0e5ff103433942fc7744eea4a3c61ce1daf.camel@linaro.org>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
		 <20251123-max77759-charger-v1-4-6b2e4b8f7f54@google.com>
		 <5c901a6c831775a04924880cc9f783814f75b6aa.camel@linaro.org>
		 <aa7bdeb1-c8a9-4353-af56-869f16a083c2@google.com>
	 <e25ff0e5ff103433942fc7744eea4a3c61ce1daf.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_233623_019932_5654DAB0 
X-CRM114-Status: GOOD (  20.68  )
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

On Wed, 2025-11-26 at 06:44 +0000, Andr=C3=A9 Draszik wrote:
> Hi Amit,
>=20
> On Tue, 2025-11-25 at 17:10 -0800, Amit Sunil Dhamne wrote:
> > Hi Andr=C3=A9,
> >=20
> > On 11/23/25 10:21 PM, Andr=C3=A9 Draszik wrote:
> > > Hi Amit,
> > >=20
> > > Thanks for your patches to enable the charger!
> >=20
> > Ack!
> >=20
> >=20
> > > > From: Amit Sunil Dhamne <amitsd@google.com>
> > > >=20
> > > > Define specific bit-level masks for charger's registers and modify =
the
> > > > irq mask for charger irq_chip. Also, configure the max77759 interru=
pt
> > > > lines as active low to all interrupt registrations to ensure the
> > > > interrupt controllers are configured with the correct trigger type.
> > > >=20
> > > > Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> > > > ---
> > > > =C2=A0=C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 24 +++++++++++++++++-------
> > > > =C2=A0=C2=A0include/linux/mfd/max77759.h |=C2=A0 9 +++++++++
> > > > =C2=A0=C2=A02 files changed, 26 insertions(+), 7 deletions(-)
> > > >=20
> > > > diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
> > > > index 6cf6306c4a3b..5fe22884f362 100644
> > > > --- a/drivers/mfd/max77759.c
> > > > +++ b/drivers/mfd/max77759.c
> > > > @@ -256,8 +256,17 @@ static const struct regmap_irq max77759_topsys=
_irqs[] =3D {
> > > > =C2=A0=C2=A0};
> > > > =C2=A0=20
> > > > =C2=A0=C2=A0static const struct regmap_irq max77759_chgr_irqs[] =3D=
 {
> > > > -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0, GENMASK(7, 0)),
> > > > -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1, GENMASK(7, 0)),
> > > > +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0,
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_A=
ICL |
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_C=
HGIN |
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_C=
HG |
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT_I=
NLIM),
> > > > +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1,
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_=
BAT_OILO |
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_=
CHG_STA_CC |
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_=
CHG_STA_CV |
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_=
CHG_STA_TO |
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_CHGR_REG_CHG_INT2_=
CHG_STA_DONE),
> > > > =C2=A0=C2=A0};
>=20
> You should also add the remaining bits in each register here, so that the
> regulator-irq can mask them when no user exists. It will only touch the
  ^^^^^^^^^^^^^
  regmap-irq

A.

