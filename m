Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33201C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nK6JLqXHLE++uLnREJ1y7gZWvzKk3Twpjsn+brZ9AMg=; b=N+3faW5F8pvp+9DYxdMD9T3P9m
	rQTQvNb1GgPcDP64XnCksPe4juOUwkCm6UAj0L4SZHGtd3eSzpY7LW6+OjP5rUMNVhOsr0P6AJD+r
	aZvAzds15M72llD9VYmcNlD2PT7gvQHIhV6t89eUq4VKcXEl45EXBGbJAK4nSqfselUJRvB+tqzyC
	SFDGg9jypkfzMzt8fGk17FdAWkK6RWYBh+YhW74LP4UgOGOou6AyhBFTYaiQE6Gf8L4SHLzoT7jbB
	nDDBY5FjSEBwVq/qITCZG2DirX9YvcQMJqKT5SK+75dZMSnsMc7hz/NVOsaiXrnXTo+1DFdcY2FVw
	Hqh/EVAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vsp-00000004gYI-1ldw;
	Tue, 22 Sep 2026 08:29:47 +0000
Received: from mail-yx2-x0f.google.com ([2607:f8b0:4864:41::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vsn-00000004gXO-11R9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:29:46 +0000
Received: by mail-yx2-x0f.google.com with SMTP id 956f58d0204a3-66f943b286fso3443257d50.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 01:29:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790065784; cv=none;
        d=google.com; s=arc-20260327;
        b=ikqAzB+Pb4t4EsO3Cpcr8txCp4wJ+3xw1f3T7korDYZxHBtVUZTnIWxveJScdm5Zj2
         fXW65D902NMgbvBu1bdRuVkWprhDP1M83vOQvybhGkgzXB1ltfsGxUKnm0dCOeafYRLo
         BJKBgZ775OCevbVLIF+fGjET2ryRqPMHDE5vIIvxQVTPangwvnpxNmJQMBDLaz5v3dZ7
         DUyIJeCtqbTJLAUY7E53VjhQgAdXnb3PlnI9K2oQKxiUr5Gg5w3RpGTtQLUTbADQU3ne
         ObgLQhT91+6kVQPZkdKUCyPaO8XNyCFymUrvuheoFvYxje1hyLgeaj7rdCeVZfTfYMrW
         eUmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nK6JLqXHLE++uLnREJ1y7gZWvzKk3Twpjsn+brZ9AMg=;
        fh=nWgj3VIAPvFBlYhiGps3RYhj4WCcV0dRGQDIuYn/9Jw=;
        b=kBqhmQGF5Kh4Msg/P1uMFnh6zFl/1OShSxAVFzLgzbMBL5JeCAAP6mdnrK4Fg8wxB3
         2l1b4Ro/iA1JbG6uKxCdmD0XgV2JOKjK5AM5gmA9C+YBdakhXhHKY644dMjDFKBo1fuO
         FzC5SB/fIwuLWmtJh17BsTh10m9AmswP2tddqrMFikluKoizx/KlbqnfTR7CoWx2nLUz
         T08wbQUy7adyIpOgyL+a9FMBwg3IPf/g+5lmidPe3yRqOa5OZWYgqKbOXYHLWkhsfKuz
         SYP5B6W2TDMaOfZngQyvi802rcR3QVTNbcFg+r7y1myUMRRVRP5fQ3pvkS2TRCF3XRem
         wkFQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790065784; x=1790670584; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nK6JLqXHLE++uLnREJ1y7gZWvzKk3Twpjsn+brZ9AMg=;
        b=GH5MM+1M256ZH9Oqnu1pOejQ0NYPbNILNhX/HztNptKXVJdAIpTI8ugUlZMoHAnpoZ
         2oP7/9lYFtKdL96n8z8MAe3jh3+gJ3ZtTv9+DRtw9Yd+hzJrfuKr9vRTklghsV8IktAG
         C8XaifdcgKLrZhobnv2crsFpK++D0DE3yQwxlVYGcpp6dFvn+QyWS4SYh+8YgQJnzYFs
         rmBdU99IeqJQfp9tYpTW+zV5V8OcJGWqs2xs0NBB/VXkYpwKuNYTbTnHCVxmGPP/6ZlS
         ZyXyRi6PgG1dCgv6sLMGEfdJ6u0DlTKNGn9APOM1+NANVq7Vu+p3MPlCWsggUKCYlWzt
         ed6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790065784; x=1790670584;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nK6JLqXHLE++uLnREJ1y7gZWvzKk3Twpjsn+brZ9AMg=;
        b=qrOtIn9F2gZSiyuluV4CxhElsnSCLWNJHMGbAY/MeAJoJa7MFeLBNO0z5Kuuuw9824
         czfqPF8lBaiWkuIZWWGwil9xqR2fAXjq4Ix1ZKG/6acW0oAFeP0k+F320G4ikvyO3xZk
         3fz56MSbCY0hnNBmtCzsPbJ/7pcaSetA533OPBpSPX3ZKBCE9DET6/7fQZbz4bwldJJO
         TIskea/5s7LKyq4oWKi7EL6CvyoJYT8dWy8PTCAL0hd49KnfQ510FdeajBl4Qtmx5DhZ
         +C1AHZPnBEdYMch5hUHUozDc9VMSDnko8/1ROi/T4GX3In+7RWpw2L7v8F7TygHO6XDk
         5Edw==
X-Forwarded-Encrypted: i=1; AKwUvBzgXN88vU5W8T39o6/cUadTJJHuxrGhn2+mGBNbZj5kjgQeKo1pvXI1Mlq0llTG7axFqFHcuWM2qCeNxQ0iBk49@lists.infradead.org
X-Gm-Message-State: AFuF++l5is/4Cv3upK/f1GfiwmKO0BCYZzu4JlKUf3dUdBMWSngq5/I8
	QAKZSBqiIeNQX11Dykb4v/SQDlEUE6SKYDKD2bVAVysKZro8YTTgzp0+AST6Lt42+9O3gGLlJAS
	M5zKF6/TL0Y+zawaCsYQ9YBvo0L0HIFw=
X-Gm-Gg: AYBFou09uuRSaQsUtX9JyqR3uoI376dS8NtmZXqjnIAoDaLWe1CvHZDSXntQIMOEMI+
	ljGUPosjVkXsllixPsY7Jt5SoDCaBXKeCKa93pZp+WLDWaJ5iqZ5yrqMYBdYR9EB8WsDEHDlKnq
	jBXRrXRx7jThmD7c8TEHSrnifCoXIFyuw1ZtsRvL2f5/MkZ1CO5bGxPSBGwLzlMlc+0Jy5jgROF
	6Kr7aM39r83j3iPlkNwnF+eWc3HwrEv6aAqdDQKig0rXMYke6aOLHGZbH0JNxC7humkkWiwLW3F
	Qvhg3XlR12sxvSKS2ZwU4aL/IHP4qxZWbPRKbuqf0+Hx+ludM5cxz7klsg==
X-Received: by 2002:a05:690e:12c7:b0:671:45a4:b282 with SMTP id
 956f58d0204a3-672c5517fddmr641742d50.99.1790065783701; Tue, 22 Sep 2026
 01:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260921110909.370945-1-lgs201920130244@gmail.com> <20260922074137.GG2348773@google.com>
In-Reply-To: <20260922074137.GG2348773@google.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 16:29:30 +0800
X-Gm-Features: AcwNN1Vv9ooUXHTfX-8aKzoQsfCH4263yxneaXbrNlAHKNAqe0WY7gylNd9nMJc
Message-ID: <CANUHTR9B84LoCjOtS5N5qGO0KXSXUbZkrKZ3_GFTwXmVoPQ0SA@mail.gmail.com>
Subject: Re: [PATCH] mfd: ab8500: fix child device leaks on probe failure
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, 
	Mattias Wallin <mattias.wallin@stericsson.com>, 
	Ludovic Barre <ludovic.barre@stericsson.com>, Alexandre Torgue <alexandre.torgue@st.com>, 
	Julien Delacou <julien.delacou@stericsson.com>, linux-arm-kernel@lists.infradead.org, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_012945_293433_10D3BC7A 
X-CRM114-Status: GOOD (  28.79  )
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

Hi Lee,

Thanks.

On Tue, 22 Sept 2026 at 15:41, Lee Jones <lee@kernel.org> wrote:
>
> On Mon, 21 Sep 2026, Guangshuo Li wrote:
>
> > ab8500_probe() registers MFD child devices before completing the
> > remaining device initialization.
> >
> > On AB8540, the main MFD device batch may be registered successfully
> > before registration of the cut-specific batch fails. In that case,
> > the probe returns without removing the child devices registered by
> > the earlier mfd_add_devices() call.
> >
> > The same issue occurs when sysfs group creation fails after the MFD
> > children have been registered. Since the probe returns an error, there
> > is no later teardown path to unregister those devices.
> >
> > Call mfd_remove_devices() on these error paths so that MFD child
> > devices successfully registered earlier in the probe are properly
> > unregistered and released.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: cca69b67b3ba ("mfd: Export ab8500 chip id to sysfs")
> > Fixes: 9c717cf3fa16 ("mfd: ab8500-core: Add device for new RTC version for AB8540 cut2")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/mfd/ab8500-core.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
> > index f0bc0b5a6f4a..e675223b6023 100644
> > --- a/drivers/mfd/ab8500-core.c
> > +++ b/drivers/mfd/ab8500-core.c
> > @@ -1220,8 +1220,10 @@ static int ab8500_probe(struct platform_device *pdev)
> >               ret = mfd_add_devices(ab8500->dev, 0, ab8500_devs,
> >                               ARRAY_SIZE(ab8500_devs), NULL,
> >                               0, ab8500->domain);
> > -     if (ret)
> > +     if (ret) {
> > +             mfd_remove_devices(ab8500->dev);
>
> What about switching to devm_*() a.k.a. managed resources?
>
> >               return ret;
> > +     }
> >
> >       /* Add battery management devices */
> >       ret = mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
> > @@ -1243,8 +1245,10 @@ static int ab8500_probe(struct platform_device *pdev)
> >               ret = sysfs_create_group(&ab8500->dev->kobj,
> >                                        &ab8505_attr_group);
> >
> > -     if (ret)
> > +     if (ret) {
> >               dev_err(ab8500->dev, "error creating sysfs entries\n");
> > +             mfd_remove_devices(ab8500->dev);
> > +     }
> >
> >       return ret;
> >  }
> > --
> > 2.43.0
> >
>
> --
> Lee Jones

Do you mean converting the MFD registrations in ab8500_probe() to
devm_mfd_add_devices(), so the children are cleaned up automatically on
probe failure, e.g.:

-       ret = mfd_add_devices(ab8500->dev, 0, ab8540_devs,
+       ret = devm_mfd_add_devices(ab8500->dev, 0, ab8540_devs,
                              ARRAY_SIZE(ab8540_devs), NULL,
                              0, ab8500->domain);

        ...

-       ret = mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
+       ret = devm_mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
                              ARRAY_SIZE(ab8500_bm_devs), NULL,
                              0, ab8500->domain);

and likewise for the other MFD batches?

If so, I'll rework the patch that way for v2.

Thanks,
Guangshuo

