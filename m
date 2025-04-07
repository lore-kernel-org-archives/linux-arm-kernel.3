Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7CDC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 09:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sY8de/adKxVx84s/9OXx6B8gB3VJnbWZllFUS1NDxPo=; b=CqiNyitzMoK5galVqq86EKiL8X
	86IDQcRwFOQxx//jCCFHz5ZpBGb+nDlfCyPM6ldf5Ez7C1mHPMy2y+og0WoAuGBwBvwcyoZoeSqkL
	0FWE4fgUnryfLnAPptzsP6u1KAlFeSyMQGSQYi+BkjIRU/tKL5pSI0pBQ0hc+iVTgKOULhbVHgxws
	xdQ+eUjYaGL/mOMwya1mCI5Lt9Re/I+qKt4yBeY6N8j1pJ/bFg6eWDrluefi3F1RbKYM62Q4dBvaF
	50rHP75hSccy+KYrvylyT3LVEcKxHMUxljp/PSYsLLmmN3DwQWSLoT5yxsh/m94mGV67hxIgOrlYR
	tZDnYv+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ivy-0000000HDWJ-1SmA;
	Mon, 07 Apr 2025 09:38:26 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1isc-0000000HD5t-2tLo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 09:34:59 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-391342fc0b5so3240252f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 02:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744018497; x=1744623297; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sY8de/adKxVx84s/9OXx6B8gB3VJnbWZllFUS1NDxPo=;
        b=fGiAhtme71/w+q3UAP9RqHeXB8AQ5zKym1ELLWJmkwH2nCQgIK4DjFOwsK1wbcEDOT
         YsjgiEbQ4bOyrDXdRkBjpTpKTgLiKiFuQ8KOxJyRRQdMm0wLML9xXp3xDC+YURAzXBV6
         tD4WesUIx2rDyYH+S6KzL+jAt1+8vDCnZ7zjNuWPEPVaapKt/Pm30Ymk1u4TqPKO7zfK
         +B2QxIR9EgZG/DlULQIRqfQhyhOzXz+wc9FlRzpK+UtQT8pUt3YvXUl/lHcVvcmBsYiP
         c1mbRIvXiODFVrgoBLdjG5Yir3Qmuf9/yQ21YVfeMji0gh95ooPIRyQ7bLkfeKnbxi8N
         SIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018497; x=1744623297;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sY8de/adKxVx84s/9OXx6B8gB3VJnbWZllFUS1NDxPo=;
        b=goMceZzYCqN5dXQwhLATr0yyfS54msdLu7O+N/mI5N0DY6feJnIXh23XRXtmrulWoY
         d6+n6vQUWl1jo5c/pRbFe9P9Y02nI/+s336l9dmSuQV+/luIdBB9sHEoPsKNOW2fTaBN
         SzBG7ErHJi/FgpWx1cyFGZEerNlIK/dk6SKsIKqMVjkZ2X9HQZBwJG2iLQzbVO5k+Bpr
         lWSmbyrX5JdQzWZEtqsXlouc4OIi35J0a+/zP/M6FvQVRQHriSH6CGuGSHpuWOW9Eydq
         zX954lc9btoKRY3vifCXxb6qHgvRuwmE3p2qHhNp1e2jsq6D/NpwalCuHgpdzyIG+F+I
         dD2w==
X-Forwarded-Encrypted: i=1; AJvYcCWnBKcFlE+Wuoz7WpeorbGON80vEvnYwsDKy/g5gO7MDYFPQi1ty7h+mUOFuCn9C3AqUtkBlx8uGwZU+kloWGN9@lists.infradead.org
X-Gm-Message-State: AOJu0YxTkZzxzqzTsWaKGRkGfNF+Ps/DsVx14fOlGfRO3NkvZpWjYXhS
	ER2+t71Ia0H8MMKXFvUGKzMBpAGnn25KkkSTBmhOa2XyBBqUWuozf6caU2gIdOM=
X-Gm-Gg: ASbGncsn4I/4Gq7Qi/weNz6S47k+TOkAOVox+JezVREl4bnhkRoM30GsaYXL1WgH645
	PAcg/rMOhT71/H2G3SejhYa9vlqKjYgdV1gfnStMJkC8xUB/0KyZuGGkJh+9mH990Cuf8KVECE+
	+DmnPRtsU+cmICry0QflTlR+FA1KNI/11w8is+gaCvGs9khSy4oh4ADNSd0MKddin6eKk4Dbtpe
	qJKNzwlXVw8kUfuPgmBPPJs7tapJbr5m340BuhxXvKYE/yKHwKJw0j7fBCc6ENJIztqHtWpEytw
	48zwOCrAQ8kxFgeJaQVG2ZIumE2LmVtEfsYboCC5D5E03Oeb
X-Google-Smtp-Source: AGHT+IEK2ylsj8A3zv5KP41r85GTG06Mj0FN2K9Pnsar54qT+bII0+ur9gb54xnBI0cqR8Dv4CuOpw==
X-Received: by 2002:a05:6000:4282:b0:39a:c9b3:e1d7 with SMTP id ffacd0b85a97d-39cba93ca51mr9835262f8f.29.1744018497031;
        Mon, 07 Apr 2025 02:34:57 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eda4662a0sm85615765e9.36.2025.04.07.02.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:34:56 -0700 (PDT)
Message-ID: <305582d4a9c0fc8f34f997a697081409dd2df273.camel@linaro.org>
Subject: Re: [PATCH v3 27/32] rtc: s5m: add support for S2MPG10 RTC
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Mon, 07 Apr 2025 10:34:51 +0100
In-Reply-To: <5e91005a-28b0-4508-b576-5406f3e048e0@kernel.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
	 <20250403-s2mpg10-v3-27-b542b3505e68@linaro.org>
	 <5e91005a-28b0-4508-b576-5406f3e048e0@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_023458_740895_DD5AB5A8 
X-CRM114-Status: GOOD (  13.20  )
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

On Sun, 2025-04-06 at 20:33 +0200, Krzysztof Kozlowski wrote:
> You just sorted the MFD headers in other patch, but here you break the
> sorting.
>=20
> For me patches resorting the addresses (as a separate patch) is churn,
> but sure. If you do this however, it means you really believe that it is
> worth to sort them, so you must keep that standard for all your further
> patches in that series.

Definitely. Not sure how that happened :-(

>=20
> Rest is fine, so with this fixed:
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks Krzysztof!

Cheers,
Andre'


