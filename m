Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC51C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nobZfwyZD6U2aEzKHUENEfOz31yDjT4kqI9cv2dNhE=; b=I0+8z3nRfIZIrPo/2hTGrV0rH8
	hm2CH4X24O/St8kn8Mw+L9OyjCKz8imPB8caA8OT9rtdGGeRxk0b3iK16GE7pt/1knGp8mSqPTTW/
	OIyCBEIplTy9Ogga1DZp0/7QODXmzGTrYGIE8sd1jpjy53h+mxwyV7Apk1RGzJOaa0TTWFijN8IW8
	eibWv8/p2HemnBu7uxB0QaKWE8NktzEZZwwlAU56eHqSKWP5fpNgSmHfNtOlunEQTSGlCoyHqODFD
	zNuuSfMFaQdcHxzzyNYzQIhWLrySXAC8PqORSsfMiUnm3iE1nxMj/ThGhQR3oyCw/ZLMyvXgWKZa0
	Z1zjWLng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SrE-000000061Gx-0aIc;
	Mon, 07 Sep 2026 06:29:32 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SrC-000000061GP-12BR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 06:29:31 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-9399798ca61so179922685a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 23:29:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788762568; cv=none;
        d=google.com; s=arc-20260327;
        b=DeZ7KdgMZ4E1hLH5aePquz48Vx1Lab1q8RtzHTDORv0Y8htKdC3xVPbWnimeltTKZq
         r1l7zK0nxYxTfhhsO52Fn2SYcVwO1hW2AUNSY7Z26wsOpA4aTajmLhJpJgEzw9oMDr3Q
         bKMK6nlGaTGl2qxCeHRo4U8bPG6OFJNl9b7Wcm/TCh/EmMV3XyzAPOJoofdZmYgr88xI
         NOAUgBdQKRyUQhSQ6n2LTFUm5Xvq5ZCI1ykqBgnvTm0b0ybQieFMzfz0+3OP0vnQzfcN
         BSDMkDuJM2miG64PwKerGcD8wAtNfkHmKR8L4sStNSM/BwIbV/FwRQe1Lsc8RAbUm+Ta
         qhSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+nobZfwyZD6U2aEzKHUENEfOz31yDjT4kqI9cv2dNhE=;
        fh=Fu2K7JRpv0SzSGFEoXNY1+Lz6YG5Vw+jeZT3rXGJbew=;
        b=JL0tJgvcC+bKHp2OjWXM5usO9GuYqsl07z9LQIoDNkt0gMeTRlxiNzSe7W48+OQfX1
         IW1GXIvFYU9OnxiIYfMzs0pvsScD/Texf035sDdYUbOZSfteP970i/OSEnIx1LsBVSCf
         AVlj4lWIKOuC0NQKn5Rsq8YKb46Mup85r5Uguep5XVMhTJh6j1N3/y4XAwjSDj4Fqbwu
         AZ5rBYu4QJOfQcjBtTgptTBGI5z7C3NkMASfQXZDzyJ5bHcknF7q/Fai33Fl2XwwGWtE
         oaQa5K8QKS2YicqrVMVHwiqMoprCuoug2LIx2r7Bica675jtD6k8/P7tQUSikrB5BYY/
         skvA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788762568; x=1789367368; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+nobZfwyZD6U2aEzKHUENEfOz31yDjT4kqI9cv2dNhE=;
        b=qo1Vyqt8fgZCc8Rg16Z7XS9Imn6WbFrbdU2OBdh+h97dWpZgeUQzRYQRfHbuF+IHk+
         jRxOINa8QtTyZdTMldh4YS9msl2oxwG2j4lvhJM/XHPuGjCOwUO9auuovDqOWqw12njl
         O9tp9Z262C35TrHroKkTNkFv8YwjbalFW4UN+tVvibqZOBjt0ODcIdYZPLG0whGTkeWO
         wrXsuyX0UNkSm2PwfA3MJOL89MJoSyHzLduJ2D61QpsxZqU5gkO4fOL94Z3Zu8CCEtKi
         poxKAYpUqNayrILqtPQa1SNL7jiJkHjnvVNTOzmidtswr9hdtY/QrI4DFX8VBdP52blP
         D/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762568; x=1789367368;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+nobZfwyZD6U2aEzKHUENEfOz31yDjT4kqI9cv2dNhE=;
        b=lBB2fH0p4tuTvvgj4EhUy3TGhPSI4tQed5vkX1P7CFzoimNavLewPE2yyvk5z+vs7Q
         +svXKdz8Q9Xet8P/t9ZfhS2fLWX/kiQyAfKCp0csPMuBDM3LZ7ju1brG5HsECyFpw68j
         OyU7ozVDoowF9yygZaRYNYAqlM+p8GbOjM4pWAgYrEEkcDLZNhrG28LnOjhzRm/hjjo9
         +3rdU3+lDyYfR8xl9yCT3YLf+M0LxAEG4QwNSRVDAPL+qerIoXecIHWHnCyOl0Nsqgf0
         yDflsVKyvqhkYaxmlBw/mnVaLH748O0xeDqTaJxSOwM7bZD31BYXjG2iipeYP5myG2fq
         GF9g==
