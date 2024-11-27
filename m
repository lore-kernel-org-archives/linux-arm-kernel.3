Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66924D609CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4ZFZN9NxmPUE6vqicmzpkTPnRTjKFXzlxg+bLBGC5k=; b=HltpT2bMhlmhZM/DWHDVRdwJYc
	282aHg4p8xgVqjIUj63XSA//uGHJFLF5exWoaJpwxihmT3gKUNKjcF9p8tt1909Gf5em//uSCQeOZ
	dtdRF0y2JV7ex5C68YEbEZ9PdYI5l/VXk6buVANZO1ZIISS/HqxbZYriOvREcKdD2vD0EJgXgt+fM
	mk64VNUcoQ8e7alqM+nn3fOa8YFviFqpRPC/FM0AntzRd1Qt2BUb8iHX1V1Izqv6NIOQLqff1TvUk
	ASs5Xa+ar4Z3pmVoMdQ28710uYLcs3FxBsyS9oa9sUyOICuRAySqQ8LwKrJBCQqzQqI7vZtLhGfcw
	LvqY270Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFAa-0000000CpMM-2WxM;
	Wed, 27 Nov 2024 10:21:16 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGF9D-0000000Cp5T-0YSK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:19:52 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-6ef4084df4cso1910337b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732702789; x=1733307589; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F4ZFZN9NxmPUE6vqicmzpkTPnRTjKFXzlxg+bLBGC5k=;
        b=d4aVZbvFRVFR7GVSx0P6jVdo7hxgM3y0Y9rvf1Yb35xH2TC64vBlkZI8nfAt6+0AqD
         fbILCnlFannOo3EMHzSOmqHq3C06yy8Ko/YnHjPtZYTp9XxKgA/kxHUHnH2omQsIYo3Q
         m7wH6Nx4TjcSpp1BjFWSz5hSkkd9SzLe+qAaheVSxqwowAYFUBHnez9RxV5Wriv94zSc
         JtbqQwgPc82/wi3S+jbxswMfOuDPeOA/QP8xrKkgsCjsNyurqrYe6nTcNMoDV21u1Cug
         6+w5IgcRvizbB1DoO/EL1GHQF+Mct6tuANIzJwcXkrZepLtrS4kUNYb99x8CccXQXfuP
         HP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732702789; x=1733307589;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4ZFZN9NxmPUE6vqicmzpkTPnRTjKFXzlxg+bLBGC5k=;
        b=HwkirrTU15yQP/SQNd+u6z0yPiv7zABC5UbDYtNwtJfEpIQzZkrwjYodZ/Pyhu5chS
         T8r9jLVbNC4ALajh4O3m7JFgHUOWjlodyM/DpGRWgBWIWUvBXICQuEhGDerxwR6y2hJl
         cZ5piOAezO2GRzmOHpkJstrRevriIh75jOue9ILi0jL8RtlJnsv/5psxEU7SejpVe2ev
         ndnD9maLTWljZfXpvdwcwy58boCBr0QdT9Y3k5PHNqiIemYOCQu3rRWJTA8TSFivr40a
         tDoz26EC4Lf28V+hWZyRQ2Leftdq/eM3DmcTtATzo5QeeDYhfIKzo58FcTq1z63KlNDX
         RuEg==
X-Forwarded-Encrypted: i=1; AJvYcCX865N34NbhvnpJE4jxS1MCwZiaG9I8szIMu1qExl7oE9fNXJm6nwVQ41Zp74m6xVtpARbiyPne0u/rs8uxdizw@lists.infradead.org
X-Gm-Message-State: AOJu0YyvKapjLftNvor7/lVTtQVphdiigCeG7WA7aFz0ojrmRkv9+8X9
	SSOuL9hUdicebntckrMri4osVri5eW3E8zEXmlv3oygdqWoSayzYxqjUukxgMUaiojjXOKV92cz
	bUmu33gq82oVS/bfPHYo9NeTKaPU=
X-Gm-Gg: ASbGncuzhESK1OOeqhOuiWoLBTgFeK3ELAe6USl/xvVEVkGhSLT/iJlR6TA8ITUsUN9
	z6WSTFWw+YT7L5mxHjuGquV+JETKhTAXx
X-Google-Smtp-Source: AGHT+IEYW50AkDoUBavXeClBq8yM9JWwAWazhdC2aIw8o67QfCzF5n/O5RVYRddcvSnH0Wwfl/8Zz40gZy3rpxRED/M=
X-Received: by 2002:a05:6902:118a:b0:e30:8440:8162 with SMTP id
 3f1490d57ef6-e395b8c279fmr2534137276.28.1732702789657; Wed, 27 Nov 2024
 02:19:49 -0800 (PST)
MIME-Version: 1.0
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com> <20241126-z2-v1-2-c43c4cc6200d@gmail.com>
 <27amnmlm52igidlv23h3d3bvaezbdumedfkqicbtreka3llhqs@fafepduxgv43>
In-Reply-To: <27amnmlm52igidlv23h3d3bvaezbdumedfkqicbtreka3llhqs@fafepduxgv43>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 27 Nov 2024 11:19:38 +0100
Message-ID: <CAMT+MTRTzPwo7QveP5Zt_4Zycu1qohe5g8srC8O8Jo+O+-wLJw@mail.gmail.com>
Subject: Re: [PATCH 2/4] input: apple_z2: Add a driver for Apple Z2 touchscreens
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_021951_168030_3DADEB65 
X-CRM114-Status: UNSURE (   8.62  )
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

On Wed, 27 Nov 2024 at 10:00, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > +             dev_err(dev, "unable to get reset");
>
> Syntax is: return dev_err_probe, almost everywhere here.

Per discussion on previous version of this series, input asks
dev_err_probe to not be used.

