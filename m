Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D75E10ED64A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHCWZwzs9paKBTwVocNY1Bav5dyWetLR7DtSeiePs98=; b=gyrh8zQ99O9llnNtnGbc4ua5O7
	fFD2aFB4aJxnQoF6yIu+6ObCpY5Q+XQ8dHlitBq2dRmJsnwzXWFWgOHaKWfjC4Nh8v2iGXE41tSHf
	naydzPgCGXpxRb5jd/ssc8tdszm/uCXlnBLgrpdSLrYGKLEsPtEVDxpQe0tU1hiEHS+06EvzfE+Ip
	ktckCz/BWG/aDIB7mmSL0JAkyZ0BIVUWys3eF/QxdKlN6WYYJ16Yhs49gmvlG/zhbQFyZVRmULxGi
	20WItS/A0aw31NblnOF36MgGA1DFyAd+yyoxxJLN1SwCAEZbAGR8Ec/o6tylth6dpn/QHsrXLjoG6
	AJInl/yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65bW-00000007IDk-2DeC;
	Fri, 27 Mar 2026 11:43:54 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65bS-00000007IBz-33Vj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:43:51 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-486507134e4so23549775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 04:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774611828; x=1775216628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHCWZwzs9paKBTwVocNY1Bav5dyWetLR7DtSeiePs98=;
        b=OzkfPaT3Y4awxJpp4SuadRB7VslnKx+A1CwnR3OBa0kYUztyHuBcDCddwR4f/2cmeV
         kEbNLcmShwqocwA+Z9gTNvyYjOKLFGra/XWG4nLges+TzQKr/4908kfMl4YqMOaOzvE1
         OibR77WShqPYBaz60VOVm2uccc1lp/W+Wm9LA9psH1WvqMynF5tlqvSUhf9UzX65KspI
         A742nUn0VsxFzfowLurWFz/WgGZl7/0vky6rCFBHZll/13IlixAqclG1GLNfvGUgFJfd
         Bgw3dIjby7cVCxHXAXt6x1V/ENWJitBmOf3nNVWJjzfUOMLu0sk5cKhzgXHjlXjsCcvY
         gBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774611828; x=1775216628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fHCWZwzs9paKBTwVocNY1Bav5dyWetLR7DtSeiePs98=;
        b=gLO0+F5mQPd2xDMo1fn5ZK5VSY4YIZlzuNVoyHK9fueQLaJwX7DPiS9NxsiT6BiDwp
         E8cKEKcgGxVu2/Oe2CzlsVDW9eWklSRfwty9GApRArb4njqHRdqlTsu0h6jRfNQnXFOY
         E5fX/Nc1Xk8CgAbI3JA35jSYJHtmRAOWkZ0B8PWtAZJKT+PQN7PAEE0bqk/0tBZEZLMS
         zKrx71yugjLwrGqISLz6YjL+ujgjGOLtRd/nQnYOnqk54EEyinNb060w8FyqdOib3wvf
         X5EKx1agTvR+y7fw80dUCK/rZIgkv+Zhm6bw/B8QftmmUraLanns9qo9FsDI9C574XFV
         qE+A==
X-Forwarded-Encrypted: i=1; AJvYcCX/RO61SPuQNdZnC6HWUnElBfUEmmCeugi4oR4VXaELxp9raLIqF6dtrK2+ktasnaQxvpF+8KwmsvC23CHoBOWY@lists.infradead.org
X-Gm-Message-State: AOJu0YxwKh6iB9iB8qsfDtwODTs37x0fPQoBB6p9ptpEUACWJLb+B2bT
	pD8ahoAqUOf0XZBgNbMbQ2hBRUknl16ZM1ZYxCBLl56fN3+jQBGqFZ7h
X-Gm-Gg: ATEYQzxn6I/pe3MTyxEcOLsH1XqFd9NZDs9VivabxLcI1InhOG66dgPQr1+yKgb1aUt
	RV7wMlafcuHIU01pSg/9qkZmYfoTbgmDvdXtVoEI29sgL7HCVnXgtPmt0ksfrU+MKVvSt2ouisI
	ot+IOzZ99AbGY3aWSfEzt0z5AJlcvsg37dJJukuh3jD4zXBhykLVKePomSwqG/mzD1475Z5BJDd
	0AnnpATaEC1R2cepnbmy8Sz4m7Jtb6hQq7GuCVturyiHd30gBb3vvPuzGbhRRBUy3OGnepzfCDl
	kHi7A4eduomXZ6lhOuKDYpWdYUCY1jJ89GRfdfBfQWAOWG5zpQhGogR2SjNEfcDCP0XhwhEZsHk
	dtOUyawt5TQuGkW2aelEDx5DWjRxZ0JZl/Ojfr75SPMoK5BZJhFEtQ5/QXqu53yjCuzxTG+iucq
	ctA4ExeNWDYBTMMhq3cDYVwVH9oontMvCT2r1LdFHb3T6rDrmZFS6yw7ddBdSgyXW2YHdskmOX8
	G3cwAllmJa0PtFLoA==
X-Received: by 2002:a05:600c:810b:b0:487:219e:41c with SMTP id 5b1f17b1804b1-48727f36da5mr33865035e9.28.1774611828249;
        Fri, 27 Mar 2026 04:43:48 -0700 (PDT)
Received: from jernej-laptop.localnet (118.red-213-98-130.staticip.rima-tde.net. [213.98.130.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm184799345e9.2.2026.03.27.04.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 04:43:47 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: sun55i-a523: increase IRQ banks
 number
Date: Fri, 27 Mar 2026 12:41:04 +0100
Message-ID: <5976712.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260327113006.3135663-3-andre.przywara@arm.com>
References: <20260327113006.3135663-1-andre.przywara@arm.com>
 <20260327113006.3135663-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_044350_782694_CC2465ED 
X-CRM114-Status: GOOD (  12.54  )
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

Dne petek, 27. marec 2026 ob 12:30:05 Srednjeevropski standardni =C4=8Das j=
e Andre Przywara napisal(a):
> The Allwinner A523 SoC implements 10 GPIO banks in the first pinctrl
> instance, but it skips the first bank (PortA), so their index goes from
> 1 to 10. The same is actually true for the IRQ banks: there are registers
> for 11 banks, though the first bank is not implemented (RAZ/WI).
> In contrast to previous SoCs, the count of the IRQ banks starts with this
> first unimplemented bank, so we need to provide an interrupt for it.
> And indeed the A523 user manual lists an interrupt number for PortA, so we
> need to increase the maximum number of interrupts per pin controller to 1=
1,
> to be able to assign the correct interrupt number for each bank.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



