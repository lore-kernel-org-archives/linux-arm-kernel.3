Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA68C9EC83
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UaxpiPH1Ry8qxmWaByqCNheQFKNXN/xI1ASgwjeZP3o=; b=juOOVNogs+FPHOY6D1IJZewJBS
	crKs2ly2hGJKEWd3k7JMb/8vuwH4zRH+8JuaSKLegi9RX0zG7egS8GOHKQvzQA4nyX5lhdcKGgtJc
	LVM26iWh0rlEZj1oGiIA0RMMUdOPI+wHph1QmtvomsGzEDlOrQtTLpGK440wWoWmmw+b7SnOemOo9
	EQMfcofSWAhAcUvg5EEomgUqx6E6Ppr4686Q+qIRbvI3ADC+LAM7rsJ12Kd0v9Ch5KV7qGd3QA8k6
	8wrHTFMhiYBwq+WkA3KXJ/8K3lgh4jscNChM+KyNKAXqBRbutB+T1/OAv2rmAHJlhqCYRgckS3DAg
	BJV7BHtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbDa-00000006s1g-0x3e;
	Tue, 13 Jan 2026 10:01:42 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbDX-00000006s03-203k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:01:41 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-81f4a1a3181so1083568b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 02:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768298498; x=1768903298; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UaxpiPH1Ry8qxmWaByqCNheQFKNXN/xI1ASgwjeZP3o=;
        b=OzSm/9Pq+L8PfTxQLFRsi6remnyKuwyq6/0fJ/HGlj5BZuiRIhcsKLrwHireAFZwGF
         k57ygxmtsmSs2+t8dtoH6j2+Qz/rFIIHObFzzYqDQo9yR2TPxP1wMk/Hq5mzt59D5NOa
         cDOTGIQ3Ee2rKLknK1QpS7WzGPaMgQHtq/y+7n3xBzyiFqH//PwUI3abwrUVRTV49F8d
         NvUZkhv/YxOLx4tu58thhBsGFv56rYGElOfo532hhbnIq7msr3TNytgxguwGr7L8so17
         a2pQ1w3Pj/S0Tjq9g65HGBhnSmEcteZaivaQcdox2P1r0cN/H4VgIHB/CuvwByQqGGH2
         W+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768298498; x=1768903298;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UaxpiPH1Ry8qxmWaByqCNheQFKNXN/xI1ASgwjeZP3o=;
        b=w7v2Y/lmgMMKv6TIhEGj94E+xPKViPJtgWWA7U77jNaIy0W4S5LWctJ7pVuDmhjsOq
         ZT94n6hZiS6DPZsSo+MY6naurpca45xB+P2+x+yiCdv5sPGXtpybSt1/D3NF2ZFKEchN
         4jCqvLMhroOtoxwC7aKr09x1EdaAgwvtvkpNEr0kKkNQx3PjoEYQENJNMgA4rHtuT4SV
         zJzQxW2AsZuhHrBaiUWxEjwVcW1th1px/d9m4sE4uo4QGP81hMo5iyMdFvtPgx6yqnt3
         2FGBs/fmffcWVW3kUYt0UO4m9H8RIcCyxNs9wTwqExo68cMeO6w2EWD9eDE/zrdQcSn8
         8/tg==
X-Forwarded-Encrypted: i=1; AJvYcCWOMhmbeY4sr43FWZQNp5l6OH9oZY9hBpkNqzWViW1SA2uPbO/DbkPsUSIu6NcANneFA7WngInywEUrxxYfZ26m@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6BvfwWHHVNnBCpvick5jHowUlbaRrUp+QJqJkA4bz3cbUfTko
	n1nq+6Z1izElD84EPaBc+/811ne2FTIl2oVc+X1iqoyOfoKh/esei54qT6bR6NSa2CoO2uI0xtK
	pZY1IKeM=
