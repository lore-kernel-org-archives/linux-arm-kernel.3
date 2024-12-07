Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0349E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 21:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfKGW0QrWsaa6qvorIS98f1mLt8WgB4RHKxY9T6NNQ0=; b=PVbS99WTZD+KUOZCgksh4rS3i9
	9pbyUZFQGWxSJBoCDoa7DFSC08XGJn3HFSKHnV036pc71C3Be3UCHuKyudwlQTK+jpIXV+S7ibsLW
	5qdm9diIb7opqG8m50H3PbhaziX+XT9zQUNJFsnMAiw1LmQzimnOiWTEmb6o7yuLvveVp/sWPXgOU
	UW+8aO6U3N2N9ZQQ2TewDSJ5TIa30T70+VeJy2VRw6V+P4RVNnu4qLG573+yGzK+ZgNQBnIAK7mhm
	x3ZqQlQDGWam6ToI7rbv07n0SPTIPRUCM53t+Iq404egDSVi1UTtfiiul+Gt2k/ogIlPcMscoyGOu
	Scc7fHwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK2Pi-00000004RLe-0349;
	Sat, 07 Dec 2024 21:32:34 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK2Of-00000004RG9-3rZp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 21:31:31 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5f29db2614eso326147eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 13:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733607088; x=1734211888; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfKGW0QrWsaa6qvorIS98f1mLt8WgB4RHKxY9T6NNQ0=;
        b=nBlDmAr+Tl7h0E5VeyeiDSN/NwOpWdXMZUK08pSTnTif/mIC7W84vDFWiPyLqh2HX/
         5wEH6keb2eSle1fhXwLB4xGrD9KMOR4w1RUOX0VMic/OllOVgJYEIIU3oqoATqsfieRn
         KKO+AC9YXUzb2sa2CfRH3ThTkcSwh/SygxKsmq98b39EYBbUlG1GMwnGhGC4GLN50QuG
         9+l3q4V4/9oN3hzMi1cDzrT8THx6kl4CaCFsBncM8bbPaavuqdNmnWGEElZ2NrQFz6Uv
         6QZ56w93HMHHgYhgAjcXJajo8d6jZPHmdGx1zM23ur6g6PrF0rRGJEwF8XSOhhoAjLQL
         iBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733607088; x=1734211888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfKGW0QrWsaa6qvorIS98f1mLt8WgB4RHKxY9T6NNQ0=;
        b=omuUIsa7zkEgOQ0+fxO0WUvbbAouGhN6pw9jdGx67HbpqG5KUMv8ceEbGiSzuqPqfc
         XcsRsZ7aUj4pqwOKHMhTpZCs3SGzwtviXJVXrWxA7k0sT6GvrXcv9k7ChF9cib1zCjeJ
         qop4zr5PTRwfcHE/Fh34y105r4nbSyDLqbpLxo0dvHPMIpNJYITrbM44Wf032XOw5IJh
         TR35Y57dzngU35Bug7COLYMLH9Qg14h4FtJoH9wARWZQBNDCIEQL9YiooP5PqyDEWAWN
         mYOiFIeOUKfHI4t8WbWEY6NbZRmBnzU4B2R26ppUKgRFRQk1M522ap9wCRzpZ5ZhR7lY
         vjeQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+QJAqYAenRFsmT23wyAOhEs4GWeYeg2VD8gbIbQ43tucPy4n4G9kcmRInrDzfmo9zlCqEGZWVnFMIMFU5dtnZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyU/m5HvvwzhuSs6QKwfhbM9sKm49fWyOaTdgbyAX8WoaCoIPxw
	Z+1UomAkHGdps/YVCaP1bnXVLEmTwxwtVuwycSbnyN1AKnYLXrARALH2ZRF7n2NqpZ/5vZBI6TC
	XcueBeQaLa1YIg1UYFURYzqCBbv2cuscIKusjPw==
X-Gm-Gg: ASbGncsQ60vHwsYtARzLV5ntICfaEKNiLJZYn2T6VV62zksYrr0/enfiEMM3B4Zj7qk
	CUIKyTEINNtYk69OAG7Sm6S54/mbvfIU=
X-Google-Smtp-Source: AGHT+IHrxIKj+TInrHyVvrustF8TDSTRjzN9vK1a1fqIMmmjrvizhO/kVBzPl/ZHpL1kwxUVz6dUbaTqxj9Qq62lNHQ=
X-Received: by 2002:a4a:b604:0:b0:5eb:5eff:afbb with SMTP id
 006d021491bc7-5f27737f2a8mr7037701eaf.1.1733607088103; Sat, 07 Dec 2024
 13:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
 <20241206-gs101-phy-lanes-orientation-phy-v4-6-f5961268b149@linaro.org>
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-6-f5961268b149@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 7 Dec 2024 21:31:17 +0000
Message-ID: <CADrjBPoZqbAM=2zOdgXD_dTrgh-J7yE+OX_JSVJ42Lmzb-DPEw@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] phy: exynos5-usbdrd: subscribe to orientation
 notifier if required
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
X-CRM114-CacheID: sfid-20241207_133129_978477_1EAD9006 
X-CRM114-Status: GOOD (  24.97  )
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

Firstly, thanks for all your work getting USB on Pixel 6 / gs101
working upstream :)

On Fri, 6 Dec 2024 at 16:31, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> gs101's SS phy needs to be configured differently based on the
> connector orientation, as the SS link can only be established if the
> mux is configured correctly.
>
> The code to handle programming of the mux is in place already, this commi=
t
> now adds the missing pieces to subscribe to the Type-C orientation
> switch event.
>
> Note that for this all to work we rely on the USB controller
> re-initialising us. It should invoke our .exit() upon cable unplug, and
> during cable plug we'll receive the orientation event after which we
> expect our .init() to be called.
>
> Above reinitialisation happens if the DWC3 controller can enter runtime
> suspend automatically. For the DWC3 driver, this is an opt-in:
>     echo auto > /sys/devices/.../11110000.usb/power/control
> Once done, things work as long as the UDC is not bound as otherwise it
> stays busy because it doesn't cancel / stop outstanding TRBs. For now
> we have to manually unbind the UDC in that case:
>      echo "" > sys/kernel/config/usb_gadget/.../UDC
>
> Note that if the orientation-switch property is missing from the DT,
> the code will behave as before this commit (meaning for gs101 it will
> work in SS mode in one orientation only). Other platforms are not
> affected either way.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>

Notes on testing:

I tested this series with the corresponding DT using a Pixel 6 device
with 2 different USB hubs and also plugging directly into my laptop.
I've tried various combinations of plugging / unplugging from both
ends of the USB cable and changing cable orientation. With the latest
series the disconnect/reconnect always seems robustly detected and
Pixel is enumerated as a USB device by the host, adb connection to the
phone is possible even with the cable orientation changing between
disconnect/reconnect.

One thing I did notice during testing is that in one cable orientation
Pixel is detected as a `SuperSpeed USB device` by the host and in the
other cable orientation it is detected as a `high-speed USB device`.
Which suggests there is still a latent bug in the phy
re-configuration. Although I think it is fine to fix this
incrementally, as prior to this series the other cable orientation
didn't work at all.

I just tested my personal Pixel 6 running the downstream production
drivers, and that is detected as a `SuperSpeed USB device` in both
cable orientations.

Thanks,

Peter

