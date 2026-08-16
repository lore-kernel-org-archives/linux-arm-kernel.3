Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A0EC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 19:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNF0ZohFHrdNjPFvzMMf9M0Qx1wQqpUmQ72xm+Xx+Js=; b=DRf1+n3ve8jZF+psV3+jlWX4TE
	pOM/I4qTRXnRug+yV+yoF4v+Ri3HVxWAJ7IvOo7oBS+6y9x1IIFlylZz2sUItvzbjsZAkcKHjLUf0
	h7pq2jb6l04RnB8QzHV8mfYcw8ooLVPZ11pnJoJFv+UKZJGR8bAZJxaeQRCb/BehGJoScwjNn4JCI
	Xq0hoP5+Fl1U2hcQZ2BdFITC7nNmW6HYCRGaplBqYneyXCo91xfe3pJvLt673qvIWXgzno9mhKgUb
	Pr6HDIKFX4KuGPXkL6+daIKgNMIyRd1lAig4ngpDN4212gBRZX6TXUeDtSZapCmQb4gC3AxiKDn9i
	dhxJ3NNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvg5V-000000050L2-1kEI;
	Sun, 16 Aug 2026 19:00:05 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvg5T-000000050I6-0jGO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 19:00:04 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so13536725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 12:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786906800; x=1787511600; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nNF0ZohFHrdNjPFvzMMf9M0Qx1wQqpUmQ72xm+Xx+Js=;
        b=flWxOrA3d00LuXT165aUXT/ZlGOBrhWZ5UOA+g9z1g9+le51pFfY1cQAxQW2fAdkvD
         o6ACQ54rJRRisbRPWvTH21AQfm47HlSP902mnIgNIRgJvwkexnMUmuINLdDxpFtuTkqR
         GvnyGcb4cSt7ZpX8Ouy2LrifhnntEr4/z2GgF9d4rYSvjC1d+corYyYYGiQz7hMayGMn
         CZpW6kqVNS7D1LsT0SPtBmPdzJHwJckFlYYlWZ1AGPqsFZlA84DOrnLbpUJ7KI8HAcOz
         +v/ua3CHnDbJKhQhjCjVYakAJf75SXBO9SV9QCJAyfzaHvXbHu1egjTaHGC5rTcZmoUD
         MQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786906800; x=1787511600;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nNF0ZohFHrdNjPFvzMMf9M0Qx1wQqpUmQ72xm+Xx+Js=;
        b=hbZj+R3AnSttY8+6QSEa6MEZpTLas/6fNQ42U8NrNh37tgvKt1SBoy9ShMEZmKeEtI
         nl47NGRt8ecVADNsYDBTXOY7OYDv6OqZZ4t3pSYPCr/ohUb68y8qo17DYvGfpwFZNbOk
         rDF9AwYfR763h6Qh4dpit7W1yoMtZlvh2NvE0ougBNTPG4bTugABdCPP1bTvN74tXBzZ
         YYgM2aH+orHTd1DXIC9G7jgl6S/jAqIaXr3gVZIVOnnX70goAe5NVph5tMC4M6HP1Eul
         EmBT+uRyToHrivXyfBhlwlklU+YIc521dThoSyzjrHlaYLtK+ZzkceMeBmS5INkjyStQ
         jA2g==
X-Forwarded-Encrypted: i=1; AHgh+RqdB2PJ/ywkw779SvIAQE20y/qSVwzwMO4QbWgaEmB1lVk6nKmt+JJSpgGnDoI+Cb97fjAMRYYsbpxjZntaUoKc@lists.infradead.org
X-Gm-Message-State: AOJu0YxFUqdd3GmmD6U+0dH3BR9V/pZkZb51dAxRb+vkHxEkkCgcXrol
	iAzHfNmI9hIXockHyFldgEu28GtZIlZLGSlS6QaFOj9rXQKblSvq8bT8pQnqCw==
X-Gm-Gg: AR+sD13CJPlPPWr1hAgd3tTcMyI/G9AuWSnU+1/VUjr2V654xW8uXP/8Gl6qbQyU1We
	161wjkQlCAqnVV54pkE04ziyW3UWObSqSwaLJWGSGiYBg6uQeIgJRaaYNtMeheqpDJxGjbHlk6L
	wXp/xUlHuRO907XgStMHjQcG5Z7Utv7/0XY+fehSR820FSaere3gk+AuVnKtXXkMb5UCR7bvmKW
	quuok8gNUQdAukuQGYXOqJuSsg3ofnoe4HUZgMqRh5ZGeoiMwdpJ/13kQDlfGSLBMCkNGTOuNIa
	8HRSi4r3I8Wnjt0MuFF2DfqkxTfE3sMiEKdP4T67dnlZPo3kXMu2rglsxSZIAXIg6pnzoQxV0Y+
	6Eb1ZP5kyw15IX6xWjwyKW3jX2Vr6kJL/5BXtrQ4IkmNV113V6J7m6qCunKRto3IAr2p7TvOF1F
	EkyAFfx2DflriFW31nFqc2/2/0YpibA9Mi7G6kXPKiVdQfw6Rzi9SL9mnIzaBPR8NsjRF+W+soP
	8HR2Jb29wCzPiW3nvRGZXG8SixdiEXvjUiD6wQtuZVvnXl65FnWbNS4DA/3nO0Xw2DgO+Qw9LxK
	/+RtLqE7r/UgnlAYh1peWml3VCMLnaLiR6E2pyX4pSr7SfLrqTwVnRhyggZw2B7DZoP6kDJe7p1
	9/5O2qmoGNF23rhyRB5+Q5pc7puafa3L+FGgTBKsq0I91oUbvH4Fq656hicaT5QsYBdVSIuTpFG
	9umKB8GJGmCKCr3+8O/JwBQco=
X-Received: by 2002:a05:600c:1c21:b0:499:90f3:13b8 with SMTP id 5b1f17b1804b1-49990f315e9mr145661775e9.12.1786906800076;
        Sun, 16 Aug 2026 12:00:00 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-122-100-59-gprs.simobil.net. [46.122.100.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996100184sm105325425e9.1.2026.08.16.11.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 11:59:59 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org, samuel@sholland.org, Roman Riabenko <roman@riabenko.com>
Cc: andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Roman Riabenko <roman@riabenko.com>
Subject: Re: [PATCH] arm64: dts: allwinner: sun50i-a64-olinuxino: Add RX delay
Date: Sun, 16 Aug 2026 20:59:57 +0200
Message-ID: <n0N02vZgTVK3duHBgrvA0w@gmail.com>
In-Reply-To: <20260815005316.28998-1-roman@riabenko.com>
References: <20260815005316.28998-1-roman@riabenko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_120003_242253_6B09817D 
X-CRM114-Status: UNSURE (   8.88  )
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

Dne sobota, 15. avgust 2026 ob 02:53:16 Srednjeevropski poletni =C4=8Das je=
 Roman Riabenko napisal(a):
> The Ethernet on Olimex A64-OlinuXino computers requires an RX delay
> greater than 0. If the value is not set or is 0, packet loss in the
> downlink direction is severe enough to interfere with downloads and
> disrupt software installation.
>=20
> The range of acceptable values is wide. The vendor has been applying
> 200 ps in its downstream DTs since 2021. This patch matches that
> common practice.
>=20
> Signed-off-by: Roman Riabenko <roman@riabenko.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



