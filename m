Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C650BE77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CL3RW1M+1jqdpfrkKxaJcNdqzAjdBj4zOd/4LxQYQ28=; b=FjZgyELWwX2KGQ+yg3C7qACSpC
	P50egj9MB/sERPIGTO6f4bQykLHHW/QpU6R4ALoIoj/EFUEWWjGyIwVuEizXxaU/iZltuBpXipoWx
	Fw/CDFiy1Y06wMdhDVxukW2G5D+JyuZfc/Cex4R7N0adXY2+sRYC6U4JjlzOw5Ie8w8NZRH919p6j
	gan4Pt/FKNewA/cn/FM61TZyarj47p8ks3ZDAXOi2vviK9ZCYcOqU5wlze8OIYsvJuoUlbcYXP1Az
	+R7k6/GC7Bx8czU3ei9oF+GNEF27YWQrP9D64yzinNXmWlI4b9RyZpQLgYKvtj/QrQz8NQrFR39Be
	KfTgfe+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKK7E-00000005Y0N-375d;
	Sun, 08 Dec 2024 16:26:40 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKK5v-00000005XoE-1xZc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 16:25:20 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5d122cf8e52so5666921a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 08:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733675118; x=1734279918; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CL3RW1M+1jqdpfrkKxaJcNdqzAjdBj4zOd/4LxQYQ28=;
        b=gVLiBy+keP2QxFbL3bJvBJpUqS+cawMxlXKhTCJKSQEGOpIIVjJzIECfZ4vjGqnIqi
         0jqcEe+kCOzhba2lwznSs+1XrQhm6xadFTdg/LXnPXlcSM2JmdwJrpQCsONPZripnkLc
         52SptdI/LbiEs6xxL3jAdp1VeOpDGkt/3zNUFwS6uI2DXd7iduvdgNsv62DlK60U9Em1
         4VnOjEeDddj6hfVY/1T1wNFKpRp+HNMwQYNM47d/Kgtc66GXrWvr6OW3pZt0SYWn3wsp
         TxG5uDO4wjlLCkCm840ejhbPvbYJoE7MH2ZAOVwH2IIkHIU6drqK+XUhve9decPrqjZj
         8m0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675118; x=1734279918;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CL3RW1M+1jqdpfrkKxaJcNdqzAjdBj4zOd/4LxQYQ28=;
        b=sd1UzZY2Dc8cIPayzhP1JaipKcBZKMkibDY+iWEspG35sKIGjhAxPBiqPFaC6x6VgN
         MQE59BrZpI3HPdQenMXCDpgQ2FhLu8+RrgPDP4D03haj5xJc8zml7yV+pLP5o8xsMheZ
         1/4NBC9A4waYYjQVC13XMlnUa8ka6UMFnrGeck513Vc12aPYcZc/INtWZTRR1lP7Dqzk
         CjatLN9glwGw+8nhnTNhBfJHssKmAtKTy8NCqXxhTegXTzq6zn2cjwfPobKw7VZanYqv
         ZZLlqxCC+2k/ncwgw+w6glexMCqpSxZaYg+aPl41vv05KcDqM1+ej+Ssj69+KiAtrWb9
         RTiQ==
X-Forwarded-Encrypted: i=1; AJvYcCULv1pnuGj5M3dFK+66dQ4lTEUGs+KY6S3VaF9G7OJWGGbjoHzztnUkKo+WbPZfTFnIk7d4hv9t2mqKI0krdp/2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz13gW9P4+YfwuPfdCEe7jewErOvYK/8ucJQZdOu8t68nabfeHN
	VcRnH3uKZfUFGykjScFkmiJdg9uQg8g1MYocu9tL4sVm2piVWe6t633WhQxNMFc=
X-Gm-Gg: ASbGncuh3ZVVBp7XTM/ByF3ixL9qTJWORor0nE+FAEwW9OV85euzuKulPbu4BKLLpG0
	62zow3MAvVB52UhWHc88J5fgZ8kGg5CnW5rLYZ1W0ymH18TxuvY9fu3hPg28zDgQxOFAstD/9S6
	T6UP5ULgOmXId1m61+wGk9/1wXwX5G1g/YLsIKvEOaSL7Nbp3qib5sJS9Yjr7xJ4sUPxqD6ZeDS
	kh0vZVReKpq3sBbgQ1xy/q4flkBFlENOrrYWKpb2b/eB5g048J0zz2esBE=
X-Google-Smtp-Source: AGHT+IGJWEQkcn9gVXm4gaCzJ3nLfFkBCixjRRK2yzf+GnrblXYRmSu5ZvLGFdA9zVJtqFoG2CIf5A==
X-Received: by 2002:a05:6402:43c9:b0:5d0:cfad:f6c with SMTP id 4fb4d7f45d1cf-5d3be75abbemr10808689a12.21.1733675117744;
        Sun, 08 Dec 2024 08:25:17 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a49e48sm4883698a12.30.2024.12.08.08.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:25:16 -0800 (PST)
Message-ID: <91b98edc-4313-45a8-9bfc-7df83b3d5640@tuxon.dev>
Date: Sun, 8 Dec 2024 18:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/13] dt-bindings: clocks: atmel,at91sam9x5-sckc: add
 sama7d65
Content-Language: en-US
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <b7a8a22a571f6fc2be56a25f26757f37fa8d2bb3.1733505542.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <b7a8a22a571f6fc2be56a25f26757f37fa8d2bb3.1733505542.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_082519_513058_D7AEBCAD 
X-CRM114-Status: UNSURE (   5.13  )
X-CRM114-Notice: Please train this message.
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



On 06.12.2024 21:59, Ryan.Wanner@microchip.com wrote:
> From: Dharma Balasubiramani <dharma.b@microchip.com>
> 
> Add bindings for SAMA7D65's slow clock controller.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

