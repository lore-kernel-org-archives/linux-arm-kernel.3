Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D427CEA3F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 06:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLdYDGt/+DrOZdYJB2wqY0IBiaBFC8iK50DATmXPJZs=; b=hKgsvRTGrcAWvfbsmzak9ETrRn
	nuzJpf0v9dVCW60Lbg2gkx4OPvyldPFKZhl8Zee5VKCPK1hYJfQ2R5NRFGhoQ4gqMmWuV29sVJh3S
	UWKPK79WXtETUvUklc4xxNiuzDnB0wwxrgKKjc6ZP+8evATR2GnC4tUR5rq2ozJPH7bV8eTY2xS7/
	lpGY4iZOfSd5SrniCYzy3JqeOQk0Gxhj/S3fDsqbsWgRbVHuAaD/scT3pK4dFp7bqLBXi+dEOVp3w
	t0dsqRF8gUbDBVo7OdvLRzvQ68M0bA+tuOI4nnru/5ooljJ/6pfqzCcpw/NeBzLFyxxnFjWgcyE4q
	4PMjtqOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphOf-0000000GXr7-1SOa;
	Tue, 10 Feb 2026 06:38:53 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphOc-0000000GXq1-0Nox
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 06:38:52 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so49449095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 22:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770705528; x=1771310328; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lLdYDGt/+DrOZdYJB2wqY0IBiaBFC8iK50DATmXPJZs=;
        b=XWe7vBAZhhnPy0ti1J/tKXasMlSYgOprfhqP966+rdsA2dEO1H3i8NcLrtwhoiSC5E
         pQ4Y442TTbfyDZMso5bjkogfq4f3Z7rYYThBZ6WkTrlXjIiMhzhWB+kqMskvM/1mXJq6
         bPxx4qEuE3Tzh3Q+m/WUBsgdl1BqDKeZTq7n3vQoi2b54dsb4IJgaqg41kPnMh8GveeC
         2V+AlRTC3spSf/4UrReSqCeqqdzEcSyRO3FC2ls9hmxy9RB86Fyhx0TgCyH8mmouTtyq
         t7gc2KKfNCU8chdixBAsOJ9wwYXM/JxMqxtsv5sKc2x/ERrePOkEy5KDLZawUUNiCGol
         DCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770705528; x=1771310328;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lLdYDGt/+DrOZdYJB2wqY0IBiaBFC8iK50DATmXPJZs=;
        b=S+hQihG9G4+hnVllAWNJDQn/W1s9nKV12tZ1Z+s1d652OIrYTochE15KDWaL6wC99D
         y1M2lVGEYyGDLM4jr6d1yXfaaVifRXl/KDuDz+CxDoRNATBwS2gAlowC2JK0yNeYnbwB
         pVTPk28W1rax7E6C80smTGV9knMb/+U6di8foQxQcCPXJEn5fuP+9ToCENqCruYGloAR
         5HxsGwMhtVh978kX2NBxVR3oDoG8EBf2ZIr0dru5A5FMtn4BxEHgdqbu7ejz3upHtDYf
         bW+RpQeFjO4Tpaoh+ksCEnZvFG3StXdVMPRFmVI6tDsi38r93IQZPYFWIfqkncs3g5D8
         4Oyw==
X-Forwarded-Encrypted: i=1; AJvYcCX3zFc1TQ8o+cQqwrKI3wa2XAB9TABIuMR8frtL2X0V/BnP5dUZicEegHviFS3iXC7e0inbL6r92vJhbbNs48wY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/uQ6yS44JjH/ITKOgBxUnMddFXeDe+5wQSNn8I/M2ChSILGKd
	EDeE7QTkgHUS8BDDVJ1w3kluItgmBKLg3wW0V2Tc1HRqLsL/lMUFKyfEGL5RwZmJqWg=
X-Gm-Gg: AZuq6aIk59KFJ5vzOCbWBjQ8wt/rMSBaXhFkquDHGHCZ5olmcQalyGIo6V1V2Vi+Tiy
	gSfKr2JNITVYd1LbPQHSXI+pwUE9K4nUx47gd3FClo/DNP2IQ3ZYu1Nj8DbdsEonjJfLaJ95KKv
	gk8Yvq65BYbWj1xBWJIvQBRVQWRj4d6Qt38JI++V40bSmEBLQTWNG3E6AHFRSRtKAo77x/RUXvZ
	juZQnPtNrfLa4fL+tYwlqOAhY0dM03lvQo5bG6Bx/t6dtWQTQLZhyk2NB9sbmrV6KYvotYWmPUZ
	ZC/b9jo9Sb2/mCC1+5dx6pp7CnR3IEtDA90qJ1AAAGIJY7GL6gT8zr2OxgeOJlRYwF1+V8dxyxC
	NxG4Sh1wJWSCMm4El9FyCqytZJyelX5NSEbdVcx6g80O6SdPVdH1YtFhx+JaOyuYF94s6naGImy
	jaq+hAwrh6btVfXOp1uEN40Zazw4XgDw==
X-Received: by 2002:a05:600c:c086:b0:47e:e7de:7c41 with SMTP id 5b1f17b1804b1-4834ffb08f0mr12556465e9.16.1770705527668;
        Mon, 09 Feb 2026 22:38:47 -0800 (PST)
