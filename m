Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F962CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ez1pFRwtvu6sbZUW1s8KM2i32OeRf3RRHffDNGCt0s=; b=A6j6Uc9llxCID4faWdGyagQQby
	PkJSBjYe013jcG0vE1fXy9IDTQhr2w2X7suadruu8dbuSgXlWljclG/PI9wsU2F5KfeT0mAOSZpka
	4BlbQL4XEVaTRB/MXaJFBA7YbtoN3r35IUfT78BBKQ15Puy1SU/EHel78VcsQ5sXlv91M1MxYmwGM
	wD53BfhYqRCIu3mVIHce+wtDIPgl4K2NC99hsAn+S7Lpz3fgEJ5mKz/mMQJAl0ZJSncQOP9zkQA2F
	h3+R4r7XdogmKWG7pTxM6aG9g9h2T7AngRF5bTRnlOTTgpxgGEkysXrESJ99xiQ1BEe5m6ZAHMSdh
	LXRXwbCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9FA-00000008hYG-0KaT;
	Wed, 12 Nov 2025 11:42:32 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9F6-00000008hXL-1MrD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:42:30 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DC9DB3F915
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 11:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1762947743;
	bh=3ez1pFRwtvu6sbZUW1s8KM2i32OeRf3RRHffDNGCt0s=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=sc54x3MkVSwGkLeHcjTfQKQAl4yX/22bViLmjlrrKR7MDOe3OvBzquhZdJ3h6LeCY
	 mE/T26W31wjoaCwPV8g8KXf+IX+vjY98qTgwm1xD62Kz6yAesy6LC97JnGC/g0XIhU
	 1bopwFkOOY68Lo4eWC3KPner2GAadJZ/4gZ1tuOfppsNk9XQ4Uy2ZxvJbBn0VZhSCF
	 E+4mpxb8a05FOw4Xg2rY+ibCt30nvfsnfuxiLWOXEqWDD+lyIE3J3LIov4I5/wf9zd
	 eaaByaAA+FuWrOb/aSoZ4jzqkHqpMfnIOuWcRHoN0U3EpRm+QjNr2HFgq6o8TEEO3q
	 TKsO0LXQbm7OvmCjbihq3zXPqi2sAj932qC+C8bZeRCa/kTliqSAU/HVnKs0jZp6tH
	 p8AJ8AppXnImo9osI/r4IY2/qhTv8rHSoJZTjQ6q/CYLpxv6UxxnCtJgAZREm4AcM0
	 ymJz6gZRkKx+QtTAYdctU3xQROFCwfQAbuTUScpSvK1M5s5UP+dxdiGMPXZj4UXrgQ
	 SxPvQsQiBYwjnSAxg9einIDfbcgvyYk464NFCimsX1acRRvzGvqeoqevJ+j1AfDhEK
	 J27UDzQDJTgY1/6jZG+IClmiVIMAJZTqg3y5OgoITM6rr0o2lmF4uuKiKdfCwOgGOS
	 62hQZOhIi13WJLbRKsx5rN8E=
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b70b2a89c22so69715266b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 03:42:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762947741; x=1763552541;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ez1pFRwtvu6sbZUW1s8KM2i32OeRf3RRHffDNGCt0s=;
        b=UyNHwBLCKI4oGlP1TR6qICBd59M0WXSYNV98MND+UZ+4b3Tj60qirQXc4pFU2TBHHa
         Wz6UzMb9F17JEEr7aO5wsDHMz2SwiR60vjrSbXbW22S/cUU1J4Lbs5FAixILyTBHGCUV
         MwtQZhj6y9jBbwCprDOcwlfNb1XulEX/Ogrjtxd5jrvHVVReZ8FF5NHYTHb4dqGI9Bss
         rGnVILXb6R5uroV4Tq1QmqyyQweWxe/wFw+b1tK57Fmdtqm1uNmwesJtqb7ZPPq7DalJ
         694d5WQPdbvFHffOtHkddiDSytEUp/4nQCdOz/JsokUwmVJ8ylOTz1tzDyaGtxMj6GSA
         MhLA==
X-Forwarded-Encrypted: i=1; AJvYcCWaaBfSY7Nh7N6/JMPSkC+xnmXF7j8ZRhjBdkVZrDWpcaCr+lSn4KtXbRJp8FeeaTVitM1fcdwUAy9bUcm1AbwI@lists.infradead.org
X-Gm-Message-State: AOJu0YxqK3aIUiRc6wOo45TsexUnVmrYTkz6qCf6O2JMrB3Dykcb3jbw
	nYV3DRcp5V83rQvDmNBa0YglGA+ld3AJ+b8c9TfYvxNgOud3o8a4/qyRtaUVkXlo5RQqeUhrv58
	W+OMTBDRUeblB9H1fuA6m73Me04LRdiEHCziL3mdPr3bHsMv0EVRAuYP1Bhm8HMOdAMklYRgpmr
	52Mps9MrlFcFxvfpOC8UeYkBCo+Xq/DkXJT0C1oebAeES1mMLa5N6Trg+lEu4ieCZI1IQ=
X-Gm-Gg: ASbGnctj8ChQuFXhm6G+sOtGMAQNFDB4fWTAoV8Gmch0G3av9AeSoj9z8KnMwhh6lIB
	kL5500lL2CQCCMnBpvNYzPB0iHpyB+ugmYHE5Z1IAozgGB1kz123qJdC5oJcSLbOmsq11qt7kWh
	7Mr/RXNeXk3thpBuLxtsNCjFCX5as4pflo4NYpllRngkd9PQ+6e5jfTSNorZewyx0k5YfMbMdvh
	/1sstsBtLHU
X-Received: by 2002:a17:907:720a:b0:b6d:f416:2f3 with SMTP id a640c23a62f3a-b731d591ea2mr705787066b.19.1762947741632;
        Wed, 12 Nov 2025 03:42:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+3IO/2NlBrJx08X6rQMz6PNqtbjwKXovV+gvszbh/YA3hqiRZ0MYX2aiKQ9RBTBWOP5/34tQ/P9NV3zbKqZg=
X-Received: by 2002:a17:907:720a:b0:b6d:f416:2f3 with SMTP id
 a640c23a62f3a-b731d591ea2mr705783766b.19.1762947741276; Wed, 12 Nov 2025
 03:42:21 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Nov 2025 03:42:20 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Nov 2025 03:42:20 -0800
MIME-Version: 1.0
In-Reply-To: <E1vIjUA-0000000Dqtb-0AfP@rmk-PC.armlinux.org.uk>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk> <E1vIjUA-0000000Dqtb-0AfP@rmk-PC.armlinux.org.uk>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Wed, 12 Nov 2025 03:42:20 -0800
X-Gm-Features: AWmQ_bnZR2XzkbNxNxbSAGVNFuRIk1DnPVqrA09Ovj5R5d5xHcMFQU01wJP-xi8
Message-ID: <CAJM55Z91wvTonahi=8SaGcHAXVrYEpQCzsH0qfecSoFeiBoZCg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 07/13] net: stmmac: starfive: use
 PHY_INTF_SEL_x to select PHY interface
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_034228_657998_D6B8A97F 
X-CRM114-Status: UNSURE (   5.86  )
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

Quoting Russell King (Oracle) (2025-11-11 09:12:18)
> Use the common dwmac definitions for the PHY interface selection field.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

