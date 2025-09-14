Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0466CAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 06:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpuAcY5BhVGhX+vCzPkKqiO0eWSE/MtMicMqARPCFKg=; b=uqlramWqMPj2pmYIsjU51PuYUe
	bWkJ65DfyLI6zJDbhQgkCDwTvWZMu1ZUVr/Q52X85e6X2cOr5lva6ACHJMz5WEeGZS8IwSspdO2iQ
	SxY/CMFS6l+qqoViabKupK0bLbunUtud0206yjfnIOTXO06q5vLGujtrYw8/J3OHL81meeIyhIMs2
	CU4xhtmuF4MBbO3YCJEl25C4VxYFIpt6RepOU9zjqlEnVXEoVI45Xppg58WbQZ0lNcvds3k27umMA
	B1s6vq8D0HcML2wfW44m+yR+yeZ6O5X0QvFxqZDjGnRCrljvjyyicjSQpSbQvmpsVsJ6BE7HWTHry
	ss47Pytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxgCA-00000000Dwb-15aZ;
	Sun, 14 Sep 2025 06:26:42 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxgC8-00000000Dvn-1zMi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 06:26:41 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b07e3a77b72so141969466b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 23:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757831198; x=1758435998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpuAcY5BhVGhX+vCzPkKqiO0eWSE/MtMicMqARPCFKg=;
        b=Bhs4p3g1+UFSRP+B+fp27N31AZByGIHpZe66v8dRH8bo98pqltnGzuXjR2WstZLYgT
         obHioQQmYmeJjbWdDmJcc7RVDGG5KCR+tXdaY8v8Gz69OZBx4/Kt3ocNdJiS6/UHY9gu
         fXxirAYRXEJ0++mQD1wdP88YJDOiYLt/ts8jAzOWRxAizhdtyaFGlGjni8Qzap16sPKu
         bP+oaa5skqF9K3EG8dm/ZauIGn3rUnvb9mqcZsBGNpsbJ6xMc77vS2dtp/zAT0I36Yzf
         TdyHM8oFhNGy1pGJ2peOA2thq0IXKLzHK2lBmktkYuJ5G4/wDnWhSFxQwYiv3vEomTul
         c1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757831198; x=1758435998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpuAcY5BhVGhX+vCzPkKqiO0eWSE/MtMicMqARPCFKg=;
        b=DstCIakDCMpq2/zRUyNj/OD969DaPupxeO+D0h31IBatCMo26SVEXgbmRNuOICnI/0
         0nv9oFuD2np5r7oNgxKMYY13jr8WLdnbLZFebNcxq+bHTBzrXOgQawxUMyZjXi4UzIvs
         cYwKi1PDGixYGNffxmbIYg3k3PHIQEJfxhvF9tZQIZ4OmHbYQKbOHfroGhb/cHEP2fqh
         rZYLPOe7z1CPIrlyJ2rc0P7F+HpkzzlwH5P7Uf+e9cNRS2HkKzsaFRV/4bi89sNuXOsl
         XgMAfYz3yG7bZXTYuY72ee8j49XkRB7hfjhNB3cQZsyOaMBiK9zJj6qXfLTL6ayqaqHO
         OThQ==
X-Forwarded-Encrypted: i=1; AJvYcCXls8edQecQlF1MiUzfJHk9tf34upvKeMRe89QL/d0lZIgxWEegWX+PkSbaAtoXmm9lFyoGqzLGTOyxbFz+NR/K@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgzu1k67BSe4F8JoTdhD10qWOUl5CF7xYQWAlytjjiuscR0x2M
	WqkRozwlzT5KmfWouBrv1K0yeussv1oQ/xLI+zfRhgfnooB4JdELMYK1
X-Gm-Gg: ASbGncvMDEZfWvnMw4ZyaGx/uGQ7RxlJx15hduLYxwcJr6+hAuAM0rSgKutsze9TyG5
	M0BSm7u5vtz3PdXBmd0vHWDX4/GiRwPBhC3+zwIjZmlXQwKOFr4AsQa5pnk8cz0g4yTc6CzBoTH
	uDinl9dtslpa8aiC6j29NQxVK9gLdBZIVfa4/3/hb1HHaPPX7h4hs+Sw9NaqNbKhuzTwviDfGOw
	3ARMabFhKvVE9vo8m99knAZaXLcpPUm1sfEdYsiCqokTCz5O2Nq9V6+Do+v+guX9sobrJ1aS2O9
	wlcDru6Mii8Km+3WJzkmgyia/sqWUc0cf4heQUfhkQ771YWMWgd3k7rOxaZjv1tyXj+AskPWMIc
	g0PV1wmO4IFNWc3Gdp0dywzNWWqGU1JQfeOkjFbOdqcZWlOwsmaWb+as=
X-Google-Smtp-Source: AGHT+IFgeECwBC/iiy6U4djD4RbKGuu6VUzMWKgjTe6SxUwypL1QszvVkCmMnx5qTasPZMrBF3ONRQ==
X-Received: by 2002:a17:907:7f94:b0:ae1:a69c:ea76 with SMTP id a640c23a62f3a-b07a68b646amr1170055866b.23.1757831198374;
        Sat, 13 Sep 2025 23:26:38 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b30da427sm699505566b.7.2025.09.13.23.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 23:26:37 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: sun55i: Complete AXP717A sub-functions
Date: Sun, 14 Sep 2025 08:26:36 +0200
Message-ID: <2235173.irdbgypaU6@jernej-laptop>
In-Reply-To: <20250913173511.4064176-1-wens@kernel.org>
References: <20250913173511.4064176-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_232640_520015_C14DF27C 
X-CRM114-Status: GOOD (  10.57  )
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

Dne sobota, 13. september 2025 ob 19:35:11 Srednjeevropski poletni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> When the AXP717A PMIC is missing nodes for the sub-functions, the kernel
> complains about not found nodes.
>=20
> Add all the remaining nodes corresponding to the defined functions for
> the dev boards, which have publicly available schematics to base this
> change on. The battery charger on all of them are disabled. Also add
> an "iio-hwmon" node to express some of the ADC channels as hwmon
> sensors.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



