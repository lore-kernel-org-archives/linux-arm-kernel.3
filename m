Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43714E69E9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 11:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWr77EDc2Z7gY3B+yvZy4AgnqNFf+hQfwnlqUX6OkHY=; b=gK3YsLyiunaRK5DxY2cxyaxvVh
	8xCzeEaqnctpmn+Q/lSftO5vTKxY44FdHgxA/bvaeoek38xfO3mq+OaAqBlgQs6XzrbrAgz1wUCo2
	vg0gqPu73alOs4v6M+kcDXOt6QPos666XbR1wzh3TlW87SPkhflRPoI6Xx40KOscd3kq9GCvlfafO
	P6bU/am2APOnW8mdz2wuOV4ClOn5NjX4kKgH1jaJMJWTRWehIQjZ7jXFpJQjFAgZ03+Yo5Cdbfojt
	Ddwyo0LpCEmUG0yiJVvhKZwpqEY29OBVwnWUAlbYqztoY8geHeDImn7hVZIsK5P8rZ0czyDzw6sp/
	pEd9JUZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQj3-00000009C9t-3Olq;
	Tue, 03 Dec 2024 11:05:53 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQTv-000000098lL-3fzi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:50:17 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-5f205c4625dso1734945eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 02:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733223014; x=1733827814; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWr77EDc2Z7gY3B+yvZy4AgnqNFf+hQfwnlqUX6OkHY=;
        b=GIHVOebnPXpR2F+IaZAcaLWWzMm4aBKGV8xuuDzoB31AVTJQR95lyMwrZVI828lVve
         nMSPIYzmMW6xvrkVBO2gn0eyoNd+HZXDx0QfeNMJh/H/LhI3Cxxq+jrDfO1mf37YgPzZ
         vY0zwMO84hOMjhQn8zUO9IJ3KdLRMJNy2OVr6Q96t9ZiyCtV3lSfxiYSMZ69QequY5eq
         4rfsCsR33+nzlBIAhsFZZ78zAnNFOuzJZxcClaQ4Su0vNhBnI3LUu2gvnur08N7FDJpy
         9bh9LxGo6vpO/meWioiJIPQGltlfIoGgsRvOzLa0k7np2wkaaOhr1OLbD1Pf53qHx4Wg
         ZdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733223014; x=1733827814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWr77EDc2Z7gY3B+yvZy4AgnqNFf+hQfwnlqUX6OkHY=;
        b=cOtPfDlqAziZtGNk/phvbV8L3DkWFSAXHutbNkWlePvDM5tsyLtYgKaDJw3uA498vY
         TuJHeT2G8cX9zpZALo+bzeceDqXicBKFUjTpAR/gfhw8g9fX2I5tfnLRwjXtYIsEu8m2
         Or6nGlipXvuMB3PSN0PSKGl+FNpgL2lbXarYgkuVPu1LXVnwDJ7oOkR2Zl/+wGmBLhc7
         tsnu3qZUVxlQ3UQMLPCSmuvJFQIOyZGj+LrPuhtR0SjrifEGcEYOTKg9flJq/S67QAps
         VHjnYvXU3YbBCvMb2H+wm6Dmrlrul14TgkOTjoSPkyR9HWarai1+ehfAz2pDQFTvOOp2
         XqsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuD57wEhcjDJhM3NVat+iyKDY62xwJN5SEf27q5oa2BriqBaKZsjvtixd7Q4R9S+qBhvVF00sDi0RJNDtw2UOM@lists.infradead.org
X-Gm-Message-State: AOJu0YzUvlJPYld1pexyJnc27IeNv4n8sIcL4xTBSMXf0U5uUIVLtYTH
	AhkKvaxBdzKSAeqEkL6H1FhLRbtkvL2i9cRE5toP3AMIaz2EanKGJBvEYcb+mdd0o7xXzv0/OcV
	XQVAQ0SHh3PENrofhhzQHgZvMlLC5EuopW4Kzqg==
