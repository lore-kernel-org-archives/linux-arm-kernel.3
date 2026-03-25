Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55824F54AD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 00:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/L1QpJi1pkLlnS2R1iZ460CX5uyexB55OG07HYgp2s=; b=mqIe8UvExQjGyCxkcfS+jpIWP5
	Zv1XXB6/HEbTyPRUq9oMghmmETQX4+WMs1gKVZtfKU2/R1D3fTUw2tiqcGVZlPLNmPQove2RUbf8t
	Jvcuizv7jazxiVqElO4MCsgOR5a3C+3GKAEe5PjudohIOC0BdcPlVNO6PxW6CNLPbYMhg2bYu/srD
	R/qw65p6Xce3Z75ISSbW7Lmu1l17qD+uGoNuhPp9FutXeurWJtdq1Y35PMUnekkFlZa2sedJFycPT
	il8bSu6DIyv2wl1g7lD0vHcLWQSs5Ig5/rKygTJvdjMyPIZ+rZz1ChK3YBedkrrIwsh+SrfoTM9xE
	6u6BaN+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5C1K-00000002OMe-0W0E;
	Wed, 25 Mar 2026 00:22:50 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5C1H-00000002OMG-13If
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 00:22:48 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-506a747448dso38331581cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 17:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398165; x=1775002965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/L1QpJi1pkLlnS2R1iZ460CX5uyexB55OG07HYgp2s=;
        b=RxmV/ODckc0wdlq0U0al5h9P0pM1YMt8/4P0TCS+MIAyhvBaJ0FssaefK5yiB4Qw6O
         gt6we0e2VOqxHltryCwjpnifnRQBUmOe/ys/A/L9pCs6PCNGbo/DNOSbzMkMCKlf4yhZ
         VlQoJgtAfRUSvBDErulMNsGkvtSagIOI5KKHKyMCmvlSNW/90+fNVTObWdUWPS6Tx4iO
         i8l1QJtmPHUOr6dHzd5H3jh84Cp757Y2bS909QxIm48nfYeKEmRIN2vq1HF2hWtdElcI
         5oDwotfkY/h9NJDzTymtnfMpvnk4bQayNmqBuHo0o8pLNQoX7HL3hOMVN1q0iMREQTib
         fxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398165; x=1775002965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j/L1QpJi1pkLlnS2R1iZ460CX5uyexB55OG07HYgp2s=;
        b=D6ZLCeKOdI2k806inRN/XQ+ZIQpeNnmdVsRIzeK0q2F4c7EA65sy+v5sz+j9eZEa76
         OEpi50yOJW3LQyhng0GVOcEMqp0AatTcsEy3FL2C0VRCvYWpMqGheDG3PoR7WwW5CJ/A
         U2yWYLwiFhSY46xv76HDjOiPjq4dAy2YP5Yu3IJ+8w6oV5Xil7oMVFJtZq8WGT0x46aK
         Pr+L8jKj7GXcj5oN+lgVEnxr0C/E8k86yyLVDps972mjVXSr/O8a+HjgH8kJbgfM0302
         FbNXOVnsUu8zWUWN4Sz2jpvXmGHUs1jJWil3Rlw2rC14moPLULfOcV42xZMXl4RutZUR
         WLdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbYil+M+ulp3EokpBY/YY7lNjLGZIxsLMckXJ5sXQ3r8HNtXm2aQ/Ua0bz5GKnWuBxqYTyqgSgsB1aQh4FNA0m@lists.infradead.org
X-Gm-Message-State: AOJu0YwAdlLxE1PtD7FJxc2G/uYSGnAWUJK6IMkToa/C3qUGvcvU+Q+m
	4pgRT2mbOXTmXnz2WKIsNaSxixd4IbjaNUGZpr30BpBckXxvRBveNJ+5
X-Gm-Gg: ATEYQzz41fg9pn4GobZamSoQHftJlQI9YXPmxJtCw7PDNRNao6cP9NRivy3KVhn2Lgm
	OTFdte6gpnZPGu9qiIv2nokylwMDfL4me43hK9I+Fcmh6d9CCbP/Q4dKrtY1pEdYcKJVVeoPY3M
	LBOKr++A6C2ZmYdNvP3+IeVXADVtMIF5ViqJX+nOpI6YqkSIs4QYC77xIoJGpQBkRdgL7c/au6F
	N7NBXJxiq5f/1UbuDgU1nMAWt7GIoPDbuxolxmjEQMLscwIZivIi0y8jqXdW/p9i5cxXJ3FzdxC
	aiQ5PEiN7L57/iQ1bmNugIxurM0GflSfd1rZI+JNVTbaIvjcWFd+P0eMuj4XWPb+2Cb5HFdt7i4
	FdMcISHc6kHPzHCofYxkQaCXYYdPd3m4mpaLbuhRVBI14mq2jngfNnJjCK7Vi8Zc50EMuqZIiUY
	GHsiLt2zJbiQEFQ7+/6aryhw9soo3t+k67J9KJC7HAMYL+80C4b9YmYjrEHQ9ZDpM0CCKGGLPew
	CUymig6TcMJuw==
X-Received: by 2002:ac8:5905:0:b0:50b:26d7:eaa0 with SMTP id d75a77b69052e-50b80e59457mr26782481cf.40.1774398165131;
        Tue, 24 Mar 2026 17:22:45 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36d23237sm150693321cf.13.2026.03.24.17.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:22:44 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: sram: Document Allwinner H616 VE SRAM
Date: Wed, 25 Mar 2026 01:22:42 +0100
Message-ID: <13973231.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20260324164357.1607247-2-wens@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-2-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_172247_299289_837C4F01 
X-CRM114-Status: GOOD (  13.81  )
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

Dne torek, 24. marec 2026 ob 17:43:49 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> The Allwinner H616 has two switchable peripheral SRAM regions:
>=20
> - The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
>   to this region is enabled by default. CPU access can be disabled,
>   after which reads will show the same stale value for all addresses,
>   while writes are ignored.
>=20
>   The mux value for this region is different from previous generations,
>   and thus needs a completely new compatible.
>=20
> - The SRAM C region is an alias of the first 128 KB of VE SRAM, plus 64
>   KB of DE SRAM. The latter is otherwise unaccessible from the CPU. When
>   CPU access is disabled, the whole region reads as zero, while writes
>   are ignored.
>=20
>   The mux value for this region is the same as on the A64 and H6. The
>   existing compatible for the A64 already covers this.
>=20
> Add the compatible for the VE SRAM to the list of covered compatibles in
> the generic SRAM region binding.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