Received: from draszik.lan ([212.129.79.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d8334a8sm37397915e9.12.2026.02.09.22.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 22:38:47 -0800 (PST)
Message-ID: <9fce298c842533bc6ede7f1a97040337236351d8.camel@linaro.org>
Subject: Re: [PATCH v5 4/5] power: supply: max77759: add charger driver
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
Date: Tue, 10 Feb 2026 06:39:14 +0000
In-Reply-To: <277e1c95-e221-4c07-a00e-d0f0a1a7553f@google.com>
References: <20260203-max77759-charger-v5-0-b50395376a5f@google.com>
	 <20260203-max77759-charger-v5-4-b50395376a5f@google.com>
	 <3ab2d8cd112441dc1d7ab5097f5b1b64c7e415ab.camel@linaro.org>
	 <277e1c95-e221-4c07-a00e-d0f0a1a7553f@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_223851_002096_8E19D5CA 
X-CRM114-Status: GOOD (  26.69  )
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

On Mon, 2026-02-09 at 16:42 -0800, Amit Sunil Dhamne wrote:
> Hi Andre',
>=20
> On 2/4/26 4:49 AM, Andr=C3=A9 Draszik wrote:
> > On Tue, 2026-02-03 at 22:50 +0000, Amit Sunil Dhamne via B4 Relay wrote=
:
> >=20
> > > +
> > > +static void psy_work_item(struct work_struct *work)
> > > +{
> > > +	struct max77759_charger *chg =3D
> > > +		container_of(work, struct max77759_charger, psy_work.work);
> > > +	union power_supply_propval current_limit, online;
> > > +	int ret;
> > > +
> > > +	ret =3D power_supply_get_property(chg->tcpm_psy,
> > > +					POWER_SUPPLY_PROP_CURRENT_MAX,
> > > +					&current_limit);
> > > +	if (ret) {
> > > +		dev_err(chg->dev,
> > > +			"Failed to get CURRENT_MAX psy property, ret=3D%d",
> > > +			ret);
> > > +		goto err;
> > > +	}
> > > +
> > > +	ret =3D power_supply_get_property(chg->tcpm_psy, POWER_SUPPLY_PROP_=
ONLINE,
> > > +					&online);
> > > +	if (ret) {
> > > +		dev_err(chg->dev,
> > > +			"Failed to get ONLINE psy property, ret=3D%d",
> > > +			ret);
> > > +		goto err;
> > > +	}
> > > +
> > > +	if (online.intval && current_limit.intval) {
> > > +		ret =3D set_input_current_limit(chg, current_limit.intval);
> > > +		if (ret) {
> > > +			dev_err(chg->dev,
> > > +				"Unable to set current limit, ret=3D%d", ret);
> > > +			goto err;
> > > +		}
> > > +
> > > +		charger_set_mode(chg, MAX77759_CHGR_MODE_CHG_BUCK_ON);
> > > +	} else {
> > > +		charger_set_mode(chg, MAX77759_CHGR_MODE_OFF);
> > > +	}
> > > +
> > > +	chg->psy_work_retry_cnt =3D 0;
> > > +	return;
> > > +
> > > +err:
> > > +	charger_set_mode(chg, MAX77759_CHGR_MODE_OFF);
> > > +	if (chg->psy_work_retry_cnt >=3D MAX_NUM_RETRIES)
> > > +		return;
> > I'd say this final giving up could benefit from a dev_err(), while ...
>=20
> I want to clarify if you want me to add this final giving up print just=
=20
> once or every time I am returning early?

I meant something along the lines of this:

+	if (chg->psy_work_retry_cnt)
+		dev_dbg(chg->dev, "chg psy_work succeeded after %d\n",
+			chg->psy_work_retry_cnt)
+	chg->psy_work_retry_cnt =3D 0;
+	return;
+
+err:
+	charger_set_mode(chg, MAX77759_CHGR_MODE_OFF);
+	if (chg->psy_work_retry_cnt >=3D MAX_NUM_RETRIES) {
+		dev_warn(chg->dev, "chg psy_work failed, giving up",
+			 chg->psy_work_retry_cnt, MAX_NUM_RETRIES);
+		return;
+	}

> >=20
> > > +
> > > +	++chg->psy_work_retry_cnt;
> > > +	dev_err(chg->dev, "Retrying %u/%u chg psy_work",
> > > +		chg->psy_work_retry_cnt, MAX_NUM_RETRIES);
> > ... this one could be demoted (but doesn't have to).
> >=20
> > That'd make it easier to determine if it's still in the process of
> > trying, or if it has given up fully.
>=20
> I was assuming the printing of "3/3" would indicate the final giving up=
=20
> and sufficient.


If you see 3/3 in the log, you'll know that it has scheduled the work (for
the last attempt), but you won't easily know if 3/3 has ran yet or if it
has completed successfully this time or if it was still unsuccessful.

> >=20
> > > +	schedule_delayed_work(&chg->psy_work,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(PSY_WORK_RETRY_DE=
LAY_MS));
> > > +}
> > > +
> > > +static int psy_changed(struct notifier_block *nb, unsigned long evt,=
 void *data)
> > > +{
> > > +	struct max77759_charger *chg =3D container_of(nb, struct max77759_c=
harger,
> > > +						=C2=A0=C2=A0=C2=A0 nb);
> > > +	static const char *psy_name =3D "tcpm-source";
> > > +	struct power_supply *psy =3D data;
> > > +
> > > +	if (!strnstr(psy->desc->name, psy_name, strlen(psy_name)) ||
> > > +	=C2=A0=C2=A0=C2=A0 evt !=3D PSY_EVENT_PROP_CHANGED)
> > > +		return NOTIFY_OK;
> > > +
> > > +	chg->tcpm_psy =3D psy;
> > Do you need locking here? What if this is changed while a previous
> > psy_work_item() is still executing?
>=20
> I=C2=A0 don't think that's ever possible in this case though. The power=
=20
> supply that this driver registers is downstream of the tcpm's.


A previous work could still be executing (e.g. due to retrying), no? It
should also probably set chg->psy_work_retry_cnt =3D 0; here, to allow it
to retry up to MAX_NUM_RETRIES when a new work is queued and a previous
one was unsuccessful?




Cheers,
Andre

