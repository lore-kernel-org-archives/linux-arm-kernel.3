Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E46C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 19:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzWZ3WF1iTTyJII+h6wIVAKbIfkK/TqWCpKjALnDATk=; b=u5c0cTWmyIxUZXZ+EiCpGTkgTx
	+/GuRgkgrnWTG/zCMS6O+hpqwRyjYIw6QaHzaQtxrXkV9Sogu/J2n2Gear/vaaFp5evWusJX2HJLD
	tEWhUjtxvsGYqby4D2Vz8UNRJs4a67zwZmAr1n0GaFPqsG/lDV4vb4QdyOtvuRuEQiB0iGDAvY7rT
	evIwl+LSp2OSzX5U7NoFm6GR3aUa0Y8MGe/l3QkZOxpL7uqZ6d2o62zxGB+3TsyKU8j7leeCxquzz
	o/EIQ8Sp5Kd4gpweybHCo2HUdxaQL2lGAgN2c9cXV8Js9Ev6s1/CpChgAgwM1HVJ5Co/bY8RBLHDa
	HkQFWwJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLVC-0000000H9bP-2ZTu;
	Fri, 24 Jul 2026 19:24:10 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLV9-0000000H9an-3qCc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 19:24:09 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso598377a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 12:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784921047; x=1785525847; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wzWZ3WF1iTTyJII+h6wIVAKbIfkK/TqWCpKjALnDATk=;
        b=sf/THXdiogbnuomA8ypChBhJspOIZxdNIcez+BbueA2ofQG8heI1P8KtAiJYlZtMHf
         hBkGN4KvKng7uFzQZycIxcr0UzFazLk+riTzozzMgdyADvNG+aCtbwC0c4u+ufThoVHC
         pJ/7HrHazFvpbeELmLxsHkR+Mp+Xt/YELZUbKcgsLZORiYpuLccByycAxKx6xeGSi/3I
         lQ5mJWU0NoAmargmBk1YzToDOHtQydbd8IKgzNbw1LMQu79nVHZ+oRAq6/a4bW9cOWYT
         Ku8plQlgiWyfNSqR1zRnViVEQhQYMwO8fU4HpokiHGKwYJEHhFzt8Rr64mKPCgnxHVG7
         3lCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784921047; x=1785525847;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzWZ3WF1iTTyJII+h6wIVAKbIfkK/TqWCpKjALnDATk=;
        b=ptbCqev8CevaodySHXr4YomzDIJZcyKgMmlKnLeND6/iwX94s3aI4rRDVuhs2SFCQY
         Mji9JQdVY3YySZ8rHdH/Ewo/6IbwzxeJXEmMfS6OJdPDnJf4SrejmWlMbbXSb3OSWrZS
         fhckGFOGAazBRe0aVh8g1S7GsKSa3QGPn0Y46TOrYXtC6mgxwNJRooiEP6tbmiXiZZep
         dhYI6U3MQOkKBG8xUuQaAkjmXHOWIaZTwOOGPsnrI7vr06W/1UUSB8qSfKjCXL0Je8e+
         GBQLle4N96Hhxo1GhAkOITIINkDQAkTPsA4uv1S5NZ19eLu5LGDAtwxJvvuFSPhbA4yA
         2rzg==
X-Forwarded-Encrypted: i=1; AHgh+RpzZ23FRifjkD/PwGWKCZO5FD8q+TO1FGVa1OTs1DJ7xvjVwTr3pXAWg4r+iRy0jw9jjaUidl3gGVyjay//u0aM@lists.infradead.org
X-Gm-Message-State: AOJu0YzswFeNOeT3RfzU2flSIXnAnu85ZBs4yFSF/FDFEoIPY/Rqumj3
	ouuxlilW8Vb0NoE6L7HV6ChTa+IA5vajZ+NLwPnadOs8BPhIZrh1ykAQ
