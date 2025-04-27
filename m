Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABB4C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 05:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oy4M4hL9SuSSgN6ArJgNtJBu7fkhmoEiZXyOUTNGzv8=; b=QrFQLl1UMci6bn
	4nbBQ2NA0zHwfVF5w2hH95S+ZYN8Xxi9XNo1ZfDjmminm/UfVwtQzsx+Wl/hmpW63CwFv1sAKrKyt
	Iv9qldp/C5antaaR7h/l3L/potxAyDZ1FM+dtdk8ZcvZs/0VDyZg7QBLYGwMDwzRkuz8AaIi9Tf/Y
	k/JlQxJat7JhTa0hsFux3hg//FLiNjjSHTixxsX9Osa7+Y6TZ9nCNU13n3oHw0SlbC4bOrijIsDbb
	zcGMQJT1uSJqeR5WrXe/V2u2vxx79/naCuIzBnYJYSIaO+yvnX3Mi2a+DiAntU/jIqGYwX6OFrCSR
	RO2ojBt+utQbwXzckRlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8upV-00000002wEa-0V2H;
	Sun, 27 Apr 2025 05:45:29 +0000
Received: from mail-il1-f174.google.com ([209.85.166.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8unY-00000002w6g-23AZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 05:43:29 +0000
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d46ef71b6cso34330665ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 22:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745732602; x=1746337402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oy4M4hL9SuSSgN6ArJgNtJBu7fkhmoEiZXyOUTNGzv8=;
        b=d1E/kvM021cvs4ducS58o55HRwtuG2ZZUHAAmCCYRuNq/1BmXXnEH4RGXx34MTvsAl
         gevfQA8Dvg6S/qO2GGBv9a1I4RRYMvNaKTUiqYMbWIpzPnVr0b5+wlQP7yPZCcuwQuvQ
         XqAJOfPtDkaXVoC2ixocjnZ5Zjf8rqUDrCXeH2iFJ3W+UvkekuPPK/WiANmzya0M0jJ+
         RZ6Vgrq5LrMG6oesTSqbLtHSs7AGs4aSvXZ7ymxMroEjZUFIU6vwxg1VLLCaqyWtZGPw
         A+F08R4SxNwuaZa7fkm/nK3DkbtIqB6iszYGZoJgxGMLM0udnpkrcqgkbVsFzxF4lmAf
         G5KA==
X-Forwarded-Encrypted: i=1; AJvYcCXYl8Sot/65755fXrt7mikJaGVNb8d6nD+sMKNmb0zLoSmx09Na1my++G5qJf+FvIIX5FfVrDULb0XQfGBFGVZP@lists.infradead.org
X-Gm-Message-State: AOJu0YwvKKHFMljLwyxnq5MsNmq7BxH/C0kwOwRzMaQ2C0kjtOpzG88T
	weNsPCIjLOIKGSJJnY4+HBJRlF/X5cskhJIyhD6S/yHJ4ch6i4EpWVkljuZJ0jo=
X-Gm-Gg: ASbGncvaMS03Ag2LgKhTus/4GJhYPD6UGVvbyDCiwgNFpepeP0VfbBQNIPp0YfT0aSj
	DLikBKd0jyLxmkquUO6qnqRGXCbNjRtlpB+HcMBKzq+uQl6ZS4tWJS7bHM858JHNwE80mK0jUUj
	hV7pbHd17T0NOJ2xkRlvNJ/9iom30S5qDjZng1amGTLQ1YNftDKDDVE4pD2QEpjkXU7S1yzZOqk
	8Ud8JX/z8UcconK+Xd5YGyzntcjG6AHQ48Aq1QvCoRlBpr5UrWWBG+Es1ucLOaxazfkF4Vy4dOx
	OzvKnrFPlC2nQvYEXnI+kOj8YRq3bfUZrxEjw6k7jKb7kzlp3LB1Ilyxdp0U4/ptv4jI4Lif1g=
	=
X-Google-Smtp-Source: AGHT+IEwDfiZ9EYOq14p8sbSlM9Jl03euB/LNddsi3MWvvI6hnglH2uj90xIQfWEKQR5xfB6hpyklg==
X-Received: by 2002:a05:6e02:214a:b0:3ce:8ed9:ca94 with SMTP id e9e14a558f8ab-3d93b5cd18bmr68165005ab.14.1745732602320;
        Sat, 26 Apr 2025 22:43:22 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d9314c8319sm14412745ab.26.2025.04.26.22.43.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 22:43:21 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d81ca1d436so33493135ab.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 22:43:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXGOovR99rKMZIGCQBnfgRWL4sTGCHZlxX04DTNof8fNT7Ze8b78vDTblArVO4ZxVGtbkdlto1J0pgAeC3sqTOR@lists.infradead.org
X-Received: by 2002:a92:ca48:0:b0:3d8:1d34:4edf with SMTP id
 e9e14a558f8ab-3d93b5cd78fmr81686365ab.15.1745732601011; Sat, 26 Apr 2025
 22:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org> <20250424-01-sun55i-emac0-v2-2-833f04d23e1d@gentoo.org>
In-Reply-To: <20250424-01-sun55i-emac0-v2-2-833f04d23e1d@gentoo.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 27 Apr 2025 13:43:06 +0800
X-Gmail-Original-Message-ID: <CAGb2v64vy9Zx-mJgT7dLMMcx4nbAeQ3n8pbvwT6QkuMTL6kQTg@mail.gmail.com>
X-Gm-Features: ATxdqUH2fWJgqqz2HBql7fBmhdeRPMb6pK4jyUd7a8JS30hjhTPhRmRmPYt9c6Q
Message-ID: <CAGb2v64vy9Zx-mJgT7dLMMcx4nbAeQ3n8pbvwT6QkuMTL6kQTg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: arm: sunxi: Add A523 EMAC0 compatible
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andre Przywara <andre.przywara@arm.com>, Corentin Labbe <clabbe.montjoie@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_224328_530262_49524CC8 
X-CRM114-Status: GOOD (  12.61  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Apr 24, 2025 at 6:09=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Allwinner A523 SoC variant (A527/T527) contains an "EMAC0" Ethernet
> MAC compatible to the A64 version.

The patch subject prefix should be "dt-bindings: net: sun8i-emac: ".

And this needs an Ack from the DT binding maintainers.

ChenYu


> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml | 1=
 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-e=
mac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.=
yaml
> index 7fe0352dff0f8d74a08f3f6aac5450ad685e6a08..7b6a2fde8175353621367c8d8=
f7a956e4aac7177 100644
> --- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yam=
l
> +++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yam=
l
> @@ -23,6 +23,7 @@ properties:
>                - allwinner,sun20i-d1-emac
>                - allwinner,sun50i-h6-emac
>                - allwinner,sun50i-h616-emac0
> +              - allwinner,sun55i-a523-emac0
>            - const: allwinner,sun50i-a64-emac
>
>    reg:
>
> --
> 2.49.0
>
>

