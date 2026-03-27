Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DF310ED64A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEc9lT0BW2KeKXQ3ChIovGLpCHr9pq972Nq5Th8ooKA=; b=eET56bmpRWjfcZsjHnE4X/ayOW
	VZV4rpRkel3xrNxgXXO0uPT3FKVYdgGXGEDU1B3uYHoJ/nifXH/S6J73MMCdl9U9XYuLP3eCQ38eq
	J+KKQwU04zEhAsH17l96uD7dCnS0tMPdd69b6xEOKMVg9m/MD4ZRYDLTUvAZZASg6DBmyWvlVqGyl
	VnOBL6JydJz75C1kwpYkvfMGfvRzBaqP2+PO62bL9mdKLpE0QG4oS2TXEybFb38W0uYZZYZBprRwr
	+ewhpmSXJh6l8dNH0e4UmfwcDv6iivG1kDxJudbDXUD4YxzrXyoNajpnLDfqnO61t5JTMwevQka1E
	2EiNlM2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65bh-00000007IHO-3VcB;
	Fri, 27 Mar 2026 11:44:07 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65bU-00000007ICB-04ca
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:43:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so14952465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 04:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774611830; x=1775216630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEc9lT0BW2KeKXQ3ChIovGLpCHr9pq972Nq5Th8ooKA=;
        b=dHBdqOPb3xJQ1sxep1B1l9/eUONFBxrDTupyHpapPsZe6Ej0fFyTvgSJrf/hJ+gBh/
         pVgZ7HzBN7oRhsj94w3DQn3C1NV+/nBU8n4gVesZCKLFaxSeJv4PXEnrPQ+ijo89w1VF
         7L6nz0rLlkUODfRr7YyWO8GK/9R15d+rpCESxbdtFNWZgTxW/DjmmLVTMseauQzNIlG6
         Qz27+ER4G8//LaHpLbTyfiDq1I4x8Ee8UFXesaB3ZFpaoSdWz1ShWp3qOUB1Abu/MHgP
         mh2y7vlUhZ/tj6E01uXlCWeW2q7FbdVArEI7uqzAQbCfmIgLyiO1z94MPz6n7F61dRwu
         9P6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774611830; x=1775216630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FEc9lT0BW2KeKXQ3ChIovGLpCHr9pq972Nq5Th8ooKA=;
        b=gjDDyhVrhVpSdGU+eLCIlNiTHFFICfvkWHgxFRIqo71v8oQmVTXbI3+UBntyc9R0z8
         BHbRvCnycsbVQS8ZuKbMfGE9X4fgH+g+PpC3s8Ufoc0hpWFiYpwEzvKL9wIZbNU3dXlh
         fgh2PWAhLgwoZc+0MwDkvwKnsZo0Be/bY9LgERhR9LPnuzsd62tsozIP2F3CYd/yNgWP
         lvAOI0JZT/ivrofubf7Gf9IpVN/sibhUObpqBVTdJOdjnPaJ3ik6dm/y3gdQ3MppFH+N
         L4vsa5lt/vls0J5MJzW6qm94JaJNBWCBvKVIDKhrrXAk7s8BbsZa6YmcsU6RGxRQBPIf
         L4VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcX8I2ScvA6PQ/59jsy3bYZmb8w3fz1SG8zbTQIg16zaac9WrWwgPkX8mwqZftNlRnpOOaLClrMShxVWuuUaWO@lists.infradead.org
X-Gm-Message-State: AOJu0YxjooSrcAbjpIMuaXgx9uqgPX++aWeKJw3FkXilmJI04yV03BuO
	5GpNwzKX9UgJky/+sd1Y1hvvjALQNWc/YxUwhHZlVr512h3iRWMNQ5Ew
X-Gm-Gg: ATEYQzxZqDTVP5vRwsNoQN2L7q4OLF/41KUaRgZUdIJzfHudDBcTLHLLRXndZFYFPW5
	zShqY9s2Qezfmr+2On4dd5a2gCVamR6YaiyHYHHVJrwOYDTUM9jFAMyJPNBg9IEHyzrtxdVMI3Y
	83kcnkKowUZQuprgsS8aSZT9WJ2cCiv3wQSEOHjPVQFGSA396F5fTZDfTLzkDr9NAHfXCQI4+Y7
	Ci4nowiMQmy+sRnYg6EG9pguig3FevVQl2TfQn4T4tmloDwldpW2Y3fIHzdRmJIyWeVlWRfOFwq
	pIaNChgO/VOciqnpazNcs5qpwuqGunMUl48TldjqVnr2jCubQLljG2rJowIkPVHohOG63sZ5FrV
	Yj7a6tGxJXJSJFEaJZy3cAY72JO6wJNTREPWRrGDmHqkrzsxpdgo+egercEOChPli8KrLo4mm4c
	UdfdeMKHsrw3qmiAURqTvvaZz1fCWrgNd6lTNM1nBR3mEETUjXmERLFL5II5D2P9hQXZGw4uW05
	zR2ZyWwu3AYSeueZw==
X-Received: by 2002:a05:600c:a06:b0:487:1108:48af with SMTP id 5b1f17b1804b1-48727d59ce3mr37657225e9.4.1774611829936;
        Fri, 27 Mar 2026 04:43:49 -0700 (PDT)
Received: from jernej-laptop.localnet (118.red-213-98-130.staticip.rima-tde.net. [213.98.130.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df903sm14813099f8f.30.2026.03.27.04.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 04:43:49 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] pinctrl: sunxi: a523: Remove unneeded IRQ remuxing flag
Date: Fri, 27 Mar 2026 12:39:42 +0100
Message-ID: <2822911.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20260327113006.3135663-2-andre.przywara@arm.com>
References: <20260327113006.3135663-1-andre.przywara@arm.com>
 <20260327113006.3135663-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_044352_076868_2F9B3D24 
X-CRM114-Status: GOOD (  15.81  )
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

Dne petek, 27. marec 2026 ob 12:30:04 Srednjeevropski standardni =C4=8Das j=
e Andre Przywara napisal(a):
> The Allwinner A10 and H3 SoCs cannot read the state of a GPIO line when
> that line is muxed for IRQ triggering (muxval 6), but only if it's
> explicitly muxed for GPIO input (muxval 0). Other SoCs do not show this
> behaviour, so we added a optional workaround, triggered by a quirk bit,
> which triggers remuxing the pin when it's configured for IRQ, while we
> need to read its value.
>=20
> For some reasons this quirk flag was copied over to newer SoCs, even
> though they don't show this behaviour, and the GPIO data register
> reflects the true GPIO state even with a pin muxed to IRQ trigger.
>=20
> Remove the unneeded quirk from the A523 family, where it's definitely
> not needed (confirmed by experiments), and where it actually breaks,
> because the workaround is not compatible with the newer generation
> pinctrl IP used in that chip.
>=20
> Together with a DT change this fixes GPIO IRQ operation on the A523
> family of SoCs, as for instance used for the SD card detection.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Fixes: b8a51e95b376 ("pinctrl: sunxi: Add support for the secondary A523 =
GPIO ports")

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



