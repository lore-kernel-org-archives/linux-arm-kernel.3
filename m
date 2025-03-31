Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3BFC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 10:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfQTWTf6PwJHc84otuP/3Oag7lcNdI1Qagn5HFWHEVA=; b=xDzY7HU9VHSI9DxC7PVNh4/QL9
	C9f0CnO2l6HVlKAmYGPiHNopMOiGYi/Y8rtsPatPSVC5lS0402cPEO2iMFJG3i5EKM2r5axizaANJ
	w497EKIWjE89FH7o4p32vPDk67oWCP4qozX9RmunNp1wyQtIHpx/JFF/THMcjDt+QGdpdBdmEKZ0T
	AHHCrsTjdTmUIXneLExLm/4crdMQSXa5Ta1tl5aO1sGFu49n3l+ksjOOqx2fALwyhH+HrjjMicPjD
	uhjHngBMKZ3M50fDIKO9X29toMavC0hZ8Z/R+gvgr9wiqrzrmoigYReW4aAEkACgNgoAztwE4PBqH
	bGvyNbaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzC0M-0000000008Q-3W2f;
	Mon, 31 Mar 2025 10:04:30 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBmh-0000000HZPg-1Tp6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 09:50:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso47961625e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 02:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743414621; x=1744019421; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WfQTWTf6PwJHc84otuP/3Oag7lcNdI1Qagn5HFWHEVA=;
        b=oFfWJx4qHiJ1218WMhDQN4F0k09MtfYr3OdLNxbcOQGCZvPH3Sp86lluGPWEpoxE+Z
         F/Rp0zzFw1yF987kcagEOG5aGmRZSVNUqgWcumjgpjBnXYHXaZYdVxdRmJilUggnkVoD
         ejdbfrXlDrxAdJY+1WNq59QYzisZKGvLLRz3DO+jYoWacPeyS9NF2ny825YDicnmeMHS
         wvY9HN+YPCCuJI8+fkNSa8Z5KcjPs/+4YN150HNuMB3PRh2TcDyGKC0CvD1M9syrmvFB
         4Owc3Pi/JxL4ViDkdDwSD9pz7mhCv5MpPP6SJ1XwJz/rKFExMhBSksZQDzWIoU/cIUVq
         2MRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743414621; x=1744019421;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WfQTWTf6PwJHc84otuP/3Oag7lcNdI1Qagn5HFWHEVA=;
        b=EH/yfOoTEzooO43crFs2OjaoVwWpwArlliwkJRTE3cpHY4Oi2/BHAaQ8Gi+2EHUpwm
         0V/kscayq4Dt4HLGhYvM7bwzioCBkCVK+ZLmX+CjBC+HouC0xZ5zOlksdpwJKHZzfvGz
         ijWMxqkLqyuwBw6LGjWfFfcpxuV5FmDs+xeXB2S/r03Sj/HFhtyP0Rhhl1Bf1eNliED5
         Ionb8sQ/JG9mUdPf5CHWru0gQ0xCQr0Yj8z5PPc2cUzPBjSyEcj2nmgMhXpAznmRWcpP
         +HxJatMu9MqekSuJQ2WojwQexUcYDpTR6aFViSv25aGQmI2b6ciHHtzhKfxiCVQ+Y9NL
         VckA==
X-Forwarded-Encrypted: i=1; AJvYcCXg4lJ4rBxBJYVc6qc5GJW3fgWcdFpB2SLQZoLZtKxwmMMFVqFsOSbJamEsclFxKaWq0YsaZHCy2uMLg9m4Lr5u@lists.infradead.org
X-Gm-Message-State: AOJu0YwD0rjH0HxtO9YmeWMnU23DD4glAOjpfBbY/q86xBScv/rDlmSQ
	RPMD6Zu5PPk6QQx0F84m0zzjfA5IUbOzWfRFfqas2Isnl2waEEkr25uywjmFcXw=
X-Gm-Gg: ASbGncsFB8mI/5fYGEhccsbE9ysixM2y/RR4/r+Oofhl18V5igiIr31YPGsKTP5pJPv
	nC2tGyGWvvv1PyLjrZz7tr2dZ+vUJy4r2Ml3Y0ycfp5x66ecyYtyIi+NjwFboM199JyH7Pmsuso
	fV1pHHYuxTswLUjp/kP+xBzanmK1hCZSgVPAOV+kyCBzX9tPeQtzueETY83W3/KAHkjOw/mA1BQ
	8TntzdISJGmrD1Ku4Yd93QoKJYmXcPNJRGNC5hQe200tOG0qeW9z0fGX424oVGOArSuU5nZF4/+
	EzaqoyPGUiW7ywgeUg2gLU08LYana2Oy7rkAqEmc38rQmtb4
X-Google-Smtp-Source: AGHT+IF3CJoa5gLjBiJodD+/fcAKbJi9kK8EPGZgsz0yOn8C5Pq2tbjitNJRw36ftrGGInm9OE4Ezw==
X-Received: by 2002:a5d:47c5:0:b0:38f:4d20:4a17 with SMTP id ffacd0b85a97d-39c120dec24mr6778714f8f.13.1743414621425;
        Mon, 31 Mar 2025 02:50:21 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff03715sm117091365e9.31.2025.03.31.02.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:50:21 -0700 (PDT)
Message-ID: <4d8d0d479a1ff19bc3e3a8f5832d924ab822f13a.camel@linaro.org>
Subject: Re: [PATCH v2 01/32] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo
 Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette	 <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King	 <linux@armlinux.org.uk>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon	 <will@kernel.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will
 McVicker	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Date: Mon, 31 Mar 2025 10:50:19 +0100
In-Reply-To: <20250331-prophetic-convivial-dinosaur-efb1af@krzk-bin>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
	 <20250328-s2mpg10-v2-1-b54dee33fb6b@linaro.org>
	 <20250331-prophetic-convivial-dinosaur-efb1af@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_025023_407227_14381416 
X-CRM114-Status: GOOD (  15.62  )
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

Hi Krzysztof,

On Mon, 2025-03-31 at 09:34 +0200, Krzysztof Kozlowski wrote:
> On Fri, Mar 28, 2025 at 01:28:47PM +0000, Andr=C3=A9 Draszik wrote:
> > =C2=A0allOf:
> > +=C2=A0 - if:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
st: samsung,s2mpg10-pmic
> > +=C2=A0=C2=A0=C2=A0 then:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg: false
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samsung,s2mps11-acokb-groun=
d: false
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samsung,s2mps11-wrstbi-grou=
nd: false
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oneOf:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - required: [interrupts]
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - required: [interrupts-ext=
ended]
>=20
> Drop, you should require only interrupts.

As mentioned in the commit message comments, it doesn't work with
just interrupts. It appears that dtschema's fixups.py doesn't
handle this case. With just interrupts, DT validation will fail
if the DT uses interrupts-extended. There was at least one other
binding that specified interrupts in the same way, so I went with
the same approach.

> OTOH, why regulators subnode is not needed? Commit msg mentions they
> exist, so they should be required. Binding does not change because you
> added or did not add yet some driver support.

I wanted to avoid DT validation errors, because we haven't started
working on regulators yet, and it might take a little while until
everything is in place.

I'll make it required in the next version.

Thanks!

Andre'


