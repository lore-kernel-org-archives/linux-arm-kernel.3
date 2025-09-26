Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839E2CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 10:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lomD+Xuxuqj9y24hSHSejdLLxqkpQEe/J00kIrlv7as=; b=CfeoKq7p4cE6bv2ngjLWPvxAq/
	xVjucC4qbBNQPejkF9Si6DsJ7ohg8g0YlLXlWJUfba+XIDv0wMV15vvZYg0x0oR69qXCvkuZ6MHUX
	d+KL+PJaK/5KkLdKVwUzdni8yt862JmCt1dbFbkTDcKFHk7iIM4/OuZ2aA4enM2rfExESA2SohvgN
	oM+n6LiHL3M9HnznN/mtDIgre4xzrbpJOYgv92WmaX0LA5HiiGAtbYz9JiXl8sLCdSlS7EBGAnH+p
	LmMdkMLozrZ/Gfq7tRGHCb7/IV0sx/xHE5OqPTtoRgViDyw1fjCoxcmlVeUsiipHcfnoqQ2OIsLLS
	BzE5PeNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25og-00000000SRC-2pQ9;
	Fri, 26 Sep 2025 10:36:42 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25od-00000000SOo-2hVJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 10:36:41 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-46e414f90ceso2541935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 03:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758882998; x=1759487798; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lomD+Xuxuqj9y24hSHSejdLLxqkpQEe/J00kIrlv7as=;
        b=gh9O3O3lVLvJmoHuxi0LdSmRp4DOeSoxxy4biYHt/mhjsd/yFFgmai0nxEGMxNRE/w
         tGNT2RAxnoHnmRnxVV4j5p9anWfZp3xED/ppYhYQjh7nBSrmF8amqyGoBbQNa7ei44re
         ylKqr6fQMA7GJOcXiwrga+16R6eXMMZgBmi1Zgc/kNN2DPeXY+2JdfIEyDMuxbprsEAS
         pa2XJzErw41a9njDFbRyoU6Zcm9H0VucgOw9FXqwrjdvPoyd4Ny382oveaLia3JAx9n0
         /CE05LbpaQJRDekHj5y65f5P5X1N8hcYXD1EWYWkDAp9lAjd+EbnX5JMAC4oNTP5jZsC
         MZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758882998; x=1759487798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lomD+Xuxuqj9y24hSHSejdLLxqkpQEe/J00kIrlv7as=;
        b=Lfed+AaBK2TB/mPs85Or8QsLzmzMOPvn89Gg1PUyzYDOsfu1FltrDRkS6L4hAYoIAX
         uXf5rtN4E4UX694aAHqmHDFQA0uL4dwk+L4poXOLh/y1LFJeMwYFypnN//hujU+ScYGS
         MCCygsF0jJEzbb5Q7FAdJqoQQl5YiEs8N2HsZEPQfOo+kPL43wmRYUiXmKjajDnY3gxN
         9DcfJgfOILb7czULhvFAcsfYw3UpFhU/uJmQcvS281GnMWYgrP7Up0IQ1cS2LEJcstYI
         ylNJhpweAK/IiYsFnAwCM0kI4asEFWC+51iJ/YHkHAf7GJjna1o/8qJ/IEuZnGQqzSZP
         y//w==
X-Forwarded-Encrypted: i=1; AJvYcCUs7Z8h4Wfw5ZkcvCZm7EPL0aglYhQhzpFAgvR9tAZN1TUCUq0WjNSIKVF5szIBdXp4TZ03gAkCYVvd/c1JYmbJ@lists.infradead.org
X-Gm-Message-State: AOJu0YycRI8tMbBoo4sM2LMRHlYAbjni4bNGQcgLC4Gpy6nvS+SKTAyh
	Rk1KL1IDzZ5m9tiUMnRZC7KDkiWq23f/bn0+efHm2V0IBu4jH8V2yiFmYTaCz1/5NBK9Ys+uGr3
	0axbB
X-Gm-Gg: ASbGncv2DYrfNI2wytfHg0pt2k2OYjwQ9Y2y6kDHv1BAQlPMwr98S0jXMqXEGoW+Xaq
	GqGX6Yt7Vw6Gr2wDfa51DAZhTShywvucmAlMJpXd6K3IDyqf3JsXsZzUXGJxnhyhINzjxT29hoz
	LVNjA9qhbWPK+w6VJUZ2Nj/mse/owNBjOJHy8TtUabexbATUA3VJDSBtr00jhelF0/EN902tkoi
	g61zhXPfJM9etFr0oPXdl0fm+fRhdqyEXbp02PHi2WQVtMjNXc+C2LajXn/tIJaYsaQWWIKWw+1
	b0rAyZHLqIr3BhJf0Kd4iKxiRJklq8mEO7i8a2F25vDCtVO4lcHMMCptycnx4wTnbmprWnvqGpc
	bThIrQPGbfO+Zzu8I579buDBqBV3b
X-Google-Smtp-Source: AGHT+IGC29jr5YRmvwx+naWkRpMSQToIl13tlE3jIdOdyAg5b4GgkUkZU52lf1rfayXhzJFX8yhMpg==
X-Received: by 2002:a05:600c:1e87:b0:46e:27f7:80ce with SMTP id 5b1f17b1804b1-46e329e51c2mr62513645e9.23.1758882997709;
        Fri, 26 Sep 2025 03:36:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e2ab31f62sm112597515e9.15.2025.09.26.03.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 03:36:37 -0700 (PDT)
Date: Fri, 26 Sep 2025 13:36:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Will Deacon <will@kernel.org>
Cc: Emanuele Rocca <emanuele.rocca@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [BUG] ARM64 regression: NULL pointer dereference in
 arm_smccc_version_init+0x90/0x1ac
Message-ID: <aNZssv1cA_KIMvF1@stanley.mountain>
References: <Z5tuaxgDyFJPAvR0@J2N7QTR9R3>
 <Z5uTCnhfKo5D-_bV@NH27D9T0LF>
 <20250131124103.GA29766@willie-the-truck>
 <Z5zWMU4M_L5k6kII@J2N7QTR9R3>
 <20250204100014.GA777@willie-the-truck>
 <Z6OWxUFxkK9plrm0@NH27D9T0LF>
 <20250206131154.GD3204@willie-the-truck>
 <Z6TqBQKSILZUnYbJ@NH27D9T0LF>
 <20250313220835.GD8101@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313220835.GD8101@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_033639_886065_40D1B81B 
X-CRM114-Status: GOOD (  15.97  )
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

On Thu, Mar 13, 2025 at 10:08:36PM +0000, Will Deacon wrote:
> On Thu, Feb 06, 2025 at 05:57:41PM +0100, Emanuele Rocca wrote:
> > On 2025-02-06 01:11, Will Deacon wrote:
> > > In your screenshot, x6 looks like it's retained its poison value, but
> > > that was the register being corrupted in the initial report. Maybe you
> > > could share the diff you made?
> > 
> > Sure, please see [1]. A kernel built with that patch crashes and all
> > registers retain their poison values.
> 
> Okey doke, at least it sounds like the firmware isn't taking advantage
> of the broken spec, then.
> 
> In any case, I think the right way forward here is to use the
> out-of-line 1.2 helpers whenever we can (the spectre mitigations can
> stay as they are).
> 
> Will
> 

Any updates on this?  I guess it only affects gcc13?  Clang seems to boot
okay.

regards,
dan carpenter


