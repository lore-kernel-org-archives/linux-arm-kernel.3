Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EBCD49228
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 14:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sKPU7OueWbmOZ0vLDtsCLawk5Pg/j927rqgWt1B9QqA=; b=ylP3IU1GnjOyDShpFnbkvViBgW
	R2sd72dAnk86sicpEGZya3lKoEiNm9lRrauPTpi6vpQ1R0q2jC1vHznyWppdTMeuxWl6w5gMJekz3
	Td6XWYJvt2rbtCbdv6y/O2KBmAQeQ5PPZaP9Ld9+VrpwvQdk6kg5pFZu/YcsGrSuZEbRtu8Dy7Zng
	F8M1nPrat7Jv0V08974UIjmDEChiGCJPm/LpGpHX3R9sAEtMB43XwkEinjKidi0ASqWqbgCtb44m/
	OwmcJAZj/GriHwV951PaMvkdAUERkRyNeWWyXq/o/Q/EJYTMOpcOmVEiaVxuggsk8PWyAFThYIQCI
	10xBtI2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD34k-00000009oer-34H7;
	Mon, 18 Nov 2024 14:50:02 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD33p-00000009oRt-1YeQ;
	Mon, 18 Nov 2024 14:49:06 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-382377822b9so254293f8f.3;
        Mon, 18 Nov 2024 06:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731941343; x=1732546143; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sKPU7OueWbmOZ0vLDtsCLawk5Pg/j927rqgWt1B9QqA=;
        b=QV6HdEqknIbv7kXjLaXhHecMuTIgyfQZUpgOgkOWs3qruIqczmNAcUEpIPnxpyBxVo
         TEjipeg6Mi+b9JLmpeldqepaRUFqxO2ajrHiOT8i23J9WEsp36m47Na4a+pG8YHSIues
         10ff70tT7wvI8ohrNBq4L37rBg0gGQqSvDBZOymwZEGibj52T4zIlFtFv7bbvLiZJQrk
         ZjZc4LdP/GrjrQlasxVLMFP4U4phyUHeGinr9xD17Hr48xGU4TaFr/ZtIUDvV29R/kt7
         I3wtBVMtOUb8CIAX+Nn6KxpAjOAxIQ/FVbKqZrdxphmCrMMFrsnOFjrvdran0+o84PV1
         Nxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731941343; x=1732546143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKPU7OueWbmOZ0vLDtsCLawk5Pg/j927rqgWt1B9QqA=;
        b=HR1dr1R/a46VnDYCii3UVKBKhrdCjyuJ/6l6Id7olyE+cbjGyjTSbQYn2ckwHKLAr0
         /Z+6Hj/6VeEOogM0vnTgWpQ35wNlii+X9N+yUPbcTy6B8tR/lwwpe/PfKkxD1ZZCXQ7x
         hCzeUqFfhWkocH6FjGhxuaVx8Nu9ZNkk/VSb6VnL+ZCWFb8vA/kNVuhoq9jsjjnjzhYG
         LeEk0L/M+gOH4NnQWJNwC0ewSqmroioPgGbgHbObA+WIHG3jlJr0s2kmPjMvz9ArpTo4
         XD5ccWYif6/5fSvJdG6enP0Ea1ll11TuktY/hXODg5RHLTGXyQU6omPBoSoqGymYaeSx
         ZsBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcyFQs62c6HjXTbb+CEWrGPMJbP07obfbgiHnJoSYhI+aBgwKNMFJr/qp/1HL5tog61nzBUObg+PDmEABvF24=@lists.infradead.org, AJvYcCXnG+bQvumF9BvfCavh1hRspyXNG2RW+uVvVvtVZpottoYjXLum4XCQCa6mfEvuSeDByTqZ8zTa+HVH5CR85p3c@lists.infradead.org
X-Gm-Message-State: AOJu0YwQYwbaZbGer21tB1EhFwisEx6j3esGBw0O/ZLYfsG0m6WLunSH
	ydngye6wI78apWWTqgQWzO4kvysdbRz7dzKdrzJs3eMZoYl2BnMe
X-Google-Smtp-Source: AGHT+IE012wnk28ETZsyQ8SITxH5vWI1jMJO1ED40DmOrjl3fn2iD7Eo7QE/jKPdNaugtPxI9JxYbg==
X-Received: by 2002:a5d:598f:0:b0:382:4378:464b with SMTP id ffacd0b85a97d-38243784b86mr1535185f8f.10.1731941343057;
        Mon, 18 Nov 2024 06:49:03 -0800 (PST)
Received: from skbuf ([188.25.135.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821adad619sm12908879f8f.27.2024.11.18.06.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 06:49:02 -0800 (PST)
Date: Mon, 18 Nov 2024 16:48:59 +0200
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
Subject: Re: [net-next PATCH v7 0/4] net: dsa: Add Airoha AN8855 support
Message-ID: <20241118144859.4hwgpxtql5fplcyt@skbuf>
References: <20241117132811.67804-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241117132811.67804-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_064905_405785_F5309EEA 
X-CRM114-Status: GOOD (  13.69  )
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

Hi Christian,

On Sun, Nov 17, 2024 at 02:27:55PM +0100, Christian Marangi wrote:
> This small series add the initial support for the Airoha AN8855 Switch.
> 
> It's a 5 port Gigabit Switch with SGMII/HSGMII upstream port.
> 
> This is starting to get in the wild and there are already some router
> having this switch chip.
> 
> It's conceptually similar to mediatek switch but register and bits
> are different. And there is that massive Hell that is the PCS
> configuration.
> Saddly for that part we have absolutely NO documentation currently.
> 
> There is this special thing where PHY needs to be calibrated with values
> from the switch efuse. (the thing have a whole cpu timer and MCU)

Have you run the scripts in tools/testing/selftests/drivers/net/dsa/?
Could you post the results?

