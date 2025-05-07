Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809BDC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 06:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HufoIjmNyVzcJFg0jomA8QUVg94XLpMUqr8P5yXKbvk=; b=5FPSaQwVXgKn8j2HIpW0ArCKjo
	TD5pTzXEf177iOJifiqOvvO7fEY84yJ7AHO9Yw9+4qGVRveJLv8QQi/lFIZZNpCOldyHnmItym/Ry
	UrH1qqGasTktNQ1LEg8SuOtIRTYscqh8IQmDNbmZd2jqWBPTP1pU/IyJOjRBhb7VSTX4Iez+nZVOa
	OwJfocYFYueSdGlGiFFl4O16Vd7TbzaDdHJhK1jEcMlguKS5GLY2ntSWUQww326MysWWKWF3ARykH
	NT7l32GPPTrb7A6TYMv+G0iSL7E8sY2g3FOo53vW11ITxITbWnN0tPAAZpScMyFJiZDkLgwBCB4MM
	VASe+ITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCXoz-0000000EJu8-1zU6;
	Wed, 07 May 2025 05:59:57 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCXmn-0000000EJey-1En2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 05:57:44 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-47677b77725so75296891cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 22:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746597460; x=1747202260; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HufoIjmNyVzcJFg0jomA8QUVg94XLpMUqr8P5yXKbvk=;
        b=cc7sZd6JBi4KWSrcWdbsh4ZtoLC3snd5sLpjI9OZUwFaMLlhYgCu+GMY3gSL3KsId+
         9h267mUYT30jWB0BwLodsZbfQ0d1Iw4iuVB1WnRFu+Fftf5MOnpuZ0LcEcHS4tkh/Uhk
         UXRGpaZukDCTr2hQM01t97F373JZnFJ46x/iMDccUngY564s9vFOgQwH8tB/PQoae70n
         4AaOIh66DJNFCmN/iK5hXOa8O0BeUT/oBEsSqJp5+S3hQO59c1CjlayFu+9k/fWOseZ1
         squkXbKLi1JD13NDhYKgS4PJtdjQ/dGeJWlz4P//OJwRlno14GzY8n+6FtkC/ekCouwu
         SzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746597460; x=1747202260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HufoIjmNyVzcJFg0jomA8QUVg94XLpMUqr8P5yXKbvk=;
        b=ZczcfJ95g0uLUlbYrncQEh+fjddC96cr6TgbZTQIibDeyNK+FFaMq2TwTjVmR8lt2Q
         9/ASr0pKN3vl/29Vy5PDdyNgARwJjE5QE2eVInuwH7sS7nzflXMv6LK8IQxEz5/x+4Vo
         gNbikCN/0UQ47Xg0Ia2hdgkT66xvt3+K/eIZ3W6P7ugwWGK5eY/VgHxU82AQQBGfC92v
         xNuf5a02sSmI7jtufqjC9cOIzMRZdyO3rn9JEgtDkkIhWMgtebGlf+Zoy5cXL9+rN1af
         pYszOWPTnvBo9KVlAk5XJV0EjxoHwK0vJOdYpYGQxooJ1Rg8kEIrUhkgoQNGwJKs3rBe
         YQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcbfrq3izbb7nkPfdptCT5cbzAbxuyAjIx1p+PcitkodT18LI1bxNcsjksgLAX1uxlA794Wrof93wtpVT6CV43@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1o7tHukS+nbmtHLtqLl5hLwo2rt92ehO5S7bilG1pjXk533jo
	89eE5VgoPFUuaMyPufziGQUqPcHjEN39hleyLl44k7p9+aE5ww7tc4a8ASfDMhEFD1FdsgvK1x8
	CmM/mbeov5a8uhgqfhUgixKGJv2g=
X-Gm-Gg: ASbGncsCrt/cug3JVctH0bIRRAmtj0wsBayFyoRQmRfCfk/EOog2OIetAln/EmKaPLO
	qmh1K+tprG+4pGebWg2fL3oWxZu8diSRzw+3LsmVHvuJGtOtTI8JIB9pMt6HaXr7rzujz+o3EWw
	Rr5IxxXwgJQBHYpVwYITSr
X-Google-Smtp-Source: AGHT+IFRCluZQlhxPKsFdNka+okgx5aQmUZgSazAz02utL1/C+ZaDsPFqak1m4n1xLXLSRPrTvV/l0A6YJSFNyvzJeU=
X-Received: by 2002:ac8:5ad5:0:b0:476:8d3d:adb1 with SMTP id
 d75a77b69052e-49225a42445mr25889741cf.21.1746597460173; Tue, 06 May 2025
 22:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com>
 <20250507-vt8500-timer-updates-v1-3-6b76f7f340a6@gmail.com>
 <8d3c2ab5-dfc0-4a65-94c8-48a94c850aba@kernel.org> <CABjd4YxjC13H9G+ZpQO7EcmA4quu-9OMYjc5z6W5z+f=pwkTbw@mail.gmail.com>
 <9e8f1384-ccc9-4c99-bb31-2d3868bcd418@kernel.org>
In-Reply-To: <9e8f1384-ccc9-4c99-bb31-2d3868bcd418@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 7 May 2025 09:57:29 +0400
X-Gm-Features: ATxdqUFg7Y2xJtDfnU-UW7rha7DBsuYJ6UYd2cMbpsuR6mErQtZfh0ULWLYbKv4
Message-ID: <CABjd4YwGMe=iZ_jsOLdLt0p43vP4ZSEtUa0X0xzKLA8kfatVqA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: vt8500: list all four timer interrupts
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_225741_330726_5FC81781 
X-CRM114-Status: GOOD (  16.16  )
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

On Wed, May 7, 2025 at 9:52=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/05/2025 07:48, Alexey Charkov wrote:
> >>> diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts=
/vt8500/vt8500.dtsi
> >>> index 2ba021585d4889f29777a12473964c29f999f3a0..d1dd37220d41becece5d2=
4fbb19aa71b01723e35 100644
> >>> --- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
> >>> +++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
> >>> @@ -111,7 +111,7 @@ clkuart3: uart3 {
> >>>               timer@d8130100 {
> >>>                       compatible =3D "via,vt8500-timer";
> >>>                       reg =3D <0xd8130100 0x28>;
> >>> -                     interrupts =3D <36>;
> >>> +                     interrupts =3D <36>, <37>, <38>, <39>;
> >>
> >> You need to update the binding, preferably first convert it to DT sche=
ma.
> >
> > The binding change [1] has been reviewed by Rob and is pending merge.
> > Shall I fold it into this series when I send v2?
> >
> > [1] https://lore.kernel.org/all/20250506-via_vt8500_timer_binding-v3-1-=
88450907503f@gmail.com/
> Nothing explained that in cover letter or changelog. It should be
> obvious for reviewers where the bindings patch is and what the status is.

Indeed, I should have mentioned it in the cover letter. Thanks for
pointing it out.

Happy to resubmit the binding change as part of this series for easier
merging and full-picture overview: I will be making a v2 anyway to
address your other feedback.

Best regards,
Alexey