X-Gm-Gg: ASbGnculvbRUDf23qXXBkiC2r/JrglBh1mryJpAU2cS0LFcTFG/CHOLPh4JQOvJAsK+
	bbNGFP4njhKe+y6GLj7LBSxgiduebL+lT3A==
X-Google-Smtp-Source: AGHT+IF1X9pJalmvVAXH13ENlZykUB4j5mmSDDLGmjaOd4tjIVZTwW8QMjDLXMkDeOEvzXU9CTNWdhqVoZO1TnMeLqo=
X-Received: by 2002:a05:6870:b14b:b0:296:f0be:ebda with SMTP id
 586e51a60fabf-29e8871550fmr2075227fac.19.1733223014149; Tue, 03 Dec 2024
 02:50:14 -0800 (PST)
MIME-Version: 1.0
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
 <20241202-b4-gs101_max77759_fg-v1-1-98d2fa7bfe30@uclouvain.be>
 <c377f3302c6c282ad826211c859e2b65bb1222cb.camel@linaro.org>
 <9387c0cf-d291-485a-8cd1-1aced7eba14e@uclouvain.be> <2883fb0dd22312d5da9039d4fef869276a0bd430.camel@linaro.org>
 <bce22ca8-aed2-41ae-b2ef-fdc71266709a@uclouvain.be>
In-Reply-To: <bce22ca8-aed2-41ae-b2ef-fdc71266709a@uclouvain.be>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 3 Dec 2024 10:50:02 +0000
Message-ID: <CADrjBPq2TbP6aZ+9Y1Mg61wPfisnXPsgGjnXJW2724hmox+78w@mail.gmail.com>
Subject: Re: [PATCH 1/4] power: supply: add support for max77759 fuel gauge
To: Thomas Antoine <t.antoine@uclouvain.be>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_025015_914713_EB4BBC39 
X-CRM114-Status: GOOD (  44.93  )
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

Hi Thomas,

Thanks for your contribution :)

