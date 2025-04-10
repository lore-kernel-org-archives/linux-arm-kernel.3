Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449FCC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 18:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzsGSfN3zKe9L7HiNcL3vhZCWqusG/ETlw5Q2TYe9Mk=; b=IFqiYAh5but2Vz00n8vjt1SSbt
	x4czXAClF+iRAkg29Yj5S87bRZgO4SXwJyz0DOhdvVoYx7LszBnk3R8ZKmH7yWsepOOx53pRkQwjH
	b07Z/bdf8wr1NjCG0+4UuWWlrwYdh5fFSiaiJ4x5cGNFTmwaBcoJncrSrBgOGjuQAKbH/1S93W70n
	vRUhHKgSnkSdU5+ap55Dmx7h3Yi69YxEtGZjqKOO/3l2Y+LxS6ZBXAKqLbAEKzf54+1lpPMExDP0V
	ckthjufvcG8QfbuiPcoSGyDQpJ4n+c4lXmoez1xAD6SfwLRR1x5XXfeJFuS3put3jx0zcFGOGT7Mg
	fZwj1MPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2wF6-0000000BTfh-21qn;
	Thu, 10 Apr 2025 18:03:12 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vV1-0000000BLRq-1eT7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 17:15:36 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-70427fb838cso10239377b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 10:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744305334; x=1744910134; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzsGSfN3zKe9L7HiNcL3vhZCWqusG/ETlw5Q2TYe9Mk=;
        b=bWA+Llsu+XcZHJz7WNZKHH85PKMRRu9ve6rpkdrCgYCmKUpNgVst+PEiPzqxYcgWDm
         8jYYerayvSDIHhYeHVV/fNXVDVMJptBsmLHaTocy5GwbYQ/ILaMrT4xReZVRGHe+MFra
         KAlQvdr/7ZHH3bGiK5SEEw8Q1u3lzDjsSX7jkwg6k2e2WGwf+L4YC96ZyQXqvsj0FhVG
         LRI3LMsr9X5ebX/0i+k8Jkq+PEa3YL5agqnPnxIBAKCXyCB6W++9dtPoeJfqXdehqsJY
         /HrKiXx7msQrVTnGbdSDB9NjqMaS9r+chd1zhc/6subpr9O4JvTdQHGMg5EJqsJYcZ0l
         yAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744305334; x=1744910134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzsGSfN3zKe9L7HiNcL3vhZCWqusG/ETlw5Q2TYe9Mk=;
        b=q9z4Xl8ZDrC1W+uh+UcZnX04HtNM2mnHrBrwtA4n6co/ITNhw75gTfbk6g0jngprqo
         NaK6BH6GKR6vP9bCzElRNDq7+31ILkQp+h89TalAoZMHxwQsSRzcMdMXHfOffVCzVJqF
         kSCKI67nYOMaDvibeWGRaQuX4jXev1FrO7CWQ60bqNprNR3C2FTffbEm/ZWMbiP7w1rc
         bmiHFfAn+bsRoOaqDKrrDMprb4zBRbiRfXj4H38AcdQEF+4U7yPtiNFSpPCkxvlvPH0Q
         MnlOJ1PqWr/Z2jvyIChWyJXtFpl4O/3h8Y/cCy83B4PshDDJ1zWTXOghEnUz+BwKJKVz
         cYGw==
X-Gm-Message-State: AOJu0YwMG61gklBtyLppqXfCuB2TLNkbnIFHfw36Ve/fN7dzyuRmpb8S
	b/Oy8VjJqivoTdQEgOLTjmzHSUju1Fidl/mwueb6Y3/hP4vSIZhe0pe+ZXBgJtfe48nszO5OJVF
	Xu/GWT9oU4vr0rSA9Xm2D5uGAysg=
X-Gm-Gg: ASbGncuoymPRzNm4ww99DmjIjvOruk24aD3ihHWcjlT4BfE5bTuFtngF5m10xLY9bOY
	Uve/uld3KiG7JPf91IYEk6K6hnbf3+IHiEuFz9LxnSY0YXi83V2IAf1qRW0imoCCyNOX+TlIHxQ
	0GtOhCkRC38cXoL3gzlilU0lM=
