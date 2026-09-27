Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DFDC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 11:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfsvOd/SdIwAhDO4f+o0wspmtu0+CDGRWfBBsuzDu0g=; b=1HpsygIvpbwruGVe2zQDr9XF9G
	sUgddAi3pA6KqH4WfYfHahzKG7QVgdBQQtSYMPTrenf3mCNbDXaBntJ0pdc3hQW+dKOxjmvvQE++k
	6jM+8VWyaihoBVMoSVMkRdmiRg8iCUuwJpLj6X/GTCtyud5z3Pk8KQAL7aARBlqpZ0BLaT7bVsHlq
	J2SDCwi+8E//kdiMeMHMld8rGs5/lzh6tsJkS+oduTR6TRe5mbKqE3X6jomkadLnG46HSGph9Gbrz
	eMMLMADb4bFjHti6Rq2xgc/ScIFBmWSchgy01VuNDbbZ6iZiCJLZExPtEjE1t9xRLpSTDFMfOX1xC
	tJzlGsBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnJE-0000000GGI6-3Oa5;
	Sun, 27 Sep 2026 11:44:44 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnJC-0000000GGHc-2tiR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 11:44:43 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so454765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 04:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790509480; x=1791114280; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hfsvOd/SdIwAhDO4f+o0wspmtu0+CDGRWfBBsuzDu0g=;
        b=J7THZWF5iRy9/VuUMsr4+/e7ixEhyACBw461beMYoedkGVtW/D2woNJseXqq3KQwAO
         mDNB01YCnBOttufjXfkxyapLSNsg4myTeEKFdDBcideX3WVwyCiaW9mHOVp8kPIX1yLH
         WNpcL6Mrc1qU/txwavCXT4zfwOK89kN7OJ+pkEUYHha7BjlD4Kqgaw7vDps4A5FPuHtB
         3fAPcCEAIRedsxeWjtEkNQM8hmg3dSygB4iVs8Xvp+lZyCst/bgD0mGghnu/VZjAmP3X
         QCaS3MfXOxAw0ovDihJhWv/Y8ld7DaTZKWoLnb8BqW9mmREpTu1OHDkuoGVBa/P08/py
         qFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790509480; x=1791114280;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfsvOd/SdIwAhDO4f+o0wspmtu0+CDGRWfBBsuzDu0g=;
        b=dcIgBPv12tI2O/af2RO1soGIpppvepb5wcq3+LO0xJMAibwsxGlhM8AlduatThE+fu
         R82FSqzeSpDzGI8cCxvxLag4JTX7boXfpMXzD+4cevIV3DDFqsCu4XG7ajTmxFx4UR2P
         ed5hiXcyuLCvXx+fNnNcFFQak2GNo3k62OR7tA9qAc1LXRkR43q/OswYDTLCxCtTQzMF
         Xf07oE01A/7TwfFciQc06Hgvj1JIMCDa+fPbcYBYmn+273+ECQ3PnKsE+B3NfqhiHPJ0
         UTL4pCse5N4VHTXhGyn+ZRt3aMTBwGihg/rCgLkg/ZTsxIJpHVAQLfg/WhfCXLGy1WEj
         00vg==
X-Forwarded-Encrypted: i=1; AKwUvBwOzEGHMldocx8tr5a537Bd7xQG6Spvey26jCjdgW0RPtTK20biUa1GkmisbVtRuPRyH/nDtZ+jSqvzo5sGYhk3@lists.infradead.org
X-Gm-Message-State: AFuF++nEVtrCK0jVp/HuQS/QBfs4T4C9LkyEAwzk+y9fET4JgyPF639T
	rAd1QRzBKXWfTFAxzBxg8/TPTh1YeqbncXAZojGuC/Oqc/8YmomioISU
X-Gm-Gg: AYBFou2C8xFS7QII/optxpNHXk7oC84ilD1h6WHMMh2kE5V7sqTvpkxJNjFLqx6/YXM
	fY9m47S7U1VeGhvsP1+QrmuwrJiAE3hlxuWJdfguWJAZxZnsmBow0ivOz5jDJWQJDcoAmzaeveS
	hQF6Z9kGkA/+H1w9EdA5P8eRX+dtg61g/aOX+AOn+4unnHsrIKYuFdvwFRiwz3yFEHxlJXjtVPm
	lsDf04OctX3IZFcsMxFvnBOmZOIqmVqDmd3xaEhQcbah9X1ojbILTb1Bwg4Tm4qKde3nxNAjofL
	I/8iIUp2z577hxvJHukg3zqk6FoCBoHInqZnJFa2FwLays4iAubKpf+CFJ2vqOt6eAM8wWLCJCe
	kkhWR2XOHT6uiHioGbpF4wfYuH/WrvlZ7quR47jhbglz2qxwRgKOvk/4eISqdNxe8uD2cQLeuib
	q1LNttlR381zgCa1SRoIPs87HVTTGIk2UmBGowsMNbQuOz9GBxF2zEiBJRhFYBzhfBg9i/pAmiJ
	bQw+9G/H8CtLU2sFs2K6MoffnCTpLDZTJftf0Z8RfQlOZn58HxiRb8XeWDWMtUvtKAs2vuid1JR
	wyBdhz9IUZt/G9hk9l1ENDBb9iuhkYHyMsH7UTxPpADbJox/7pbB5y3dXvMF8HQqcsFW8rROTJE
	xU+t61ofrDmUBN2CimjSTbW10oIR9zY19WWXoce93M5/OWQw/ImFSzfDpdohrW2Ia6TxDPXlwTP
	SwixMWq7ehHFwUZ41Q
X-Received: by 2002:a05:600c:8518:b0:49f:d325:9912 with SMTP id 5b1f17b1804b1-49ff06bcd79mr118283635e9.10.1790509480319;
        Sun, 27 Sep 2026 04:44:40 -0700 (PDT)
Received: from jernej-laptop.localnet (77-38-7-79.dynamic.telemach.net. [77.38.7.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018dcf59sm72964095e9.1.2026.09.27.04.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 04:44:39 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Per Larsson <per@palvencia.se>
Subject: Re: [PATCH v2 1/2] arm64: dts: allwinner: a523: add EPHY 25MHz clock fanout
 pins
Date: Sun, 27 Sep 2026 13:44:38 +0200
Message-ID: <IuUnKM8SQNWFRyzY1ves-g@gmail.com>
In-Reply-To: <20260926232142.5244-2-andre.przywara@arm.com>
References: <20260926232142.5244-1-andre.przywara@arm.com>
 <20260926232142.5244-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_044442_789773_C6B3F256 
X-CRM114-Status: UNSURE (   9.20  )
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

Dne nedelja, 27. september 2026 ob 01:21:41 Srednjeevropski poletni =C4=8Da=
s je Andre Przywara napisal(a):
> The Allwinner A523 SoC family provides two clock fanout pins, which are
> backed by gated clocks fixed to 25 MHz, divided down from the main
> peripheral PLL. Those are meant to clock an Ethernet PHY, and allow to
> save an external crystal oscillator typically employed for that purpose.
>=20
> Add the pin descriptions of the two pins for those clocks, one is within
> the RGMII0 pins, the other within the RGMII1 pins, although the clock
> fanout works completely independently from the two MACs.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej




