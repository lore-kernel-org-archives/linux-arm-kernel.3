Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3A8CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 14:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxex2Vy8xhpU4HlbEMJEgN+VUIJscyKji7VvhhBioyw=; b=ZyPDQru1ZRqtxdwpk+T4lQtdbr
	TlGjPY1GAfYHFpD6KH9RIsfA6Ozjf8fUsCug+2Rzmtzo7fgnPKoHmBjcHEkB98R7es/yFeAMBszgS
	JK37j7wohGI+lJNqKg8op3ywv51u/FSY55mlIlDdF14yqVtgtsmotbnM9mAifiZpXe4fgbu704Fah
	OtrH1ZLzWZK04rtFQWMhL9AEn6x/TDSKEpW/asvjvP/KE63IbUafblGi//D53q792UQZYm1KNKXaM
	Rm3obcc79ZCW6XlV2E7w7N34EQubVu9QjUFX2Lep35tKRT+JTbIywjeyawiOX3rl1RjirNfpFCVMs
	+WhVqJGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v13uc-0000000DieV-2rmA;
	Tue, 23 Sep 2025 14:22:34 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v13uZ-0000000Dics-2qkm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 14:22:32 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3fc36b99e92so1521521f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 07:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758637349; x=1759242149; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxex2Vy8xhpU4HlbEMJEgN+VUIJscyKji7VvhhBioyw=;
        b=FmvFVIAmMiY5e0ATH9kxO/qGmrBqsrarAhedc+bSk6uZr7s+biwxv+HtB3VGVOnHgG
         q1RusnZNtNqftRjGNi+cVAl5QPYLf0ujcPZ9y9Msrk/KqMBDWO9HMXEHpEryNDVICDOT
         IFTp5+76NaxdRb6PMIiH7FHIjNgTPezrxBBkU9BQGTs/4gqN3LbyTHcZpvLsd/fOVaTc
         pygh7LyYZtsNEV7M4CfowIEENkykCK4Gg/spCP83GaHvj7qqToU8o6v2i75++02LKp8s
         tObd98d5KbqUsMGTujEuaREPetvz+4A0OqzKM6XjUg8bvIB+uHGYbWgvn5fH2Vb+ekRj
         gUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758637349; x=1759242149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxex2Vy8xhpU4HlbEMJEgN+VUIJscyKji7VvhhBioyw=;
        b=SJKDWx4nih9Xy+Uhe9vy62FcLbm0iBjFpm3A4QY9yiGJqMT30lAEsmv0gEDx0kTV2V
         l+CMkeFxujIcxBaPMx7ZBm1P0PsKNCl3MbOrbbdE3wE6iEjGcKcxAezP1nEwrfAgPPM7
         5XFiynKDIWL1z8+DN92kLUac1tszhkf3XBcRCwZLkdn593SeTgGGIpGRcR/m9UlrAK3A
         S5p80SgoIWB/aIGGLpgA3fHUdBec95G8i/B29P7bOstR3998Sl2iKsBbL9K5sc83a9PK
         l79qdlW3VH+6hT69zTsVP0VWAYMtfFeyXfCvEkY3xM+a1MfMvPrGM3J2wR/iFvawsjSI
         9SIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCvpwvbrXT0GFsANGdis+Pwp5Dk/HIlpKhUJrDBLFPvaCSGWyUe4bSyKyEsTZ/Tkeylj49u1Np2QEVVsEJVaK5@lists.infradead.org
X-Gm-Message-State: AOJu0YxSdeUlq9dVz3dIYfzJ+o50urHoe3tEKq6NCXWc7Fl0R3PMy0CQ
	lbVUaHA7ahw4r+MtCHW4ClaFAaQ4t+HUSxpJ+VoYzwMlRcvZheNtgNmm
X-Gm-Gg: ASbGncuUso5tRdPmoVOuWh7dzOC1BVPX3ylFVgt6LZVfYAfR10GnD/zOjWSHpRqN4/n
	ofgO697na7cBpFJnsNrw97BAxkq9SP3B+gCBtWgWb73kHFBruoytusTo5sMGWmXgVs98tktUMwg
	h0MZ0re3GC3UYu9w6AcfmawxwurvVjLjTizC+DDfc9EvUaTuIkVGLQtVREqlycq8B7JMb6xJDQh
	Ck0hLCNdzUwKNpo34u9wE74xbxoFmH4oe106oxqnzQHnCtJKoRIXPy0lm7Vu7eZSwquYcByBVI+
	5gZ/LfrZXMw7exxGb5MWrqzDMoqD6BgfOI8aYN6UOby43jtPe0YivRK8UJhe2UJ3Zq5OEuoHxSt
	cIhi/d1ln5+81ert7GjRarok/fwTDIgS1HKJuY5dMwbjJuZ9deneirlyOaLmcZ7zTFnDmIFLu0w
	c3cH6Q
X-Google-Smtp-Source: AGHT+IGjet5wQJA7x9sBQkHVST1A9uu//deoXDFw+WZ7o8/Afi/1TjeFJpy7+SiHbPkDBXjldSD9Ag==
X-Received: by 2002:a05:6000:290a:b0:3e8:f67:894f with SMTP id ffacd0b85a97d-405d299fc65mr2558272f8f.26.1758637349101;
        Tue, 23 Sep 2025 07:22:29 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee074121b2sm24139332f8f.27.2025.09.23.07.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:22:28 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v7 2/6] net: stmmac: Add support for Allwinner A523
 GMAC200
Date: Tue, 23 Sep 2025 16:22:26 +0200
Message-ID: <2797545.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250923140247.2622602-3-wens@kernel.org>
References: <20250923140247.2622602-1-wens@kernel.org>
 <20250923140247.2622602-3-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_072231_737586_BFD8530A 
X-CRM114-Status: GOOD (  14.17  )
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

Dne torek, 23. september 2025 ob 16:02:42 Srednjeevropski poletni =C4=8Das =
je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The Allwinner A523 SoC family has a second Ethernet controller, called
> the GMAC200 in the BSP and T527 datasheet, and referred to as GMAC1 for
> numbering. This controller, according to BSP sources, is fully
> compatible with a slightly newer version of the Synopsys DWMAC core.
> The glue layer around the controller is the same as found around older
> DWMAC cores on Allwinner SoCs. The only slight difference is that since
> this is the second controller on the SoC, the register for the clock
> delay controls is at a different offset. Last, the integration includes
> a dedicated clock gate for the memory bus and the whole thing is put in
> a separately controllable power domain.
>=20
> Add a new driver for this hardware supporting the integration layer.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



