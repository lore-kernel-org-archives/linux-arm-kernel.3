Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE6FE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 17:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBAUUgHHCorAYYhe1b/RpcaSfhfVVFDNGT3lM1F0Fxg=; b=1b6zk5jYliAR/inW6JVQUFqam4
	avwm9jCvRBPB5ymbJcVUeDINpN0Snu2GB5V5Af9bM7YVBYr2yEzgLo7aEnC7+gawPgj8BpGEe3fgp
	cKzBYQU6cGkCl436833JK5HR7jWcIRtGa2MBtFmYnB9f6Zi8QcYuE0ZFGwfSTATW0GJQ+iuWNaI7B
	cP+RQAubt2k2hQHjg8wXZ91626U4nwb7HjVDGbdtjdljgiYykWOxr0NQ22QD3t1qT1b2IGt56KrFq
	jfLdmwokoKX+P2wmV/zRRKBOCMK4m9QttuaokK8ZiLpzYnXcR6Us969xkrHHCjqosvXPMtVeYuj4f
	GlaX0nlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQvc-0000000FffK-3d0e;
	Wed, 11 Dec 2024 17:55:16 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQuZ-0000000FfSe-0mOx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 17:54:12 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3eb87127854so288308b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 09:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733939650; x=1734544450; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBAUUgHHCorAYYhe1b/RpcaSfhfVVFDNGT3lM1F0Fxg=;
        b=qKV2stB/dYUVqrY8dOGfMhycNzx5L1yaQiTCjhYZSA4dbqoiAzQeiLEuLA5lxwJgAX
         v3/NU3CuriYjXT81bw3mtjdDCgRYdmHw6CpMbjq3kllAwIePUs4AIh15xy1qlwWCoXpU
         yx1dvttWpAVGtLmfGhNhDGRNpm34CUU386QvfCUnRdB0foSXWESAi26Ptltuq2XH4i2B
         1wlwToB6O2v9otLZTwUbYY6umy7w4PNrExW2B/c3GNGKqUyoq0HZbTAh6Ma4nYixyrBC
         TIXOchTsGx0QTrFgMQ3rwH0dstwcqhwYkzOqQFLSXbfPu5oIM0OV/HfP8JEj8M+fzcaj
         vp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733939650; x=1734544450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBAUUgHHCorAYYhe1b/RpcaSfhfVVFDNGT3lM1F0Fxg=;
        b=ZXOpRQ92Uo9PXaFoBd1mkeBWVlce8y8Jqcjs9Hy5UHrULPL4DqWdfRYvvv5l5ir6D1
         vfsiYlkzy8ymB3CT1QW3hN+ZfnUtylR3YyFZVq2R1EVp52LZXoXLtrrZBDj+KIsETe+x
         dW9V7vQaT/rWCI/Jx4aNYsMRNrbtx1oHpBx1XHZmQOWHxsuezAADkY+dDUNMnj4tI/Xb
         kx8I5dzetuBiJNwKzy8GI17FyDch7imP9jb40t9fl73EginOlrdKFcON7Os0DYsF4HR9
         iNXCnTyvpwv+LS62C8sOdg03ybX+jJtU/vbALw61FUqW/DIaMriG3O3/HR4waIiOU0KX
         XZvw==
X-Forwarded-Encrypted: i=1; AJvYcCX6KRTXqnVVMUTEfl8l3YWMd85mfK1x4pB7wYeMxa1MMjMyKpddmwHjeMclj4ORpWySB/5WspdUStm/Yd4eIKw3@lists.infradead.org
X-Gm-Message-State: AOJu0YxzA1L6hsc76kirJVFCviEnPoDNV7xKtkLb6YAdKIWyvTy/1rbX
	Xdkn2EuFfc3a61ieJ2PstM49XcN7oJWpe8d2OAKI0aYD6JQvr1ofwpSo9LZ6vJzH+rc1sOxjFf6
	tjgcPi2n0+AwK2otvEmTzdfxtM+iP1oKwGTp5RA==
