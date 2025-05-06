Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165FCC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSv1f72q2Br/HkTLRvnIUjJKIt36w5BUq7xaU114oLk=; b=ZXO0oWedOUlEwed4BdZ0g77Emx
	KWhIr0Aj5Hcz4wXiKmLiF/8vCnHlZeNTrbiNUC8KPQSC8iZJUoWPhASXauYvrBcpQKUQ56JGCIBZK
	t6f+1XYDJ7bPHI7GI9M+Ytq7UsiAvdz5+hpS2eeVg9ELcrrGZ1yF8zqAQS97K3B4ZZ2Wgatv1Vkx4
	TjzwB1sIvtI30bCkWWEIZxaQpGLiIqepSunlNE+sua9VBIUA04cCGUOtT+HTLK3P5/hlxISNcDnHn
	wb8PsBB6mmPjoyWBhrbduwMwSm7u4F1SHZrzZ48POqrZCWaTf/aLbsWmPTszlLYxpqQRH0qnN3QZ8
	5S0BiM9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUai-0000000DukJ-2hZA;
	Wed, 07 May 2025 02:33:00 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOtD-0000000DMnX-3HpT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 20:28:07 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ace94273f0dso397451166b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 13:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746563262; x=1747168062; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dSv1f72q2Br/HkTLRvnIUjJKIt36w5BUq7xaU114oLk=;
        b=mOjdGwyEK231J5WbcS2oz/0VsWwpe8V3uQ9fBppW5XlbNAijeeKsmV6g8V+4Z1M0qf
         tVkPSYGwARFaDD5WO7A0ofUoYMTamqPpDqGh5d7dT4rEylqjf/IlIdXW26UUDkMtkdrP
         H1jJnig+ng8oEc76zno/1oxgZm0HR68++5yzw9HjqXt2vNq+EJNMO1KSQhJjOSbVSZK2
         4K1+EDsuC6YjF37PMpHRvple9+6RubJXDg32Apz8AxqssVTtjXX2vyGk7MVM11uegYvz
         1v7xnLQAdKrD3TDYgV3YH0hnsdPAFapGou2iULBavq2+v+ryK9umrvfLZyHfxeDImM1C
         nYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746563262; x=1747168062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSv1f72q2Br/HkTLRvnIUjJKIt36w5BUq7xaU114oLk=;
        b=Z/brzu5k/TOr72sFfJo26hZMg3oL8Kv7qU+R96jy+PljimMYpVpiOPmjuji0UNgs/0
         KJkLaKDyoiiyTBIEbPXcFnwWlncLc18QZunAerhfWe8PLyVGu2xhOdN3gXZHDFr02cR6
         19r9So+c2Gj+FLyrImNwbCvya4QnMeFzVHlF1vOKYfNF5FiO1B80nLjxe66/6jCxm6RS
         IvnlMGdJwfaChnjp9yqEGRkXo0hyB1kbUhUmeFutlgAQGxXyOjDkTKhhMmppz6QobZk7
         U3SiEJ7vO1p6/hJwA4kzE3sR8kHG4W3k93GGGCw8Ht6q0eKJ9fEPEZEB0zikO3op/FBo
         YPrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz52InltilnQS8jMTUS8lf6bNQNB/bGk+/siby0JBnRY5TZb0xUpiRm3mCIzqXZKtbeBRYUvM19rmA2UTcX3Kw@lists.infradead.org
X-Gm-Message-State: AOJu0YzCHDjqVSUHk4Sq6nqyYKJTcwHpoakfcr6eErpQD+bArTWYvJAd
	bTA/7iITFy8x90IdnmsIM2WJHIZ6H1TMMSpAVj0EWb/Wn9eCSjMn0MP4/g==
X-Gm-Gg: ASbGnct5LNWoa1cA3aTrPGVMqzSC9QEkW1c/qeeHkKSbc/6lqrKwvMKJ2tZCutS/cAq
	g+YbaZ5Ls3f/z7ASoA2DW+wWzuVnjGtU+AwnLf/qWBOjxL7gQ56phk49mjvsjvLpYmUiu0NDmbC
	8hGjKYPslADcPxttkwCjc89/S5WfLiXIdYjCdfhB7UwQYopKvWX+YVHp01wdR96JryiyjRg/tlU
	Qv1dtJI+m8UGuZFjWINWpaMMbkv1xSA1V20oFeqkS2l/Sc56wu3TtlUXLFa+QUvvm4Ebbtjn0St
	UcqCnKO3/nhZvNWpB9/A94q9+XqhTgka9SRiK+1RnH1WsIM2btqEkbdlUg1ZgmR2/4QQ9jGLU8t
	hNjy+
