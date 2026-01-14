Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A7ED30CDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8eibjd2N5XiVRRI4N4yeokngezFp8SvzkItH6b1iECM=; b=RSZjATJ6mPTA0x8Jxseb4kzPHD
	8dRLi53amNJJ1KgeglxKRrbOIHTxLIV6AvkHjiwJ8eWQlu2jczFYp6R4KUIrTAt+2hDw/UE7MuGqz
	Y5qlN4MmdpmapdbPtQuD25mXh5+Y7f756+kRt1awGu7bR3syS7fJxd4iRJ85rVvXasfE9k5z/eJuR
	2re2BJ4VYI8mZSI7EY+GD3phdFDKisYVItb1R1LsQIPKJVdRru1cEqAGvxOvyyEZfo7GQYc22MoWy
	T3fAD7D+N7jSDcdTJxqTiGrkni2IXeeA/9QQx9dxLoMmwJAxABqzLfGKamlIwtBYvCrwb92uaDJsM
	NytYPdVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxyd-00000008kkr-0qg2;
	Wed, 14 Jan 2026 10:19:47 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxyb-00000008kk3-0ASH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 10:19:46 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-11f36012fb2so11467946c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 02:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768385984; x=1768990784; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8eibjd2N5XiVRRI4N4yeokngezFp8SvzkItH6b1iECM=;
        b=CetWCl3Uyld89mxnNhN3K74Vn7fqxYB/+FMdOX/v8p3jYRr/HCNpGrGOtrqzUDAdjt
         I7uGVt69kJF548XipamVwQxw9lb0emDNmcXDusGourD6EB8lWTvxOFIDcA9dV+ZKCm9a
         iclqrJyZpvwCLd1PzOIHZM6Suee/34T2q/bhmKl+M5wxUD5CWJuTG5NhxHLpK2/LB33L
         ItY03at9QRHJQ1OtnIrj31N+bQ1sA750sq2hA93RmVQ5tg5Ohx1bvSJM0mJ7WFzWw3b8
         l5Yr64lxEXOeB2aKZTv/Bwp1I9BYLfy28M4u3FCOycQDLnpqxBjtVYuRGJHA+vmpwrR2
         9pKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768385984; x=1768990784;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8eibjd2N5XiVRRI4N4yeokngezFp8SvzkItH6b1iECM=;
        b=cStXf1EiRPzsN7ton8lIJu+DuYIeA9As4/lQb6iTGNuh/B2bLDjaL08tqktlnAC/0o
         AGRKoEO0WG+C9QY5ZQBbLlteG11EH9DtmGsch2xcs8hJ4UZdIyoAH9k/Shd1Dbs+/lbB
         iAfGEaG7ykq3sBI9uKGREfAyT4qyU050JD+c/Hvapwqj/o9GKXX1JcxP6DTqU0zxAZnh
         KDTp0AdpsZZR+xYxCZgnksPRBuYUvS0O06BPJY2vrqFpUtd8VExSP0lU3q/NPutggadi
         prDEz6TZv15wmL/f5sbIaxuyMniOBEy01fqUVrvmtnrIi+48FUOtGJVSb8ypB5vbViip
         cX+A==
X-Forwarded-Encrypted: i=1; AJvYcCUkWw1OG/cmdhIm/vAOCMymUzTSrfIP+XH3pTgvqiUdp0J35Vkdmp62fBSetvz9iLfhfouTH93cTocBxgLcy0wD@lists.infradead.org
X-Gm-Message-State: AOJu0YxfArHgEXSPRqfGu9U+U3rMiNGyNcDs7tPLcWf4su90HWWg7ni1
	ltB67oCKlYlQjNMisIA6u8HdcDQhj20j+JvMWKgCINfaZ4cx+KbNP0XB71rx0Z4ZM8g=