X-Gm-Gg: AY/fxX4MX03JRm0UWjBreiOMkosVNuL7QkFch/FwG28gMWLl76PiZg/psL9ElzjstMc
	Nj4T95IYBTRqZN+L8T3ggmLEM7gMfW9nfDcZV0kBbRiU4qoAtUOxAWgjUorDtVh9u3HQNm3IE0u
	EWjWTPgxhJ1C8G2DzcHGQtZbDFBRTEnvTbeUBW5/XwlkAGZ1z0UD+PWeZIFpk3AuwUpqoVDbP5s
	d1gL6GbJVJDNYJwkVjAJB9g8Ewf/rZIK6M8Z+OqprTEBu0rjpgKyfLlFg11H3K7BuXEEkKGFBd8
	7aJ5ga1IgPzr0wNC3aaGfAECA5+MQH0TQkziFjNo5D+c6Tsj2dTJK3XlQjB+BXK4pRCHhbOQfm7
	RSsCEu7FhhtdpxMBthXFSBu3npRJs8a3JxtSnOMTMgY30R5vFqOD3DTZVSL8/3SMDfR6HeVNIa2
	ncXtSCoX5igofOsAloMIUa2+fv1KU=
X-Google-Smtp-Source: AGHT+IG1jlL2IQl/5c1/qnegoIWk3ju/Uopj0jVtcW5UNJeC+6ZUILWIKDw/vmbu2uSjRd9kgNDnBw==
X-Received: by 2002:a05:6a20:394a:b0:341:d5f3:f1ac with SMTP id adf61e73a8af0-3898f9f9cb8mr19509318637.41.1768298498309;
        Tue, 13 Jan 2026 02:01:38 -0800 (PST)