X-Google-Smtp-Source: AGHT+IF28dWY6dX03yamEtrxQ8IDoIkzwFAJdcmE10A1YLS8hxpcBSo7uXAa2s4AhgXsBNi1jsAeTw==
X-Received: by 2002:a17:907:7e82:b0:ace:c225:c723 with SMTP id a640c23a62f3a-ad1e8b92275mr82948466b.12.1746563261544;
        Tue, 06 May 2025 13:27:41 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a1e60sm764564166b.47.2025.05.06.13.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:27:41 -0700 (PDT)
Date: Tue, 6 May 2025 22:27:39 +0200
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
Message-ID: <aBpwu0rEK_K-9tcu@standask-GA-A55M-S2HP>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-5-e4cf638169a4@gmail.com>
 <aBo0qzqHOkfFxaXs@standask-GA-A55M-S2HP>
 <7eeaa7b4-b76d-4658-ac78-705a5f8e54df@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7eeaa7b4-b76d-4658-ac78-705a5f8e54df@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_132743_824746_018720F5 
X-CRM114-Status: GOOD (  29.60  )
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

On Tue, May 06, 2025 at 09:03:15PM +0200, Artur Weber wrote:
> On 5/6/25 18:11, Stanislav Jakubek wrote:
> > Hi Artur,
> > one note below.
> > 
> > On Wed, Apr 30, 2025 at 09:07:09AM +0200, Artur Weber wrote:
> > > The BCM590xx PMUs have two I2C registers for reading the PMU ID
> > > and revision. The revision is useful for subdevice drivers, since
> > > different revisions may have slight differences in behavior (for
> > > example - BCM59054 has different regulator configurations for
> > > revision A0 and A1).
> > > 
> > > Check the PMU ID register and make sure it matches the DT compatible.
> > > Fetch the digital and analog revision from the PMUREV register
> > > so that it can be used in subdevice drivers.
> > > 
> > > Also add some known revision values to bcm590xx.h, for convenience
> > > when writing subdevice drivers.
> > > 
> > > Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> > > ---
> > 
> > [snip]
> > 
> > > diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590xx.h
> > > index 8d146e3b102a7dbce6f4dbab9f8ae5a9c4e68c0e..fbc458e94bef923ca1b69afe2cac944adf6fedf8 100644
> > > --- a/include/linux/mfd/bcm590xx.h
> > > +++ b/include/linux/mfd/bcm590xx.h
> > > @@ -17,6 +17,16 @@
> > >   #define BCM590XX_PMUID_BCM59054		0x54
> > >   #define BCM590XX_PMUID_BCM59056		0x56
> > > +/* Known chip revision IDs */
> > > +#define BCM59054_REV_DIGITAL_A1		1
> > 
> > 1 seems to be the digital revision ID for A0 (couldn't find the analog
> > revision ID), see [1].
> > 
> > Other values seems to match downstream (as far as I can tell anyway).
> > 
> > [1] https://github.com/Samsung-KYLEPROXX/android_kernel_samsung_kyleproxx/blob/cm-13.0/include/linux/mfd/bcmpmu59xxx.h#L82
> From my testing on a device with the BCM59054A1 (BCM23550-based Samsung
> Galaxy Grand Neo), the digital value is also 1 on this model:
> 
>   bcm590xx 0-0008: PMU ID 0x54 (BCM59054), revision: dig 1 ana 2
> 
> (This constant is not actually used anywhere in code yet - I just
> included it for the sake of completeness, since the BCM59056 headers
> in downstream listed both values...)
> 
> Best regards
> Artur

Thanks for checking Artur!

I guess both BCM59054 A0 and A1 have the same digital revision?
Well, to be sure we'd have to get the hardware, since downstream doesn't
use this value either.
So I guess the patch is good as-is, we can add known IDs when we... know them ;)

Regards,
Stanislav

