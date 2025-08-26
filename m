Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACC8CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 12:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9pMIy2ceXu0U+iaZPJ+CBfNzoY8Ci+2h3RmbLWXEeI=; b=iWQ7LfAtsd17DegpHgSFv2NtzR
	z18lS/MU6/XlAAnLiBn8goE4bpcK7XIpAa6XQLmLiDdgUsvBsiCsossxqhBnXe+YEQ04E6lZKicPt
	5pdgrdyewGsnVCC9+LBLIKRGVStl/4Z3pXys8rFjMhMeuAkqKbxGHgu/PmHRkjNju6hTuysBwZMIh
	vvLYS0aSM/S2hF3szv1vWWsVvhX057xl6986mL1qlSnA0ZOyx0D72aQFF8LWizNYaGNsyZNuX9CtK
	TId62Zt1k3QagGULLXHbJuAAXlvRLvGWXPwXqPHcCmboM+CX2SDclfQ+FGZ9Gbowb3x2mGkzLNpvd
	3Q9568Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqsOp-0000000BtF0-2YCi;
	Tue, 26 Aug 2025 12:03:39 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqrRD-0000000BhrK-3URW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 11:02:05 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-afcb7af30a5so934708266b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 04:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1756206122; x=1756810922; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S9pMIy2ceXu0U+iaZPJ+CBfNzoY8Ci+2h3RmbLWXEeI=;
        b=DhfQOYTVG5puIgY2nBzHxtyeOl1qaswTTl9i+TMjgzJqLaPC077mv7t/K8vhnCfdQA
         HarKTd25ZORLxwFMt8cTQIreuTurcKo/0O8GyT6PlE+4EJhbS4FWl+zfnfjCTwHIknzE
         NJj+3UXqPqXM6+wgE1Zld59nXD9AwMxgYka7CL4sXiEa2B5KESK1n4iEo//E3sY9gSwI
         1Q2juHImupCpFWly8G+baD4TX2pRvqoyfYtlATzMayKyPaQmKXJcpQq+yveYAsv74vjy
         7Jle7wEAjHFW6rrmryLqaqkwTLR8Sq16Ef9abhrWNMVSAtHgw00f9eN2BFj6Y0pKzE2/
         3GXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756206122; x=1756810922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S9pMIy2ceXu0U+iaZPJ+CBfNzoY8Ci+2h3RmbLWXEeI=;
        b=CMhXPkwEdo3K0D8zOuwccGG1RuFXE1YvJUteBq/FVwQwbD+xNsquNSqb3Lf350MnG3
         KBLLxDVH1Gut+YVfRypEd0dRCj7ysSgguUY1iiRlMvICbXi9/FKBNuyONGR4HLjQ8s5M
         j6tB4RmDodvNYdQxcV3En2rkA88xSnwMHeZ8v3oqswgMH1tvK/GR4L7t4PTjoN768kqK
         dRNv6hiagN1W5jcxRgMThtpOzKc2U8BcxZTYsJRyJCPD75ObydCaOz8xLqcxCFthIH7l
         VbJUxaEAMcrPmnc1YL/l4DT1JBJziyqg00kE5tHrtBEyxDCi8u7uQWhgnzjXs8mN7UHd
         i/uA==
X-Forwarded-Encrypted: i=1; AJvYcCXTOACKxLN1j3qsh2/eJ1r1D+TrbGr195GVpyNuDYAwODZ0jkCu6axSKK4lhvx7DB9WJR0Dnwa33vSVKa4Pfjxr@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt5OqoRO7XmFE2RcudGHkVeEIalR5n9jHLwH2FlFkW0VSa+/mP
	k7qoK2MSTdkb5BVxVQlxhNAERDDovV8Eetn/j7kBaoQ5WDn++5Tu5ndadI3qGSqdpP8=