X-Gm-Gg: ASbGncsSNKyyiJvk1g+98zkw6/fAMjuoV3xJ782Fzc7jC/8g/nEh2cWRKbAFfY+LejD
	mV4giXwH4q4xhGKKpRIJVSS90T7FVq0IwpRc=
X-Google-Smtp-Source: AGHT+IFfj39z5VsWFUtc547a2JiE2gqj7fMrc6Hgv7LJC75wfYKzbNhVcat1Y4z8nTrgUp65iUPhRZVJvBmlgSE3NeQ=
X-Received: by 2002:a05:6808:1304:b0:3eb:3cca:8829 with SMTP id
 5614622812f47-3eb85d14a42mr2424138b6e.34.1733939649689; Wed, 11 Dec 2024
 09:54:09 -0800 (PST)
MIME-Version: 1.0
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
 <20241206-gs101-phy-lanes-orientation-phy-v4-7-f5961268b149@linaro.org> <CADrjBPrz1qUxbEVFR8OT785xLPwWmu3_ZThSne+EtpS8_NHEEg@mail.gmail.com>
In-Reply-To: <CADrjBPrz1qUxbEVFR8OT785xLPwWmu3_ZThSne+EtpS8_NHEEg@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 11 Dec 2024 17:53:57 +0000
Message-ID: <CADrjBPqW81kaK=Wco7wMg50APTXGRwhnfFjbnogrSQ-T_mWnUQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] phy: exynos5-usbdrd: allow DWC3 runtime suspend
 with UDC bound (E850+)
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Roy Luo <royluo@google.com>, kernel-team@android.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_095411_244585_48A85C74 
X-CRM114-Status: GOOD (  24.26  )
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

Hi Andr=C3=A9,

On Sat, 7 Dec 2024 at 22:03, Peter Griffin <peter.griffin@linaro.org> wrote=
:
>
> Hi Andr=C3=A9,
>
> On Fri, 6 Dec 2024 at 16:31, Andr=C3=A9 Draszik <andre.draszik@linaro.org=
> wrote:
> >
> > To make USB runtime suspend work when a UDC has been bound, the phy
> > needs to inform the USBDRD controller (DWC3) that Vbus and bvalid are
> > gone, so that it can in turn raise the respective gadget interrupt with
> > event =3D=3D DWC3_DEVICE_EVENT_DISCONNECT, which will cause the USB sta=
ck
> > to clean up, allowing DWC3 to enter runtime suspend.
> >
> > On e850 and gs101 this isn't working, as the respective signals are not
> > directly connected, and instead this driver uses override bits in the
> > PHY IP to set those signals. It currently forcefully sets them to 'on',
> > so the above mentioned interrupt will not be raised, preventing runtime
> > suspend.
> >
> > To detect that state, update this driver to act on the TCPC's
> > orientation signal - when orientation =3D=3D NONE, Vbus is gone and we =
can
> > clear the respective bits. Similarly, for other orientation values we
> > re-enable them.
> >
> > This makes runtime suspend work on platforms with a TCPC (like Pixel6),
> > while keeping compatibility with platforms without (e850-96).
> >
> > With runtime suspend working, USB-C cable orientation detection now
> > also fully works on such platforms, and the link comes up as Superspeed
> > as expected irrespective of the cable orientation and whether UDC /
> > gadget are configured and active.
> >
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> As mentioned on the last patch, in my testing cable orientation
> detection is working, but Pixel is detected as a superspeed device in
> one orientation, and high speed device in the other orientation. So
> you should either change the wording of the last paragraph in the
> commit message (assuming you get the same results as me) or make it
> detect as superspeed in both orientations.

You can disregard this point, I had a typo in my test setup :( I just
confirmed that it is detected as SuperSpeed in both orientations.

Thanks,

Peter

