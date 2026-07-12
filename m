Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E63C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 17:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NoL6KL8oSMCqAbK70KGT1wmrl62Pu8TBmf12FJBq4s=; b=nYh5yliJc3A2eCGucl3KjXhUCH
	V64eQfNR3BGp92r9hTmNvyWvIcFWbZwtnVDtzOKV5Ts5mksbPFdaFVV33uJf8zfBidFtwysxT4s0K
	GO/yHf7LhvbrJQzwyZMNe9Vegz6yyMelwiQwVAxo5j55CcyN7hZNaeu57OZ1gWJdwcOM7lvCMv3eY
	iQJYIuRnaS9qUxeDlShNRQOUp/RU8HvavYBs17hsqqNGXRdxCXTxPMo/9ZHP7OqCZlbxZkSV+ZvDq
	7ErDbdFpYNCXp1/ijHiurKlWdk7Pm9+IGJY3uWeN52U8BsC4VFrwxCS6RFhyVbATbOgdcuzl94fky
	L5YvDsDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiySt-00000007egb-3yoN;
	Sun, 12 Jul 2026 17:59:43 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiySr-00000007efo-05Vi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 17:59:42 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-84867f07d63so2632888b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 10:59:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783879180; cv=none;
        d=google.com; s=arc-20260327;
        b=mu0HuQ5LtPA6SdfwkHSSe1Bh0Ajt3ijY75lHDRKlz+73FFRN+y62NEoMaIufwXHDZt
         RHSztWczYfkwebzrns9pM1y3iilwhwRz+mkivWN4kzYuZ+u4Jch2imFqCozpRupT0vf8
         NJAc8LdMS+0kfZGW32t4cJy+pvkezeC4tdiA3R6pJVuU8VjPca02Ed1/i7afXiQml1Pa
         pAQo5la19V7LHDHauTpUNsvKksG7TcAKt0bxh/Rfw3Xp3QOhOYW2xj2Jgw1qD03l5gpS
         SZ5F3khSF2Pt1RzVxrFsxLN2EMzpdHgo6lrqoN2wlC3BKMpoK0rzacg9bzVBSIohszJv
         qnPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0NoL6KL8oSMCqAbK70KGT1wmrl62Pu8TBmf12FJBq4s=;
        fh=RhHcF6+uHcTgFr1QFfaZ9xmOQ0e7k5x7TNnyK78P7Q0=;
        b=Z3DMakNcgD7zZgEJnHe6AdXnIHhQdxCsl70bkr1JZ1nn9LJ9dTigWNciS9EcY0J/cE
         JIZkx7pDa2Cxj/1hXOU7mJ6kYgtHPTjUIxqgJJGQnO29FOE7dXgLPZOVmHEhdVjA/O0a
         s0j+E2KjqbvVsOMu7+uvS7B1v6aTb2eXxISEENROmnq2LjLLiSRbCOe+/y1By60hbHAB
         arIJ1r/RinglNrqvd0BezQcmRI2RW9wSu4ciZiF7hrKirr00SJMa5opH/jRN8esMgqFE
         zRgr8HE2PK64PefdjgDqR6S2SpisgHbHk+VD4uEIVSzJOGSxUaChMwTrkqCBXLM/fx+0
         C9cA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783879180; x=1784483980; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0NoL6KL8oSMCqAbK70KGT1wmrl62Pu8TBmf12FJBq4s=;
        b=rrM1NRTmPM+Hd6wp9O0tK2mZpXnJeYDtHVzI1OzHkXWLPa6FuqPHyHbCJSty7Y/WHr
         BiQzHGjVj96CwY0JWVETR64MT8dQG8WvHrzXx7UVfYa9bQaZXVyPJLUGSJ9Cjq0a24Xm
         cCmqcUnsjpD+iZADWps1SGItIspyXZf2f9w9w8Ab5k88v0lxH1qdYZ8rUh6AN/i17/wX
         xsQbB5Kt/BnedbdB82DT0h4cqQAwuXyb3qGm7RBkMz4HHkX7xuim1jE7h3oc7QD7N5pR
         Pr5h9WZHrPWqp/vltltrbe2rn7hrw63cSIIdZRuxF68AuAtDHCBoIEj1V2GYY17c8oeF
         crAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783879180; x=1784483980;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0NoL6KL8oSMCqAbK70KGT1wmrl62Pu8TBmf12FJBq4s=;
        b=KuEJeez/pm7yrTIRNj13cNpD1jjcfOmXKqpeQMCkbviCUB9vNDOi5qqvwZYYtvvyGE
         oBZU+SvLu5XZqIPYt1TIt4qgpWGNu1+/g2THo2iH+HVQSpWqYNXIEqFwXfoJfEEnPta7
         Fnh96cIRYbrM+PnNg6qzvPPMltmyYfDzybsdHgoraohYWN7uuv8iRp4Fu0e9InO7BNuJ
         7dxwMB9jXRMEYMyeBqrpxpGh3rq/ZUUskzsGNDVu8U6ILb1nxt26s14xsVZ6NCx0L3tu
         QX58DnX/Xqwaii4k/VlQtboanp28Be26/1iVG4PpYAUlcyFvXjeAeN6E2B2hqfru1Ku8
         +KfA==
