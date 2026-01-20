Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2361D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 13:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61FVTvC+OPYsLfCnTMn5A70RhUk+8hVfV9yJPBCxid4=; b=whBl0uFoKNdU4LFVC+AlPg5bYJ
	tpYIsY/o/oGG/x5Ypj1Cf2uHO63XhwcWq1USwtILYTLwFwUzzjHVEDvMzdGfjMCZktMG6AoORKzWF
	dESuTTxpweOOP1kYgbJ134JvmstYOWXwz40hZRrlcchRPn5ROCVvd/HVIkAu2Vsy7Lzk6QxWvsYd0
	IAriKAGzskAbdLo8zRV4KEZH4TTY0Hh1U1IfjKuLjdpCbCNoXvsh1rqEh8iknv4pxVzyX5qBLsbp/
	GOO3L2aT+8Fw2jaVBYEUhyD65m3OQr4Eiz6GhBa71PMMrpfKIKIu/gpzDm+0zAq5cHrV8ZawwrH3S
	KCBv5/VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viBZT-00000003tdP-2uhk;
	Tue, 20 Jan 2026 13:14:59 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viBZR-00000003tcZ-3EHF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 13:14:58 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-5029aa94f28so40573121cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 05:14:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768914896; cv=none;
        d=google.com; s=arc-20240605;
        b=RBvqV4DNkjHxTVNblG63I31H9wyPAuMLKdmYDT3OQWqWZPApNuT9Cn35DbN9ztwlUX
         TmN4ywJzXmzjaDOYiotiY5ec0MAxA0nqFuoPjun6O7MBa/VqlNTooWYKGd7bL8J3nOlT
         wAI6JDxIiDa/jojXv3D4kgbEWRzgqym2jXFVbBqDL0/P2tinMZ/EQW9cZzgO4JVz3/xC
         ytac87orPhwBqJltDTkZOphiQiNLqj6QNzv4ocfMlNfz5EKp15J0LCNHa9j/YZN/WnZC
         mWLWP/qXZ5mltRB01ETYGZqZaVVuzCleOykcxRiSrYKPRnza9Vc9iIdnvalWVN09N5+u
         VcrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=61FVTvC+OPYsLfCnTMn5A70RhUk+8hVfV9yJPBCxid4=;
        fh=HBcD8AyZQEfdtU6i0ucYitUwG/6RUoB0FsIzk63KHYw=;
        b=lxsgDNC1MHdaNcN8Akj+JmOJqOQpOBXmDbYTBtXPj5RPJy6EI01y2hOoYup5XOGnQ8
         XTcwQVzvsAoX6GVf+oMKl4RjAuMgw9gCD9xQpRAARfpT3G5g9FoD23BROLrmAZia0e9C
         F0zN545KQv1W2g/AWrm9QknJbesBwUUNx0zmxeZOU9EotUbvrVTszjvSjn6bRDCwjyfM
         uwXfWEZyUaNY0Ycu8zLw3HNbbxLIauf3LQbtvMQBI70Q6xA8L8nXa8HbJrjqoWdPFXam
         RYvfhsozmJ43Cj1i1FTIwbmwuNE8ak022p1EfvuqVd5KODMz6buUpbvsUh/FxD+viJpN
         HX7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768914896; x=1769519696; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61FVTvC+OPYsLfCnTMn5A70RhUk+8hVfV9yJPBCxid4=;
        b=TZXcHwp9jI3UYYfAqUcks2PTTnhQSzHA14/hwjddXS2pUtEopNP1AESjYaVLY/4iH0
         TeZiaA+1x+8uqLMUUkQqQZkVI63Z5z37vgpN9f+wVrfKgeWAneNIxLw8h5Px/t2O/1WS
         pi10jAzsJRHsSZyo/P6gnN0R9O5ZQc6ak9nlu0OAQDoZ+0shVWYhzWzd45l6duL40HRx
         JTMccDIrx61iGbD6ep+o7jqm+1OExjlqTC7zBEgQ+UWjS/FkdfiZOdf0IM66gtLsXTXL
         OTxQ7q0zjnO0mupXANicshMrwe+Ul778F2JAzhdMRgzH2G7iEGVg6WMG8/GHERiVc2lz
         WD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768914896; x=1769519696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=61FVTvC+OPYsLfCnTMn5A70RhUk+8hVfV9yJPBCxid4=;
        b=mWvh5l5do8z1J+mr3Q37AHSLjFni5e0E0jT0S1IoOxmmfWpbK9jbKpitcuMwhLdKDp
         wRsbA8VgBcoQbyfsZ4Di7EPAU7X7qSbDFCFfamFTzL1jdlGKU2L4RTow5VQK7D2tYuj2
         TRjJtnGCP4M09P43eOxe5dWqE/MmLZf2QwS1g/sgnZ7LGFHhGzmb0v2CwgKHVpQrGbxe
         jcqvD9uQhGcsZoMgVtkRxyeLWY4yX8uLRNcC31Yn8wBjJ3qD1m0Zrr4mltTzskD4MXE3
         8+qDZwY/jCf1jZHBtSzJAxroCIoHRAonjFySMvb30n24UU2pir5RGZgY39Q7XxW+UkBB
         hZrg==
