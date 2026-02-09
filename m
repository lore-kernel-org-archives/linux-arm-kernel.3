Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DDFE94616
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 22:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VggFDnvvtT1KJN/nuKTxye7oCcrAlUOoRXA6xSFetf8=; b=TJCTFg4RuQv6kT5PU0LDy1TWZ5
	92/BceUVwjVEfe3DeP2bNBctRJUvVGOOwxcmETF7eOccDWmzKsLvBiDH93MafSHsEIv0R7iCWYRIs
	nD2rImxmiKE+lefVhOdt9QKRfFdS+57wNoel0gW0+KXGaEAkvCyozmFnkimQyvvC7WSKG10tTrj3+
	tmRrHHiLsvzMtIkYkt4fYD78GY4W86KtrtsWadYt2ofmEKaslpy8yd9tOkOivdEe8Ka7WpuK/o+GQ
	/2h9P49hwNmBjombuXzdaUCPKoiZYpUDxCZT5PVjTC2LWSv7cQIrjkaTQnSozcbRoBSXA8jqxHIwV
	Ghihb8aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZbE-0000000G6EI-3QYW;
	Mon, 09 Feb 2026 22:19:20 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZbC-0000000G6D7-2WYw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 22:19:19 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2aaf91bbcd9so8447345ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 14:19:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770675557; cv=none;
        d=google.com; s=arc-20240605;
        b=DX1PnRzfab/xHr5Tu8/MVOHVmcvcCNicBCNFX6C6Kp9pKd9MSW+R+eMSoxlWFTE4br
         FU2K5uoIlmoovBDmNlvqPOhyv/eDdu0A9oFPjDVwhY85oY0CVacFy0/W9Xpwu61w3c2I
         2xNDQt7zDQGEZglnUu+BB6dbXAqTjOIsQQXMbtIyvteusekKDZGn+JobTyfZ9MfaZhw+
         8OpFTW77PfrJd2R08zYOGavo35OE/TkbYCKKwzzNqvQdRs2z+OZcxgR3Mddz6zFnhJdH
         xzja0bOH1+BZzCy9KlAU0Z/Ym+DfryhZ0j6gTuS4/aeopnq3smmaMQ/0oncAQETF/XAP
         2OiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VggFDnvvtT1KJN/nuKTxye7oCcrAlUOoRXA6xSFetf8=;
        fh=pt1HtFkErdat4/OjMKZF0mHqy/Kcp/6ycHCT/iKaF1I=;
        b=RilQf4XjWnCeP0zVSfijpRozTSw68ARdxJhoSGqfg12LydEKCkm0uIBzE2e2dRQcL9
         5a0yT+6e78pSk3GJK2zytR6UaSWIkXFKb8s9AUlROeyWdpbljYjGBacn8ZnEZ8EHaLZl
         UXuIDJocaBDzAwPQYMcWOZUSfwst8jfxpc/BsvOI8P4l+PN8jjeAMcFSD6wj9gGYo934
         +W6+GunYc0I2a9118taDBl+KoX8Er8g/Wcy9uAXgSHK10HXnPSX+vFpVZmsY4buLAlsW
         BdzWWngvMJis66eklmSGd30JI0w9pAR+z+7pz9+xNzrO4lNI4/A5hg54lwoX/FFWxksP
         O/7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1770675557; x=1771280357; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VggFDnvvtT1KJN/nuKTxye7oCcrAlUOoRXA6xSFetf8=;
        b=SKpAYax2xBXrP0fHe46WVwmFbkaBkwfAdc5BAivXfoA4n/5+H1KNwCZF+ZyZXHbOJ9
         UFSiGFK7Qo3P3TVkjmhuhiA8XTWefqKyn6k5GF/anacaBy306RD+XEvLpkp0vR1AQlsP
         Bu0n3imvZEgVKecy3bSJAyW1ScrOfKCTpBwNXOjLIgz2sI4oq9mJrPOd6Wyqod+C8ama
         SOiVYZtwW47JkEoVz1dS53V7uraammsGTu71bwgVqhysAo13aA4JTGrIKwMtrDm+dvY/
         HJlM9O2kWTjKan4rThNFlhcCwTFjnS433zf+rgD/2mMNz4MacHrtSegIhtVZ/Nmm20Pb
         vU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770675557; x=1771280357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VggFDnvvtT1KJN/nuKTxye7oCcrAlUOoRXA6xSFetf8=;
        b=YvzLaCl6PesHps2rM3xkUp73HtUltJQHatIICXAwP6WprMxPGHofjYFRNVOPMrncSP
         ABIX4j0ysezMP9i2EpmAeoqn1q9bn4K2rUgBLiOc5O89etwPLjObfcEJTThqbC91NACZ
         LzGzAraLyGKcWKGDScAQtJX0sHnj/g5+XqzpfG/clx4II5Nn+R+I9xRanUQfrExZJqa4
         ygdErfnN5jBLMJrSWboBCkT+H4GB8Z2Hkk3G9c7VdjXJNhD4ofdW2UhoMnbUJReNWhhf
         skplWz1cKhp7A/r4an/txZkMlFKAg3apIWvUKGM1z6C+htIVNuON7YDNZmR/Tvt4IdmR
         i/HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWflJHPwA5o+mPHN24sy/zORf6uyDtAt74WBxcuwScr6itYblLvONIX2Lt5WBiGmOU8U/cMvuNobvk5fBadvcj8@lists.infradead.org