X-Forwarded-Encrypted: i=1; AHgh+RpgGjdQk/A8lBCnkGypZ84dHSqPuK9MOLjshRGqJD0s+QZ+hrBnR1bKiwWyGAOdE1coqmNEnmpmg137zSjJ1kub@lists.infradead.org
X-Gm-Message-State: AOJu0YywWqEau5eGoWNKsDEFzuiIv6ocF8HXebsGvB60eI4XdeImTatv
	Ke1tyLeLZ8bPw1eqnKoY7GpiiYVVd75lydzWe1jkNuuw4MQS2vP0ImaTWlZWL4L7/D8eeabTF5I
	DGUpoHxyyL98SgazbAFIxUgSQlPQunr0=
X-Gm-Gg: AfdE7cnrtq7rSUkDve3Lrt0fY0ijv8lvtsJOIwVanAU9mv8UIE2H17xgEpv/2Qx3xgu
	fy6eDZS5Q8RIDXs6l3KDKWTCFcbU9Ni3XF6wX42fClhMEODsvLlNbvnrtR0X7WrnH18TiDzt0rR
	KcOL9Ax2PQSi2Bx0TLPXf+RYKLXhSXAV9k48nLqfyezuMbL6INsKPAUXUpVADWhQQ+e9ADVBoAa
	DNNb2ajSvs4Rumlj8gorwpmzKLPJiV7k7SxX+5vyfR3yGSIvK1rHoXfP0TtyFRl5Z6qmISCigdO
	nCH3SmmLxRUeO14HEgmB2uPJbMHmcgkklLeniHQGLUrHJjUiUJitYl3rT1s6IbOGJmIY5pVRzLz
	foYyL4r7vBHBDFb+Mplpt
X-Received: by 2002:a05:6a00:4486:b0:848:804d:9c5c with SMTP id
 d2e1a72fcca58-848896dd3c0mr5554442b3a.38.1783879179743; Sun, 12 Jul 2026
 10:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
 <20260711-nanopi-m6-v2-4-422675a65402@gmail.com> <84467f61-9902-4dea-abda-6e8cb31e0238@kwiboo.xyz>
In-Reply-To: <84467f61-9902-4dea-abda-6e8cb31e0238@kwiboo.xyz>
From: Joachim Eastwood <joachim.eastwood@gmail.com>
Date: Sun, 12 Jul 2026 19:59:28 +0200
X-Gm-Features: AVVi8CdXhh6gKGuHTJ0a2hd15-RSpJMz5r5Gy7rN4XSVonKwOhD1LFSXZ8VR_Fc
Message-ID: <CAPSPb=t33bHfuEAMLWPM5=2fSyJXv5vjYD=_pSNRq6GcUz-X_w@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] arm64: dts: rockchip: rk3588s-nanopi: add
 missing sdmmc cd pinctrl
To: Jonas Karlman <jonas@kwiboo.xyz>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	diederik@cknow-tech.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_105941_067564_228915EF 
X-CRM114-Status: GOOD (  13.64  )
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

Hi Jonas,

On Sat, 11 Jul 2026 at 01:18, Jonas Karlman <jonas@kwiboo.xyz> wrote:
>
> Hi Joachim,
>
> On 7/11/2026 12:11 AM, Joachim Eastwood via B4 Relay wrote:
> > From: Joachim Eastwood <joachim.eastwood@gmail.com>
> >
> > The cd (card detect) pin is used, but not reserved through pinctrl.
>
> Maybe this and some/most of the other DT changes that fixes some missing
> bits should put first in this series and with Fixes tags?

I can of course put them first in the series. So we have the option to do so.

But what is the policy regarding "fixes"?
I don't think they fix any critical issues, but they do make the DT
more correct.
So do we want to backport these to stable?

Maybe the following changes qualify:
arm64: dts: rockchip: rk3588s-nanopi: add missing pcie rst pinctrl
arm64: dts: rockchip: rk3588s-nanopi: remove pull up on rtc int pin
arm64: dts: rockchip: rk3588s-nanopi: add missing sdmmc cd pinctrl

But I don't any others should be considered fixes.


best regards,
Joachim Eastwood

