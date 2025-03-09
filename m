Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4F3C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 07:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rz99WKtoBL/5O0++DpAUVdioGN7NnvwM+hKPSLxc750=; b=mPIfCyyjEpunW5RJAXSwhw6+W6
	qH++fgFPXL6ilU8NmwMbQhVak5PClxvUomqaJcloJNjLXwrrwrnqvW6JI/2K3Vb5q1HD4ESGqI7ek
	DnwLswNLjgf/tNxMo0p3taGH34YObNf0P+HK7CKSAZqNULiT+ws7SeOmPPkP5hjLmJgdS3Bvwozpp
	LvryTrGTR8ZER/FXK1JFhb4fSy1JQnE6xXC8jI9x6YHzutCPPr2qYUJCb4Cj3BpdoPbvzBFIDUIHP
	Bu7HpO5bjttRm5I26iZkJCKRZ1IaIbYNsPV4WmDLi3tVBxwQ+3TZB7Hi3sSfPuQL9Cy6YocwbFejn
	Rx5Q+8Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trAf0-000000005df-0WX2;
	Sun, 09 Mar 2025 07:01:18 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trAbf-000000005EL-0KBG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 06:57:52 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e095d47a25so5900455a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 22:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741503469; x=1742108269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rz99WKtoBL/5O0++DpAUVdioGN7NnvwM+hKPSLxc750=;
        b=czQtCighqrVIrAxTRSBhoaIyqtLSVJluvKbZ4VSB+z+mkcgu2+uhdgLPeQvagXk+Y8
         qp+OBEzFLLKHOESVdo0J5YNGXkejN+yAVDQq8xkXLcemGTat69F9j0CN0kJTb30r205e
         o+59CbhttXNpJCgY73kALr1eAZDHGChoXfInPSfXmGCiMp17u9uHaN6rI3Og74BWAL8V
         /pTYKChfzvAnPGgtmJkU5q13y8ZMyZdseYQRDi+t0Hn6sPQuAFWrjUqw1Xz2VtA/qVPw
         o/bDUI+LN0Pk5SeaSEkfXNH5x1KMEFMZF4u30muadO+jA817kEeq0cTPv+YspYkWptH9
         Tfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741503469; x=1742108269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rz99WKtoBL/5O0++DpAUVdioGN7NnvwM+hKPSLxc750=;
        b=mFVcLMCq37nkpnbbN8IMbdCZdu24WMFS13vveyhd+6TV4/lRvH+ArAven9PuFvPQM+
         gcjmB0cchrG2eDCvfXSvOmrR1uFh9UcNHMNP81WKDOOAKPlZP9iZCMtTYZkg6bm7u90x
         8MeYWaek9I0Co967Evd8u8jLTEsS48O++iaka8dbKlKOZn9W4S9feJFXel9c8U2nM9EN
         vQycDFeS65/6eXBFyD4VolEgAdtq5PcSkt/SmzoFpC1PQLOERr9yDCLyd0HbgK4m3IDp
         qohurCxuhMxvxNc+wlJ0ttcNl1nNIMzXQi403JUU5HiDvpwARP6t+jKxB/EXnm9vx62E
         sT1g==
X-Forwarded-Encrypted: i=1; AJvYcCUlmvFsBN8UM60KSin/tqo2jk5SJvWo+pcHaP/uQ3Q9KcBXkj8jaGSfVifyyVMp9H2uK2M6mo5tW4hDk+11MO5Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwB26EfZ5mELy3vjdOUCr8m/DLURbatM1CLqaV7X7FH9+r45hCk
	WxjbbKQBCIrW1tfPn4IXaIvhVmNj7Q9sBlQgr+q9oqQ46Ofr/rrJaFL/Xw==
X-Gm-Gg: ASbGnctkkEUmIw2aaDLu5jtIsFjiolVlyqVQ/mUCzfSJb+V+hfAJn37u2oKef7KOBwz
	txcGfgAVAq3XEaCY3D2nxr4ns9fmkfX9NCAleEmJCTdKAnQD0we5boim6MHEDDbI4zwcpo4Z0jM
	2WPttHWrqbNulNxXpoU4x7Edh+dNt1b5G37fY/g8Pbs8E2vL4XP+H8A0uBMPxfyeXTobAXPnifx
	a0wCNyYolrOl4tgEBLVbTGNPRyoQJvnf78vjKUV+v6PCwA+m07o8CDSHsaEE72MivM/B28GfW/s
	KSdV87SvaWURCqGSAvqSJBlzN8fsmT6Ic3SM6Hg2aN/ghSiZk6wZWwJMamSFUFcHVw==
X-Google-Smtp-Source: AGHT+IG6jGggHPNd0SVG+UZn0rvjVy5AUuO8FA/RbV267G+XhAkHX+wbIy3z+igqgRZsFBMzaObGag==
X-Received: by 2002:a17:906:4fc7:b0:abf:6c2d:f469 with SMTP id a640c23a62f3a-ac252a883d3mr1107863966b.20.1741503469598;
        Sat, 08 Mar 2025 22:57:49 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23973a0aasm543242466b.89.2025.03.08.22.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 22:57:49 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/14] clk: sunxi-ng: a523: add bus clock gates
Date: Sun, 09 Mar 2025 07:57:47 +0100
Message-ID: <10620511.nUPlyArG6x@jernej-laptop>
In-Reply-To: <20250307002628.10684-13-andre.przywara@arm.com>
References: <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-13-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_225751_113370_8DB017D2 
X-CRM114-Status: UNSURE (   8.35  )
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

Dne petek, 7. marec 2025 ob 01:26:26 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> Add the various bus clock gates that control access to the devices'
> register interface.
> These clocks are each just one bit, typically the lower bits in some "BGR"
> (Bus Gate / Reset) registers, for each device group: one for all UARTs,
> one for all SPI interfaces, and so on.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



