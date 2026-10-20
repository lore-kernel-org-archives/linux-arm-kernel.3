Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F389A606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 01:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UnYU4DXj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kJQNv8xS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkYwyHMfJbGSQ+mbZIjKmmDSlODNjZUoD2Y1WRfOazI=; b=UnYU4DXjPO5yIFpuVFQt7QD7ig
	xoYUIKgG+scU8DvRuCEXS5G+6OMWMb6j9sxBUTwo2rRE8n/tPB1A690+TZ/Som9M+6E4RY4cAQUJ2
	8pnzyN98/4RglHhy0YCJseiGFi5m9NeyiALLktXuYGN18yyS9bQNBFlifodvLHuqftIigV2+wLmLF
	3y3hfQpwVtamnqCkIBtSgOYLjjKHm/TlkuNqXt44NLWCObym109mYUsAcDKnTxP1Xer2WtduJibXp
	cpMWkz289NGxuIH2Veu1AKismb9IQgDbQ6bfph0TlAqdE+NzrbkArIXcRYV/DeWEs5dRGpkmMY5zp
	V6gs6uqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyqS-00000008dRi-09S0;
	Tue, 20 Oct 2026 01:40:52 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyqQ-00000008dQm-0rsz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 01:40:51 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-3514b90bb89so7153583eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 18:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460449; x=1793065249; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PkYwyHMfJbGSQ+mbZIjKmmDSlODNjZUoD2Y1WRfOazI=;
        b=kJQNv8xSa3Bo5umAWU6kbMaXFG/QkGWT77bJKZIlY8HWcFT5XseN0pr7j50WRmDOSX
         r5X0y/OlokK99U1P8J11dRzILjBsZNwpCONz0/e/t345e2xuyi+YwdZAKNchEL1GKW1z
         IXOMKDiwTB9plbHAlkPGnjNnBb2fPkzy3RoW7RFFViqcLv7A9IFnYvyDCVnPhaWHPlTD
         CtT+o04k2ZR58FAW///QHwJ4JoIK/x99SNKe2TzrqLbFoaRluEAlCV4iYZMbAJF2LPru
         q2mbistJVpN6PQVJvIJg3OhCjR+OEfnmwa6/zQ76/8n+HLrHhTZCXj9REYXjmzQLecUA
         3tDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460449; x=1793065249;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PkYwyHMfJbGSQ+mbZIjKmmDSlODNjZUoD2Y1WRfOazI=;
        b=FeFs5pLsmOeAZOB+2jl/cNh5mfzsOXF29DaZc6Dho7KbxuX9uBcWmbPUD/WB0IMga9
         40+Lo6FcGDkkeqiSKpQKdUE9WcvTstlDx2ThTpwo5YMGtpbkDmJ5L8MLsluTreCMOYnF
         r7bQtnMNYaMpZdKWEXOl9YRsBZg7+dG5toyvKMtKvIFWXQ6dX2TlhLFp/sZ1jugfcvMw
         IZAPN1awA21WEL53yvawgeTVNDBdrlcgo6XZEmSGHBS6LdPTwCT/BS2M8vjadfwwGWT7
         gD2xZwGlbRUKQsgxeGGNBW6d+qSrhzv5e2bbGf4amM3DPj3wXj2IIIRFNKK4POEI1Gne
         PErQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwFOn3UYq8N8UprKTumvZq8Dfib8UVG0fV1UDKSaVrwhWyN0gQLwBkw9amNmLkNy2U+8+cxeA51dZQe2Ia8+ef@lists.infradead.org
X-Gm-Message-State: AFq9FYJZpsyxJvoWbE/5McAvLyaL0YLW79TpK771xuRVrUIEC7enyoaR
	9KbmUt3bU8rrsWcy3ps3NRO6swegYK2+FPox73XI2heL6kHZuLz6LQ4h
X-Gm-Gg: AYBFou0ArJC2iRGFZ+ED+iZZ1i4xCoK+c7iYUzgTD4vEmyzc5LQ68Zm2D9DiJMfIIVU
	s054HEWY5/CrKffMYwwMp7ktYj7b/mLuCikbp0R0zwVOhFpJXz6jagoaPKbihCZAeVhMUQuWHKq
	4hFI2B58aESkDdRw2Xak4jATGyRvOL9ySzXW08jW0Wa+3wQasObhl+3RGIhZ76+2qE9Ap7jn9mx
	uo9u8qdpW+kgYyYgw6q0pFK5nuBCAWpAPSQe7W3BfZiFb2suyqotC3CgTpR51Odg6kCcFnEu8qv
	OH12ekFJZNg67SqDaBur/yNb+UZsQD0hNmPV0GxsJvTggkg7zYfHFDDjwGoPcsYYKmyrXI1pR+H
	rqmpqeI9nDhWdEFOjOuBdFaAcFtu5bkPHnfllEgQV5aE2Ne60pNFwDSrtl6/Y3aqI6rXrknRqi7
	faP2bHZOr8HTgRCDVQhpG1JC3Zlb4p2ZldouRmIH6ISXdsmlbusT1rlKUEcLALT2wpfuZTvEzTO
	ZA/MDcM7hPI
X-Received: by 2002:a05:693c:810f:b0:353:7d17:9a86 with SMTP id 5a478bee46e88-361a2549c60mr14463175eec.26.1792460449367;
        Mon, 19 Oct 2026 18:40:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608219f838sm36078733eec.19.2026.10.19.18.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:40:48 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:40:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ben Grisdale <bengris32@protonmail.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 5/8] dt-bindings: watchdog: mediatek,mtk-wdt: Add MT8163
Message-ID: <efbbf24a-59ec-44c7-8738-13242c7cd90c@roeck-us.net>
References: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
 <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-5-f2462b2d2437@protonmail.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-5-f2462b2d2437@protonmail.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_184050_244647_59945FCF 
X-CRM114-Status: GOOD (  11.01  )
X-Spam-Score: -1.5 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 01:40:01AM +0100, Ben Grisdale wrote:
> From: Ben Grisdale <bengris32@protonmail.ch>
> 
> Add a compatible string for the Top Reset Generation Unit (TOPRGU) and
> watchdog timer on the MediaTek MT8163 SoC, along with a header defining
> the reset IDs it provides.
> 
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

