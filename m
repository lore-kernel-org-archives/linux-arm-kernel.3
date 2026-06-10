Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC35CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 09:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrbLcQyisI1OEjYF2JehulwALSIbAajyo9F3M0zxr/E=; b=4m8d7ERqXndFyI+H4tj495Oila
	Jx9HMV3JjmGgoQARZPTTlXaK9+WNd4O3ka5QFkAixN5RCa62eIiyAgR1TvVinu/Zcg2xmdpRCUVz9
	QjHg+30MkrhxzAj4PQPlh3OgzfZYlxiweB8IK2orPHptcZzpcDUjN0uWP+kpLemYHjs6Ru6wDrkDF
	DAQbWdFfW5n0Z39AEezHPsyGsuXGMTb7IfvQZHB2a1eZxkAucr+3C8EAPc61JATWykbpO6pqvZuFQ
	awWcMy6rPWMIICDHKqCk7UtPdyI8OI0chLYXpCO3XD2uIMXgE1+T0MqocqHJyde+07AFOXtfHIheP
	AdbIRbLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEnf-00000007APH-2zwu;
	Wed, 10 Jun 2026 09:00:39 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEnd-00000007AO6-32U9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 09:00:38 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-7f4f1c27e61so2593787b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 02:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781082036; cv=none;
        d=google.com; s=arc-20240605;
        b=WetR9yKxE87r8fBzQMNnaGC2QfZ6hzpM6T4E/4wAbDCQtzGgkUYiOumgh/GVdsrbxF
         tErD0Z6n72jQN80XURdfJaP96Zeo/FLutrb5CuVNB3J8fct5cYcGNrlayAdmCVZIjJpO
         6BvTA0kfl2SjnUqEaymh3iFGIxACclp8RKd5N0TZjF8+YXRYv7TJaKUb2d858om0LRT2
         kCgXF0qbPy8vbtE5vqfripeWGvbOt3ayt4IJT5J5mZIwDs+Vvad/8w2j4iurAKdzfD3x
         jI7tieBcH83eFmmyVQgyHTv9eyZ3bTFp6bXw3E3J/FOHKkOhCsNdpcGUhfZsszwPNGht
         2pLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nrbLcQyisI1OEjYF2JehulwALSIbAajyo9F3M0zxr/E=;
        fh=Vo27Zus8dWAdYg4HwAjLS768urCmYjxPbzGmJp0pRsw=;
        b=Mf6mt9txqmsmDFSxtROeNgjOf8CCzG19UoqiyWqFQ64tjosioDtzYIS3mBHy40SZul
         jC/XcbnlgY8QyRqcgul9On7X5mbDLIe7UTKqfq3Tt3QMKJvM6qtKELOgf54CMyvAR58k
         q+Qq4Odd5bWznnantXTwZWPsb6a1k5wMDiAClXBpQbJCejljRnFnsJUUZiWZBauPuJti
         DeGHD3I9iEQW9Iymr4sy9/NW5FTePvbrb7gVqUeKSzf1vXiorBLrJmK7G9dA4k1ZfYg1
         F0gAzMXgLiFuNSRdj/0p7sITstAk28JV9wSpRw42wsONeiwh/FPuf9SNf/z4Tdqksqle
         I3yg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781082036; x=1781686836; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrbLcQyisI1OEjYF2JehulwALSIbAajyo9F3M0zxr/E=;
        b=m11SGb8baYrqLaVzKJPK+1pyaxi2DReHyOS1swQvlXXnwi5cQIP+JrvjHLKd+9xdGi
         P2au1Q+cqVfKgCfvmDC3iwqtgIPolWdUAtArMQ1rbS6Rd/ZH8qGXtog9SJ8Wdy5wTBwo
         M8RAbyypDzKm3GI7tIw9xhMkbBcQBsBKsCgw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082036; x=1781686836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nrbLcQyisI1OEjYF2JehulwALSIbAajyo9F3M0zxr/E=;
        b=C81M4LDuItUo21Px4T3GTwSgssddHi+Er0Cmy6nEIkVaCZcCEAUHftEHBbEX73HtS6
         6HTlD91yh1EzIpseYzQHjCZKb6jki4HS+HjghGjtdKjX9O0lbyMFSEDEv0zaYsz6OqLP
         FsesofVTd2CQ7nEQ/nLHKyBc98YLgmDT5ddXz1hj8t045mEcJPdFWGCDa7RHzdUE1M9X
         MtdzrNOuRSkBUwPQKOdFvEgeLtUR2uw30a/049uuJwlBygadK+sQ41fzGvGCqIYipDUK
         d3egDKo7akZP62pIh90BIdSUiiHOX+jidIRqqbloDhfyxYKpBso3lh0tfhR2bB1zcYDb
         JeNg==
X-Forwarded-Encrypted: i=1; AFNElJ+yqbHxe1mWRWcTXw0OANmchu/3YSUb+a/l2s1w05M0HGNmGkdlA2otoFKwRyDRGBuioSvZAykNZvqTrVRZexvo@lists.infradead.org
X-Gm-Message-State: AOJu0YxK1+3uBQIuAdChLjd4wRu6vY/WxMRgEQihaduKfSKEnwbwUigS
	xHCBX0XpodDC+4AXQrlPC0syqF9PThT0bTuejhVxkv3UF0bhitV7qsGCR/UjUUSdk8QdDlifmzB
	I8Dgo0S5UUSfvmnOP/4pZga+WrHH2XJiykialDsFi
X-Gm-Gg: Acq92OGXg/ivoqHHGh+mYOUp4zTUHlSLelZAWm5XRuHcFqBHDR6eLLxcn1cFKiSl3Be
	OFCfpfvpmuRoGSB9Fv7rmRzXRHt/OjgK7d0QL9RURzLcPaFkdBCtSarskwiVfEJB7RnY7YSi8c4
	G/8X3qfiU9kPqUvOe3ojo7f83lX7RZC7HPAA8j1RDfBFbO4kYTI+MrGItUSpGuNUFUm8DP8hTT5
	HW8McLhI9fbHMi0JpM5T2OiTij43G+qg2suGS9DpvFH+yNJIuazEnvIrIg3nr0XgWT4b32N/fIY
	jG3IBeYx6VhkyrTbtzApRGqq1uT1Nw==
X-Received: by 2002:a05:690c:6c08:b0:7bd:8d1e:39fb with SMTP id
 00721157ae682-7ed0a4ed459mr225795957b3.7.1781082036496; Wed, 10 Jun 2026
 02:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-4-wenst@chromium.org>
In-Reply-To: <20260610084053.2059858-4-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 10 Jun 2026 18:00:24 +0900
X-Gm-Features: AVVi8CflqNzYUTj7jVe9ENVhBouReNOK4zYnRNLDpQhNXfjJp66LGpOOH45Xjpg
Message-ID: <CAGXv+5ENxq3B63M-HnW95we+2r+WLfCLm5TZ820zWiC8FSakSg@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] power: sequencing: Change CONFIG_POWER_SEQUENCING
 to bool
To: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_020037_797569_BF3F599F 
X-CRM114-Status: GOOD (  10.78  )
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

On Wed, Jun 10, 2026 at 5:41=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> USB support, including the core and hub driver, is bool, no modules. To
> be able to use the power sequencing API in the USB core, the former must
> also be bool to avoid the latter being built as a module.
>
> Change CONFIG_POWER_SEQUENCING to bool.

As Sashiko pointed out, CONFIG_USB is tristate. I was looking at the
wrong symbol. Please ignore this patch.


ChenYu