X-Gm-Message-State: AOJu0YxUn+n6VLHogqL5xGFN/MTwIUIeSxtaqv2ZbmT626IMwteOdajY
	1ZyOrjLAwBWblvWrg6PQ+vvjMApYP9FFdRna2yHG1mZx8tvvYRz4OfALOCT6dl0brfb6IN4eORF
	QjIRTP8+PDNZi5w1T5dpjakHGHeJ1nsk=
X-Gm-Gg: AZuq6aJIH63yA+TUCq+erfcw0HpCTTgHp0fFIPejbPDlLCJ6L7BQ9NOHDECyu4x0sMR
	Ho484Tp6NCAiUpS1C1xIbYdxDBXqRDd4xGI1JjbMCtMuNhdQdvcG2OhntJUneQXuuOJPDk7rW81
	ysVs343Hp931H02UFhekZUeVik3M6iZzXvkHHRQj5D2fKPu2M+2ItvJD+Jn8QMMRbBSznzqjDxl
	GbLeYTt5o/sZ6t8L5U+iIy07GPwcAfsy7q0pEyF1ZxfaZen2eKP3F6z3SF3BakegdDMlC7jS8ZI
	qat7NoNOabmRhsk2Enov89cXvOtH
X-Received: by 2002:a17:903:2d1:b0:2a2:acc5:7a42 with SMTP id
 d9443c01a7336-2a95191c8e2mr124339365ad.48.1770675557411; Mon, 09 Feb 2026
 14:19:17 -0800 (PST)
MIME-Version: 1.0
References: <20260205-a9-baisc-dts-v1-0-1212b46f95a7@amlogic.com> <20260205-a9-baisc-dts-v1-3-1212b46f95a7@amlogic.com>
In-Reply-To: <20260205-a9-baisc-dts-v1-3-1212b46f95a7@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 9 Feb 2026 23:19:06 +0100
X-Gm-Features: AZwV_Qg9LUz_u7q2Di_xKsLO42NKK9yJOVult9PsUi5OKRe5xJqGAGGc88gzm-A
Message-ID: <CAFBinCDmOG74HMTo7AtYPUhWCJu3_e0XjE=CKuDWOdwfq21ygA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: add support for A9 based Amlogic BY401
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_141918_662196_70698621 
X-CRM114-Status: GOOD (  13.37  )
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

On Thu, Feb 5, 2026 at 7:04=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
[...]
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts b/ar=
ch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
> new file mode 100644
> index 000000000000..ad35a3292d49
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
> @@ -0,0 +1,41 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2026 Amlogic, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "amlogic-a9.dtsi"
> +/ {
> +       model =3D "Amlogic A311DY3 BY401 Development Board";
> +       compatible =3D "amlogic,by401", "amlogic,a9";
> +       interrupt-parent =3D <&gic>;
Shouldn't this go into amlogic-a9.dtsi (I can't see why different
boards may choose a different default interrupt-parent)?

