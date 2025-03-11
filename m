Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE50C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7YliLuH4qlV/MO/+JH2L4UcYmketDeTxX5I8TCDYu0=; b=If9SigU2HDgXCco6sPIS2AMG/Q
	m/4EzrHPzizeR2sjN/wvK7OistuFr/BZ/lhWT7OFuZwVOV2rOTspgMBfm46B4CxPZJvNMGwUif/7l
	lqP6X2VealwIm81dKQKW9/7NoE6qbI/Un698OV0eXkeLQu31qJJxPUnGvEoOzVU/LWK/O7todBzN/
	1RwudSjMqar3vAbzF+2tJ/0oK40MTtQwtUrFlSLfJNouJexAa7kQiFJgkxZ9AXSNQTMB/LaKtGEzv
	JzlYmSA5ubl1NbXan6J0X/LX4+QFrxaLjF6IH5g3kFIFXQzP5y9uT/6xI/zQjSUf9n3nO+lEvD+F8
	Tp8JFeXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4LN-00000006cnw-1kB6;
	Tue, 11 Mar 2025 18:28:45 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts432-00000006ZNm-1DB5;
	Tue, 11 Mar 2025 18:09:49 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so446622366b.1;
        Tue, 11 Mar 2025 11:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741716586; x=1742321386; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w7YliLuH4qlV/MO/+JH2L4UcYmketDeTxX5I8TCDYu0=;
        b=bbb8VFxTSv9TnzHe4YN4H4iIIglQEkSkx9sgXJeD2p96qAQxwuIv2UASJu4LnG+iwP
         BbqimsPhRVKvqSiBa5mvWWc8qEaw9cLtp27RKvyNxHQ/MhosZsOGhWQMSfUJMbRjuIbe
         P+JHnw6rB9wmSmtWQrQGS5tPQXzszE5v9R6DKN9KIat8j/9w/o/Ild4e5vce75K1jz+0
         2xzhWvp3zNirVEVfLsY9T6Qe0ioUGSkaWcZYkSO9HIjEg5yZz7LnAClO9oegLTZLF5PA
         1v78Kf5ry12kuGe+FmDcesF3fdGSHXDh+yhnByUUY7Aw9yC575t6wQEUI1Dd4FVkA4CL
         OF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741716586; x=1742321386;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7YliLuH4qlV/MO/+JH2L4UcYmketDeTxX5I8TCDYu0=;
        b=cm3bqb/FluaPZFHZh9cY9lqSDAI0OhiV+p2CyBlHSYoqor3o6/RMGiw5Rbg3leuzNV
         id355/OwIhOW/LmMSpqP/fF9JSTzM/wj35hkM1l2gHpN7lcYBLqHDQ7/xtrRjhWnx9/W
         hd4cfLUxxKAWkQ+v7chy4Z2jOhMpBe2LEU+9rmy/emDDzTDyLlxIH+7wlz+jYP0hUzYV
         7NmNqtTVbtPo1lJCmQZG/ZmYm4nH8Oq+iJDI1P8TBoJ0FKLNoxhZkdTMYSg9XMBsWX8L
         YAmYSZrVnHFs2XFvoXEV0A08xNXoGfTpk1+fHdQVeNqZC+QPGrZVOPMsuIcIzRlLel7s
         aOag==
X-Forwarded-Encrypted: i=1; AJvYcCUvhko5IgpLwuFwuMJ+bFzdygU0MEDHB4BvV7FNBw2yCNQT0jE9FFcsilyBeu8niMjMw3nZsGtefzbeIYzvKfhs@lists.infradead.org, AJvYcCVJ3oFQ9XADRv0E0PTFC4ofLd18Lv1Dvfkq4ixg+4qHpP35oiXPINzN40+X6xeXUC9fNCMKc5PhT15D@lists.infradead.org, AJvYcCWY6w7WTlsBMKYyjKHwKNZsFqTSehM4dM6yhvQ0qdS+PSGHqI+VdNS2phA4XGsu4sncXXKzoRELumsAnsv4RbI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmDTJLf0WIOaEKIy+No8pY1fLXxz9wzR5PmGqFXzJHCf0mIl37
	Ko2XtfPy8IyFGdQyjMcPasEEOujvZqObfUhvb8MKLXMH/wnaLcpV