X-Forwarded-Encrypted: i=1; AKwUvBy1dex1TldbGalKOp3etgqhgxmoDjUne45W+kQnRl8S5w5x+5EwUQzA9R8Zzeg8sTwmfr1MgDpbqE2CAKCnbnl/@lists.infradead.org
X-Gm-Message-State: AFuF++nXlpHR+Hm0C1cN+duD7ATVP6Tz1MVhBbk633EvjtYPRnHLqBUV
	Sl05yzKe6MkbWFtef/WX9fhxW2CCvj3wyKpFqn+Ts7OGZ2SyV3V8+zWpAMmNWxsXobYjLh5FseR
	hPGqdGzGRaqHSnr9LklBoOncMQKFazZYOaw6Fg34jFQ==
X-Gm-Gg: AYBFou1jlbwwKBF7+Okd0tg83e7/KUyv9Stowxc2PswhiE7gHBxttIoZ6dM/JUouekL
	M504bFri/7Q9xXUNEdKBxMMqzNrAZ/Umvo1do1SL6xgEn+99/ujgkdAzFTt80l8unuNSlnjng0z
	d7nVkNoj1gHex7umxQJZ4BraTxzyPiaR84+TltDk1Tg2ctaHBOGK5tBSHkawaHVp636W01lNDBh
	Ot5L06My7cs7WqX1gnqZSM6NW98beW6KpCgF0zYbU6UvcQG5t9xGwkMkhFWC50L1MLqgg1ISSS6
	b6cTZq5irGNBrbWrnxYYiWcc6Sk2u1qVXzxJ6XAgjUd5OqOAUCS8fWh9iOIzk8n3Q4eIfYcTYtY
	MIVQ=
X-Received: by 2002:a05:620a:3943:b0:937:1097:feb8 with SMTP id
 af79cd13be357-93980426539mr2131110985a.24.1788762568248; Sun, 06 Sep 2026
 23:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
 <20260904-acpi-dma-v1-3-0fcc63d65d4b@thegoodpenguin.co.uk> <aprZKXi7h1prHZft@SMW015318>
In-Reply-To: <aprZKXi7h1prHZft@SMW015318>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 7 Sep 2026 07:29:17 +0100
X-Gm-Features: AcwNN1UZJqTHPp0gVwDMba9SMPF841uiWsVn6TpoKEJcXyrTZ-unWt9lXJsg64I
Message-ID: <CAA6zWZ+8=sS1JE4JJORYu45xt6B6VWsf9YXBi4okk_2TdJNUuw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dma: qcom: use named initializers for acpi_device_id
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_232930_542547_8C77D44D 
X-CRM114-Status: UNSURE (   7.53  )
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

> Remove "While we are at it".  Unify the list ...
>
> and wrap at 75 char, check other patches

Ok thanks - will do this in v2.