X-Google-Smtp-Source: AGHT+IE75dOoZN09smDMXY1cC+wHVZjhX1T1PY+rQ44c2yKgN9zJ/mwy/47jExP1TRN/IVjGQE47AEM8UYqhmhfw6Bg=
X-Received: by 2002:a05:690c:f91:b0:6fd:4849:62ec with SMTP id
 00721157ae682-70549e7fbdcmr56554307b3.12.1744305333850; Thu, 10 Apr 2025
 10:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250408231823.826163-1-robertcnelson@gmail.com>
 <20250408231823.826163-2-robertcnelson@gmail.com> <CAOCHtYhFKO=LRN8qp-w+rkTGKJ8t-LnqgqbQW9P6CO3=EeuufA@mail.gmail.com>
 <20250409130918.d3cyzv3to65oktv2@vision> <CAOCHtYgpkBXZmZEDz6gUCO2x+WGA_paKHFHS-Br=ypo+AFrBmw@mail.gmail.com>
 <20250410120822.3vsrt42iyfs75h6q@spearhead>
In-Reply-To: <20250410120822.3vsrt42iyfs75h6q@spearhead>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Thu, 10 Apr 2025 12:15:07 -0500
X-Gm-Features: ATxdqUELa8ezNkTE2O4f0TujIZmAX4NjS-OVoR-6J0hXWh-oJ7Wu0PtUUFD8BoY
Message-ID: <CAOCHtYh7LWhTBOSsua9_=wxSTNt9HmvUaAFCiVS6a8G6dV4AoA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: Add k3-am62-pocketbeagle2
To: Nishanth Menon <nm@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Andrew Davis <afd@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Judith Mendez <jm@ti.com>, Andrei Aldea <a-aldea@ti.com>, 
	Dhruva Gole <d-gole@ti.com>, Jason Kridner <jkridner@beagleboard.org>, 
	Deepak Khatri <lorforlinux@beagleboard.org>, Ayush Singh <ayush@beagleboard.org>, kamlesh@ti.com, 
	praneeth@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_101535_429379_94B1D7F5 
X-CRM114-Status: GOOD (  18.27  )
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

On Thu, Apr 10, 2025 at 7:08=E2=80=AFAM Nishanth Menon <nm@ti.com> wrote:
>
> On 10:12-20250409, Robert Nelson wrote:
> [..]
>
> > > Any idea why we are crashing?
> > > https://gist.github.com/RobertCNelson/c68c96a8a1dc6e4d39d8c48fc13ca1c=
1#file-gistfile1-txt-L311
> > >
> > > I don't see the same crash in beagleplay:
> > > https://gist.github.com/nmenon/5709a8714d3ab31cac5c00b515d04752
> >
> > On 6.14.x i have a little more, info...
> >
> > I've got all the CRYPTO stuff enabled, pretty sure that comes from
> > CONFIG_CRYPTO_MANAGER
> >
> > CONFIG_CRYPTO_MANAGER=3Dy
> > CONFIG_CRYPTO_MANAGER2=3Dy
> > CONFIG_CRYPTO_USER=3Dy
> > # CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
> > # CONFIG_CRYPTO_MANAGER_EXTRA_TESTS is not set
> >
> > https://openbeagle.org/RobertCNelson/arm64-multiplatform/-/blob/v6.15.x=
-arm64-k3/patches/defconfig?ref_type=3Dheads#L9578
>
> OK this looks like to be a independent pre-existing bug then and needs
> to be investigated, but it is probably independent of this patch itself.
>
> Could you share a clean defconfig bootlog? I have no existing scheme to
> test this on my end. In the logs, please also print
> /sys/kernel/debug/devices_deferred to ensure we have nothing sticking
> out in our defconfig?

Okay stable v6.15-rc1 with arm64 defconfig..

https://gist.github.com/RobertCNelson/666638abac8eee4ed573997996362450

root@am6232-pb2-87:~# ls -lha /sys/kernel/debug/device_component/
total 0
drwxr-xr-x  2 root root 0 Dec 31  1969 .
drwx------ 44 root root 0 Dec 31  1969 ..

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

