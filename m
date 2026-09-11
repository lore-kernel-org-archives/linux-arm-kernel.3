Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424E9C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 09:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQwqbXwJzJUEnBnzBsi0ka1PwipDEMcTOXIfYajspX8=; b=0ihG/WUkPVrSvCjSGvCvb1bi1A
	lcDJuy8ugbgk/YkZajiTxYSc8QfooAxZ3dgrgou9MkbBVbsTEjl1UdxHWabCrnYIPrlT/1A7pMyPm
	eFfN5Kf2MhTQcOSPecemCkpGV8sRFBbLIzH4A19eVl2bpRPW/tPzcHyEoGPZWVY4xAXa2ACyHEjLR
	6uf+FSyCqsOHozvZzr7p8Ydauwusdhj3xP+h78sg155Mwq6XD5g0dyMNE0jYHdol5s8PZJmp7N7Q/
	8QIY2E5f5YIHtEO8INJMiQgjOxYnsRFMU3CAOCsg2Y6Ya8/KEqfsVzbM1ZYtwRqoObmNu55nkb295
	XywFccaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xYu-0000000GGf1-1VCb;
	Fri, 11 Sep 2026 09:28:48 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xYr-0000000GGeN-1BML
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 09:28:46 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b94fce6e8so5551525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 02:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789118923; x=1789723723; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AQwqbXwJzJUEnBnzBsi0ka1PwipDEMcTOXIfYajspX8=;
        b=C4RECgCBVLbuE4limoy5qTnSygszJLweQlFVXs26/+IViMCMG+Sys7DfcbQTQtAoMc
         auIU5qbpqroqSPJjs1E9+vtCH5wwuWuBxI5L02Cnd4GARSqbd7Ii0fY1h3NwpRZVFc06
         gpOtD3IKXIFomoSq+U6/C4t//SCNjmf0mTOL1VHaBjhD5NxYzqx6KzwBUZ7+cfHk5ify
         5WXfm4yAvrFea0MLgyAt9+zwRrc3g4aAum7I3JRXH321kGhwCxSOuMGVOpuZlfYN/lj5
         eTJPJbu/92oLb3pFRMnObYBjdPOvGpYl891h/+JqKz6vxxaAXyh4zNWg15H3C3ca9tWq
         UJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789118923; x=1789723723;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AQwqbXwJzJUEnBnzBsi0ka1PwipDEMcTOXIfYajspX8=;
        b=B5vNfDZzTJ6HWzG3XTjG1op+ckLgpkZ3erlnwDvitDPhSb7rDAUaBDvQNOSKKdJvhL
         eEzNR4trMrcb1gS0RnO/rsjXFkQiyZjhptedkIadN/PNiQbv8Iwc8Hi3enxTr3ScGChz
         txucaCTaGamMAj6u6CrAmsVNbqNvSP0NiguA5JuCvdUbLGTXd/fzMi/BfVKeZXQAaAKR
         9vHIQDeH7r/j0LLjQi/F/JchUcTnK0oFpPE5iJtCDiPWQskJ8DrFSMn11YfUUJZOS4IH
         o4C394jTTZurfXkPsavCPLe6pZ0OIwpAv0roc5qKpvLSAYRhws1Bx8r15sBO7OoW/psx
         NgFg==
X-Forwarded-Encrypted: i=1; AKwUvBye7eaBMo/9S+VUI1SxZVXBcOjDxp/Rc09GS8j/lTMr1Q/OVFTukR2OBBVOkzAbB9jWNHOH/DPtwgmtQbePamRe@lists.infradead.org
X-Gm-Message-State: AFuF++kywKX5yOISTmjL9BCe/At0ULi2Thx7l/iC8PrMuNf+kaMMNZTH
	IFrPeOJGkjjOkpaRC3MsDkjK+uC74zSRia4gdjA8MfHtLs2IuIQSlD4vRPDCZhyksI4=
X-Gm-Gg: AYBFou1t5iry3g6IdATbwTmIJQ2vrjl2hUEerDQixIe93Jt6mJkTSlSD3UOfwinUKtE
	zD3APTBM2/JoDD9R0opJxKrCeVD3RzmcGQ+hk/FrHhgFEvfodPj81wTmJGlBKxLGWKpa4+hbQxF
	8TSqHFJpLnsBqCucRZgfJdeujPmvgQ3HnU1cMoLLkejNlQdnQt1sjAvmkakf2lwSnq2PEUMFmMK
	Ngm48GFW2wz/FA8CXze6zxTgIkI0lCC2W592pbeFLLmD3GxjrdH3jHPRjd3XlGS914rvZKLvDOa
	6U8OTJsA7kKViW4EbUBYEdx6K3E4bVyAKqPxei0G+qW6T9lebvbUyoiE54f5FSkerNF3455DdLe
	VgK1Cta+Jta3kccKJitmXEfZIPGQzuThGgJVv2hDYmPgC8lsU2PsYoroEbXCEWV/perwbLyTiJ7
	ha1jtEZOZW84H1RC+PO2gHnkZ3byB2bW1/5mzr1tpnRbB3nrys00AuXIml6Myk4wMLgQuknOjC2
	/735j/bWDhIIYFM8KLE9kOTye8R
X-Received: by 2002:a05:600c:3ba9:b0:49c:fa21:e73e with SMTP id 5b1f17b1804b1-49e619c0558mr44117805e9.20.1789118922855;
        Fri, 11 Sep 2026 02:28:42 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ababd5sm83052575e9.4.2026.09.11.02.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:28:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Enzo Adriano via B4 Relay
 <devnull+enzo.adriano.code.gmail.com@kernel.org>
Cc: enzo.adriano.code@gmail.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Ulf
 Hansson <ulfh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: allwinner: add Allwinner A733 SoC
In-Reply-To: <20260911001805.0a2e033d@ryzen.lan>
References: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
 <20260613-a733-dts-v1-public-ready-v1-3-7787c94681db@gmail.com>
 <20260911001805.0a2e033d@ryzen.lan>
Date: Fri, 11 Sep 2026 11:28:36 +0200
Message-ID: <1jo6e46ssb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_022845_330668_8FFA9982 
X-CRM114-Status: GOOD (  13.30  )
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

On ven. 11 sept. 2026 at 00:18, Andre Przywara <andre.przywara@arm.com> wrote:

> And what about I2C? We would need that for the AXP PMIC. Having that in
> the initial DT is required to keep the DTBs compatible with older/stable
> kernels later on.
>
> And it seems like the whole r_ side is missing, even those we should
> have bindings for those. At least r_pio and r_ccu would be needed, plus
> r_i2c.

I have sent the i2c binding but it did get picked up.

https://lore.kernel.org/all/20260707-allwinner-a733-i2c-compatible-v1-1-566340542bdd@baylibre.com/

It is a marvell ip and I used b4 to send the change. I did not notice
until now that the sunxi list was not Cced. I'll re-sent it

>
> Cheers,
> Andre
>
>> +	};
>> +};
>> 
>

-- 
Jerome