X-Gm-Gg: ASbGncuTS7IFBpEcDSq9bEE2TFg5K1G8ewbupKmNSPjHAmvE+vX3CHCzpo/k63KTG4P
	Sq3OGbPH4Z1yxXI16XSVznvMQfDqKT8Xb7LNHbfUCDgRQ3UOtujPGv6140kP6JfgXj5gn/5FcRL
	ZorOwPy+nnGB2TEHgc8F1j2LsyO4bOXpc1As8sBMoLJAJpsdqOex7ocnUJL+gjy28UQuhOU6wnI
	j1VLVqxWLUYXR0TYst/QzAerxXdqUBXksitlO9ln1ZyKgjc92X9FwZ3GNzev6QPODiVTxipR9AM
	5pF4afslKVBCA4ZwLMXCP31X3/obwUqTihUALe/yyxeOiWRSnPTwo6y1qGuC68EG3mxgb5+n/d3
	eQfopWFNqgNBh+vvoSCN9xvc=
X-Google-Smtp-Source: AGHT+IFGoeMKh+SV9Aw9aLOSeklw6RYQlLlVxQgOHzKR34XV8RHNJXBdNm+Xa03GkQRMHVbvPeRAPw==
X-Received: by 2002:a17:906:180d:b0:ac2:5d24:1fcf with SMTP id a640c23a62f3a-ac25d2423fdmr1538965666b.26.1741716585443;
        Tue, 11 Mar 2025 11:09:45 -0700 (PDT)
Received: from Ansuel-XPS. (58.43.196.178.dynamic.cust.swisscom.net. [178.196.43.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2895e7e6asm511088166b.54.2025.03.11.11.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 11:09:44 -0700 (PDT)
Message-ID: <67d07c68.170a0220.3fa05.2c8e@mx.google.com>
X-Google-Original-Message-ID: <Z9B8Z2aA3MfCBBLG@Ansuel-XPS.>
Date: Tue, 11 Mar 2025 19:09:43 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Daniel Danzberger <dd@embedd.com>, Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Guo Ren <guoren@kernel.org>, Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>, Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH 10/13] phy: airoha: Add support for Airoha AN7581 USB PHY
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
 <20250309132959.19045-11-ansuelsmth@gmail.com>
 <Z9AhN9T8s1oogCUn@vaman>
 <Z9AhkByegWQgC9YE@vaman>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9AhkByegWQgC9YE@vaman>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_110948_325525_A231ABBA 
X-CRM114-Status: GOOD (  19.38  )
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

On Tue, Mar 11, 2025 at 12:42:08PM +0100, Vinod Koul wrote:
> On 11-03-25, 12:40, Vinod Koul wrote:
> > On 09-03-25, 14:29, Christian Marangi wrote:
> > > Add support for Airoha AN7581 USB PHY driver. AN7581 supports up to 2
> > > USB port with USB 2.0 mode always supported and USB 3.0 mode available
> > > only if the Serdes port is correctly configured for USB 3.0.
> > > 
> > > On xLate probe, the Serdes mode is validated and the driver return error
> > > if the Serdes mode doesn't reflect the expected mode. This is required
> > > as Serdes mode are controlled by the SCU SSR bits and can be either USB
> > > 3.0 mode or HSGMII or PCIe 2. In such case USB 3.0 won't work.
> > > 
> > > If the USB 3.0 mode is not supported, the modes needs to be also
> > > disabled in the xHCI node or the driver will report unsable clock and
> > > fail probe.
> 
> Also I dont see phy depends on rest. Please split this and post phy bits
> separately at least..

Well USB doesn't work without this driver so they are indirectly
dependent. Will split and address all the other comments.

> 
> -- 
> ~Vinod

-- 
	Ansuel

