Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EEEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 19:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aa/d/vFi0BE7yXkavGTYUSUbBMeNwI3YLV6urIqr40g=; b=aw+KMmoT7uyCj7hqLAST0POGHD
	lWquQHTrOaDL6K7KoGyc8R8WLsTGt9DwcLcgOQ6nz0IgpJs7/rBUEw+IF4qzOQkF6kf5Tf9FHaOih
	ALpCZzNWt7q7j28ir4BNb5+Kw+6Jz2aAbhoY1nBRsJEsZ8p4DnegRloONc4rQl625+yTX9Q0OIHzG
	M5arRKLYG5xSRPJ+GQmT893K0zDxHevrqXyqtoEGixGL0yI+/YHti/FrclzPYmNP9wq8j5Et3dKQx
	Q12UYx0BuT/k5KQzUklTsq8IYYbtqI6Ra+R6HpuYSKTwnnui2Goj/aMHsnZFz8jzAdrG0yGv2j1yU
	Bf+Y5fJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBc0-0000000FmJn-1SMF;
	Tue, 07 Jul 2026 19:37:44 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBbv-0000000FmIK-0DXX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 19:37:40 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2c9b1edf2bdso58215465ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 12:37:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783453058; cv=none;
        d=google.com; s=arc-20260327;
        b=UQzBLA9hWI/L0U2OjNGtbED958SDBWKXMdaW0P5tZfeUPiB8wlMZbdL7mdmUBzXAO/
         EjqEg9uPIcVyINEattvLjIthP8zZYy1cMaRGbAj6o+CcOG5J/9SrfHsu58+1z/jQ2wSS
         0LagZk9wBLsOVCO4dDXhBTRNKwxs0/fjGSkjyGNl6EeFCw4sWcNUn2F1fwPoicG/j5yK
         hswp+ieBLN1fT6wH0Y4JF1Ip3i80hkbIRk14rsaiN0k7MKsEWI7CsPsRhFdaqHsyuYsp
         iETaurItfen7qdnlzbE+MdLQEYAiEIIosyLeRNLeDyVxbYIxf5ttkKdYwlKUfwV5bTDn
         Mbpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aa/d/vFi0BE7yXkavGTYUSUbBMeNwI3YLV6urIqr40g=;
        fh=XMbgbli9wXWaLZlfcXiX9GT+KiFGwAxXstxM1rDgT/M=;
        b=C/X1UO/dM49f8AO7ui9ceA7seVoY/jh8z76Kb0UavWIn1gayZuHrpgBH6hKoAv8WcK
         41rl2aOXRQow5b7eKrIlU9NbA/nuuO97orj+HkpyHTKXQhi7b/M1JMu+WJPsiz9d/FGv
         mPZUMbzCcfDrh867n8E7ekyybh3z91c5tZFGq3AZVE2OJD1etNOszQyBq1uiwM6MB7lf
         eHy+nqpyg7k+FKI25AtWg2NIGCLdiayOart4AQwD2+VBo/JESMa3bMlRBOAJ3a6+cOQW
         hGAEGGD3rUeijQmXO7yRnaGTxayiJjIUv6CCEnYvMt/oGpNvRP8WF+iBLS3PKJtavDef
         nxUw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783453058; x=1784057858; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aa/d/vFi0BE7yXkavGTYUSUbBMeNwI3YLV6urIqr40g=;
        b=IhVwxawy+17uX6Zas4mg+z9xO53Yj2rdSk4QpCQPQ5AOCkfGEOXwhm7OhCu9kqCHJP
         qJ4K1mNtou7w7MGculx58TFmoWli68JQPvuGFsDMcXYrjjPRlRBG9K1IlSOSip4bL1S4
         CRnBtJ5uAH36Jp+yAHIjUo984V1fY8SvNHb452oFN02gQTFWs26vQ5xb0Cici0/S4nKy
         yx2N/ESoJZz/Vfrbc5DhpPmNcaAr/XtpcfDomhLW4hfEmQiSKmEHaw9lNkyeHEiANARK
         zWter1W9eZ0mH0l0nsBM516A7hu3nKO8b8pWxTx6smW7t90y6ggRw5gYRmeMOWuSQKPq
         T9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453058; x=1784057858;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aa/d/vFi0BE7yXkavGTYUSUbBMeNwI3YLV6urIqr40g=;
        b=dKKv1a1kysh422wg0yixa8evS4JVRqxAZmNFZ+P5+quuVIVrq9H7TWX1wPYzNrkevE
         fL6xnr0zZMUWcbJi8ddDQMTTiBPEKTLukbInAAMy3taJrA+kKMB8P9Geh+849+LPHPUO
         jaUTHruE7ZYA1FVMP2XcYdSojesuHHPI/YS47opg9OZm2uzn/pTNMyPH12iT6i4OiKn0
         hH/z0VudwjvC21FjVfKo0/tp33rWkyhvsFetn8yLPYXIoOQYwk83mp7vejYu+0VDjYjW
         N+P/Hy2R6dgUDmV575F8mCibXt53Kl+3BmFFSe8YyJ5IYRsOPkPxzuXccQHAWNWqaZpN
         LHKQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMyisYZrE5fE8RjliesBapS7z3hHyTFvwfFPkvIG35H+AnPSJ0cmUgQO/N99UFLP1HbeTD0Ao/hwA9ymI/TpcK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+PLZEMyCkIxsp3ba/4oanYwM9KGCLcMFO+5e2KQOw4xlQ6Bky
	aNKV0Dd0xY8MPfIzHWiWT6qp2WPZg8wzTIbR+LbK910vCRVJZt6h46yXw9KODcnC+q1G8dsr3B0
	2LXP5fyZuT4A9ZH1yc/7i/yHoSRuL2sc=
