Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338F5C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcbrVw4Njs0Kum/2VhRZM7j2L0V2JUwYQMRq+XXSVQ8=; b=oXByefaMlxDdXqcN6oScVNTaDR
	Fgg9DGl6e7GvL09Uhj7cfId7NzzNgcLd2d7Q5SdcYV8t9i9JkzOXwD7LLeXKTopzJRWnje6WkKoYC
	eQQLg7+tvZcbphOwfGQKvKjT8YsfquaBn1NchaBLGynYk8Lu9DrAN7+8CT402Dqu9fWFmgYaz0Wly
	uncgTNvEa3TFMvfDVZTH7QPr1sqmdRpw+4OSDGqLmR2aWZWNIuqCXYY1dhUjoeep8FdcwvgQ1LzQl
	4isSY5uaIU1arTjVkbGlJKbjpqet5wXGzM+wvbR9gfim+q7Mm+1YEdLNqNhNNaNZSdggsmL41cnQi
	q0NUZTHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trAPb-000000004Mt-0Nu3;
	Sun, 09 Mar 2025 06:45:23 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trANx-0000000045T-3SBf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 06:43:42 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e66407963fso544255a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 22:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741502620; x=1742107420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcbrVw4Njs0Kum/2VhRZM7j2L0V2JUwYQMRq+XXSVQ8=;
        b=DqhvVTq4/IYqJkpotxSRHQICZpNdX4xp/TPAZDQXWiV2cWF+M3ZAz0Zb8y0QLlVi1i
         oGZdL2LKrfTWiunKpZZ8h6sJC6V3S3nl5Nov+OlqP8vhoHNYHEHM9BxPGLneR9p/Hd/5
         ZbcUCPhfVBshLT2eMHe6WvpuXFYZuGMqvaetf663D21TFVwdS/NpBu49RnvenDr0hb/X
         qyk/ep2nd+Kl2VcMTVZIvrkdtOG3ssd9cAP3AESPSughTL2O9TAE2TzmQuxhMBVjoIHV
         qChFVwX5wVlc8i5Hh2C/JHjPVtAkWEvjs/AwFBo8EIZBdnX6lgsL2CHVPKkBbWoaIJDz
         7Rpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741502620; x=1742107420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcbrVw4Njs0Kum/2VhRZM7j2L0V2JUwYQMRq+XXSVQ8=;
        b=dYOKlDCBgxDBQJV/AZhFpNS5bxbBqn92FYDPoi1oQgKF6GbuShF37YmCrGyOW6z8LZ
         T5yIkD9b4fb4qUvql0j/rsZhOSt+k2G+YP+1wRFvnqVuY6LAW6PLfcJdFwoDpS5vF5CH
         eNCmJkPvNFcmMGiACBAEzQlkLSX3/Arnb77xFfkxwakhXNZ3AGwlsonfi6g/XgyYkloU
         YHjfwMjXn5yc7WB/6RZ35W1eGAsBOBiFP3WlTkTEke//c8o2Zb/nWBYKOvoWvh1dWtwR
         5CtldJcbvXjB53iQEA6SDFEyvqQi7S5E0h5aV2LMeOo054e+sdNGXmXCVGEKLl/cvtak
         S7xQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+QQozpZjlQWcqLSSYwFrJolUmSQbRw1sjTRMuSZRopxalo4ZMtkpu84Y5C5pTcr4J6+RhtmbC4W+/fsowHwUm@lists.infradead.org
X-Gm-Message-State: AOJu0YyuaFMJEGs+d/T4ENMTv8pDjH3fyeH4sXI0D6dxi0vIlXyp70PF
	Wyf4uBf6Qa5B8qUfY6DpIa1n8BH6lfgrWKWhTWiR+sWsx3Vnjhjm
X-Gm-Gg: ASbGncsaRfes6gIuG5XG/rfVj9innVjCPr/bhIJkJxSRC/I4lTWWoWqRiPNZnrtIuYa
	/zjuH8V1agxWdrLKmAMocX+WNTOq2PbZAoWBdnLXrXrKotQOgKsOkFhzAKA6Xr7D5gIGne/9IBX
	aLNThn2zvKdTHl596KoLvKRe6zBfs/GnsTzBwKEIX5XECPY78EzSeUaty60BOr4QNoZWgMnXjbo
	pACdd7ka18MPaTYf6P93z80Pl9TZjM93FP1MF9Acpidh5LgCaAPxMdTfzXQtcpPbWlH4x6svehP
	VmUg7izlmH5pPBXhO1nt7qjLuqFZeWxBbYcB+l9qCUsGxWPXOiTCj4A2EFraQaSWyQ==
X-Google-Smtp-Source: AGHT+IGoHXU/ZKdJQBXrrTuO1peZxmq65riLT31sE4BFWMi71oPY28XqAsCq2AVsnbOJtj538rdAGw==
X-Received: by 2002:a17:907:2d92:b0:ac1:fab4:a83 with SMTP id a640c23a62f3a-ac252b5a837mr1044767666b.25.1741502620028;
        Sat, 08 Mar 2025 22:43:40 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac287653e64sm109036266b.136.2025.03.08.22.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 22:43:39 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/14] clk: sunxi-ng: Add support for the A523/T527 CCU PLLs
Date: Sun, 09 Mar 2025 07:43:38 +0100
Message-ID: <4633243.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20250307002628.10684-6-andre.przywara@arm.com>
References: <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-6-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_224341_863762_3C68E64E 
X-CRM114-Status: GOOD (  10.08  )
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

Dne petek, 7. marec 2025 ob 01:26:19 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> Add the PLL clocks of the main CCU of the Allwinner A523 and T527 SoCs.
> The clocks were modelled after the A523 and T527 manual, and double
> checked by writing all 1's into the respective register, to spot all
> implemented bits.
>=20
> The PLL and mod clocks for the two CPU clusters and the DSU are part of
> a separate CCU, also most audio clocks are collected in a DSP CCU, so
> both of these clock groups are missing from this driver.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



