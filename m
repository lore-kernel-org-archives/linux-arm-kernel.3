Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46800FD3774
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6Ehhu/p48I8BFank35i0jRWbnO3y+NJ7AuacIynifc=; b=qVj161+TpoOL29qN5ilVgPmPed
	bay0EVJaC1+wCyUIInX0YkKvpx8nWaWQXH98+pNIoQ3PMwEEt8JxOE5vRi3L1VWAuFDfsDbO5uJB9
	GlXXJHELfgeVTsMlM7mzGzyeCqSHtN8LLlx/gC0RoRmmYy/lbL4Obyn6pxzFU//vLL/hyqNAxr1fJ
	RxvcSvVE7ISz+pey9MZHiCjeWxdKutvC8CaZ5uITPF+cn3MeQpPBYfNyj0iBYpyRS/rLxzaxQJ3nU
	C+UxH6hmbhKD3c16MGDzxdPEPfkuB8riLKo55jk9qjDmBhEtOxACVEg7/2dsPzp/N1CUxdTadlNGt
	Ss1wl52A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIHg-00000004azO-3JF0;
	Wed, 25 Feb 2026 17:02:48 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIHf-00000004az4-1FuC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 17:02:48 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b904e1cd038so995930566b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 09:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772038965; x=1772643765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6Ehhu/p48I8BFank35i0jRWbnO3y+NJ7AuacIynifc=;
        b=biC2eYsroaasK7l3BUcLLx0dF5IzjeXjOqjeDNV2AW6fJ1D6fMuD0X8NxYi2WITP9S
         qVanLp6nzviHLO3T2qrRDVAcRoK00g8CosJCFh1LT+QmeRBO51QpqOgHm+7VZgDlsloS
         eVIdYCqMwvsV0RMczS4yPnXJv1Wm05e9b24Kbp3OPpjn+w3jod7c/YFwFKNwDUgXo7Su
         av6LgnZklOnejZ80T4gBA34gOrxBpUOgLwDQQLZpNkCIB8wmNfWpxOh8LwqybXYPxFvm
         RRfClj+J91egjLvxidNkxpjtbc4pcu8nB/IfxFqOV2gMI+mnSzOldKnsiByCoFrVWz+o
         aDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772038965; x=1772643765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E6Ehhu/p48I8BFank35i0jRWbnO3y+NJ7AuacIynifc=;
        b=NAwKd0tkbiHPAuHqjIlbxc6GWWlXOn7CxuxdLfOyVDTpA5/9BjCWWI7N9CBvC5bGN4
         hiewGkHTJluGo5Nq/mBTverCvd5wro6loVvdNQXcXCrLG2KiDQuIhRfovKtFXfhrJuzN
         Td1pCu5Esdsi2g29RMkPRWcotChlfDNoupNp8cC4dJ0U605zEgfyd56FVe3nBsc/z2+t
         k4af2nqFyjLlGKiVbyGOi7I19DfYwfqxvy/rCbvtCaKBJW2IrIiQAX7VzUUgjOm3TAQh
         6Q6Kif5E6xzIcZ8zsFTvDbj7jYnDxOp0cqsC3io9KieoINk47eE2UXL3/Tg8jTPoNlW2
         fNUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW59H0LUeKlZ87Xh3fzrdLMJonY02e1bAfTnjjwc5+kKegJa6UCbgkJonlhRmODov9QXtbaWKjxmoUyX379cYxF@lists.infradead.org
X-Gm-Message-State: AOJu0Yztg7ujtQ4ZX98/Ywx5vVbRemqyrrq42VCuCn21AmntuU4l/2HS
	YHNQkrsDNm3XttUrIroUv1pA7LcoHUQHEAD3wrsBi9ynCtiH17YCHBKR
X-Gm-Gg: ATEYQzwYj67xKy+MtP/1/LOfa4Vk94AhelRtKZ5B6D52JFW0odxEvnfcAQf5o6vNxZ+
	Me7B1ibAVsC6y45CPhu38BEY9hkdP9LBi33e1JI4d2hHyM0FY9twa82azjCEHVZ4FhXtMcwwY0h
	2Oczvl3IeOB3A0GPRjaFReEUZl+p/r7NzqjcBl5v0n0LQs02EcOukZwGrCV3GCMfQl8wgJxAUU6
	AAojVYawneNEA9sB9GEs1Q5mNuJOkenYnSKv9C1Pn7Z0eDgf3STKgLtZUg35iItK/c04msLQgl5
	133ywk2LNoXyibErQs7zYpB81lU2mWjwtjrJb+uP8FGz5bB16/1cLP+QhqmepJXjuoPbROyff0q
	In3vG5ffOIP+K5aflNE5oWn1GrbW1fM/HR/vE1IvErQXESRj8ydS10jb+J72muNDJrIqf8faN0L
	YW95pwaBbMboiEH3IMvgELmj44WsAftK0YrT+f8XOR9R5psJjpbt+x3yh7SZtxDbEf3FUU2bKvZ
	WsID6wwYBC91qFY3w==
X-Received: by 2002:a17:907:3ea4:b0:b87:7042:9aea with SMTP id a640c23a62f3a-b935153e459mr63561566b.18.1772038964791;
        Wed, 25 Feb 2026 09:02:44 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9fb2sm35504200f8f.1.2026.02.25.09.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 09:02:43 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: sun55i-t527: avaota-a1: Enable LEDs
Date: Wed, 25 Feb 2026 18:02:41 +0100
Message-ID: <4714447.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20260225160828.1687643-4-wens@kernel.org>
References: <20260225160828.1687643-1-wens@kernel.org>
 <20260225160828.1687643-4-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_090247_366013_448BCDD0 
X-CRM114-Status: GOOD (  11.46  )
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

Dne sreda, 25. februar 2026 ob 17:08:26 Srednjeevropski standardni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> The Avaota A1 board features 4 RGB LEDs in a string connected to the
> SoC's LED controller.
>=20
> Enable the LED controller and add device nodes for them. The timings
> were copied from the downstream vendor DTS. The design does not specify
> what these LEDs are for, nor are there any markings on the board for
> them, so just use them as indicators.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



