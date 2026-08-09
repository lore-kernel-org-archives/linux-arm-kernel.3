Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB05FC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 15:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/WGUkXoZP+UEyJ866t/Krhk68GDNZkyepthpjmm2Cs=; b=QHTDthFNUQ6AW6fIJiWfQgt6aF
	KIf2EyqZUyxn6Yzm+KDWy9ikLfmwaF5X3IgxN1Zgz8cRWyRvmC3zEgTD+lGi9pWdt0wRVqg1FIwe2
	W4jdmCdBEP8aImhRp3bWTGMCpGJLMxs2ORR/ufVPNCVyOVfUHDd4YTnSQAW9jJfOIZTYrjMzgdxmH
	eZzMRk8XO/+sAstj+gVxVDoa/IO58wJwgWdwhEbgXoYw/LHzRmT4KgVZ3oNjOCTE41HU7xEKjUrsT
	ivXah327Sf2Q41dVfCF88HID5B2jna9ZxZHJFesp9xmOMZp/X2T6NNEF3IYYEJ4kVeBRsZbfBzrFU
	rT2GupQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt541-0000000AQAv-3aem;
	Sun, 09 Aug 2026 15:03:49 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt540-0000000AQA3-0Z4i
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 15:03:49 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so892005a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 08:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786287827; x=1786892627; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E/WGUkXoZP+UEyJ866t/Krhk68GDNZkyepthpjmm2Cs=;
        b=sB2nJb/g1TZF9G/CzUWq4a9S9LJIqfRF5mjoEj1aepefCMIWcCYjg3PVmc6MIeG6K9
         SnJ2yyuBlw+hu5qIzd6T++xhkngU0D+3GrbvLOkai8hm0A6a8QXpxnhxX7YSrUp4HC9/
         KFvkXb4SmsoyPC0TYd9ZLNd5+aIcNkPPN1juz5nWCaQxv2JcYO7qkw/0iL/ItsIM/Nyh
         L5eickqjBmCYSS6c7T5CG4xVy11/BY7I51Ypn9asyaHUyqdvGLYNMDJRqQaCX8a2Rwiu
         6Yao9nGlReu5TBr1MXXAD+J5hNw0Dm3LuIv0OWmh7xyCxgHyk34SeG34yzaZkRJkLRHQ
         GYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786287827; x=1786892627;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E/WGUkXoZP+UEyJ866t/Krhk68GDNZkyepthpjmm2Cs=;
        b=aK6SHYDDuqWGQjI2cCJu1l2mOStgb4uYNvM8RAOFz+SGe1TzeZGbYEOseQ6yxXFPun
         06BQ6WML35G0JdZ9zF5EXzr8YDqWiZgkFRGY7A0Xj4AxZ/3r64Ma0xXdMtAHKlArXivE
         FsqbwAaCJ3Bm2lIz7y2xBWXYZ7UCgQuasLN8Pz2DNw3l0G5qdyr3TFVy64AUHR02BaYZ
         +VYdo7wEMN09iFdHvLkPCvOh3MZFbk0Iml05AGZGdT4I149pIHAHjxcy8cuvqfhYrIzc
         7Gt/h1fIyjSHZiPE9EL3z4hy5lsJuTuMv+tqDsVDtY8BVNXcvBU0pGhrPzQYL7CXI2Zu
         29qg==
X-Forwarded-Encrypted: i=1; AHgh+RplR+wRap2FQzFf3jEg7vg87CED8T6KZTkSSRpYteEXJfEJZbeQdqXfuAbhEhqUAa8RCNYElTPFnDq3TqlGNcRU@lists.infradead.org
X-Gm-Message-State: AOJu0YxI5UMzGOrJWQwa2/15fhyw14sFi1NSNK9GyQXX769jrtOQOR3g
	OOpT19oHXDT5MAeDiJkyambx1HwYVqmUAnycXpfLA+5uHrBjTa9AYhAr
X-Gm-Gg: AR+sD103Jvhrs32YFUtbQUD96DZ3reShwSzIjMTbJz8zJARRihvqwEXk2GOb9MmQWPT
	Cp8PF+Hy7L47I9DDsPEQBp8LqHcMEB9lY4pZkbRQENmPLw5GkDlCO2y7oze3RLIYoRxDCTnRjk4
	yoyuFF+TJ2EumHwqAPCzAPcsfNUMgdwuo+yxSHpZnlGcYdEW4JU53PcSWUv1GP1v0xL1Beg0y4i
	R7Zx8AWqbBZew54iipom2BUAuasQVsqhKLgvYTkV6oFxaPMAiA8vc8hPzTIBEvipT7GSpmv5WZB
	BaSC1yx5qq19qccMrcOM2oxhE1qkTqQ1jziLOhMFVo2mZiwEHqtpBmvzF7VTGjemxY2NUl75lfH
	1+/y2KBreSbfxFqc9FW1joUFFWG6Liiabeavb8dZBdpaN+d7aFXCExrp6ZhF41QbnXSwJab7isv
	A4Ziao0K2nQKgpVjvMYkcKw6PJojN417PCoUwzNTYcsbgUWumigDQgX1S8Ois6K3UL+XxJb0Ufh
	wCGu4Ejm7LJ
X-Received: by 2002:a17:90b:528c:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3903c5448dcmr37987775a91.4.1786287827273;
        Sun, 09 Aug 2026 08:03:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101a5ee91sm26113119c88.11.2026.08.09.08.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 08:03:46 -0700 (PDT)
Date: Sun, 9 Aug 2026 08:03:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: phucduc.bui@gmail.com
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] watchdog: dw_wdt: Propagate errors from optional IRQ
 lookup
Message-ID: <fe5952db-09b0-4e20-ade8-fb9d28463440@roeck-us.net>
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
 <20260807081652.38692-3-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807081652.38692-3-phucduc.bui@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_080348_177301_5F3D7924 
X-CRM114-Status: GOOD (  11.02  )
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

On Fri, Aug 07, 2026 at 03:16:51PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
> 
> Instead of only checking for -EPROBE_DEFER, propagate all error codes
> returned by platform_get_irq_optional() other than -ENXIO, so that
> failures are properly reported to the caller.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Applied.

Thanks,
Guenter

