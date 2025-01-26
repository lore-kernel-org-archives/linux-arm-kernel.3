Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936F4C02181
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jan 2025 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9jWrJo0ys4LMCpA+l8+62ZIwRdxoDRE9SL/3hnuLgA=; b=JV+aK8LNuDmciKon62PwmEU4Jf
	o4M742U6tgJoeQDi/uDjgvJc587ayKp6lX5ubRwk2CoYZRCmqyS64Wzcub4r9AKa4gb0k2VFI5Cyj
	mCg4k3GgFaFoRNchbTXWeuPegBkUjZnJKzz5J2YQoOuTtegarDAP2F9PGMTDIjkHQzw6lPZpz7R2d
	MmhQZw7ZDvBKtnhh3jL8BgBwp8i4mU2uiBHSHxeWENFJHhRjfwEicCHnE0vGbE4ZdMsEEnIiY2Rnb
	W40mrVTeL96qDPus1Yk4O/fD1mXDHJa1UP7weDupj3OvW+c+SmUKiEVN0nncqMVY9NEHys2aBf2l2
	E7BCMHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc3bb-0000000HSmQ-4809;
	Sun, 26 Jan 2025 14:27:20 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc3aL-0000000HSYj-0hCc;
	Sun, 26 Jan 2025 14:26:02 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so6560107a91.0;
        Sun, 26 Jan 2025 06:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737901559; x=1738506359; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r9jWrJo0ys4LMCpA+l8+62ZIwRdxoDRE9SL/3hnuLgA=;
        b=iAcjtkkC/78GxAPv+OYLkccJXgJSzCU17IINdstF31x/3k4KDAizQ1OkEO3WrCbEvZ
         ZqxYlpH6ovs1ZBlLLxDj6eEuFFNrARrUDloTd5BVVWo4rw1bREEjF68SDVPtGxoPmk04
         08ZSm1QLN+iSFEJp6JMsRvkrTtoOJQUQnckkkTLYrRmTb6O9XurMKTxfy7os/gX8D8sm
         GTmK8273VQJQ4Kl44poB1WXa2EFpTTMRoOI6wpnrbhD3In0aDW9JLxwSCk9YYsHzDSk8
         8+W95mZ9rerheYuDT1Nt7o3cuAsiYU9mtaakFiZyvL349cKgmWSfN49deMUaLPpfycj8
         FRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737901559; x=1738506359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9jWrJo0ys4LMCpA+l8+62ZIwRdxoDRE9SL/3hnuLgA=;
        b=OdHw4+ZS9K316TYPs+NjMFjgY8yYvWrlQFdIMZuBAv989Xtjbc2x70+4iP10jgfb0J
         Unrq51QrrrlPDP9EGTnxn90P/aYYtGQ2oxBbtaQydJ3Wnr7Oj4adoMQJRkqdvxgAU+19
         /xNwmHq5A6CjzRJUwPFp/Imm8NM0THq+2/+ZBgeOq5/BB7a4QNy6G+8cxLYtVt10jbsp
         wBDlsruYOGJG5b8MHmpe/JfIkprNQ2qeQCq7qgifFxp5XDbd9EgehgPDd5N79/v67EvC
         hHkNoVyZyDyzG4xtwFCJfvFRnqBJZRXKkhuTQreEyBqx/0PEqal22Szojx1Q6Z+0hJ+o
         qu/g==
X-Forwarded-Encrypted: i=1; AJvYcCV+mglzQXQCtsW3DTpolQdDdlO0OQ0taqEjwxkAS6upcbr0L+YPUvAPb0xxqeGkw2/okeU2TbQNprbukicvmHQ=@lists.infradead.org, AJvYcCVkZg6dbHoqcLSklUG8qYQvsAL4H+0B7V2SGANGSc2CNutByd84QvX0IM98reaaNHrNp+YbtzzvKqFr5/KHGfdP@lists.infradead.org
X-Gm-Message-State: AOJu0YwgeRUOFlF+/Ti5ZMGNGV+kULDuKEXGD5GMmEvrveiKms70vHQM
	QXmJgGZQXi4/IGm6+co7vGoo1iWGo1BeNuzOetkyfq+6/0SA3R5oQggYmT40m4N33M1s/duk1b3
	URl3u14td/YxIwVKnf4tDYmSwLoI=
X-Gm-Gg: ASbGncvlREQrqwRCr2UuxSZW609ZpaAjAsVfiviZwDtnbi0qMaNXPUmrqjJJSjJsKQj
	qP0rL11Ob/uX2ZAr53/AKaFHwtXqkXRmSn5HN08fXFPRaaBBz/UKOk/YNKwVTpxY=
X-Google-Smtp-Source: AGHT+IFCMAGeAvzXbplXZVHFkq1g5vwQ0LnfRTn5h/6gVwZzfoyS5OmGbeTKmVHjY8WesWHIziGC/YKDnNh34NFn2HA=
X-Received: by 2002:a17:90b:3bc3:b0:2ee:9b2c:3253 with SMTP id
 98e67ed59e1d1-2f782d97961mr54700905a91.30.1737901559583; Sun, 26 Jan 2025
 06:25:59 -0800 (PST)
MIME-Version: 1.0
References: <20250124052611.3705-1-eagle.alexander923@gmail.com>
 <CABjd4YwA8P9LVuDviO6xydkHpuuOY7XT0pk1oa+FDqOo=uZN4A@mail.gmail.com>
 <a76f315f023a3f8f5435e0681119b4eb@manjaro.org> <CABjd4Ywh_AkbXHonx-8vL-hNY5LMLJge5e4oqxvUG+qe6OF-Og@mail.gmail.com>
 <61b494b209d7360d0f36adbf6d5443a4@manjaro.org> <CABjd4Yx0p0B=e00MjCpDDq8Z=0FtM0s9EN86WdvRimt-_+kh2w@mail.gmail.com>
 <CABjd4Yy14bpjzvFyc8et-=pmds5uwzfxNqcs7L=+XRXBogZEsQ@mail.gmail.com>
In-Reply-To: <CABjd4Yy14bpjzvFyc8et-=pmds5uwzfxNqcs7L=+XRXBogZEsQ@mail.gmail.com>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Sun, 26 Jan 2025 17:25:47 +0300
X-Gm-Features: AWEUYZnFxTE3h5oGlTFfsjDcS8qwqMXrYDcf3-wEwsf_JzPpTAfdudBkbVsUmp0
Message-ID: <CAP1tNvTRER=QzC29Udw4ffOetVECWV+MfZ2o-mbUFvuZ0_i-Kw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix broken tsadc pinctrl binding
 for rk3588
To: Alexey Charkov <alchark@gmail.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_062601_202968_0597BA3D 
X-CRM114-Status: GOOD (  12.97  )
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

Hello.

> > > I think it's actually better to accept the approach in Alexander's
> > > patch, because the whole thing applies to other Rockchip SoCs as well,
> > > not just to the RK3588(S).
> >
> > Anyway, I've just tried it after including the changes below, and
> > while /sys/kernel/debug/pinctrl/pinctrl-handles shows the expected
> > pinctrls under tsadc, the driver still doesn't seem to be triggering a
> > PMIC reset. Weird. Any thoughts welcome.
>
> I found the culprit. "otpout" (or "default" if we follow Alexander's
> suggested approach) pinctrl state should refer to the &tsadc_shut_org
> config instead of &tsadc_shut - then the PMIC reset works.

Great, I'll use this in v2.

Thanks!