X-Gm-Gg: ASbGncs1b+AS7J6g8nKpa38bstoBmMOaVOcdXGvYPkF7dS8s/5hVkbPt0F56gKTFCBL
	a+Bjy2C5PB9yiI9NI2l9utBrH71XEYPUXZcmQGnyFAE3LQVjCKeHbxXrn6Qdn7vE3pcIo12KNk4
	GpzkZIApGg+d26ygag8IDmi459H37d0mEG7+nlVnC/xR93mLD4R+oQWiEZArBU1zlX2i45GmqKX
	qeVh9vLXoRMhPEJ8w9MZWhtqX+EHtU3P3VeEYltSkcsbgXdx0xxoGp2KX9ggVaq9CtEUQgT+1oN
	E3cLD6GF1a7Rx/QsIptGZc9yUks/5i4/R/CsRQVp7jwc3DURkaH3Sd63eFVJYV441MKJy+Gh9Ls
	CFmBXoxIeoRhnb+PXlLOXgxplMZovI1Ljl9JX0AXihrDTCuJqjUVR5OX6kHFLmsD7KBVc9aQ8iU
	UrnXGFvBABAJyp
X-Google-Smtp-Source: AGHT+IFsEcWIMVxL9iC4gvBj9YbqBmSOY+YYxvhjHWiMWtUrH8NxDZ6rdnSthTAZuxEPdrp5IvpPaA==
X-Received: by 2002:a17:907:7249:b0:ae3:7058:7b48 with SMTP id a640c23a62f3a-afe28fdfcb1mr1617412266b.25.1756206121373;
        Tue, 26 Aug 2025 04:02:01 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6103:4200:f276:8e0c:6e17:2570? ([2a02:2f04:6103:4200:f276:8e0c:6e17:2570])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe7aad5d61sm447908866b.105.2025.08.26.04.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 04:02:00 -0700 (PDT)
Message-ID: <0d71269f-1c78-4732-8235-5640bf340d00@tuxon.dev>
Date: Tue, 26 Aug 2025 14:01:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clk: renesas: rzg2l: Disable unused clocks after
 resume
To: Brian Masney <bmasney@redhat.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, geert+renesas@glider.be,
 linux@armlinux.org.uk, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
 <aKyX4YJswZLuqA6Y@x1>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <aKyX4YJswZLuqA6Y@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_040204_004550_B25A591D 
X-CRM114-Status: GOOD (  23.49  )
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

Hi, Brian,

On 8/25/25 20:05, Brian Masney wrote:
> Hi Claudiu,
> 
> On Thu, Aug 21, 2025 at 11:03:30AM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Hi,
>>
>> This series disables clocks that remain unused after resume.
>> This is necessary when the resume process is done with the help of the
>> bootloader, as the bootloader enables various clocks when returning from
>> resume.
>>
>> On the RZ/G3S SoC (where this series was tested), the bootloader enables
>> the SDHI clocks (for all SDHI modules, of which 2 are used by Linux and
>> 1 is unused) and the clocks for a serial IP (unused by Linux).
>>
>> Testing was done on the RZ/G3S SMARC Carrier II board.
> 
> Do you think that other boards would also benefit from this change? If
> so, what do you think about putting the call to register_pm_notifier()
> inside an __init block in clk.c so that this same change doesn't have to
> be implemented across various clk drivers?

Yes, that was my other approach I was thinking about. I wanted to see how other 
people consider this version.

> 
> Alternatively, if this is board specific, could this be fixed in the
> boot loader so that the clock that's not used by Linus is properly shut
> down on resume?

As a result of your request I did some more investigations on my side, I can say 
that, yes, in theory that could be also handled by bootloader.

I can drop this and try to do it in bootloader, if any. Please let me know if 
you still consider this (or the variant that implements it in a generic way) 
necessary.

Thank you for your review,
Claudiu

> 
> I'm not the subsystem maintainer, so I'm not asking you to make any of
> these changes.
> 
> Brian
> 