On Tue, 3 Dec 2024 at 10:12, Thomas Antoine <t.antoine@uclouvain.be> wrote:
>
> On 12/3/24 10:31, Andr=C3=A9 Draszik wrote:
> > On Tue, 2024-12-03 at 10:08 +0100, Thomas Antoine wrote:
> >> On 12/3/24 07:47, Andr=C3=A9 Draszik wrote:
> >>>> From: Thomas Antoine <t.antoine@uclouvain.be>
> >>>>
> >>>> The Maxim max77759 fuel gauge has the same interface as the Maxim ma=
x1720x
> >>>> except for the non-volatile memory slave address which is not availa=
ble.
> >>>
> >>> It is not fully compatible, and it also has a lot more registers.
> >>>
> >>> For example, the voltage now is not in register 0xda as this driver a=
ssumes.
> >>> With these changes, POWER_SUPPLY_PROP_VOLTAGE_NOW just reads as 0. 0x=
da
> >>> doesn't exist in max77759
> >>>
> >>> I haven't compared in depth yet, though.
> >>
> >> Is the voltage necessary for the driver? If so, we could just not
> >> read the voltage. If it is necessary, I can try to kook into it and tr=
y
> >> to find in which register it is located (if there is one).
> >
> > Downstream reports it in
> > https://android.googlesource.com/kernel/google-modules/bms/+/refs/heads=
/android-gs-raviole-mainline/max1720x_battery.c#2400
> >
> > so upstream should do, too.
>
> I should have checked before answering. Indeed, I will try to see the
> best way to choose the register based on the chip. From what I see, it
> will also be necessary to change the translation of the reg value to micr=
ovolt
> as downstream does *78125/1000 when it is currently *1250 in mainline:
> https://android.googlesource.com/kernel/google-modules/bms/+/refs/heads/a=
ndroid-gs-raviole-mainline/max1720x_battery.h#49
>
> >>>>  static const char *const max17205_model =3D "MAX17205";
> >>>> +static const char *const max77759_model =3D "MAX77759";
> >>>>
> >>>>  struct max1720x_device_info {
> >>>>       struct regmap *regmap;
> >>>> @@ -54,6 +57,21 @@ struct max1720x_device_info {
> >>>>       int rsense;
> >>>>  };
> >>>>
> >>>> +struct chip_data {
> >>>> +     u16 default_nrsense; /* in regs in 10^-5 */
> >>>> +     u8 has_nvmem;
> >>>> +};
> >>>> +
> >>>> +static const struct chip_data max1720x_data  =3D {
> >>>> +     .default_nrsense =3D 1000,
> >>>> +     .has_nvmem =3D 1,
> >>>> +};
> >>>> +
> >>>> +static const struct chip_data max77759_data =3D {
> >>>> +     .default_nrsense =3D 500,
> >>>> +     .has_nvmem =3D 0,
> >>>> +};
> >>>
> >>> This should be made a required devicetree property instead, at least =
for
> >>> max77759, as it's completely board dependent, 'shunt-resistor-micro-o=
hms'
> >>> is widely used.
> >>>
> >>> I also don't think there should be a default. The driver should just =
fail
> >>> to probe if not specified in DT (for max77759).
> >>
> >> I hesitated to do this but I didn't know what would be better. Will ch=
ange
> >> for v2.
> >
> > Just to clarify, has_nvmem can stay here in the driver, just rsense sho=
uld
> > go into DT is what I mean.
>
> It was clear don't worry. This answer is related to the same subject:
> https://lore.kernel.org/linux-devicetree/20241202-b4-gs101_max77759_fg-v1=
-0-98d2fa7bfe30@uclouvain.be/T/#ma55f41d42bf39be826d6cbf8987138bcc4eb52e3
>
> >>>> +
> >>>>  /*
> >>>>   * Model Gauge M5 Algorithm output register
> >>>>   * Volatile data (must not be cached)
> >>>> @@ -369,6 +387,8 @@ static int max1720x_battery_get_property(struct
> >>>> power_supply *psy,
> >>>>                       val->strval =3D max17201_model;
> >>>>               else if (reg_val =3D=3D MAX172XX_DEV_NAME_TYPE_MAX1720=
5)
> >>>>                       val->strval =3D max17205_model;
> >>>> +             else if (reg_val =3D=3D MAX172XX_DEV_NAME_TYPE_MAX7775=
9)
> >>>> +                     val->strval =3D max77759_model;
> >>>>               else
> >>>
> >>> This is a 16 bit register, and while yes, MAX172XX_DEV_NAME_TYPE_MASK=
 only
> >>> cares about the bottom 4 bits, the register is described as 'Firmware
> >>> Version Information'.
> >>>
> >>> But maybe it's ok to do it like that, at least for now.
> >>
> >> I thought this method would be ok as long as there is no collision on
> >> values. I hesitated to change the model evaluation method based on chi=
p
> >> model, where the max77759 would thus have an hard-coded value and the
> >> max1720x would still evaluate the register value. I did not do it beca=
use
> >> it led to a lot more changes for no difference.
> >
> > Downstream uses the upper bits for max77759:
> > https://android.googlesource.com/kernel/google-modules/bms/+/refs/heads=
/android-gs-raviole-mainline/max_m5.h#135
> >
> > I don't know what the original max17201/5 report in this register
> > for those bits, though. Given for max77759 this register returns
> > the firmware version, I assume the lower bits can change.
>
> Based on this datasheet of the max1720x, the upper bits are the revision
> and the four lower bits are device. So it could change.
> https://www.analog.com/media/en/technical-documentation/data-sheets/MAX17=
201-MAX17215.pdf#MAX17201%20DS.indd%3A.213504%3A15892
>
> If the four lower bits are not always 0 for the max77759 then I guess it
> is necessary to change this as it wouldn't work with all max77759.

The definition of this register for max77759 is

Register name(addr): DevName (0x21)
Rest value: 0x6200
Bitfield: DevName Bits: 15:0 Description: Firmware Version Information

So I don't think you can rely on the bottom bits always being zero

regards,

Peter

