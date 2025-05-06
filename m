Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497A0C3ABC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 23:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkoPM3l+7lBzFUb9NEMVxvMo2JwLrBmweMRUdwrQK7U=; b=csiQcFbiIkdMODdWJ4LBS+n92v
	UhPCUC68AefubyRvxkiIMGR1sKCi6/xFjiKw9heb/eo/OJiEn7OLcPFtWwz64bjgIFTNTUgkI2stk
	8ET8qXyAoT0PQxzlgCqyiUZRVy0tmgiAoIcPJajX+A6f5m32to2tRl+EliGBJyWI5zXI6JYCBRwXd
	XXYn3FruLLlkcZqFfLOCWewpeO1Asui5aYJGpVwK3mDcj4KBzLEf4QBT58GIe4NJDmrB4dqfS+B/e
	4Z86XPxq2SqksTL//M2Xa7y16RBSUIJY3dms/OrCZM7dbYg4NfZDg3WGZ/J8LoUsNPNz7AIGR45ag
	QT/RqVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCRpE-0000000Dfnx-07xy;
	Tue, 06 May 2025 23:35:48 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKtD-0000000CdGv-3WsH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:11:29 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso11042878a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 09:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746547886; x=1747152686; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kkoPM3l+7lBzFUb9NEMVxvMo2JwLrBmweMRUdwrQK7U=;
        b=FByAbcnI6BD9PVGhjKlsjc3lW2imKKn0ELbF//6isxoT94DgZf6XL5iXY/eN91OL69
         pjO6sxhqp6/MoDy/M/1H5mZmZrQCAB0DPQ0yM3qg27hwPZ0aYxz9ebjyX/cXDRcsmONG
         1kMnmM2MaQ8oloeFd933AD1/Zupt7SH2b0ib+g0kZfzF3sM7ELKNdpJ7+LBtxdY75RST
         EKBWXni/fPCIRLuwlYhV/2XkcJ8bThRwPTf9h5KI1mlAGUsZ3gaTCbsgBv8GLX0bLh3r
         cwjUlgy9TKm/3C87OqOnrDGK9oZusqI+//W11zmCxAt2ai/6kqssnDcGec1ilrU9JIDn
         HmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746547886; x=1747152686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkoPM3l+7lBzFUb9NEMVxvMo2JwLrBmweMRUdwrQK7U=;
        b=mvxj/wvOgirdWjIVEmjX09AdhwfxKl5vgiXTYoQV0+rKO8CGfr2JoXda5+3YNcYdmv
         fakR90VBpEV/B8+PfJ+moZyg0oI3eVsJ6+C9jWWGeFnR4KIzTixUk2Nk3jiW/8EpKE46
         O6xXdjfGQ/L8J0jy0/f2EPooCLyqIUqcQBrjAv/OcikuYH8VItkO1nCgpdx4lemHTeow
         u1MJeYvsYEPlXDQp7cVV9M7t21Do4jL4QWC8UYs16khqgItB9EeQ5XfFS/X0xCd3g2av
         yAvV1iG+qQpPwY3Oj5fkF3i4rnVr61qEPCmeFYk5gkC3y/4Tur9uzzCNsfL1zETz/H7X
         6ZGA==
X-Forwarded-Encrypted: i=1; AJvYcCWUSG/09m7roZa998zHK9c1ttZb1Ms+9O7wPpcI3bgjLWoOrr+wsonaBY5vrVbbhu3+UZhZskJKIaJGbZHts3Ms@lists.infradead.org
X-Gm-Message-State: AOJu0YwfmqQ7/ZoQK20lbxaVIr3QJ8Pv83/vqTfpYGrYYHE8USuIhpbv
	PLmqi6703ZN1nph7zNw+KdTOqSCtwqeElwLDm4wss34Atty89ED+
X-Gm-Gg: ASbGncs6zlbem3SqE91rKT78DzEa+OOf0E19lEvMVYf1l6TQ/tlX07VqE1210Y8DqDu
	7ajbOd/bEHIaxC//i4IoZofui37x/RlB7pJfOmJoOhChzMnHUkw7F3iuIBoPam11uuZGejoISsI
	W8v3+Jv3OY5rfHK37gpYRNfN6ieWva0D6M9iDQJrVyT1Dpeh40PVZ18Wl/WKBeIEZQ2zvPFmND8
	Dzo54XpzqXkubMGE9ikKylVQjA8rExocHv0ogTeadJpjCQCWjz7iDxYuBkg8X83+R0/JkKAqLK5
	gPbHQiWPaLJ6xb/yzB+wS+0eZEPoCYYPhS8zsPV2H8kBxjnn5thIN67GE/hdMlEN5rb0onLtBeV
	1dprL
X-Google-Smtp-Source: AGHT+IFFb8Sczr+GWj749ickdZJm25UBwRYzY6YSoQhWF0Yb59oFUJeLm2Ct+iUNZh1aWw2nmZXEEA==
X-Received: by 2002:a17:907:94c7:b0:ac6:b639:5a1c with SMTP id a640c23a62f3a-ad1e8bc3f2bmr5838166b.22.1746547886026;
        Tue, 06 May 2025 09:11:26 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77b8fbadsm7933492a12.50.2025.05.06.09.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 09:11:25 -0700 (PDT)
Date: Tue, 6 May 2025 18:11:23 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v8 5/9] mfd: bcm590xx: Add PMU ID/revision parsing
 function
Message-ID: <aBo0qzqHOkfFxaXs@standask-GA-A55M-S2HP>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-5-e4cf638169a4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-bcm59054-v8-5-e4cf638169a4@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_091127_877954_E63F6402 
X-CRM114-Status: GOOD (  19.49  )
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

Hi Artur,
one note below.

On Wed, Apr 30, 2025 at 09:07:09AM +0200, Artur Weber wrote:
> The BCM590xx PMUs have two I2C registers for reading the PMU ID
> and revision. The revision is useful for subdevice drivers, since
> different revisions may have slight differences in behavior (for
> example - BCM59054 has different regulator configurations for
> revision A0 and A1).
> 
> Check the PMU ID register and make sure it matches the DT compatible.
> Fetch the digital and analog revision from the PMUREV register
> so that it can be used in subdevice drivers.
> 
> Also add some known revision values to bcm590xx.h, for convenience
> when writing subdevice drivers.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---

[snip]

> diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590xx.h
> index 8d146e3b102a7dbce6f4dbab9f8ae5a9c4e68c0e..fbc458e94bef923ca1b69afe2cac944adf6fedf8 100644
> --- a/include/linux/mfd/bcm590xx.h
> +++ b/include/linux/mfd/bcm590xx.h
> @@ -17,6 +17,16 @@
>  #define BCM590XX_PMUID_BCM59054		0x54
>  #define BCM590XX_PMUID_BCM59056		0x56
>  
> +/* Known chip revision IDs */
> +#define BCM59054_REV_DIGITAL_A1		1

1 seems to be the digital revision ID for A0 (couldn't find the analog
revision ID), see [1].

Other values seems to match downstream (as far as I can tell anyway).

[1] https://github.com/Samsung-KYLEPROXX/android_kernel_samsung_kyleproxx/blob/cm-13.0/include/linux/mfd/bcmpmu59xxx.h#L82

Regards,
Stanislav

> +#define BCM59054_REV_ANALOG_A1		2
> +
> +#define BCM59056_REV_DIGITAL_A0		1
> +#define BCM59056_REV_ANALOG_A0		1
> +
> +#define BCM59056_REV_DIGITAL_B0		2
> +#define BCM59056_REV_ANALOG_B0		2
> +