X-Gm-Gg: AfdE7cnhF0tj1pkXK2mbPVb8bPpVpLrUwS97XWS+HdKea2Wbsg/IaaO0TNlNZKdwiIv
	ViVuSnpmrqBBL1KIIDHibVAGmcoXH75ZZ7pDM0RAMw4eBQHuXLwkVtjtj/tKZKLMYJKlXC24+xc
	GNktVYcFU1V1W8YIvshpBJFlAnOObo1+dwBGrm5hEDerhBzx4zbUgHXapfNxZ1mSjmdRaPk2oUV
	W9YgKjVoIVr+tSgtgI4V9VelB19cVxZgtAjuPsePgohqVlPyPTk+LNpbyUgm+7J1zLSFqRiOPv4
	eyfs+1u1LoWSxx1p4oPWHXT/gjW7iyo/2837
X-Received: by 2002:a17:903:244a:b0:2cc:9a86:9c42 with SMTP id
 d9443c01a7336-2ccbf1b95demr64908935ad.45.1783453058116; Tue, 07 Jul 2026
 12:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260624135650.727077-1-jerrysteve1101@gmail.com> <20260624135650.727077-3-jerrysteve1101@gmail.com>
In-Reply-To: <20260624135650.727077-3-jerrysteve1101@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:37:27 +0200
X-Gm-Features: AVVi8CfQK0siXaeTDeQArGj0PmVREFVpRuWfBiz3ACt-27jHdJsP7_vY7xQZbzo
Message-ID: <CAFBinCDjAo5WTmap1si1=BapdaGzdbP-FDyR4Evx5_EvWSvSig@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] arm64: dts: amlogic: meson-axg: Add missing
 nand_rb0 pin to nand_all_pins
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Arseniy Krasnov <avkrasnov@salutedevices.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_123739_197973_1ED188B0 
X-CRM114-Status: GOOD (  11.81  )
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

On Wed, Jun 24, 2026 at 3:57=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> =
wrote:
>
> The nand_all_pins pinctrl node was missing the nand_rb0 (ready/busy)
> pin description, which is required for NAND controller operation.
>
> Add it to the pinmux list.
>
> Fixes: be18d53c32b2 ("arm64: dts: amlogic: meson-axg: pinctrl node for NA=
ND")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

