Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB48CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 08:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V88tvOdPEuOMBu/jBdpAoznTcHpLTE0OfiQPkQyF8mc=; b=H/LN3BUnYO1g8fwgVQNhZ/k6T8
	kU1hUK0HUgXAH2Ks21EC/f50fxZIOiBJOhM0n53aN8QoOp4K7WaXpRQPUryA0ltwTwM1hDXUqXxQZ
	SV2bz7j5Gndqw+2huFqq2GX8uBuNyJUcXdfYqGv1VJPolZoNU/ITQGa+WKFKu0BEHwwrUlzIEUwLx
	CwSiE6DeQDVWUYgFwHM8+j5lVWk0nGPXRWKeLrpQLSi1lZ9+/mNZ+0OYKp8fitvod3XhvFBZB5mVu
	0Y2ozmtquCiOyvEpoljczsdkyqBnw2Ng86oEPfseSA0BK7x0c8aa0kMS9R9kRYq+MiRCXGZJr0j0M
	wL/ljy5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR3tf-0000000EfS9-2YGs;
	Sun, 24 May 2026 08:09:19 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR3tc-0000000EfRf-2sP1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 08:09:18 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso30535425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 01:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779610155; x=1780214955; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V88tvOdPEuOMBu/jBdpAoznTcHpLTE0OfiQPkQyF8mc=;
        b=qdmLZ5z74uqFW8buM4aKv5Yy8jumfkvLiy4C8NT9dQQ6L+QCK9u+RIf6bS2hs5UC4E
         8c1oafXAp9hJdXWZ1vd8FZMw9sSKed0IvzQts0sOOOE681ESxY0SHCqzAem8FIs5/2EM
         yvrGz4u2SiRv7VM76H2Gg/PHRwyRHp6aj4982Q/zSsxxc+elpzOIyVOmjJqYxGBhZPRI
         2i+kWIyDkTdsclC/IPsOV8y9M/B1yA7NF0SwHn1E1Fv7dStkBOF6NevL+VZmg8isawzd
         PW6VDujWW3w4wBCv+BwXvofenleRmSplV28o6wGJaFpyyvh2819dwiQfi/ibgGfT9eY6
         le2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779610155; x=1780214955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V88tvOdPEuOMBu/jBdpAoznTcHpLTE0OfiQPkQyF8mc=;
        b=m4N6P2A/diNTk805fZxHpZO8UUTaFUo7xj3VfJpl8nZCJy6jkyA2vXU5xc5LBEESXK
         AcBqpqqt0Mo8K87bDwJGYIvymY6TkyS+GRSEHIMIjm0CDj2y0HPlyCXm36Bk/GMLucd0
         ii9LPXZMsnvcsGERtmBjiwJRdVwOvYQn3DyBqLt0Rq7pVP7HqtHMOmto87/W6SkB1l7z
         CZ2mstd62YYrmeBC2WmpWnSROFt6EFQlPM8A1oWX2J58jyK94PT2/YmNB6kc8Uihll63
         RmXpSI6DHmvjilim+VeUaH+9gU/JbF8VRuLCUd48ODFBy29vCXlJuKenM2m+kLVehGoB
         E5rA==
X-Forwarded-Encrypted: i=1; AFNElJ9HI+ASny8Fbn3ShX0xeAZLCyzNPetaidrbomzYuB2wCjzp0iIg3E2WFa3Zhc8AzBimCoy6ZVIkpN8qHzG7tU51@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+4tmwPX+Dl6Y6QFdEtums5iFxjpOnXcB7eh8tuSII5Ujyjb0p
	ef+Ye9iEuvv8dUSyYsQTVmv6g7VVX56fymlkbwqePAY7xcnA7wJDA3W5
X-Gm-Gg: Acq92OEimvcDvuROT9bTQb86eRgbL95HOeoZqoHoAsa6ZviRdiWZE+nk8SdnMmeRhb2
	/fqEBkgeIQG/YvBV3oWonl9Z9QFWX01gbzIRlIHzmhQEeQ/SmPIpPNJSUPGaHb1NknlAduzCpNx
	WpkOm6cVTJoXhTexFJ3B9rcMrLdb5315dwPDZAFNKgGdHnyXPD7SMXv+XTGd+GIm2VlKedyoHJk
	RtC1QJLvaT8rPlIvrOxBJsvQh7A7uC//f9Xxv4zAXyou9hkSn/bfT+JClS9pc25YiXYhaBAF1Gk
	zSICvekelsBEBIdwEKRnQKTMN8JK6kCllWHeawBqTKhY2VGa/c0o35N++WT+HqdSUUXlEy60+EM
	oixnpGudpPsuLO6+T1HikkBz3xD0yV71gVJ29prC7D+UdF9gR/BP3cYqUtxc2HEnTTu4r7IKpKm
	H6KI0fUyvyLOyaCO5qR3MjZYORM+QGnd/0+YhQlLMIV7eQrx8laGggNmrU2aH9qnhu53Oe1Gkpr
	ohwtiZGJiApE4Um2X+2dKstU8Nu7ALhaSFlZDDfHx8BgQbewuDk9TqtGmoJNLfSH4hW5kayLaqs
	GEn/15leO04jWDkPcBuL4WEIOxO7
X-Received: by 2002:a05:600c:3512:b0:490:601f:d787 with SMTP id 5b1f17b1804b1-490601fd939mr17292075e9.6.1779610154351;
        Sun, 24 May 2026 01:09:14 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b3e0-e401-c487-9725-5e6f-67f3.310.pool.telefonica.de. [2a02:3100:b3e0:e401:c487:9725:5e6f:67f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454ac6a6sm168901005e9.12.2026.05.24.01.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 01:09:13 -0700 (PDT)
Date: Sun, 24 May 2026 10:09:11 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, 
	Abbott Liu <liuwenliang@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: io: avoid KASAN instrumentation of raw halfword I/O
Message-ID: <ahKt0Lp9Y8eJDMJ8@unknown748F3CBA5068>
References: <20260522212018.25295-1-kmehltretter@gmail.com>
 <CAD++jL=jrk4EYo+5mhp1cpy2cfsA966MVmbohWhcZdx_SObD_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD++jL=jrk4EYo+5mhp1cpy2cfsA966MVmbohWhcZdx_SObD_w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_010916_733267_D8B0B023 
X-CRM114-Status: UNSURE (   8.82  )
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

On Sun, May 24, 2026 at 12:11:36AM +0100, Linus Walleij wrote:
> Please put this patch into Russell's patch tracker.

Done: https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9474/1

Thanks,
Karl