X-Gm-Gg: AR+sD139aGqsmZ3W/96PA+HqW9bPKuRM5sSy2/mR1PDE9ZqJwt4Lgo3SGOok9xvzL+B
	m0Dzj73RVsAalSUlIquds47RS6fnBbFQwCkqv6KaDPCcCrBodWhejpSYLPjVTZhewggHdjxLDwX
	69hd6kPv5MwyPw4nSOy3rBNEFU0fGQvqnmpB4cbf843T1m6lbUddRSXxKiMxP47xGsUhpPKweEF
	CPjU12X/fN4AoMhhDgXJYM8von+S9yn3EYQJAKXGoYmUtmeL2ubrphkZErkSG2Dkc6p+oqvtfvX
	t6alazRJWjePw6E0i1lRp7A+3J2visozBGfxvqMUIthscK7KljcR3nEyi3a08zrbQM9w3LzW/7M
	GOWDwbTRfD99Fy8eYaSA1IGTEF1Yp5URHMKNmkcxKGD/6J5xLGoaXpg1MJk6lGuq+T5kZcQALNP
	69LJBLI0lQAqrlI0xUGryCSwCgM8J+5xnoP5L83D6F9GCul+VVWhXR6w==
X-Received: by 2002:a05:6300:408a:b0:3c3:a3fd:db0a with SMTP id adf61e73a8af0-3c44afda117mr9145039637.16.1784921046575;
        Fri, 24 Jul 2026 12:24:06 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:40e1:40e4:dabe:543e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e127asm3436937eec.2.2026.07.24.12.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:24:05 -0700 (PDT)
Date: Fri, 24 Jul 2026 12:24:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Srba <Michael.Srba@seznam.cz>, Linus Walleij <linusw@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/5] Input: zinitix - do not ignore non-moving fingers
Message-ID: <amO1AWyjGltjO0lZ@google.com>
References: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
 <20260724-zinitix-modes-v1-2-f6df7d86a878@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-zinitix-modes-v1-2-f6df7d86a878@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_122407_962046_B20F6811 
X-CRM114-Status: GOOD (  26.86  )
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

Hi Kaustabh,

On Fri, Jul 24, 2026 at 12:54:04AM +0530, Kaustabh Chakraborty wrote:
> With the ZT7548 touchscreen present in the Galaxy J6, multitouch does not
> work reliably. This is due to the fact that the driver reports fingers
> only when their state is changed, so it's either placed against the
> scren, moved, or drawn away from the screen.
> 
> The function which is responsible for this is zinitix_report_finger().
> This function is called from the IRQ handler, under the following
> condition:
> 
> 		if (p->sub_status & SUB_BIT_EXIST)
> 			zinitix_report_finger(bt541, i, p);
> 
> This implies and ensures that every valid finger must have the
> SUB_BIT_EXIST flag.
> 
> However, at the beginning of the function, it refuses to recognize any
> finger if it has none of SUB_BIT_UP | SUB_BIT_DOWN | SUB_BIT_MOVE. This
> excludes fingers in reports which do not move from the position since
> the previous interrupt. Add SUB_BIT_EXIST to the list of valid bits.

This makes the check basically a no-op as SUB_BIT_EXIST would always be
set when we reach this function. It may very well be that we want to
delete this check altogether, or maybe we need to add SUB_BIT_UPDATE and
SUB_BIT_WAIT. I am curious what status bits you see when this condition
(original) triggers for you...

> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/input/touchscreen/zinitix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
> index 3421b8ffb19b..fdcb80f52c91 100644
> --- a/drivers/input/touchscreen/zinitix.c
> +++ b/drivers/input/touchscreen/zinitix.c
> @@ -406,7 +406,7 @@ static void zinitix_report_finger(struct bt541_ts_data *bt541, int slot,
>  	u16 x, y;
>  
>  	if (unlikely(!(p->sub_status &
> -		       (SUB_BIT_UP | SUB_BIT_DOWN | SUB_BIT_MOVE)))) {
> +		       (SUB_BIT_EXIST | SUB_BIT_UP | SUB_BIT_DOWN | SUB_BIT_MOVE)))) {
>  		dev_dbg(&bt541->client->dev, "unknown finger event %#02x\n",
>  			p->sub_status);
>  		return;
> 

Thanks.

-- 
Dmitry

