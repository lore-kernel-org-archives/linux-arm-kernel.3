Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A416CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=; b=xjGvOv9d1GUl0oiTeLvHTnWW7e
	ziQgyGtLhKYapALI3s0NL+cD5WHn7AaFy3TaTX9OPvvj2TCrxndFMrgSp3NRUjO5cHLYEI1Q+LJfr
	tSqrRE/n3Zi1Qp5t5+1oEqK/O5A4MSyo4ulbWNLu/cfjRoFiodeZN0vazBDap6a8HPfccDPam00xp
	sCsKtLeSdWuC6MAIP2FQtwhVJO83KjujwYQ6a6pwLewTp9QwrNSOCLxQhBcaQR/2MVVGu38TDtV4m
	rzVJOJ6mJJZv0o6HmAv/ZVPtAQvMSVnWU9KCdnUfxopj0o016LOMcQc5p/zHxVwvNNlNpD1qtR0cC
	c2wOvn8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPp7-0000000AxK2-3uqS;
	Fri, 22 May 2026 13:21:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPoZ-0000000Awvz-0Z1Z
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 May 2026 13:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=; b=oWTqHjSqUmBzYyDNt1u+N2j+9E
	Aba6xngYu5CQ/+7bvl0J+x8WZypBcn506X3F/DJScx145KxTYM/qrylKB0ozYyS9c17VYHTTo3GVX
	YO4MqWPfx3kYFTRhlSKdv58Q6GiaUTFiOR1qe8cGABBhx+MpRlVRDC9NmbwoSj8l0IAxKEXIcisN/
	u3OTsmsfVBz3B/I4WJkDwzSFTXm6DfrTQwyPaeEZiSPUH1FXRP83FJUNhgBx1KAFNiNOSmiIfKmKA
	B8OOxWD447lrJguTGsxCNOEY+hV/VNrkme+Fy3EwRDK8lRBo98YqkBTJuOmBOKjLoyYJpwcEgVnqE
	bnN59lRw==;
Received: from mail-ed1-f46.google.com ([209.85.208.46])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPoU-00000004QTy-1qWA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:21:22 +0000
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67c2d57a5ceso11586625a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456077; x=1780060877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=;
        b=FIwmKtsJPFad68Yn0W7dRD9a+jVAH7OeRc2dQigiaJwKSa+vYQy4FZpjre3CLILCin
         whKN23fQUp7Av/Mjj7IjtNSbtdqQamNoktA/jSSmGtIv/NZHhi9ebQyG0Vynv+UwrAEA
         PLoXFcfqGxvjONTXCOplnJ/4bq0klxbpJ2mAQ3RKprQiXZKZ/BLoiQZsZwe+eL0Gd31P
         ulNNg8ZuMpVWk0MEHPaumv5kV2iQEKFa324AXGaROgjY6PePBUtMeNvFh6eWeI0GNrQL
         tz6ZhJ3J627edHQYtv5HNuIEndjY0/RkKuE0ZDwLQxmUU3kI6FQh1NieOU9f5BOHDv76
         ng5A==
X-Gm-Message-State: AOJu0YyvdNanqLv4WLyxv1xogpI3hhZMtFp8G4WNrQZAuEgoEz0Ro9hN
	cGU3ZawYvRQLPRh6zitPl1A2wKn//93nitZ9hZe0kUCJbc/JmN4QOpW7elThrdZrs9k=
X-Gm-Gg: Acq92OEnLpTydNxsWyG775W2IoKNXkrB8sms2/ah+QuAEVOtT32ogeu6jpreggJnPcm
	/u4CQ/PN3iixY16vzM+KyCISYhMmvzWICuTdkYVpNNouFoD6fESwisDOGSbOqwW9pY1TBl13mlf
	JouoyC036GZdpGQRNDUotzbAHktErTiuSFfPRjBUHS/pRIpObcn+RxnbdqLUv1zdJIbYhjawR0z
	zrS0LCV4IsPDQJCNJhIN7C2z0MdGy4WmrtXM5mzDh+hR3p2e7h3uBB5r/A+2C/Je9cRXKfOCXJn
	H9JrCMWzafxwN8UcMH4OYrvu01SJBfTnN7hsT8TjTBarQjLghP9xpHqpNRMgOK2hvFksSzrM/Ks
	fQT4vOmIVYx5vUmeUjDUWE/D/AL4u+DO6R5gwe7ynrkGeMRnmTT4oikqyYOQWqWGqZQpbsWnLzr
	dawmX+jcxvpHIwyJ079uss7Rxa6aMLgfOv4nPqawWcndLlyNS6fLWc26MUa6dP
X-Received: by 2002:a05:6402:2482:b0:67c:96e7:3f49 with SMTP id 4fb4d7f45d1cf-6889cc3243dmr1902887a12.17.1779456077300;
        Fri, 22 May 2026 06:21:17 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9f60898sm712488a12.13.2026.05.22.06.21.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:21:16 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67c2d57a5ceso11586594a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:21:16 -0700 (PDT)
X-Received: by 2002:a05:6402:11d3:b0:66e:56a2:b67b with SMTP id
 4fb4d7f45d1cf-6889cc44111mr1956174a12.20.1779456076494; Fri, 22 May 2026
 06:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:21:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVu22aJCHqrnAv=jk4=71Uz4YsJoAYWMOogANSKvSv=eA@mail.gmail.com>
X-Gm-Features: AVHnY4Lff0GBvrpmknTfKgnni8ny_chPw6wlBCXf2gW_qkc9A8w4cPoubzyZE64
Message-ID: <CAMuHMdVu22aJCHqrnAv=jk4=71Uz4YsJoAYWMOogANSKvSv=eA@mail.gmail.com>
Subject: Re: [PATCH 03/11] arm64: dts: renesas: eagle: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_142119_581268_C0DFA3E2 
X-CRM114-Status: GOOD (  19.68  )
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

On Tue, 5 May 2026 at 05:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

