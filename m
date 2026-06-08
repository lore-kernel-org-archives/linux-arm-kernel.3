Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7F3CD8CA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 22:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8162lNHsWpqaubi3mJjKtZ4gQWpHDXaDerX/XR2Loaw=; b=B1UCfqb9YKyps5P2zL5rF/nf5c
	TtqOv7f/1BChflnb5DUAjoJae3loViS4UwdpDJyF6S7SXRyXVvFQouOev8kbtGydrwj8G51rGgHnx
	VoAhTHPnQ1Fm1YzAOJf9HERu7hs7oc4ZnREeJIf+usNOeL6JNLsACB+lHl2Ccz+OmmFux6tPCnNUh
	rN2R7CKbI7baj/qVolNs1kREUll9Vp7oe9c0FcS6xdw0WyRR7INCU5yeMpZtJ0I4hBTryJGovEB8S
	G8y+g6nb/g+CA2CsCQYlikta+fNPu9dta434js/PYGKCOIw6tHPDl2NyO+teA9Cz3obhUORT2zdNM
	cl5qu2bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWii1-00000004VJj-2wBu;
	Mon, 08 Jun 2026 22:44:41 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWihy-00000004VJQ-3lRZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 22:44:40 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8421f0e9c5bso2164722b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 15:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780958678; x=1781563478; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8162lNHsWpqaubi3mJjKtZ4gQWpHDXaDerX/XR2Loaw=;
        b=jWQ7CoVddmlH8UbQZwzWKDpt4ffoWjlan9UYMpuDQikku8Qe471ePtURx1g7G5R7jK
         V3mcLPBjoRrb4romKqN0pZPWWUGWPVjIw7vWGmV0k/X5BFIaoxe5raB0CLkbqgSB0DgA
         Xdcdp3J0ldEfxUh87j+Gx7y7d5rm+p8KuWrRcEFgqI4XUMWHetmkXYTp2h8c/fXK5AQL
         0p8w63dcdGcqQFqqLiZzF+3tnaJUhwGt4Ck0Q68pHpkiIfATHVdgiwBuH2AVUwC0Txiy
         2FWDgkRFEtN52enfdA+kNk65CJECIfaORluCoi23FvgG9QbglZq4BUEsZNTVofgDYKYX
         bMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780958678; x=1781563478;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8162lNHsWpqaubi3mJjKtZ4gQWpHDXaDerX/XR2Loaw=;
        b=UgTvnJpPoQCd6VCdxf0OM2BnqML7x58AHzBFtcY//m5IZAl8FGVnb5sr3d/xu3TQe8
         1m+9fPz/g11ptYVZBb6sW074VX4UQ5W03V/Xozl6hX2WyPk22mHLRN/lPFbxtO9IoQfH
         A8FyrvIF0Elb921ppGFaJ8rAzNpooArC9784HFV0xCjiQgYOGJABNS94JZv5tPHkwp2R
         fYbs/qQNUeiusyqBWLiiaLsF4xgI2GRD4dFNfrv/KfRzRF5wphLb04Jy+tsQZtXQQyXv
         xJ6ybMzjkG45E8dHc+QTmoUEQ0XD8wdgwu6YGd/LaMgRMjdZzzVS/ladtnXCF8FTlh7v
         glbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9j6OSuqT5J/myi3pCDJMso2AFVHMx80TJPj2uSqckS0FPrjg3WwUKqVZNKbXow7Q8JgqYUFJyW7oyM3DMjmF2v@lists.infradead.org
X-Gm-Message-State: AOJu0YyJAn9mUHYcoAHLF7RQ90OACS/5kfiChkeRueV0fpVrmPKqUUgL
	VC6+JzeftMIZ9jHxYyjwr1W0y6rBjxY06fGWyqSUcvfNN9/U+SdqV8/y
X-Gm-Gg: Acq92OFHQQ5pptCW61SByit/9F7lb+Urur9wplDiCNexkGtDQLYhRdhJJGHYE/XjW8x
	CDpIJxMuZ43kK+QKebCWQwg4jWso0VZzLqHNzeqDAMR8k/PnfiRA/0ZyFWfBuj342wC0m1+Bz7A
	YrqncVKtgB0+D+9l+uE6IituK1+9rwYzBzqJmFvOoKv10b2q/uFbemt8UIqILj0F7z8Q8J3luI/
	YHJkr77zUNd62nTA1ReRjg1gTLTS8Cn6zkym8Py8M3SG+EXGQlvoOICTArXEakvzjxR12rNeQUM
	zvmOYvdwHtkXeGo2fF2SBeGeHpIcrBdF/bzXDR0VevwYqqZ2kltXy/y3mwb1uyHftKZUi5SjcvW
	TcRbKaHVy8VgmSbSLAnRjpshYeG+qqSvfmj/+2u5kLizLOlhLcMLsVIp8oeOM27w+c2y9Yfkm84
	wYuaIAMVPFe4T6F8WKxHOGFbHbR5tJ2Z0nsSaQYAL/rDKyYHsVUKwwHtjGTMPxR2cQyY3/PRsgJ
	WfTQnFSAHU=
X-Received: by 2002:a05:6a00:8006:b0:842:5bf3:c53c with SMTP id d2e1a72fcca58-842b0e1dd7fmr19184385b3a.2.1780958677698;
        Mon, 08 Jun 2026 15:44:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221cc3dsm19099500b3a.1.2026.06.08.15.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 15:44:37 -0700 (PDT)
Message-ID: <8f5d6e37-2334-4eac-90a0-8dedf90d7890@roeck-us.net>
Date: Mon, 8 Jun 2026 15:44:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 2/3] watchdog: sama5d4: use platform_get_irq_optional()
To: Rosen Penev <rosenp@gmail.com>, linux-watchdog@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260608200933.18669-1-rosenp@gmail.com>
 <20260608200933.18669-3-rosenp@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260608200933.18669-3-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_154438_973110_59B09BCA 
X-CRM114-Status: UNSURE (   8.19  )
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

On 6/8/26 13:09, Rosen Penev wrote:
> irq_of_parse_and_map() requires irq_dispose_mapping() on failure. Don't
> bother with it as platform_get_irq_optional() doesn't need it.
> 
> Also handle EPROBE_DEFER.
> 

That is misleading. irq_of_parse_and_map() did not return errors,
so this is not an "also" but made necessary by the use of
platform_get_irq_optional(). That means that replacing the
call with platform_get_irq_optional() is not a 1:1 replacement,
making its use risky without extensive testing.

A much safer solution is to add a call to devm_add_action_or_reset()
after successful irq_of_parse_and_map() and to call irq_dispose_mapping()
from its callback function.

Thanks,
Guenter


