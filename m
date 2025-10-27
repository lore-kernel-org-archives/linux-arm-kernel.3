Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256C8CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 17:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrLZa5alrgHzC1J99K289oAUToN5br+ZIZn9l5DB14I=; b=ixSE0QKHfBzWcIk2jMVz2cl2dB
	2aMoSkt5WiCxIVFe39WYi8eiajEviag0oVSaK8skjT3JsRAfIAci5WQOtIJwFzoiQ1a+Z8IZWsNI8
	Kff2CAD/OYZdBn988JHAc4CH1XthPT+UEdHM31LHqsbKSlHjiGU32zXGKirTl48oRT3m/wv1bZiMw
	HaZZTKZmDJm5T1WfwHIEZ1t2YPwVfo3VeQEjkNkMLN9w2WcK8/HEOFWfrO1f2a+Ii/siOI7HxWN/7
	KA8/Snnhqqhg2o6n3Mckged9AR7P84UR6F9hsPcBAzYuB8dr54rrKHVXBQEwVQLncP6LZrk8aR/hZ
	BaetocPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRUU-0000000EV6T-271E;
	Mon, 27 Oct 2025 17:58:46 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRUS-0000000EV68-22FW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 17:58:45 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so3476980f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 10:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761587923; x=1762192723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrLZa5alrgHzC1J99K289oAUToN5br+ZIZn9l5DB14I=;
        b=UAkteJxxsIZRXvbNMLQmIE6fq/mllyFyMuB0MvLPqDM2RRMlfMEA0aV/gliQB+oRGT
         pU/dgCDnXoFly1se0A0tEMoptIh9rMEaIVBPY6JntAJ8DBPuwfFTpZu2y3JmXefL4+7j
         lvyEMFmYm5/vglrMLEZ9IMLv3e7zZCZlqG0B5pGUB67zM2tX8FKAVw3Mp1BjCda8MuUF
         EVafGsyor1wrXRyqx4/bFuth5/84o6A0gzA82+sPCg/JaywQuabiXC23ggQampwxWVcT
         qz9zmUCphYbJTO5i2WHU0yP6cVTeIDVPynBKWk0X26WXE4p2iyDB7LJ0/3AjZGSZY6R8
         NoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761587923; x=1762192723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrLZa5alrgHzC1J99K289oAUToN5br+ZIZn9l5DB14I=;
        b=sjbz3t749E7htezTrWORE66+uiMl30gyIoKRfOyosB1mjPY/RrJkHzCIbdsHmXPsPz
         7LiYl46PfmVaWZilbWSZY+9LFj7PHRNvqN7MFii3pEbDVnZ+watoN4l5g+LAXXFxIgbZ
         qe346PeLmhOIY9BPpHionKiioEl2fK2ilnZy7KWHa7rf4KwvUSczWQXOmKRt3IDACKXk
         nmKrye+482Uw0fHL0SmX5SePz7YfAJf1/qMZLEY6DYd64AF7FZjKBqRs9RsMOv36SqIY
         9K4SWDeZ8JLTorkf7wgsy4Xpv9UZoNuBcG2pR6CBu64Ba9VofiZmZlfxgIKoRxph7SaZ
         HpHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMz8FIWZuNno03qkujkknewgvf/00lVSo5Ti+HaeWD0X9W6RjttTpGYgg+cFIBGwyfR3heiC6/PSeOrwdD+4ai@lists.infradead.org
X-Gm-Message-State: AOJu0YyC5G3gBbuZBqHSCxYJhvB9hrSwkthBlv4ygZmofQo/jM2zDJCs
	p/w9eEklps9xta/4GkOcHxGXtJH7vDeYMVx15NTey2qvjwmk1ZrQ4Lo2
X-Gm-Gg: ASbGncsFqIE5/a0hfOcIjad79S1N85rEK4JhS7usJh7eyNBtGjz6mesmCHrc7V01HtN
	XUccPVYA/ZIWclpR/froW3WRUZFHRYXrBxzlbP1yvq9o64a6/zUkZelP5tybXcO9/o4uKxncXkx
	uUByH4l0YQRbbjIHgpjejOPfT7/tZiYFOooTid86rN0aInb6auYG+NFQniE4+K4YhnRtrj91lj9
	CafXov7+NbHJwFY85pSkOSBnozys3ULjR6h574vDeBYvXSec9lKrb65p96AW+uCpyE9vnRVa4xi
	aQYzO4KNp8DnVwySaKCol+k645K7ksUwJQ/tsVx+CDhVy9qK171ENXYuMrmQfqnML+XLJWtbhiy
	6V0pYBgzQBRZQ7Blhhnb/MBHU8YmKg4mMH2ZBR59w3STVHRLlURh+JIt74ici9BhBv+MoiEJztI
	4Ha+iHnjMxhNCxEUQVvfutvGasHBw7eSYxmzNGy7mV4AzhkKf7WQwCSZHLvzwQFn72UTe2
X-Google-Smtp-Source: AGHT+IEEbY/WNAlAvL+pz8s7XDkjY8oak1WE3FbbRf2JSc/Ve9J9gkYo1nnN4xz8/yWauuSoOfnmDA==
X-Received: by 2002:a05:6000:2287:b0:401:5ad1:682 with SMTP id ffacd0b85a97d-429a7e59dbemr594649f8f.14.1761587922569;
        Mon, 27 Oct 2025 10:58:42 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df3c7sm15264123f8f.40.2025.10.27.10.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 10:58:42 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/10] arm64: dts: allwinner: a523: Add SPDIF TX pin on PB and
 PI pins
Date: Mon, 27 Oct 2025 18:58:41 +0100
Message-ID: <4686611.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20251027125655.793277-10-wens@kernel.org>
References: <20251027125655.793277-1-wens@kernel.org>
 <20251027125655.793277-10-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_105844_531424_E8EAF653 
X-CRM114-Status: GOOD (  10.71  )
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

Dne ponedeljek, 27. oktober 2025 ob 13:56:50 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> The SPDIF TX (called OWA OUT in the datasheet) is available on three
> pins. Of those, the PH pin is unlikely to be used since it conflicts
> with the first Ethernet controller.
>=20
> The Radxa Cubie A5E exposes SPDIF TX through the PI pin group on the
> 40-pin GPIO header.
>=20
> The Orange Pi 4A exposes SPDIF TX through both the PB and PI pin
> groups on the 40-pin GPIO header. The PB pin alternatively would be
> used for I2S0 though.
>=20
> Add pinmux settings for both options so potential users can directly
> reference either one.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