X-Forwarded-Encrypted: i=1; AJvYcCWUReRbeYmB8kwkmki+h1321vvFZrrZgPchksh9M9iTBrETHgChztX/KbS+OfGIwvxeE6Py/fnHTTTNiNlbmdc2@lists.infradead.org
X-Gm-Message-State: AOJu0Yws9rzkbAbcqmwC1nIbeq+enDHvp3YRrMUOWL9Q79jff1wf64N4
	lnnaHrZkgxKRaKw+jd8956fQlj7QDLSA1uqHltceJqg3T6rmfQ6320BG2uEJ5wmLW974tI5VWN7
	zMOqE9Rqv1mypu7dTnqL3umgnSEHiqAM=
X-Gm-Gg: AY/fxX5zu6Uz1OUr1r3542BhzO2stIztsvCYOQKbWP1nthfDWIzVaJTgvXs96zcyfpE
	CJSmMUWvS1sMdTS9rh6NAla8oBtDHDURQT9vB051gR2KP1+BYw23oGpZrkxHxvqVg7LgZC3JfrC
	9hNUnTX18D7UejLft9JeHKagxcx1ODAfZCLtugI2u1M0yIjSucQzAhP/W2f1k+GEYPNS9QCxXNK
	ZMxL4lS4RIIvYU+seyGG4jP+zqfoVF+nv0/ka2SqYO6qHBmXjhQHWt3mPB+6+Sqqr1LCAmDEiV+
	lzwO7kFjnW74Avu+Hvty3hKWRPU133LO0/u6JA==
X-Received: by 2002:a05:622a:204:b0:4ff:a8c1:b00e with SMTP id
 d75a77b69052e-501982dcb6amr257878141cf.2.1768914896054; Tue, 20 Jan 2026
 05:14:56 -0800 (PST)
MIME-Version: 1.0
References: <20260120-ufs-rst-v2-1-b5735f1996f6@gmail.com> <9e51b504-e0f0-4d17-baa2-387339507c86@cherry.de>
In-Reply-To: <9e51b504-e0f0-4d17-baa2-387339507c86@cherry.de>
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 20 Jan 2026 17:14:48 +0400
X-Gm-Features: AZwV_Qhp14S3f8jxRdEKOTb8-WUOX2RQGlmlwHiEcT4hA3FpWfhKr4Hgbt-e0zM
Message-ID: <CABjd4YwAMbH21jcjhks7ThoXzcF8GeOzBPYDvN+7cip0iA6stg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Explicitly request UFS reset pin
 on RK3576
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_051457_822646_3CFB3717 
X-CRM114-Status: GOOD (  19.21  )
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

On Tue, Jan 20, 2026 at 5:00=E2=80=AFPM Quentin Schulz <quentin.schulz@cher=
ry.de> wrote:
>
> Hi Alexey,
>
> On 1/20/26 1:53 PM, Alexey Charkov wrote:
> > Rockchip RK3576 UFS controller uses a dedicated pin to reset the connec=
ted
> > UFS device, which can operate either in a hardware controlled mode or a=
s a
> > GPIO pin.
> >
> > Power-on default is GPIO mode, but the boot ROM reconfigures it to a
> > hardware controlled mode if it uses UFS to load the next boot stage.
> >
> > Given that existing bindings (and rk3576.dtsi) expect a GPIO-controlled
> > device reset, request the required pin config explicitly.
> >
> > This doesn't appear to affect Linux, but it does affect U-boot:
> >
> > Before:
> > =3D> md.l 0x2604b398
> > 2604b398: 00000011 00000000 00000000 00000000  ................
> > < ... snip ... >
> > =3D> ufs init
> > ufshcd-rockchip ufshc@2a2d0000: [RX, TX]: gear=3D[3, 3], lane[2, 2], pw=
r[FASTAUTO_MODE, FASTAUTO_MODE], rate =3D 2
> > =3D> md.l 0x2604b398
> > 2604b398: 00000011 00000000 00000000 00000000  ................
> >
> > After:
> > =3D> md.l 0x2604b398
> > 2604b398: 00000011 00000000 00000000 00000000  ................
> > < ... snip ...>
> > =3D> ufs init
> > ufshcd-rockchip ufshc@2a2d0000: [RX, TX]: gear=3D[3, 3], lane[2, 2], pw=
r[FASTAUTO_MODE, FASTAUTO_MODE], rate =3D 2
> > =3D> md.l 0x2604b398
> > 2604b398: 00000010 00000000 00000000 00000000  ................
> >
> > (0x2604b398 is the respective pin mux register, with its BIT0 driving t=
he
> > mode of UFS_RST: unset =3D GPIO, set =3D hardware controlled UFS_RST)
> >
> > This helps ensure that GPIO-driven device reset actually fires when the
> > system requests it, not when whatever black box magic inside the UFSHC
> > decides to reset the flash chip.
> >
>
> Would have liked a mention on why pull-down in the commit log.

Indeed. Heiko, if you're going to apply this to your tree, would you
mind amending the commit description with something like the
following?

The pin is requested with pull-down enabled, which is in line with the
SoC power-on default and helps ensure that the attached UFS chip stays
in reset until the driver takes over the control of the respective
GPIO line.

> In any case,
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks a lot!

Best regards,
Alexey

