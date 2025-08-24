Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F112CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 20:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKTlnh4Q+KFGQxB1IpD8bcbVivdqkUNyppHsT6Wp7Mg=; b=enKce0495G+wnohkQ5EwUtEv49
	dMxIZrd4qKBR2a35rqrgryhxxiL2PHGhJ4V0ok3XLwM5vyYmC1qQPg4h+9WRvtmBq84CEmTmApleV
	y3Xc4heMQx46WHKpdD4wOdYtIDMUCDwLbGWGP5XYPRqV1WowRwHO1/OB1zM0D20Hg032+fCitBC2H
	zADr7vjdzfQT/hpBNqWdIKHHUbhdvEwtPq4BqddvPvDNZkyVfydAZtf+mLnKDbUNMi2IcWIxLysXq
	MrN5o2JWStzrcCHJMH9glQBoT4AJIOyr7/hUcCMuT1LZOa7EdauBtop/GiZMMX/9JZibtWhJMW3cr
	IkHm1Nyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqH9c-00000006Wjx-1TJE;
	Sun, 24 Aug 2025 20:17:28 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqH70-00000006WeU-0qpk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 20:14:47 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b618e067eso138195e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Aug 2025 13:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756066484; x=1756671284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UKTlnh4Q+KFGQxB1IpD8bcbVivdqkUNyppHsT6Wp7Mg=;
        b=OgJ+2P7JQz/jBUq9xcQAc38Gr+DvhHFYFhEGLvfaDiLvYYJYkAaRMtDkFptEaFG94g
         fhDLg044xZSprLfR86LTXm/2XwDkYpFao4Dv+L/doRnhmDNehzIjix22WM3hP7RbNaTS
         WxnempKWBMs4+6WaZ2EU5SZf4H6H21MB3EXOVcOOhnNuyjDzbMbYpq3pCb9ifSXBNaXJ
         i8mOYA8DkBOj9jl59afSdaUUO7iWrGHQVqgJTd4UPHj5DgRIgxe5HYWGEzrW53D0JDvP
         r5rwAQO6mJ0nSvFa2Mmp7MQbU2muROzxePkARNd1kU3myw+Z/JZJE2YXXK+4WJp5IF9f
         0phw==
X-Forwarded-Encrypted: i=1; AJvYcCXO70QemLF0ubJq9QJ1r6JCkcppAHlbbPRfp4RNknD1LYEJW0wDoZJOyzY0wMEXVK6QuiMWL2PmW2Isn3aWOxT8@lists.infradead.org
X-Gm-Message-State: AOJu0YyktZi6c3EHH2DBGGTrGjqQB7X9+dHig/DJ0mR+JDx6s6GfVCWA
	xQMLr9Jg8ZgUJshq09si3upeXj2ydy8hsp+v7qzYRodvbmGh47a3qf6t
X-Gm-Gg: ASbGncuMOzl5ks9KVsdsR7q9gILrI8L4JZlzZHkW4F3E5HYh+5E5Obn4ClS64onn/Aq
	rGOV70IC6fv8DEI2muOL9uNw8mbXDgBR93fD/EOE2RNp4ZA2O5kvMOmBHGN8SkfRBlMvU/OEOzh
	5Susb6q3JxtV9G9zQcYFib0kw++h1H9qBBFsdpzRBtFri2BRplgG7owib1yKV23wxFXuxrZnqag
	Gfigki0L2u6lPV1eUIjmvmwTcy/BjLEiXuQNHbSKk9yBrfAOPdpZItWBSgOJya9vEmz7sxwn2Qr
	eX2oJYTOFVfmlXbFiILkRN4iKiqBwpXs2CgLRCNFOZzNk+80stYqIL/L/OQF8JZQu3ETzIFVpS/
	AIl6YLSHfwC8xtcsDhxA3T88nMURiiHXJBSlmKq2s1YX6TZWyOsYArbcl75NwbUrpHsL++1YSnT
	KSvlg9pNmI6zjdqn1t3s9DCdVtlPWytOoNcJcq9/qBQo6e+/+7BVlpwgDF
X-Google-Smtp-Source: AGHT+IGixne2CzhYsvhc1VjQmKs+mUxsx4fbWpFtf9KIUi0pdE5NkMGXTLYvUUMdJaxWALm+fOflTg==
X-Received: by 2002:adf:f7d2:0:b0:3c5:921a:f440 with SMTP id ffacd0b85a97d-3c5922a3763mr7540475f8f.12.1756066484512;
        Sun, 24 Aug 2025 13:14:44 -0700 (PDT)
Received: from ?IPV6:2003:e0:6f2b:f231:547b:d9c0:96ec:4a8d? (p200300e06f2bf231547bd9c096ec4a8d.dip0.t-ipconnect.de. [2003:e0:6f2b:f231:547b:d9c0:96ec:4a8d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711211cc8sm8563940f8f.36.2025.08.24.13.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Aug 2025 13:14:43 -0700 (PDT)
Message-ID: <ec4697e7-7afa-4b24-a5ae-cdf103aaae50@dietpi.com>
Date: Sun, 24 Aug 2025 22:14:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] staging: vchiq_arm: Create keep-alive thread during
 probe
To: Stefan Wahren <wahrenst@gmx.net>
Cc: arnd@arndb.de, bcm-kernel-feedback-list@broadcom.com,
 dan.carpenter@linaro.org, florian.fainelli@broadcom.com,
 gregkh@linuxfoundation.org, kernel-list@raspberrypi.com,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 mcanal@igalia.com
References: <0c2840c2-241c-4f98-9518-6a3676286823@gmx.net>
 <dafff4b4-f022-453e-935f-6d79c4c57292@dietpi.com>
 <8e51d9c4-512a-4b98-8ef7-e08a259cbf07@gmx.net>
Content-Language: en-GB, de-DE
From: MichaIng <micha@dietpi.com>
In-Reply-To: <8e51d9c4-512a-4b98-8ef7-e08a259cbf07@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_131446_244974_37071D87 
X-CRM114-Status: UNSURE (   8.13  )
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

Hi Stefan,

Am 24.08.2025 um 21:58 schrieb Stefan Wahren:
> Hi Micha,
> 
> this issue has been fixed in mainline/stable by reverting the commit in 
> July. So downstream should have received the fix, too.
> 
> Best regards
thanks for the info, I should have checked upstream logs. For 
completeness I am linking them here:
- 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit?id=ebe0b2e
- 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit?id=228af5a5

And on Linux 6.12 branch:
- 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit?h=linux-6.12.y&id=ff62859

Hence next downstream build will contain it.

Best regards,

Micha (aka MichaIng)
DietPi project lead

