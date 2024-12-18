Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC0AE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mDeikeFSe+F1f6WRvocmJwWKAt2yrKKW2tQ+SDhd5c=; b=ymnP9WM/oFkmxQy2cmRQcWEeBU
	DxSR7QEGTyOiv0YBWWvsiwRcTbzVZ3JmlIPqicI/OzTUspGP8CMWTzL0r2uBDptrZ096s0lJZpFpl
	GzXwPWQUys9jVA91J1/oc/0DelJ754R5pcjiISYrRLpunAIEj90NaXvngSdzbXwjtvDvsOz8Dmrpx
	9zPn2d/9Nmqg7vsfUH7W7SGIxys9Mrpl9WZ1X4QzeCL0HIEFbO/ytG0WAgGggcf3wH6dsjv2V45mz
	G7aEizM6AFifd7PjScYlMKcvG+YMynkTDQjmA7aruNycYUma5tntQHvg39p7oly8GLjuLblfBBsdx
	swo26qSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvhP-0000000GxsJ-2cr4;
	Wed, 18 Dec 2024 15:10:55 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvg5-0000000GxXE-3cst
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:09:34 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-218c8aca5f1so25865455ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 07:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734534572; x=1735139372; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6mDeikeFSe+F1f6WRvocmJwWKAt2yrKKW2tQ+SDhd5c=;
        b=bpvw31+fphlf3ok67oSzM7jBcUwOZL48MA0aIy5VirqI2O/ClFbWKep/KtxXt5uWq4
         NkqczG+xlttiQ93/PixGI/H9D0dnvedlS3iU54a33pwXuu0BLgKuP6Y75qygxtaQpA6f
         WmpbW5U4UiPx+wOipzsMaAMlHC4xVG5ETpD9cHgBrc/G4yLT5cG75zndUS1jxaaRjZGU
         wEJYiAiy2Q73tc2eRfbxxdVhTD6bhEW6OfW3VUkdZT938r+4jCbvBoAYeH7Xk2612A2Q
         lpl/pS/hWdE8Jeo9YLjbSRgEOU9vsUy1CrbOGueuvP/yKK8hhQ30q37PGA0hEBvRz6Z5
         lt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734534572; x=1735139372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mDeikeFSe+F1f6WRvocmJwWKAt2yrKKW2tQ+SDhd5c=;
        b=XoJLy9r6bPDIyIlweQon0tdGpkq+t+QtTwG/uwSsCuaaSG/iJD7xfZ93eF0QRdYW9k
         3eeSS36AbMRZv1k8SYVBcMo2P/Rj5/iu+JoC0ViY+Okg6IK5zz+P9rEQYN0xaCqILOgh
         qPQsDm6exC2fdS+NY/7dXgerRLeHkgJTNfNxuqNJwFzNuqkSUE8KbjTNP29jKv85C6Jp
         j9jSuPTYCYZakiBnCZtBzZDlu2AT9UctXIF3w+TYLzjs4LG1l0MiYgbzYYI90S9zIkRh
         mD0q2xMqOyuGDLwVwHH8Xy2PxI1YH8mU8+I3FyjdbgCArMd3Pho/shVDfTbC1em4Icuv
         t+Mg==
X-Forwarded-Encrypted: i=1; AJvYcCW9s1+97A+gYYn89mmot9DXEkNas4nX2arPJuIa/7B0bDqI1KKGVz0kxbKSo2zQW4GsQUTCyOztZ/anoU9enzZE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9q8r7hFrO7DZw6CVOAmTGfaTWK4rN9Sz7J4lF2PLJJku1nLzF
	GdgVh00BIoEqdCVVWx2wKJ6Oxu0g8HPDDLEfCMENri2ZeZCYOEr3
X-Gm-Gg: ASbGnctJkj0XlpPtlriCZN/88RO6ESKKWs1Edp5v4L21Ks/tuXni3m0piFIsmYztQdL
	BjLrK242EllLuNyQ8uStDus+SIDGmN0sV5xLmAx4CV83ooErpbSkWzhFJNBzz3Z9sifpUKEEpPM
	uqtRwvtzpfDfkNtvX4idfunHXNnZHjWxT89Bj8cczDUMXNgXjb/F4mYOGOnzanC2NfAchsArZ+k
	fASS8EJaoVttIBkU7owNtxCypIjFbPppf0vBXkzMJJjeMy1sAHnd0eytyRvsGPdQiLMRA==
X-Google-Smtp-Source: AGHT+IEewReQwgk+5Ua6YOOIYy2d2/wQCgEBDZk3bKIj2d8jpP3GFkNNyFGtuZW0MM3ArXC6dPDOAw==
X-Received: by 2002:a17:902:f68e:b0:216:4b5a:998b with SMTP id d9443c01a7336-218d7252a1cmr34156515ad.45.1734534572373;
        Wed, 18 Dec 2024 07:09:32 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e728a8sm75452185ad.280.2024.12.18.07.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 07:09:31 -0800 (PST)
Date: Wed, 18 Dec 2024 07:09:30 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	eajames@linux.ibm.com, jdelvare@suse.com, corbet@lwn.net,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	Delphine_CC_Chiu@wiwynn.com, broonie@kernel.org,
	peteryin.openbmc@gmail.com, noahwang.wang@outlook.com,
	naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com,
	patrick.rudolph@9elements.com, gregkh@linuxfoundation.org,
	peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 1/4] hwmon: (pmbus/core) Add PMBUS_REVISION in debugfs
Message-ID: <89ff7229-2e86-4d36-9349-50af109b0085@roeck-us.net>
References: <20241217173537.192331-1-ninad@linux.ibm.com>
 <20241217173537.192331-2-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217173537.192331-2-ninad@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_070933_899256_02D2CED4 
X-CRM114-Status: GOOD (  10.74  )
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

On Tue, Dec 17, 2024 at 11:35:32AM -0600, Ninad Palsule wrote:
> Add debugfs file for the PMBUS_REVISION command. This command provides
> information about PMBus protocol revision number.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>

I already applied this patch, so there is no need to re-send it.
If it turns out to have a bug, please send an update on top of it.

Thanks,
Guenter