X-Gm-Gg: AY/fxX70MuWZ88K/0TUzlTRkweOBRTaa8Qpcdagbn40NDalulaz7OGHLOVS7rsIRU6G
	XFKCuJ1jHP5wz2J7bW1QpQI5SVEsOLKdzmmgLGJ2wyQAI0Yiij1zI/G7YspNdFcVVVuEGDrNxOO
	TuOJaWNDbNKRcD7a2BtIKNsUIYBlsVwLiOEfZcs2XoxlSJFRp5t0sbSTK8ro2/yVPsKelGb6EcN
	kL9aqTgZd8KfQ2kH1122iqHwW5PyZY/Zrg0KnMTZtfRMIELMxqRXS8ErTFlEFASRFvRSNfbCfad
	kiTnJIuUsr+ixB4Tjb11POQ+IiIgETcSzHzbKC/7e0wjONoaLHfEyvMluMENq0wEXmWmyKfD5/Z
	hdIpsgvK2jbpGtEc3h+TDIHFfM29R4PSxNiTPbg3XpOepiRk06B8Xb2+AlUZIHDOSRIXp8JlEBp
	mmFpBtHGffbc7f/uy0
X-Received: by 2002:a05:693c:3008:b0:2a4:3593:ddf3 with SMTP id 5a478bee46e88-2b4871d0cc3mr3162205eec.32.1768385983766;
        Wed, 14 Jan 2026 02:19:43 -0800 (PST)
Received: from draszik.lan ([212.129.75.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673b2esm19824293eec.6.2026.01.14.02.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:19:42 -0800 (PST)
Message-ID: <48d52ef389ee0e878c36184efbfaa85071f5549a.camel@linaro.org>
Subject: Re: [PATCH v3 4/5] power: supply: max77759: add charger driver
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
Date: Wed, 14 Jan 2026 10:20:17 +0000
In-Reply-To: <378ee786-2b44-44e7-a3f6-0cd1db3c0481@google.com>
References: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
	 <20251227-max77759-charger-v3-4-54e664f5ca92@google.com>
	 <298ca35590d2180fdcf334f94964b6110e17c606.camel@linaro.org>
	 <50c29a62-1fdb-4de2-8887-0d551eee5ec0@google.com>
	 <255d7726-6758-43ed-b35f-db14726bcc9b@google.com>
	 <2869d309358f27652289c40810ca36b2ec155d1d.camel@linaro.org>
	 <bb9b9afa-0bfa-428e-9372-549d9ba8603c@google.com>
	 <6b37b88e9b7ee57eb1c006916fd995c813ab5e6e.camel@linaro.org>
	 <378ee786-2b44-44e7-a3f6-0cd1db3c0481@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_021945_086420_BEE4F427 
X-CRM114-Status: GOOD (  44.75  )
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

On Tue, 2026-01-13 at 16:47 -0800, Amit Sunil Dhamne wrote:
> Hi Andre',
>=20
> On 1/13/26 2:02 AM, Andr=C3=A9 Draszik wrote:
> > Hi Amit,
> >=20
> > On Mon, 2026-01-12 at 11:37 -0800, Amit Sunil Dhamne wrote:
> > > Hi Andre',
> > >=20
> > > On 1/12/26 5:47 AM, Andr=C3=A9 Draszik wrote:
> > > > Hi Amit,
> > > >=20
> > > > On Tue, 2026-01-06 at 17:14 -0800, Amit Sunil Dhamne wrote:
> > > > > On 1/6/26 3:41 PM, Amit Sunil Dhamne wrote:
> > > > > > Hi Andre',
> > > > > >=20
> > > > > > On 1/5/26 9:32 AM, Andr=C3=A9 Draszik wrote:
> > > > > > > Hi Amit,
> > > > > > >=20
> > > > > > > I haven't done a full review, but a few things caught my eye.
> > > > > > >=20
> > > > > > > On Sat, 2025-12-27 at 00:04 +0000, Amit Sunil Dhamne via B4 R=
elay wrote:
> > > > > > > > diff --git a/drivers/power/supply/Makefile
> > > > > > > > b/drivers/power/supply/Makefile
> > > > > > > > index 4b79d5abc49a..6af905875ad5 100644
> > > > > > > > --- a/drivers/power/supply/Makefile
> > > > > > > > +++ b/drivers/power/supply/Makefile
> > > > > > > > [...]
> > > > > > > > +
> > > > > > > > +static irqreturn_t irq_handler(int irq, void *data)
> > > > > > > > +{
> > > > > > > > +=C2=A0=C2=A0=C2=A0 struct max77759_charger *chg =3D data;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 struct device *dev =3D chg->dev;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 u32 chgint_ok;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 int i;
> > > > > > > > +
> > > > > > > > +=C2=A0=C2=A0=C2=A0 regmap_read(chg->regmap, MAX77759_CHGR_=
REG_CHG_INT_OK,
> > > > > > > > &chgint_ok);
> > > > > > > You might want to check the return value and return IRQ_NONE =
if it
> > > > > > > didn't
> > > > > > > work?
> > > > > > >=20
> > > > > > > > +
> > > > > > > > +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRAY_SIZE(irqs); i++=
) {
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (irqs[i] =3D=
=3D irq)
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 break;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > > > > +
> > > > > > > > +=C2=A0=C2=A0=C2=A0 switch (i) {
> > > > > > > > +=C2=A0=C2=A0=C2=A0 case AICL:
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "A=
ICL mode: %s",
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 str_no_yes(chgint_ok & MAX77759_CHGR_REG_CHG_INT_AICL));
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 case CHGIN:
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "C=
HGIN input valid: %s",
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 str_yes_no(chgint_ok & MAX77759_CHGR_REG_CHG_INT_CHGIN));
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 case CHG:
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "C=
HG status okay/off: %s",
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 str_yes_no(chgint_ok & MAX77759_CHGR_REG_CHG_INT_CHG));
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 case INLIM:
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "C=
urrent Limit reached: %s",
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 str_no_yes(chgint_ok & MAX77759_CHGR_REG_CHG_INT_INLIM));
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 case BAT_OILO:
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "B=
attery over-current threshold crossed");
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 case CHG_STA_CC:
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "C=
harger reached CC stage");
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 case CHG_STA_CV:
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "C=
harger reached CV stage");
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 case CHG_STA_TO:
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "C=
harger reached TO stage");
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 case CHG_STA_DONE:
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "C=
harger reached TO stage");
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > > > Are the above debug messages really all needed?
> > > > > I forgot to respond to this comment in my previous email.
> > > > >=20
> > > > > I think we can keep AICL, BAT_OILO, INLIM. They're either special
> > > > > conditions (AICL) or faulty conditions (like BAT_OILO) and we can=
 in
