Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672D2CD8CA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 22:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3D88PzOddsT6UaoAh3azSKu29/ugzAUVSvz52SY6Gg=; b=RQnIfcAOKzc6lws3acu2aWLpd1
	Zxr1YBH4YRtUsdt2YZJ6LvYUdOmRpi95yiKy3DauWpMpLk2Q67gYRJqji+F9UtoZrYqQ9d9vK/8d0
	2NREKDWSPFXoeZan4K3zIsaQjdbjztGCckkIEtnXEmWBC96zX695P4IdgU7V1qheLX86bksz5sDpv
	pxYakJuMAeIKGdVuVGCLkxfHp6CLFGt0z7YlMvgUCrIQ0+a5Y+rkrLyE6x3rCE3+tu2gA//8htcSX
	yUWJZZah4YYqgwuHsA/3/R4Vgnc5kxvn7PNt0Lj6dxNiJEhtcrI105h3ToZH2p5dzSA+d6YQnivPg
	ycTsp2zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWiZ9-00000004V1W-3U4D;
	Mon, 08 Jun 2026 22:35:31 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWiZ5-00000004V19-0zBl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 22:35:28 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8422f148dfcso2640758b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 15:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780958126; x=1781562926; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=g3D88PzOddsT6UaoAh3azSKu29/ugzAUVSvz52SY6Gg=;
        b=BniCEh3jiom3gMg2Pk/ygkkUXLEPpO5/tidISW85Kt2YQGCAdtCSIChHgLUHuUMyae
         bd60X/zX68EVdRAoN7mNhcY/f5pET2JNtm7GcAcnkYMjS/DLmqr++fXwoHLTBwtDORQa
         73RBv+GCEG0de4IqSCT63M0xuNNAx59CJFKmPOo29J5p/2ZRk2HX4+aqgTo4K7jViP1E
         qM2L05rVzyiCnRJg/WgdD+opYKdPwwJ784J7XINLClMVFNU/Y3M87tIjf7lHQZvP1B1J
         do121Qjo4W8lLHdv5NY8d+EzFHdnIUYIJy4llO0q4ZD7ksPw/UliTOeEibqsmHRsUVJv
         YXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780958126; x=1781562926;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g3D88PzOddsT6UaoAh3azSKu29/ugzAUVSvz52SY6Gg=;
        b=nYU+DyQafib0RE3DlMBKNcbL+nz4zT+ik3QcY2k4PySPUv02PEFU6aDIz0s7zGxphw
         xV5aPNRrajtVnuFIYsG+sg7/xI1ene5zNGYWUZNJwu3sat3EGgiADpR1zE4sOCPAXNYL
         Lscm090vT831zDLDMvX+Tb0AM+pSyd9QZZI5UfvMoV2jZJFJCxPhfoMI/fS/5VhvBxQb
         j3UDDJXxoYimSVajQm08vF9/I69funcEpXChc5kCNSjeMfF7k9iFsl1jpSWBdSyTpyCZ
         udJVx+2tY2eMOceHaJo9yV6mJ2udi5tro9f+1iksBf0xnQnvPWGRA3NAz8dx0sjpVsBs
         G0NA==
X-Forwarded-Encrypted: i=1; AFNElJ8GHwge2nI+NCc2lyhTtSKbAfLmSCgIfNlrcYIillLHCXClyvNzhI5bU2lSBsnE7wLlo5feMeuYVfj4lr5ECkn9@lists.infradead.org
X-Gm-Message-State: AOJu0YwQcZlJvPW6yB14AIlfOp9hoOm059O17O04S7yatpbfXgixZqFz
	yYOWdjYEWoZ7CDgbs8UmuytZ5m5xQWKlm17yZoEreNlOPFr9Tf0Xc+0m
X-Gm-Gg: Acq92OHHdbpk5gfgd7wYoV0fEDVXq/FnYog9Ae/0izwKUNZLXlNctYyjMotUWYqiGbF
	cgbq2YmA7eXrwQMr5Z0FlvyU7xEqmvKb9U70GhG5/dQ0Rudp++aLtAJ/PDZ2SziO/SmZUgR8Sec
	N1As117ncE8ErFJVRMp0DB95kYyr6WMKrRAqlIw6bu8lwEANxAVZ5+UiU1ZsQHXt08MGmdSYX6x
	0tSdMa28xMhUxCdq5VI9m7qAiHgNkPBgVZAh7lssR/TkO142+cySZypAkk3KD7cla+VS0LuIWCQ
	O9itByKH25QS96gh8DekfoYTwUbl87hKHE/dDu1oWZXYGSG4jUumh/j/rj/nB2kUAbjpAtHwp4t
	GcNeMjljJCSQJzwshmoqZ/30gyeXMOex9qSFbkqq4f2dAmUSQRNLXCarH+lo3yw/vEqP77POgwl
	YqVGkvrOXjyg8DwBfZFua9EqYA/gvfXgW4paDqxQYXFUCO41XzA5WzGrPDYVFohQfboRzKMswLO
	OvQex9N55I=
X-Received: by 2002:a05:6a00:9292:b0:842:688f:307f with SMTP id d2e1a72fcca58-842b0f51a52mr17791879b3a.28.1780958126098;
        Mon, 08 Jun 2026 15:35:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828836efsm18887679b3a.38.2026.06.08.15.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 15:35:25 -0700 (PDT)
Message-ID: <db3d05e3-e7c6-46bb-9a56-e45970652f14@roeck-us.net>
Date: Mon, 8 Jun 2026 15:35:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 1/3] watchdog: sama5d4: fix shared IRQ and hardcoded
 timeout issues
To: Rosen Penev <rosenp@gmail.com>, linux-watchdog@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260608200933.18669-1-rosenp@gmail.com>
 <20260608200933.18669-2-rosenp@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260608200933.18669-2-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_153527_304880_752D66FB 
X-CRM114-Status: GOOD (  15.37  )
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

On 6/8/26 13:09, Rosen Penev wrote:
> Fix three pre-existing issues in the sama5d4 watchdog driver:
> 
> 1. Unsafe IRQF_SHARED | IRQF_NO_SUSPEND combination: The watchdog
>     interrupt is a dedicated peripheral line, not shared with other
>     devices.
> 

Not addressed in this patch, and can not be addressed without testing
on real hardware. We'll have to leave that alone.

> 2. Unconditional IRQ_HANDLED on shared line: The handler returned
>     IRQ_HANDLED even when the status register indicated no watchdog
>     interrupt was pending.  Return IRQ_NONE in that case so the kernel
>     can properly detect spurious interrupts on the line.
> 
> 3. Hardcoded 16-second timeout: sama5d4_wdt_init() unconditionally
>     used WDT_DEFAULT_TIMEOUT (16s) for the hardware timeout, ignoring
>     any timeout configured via device tree (watchdog_init_timeout) or
>     userspace.  Pass wdd->timeout to sama5d4_wdt_init() so the
>     configured timeout is honored during probe and resume.
> 
While I think this is a real problem, changing the code would require
testing on real hardware. We'll have to leave this alone.

Please resubmit, only fixing issue 2). Please list the other problems as
explicitly not fixed in the summary e-mail.

This also applies to the new problem regarding AT91_WDT_WDDIS vs.
AT91_SAM9X60_WDDIS. If that is a real problem, it can only be fixed
by someone with access to hardware and with chip knowledge.

Besides that, I would suggest to re-order the patches.
Patch 3 (the null pointer fix) should be first, followed by this patch.
Patch 2 should be last.

Thanks,
Guenter


