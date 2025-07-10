Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F516C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 11:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4St8wiEewtafjCLkv95/UHopApTTK01r7uNxNA3DcqM=; b=mlnpTX8FZ0/Dpx/aJe3Ax1fxLS
	wgoz/g4wJU/lzzxuimwGq84olXDOw8kQGl0LV7q1nDP7cFGVNso4vjMFZblC7HGvzD8m9QtDFFrpC
	eFGuVgD4ox3gl3XLYHsNFj6yXqk5M8AvGWSxGLqSdvAjuJtaVa1oQvojm8KY5c5lIVikvvVz7gjhQ
	6DyVo4A+xZt+6s0aoDD8SCwEiNQf3RsLdhhGksbSVO8YoLGx/+4ZO6L7EF4HDABYV4tLUhKMk2eb4
	ZCukqNowuhjxb4EFOTNUhZ1XgK833zDkaiwbrw6D/ADlnfFPsEmgwTvCOoj32xjbd1XVZRXArHIFC
	gOabaR0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpve-0000000BhKu-07w6;
	Thu, 10 Jul 2025 11:59:06 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmy2-0000000BESz-0Rsi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 08:49:23 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-74b56b1d301so475809b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 01:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752137361; x=1752742161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4St8wiEewtafjCLkv95/UHopApTTK01r7uNxNA3DcqM=;
        b=XZKXzLe0sx53Dr7TbUHbN7J6/2OisFBhNfoVV68S1v4C6kIJR2tglywTgY7AyM/9bG
         j/zHaCySguihW2+G4jMzs/qW2PPnnNu1B38gLTQFaESYO5Cl/aBiCP0CZ+D1kU0WYgpN
         +LJvxDWx7Z4kQewbkRu7+HURiEc5JAJgvvBdh5N/ru+sYAfPPwtbx/vG6ms+Ni9vPJXo
         U1C0z/il/ThIWLgvVtUfFbjusuO2lExMH78TN9co0vqH0VGpqO+3cFyjQmou86X/srKv
         omiM8NbuADSne7KWou5DoyzTA/ZjlFaJjXxh/gwf3xQI0+S0urpdA9VZmhgrWWmeunQr
         a90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752137361; x=1752742161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4St8wiEewtafjCLkv95/UHopApTTK01r7uNxNA3DcqM=;
        b=btu6yzN3thFtj8HlZKKWiXdKxH2tEdLnaLaMW3fkSPL2d9sUWiASlI1z4bhANVz9Is
         XRSXUCiA9E1xyXMkiiAcmCrA0jPA3pcXMsyGJhHaV2THK6Du8YO36/vgHt9KrmFQpsLl
         gVeb8CbYw28vf+nXeraU75Jwkanf8GJUblRaBi6QP8EInK5raLBN/x60E//yviGVfC5D
         qtS5a7dXl7tAUuwZQGLP9JA2meNPuPH3BlB1nI5NNifWloY9VutPmFN+gD8Gon8gb/FQ
         D0SPpwLVxKBPXiQ0dbaahXQ6unu3NGWqDKd6cx/oeFtXGghGP3Z0EXh7qKxOxTYkDGQL
         vxEA==
X-Forwarded-Encrypted: i=1; AJvYcCVBRZFdKlBylt2ARGVwq6K0LDi+df6+q23uWxi2CFGNoZ9mB8KM7Q6OcYvb38Hw220hEjBOWHW+wdrUCQhLoHTW@lists.infradead.org
X-Gm-Message-State: AOJu0YzCCpmpNnFv/Qh97AIIoO+iXkR6DKLgL8c4kQHkUT+/c3YpVb6K
	RxZJSUu7IHT6kdByKdVXkeu2yCYgbFwC+flBFXhLEDUokuyeqH7ww20D
X-Gm-Gg: ASbGncszmMmQqUau6LI0SZa/00ik1G293NwTP6rPLpwDSa9I2RFfLDNYOukomqiPD80
	s/pqYl9B/+mjUBCAZRTaasb3ZKDh3eTqHP9Drn6w/KeBYee/c+TVmlj0+7WUS2+pHCtParP3w4s
	FcUyNkT38adrXPRej3y+WZEvCjn3UeK+nPOFHuRVH2+IF/T4J7T615BzIfgG1uAEgmueR1MG6t8
	OAp2xRsp74XDvDvwoUKr81j8/y4LvlfQFPg5hBmQwWYhJPc5g8bwTkhJx6LfRjV58by+GlP1oPl
	315ZnMYey3NODy0rShSny0+rJmy3wE0xmqVNKym6j083GvpfvKRHoUnIb0qohUNMNQ==
X-Google-Smtp-Source: AGHT+IELxBQvDmErAxf05p3FN8Jsp7n2KmWHwWb1Vm+hx7+9OCcdDHRpDaIZ2atC1291CnmVaO0fJw==
X-Received: by 2002:a05:6a20:2584:b0:215:f6ab:cf77 with SMTP id adf61e73a8af0-23005ab1ee6mr3246701637.23.1752137360945;
        Thu, 10 Jul 2025 01:49:20 -0700 (PDT)
Received: from ubu24.. ([2400:2410:dfca:c200:b9a1:a95c:e866:f34b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6c77basm1544702a12.40.2025.07.10.01.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 01:49:20 -0700 (PDT)
From: Taishi Shimizu <s.taishi14142@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Taishi Shimizu <s.taishi14142@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Rafal Milecki <zajec5@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH 2/2] ARM: dts: BCM5301X: Add support for Buffalo WXR-1750DHP
Date: Thu, 10 Jul 2025 17:49:08 +0900
Message-ID: <20250710084910.2093426-1-s.taishi14142@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708-elite-indigo-wombat-faa74f@krzk-bin>
References: <20250625154315.114139-1-s.taishi14142@gmail.com> <20250625154315.114139-2-s.taishi14142@gmail.com> <20250708-elite-indigo-wombat-faa74f@krzk-bin>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_014922_144429_B114E7F4 
X-CRM114-Status: GOOD (  13.03  )
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

On Tue, Jul 8, 2025 at 10:34 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Thu, Jun 26, 2025 at 12:43:15AM +0900, Taishi Shimizu wrote:
> > +	chosen {
> > +		bootargs = "console=ttyS0,115200";
>
> Please use stdout path property.

Thanks for the review. Since `stdout-path` is already defined in
`bcm4708.dtsi`, I removed the `chosen` node from the board DTS.

> +		leds {
> +			compatible = "gpio-leds";
> +
> > +		led-power0 {
> > +			label = "bcm53xx:white:power";
>
> You should use rather color and function properties.

I replaced all `label` properties in the LED definitions with `color` and
`function` properties as appropriate.

I'll send v2 accordingly. Thanks!

Best regards,  
Taishi Shimizu