> > > > > fact keep them at dev_info level. Rest can be removed and a
> > > > > power_supply_changed() is sufficient.
> > > > >=20
> > > > > Let me know what you think?
> > > > I don't think dev_info() in an interrupt handler is appropriate. At
> > > > least it should be ratelimited.
> > > >=20
> > > > If it's something special / unexpected that needs attention, having
> > > > a dev_dbg() message only will usually not be visible to anybody.
> > > I agree. I can change the prints to dev_info_ratelimited for the stuf=
f
> > > we care about.
> > If it's an erroneous condition, maybe warn or even err are more appropr=
iate?
> >=20
> > But then, what is the expectation upon the user observing these message=
s?
> > What can or should they do? Who is going to look at these and can do
> > something sensible based on them?
>=20
> The logging will help in postmortem analysis which may or may not=20
> possible with just publishing uevents to userspace hoping that they log=
=20
> the psy properties. Illustrating a situation:
>=20
> 1. Over current situation happened where the Battery to System current=
=20
> exceeds the BAT_OILO threshold. This would also generate an interrupt.
>=20
> 2. The MAX77759 takes protective measures if the condition lasts for a=
=20
> certain specified time and reset. Resetting will cause Vsys to collapse=
=20
> to 0 if the system is only battery powered.
>=20
> 3. It'd be better that the BAT_OILO interrupt is logged in dmesg,=20
> instead of just delegating it to user space as user can debug this=20
> condition by looking at last_kmsg or pstore.
>=20
> 4. This signal can help the user debug conditions such as moisture (this=
=20
> signal + contaminant detection) or indicative of a mechanical failure.
>=20
> I do agree though that this is a hypothetical or very rare situation and=
=20
> if you have a strong opinion against this I am okay with removing the=20
> prints completely.

Thanks for details. OK, they sound useful in this case, but should still
be warn, not dbg.

> > >=20
>=20
>=20
> >=20
> > Also, I just noticed there is a max77705 charger driver. It seems quite
> > similar to this one, maybe it can be leveraged / extended?
>=20
> Thanks for the feedback. I reviewed the max77705 charger driver. .
>=20
> Here is a breakdown of why I believe a separate driver may be a better=
=20
> approach:

[...]

Thanks for the analysis, I agree with your conclusion. Mainly I noticed tha=
t
as part of AICL interrupt handling that driver does a bit of work, while he=
re
we don't. I am wondering if that is applicable here is well.

Cheers,
Andre'