Received: from draszik.lan ([212.129.80.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a2f7sm200689675ad.16.2026.01.13.02.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:01:37 -0800 (PST)
Message-ID: <6b37b88e9b7ee57eb1c006916fd995c813ab5e6e.camel@linaro.org>
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
Date: Tue, 13 Jan 2026 10:02:06 +0000
In-Reply-To: <bb9b9afa-0bfa-428e-9372-549d9ba8603c@google.com>
References: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
	 <20251227-max77759-charger-v3-4-54e664f5ca92@google.com>
	 <298ca35590d2180fdcf334f94964b6110e17c606.camel@linaro.org>
	 <50c29a62-1fdb-4de2-8887-0d551eee5ec0@google.com>
	 <255d7726-6758-43ed-b35f-db14726bcc9b@google.com>
	 <2869d309358f27652289c40810ca36b2ec155d1d.camel@linaro.org>
	 <bb9b9afa-0bfa-428e-9372-549d9ba8603c@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_020139_951186_D8036A86 
X-CRM114-Status: GOOD (  36.10  )
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

Hi Amit,

On Mon, 2026-01-12 at 11:37 -0800, Amit Sunil Dhamne wrote:
> Hi Andre',
>=20
> On 1/12/26 5:47 AM, Andr=C3=A9 Draszik wrote:
> > Hi Amit,
> >=20
> > On Tue, 2026-01-06 at 17:14 -0800, Amit Sunil Dhamne wrote:
> > > On 1/6/26 3:41 PM, Amit Sunil Dhamne wrote:
> > > > Hi Andre',
> > > >=20
> > > > On 1/5/26 9:32 AM, Andr=C3=A9 Draszik wrote:
> > > > > Hi Amit,
> > > > >=20
> > > > > I haven't done a full review, but a few things caught my eye.
> > > > >=20
> > > > > On Sat, 2025-12-27 at 00:04 +0000, Amit Sunil Dhamne via B4 Relay=
 wrote:
> > > > > > diff --git a/drivers/power/supply/Makefile
> > > > > > b/drivers/power/supply/Makefile
> > > > > > index 4b79d5abc49a..6af905875ad5 100644
> > > > > > --- a/drivers/power/supply/Makefile
> > > > > > +++ b/drivers/power/supply/Makefile
> > > > > > [...]
> > > > > > +
> > > > > > +static irqreturn_t irq_handler(int irq, void *data)
> > > > > > +{
> > > > > > +=C2=A0=C2=A0=C2=A0 struct max77759_charger *chg =3D data;
> > > > > > +=C2=A0=C2=A0=C2=A0 struct device *dev =3D chg->dev;
> > > > > > +=C2=A0=C2=A0=C2=A0 u32 chgint_ok;
> > > > > > +=C2=A0=C2=A0=C2=A0 int i;
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 regmap_read(chg->regmap, MAX77759_CHGR_REG_=
CHG_INT_OK,
> > > > > > &chgint_ok);
> > > > > You might want to check the return value and return IRQ_NONE if i=
t
> > > > > didn't
> > > > > work?
> > > > >=20
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRAY_SIZE(irqs); i++) {
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (irqs[i] =3D=3D =
irq)
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 break;
> > > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 switch (i) {
> > > > > > +=C2=A0=C2=A0=C2=A0 case AICL:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "AICL =
mode: %s",
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 str_no_yes(chgint_ok & MAX77759_CHGR_REG_CHG_INT_AICL));
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > > +=C2=A0=C2=A0=C2=A0 case CHGIN:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "CHGIN=
 input valid: %s",
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 str_yes_no(chgint_ok & MAX77759_CHGR_REG_CHG_INT_CHGIN));
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > > +=C2=A0=C2=A0=C2=A0 case CHG:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "CHG s=
tatus okay/off: %s",
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 str_yes_no(chgint_ok & MAX77759_CHGR_REG_CHG_INT_CHG));
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > > +=C2=A0=C2=A0=C2=A0 case INLIM:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "Curre=
nt Limit reached: %s",
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 str_no_yes(chgint_ok & MAX77759_CHGR_REG_CHG_INT_INLIM));
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > > +=C2=A0=C2=A0=C2=A0 case BAT_OILO:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "Batte=
ry over-current threshold crossed");
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > > +=C2=A0=C2=A0=C2=A0 case CHG_STA_CC:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "Charg=
er reached CC stage");
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > > +=C2=A0=C2=A0=C2=A0 case CHG_STA_CV:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "Charg=
er reached CV stage");
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > > +=C2=A0=C2=A0=C2=A0 case CHG_STA_TO:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "Charg=
er reached TO stage");
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > > +=C2=A0=C2=A0=C2=A0 case CHG_STA_DONE:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev, "Charg=
er reached TO stage");
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > Are the above debug messages really all needed?
> > > I forgot to respond to this comment in my previous email.
> > >=20
> > > I think we can keep AICL, BAT_OILO, INLIM. They're either special
> > > conditions (AICL) or faulty conditions (like BAT_OILO) and we can in
> > > fact keep them at dev_info level. Rest can be removed and a
> > > power_supply_changed() is sufficient.
> > >=20
> > > Let me know what you think?
> > I don't think dev_info() in an interrupt handler is appropriate. At
> > least it should be ratelimited.
> >=20
> > If it's something special / unexpected that needs attention, having
> > a dev_dbg() message only will usually not be visible to anybody.
>=20
> I agree. I can change the prints to dev_info_ratelimited for the stuff=
=20
> we care about.

If it's an erroneous condition, maybe warn or even err are more appropriate=
?

But then, what is the expectation upon the user observing these messages?
What can or should they do? Who is going to look at these and can do
something sensible based on them?

> >=20
> > Also will the call to power_supply_changed() down below handle the
> > special conditions (e.g. convey to upper levels)? If not, can it be
> > made to do so?
>=20
> Yes it does, as I can see a call to kobject_uevent() inside=20
> power_supply_changed_work(). Also, power_supply_changed() also notifies=
=20
> other subsystems that have registered their notifiers downstream of this=
=20
> power_supply object. So I believe we're good there.

If erroneous conditions are handled by other / upper layers, why print a
message in this interrupt handler in the first place?

Also, I just noticed there is a max77705 charger driver. It seems quite
similar to this one, maybe it can be leveraged / extended?


Cheers,
Andre'

