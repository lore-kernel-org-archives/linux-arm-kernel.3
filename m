Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45877C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 02:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujyD7jgd2uYoNISfol1DV4SvsMNF2Ff35/OcJJPtWQ4=; b=MVDNAFcfraFbktS2CKG3BjWe4m
	aUHRxSqX/Y4z31UL+KqLaeBJZdNN3x29c/TUrAkeNsm9zJJEWWUjmaA75ukWa1vQWfQdANU5pKo1y
	8efO3KJ1xuH4ATaV1QlZwYo1H+ym7CjHvIZbCIAMtK7PP6Bzzy+ZONWs5uiGMMjCzp7YLrld4fZRp
	7F/TlAFAuUj9QmOecaQl6+lFCs9QU9ADK0XXueUvXR5cVtidGQShEhDQy8uNEGVGQubdak0IKFcUT
	stUI9YdUIgZHQsLFVaObGsMan5slLkaKjH3Jh6d+HBZgWELdpghNuo9dfPSay5aLKRQf7e0aO9U75
	vKE4i/4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtFy2-0000000AvRP-3FER;
	Mon, 10 Aug 2026 02:42:22 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtFy0-0000000AvQe-1kwH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 02:42:21 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso1457535b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 19:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786329739; cv=none;
        d=google.com; s=arc-20260327;
        b=PVkgqSX9AleL27MhxzRvkLb6qc1wETY46hqadXkKnVZjOhUd8eHIpcnWQLlb31ZFkk
         GK8FTPXIDMrAsekplBR3lw6dIJhCH8UHndjbubtFWdrrWQPpmzrQA56gpAD9i/XAf85y
         AXetlPOpOKt5aFyPkfj4wpriIpkkR0O1YEnUhS3M8gvn6umdsAtLvwrHQxN+USiDlY0c
         NHLP+wuzBi1QaIBLrAHExTAVXNyrzpHqFo6rYOqOx4kMUPfM8Xq/u/gy9wya2JHCC/TR
         O9hVGhtynrZ5hKHTrw6EX/6SWYWZGlelbT6XYMkpapV8PhhM3L4TWgPvFzUOi4s1r9iP
         60AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ujyD7jgd2uYoNISfol1DV4SvsMNF2Ff35/OcJJPtWQ4=;
        fh=LmMpPIVi9epCtDluSXfKvQTfORl3xlgYPygMaLxjAoY=;
        b=L1EQRj3GB92KgaD+ROKLYU6obK5FDTf/ZaIiDgMo+9E03V/AB2olrmcvLLAGtVAs/b
         hMYRhUxnXm83uGxw80KhdvTKk+FA/sFEWISdXtA2cAgf4nXMbV609jVNF7rwWT7rivCU
         cIL29OBDuvqTv0dh88jeHpkZ5QbpoBsvu6FY11jVwzIVqf774U3/D2uveTGP4enPE23T
         gp38b+sbhD+WjBHmbXvpC6XWp72iTtq5V8BaLXYnB/neNFW3CYfDAYFz3Afwoj+LT/zk
         caldCEhh49Kf8bQncviz2FKjrbER+lK8y4dU6DNWbw83C7eCe2ZZsoQ1mfQwz90taltn
         iUgQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786329739; x=1786934539; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ujyD7jgd2uYoNISfol1DV4SvsMNF2Ff35/OcJJPtWQ4=;
        b=jEJsnlQUirepoWKi5iEBDyJLo19ai4sguibV+QVo9lhpTqLS0iytRVMTG2xXfXy2k/
         JvsJe0zvg/Hz3U24+tyl/bl93f3zqW2xES80r8z+EAk9VjKue+OAgDPtzYXGwaO1ag81
         5a4upbo+dWjPsP2AOJ8ka4Sccsd/GTUxpYW2sNsplXK4yi9PHFu35t4TRi4cvKdIi8tm
         abMmZwhLfcO/DZlGhxtntKD/rT0R4WMLIjSW939HnXnAf8EhYwlZ7O8koX5ho33alYFb
         5oZz0tDoi6+kEZXZZ4whL+D0TtIvNTMk0Z3Jd+GWdY4Yn+89w2IeQ7xt1s/nhbe50Ud4
         6ECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786329739; x=1786934539;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ujyD7jgd2uYoNISfol1DV4SvsMNF2Ff35/OcJJPtWQ4=;
        b=bodTWZOEM41swbC2F7MMj9GS6rRfy0jNJPM7eRXA3r/OTy6EnaxBU84CcF0b0CUToj
         rcf9Z497Od/vbagT3Its/GegOAFsICAKWwSiLzsr0Q7y/kYCwqsO8npbnqrAQ69bHEdw
         KWrYbVPlL3XDQ0pH6qtkkRNioTiOzMdur1qjpOKjrh8vLjs/2OQwvW/iGZzyaYsSru25
         7GvWwHaExjFLbebtDaUSE8+MfbRFfi+4QfLaSKcs7My+SSYQb5g+MOIPEaq9V5GRN/ms
         mkD0o4ljRUr24DMagy4UWyT/jE0Y/Job0J4v8FOtpsnb0QLoTMiFWP5ERV0eCXw90sf/
         uXWw==
