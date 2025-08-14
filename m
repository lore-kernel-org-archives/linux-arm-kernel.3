Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B08CA0EE3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 08:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+i7bCdgaRO4PJGywSV9WTbQBb+KITW5yzAKza8+ctg=; b=OqqHnJ5R9zOkrg2bDCLCmt4YJM
	I9SRR02LuJY0k1SeWWJH0bgFCkCiIuoVzsyoR7mcwHmjyxHG5PmRwqj5syM7tmwSg0I0cUPDgNllC
	XvuOZioGC48Yz7t0wXSsWhpMSkZpkHmxXkyhUJu8unIj1bf4kGUgsp5zmCa1SreTE4pYYujV6f4p2
	8uqJpSleo2Ll3jTBbjMl3BNe5Kn3qaKLUoDJ7CO9yNH91U8od7ohZKCbI/1Z4JmJHc57H76mBKlG6
	dU7aTS0mhzc0ZJcq8LcvZCVPh1mKjrO/Sm/7itxsQJlInkTELjxvSi78ylyqq8cNU3kMp9nSIRaTk
	WSMNEKlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTII-0000000GEjq-2PZH;
	Thu, 14 Aug 2025 08:26:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSrv-0000000GAvJ-0fwf
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Aug 2025 07:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=h+i7bCdgaRO4PJGywSV9WTbQBb+KITW5yzAKza8+ctg=; b=LgY297e2LcuPq6hYAUXniJLTVU
	gvJ4/AkcBLOQqMgTCM7K3WF6OjS/wHE72xnmxqU3M3OiOgVJRfK6Vk+0Sug6dWz3geJ7U4J45FE8n
	gWDazcT7wIzLITwAd91T9k9tOPfKbKISaZ9UYE+CSmFvG7fERSrVYzt/Y30/AkIPM5qp0lIEwd/Q1
	fIBmHxqnYq0NQ29504sx3oFspi2xG6izkR0ZJU2AAUH2+03G74YhB6L8zg6QtD9/qcKSnF3iAsWCX
	Q0RADpjqGBEKERrf95DXBhQVFwLSpXLEWbi0mxkf29aLusPighUZuL6I2NjZKpt4two4JGBgzRr7V
	PJvLTb5w==;
Received: from mail-ua1-f54.google.com ([209.85.222.54])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSrq-0000000GIqQ-1o3z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 07:59:25 +0000
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-890190b1aabso386395241.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 00:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755158357; x=1755763157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+i7bCdgaRO4PJGywSV9WTbQBb+KITW5yzAKza8+ctg=;
        b=SHaICwLl/rLG+cVpiE3mp7whViHxKLihQv5BI8Xaj0GZuiIJT54TI6sCb37ChEV/hf
         C5M5/4t8IxUHuduKdtcRGqY7II70mZ51O/HY/x59IbRjqYv78tFZmGo0F31lrlc6b/fX
         u4P8vkOFq5tsMFN0sV1KbtCasDBajM5qxvTAsNLvEL5Dh7FxFJZYOF4mEuRke095DsLt
         F47ufSr5jb/1okp+9KXXmq3gt4pHtFuAfHGrFtmlXTBmdKbvM71PVSAc8EuCN/oXGsIY
         uSv3UICavcHI2bHDsZAfIFmrhjG8MWxsIvx+7U1PFhF5pS21ofDey0s22e+hbwQmwoLc
         ufpw==
X-Forwarded-Encrypted: i=1; AJvYcCXRXLOhyyoElOJVfPxFYY5RlCUNXMqOaGXj9Zbf99I49r2qcWiqgDdGVs/n/W1w3x6gdn8q4PCDDRp+HgRPPGgB@lists.infradead.org
X-Gm-Message-State: AOJu0YwKwMEOLCknYlTQgVGivcc9bRy9k3J1cdBiZkKMnu+pWY9BSTJx
	6AuiI/DE5hwWGDFkOm2YMrEO/li6vs/nmIzcIWRJ9VdjU7p/EZVAKJ3WwCZnutnn
X-Gm-Gg: ASbGncsTmUUpUw5uH6TPblK7/5lglkL8VxC+vTR4XXV16UplPJ7hYe6yleQpxUcY6eI
	eArD5g8nOJrZtdUfqL06+CCTnVUGfTLzNmP1UQKwzab0wqdUOpS+AUSQjLM6m3xK9Jgb5R6GqpG
	l4irWHckQGfvh1cs0r8z7D+ymW3OGDJAyto9r4Ir2aX9l2/AKeeBe7mhob/hrrZJkGonay1l0Vv
	DXFxqU50CCnFG8qfVpjC03ya2k4NkziD1umfhztDVOOm52jFjVXQ/B06g0My9dpTIiSYmITV2Rz
	FbhlAqRenZBb/FL2c5c7YVYEGYRbqDPxX9H3Fq9rIM7W6VwmuA73ZO971kLFeupS70MIIj14b4W
	p0dFdV5JXTCNd5mmU2aMuaSE6O3Ro4xCfNvDWRoQYG88xhftycX60Apl8+s7q
X-Google-Smtp-Source: AGHT+IEu7BhtDWErY11Z/3I3vcVG7CkFYG/cdkyYi0mqiEpYTL7uxYdiH0KszEsFDxOQCPUYIp1PUA==
X-Received: by 2002:a05:6102:54a6:b0:4df:4a04:8d5e with SMTP id ada2fe7eead31-50fdf8e5078mr693742137.8.1755158357525;
        Thu, 14 Aug 2025 00:59:17 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88e029cd63dsm3006982241.22.2025.08.14.00.59.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 00:59:17 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-50f85c8a9f8so299050137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 00:59:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6/eGFaiwNEgQHgtqd+A7xYG91kasM+OUQ5sFnFa0aNb2Im2sq+bIBs6OBu7yyVK7u7tsUqAVNXEXvG4QW5UPh@lists.infradead.org
X-Received: by 2002:a05:6102:4192:b0:4f3:1731:8c01 with SMTP id
 ada2fe7eead31-50fe9f8ba91mr647723137.19.1755158357000; Thu, 14 Aug 2025
 00:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250812104154.42289-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250812104154.42289-2-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 09:59:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXz60tBNh3DemVOmdYA9YT+aLGfKR-AGp7OT72gGkNOnQ@mail.gmail.com>
X-Gm-Features: Ac12FXyFisZ5qsOIsDXr4nfrcLgkkLJm5dx-Z9otnKfuIczkkZJm2xxpNDB0tU8
Message-ID: <CAMuHMdXz60tBNh3DemVOmdYA9YT+aLGfKR-AGp7OT72gGkNOnQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation/process: maintainer-soc: Use "DTS" instead
 of "devicetree"
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_085922_576953_56F79ED3 
X-CRM114-Status: GOOD (  18.98  )
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

On Thu, 14 Aug 2025 at 00:55, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Devicetree is a data structure and it is a bit generic term, because
> some treat Devicetree bindings as Devicetree.  What the SoC maintainers
> profile is mentioning in ABI stability are the Devicetree sources, so
> DTS files.  It is also more common during reviews to refer to these as
> per "DTS" instead "devicetree".
>
> Clarify that by using "DTS" name in few more places.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

