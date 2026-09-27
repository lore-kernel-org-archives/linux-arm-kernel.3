Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16F5C98338
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 21:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+JP+LPdxc4vpdnaEOF+IpoVDd3fTmu6ZNu6gMPY2s8=; b=jRLh4lPLSOrxj9d1L/5ILQyoGX
	dx8nPO1AzLg9eiLlzj44rRPIw714Ve6KDXF/XnV3CLqfMeb8ybZ/DMWWUUGfwgI4ho1ERmMJmNY0q
	ZT+7bSmczHiooKSob4MDAw7svW/0DX4xCRHzw5or8h5e1XGjK+f/y4W6nvcn1EeC0EOhinmUsPwb0
	pl2DQm+3kLwHhCBEoRLwR7McUpXc/1FfiVrFiVqzRDiXQ4AdncZhAPe0NW/3VW4lgS2EP7jO04Qs4
	pYQd0lTSK25l7Cg58kqIixBOn1oXtkiaSleGut3nDzY/9+CEI937Pxf6uxl7D2XzrP+Ui3zNlwUSX
	OcgXovgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw9A-0000000GsGD-0zxD;
	Sun, 27 Sep 2026 21:10:56 +0000
Received: from mail-ed2-x22.google.com ([2a00:1450:4864:33::22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw97-0000000GsFC-3Rdd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 21:10:54 +0000
Received: by mail-ed2-x22.google.com with SMTP id 4fb4d7f45d1cf-6aaf8415866so2614718a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 14:10:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790543451; cv=none;
        d=google.com; s=arc-20260327;
        b=ThMscW8hD9AZ37ErAnelc0NLdW1PiRwv9OkWLDwwwMmKq7UW7OmP7zpKhuErpPD0o1
         mo8uo/ZcXGHsULdekw9GtFIsJTR29vBXXsEUQiOaR0s9VPgoVgDWBmev9evf4tRoSiUh
         5QGq0OrOA0gojixGwzZGZasQmPMPxLf/IsMwxARn8O6iailPcs07kfPwcu4f9MG5+B/b
         J53HRK53OeO4Xjx7lKh00Q2AcPXW7JqRMs2S4JVUgufEdzX7uBimb+75ClbTGJ3zuSDQ
         tPMxki3n/y9uWB/d2S/sxXaquOCb0u9BMWQ88Oe32Lhf4xoDTeY/wM7jHyMT0HauxDkO
         sXMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K+JP+LPdxc4vpdnaEOF+IpoVDd3fTmu6ZNu6gMPY2s8=;
        fh=1igTJLnEOrZZdvk/Wu7M4Q47jVPmnSMfQEvhwtR+blU=;
        b=NaQyYVfGM+Q4ErfkLd9/J6AgxUv4GENKwy80wGXvXqoFW3hnqFCQgSdEiGC1MQcF1B
         ABkA+G8tbRZR0j6vUG8OHWZF37LGEGWf30TSJAKeADzZrc4Tmx8jQTi04sR433I8J//I
         A8PUVBbM3Kv8Cu8c1oYnXQFhWumKNdO6Ms0lGjUj81VsuITr8zGz1rc1L7uc01aW3kcF
         08GuQQz/zLNe6O8Qe/dU2CKKvrYszGY7otnajLVVGFtoHG1PXdbEuXM+ctyg0lrteBPP
         lTEibflwLGCkYJ2YfkmrgsGYDoLBJRynkE8HEuwC4o13pBrGlYE+DMXP0/W+XD4g517Z
         Di5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790543451; x=1791148251; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K+JP+LPdxc4vpdnaEOF+IpoVDd3fTmu6ZNu6gMPY2s8=;
        b=SzX5vey1pELBR2OfIK6PKYohnLYwGzZWE2MjCBKxobmAdaul8kuk1iWLEEXYQ4n32r
         his6sZsYt7W611RpHA8LFBpaFDiHND/g+2UXxQt1S1QaUF9oAWo/68OmfbXa7euvff1a
         CLS6mKhth9hgN1Xi8Fb6DFONTloF/MnFv1rOtj/U9e6m3i+T1TJPXZyj8nul0qt3Aqac
         LRB1flxFFPd1EaQv85j+KQ3BzJ4/cAo8WLgkiWguNg5lcIPYVE6rfjpyZpL0UO5Yf8j8
         ppdnoB/T1LaIyCjU8w9KnA27fdMETaFNiGxmHgzdrTIbl0dS/dfKkIxnb3rKRLd4iGXm
         rBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543451; x=1791148251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+JP+LPdxc4vpdnaEOF+IpoVDd3fTmu6ZNu6gMPY2s8=;
        b=JwFS9Wt0II5LplT4brh9b8dZjXrLxZBwlvkfwcygC/tDobyPZmqzCCsdsm3/r2du/t
         HQEsHHnjZmwRl4Q65nl7CCNqWx5HVsrTJ8bzCgDxRzKWe/uauryGRvz9WU89BbXZg7RI
         y6TmVQURwJCN5TtaNswxMGI2jLRl7mw2wtCTuUWOa7CUpHtDBvLltCjqEIGoRCvddBpo
         UUuQ7daOC/y5vpGqg4ga7F5uzGpAv+MJvARqXLcdqL5TdSUBgX9yceGk1WRWUFjFFwmQ
         e7nPKfmtlQNVcpJZnyYkksIQqIC6nE37IFQLisZb4uTbU1dXaFqYvhGVHMo7swgZXV9m
         q/cQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnzdVZLzOpyv0hy2emLwsC97ebxbqhVfYIYnvWnqwr3jry+u7bGLocrbCfEXtFhhRoHsxFrYeI1qMET/r6VUF4@lists.infradead.org
X-Gm-Message-State: AFq9FYLCKH6OQWsR69PIFm1PcIX095Nat6Sh+lKKNUFS/dudHmO+cCAS
	M2oa7Pu0cbrHWdqvaukwF/Mte2WSSAEc/B5JaHV/Uk958l8l/KGgTdrI4S1L/317oXP5Z6VGPTL
	Y9viC4dLfswyqO6+rSO7Y2smjOqekZNs=
X-Gm-Gg: AYBFou2N4+bR0PUnkd10C6K3Wn9K6RpUExhzf5kG6wzn25AjwPcRhAztP8YK2tER3KA
	8nYF5f72+O+4UFScJiEhyTSy8B/WgC99UNsFNZgR1G55xdlr5jsP8n0mHxvbJa/eNQGSL1W7tjo
	h2QZtkKhbOlhV+GPGyrRcw9eY7H7E6lRXbyL2yXz50DdAHxD9mwO7HFIwbEVDyUN0jj6hM61Nub
	kiRR+IIMnSryIh2krtQPfaSeXP8q63W6vbP+kz/qUMlVEfGUo9L5GzxeYg3DjVTJuhhKwPeR0D9
	1DRJ0XBhr9gOYiA5ZKiNY5JMiM7TAkTuTRLo/HSvcckjzm5vuUTp4pxod04YtA2kbAXdLFg0x3L
	jU1FCrUh/DAS3bOOXjBQjAQn7Ujl30kz4S7CopYTT5WyH8zsIK/wukR2OYDfOQntir42/r3yUzA
	wx47rygxbvUVQSJCdHQZd8ctFi8Aan09sgjAVNctcAPr2iAyCpRmQ59T0pC1QldU/VNg==
X-Received: by 2002:a05:6402:1e93:b0:6a6:37a3:2b0f with SMTP id
 4fb4d7f45d1cf-6aac8ecf40cmr8425968a12.8.1790543451233; Sun, 27 Sep 2026
 14:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260924233831.127617-1-rosenp@gmail.com> <feeed1f5-0e82-4b6f-8640-f38f3a892d20@kernel.org>
In-Reply-To: <feeed1f5-0e82-4b6f-8640-f38f3a892d20@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 27 Sep 2026 14:10:40 -0700
X-Gm-Features: AclHuK9nXtwhKZKT8OEvWTXnJF3sAiZwWnAZputjHhM41eg1WXS42W-4ztR4xkU
Message-ID: <CAKxU2N8JeJi=cNkXKKdCS7HChvhGHziCTz3j-wm27Nr04RMD-g@mail.gmail.com>
Subject: Re: [PATCHv3 0/2] usb: bcma: control VBUS via a regulator
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_141053_878029_55203A7E 
X-CRM114-Status: GOOD (  16.95  )
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

On Thu, Sep 24, 2026 at 11:54=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 25/09/2026 01:38, Rosen Penev wrote:
> > bcma-hcd currently drives the USB power line by grabbing the
> > undocumented "vcc-gpio" property from the controller node and poking
> > it through gpiolib. Besides relying on a non-standard binding, this
> > cannot work on boards such as the NETGEAR R7000 and R8000 where one
> > chipcommon GPIO powers both the USB2 and USB3 cores: the two
> > controllers each request that GPIO exclusively, so the second one
> > fails with -EBUSY and its port stays dead.
> >
> > Instead, switch the driver to the standard regulator interface and
> > express the power rails as regulator-fixed nodes bound to the
> > chipcommon GPIOs. The regulator core reference-counts enable/disable
> > requests, letting both controllers share one GPIO without conflicts.
>
> Please use standard email subjects, so with the PATCH keyword in the
> title. `git format-patch -vX` helps here to create proper versioned
> patches. Another useful tool is b4. Skipping the PATCH keyword makes
> filtering of emails more difficult thus making the review process less
> convenient.
I will make this change going forward.
>
> Almost all your patches for months now do everything to escape my filters=
.
That explains a lot.
>
> Best regards,
> Krzysztof

