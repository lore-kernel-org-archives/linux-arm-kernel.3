Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B48CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 17:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCIPeksxx2uDarfAhuXFCN/oVVLcwA7r7uPbkIEyGqU=; b=L2GrV0bsDEvq0TJ1m4u+bXKrP8
	5qfFMIi0TjQm8E7c2j75qMZq0XMJ/8PvbkcbLP9FJuFZfd6zK0l9ygJwKX4rpAK5v5/0wFd82zZHs
	BIqK4x2KfDpRidR8VMDVozM88jsS49d6RZA2Lokm9/9tGE3BBmdRfdknBj8dUY0DVmnykadewkhCG
	wNybTmVs1EcwAfdpUOmdHq+noXYcIfXbqzz4hfKX2XzhRygSTpv+qhxtuGC60WhRQFqh1Rdm2a0Fd
	Msl1gE1mKK7vIthxkKdP/5YFzrClE/Zrjd98yYTlbvERFnG3MjxVpVZwyrovDum6b+LRP2T8v4fw8
	vbPlQycA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRSh-0000000EUwg-0CTv;
	Mon, 27 Oct 2025 17:56:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRSe-0000000EUw6-2m4p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 17:56:53 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-475e01db75aso16712295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 10:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761587811; x=1762192611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCIPeksxx2uDarfAhuXFCN/oVVLcwA7r7uPbkIEyGqU=;
        b=JaB4wxstdvhm0SU6NkePp0k0Jtv1cehqIs5Q6YR99rImJPEmBPlLYEh3a4xo2naRDU
         d5hG3YwtnnkP2w2aRMA3WnNE/HxPrxO5WjO9GI/GZvisnYAARlZ5NOJjKnNUYWN7zy8o
         tmNgAjTMkjS2CjSku0ujWZ7vYLPpCW2dbKF2eLokTaEiw23GVBj+QZNjQU3orQJ5B1Yj
         RyTihrQEo8Up/FomfVaZ7pcn35S/4dGD5Jipaa3tX+FltjNCIMS1ovlKs+c7WPHoHBeK
         KRe4LstGaCNlEWK71sxcXaUIgzfun04v+9wGlHdX6WWDqx/24Bc1xwzlZyK/mxJIwdIS
         wZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761587811; x=1762192611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCIPeksxx2uDarfAhuXFCN/oVVLcwA7r7uPbkIEyGqU=;
        b=SdcWdkSOYbXfc8OqZLdZnT0GHF2vhSYk7jtUc8mtJCsCZcLoF/hofEmJZV40S6KJJt
         Gg+5SFkFaan4qfiKQux2H1BEv81pgxy6TIW2D0Aqsu/Wsxsyf5U2OYHEev2JenezQtc7
         WLX1DKU787eOlJSw3qj3FCyRg3MAHM61PWFdIkRhqFBUOKGsiYLQDumMg/mvtn1pn42C
         H74COe+7UYWweRWzjY5Sq7BHbVhJTH13l5mGPiMVBOvNLcE29vmc4mfr819VETDCRN6g
         jMdhzuVlq562lQhIACRKvgdetcR5LzSlJhF3R/5E1ABpgk5MBFPhOAU2MYBbO/y/2hBv
         aWBA==
X-Forwarded-Encrypted: i=1; AJvYcCWtw2GbqH5Yjf7sKw9LY7qfSDpKvpIjhLfueaBqCj6d26y6P1UNg3F2nGm/J5uzH9v8HWajyT5Pk3UId4JOIYSg@lists.infradead.org
X-Gm-Message-State: AOJu0YzZYxwYhtuPGCpzEnE+lMtUF54V6UZeIRWdjM63r2eY0qf1+8EZ
	Qt11v0J/oRiNOb/zeekPUWU+OX6dHQL2oqkxF6zrUJ9kjIlF7ZxAV4fB
X-Gm-Gg: ASbGncu73bZQoypNjIJ9cf6Gfe3Tp72FurquNYCcXguxG5dSDAYIGANrh0/Om5vebwr
	eQCRvEsXuFFFTxrxeFbkos8c6fIBwGEizdzlgAAAjfjdn9i1uYyTtpVQHMwzW+gxw2L/BeqE+D0
	IGVuxlWOGiCVW5DZNs5bHzTw+rTFmmmd0AJ/zKsoY5AS0Yi8OCJurGkAOj9Nzn0I9Jgc0RnJQU7
	IbJz8ZCM1Or+oqKYc6DecTACSvOFAkbyfzjzojTyxH/sLzNc1IiiDWKmjDQy1MwwARKBusVdRMu
	nPBZHR5oAJe/6ATMJhZwbzn6JaumJxZn/vdpGG3cAJjoSnk5G+6tUSCxlrxegrXiE0i5RZ8Wr7G
	12zm9LuL4zjGSH8opuwFoq3BIrvILMxuu3gujZHUQXhp2jPeL5JBLFOOKSt2/UOZ3Wz6hAb7Kqm
	hyhnvlBV1oEv9/gsOjoGXmf4A691yh9puiLYd0wpNlgvrv5Lxsf42g3qv7yA==
X-Google-Smtp-Source: AGHT+IEihm/mMfPTi4flOTdp91sIkNaqwi2a8InYOu2pJ2ai1utyKQHaHYaafUG+/91FRnDBC8gdGw==
X-Received: by 2002:a05:600c:64c4:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-47717e512bamr4754785e9.27.1761587810623;
        Mon, 27 Oct 2025 10:56:50 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd4cc596sm152270065e9.15.2025.10.27.10.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 10:56:50 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/10] ASoC: sun4i-spdif: Support SPDIF output on A523 family
Date: Mon, 27 Oct 2025 18:56:49 +0100
Message-ID: <6204310.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20251027125655.793277-5-wens@kernel.org>
References: <20251027125655.793277-1-wens@kernel.org>
 <20251027125655.793277-5-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_105652_722204_1F543448 
X-CRM114-Status: GOOD (  11.83  )
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

Dne ponedeljek, 27. oktober 2025 ob 13:56:45 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> The TX side of the SPDIF block on the A523 is almost the same the
> previous generations, the only difference being that it has separate
> module clock inputs for the TX and RX side.
>=20
> Since this driver currently only supports TX, add support for a
> different clock name so that TX and RX clocks can be separated
> if RX support is ever added. Then add support for the A523.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



