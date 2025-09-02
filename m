Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D83CCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+2RmtyC5BdrhVnYkf0pE1bp+20qsxwnCUP1SaL1uDE=; b=yiwhyJxBwqKC+ZrpKqwZYTeaGg
	LgwGmVslqaDZZvfPVFMH/U1MdiiKE7VWhfvHk8xAMAG7o4J97pYqkbJSMI7+8f/QgupZN0bH6+i9x
	mJcA/6ZUS6h4cn72DEfaaF4DbhmHmXQ+NQvUm97qhha1yE7h9k4MyJ+v7pj6q4bXZ5uEJ5h8Wqq1s
	6R4yvvP88l8WW1q7iO5d93pUqeBkCDhv3bgkP5rwTI9H539PetWrUvqKMaljrdfzi+5IYMI2Xcaa9
	WC7NM0Siqx/mSwjfUcaUEpQarlkJoj/+myzkDJjZ6GIjk4XTvORlxFahoSi9Sy1AIaPLTvhkkuIDZ
	jTnejKxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQBf-0000000HK1m-29xR;
	Tue, 02 Sep 2025 12:32:35 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utOJx-0000000GhBf-3QB2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 10:33:03 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b04260d72bfso32835866b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 03:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756809180; x=1757413980; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+2RmtyC5BdrhVnYkf0pE1bp+20qsxwnCUP1SaL1uDE=;
        b=TT31SyrW1YozhEfWphETsQdYqH7jh+iqZ+pb2yM4t/RrDxTlxKufstaWLH8lJ3pJfM
         I1BWSZMBk7QTiNgGJorPQxL8S10MTek/EsI2XaFBhO7onmu2uddKwDruj9KjFX7WwKcM
         8TnRo1enYmcNV1wW0wSOwrdAngZH2VL9RQuq4bDsKO6X7y8CGOmbJiWsIVvTyaiuxDTP
         O+RepRdk7PrgEICU+6xgf7UHPZsrwZt7wbVQks4vwzlfXAGAbFoIhoaEhYKIsoFCwpX7
         0Rc0a/NohUEoJ2xClZJ+ACoaf8c9YRJZ8v/R2KKxdY4OU0tju6ibqDssmOd3cdqIEb1R
         8xcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756809180; x=1757413980;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+2RmtyC5BdrhVnYkf0pE1bp+20qsxwnCUP1SaL1uDE=;
        b=Lg39BLaqE5AB8yGAHowAA3p1fnhGndU8Kx2Q93XJ4drFfYTCUeRgctAG4TN5F8lwxs
         0f/3QaEsYORsdL80zw7LbkDYEp4w4nz+uwIiqcQBf/+VKf2bv5oAtrrlW9A1KRWTI2kT
         lOeEdJjarSaKOcrbXQnmHdP/K5DtzolwEEDtZJc3i4X8PMUdsddE/ja9lxU2IeTKQy0p
         tVbzwTjMp0ofemuoqIcSitbCcfSH9DfhqpOEHLpqOK5w59it5kjWOiL5x1bbMDs9CduV
         bYUyIdyOf6DBymCnCQSta7eBI17c3sTzP3mdrJYY6AzxU1rp/5vfEzB1hjaDSD2zqMXZ
         MPFg==
X-Forwarded-Encrypted: i=1; AJvYcCXcz1aTBmiw6AT5M8yDUCS2dEoS6LZ+njrMgPRoias5u8cTiV/7xF/Wf5XL4qol5tl5i1Eo9E3nwZlp8zclaT4n@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7Olvx3cRIqmjhYqHYSm53/To1WdYhYvMxQX+VQ1BapDgjqHss
	5rLC3vhlD8AK3f3T+NP/ya62tpnEkvG+25ByqR80tY+yZsFsfNMxybIsi5yadWD/LAg=
X-Gm-Gg: ASbGncu6ziqWZhOEa6W09cT7SYe0Zyyo3o8Er0u5M3nXHAfZ6YJM+XBXORyZiv3/Fzh
	6AKgth1LNRrAkSdbOzfDja3jgtK2OrquhP5fxfmT2Pd/IjmnK/1Cew1iX4eiLeaq7+n90/Y9JUO
	3PeZAs4jSXYvI7uM0z38sEbFgEaDusz9Iv8WGo6Xg0I2gZhxG35AIdWWjv+DekSQY9oIlE1eVJF
	hKBuTcA2rq7SO4TbtIknIoSTMwVhPfzDoM/hqWWEcp6ITS3EX4gCX0Quq6r5zP4kD7jBvyy7iZu
	THp7Voxed7B/aHnjL4IHHfjXxCU1uFObVc1U87VQos9MK1QVDgIO0MaFye1kxJ6G99yUm2FRSGh
	3TFGH/UK1HSSKv7zPQN1DFfGibrqRcjHYFTVX2LV+k4lUcJLpLQ==
X-Google-Smtp-Source: AGHT+IHAsN/656NaYDyz43thubEPzcHhs+/jF4e7qFvC7WKngX9lMBJC+gCJOclV74lgolxYOi8bDw==
X-Received: by 2002:a17:906:690:b0:b04:1457:93 with SMTP id a640c23a62f3a-b04145702d1mr390858166b.3.1756809180009;
        Tue, 02 Sep 2025 03:33:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0423ed35e4sm516431766b.25.2025.09.02.03.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 03:32:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org
In-Reply-To: <20250830111657.126190-3-krzysztof.kozlowski@linaro.org>
References: <20250830111657.126190-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: samsung: Drop unused S3C24xx driver data
Message-Id: <175680917816.135692.16731223900572881206.b4-ty@linaro.org>
Date: Tue, 02 Sep 2025 12:32:58 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_033301_865663_DD5D78DB 
X-CRM114-Status: UNSURE (   8.46  )
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


On Sat, 30 Aug 2025 13:16:58 +0200, Krzysztof Kozlowski wrote:
> Drop unused declarations after S3C24xx SoC family removal in the commit
> 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support").
> 
> 

Applied, thanks!

[1/2] pinctrl: samsung: Drop unused S3C24xx driver data
      https://git.kernel.org/pinctrl/samsung/c/358253fa8179ab4217ac283b56adde0174186f87
[2/2] dt-bindings: pinctrl: samsung: Drop S3C2410
      https://git.kernel.org/pinctrl/samsung/c/d37db94b078197ec4be1cadebbfd7bf144e3c5e4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


