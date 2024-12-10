Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDCAE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 20:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrfF3ihMgm7HLbBCTJxw/Qkq++9KZ890JxylLd2D9wI=; b=W2MWnOHMaBlkBRDgQyZ8IVsxK0
	5IS9elSQVOUyRhpXrckWTpf3ge5C7kpb5avokvhkuQxIVFJo9tvz7RIXQH0KAyAFfeOmzUWeDLYBm
	/KaJFBc8+DnoHSSQ/gE4YhWYAxHgZxVchlnHNkFwfvpv1jPPmCJvz7qhbebp5IfNs/Ie9r/GPCmsh
	+fYIPYSZEzGJn6qTP1Uj2vHCGZniMhmXKy45i5A1N3mqoEltb5zVhgvLA4R0HGzNCFNdd1cHgbRmJ
	c7cSSoISGnE4HDYC6XCzqBQIdiI8kssOVpPTn3ElJ3hTaCe25coS6Ikt3nLEiOJsUwxgOymhU4quR
	ClATwd/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL6um-0000000CgXB-0dQ3;
	Tue, 10 Dec 2024 20:33:04 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL6ti-0000000CgL3-3U91;
	Tue, 10 Dec 2024 20:31:59 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa659775dd5so46173766b.0;
        Tue, 10 Dec 2024 12:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733862717; x=1734467517; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WrfF3ihMgm7HLbBCTJxw/Qkq++9KZ890JxylLd2D9wI=;
        b=EJ2IS+8MEKa5pyI9NxSne7ORHyQAevtjvrxiOaB8/J/PmVkDO8N7hdanGheD3A4vVu
         Ddo9AF6c4YJMML+zXPlsZNyNwFfAUyoXsh6eTsmz9TzrQDpSRR2GAGHcBt2dCmJTS3NT
         5qmu5EqEB324haWuXgNje4t0rXnz8n9OnPdL8clZmFeg3zhySNDj0fTvlyaiTiPPNU8i
         kBxFcIyyjX/LXi9bQvRyp/YUi/AaWYwMQRGyUTgZR9IM8h6hHc5e7GD2udi6zvSHOhCn
         7tKnALq8GJgYTJ/RKdzaGtBzFTyO/gixXx5brrNTvN4lzHwvU5UKs7tBTp1D0fFpdDc1
         L8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733862717; x=1734467517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrfF3ihMgm7HLbBCTJxw/Qkq++9KZ890JxylLd2D9wI=;
        b=CJsBatffMOR3nZgsseaG+7ZqmSvg8StA4OX/n685VL20CqdIzwKTxDNVi+nDk4AF08
         fg4i4zUlDfLXgoplJxW1n0Pau/Hcqtb7kzyqARBi3K+hT5/10J1HsNZmOjtJY5ZWmCGC
         hACBbd75yCvcIJ/FugbjMZT+Aytdvl1Abf04R/YTz17HBIwRTjHQU0FogC8XvXAh/w4C
         KSU3dOgJ15/s3HRK3lIcV2G1VNLYVfdTMl73vU3XGJ22ZIYkslNfooi05Oeg3w/tVEzJ
         hoWrz6xcmWKgIQSHf3V00wLC8+gJOTxMN5Qtk2o23rHGNN18Vpq9jVEQ1qIrSK63irtG
         7mnA==
X-Forwarded-Encrypted: i=1; AJvYcCVOmVYT5EynmBbCMojByg1thEN3oAhH7fP8rBSavWd//3MTIkwkN4yu2FBrDWxg9BqSeBXOf27mYtSPvY0gavI=@lists.infradead.org, AJvYcCWw3BDqEsHNbLnB1OSkmlir4CnHUo0illGbM++VuPFhEKLBpaPTIWsGD9mT71ozYSakeKb2E+8mi4OzrPaz2PDO@lists.infradead.org
X-Gm-Message-State: AOJu0YzrgLl7orAIg4cuVkTnZy2UX9pkUT/bDAm1+WuEncsJRLlpjxPm
	7Po/CQaWSWVM0J9gjSaXbzyukwoHOdt2KZdqBP9AHzkkwpLuxHC9
X-Gm-Gg: ASbGncsA7wRw7mi2tjfL058vzf0wjx+ifkDnU8yKGXFou5y8gYt8sAjmGJab4O34S92
	ZDTUSOqMVxdpK/+RvW6aD8w7HyPtzUieMyWq2WYY/uS+Cfkq1NdnetEzoKhSE5x0Mdo79gYv4P1
	FOaELUwIK0EzSxwNg2k2bAos3VoN92CoAcVGc1ww/oUKRA+VVKd+mvhVagMQBUb3rDX5dkrdwim
	RUIcUCTpaqYLdnDduMhRGRsby0dLc6yUVco2C0T0Q==
X-Google-Smtp-Source: AGHT+IGLd9lb1MnTFb9FekQ5wROKKkUzu6IDM0uQo95hunfTcUvUs+mTTcbU+ECnXxVHJ4JQmDDN5A==
X-Received: by 2002:a17:907:a08a:b0:aa6:6792:8bce with SMTP id a640c23a62f3a-aa6b10ece1emr7547866b.3.1733862717125;
        Tue, 10 Dec 2024 12:31:57 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa671f14766sm489524966b.169.2024.12.10.12.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:31:56 -0800 (PST)
Date: Tue, 10 Dec 2024 22:31:48 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v9 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <20241210203148.2lw5zwldazmwr2rn@skbuf>
References: <20241205145142.29278-4-ansuelsmth@gmail.com>
 <20241205162759.pm3iz42bhdsvukfm@skbuf>
 <6751e023.5d0a0220.394b90.7bc9@mx.google.com>
 <6751e023.5d0a0220.394b90.7bc9@mx.google.com>
 <20241205180539.6t5iz2m3wjjwyxp3@skbuf>
 <6751f125.5d0a0220.255b79.7be0@mx.google.com>
 <20241205185037.g6cqejgad5jamj7r@skbuf>
 <675200c3.7b0a0220.236ac3.9edf@mx.google.com>
 <20241205235709.pa5shi7mh26cnjhn@skbuf>
 <67543b6f.df0a0220.3bd32.6d5d@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67543b6f.df0a0220.3bd32.6d5d@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_123158_869896_6A7BB85B 
X-CRM114-Status: GOOD (  12.19  )
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

On Sat, Dec 07, 2024 at 01:11:23PM +0100, Christian Marangi wrote:
> I finished testing and this works, I'm not using mdio-parent-bus tho as
> the mdio-mux driver seems overkill for the task and problematic for PAGE
> handling. (mdio-mux doesn't provide a way to give the current addr that
> is being accessed)

The use of mdio-parent-bus doesn't necessarily imply an mdio-mux. For
example, you'll also see it used in net/dsa/microchip,ksz.yaml.

You say this switch is also accessible over I2C. How are the internal
PHYs accessed in that case? Still over MDIO? If so, it would be nice to
have a unified scheme for both I2C-controlled switch and MDIO-controlled
switch, which is something that mdio-parent-bus would permit.

