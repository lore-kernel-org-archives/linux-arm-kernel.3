Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8236EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 20:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RN3ly0amkqfVWnS6oZWUFFDffiw/D/CaNP3X9CnZ4y0=; b=RD1MvWT5aGymQmJNqKJyJr+z5M
	QkNoyp9xFuza7X5OzNjsMIvRnqCspfbvkwqjYh3TC/W740WJhZwbNtCJn4fCWHiU8IzIzQNFZpCkE
	LeC4dac1NdcbBUMTnNQgmpdUx3ea8sS7g0809BnKhL6Pa7Alv3zEyJG6dOlbdxjdqmx/WgBBe/ZFA
	DA/6CMa+oB2ialFZ8iHq7Gl1iFMLOKLRY8dQ1n7jgLGjZTUCu4nb6QGKt5uZqh1357+1KChrWsXnc
	skPUGpfy8USHOhLkDjWHq6DAt9XaQQhWi+xG/bujhjEFDHpHN3SKWAa5+amOpN8hGVDLtSWx//rBO
	Ye7HE4XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weISO-0000000FQiX-0FWi;
	Mon, 29 Jun 2026 20:19:52 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weIS9-0000000FQcf-2Jpn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 20:19:38 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-84780c95e2eso954382b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 13:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782764376; x=1783369176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RN3ly0amkqfVWnS6oZWUFFDffiw/D/CaNP3X9CnZ4y0=;
        b=h6ZQ4Y6NbEXG1Dv7uF/xqUeXsLWrfwkG4YQ2c1hMRF4zD3ZR9GA5ss3ck1IMtedJQX
         jUd7u2ar39EG8Yj4AzrrDnJFVU4XN0Ft9uskAeUcpCczO3qHrQiRt8DuQWzUvLm0w8rP
         G5K2iMtVgVPRZFmbiGd60zC6W4bvZHCDn23ojWvhSTocI4KgTCF9YIeAyrGM7x5hcUDn
         3B0ERU2beUlnfzgofKbdfNadY72FUUOmJepJFUkecNFl5tiOQ8OZgL5nel0/utSvgRLy
         Rt3N7SpygLdJYcT8ui7SkZq9Dng8Rfe+LbmuHv/SSumQfyP1+DXGuAALLY2wbK3M2C4D
         r54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782764376; x=1783369176;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RN3ly0amkqfVWnS6oZWUFFDffiw/D/CaNP3X9CnZ4y0=;
        b=Nbsih6vivAqxTUAtLbUNC2YlbUdILdV8UDg6uL63ncjARenr7RkNhuOxYY/ldXETuR
         qfCoOzvgc/INvTPSNq60iE/sCY+AYW7LPHQ2P7X2sX9Sdk8AAJDGfpZXfW2volx4gWHB
         ZapySFLHbj9yxxm6NdvR1yDNX/okrlYftHm9LPRetaYOxy1rM0Zrxd5iOvN4JIVo4l4l
         qNS94UO7KkRKro4Ryy1+nq9L/uLsc6cM1HmdkCSuvNnxzZofU+R/4eazIF5T5VtW/sTl
         gjDJvXxCLrhlZO3kSPM4A0z+84MMGLaE5FoGl0uRk0t4eWSmPLv7pLFHczNrPYrLJV8H
         rJBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8X5dNz/k9BhLzXO11y8ufVFWmqWjgWe6EHwuORxvPS/k8eF96eLl1J6v8Dae2MKLCsn0ka0LSMeyIp9PkE8ImM@lists.infradead.org
X-Gm-Message-State: AOJu0YzIopWMzf88vXtlv7LR1arxvZJkbs1IpmPmLrYyaZKimzSwlCBb
	OiJ9H70JowAwzKQ71qr5ghegTMbhFtNpAx4vHY8fgJQXOwd3iS4/hUUmUKmRqeNAH0Y=
X-Gm-Gg: AfdE7cm/lV9WD8QjqKrqb4tub41vU98fvCgYpLY1McrUFxHg7pkax0Nv4yGVldTHoH4
	TYm5+lkyR3qTzSv8piqCuEvGW5+7N01UteN3H2Moit9XqwgfTs4xL0zVLFVSfZTtMdWzpyybFF4
	62w5Akbec7tGOmsWWiZ3Cq9hMJok8RB1+SMCervZk8+GXWgXLSo9P8QrOySgMeKo2bhcDqmgf6Y
	4Dd3Ocnc+ixxJg53e0MsO8utVU8TSkqFUzVvWj+fAwW2nhkUWQOJwzl/BSMJh9GTkNVP3wRK1a2
	IXKKar3yPeWP4EMYeUVNoehnY1GHqfviKeyzGuL/j03/62C74hbf0vV41X5k0ePi//KoA936Q9u
	N98o0CMEEYfXrwAsxG7Cqic4aVe2gIN6R/+lfnzCm+6iIpu4CnY0x3Oy7rxPiKyTcCOoLs8W8vn
	AihLKYXA6esw==
X-Received: by 2002:aa7:9314:0:b0:845:e105:1e6c with SMTP id d2e1a72fcca58-8479f2d0fc7mr588972b3a.62.1782764376433;
        Mon, 29 Jun 2026 13:19:36 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8479fff4c7csm330037b3a.16.2026.06.29.13.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:19:35 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Vidhu Sarwal <vidhu.linux@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
In-Reply-To: <20260626111720.56688-1-vidhu.linux@gmail.com>
References: <20260626111720.56688-1-vidhu.linux@gmail.com>
Subject: Re: [PATCH] ARM: dts: ti: Fix typos in comments
Message-Id: <178276437558.1055800.3079252935866099561.b4-ty@b4>
Date: Mon, 29 Jun 2026 13:19:35 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_131937_619059_4757E5EB 
X-CRM114-Status: UNSURE (   6.40  )
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


On Fri, 26 Jun 2026 16:47:20 +0530, Vidhu Sarwal wrote:
> Fix comment typos found with codespell across DaVinci and OMAP
> board files:
> 
>   limitaion   -> limitation
>   swithes     -> switches
>   converstion -> conversion
>   differnet   -> different
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: ti: Fix typos in comments
      commit: 21e741f3922c40305d9225c7a3b2557e5d926cd4

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


