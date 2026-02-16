Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9A6E81A40
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 16:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrplvzHimehwQbv7UzsT11ysVk7MnWkqJpylB70YYDI=; b=bh7ie6WvmMzGvP3V/LL48JMOSH
	2/YaLdGrpzfAKEgkDKEunxk8XOG9EHg8efjBbGkyIv966Nmbw499rIjlCLC9d9Vjq7iGZrGE+1+m4
	Ei5WMYR1jPBui8UGouU5N3YgPYuAPE02iBEqgcmruFkQIZlPleCi9TV9EDuCdw+rzUgswELlP5bDl
	YogAqE8c/cnCvPb2Bis7M7anZbd2WHv3CDhHJzZQiEBL3pb7OILPDrsoDW3l11peC5cw/gkRGJwGl
	LLyon/FQaJp+y6PCFbYMT7iN9mkP9hMr2lpNl8rHTbu6cL/3KL3FzQVhvjzbHPdBkDb4z4Af62G3g
	TLSW4iyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1ML-0000000700U-3UXq;
	Mon, 16 Feb 2026 16:22:05 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1MJ-00000006zzo-2SNN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 16:22:04 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48371bb515eso37810765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 08:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771258921; x=1771863721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrplvzHimehwQbv7UzsT11ysVk7MnWkqJpylB70YYDI=;
        b=LNDlmat5+H18mYlKFMLFVTox+4Ud2siepBOH1d7257dt2EiiFqDfiSPhlK8oq7vcmZ
         uKHDt30snjYsgihyUeeznmFlEfGf5xYxCnHzOxzZuuMyqUwiulNbLRJts/WM+WBFPetl
         zN/7BJKLWZSWlLCnZXsTKNdVzXRYSI2ExfxkL36crb+TIHaTv0trJ/wAlXwG9l5k9IYv
         gGqwfhht3Q+49tUSV8OJFzNyWkB6WbCPRNDACOccWQXhesrfEbR51973NFMukMGGL1QC
         xfJ1uYDsHBmSGNS6u6WvNebmlxxF3F2WpCT+vlr0sQRH2J+7fPc70Cfq7kIkGNMGjpqt
         YsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771258921; x=1771863721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yrplvzHimehwQbv7UzsT11ysVk7MnWkqJpylB70YYDI=;
        b=cknEoeBmnXPYZJXlTiVV21ZIH8nsg7wU5b+lJUIx82bXCrirXlT7sy7NnX2j2hqxja
         DpRrhiN0lG9U8TRCwB6qAOKMcAhvPpyYHwWd++aRhI6Jq8AVdL8TiYk4b0JgNlX8MveM
         ZJYUnhwrxJAPDPFGfOe+0/7AGcA87eZJSZsMOTJ88pbNAiqAulATgOxj5frmtcTwyt0D
         jOtxbfB2zohKxhxzRew5zf4c1an5DxTw3oft2UG0S1Wzr/3+q5ZnBTM/WW8ikdOZe6pG
         Gomk2P3gpJNDrub7POvXw6/7cLQNjHFlkphwS7mIrg+JuxhuREsoXeAROw0HInOe1hVr
         LaAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+viYwPl5o6Lpwz9TJoaXe0nW5SbqGzZhdcGE5q8YS13hqlEaWwojf7lE5rrffOhUE/QGoCMIYuG4eqSlTDCrc@lists.infradead.org
X-Gm-Message-State: AOJu0YzKLbNDdfc0akvBudIHyo/4GjA3L2jIEhVqNr8pqwfaEnVMsusf
	wAi6RIpTifyuNbuEtzVC51xEfJSpc1FeRMHh8ZWibWZ3cSJUeqUeMSSw
X-Gm-Gg: AZuq6aIoNsfDLp+CD4leki0PQAnNCFKx6wszAZ8w7po6YtppSU1VGabSdI09SfeMKhQ
	McBEtYNaUuX9KVD5oFl6OtdgZYjAOyzKpUCUmHRd0oKSV2Qq/98BTAZM2dXqL9gEOXZNgYT8Exm
	7Gysd8/x/CrNKyH09Mcm3d9ElNqoPeFdNTNCLDleunIbcdnC0DFU/159d8c2FiVhDvohMcjhwzx
	TWg2+n7bj77g0LJKoMHvdZNOBOBEcTN+xhyG0qM6NoL+oYJdMWOR4uW7eDMPEpialVpC0nLYVVq
	83wq0qdJTdF1CJZWRZcb+WI4ido/eAMd5skAcLPD3CxPr6kNE4rkJ/WwRcoMCwoNNIedktrvPPk
	vMraAPtCorfvk84mHSxl5PXXtpkOxKj+yzkfd3WNbQX9cnzI6ywNf9DnVvZ5Oq6spSlDii9hSk4
	0Vc21A3Y8ISzLwa5CU2bI59dBXdcPkInASuPvSzqnLi1DixSmelpJIyCSP0+Aqv0/0QE4xZuhTv
	27AY+zqZSaX6D8LpQ==
X-Received: by 2002:a05:600c:8b61:b0:480:6b76:dfb4 with SMTP id 5b1f17b1804b1-48373a083d7mr183030205e9.8.1771258921040;
        Mon, 16 Feb 2026 08:22:01 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-79-213.dynamic.telemach.net. [178.79.79.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a74918sm27901928f8f.17.2026.02.16.08.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:22:00 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: Implement gpiochip::get_direction()
Date: Mon, 16 Feb 2026 17:21:58 +0100
Message-ID: <12836817.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20260216160946.2977985-1-wens@kernel.org>
References: <20260216160946.2977985-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_082203_651164_C7CA7358 
X-CRM114-Status: GOOD (  10.03  )
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

Dne ponedeljek, 16. februar 2026 ob 17:09:45 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> After commit e623c4303ed1 ("gpiolib: sanitize the return value of
> gpio_chip::get_direction()"), a warning will be printed if the
> gpio driver does not implement this callback.
>=20
> Implement it for the sunxi driver. This is simply a matter of reading
> out the mux value from the registers, then checking if it is one of
> the GPIO functions and which direction it is.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