X-Forwarded-Encrypted: i=1; AHgh+Ro6HWxSqyDnmxVlsP6NrgJ+falsglmQFdVvG+LPjv+vmoSfslELr4rQ7yHB4YU0P3PlV+iHAVFz46w+42U83cmR@lists.infradead.org
X-Gm-Message-State: AOJu0YwfnUx6W9lNl3Kf0O9oInlC2FaXJUdRSZloQUFOQxHISeJOSrvD
	B1hS+nIYuCPtsaO75TYV5tfxnJGBQfpITTlKuq0cgFWsf+JhBxT2yqy5KpFYHqPQDqYzK6jW1QD
	Gkim13VBLGCFGsHBwijVBguvN2UMJwE8=
X-Gm-Gg: AR+sD10vHHby5SyDevJx6g+y5upThFF2a0azQFUUBy49wbxWUzPhB2hLk8D0JtRyoln
	Miu012APoikqcYHGwz1ihufCJWXfD0GhCRm/eLOwrKyH361pNbZCyebeO0KeyDUHSkNjd32y5XE
	H7AfL6hb8z7Hs+SGckEd8W+Wy3AciFBE6k3NsrNr3EO0ONmf/XJK80n6C4lODtqfIuFxTE9yS8c
	7OLrWMCMsgkO/QD6wdgBknuSlyuMVRrKn3eOkCgSCfnKq/bOMw+4B2dN+6IpWTcRWZz+fi0sEAg
	7S/4Kx3a5LlKENIc4vrMlXpy9cidAx+xjB5uMV9B7myZExU1a+w2+JaDDWLBe9AvugV/+JP1Fzl
	l8D+nivw5TvYqZrhoc2YM7Iu6AHSTYtrHSc8BmAje8kmm9WOa8GSj1wDu
X-Received: by 2002:a05:6a00:1d9d:b0:848:469b:3d19 with SMTP id
 d2e1a72fcca58-84f69700138mr18901107b3a.29.1786329739493; Sun, 09 Aug 2026
 19:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260807081652.38692-1-phucduc.bui@gmail.com> <2eb8b31e-a3c6-4310-b9cc-7acd135b6c99@roeck-us.net>
 <CAABR9nHqKKbxkzBNkENadhFJgC_HuetV+ab7SVsGH+cwbF+OFw@mail.gmail.com>
 <9971b3aa-cb1f-44a9-9d58-4f75f0c6ccea@roeck-us.net> <CAABR9nHu4pt-Rg8Aq0B6KfKFHX+C1xQmMk6=j8jq1Zn-MQ0p6Q@mail.gmail.com>
 <ccd8fd7d-4555-4ac5-ae73-c16e98b8edc8@roeck-us.net>
In-Reply-To: <ccd8fd7d-4555-4ac5-ae73-c16e98b8edc8@roeck-us.net>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 10 Aug 2026 09:42:08 +0700
X-Gm-Features: AUfX_my6zYcbzcH2Wjjxkf8uek_ej0039cVqQTNpkObFSyVFxGT4TjQ-70scvlg
Message-ID: <CAABR9nEGsisuuQhLwxdcB9i2sEuH=AQb3yaPHPNecya8G_5ieg@mail.gmail.com>
Subject: Re: [PATCH 1/4] watchdog: qcom: Propagate errors from optional IRQ lookup
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_194220_482405_60CC3EC7 
X-CRM114-Status: GOOD (  12.42  )
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

Hi Guenter,

Thank you for your feedback.

>
> I wpuld probably implement something like
>
>         if (data->pretimeout) {
>                 irq = platform_get_irq_optional(pdev, 0);
>                 if (irq < 0 && irq != -ENXIO)
>                         return irq;
>                 ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
>                                        "wdt_bark", &wdt->wdd);
>                 if (ret)
>                         return ret;
>
>                 wdt->wdd.info = &qcom_wdt_pt_info;
>                 wdt->wdd.pretimeout = 1;
>         } else {
>                 wdt->wdd.info = &qcom_wdt_info;
>         }
>
> (which I think would be a combination of B and C) but ultimately it is
> POV and doesn't really matter.
>

I'll go with your suggested approach.

Best regards,
Phuc

