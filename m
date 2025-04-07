Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93B4C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 07:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zclVBcAH8FQLUCLJiKJqGovQwhajw/4BLJO78dfjJIU=; b=N8vmsuas59NM66XLV6c//DChWN
	MyL8GAx7Gbl8MKOAEmrti0Nn6kQbEhrGaQbaFQcE9DX7krzZxQLFsT2pBdqBwBYzOE+PLwlqyvGjG
	oNrf9fgP0ScS0Sughb8zsiCR6n2O0Nvzre4yMjqzPsIYGPwhCTaUkMo7E/AHZbLjH96v2C9BY36JD
	pDgt2OyiGvBrZmNGkpR1N2hiTX7DSsQ7IJ2NpsnMmtwitrFZhxxcQU2+wPvJyH29yOlzqnRMwDrLW
	Yt0YzG7BdvuRAqtfsRV6cK2PZiJayT5uqqD4XmeVjU1zM/vwOaJiL66YQMKytZAu6/hY0oVmFxsh5
	/2XyyIsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gUK-0000000Gf5w-3QuE;
	Mon, 07 Apr 2025 07:01:44 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gSa-0000000GemD-0Wyv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 06:59:57 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54963160818so5000363e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 23:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009193; x=1744613993; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zclVBcAH8FQLUCLJiKJqGovQwhajw/4BLJO78dfjJIU=;
        b=2BuBkD5pe+Q2UTJU8Gc8DrHdyiyavBWNOcCqwYnvSCQrFgiFR6s6HITvVNJVSVVOuU
         MmQSclGORYNW/7IRgsFLzZt8BGzIAAkIXov7YumTkW85ualgwEydU4hvaVt02KcANr45
         e/Uxitd8QMmkfoWAfBKbjl6lQDnVZMdZ98THKbTm5b6XSk2F7G16p9rYfyYoEE9hPtVO
         3HJd/PjPH7B1vKT6K8cOuw4bxcjmZt4V/v/Fb/TjEzR9lfj0nPgVHWXH0Y8V2PaNFqEL
         wOhG5kchUwRDPYSYoFJwrrN95+Ez3CArJtTkHsaHV35g74Nge2hoYeclP5nSXAKI3Sch
         7szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009193; x=1744613993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zclVBcAH8FQLUCLJiKJqGovQwhajw/4BLJO78dfjJIU=;
        b=vyluH86HQM10B2mdQRu2SBDPk9miNlhjjE9YADoDxDMSGlcb0GNFJt1Vky89LDZH8/
         0QB2DscBYnyay3AmVDiObBUfLHCaxv7a1GJLU8pJq7RuC2ecBMw612wAws/LODXgfrcp
         USgc8+e+kd8UY7shWlTsiYnMr6+/wC3enfTjCtGIrD5lG4GQCKqqlHf4wyp/hi90lqOn
         phRhl9Bw/e4AVmFjaO+IspqrZrcO1NWP9Ijlca2orouynhDn/HBo4ijyNoBnM5vBjq0d
         EC4yOTKxgFvH/+H406DOUvZnr4GduoPy2Teg1dA4LKFGMPfnViK3E8P1exfKG6AJrIko
         Sz8Q==
X-Gm-Message-State: AOJu0YxCB0ayFaUBVhs6ND+2xPJkADY0LN+J3+9RNr4bqge13J4Acbf5
	VZp/W+X5cP/Q/O8t7XBi9zUA0w6AkEu3XgAv2kWhxFqdaUYlgtXP63lWRtfGI4GzEHxUmOwmeDx
	RqNSrzkMFkWtj2uS63qaUM68wpeEJbYvIDxBODmCreBabajFy
X-Gm-Gg: ASbGncsh45cn34yeyV1ajel5R6DXCkad/RddEbx2hkEdcThszy9AkbRdG6DYXBHcNVa
	IiAu9D/q3iEw0YnLgvPAHsGhfmXCrSxjdvwNqyKY3IXETkDCZwVqjramj+eo+AYQ/oqNR5kZQwY
	Py+H2ISn323gYXBztiZXDiQT3WQGjXHQR/BrLBNVFSFpMaUNVzte6xyHFN1A==
X-Google-Smtp-Source: AGHT+IGv1uriNC7HzAl+L8w0q6fWjV1SIj4jMIhKs+aiDpdh7nDo2D+RjAXdjN+uWj4LcQxS1M6SDdv0uiDwrLRQ5uE=
X-Received: by 2002:a05:6512:3501:b0:549:5802:b32d with SMTP id
 2adb3069b0e04-54c232bf59bmr2983829e87.3.1744009193191; Sun, 06 Apr 2025
 23:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250306084552.15894-1-brgl@bgdev.pl>
In-Reply-To: <20250306084552.15894-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Apr 2025 08:59:41 +0200
X-Gm-Features: ATxdqUHWFAXkM7nuErogQ0GJfGARsg3Weoa-64QKGoAPzT9SjUAGTJTgsj9Xz7g
Message-ID: <CAMRc=MfFnK_nLPa9vnAiqF64=7Z10bme4xFyOwL-D20FQxDkyg@mail.gmail.com>
Subject: Re: [PATCH] irqchip: davinci: remove leftover header
To: Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_235956_427359_B920B1D3 
X-CRM114-Status: UNSURE (   8.74  )
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

On Thu, Mar 6, 2025 at 9:45=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Commit fa8dede4d0a0 ("irqchip: remove davinci aintc driver") removed the
> davinci aintc driver but left behind the associated header. Remove it
> now.
>
> Fixes: fa8dede4d0a0 ("irqchip: remove davinci aintc driver")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Gentle ping.

Bartosz

