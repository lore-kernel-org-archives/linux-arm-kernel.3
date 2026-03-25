Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244CFFC72DF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 00:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8PHUma79lPPWs01+csdL38haO6ydJT1fINYoHxqE/dQ=; b=QH30ciYoReHeOySZevOcczrd+X
	QTPdX6zKOsKDhZEMnGnJYoOXWiUFKdDqcjq0VXjaOBU/VZTzI2wDHjeomTU+xy1uqomCMdIH32fvB
	ZUQ+PvLHJqde1EOJn+nYstuyuNBECcFTD40HrTrVWNhtmRxeMh4ABw6K0F7w2m2aF0c0KJ/gcHB+0
	ScfPr4V6JbI4szKJHx3UJrvqHyQPtrjHL7U/aKpyKAkwsAgB82DgcfG9/rGieVa/9HXzbeJn6WuX4
	Yky8/GqXGDTkjP1JtVvoe6qT2LJUGTg08XfxvWjog8JWwKBOIOflVTse37dyCQGmFCiMA/KRrfwyd
	j7bCrabg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5C93-00000002PDF-41UW;
	Wed, 25 Mar 2026 00:30:49 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5C91-00000002PCS-2Sq0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 00:30:48 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-899eabc5292so59157916d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 17:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398646; x=1775003446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PHUma79lPPWs01+csdL38haO6ydJT1fINYoHxqE/dQ=;
        b=jshlpsQbbAYc/HKbhF4qq6FTBqeHclmfLX7e3btwX24gN7m5XSutObEFpNveuzazSX
         zZRmROJVvYry9xMy0HCH3CXYK+Qcm2vY4tBnkrAL4Npbiktg+2bqjMajLyGYzABxkClI
         cn8+nLiwV4VOoyK1pmbDoquI7FB21BHSXFhJTvnIRylQ6o2L4EJ3iELnzJtuArP7aKfl
         I03POuh6f+nJgU06ArVzGKM3nSFWhafpBFQMGfP+b8JrMUIYv2oLal5l0cFQWZdc9w5N
         9AwtqYu4smgJtbEMtUBn+xEkXWuS5yLicNWTcQvivyJg+qWBP8FKGoThZSBx5N0jByQX
         NImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398646; x=1775003446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8PHUma79lPPWs01+csdL38haO6ydJT1fINYoHxqE/dQ=;
        b=TzPl2aM5Yc+1HBkXjw015LjXJBtaf/S5D3qXFVPnYqufDMDPy8Kp+PEY+hRCvwwCQE
         Bo6OvY7I+TZEtWkf4p3PktZcLtVzBwqohYkVDV5KcOBzSsky/YHNfNsbePoVGHWIdgNM
         DT5CnlMnfX9bKhZrz0yN++G07m4tsvLmkAF821XqQ2gjLggiKdZRMQceci0pSCEcDZUW
         rLGmf/ctT9QKMuL/r+9vKYHg7KqyPJPg90sj1Yn98M1z8Cp6a4XXAEp4XAV/nJPn7bvs
         VqUY3KToifyergGik3ERmVU8pTeFsx8zP5jSmVF0ci8VFkPVihT+8hBdhPevkS3Jms2W
         imgg==
X-Forwarded-Encrypted: i=1; AJvYcCVU/cBngA1RTtADGjldGlZimDTDRYM0xGhdmPTTInX/z9jNbaIoItok9TXSvsNQ6Xg6A5N02NWbV4OUSJpkr2lt@lists.infradead.org
X-Gm-Message-State: AOJu0YzWP96ICoWM3XG8e/H2BOKHBf4dUW2tvvC6dKmYZX4BbKw2cInY
	gGZ/6ERMQC67+qV/EufItsA36usmjuDXBsd8BJ7x24h/Yay8US3dHHl/
X-Gm-Gg: ATEYQzw/vLuB3AqNBHp05PSZ6DyEZkbczFC4VWG100bjWBTrlwyMVJugSgtpESpqJLL
	4tckRkdT4CebFLp6ZGYY0aC0jKg8jk+iiajldEnA7BN8yuYvWPSqgLE/C0AuRZwsfmA6396EvPs
	SwcRgkUBvOv3ExzSqOSxym2MJdohfz3+yw0CH7PkuL5gXP+plU5Sbd+bEv/vdeL/nLH0G0vU1xw
	UfWFyQAac2Q0mp/1krvVawwvzZa5uq3H92V8NVn8N3qoyTrUPqzGL9DCy8+iakRzoBGSNfSO1Fa
	SWgRNkpcinPwLDURSlxmSJ/8LO6fIJncND6l1TaGbnxCdD/T6+hmMYVSw60fTu+NXjApBQRrLAl
	/iRriBLOXQvgvqjH3cFs7qIlV9QjhcUNK5qdwUnPhW3ueOgZpL0fbNgJf2zDfZZRPps7iKUUDqi
	pvgziRxaUzqw1dQWxz8GSt5TdTO/hIe/mYeG2LYRLM2TRgxwCRQpXu84RzGsnJKk5Y7eb8SEbjH
	tzr480S7rWWJw==
X-Received: by 2002:a05:6214:4a04:b0:89c:c772:f439 with SMTP id 6a1803df08f44-89cc772f90fmr9663266d6.63.1774398646058;
        Tue, 24 Mar 2026 17:30:46 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85215210sm127316876d6.2.2026.03.24.17.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:30:45 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: allwinner: sun50i-h616: Add SRAM nodes
Date: Wed, 25 Mar 2026 01:30:43 +0100
Message-ID: <3330670.5fSG56mABF@jernej-laptop>
In-Reply-To: <20260324164357.1607247-8-wens@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-8-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_173047_627136_FA654019 
X-CRM114-Status: UNSURE (   9.10  )
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

Dne torek, 24. marec 2026 ob 17:43:55 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> The H616 SoC has a video engine, and two SRAM regions needed by it.
>=20
> Add the SRAM regions to the dtsi file. The video engine will be added
> in a separate change.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> [wens@kernel.org: Add VE SRAM region, commit message, and split into two]
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



