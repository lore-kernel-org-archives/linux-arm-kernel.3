Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA55ECAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Oct 2025 20:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7aP5ANWHznsHRPpXqT15itWt6xDKWtsAwFYNj6Ecek=; b=IoXvtfw5mZpgPFY7KJPi6+AfPe
	RPOv9C3+z+95+EQK45KSRYb2IPeJRrRQ+8JF3RaPVitrBfn4s1j8SoWYNGkFoiNkPHvYRjv9UR87c
	F9KLKJXeLwjoTtVp4vwX2pcrreY52feZ0qGvr314zuggbWTDJNrP0YFIJm3uDJT6VqxZtOUCD4vtA
	NVTPBso9FScY1n63L990ZGZyAF4OTIk6hEWgXS6uuQSFKY60tqBN6BP2fQmS/k9HFihj7g1XLLHH/
	X1Kx+mfKg3kv941q8LLZnSYTWE5I8XEh2lN+InWFa1Fk6KNCCLnPm9fUbj60QsIcHBhIzodr/ZhkF
	wbEjO2Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v58Qb-0000000Dyvu-49rR;
	Sat, 04 Oct 2025 20:00:25 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v58QZ-0000000Dytd-3MPF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Oct 2025 20:00:24 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-26e68904f0eso35953555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Oct 2025 13:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1759608023; x=1760212823; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7aP5ANWHznsHRPpXqT15itWt6xDKWtsAwFYNj6Ecek=;
        b=UGJAoCt84z/ChgyVyda6K1OOXyUy3vzfnCRYoGrn031/v1pKDx2syJGMzp+aos/isO
         uHqLysfoNd1fD/eaGvTvnarfr7GDHhJHtjPLb6r/V22hntAkSDdT7x8MXt0KTNBUPoyF
         74j8Ng3grlJ2O/+oiPb0fjGkF8odxbo26wQlQkC6IPzovFJjb2qLIamEWYlhbG6tl1Ak
         xKcQO2+963wt9Tb70wXzjdycO5c8iO1EbKFVWo9fKdNvESNlHGlTdSEE7UbktiW34nb8
         PjQhtRjTqfpUwM61+77luhQxGbp+uo0CWGUPL90qIIaF3J+uygq5BBkPszDvqB9v2zjG
         kM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759608023; x=1760212823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7aP5ANWHznsHRPpXqT15itWt6xDKWtsAwFYNj6Ecek=;
        b=q2djzKYLXE41iOa+0VUbyQWQEep4qsKfNY/VgGtj2nFGS1jrMJ37yDuNG42bRo9Asl
         OskIetMS/KgJXVCUFBWh2cNfLVT21sZ0zYALsuMaff6k1AZtSeqjpFLV+FzsHhPk/HRi
         YScD9e8sdO8sHsvBtpa2M5AaWojoBL5dkKXk1a74CR+cP8Q8tNkrujE7/8hpre/KiDiR
         d15n8LxL8BHccvZ8jTpLyzcsdjKOUAZn62Em+aVtF8DN1JyV+ZoxTwDv0a2pIvbzFibW
         PVF2hZG+UaqaBJl3RJslJfdq4C2xYV/i/YEb7BnO9rc1FfuziqmksE/mgdeFMU7cmGau
         i0yA==
X-Forwarded-Encrypted: i=1; AJvYcCVNx5L5IS3VsY/H78Hif8A1vgmglwK21s6BncHqRh6ZUZ5OrEp+TE53nICa0fpdvzGZIaf35J5e1LcbHpDutooo@lists.infradead.org
X-Gm-Message-State: AOJu0YwmlpXfyB3FIkQAj6KbLMEVKFP2LCqW0XboAUsdjnBLBVbo1MQ4
	NrGgaLTks1fW5m5bdxYVEuxG+KS2ddR6MldQzqft/OK6Lit5NiSYyFCmD80htbd2oHKJDdyiLUs
	TkDjsxTXbZDPcp/g0922x7kG6Ply9R/s=
X-Gm-Gg: ASbGncttKrJynUtfEZjvhj93LBIsSwHglHkatHJSV3BvyU+Amm2pWWqznZH/ZS5a1cG
	NwxEGdD9hR3hxlIRLgIEdf720ESEVeM+VvFptpCDHeUFg5o/CZsQ+mvyKHga15jc+fVrSJ2hGaV
	323kDSWGRPb7U7q4Y69l+gcIirzIW9N3807VO7WK+xt0WU8nTkMtewMlQjFvDM9zA0NOHgVl4hZ
	LK6XnL7rZWiL9EMfXB4j4rSWYWnreks+OUgDXbu2bzZVd/c/vlspV9p+BlxhJA+
X-Google-Smtp-Source: AGHT+IGt39Nt9p5q066AwuwZ4TSsvdBdT0kbd0QVrdYOaUXToPuPqoewdXCA9vnV1UglZ/I0nfi7H/q2TLlH53BiA4k=
X-Received: by 2002:a17:903:b8c:b0:276:76e1:2e84 with SMTP id
 d9443c01a7336-28e9a542c2bmr87291145ad.3.1759608022835; Sat, 04 Oct 2025
 13:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250927125006.824293-1-christianshewitt@gmail.com>
In-Reply-To: <20250927125006.824293-1-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 4 Oct 2025 22:00:11 +0200
X-Gm-Features: AS18NWCuGwewacgkM0Ab0HEEi4QG9Szb0DHvCKwfduJRn9-rG355CymOveg6Dfw
Message-ID: <CAFBinCD9qq0_ppwt9gbyKW3kcSr8PTX+rnVPbrM33YOABxSoGA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add support for Tanix TX9 Pro
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251004_130023_836461_F6AFAEC7 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
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

On Sat, Sep 27, 2025 at 2:50=E2=80=AFPM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> The Oranth Tanix TX9 Pro is an Android STB using the Amlogic S912 chip
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

