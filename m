Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F40EC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 10:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RvZPpwQCYzg+8o1DHR3C6tWw2mYjAqdjhIanmYv+iE=; b=FIEuPMcYo7BqCXAOOvbir3kJ3p
	QdVOSrTkl7dnHABlDGT76oD2RC2b3X1LmgD0vxuylS7WX/RBERj5ymrMhLR/in1mzX1P0zwmBL3/I
	rdZQTDB5PxzhUzW2rRqBNaq24ZkDVkTLwvbA9XTIy1lnuUqNi/DjJ1zYWVxr7wWGlgcCBsDIom+cX
	SweynuRthSK/Ila9wEY1ZhIQTPYco/cDRvJ0ZItqSuMHpJaiYWIPiOM3nz0HmLPjBRgESiyacJxNh
	eOroHP2XKZDQpujQ1bO7RLp/SeXm5FqUUxihu7P97wfVtO0qCB0RzTdld2jTavkVk3Xz1mJPNrovI
	r7qqf6Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tit7d-0000000EXFt-45Tn;
	Fri, 14 Feb 2025 10:40:37 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tit6C-0000000EX7g-0OOV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 10:39:09 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-3091fecb637so3953611fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 02:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739529546; x=1740134346; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RvZPpwQCYzg+8o1DHR3C6tWw2mYjAqdjhIanmYv+iE=;
        b=wIESCUZw4b43qQLGKz5q2vBDVINjSdSRhixsPqmHMrCzqOLrxKUe0DL9V1zNOMAGmS
         5TrYNM4N4pSRkunQHEZ2afX2/WqkNseDNaWkN1bbeoauiLyW2t2VB2sqXLtj1hRvbbmS
         PF07HkmhAfQjY2AKrnrLhWj8jgwi3oLMBC5WyQKldTcKa1oXEKvVtqEDrLkgkrNIC7qF
         aV6XkBaSIq+g2p6s8o4Gc7rX4h+x1YL5dcY0tBeTKjaeurbMnvqyzv7NvpCAfUDc+XDZ
         rdou7bCXJWt5kt7idfGmJ/7QzFuCQSEHboTkQFI67NwmSXev2RlqHauYZ9Jx7bNFCyyz
         WXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739529546; x=1740134346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RvZPpwQCYzg+8o1DHR3C6tWw2mYjAqdjhIanmYv+iE=;
        b=bLxlfCkEckrjNPZlkUw4IR5CTYkuE4k/1HgSdDJIJdLQeWWVAODF+DP/M6FKMj9E52
         cGjdIHB02gaPWmrm99KsvQH8oO9C8Ate6FQGwX7N2CQjRscDB8G9XxKCQFZ+tTPDFGSa
         aJ5hn5ITEpw3/Gcacu2ahN6GZv4x7qBBUTD6dP7EfwMgB6/ypdXHnEyaAF8tDiieUkHX
         0OPLOz6nuDzLGbRUDKlZBfNNv/omigMLAJcyvuGwhvndJ2XvZ0ElHf71sR9qwYkIE5TT
         WzBKnBc6n9HcSZxu7Nw5tibLKmFT/E7aGqFXdCz6aAgyyC8OmzNbyMSK0O1OHfngh4ZU
         d5Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWur+a0LC9MYkmDUmj67hsxx47uaKk7aJr4T/VlPdbLHZDRbF3NoJnrN+wHzvcbqMH2wdT4xXtyKC/23/b/m5M4@lists.infradead.org
X-Gm-Message-State: AOJu0YweoFlnRaAkf9976OiUnTy/8bSUoBYGwlTq5T93l7vmepKI/7oK
	lacg3oDgA8XM8uIZ1f61oYLtqyddULCEyLOXZe5jzC5wqoGHnZHqdM/HA30yLoP73yTYSTPjCPN
	FcQpEC9NHyZeGZc+G1wEWgVySkF+udWUB6+H21A==
X-Gm-Gg: ASbGncvOLNuULPjxYGUPDjyRzFRW1V2DK7untSLyVjs+WyeJRHa+0vkn2cJ29+h7nqH
	jP1LsRWT+nq5TCxabpqnTIejZ0/tNmjgG7/8iwoOohRJGJ7cfeMZAmdN3kwH7Xlsr09ONPNkh
X-Google-Smtp-Source: AGHT+IFcOuS4cumt2YODgYWKRsMLvcBHN8sxE4vos/EFY24hOieVy9WXAkHUqW6GJ2CI2TkzytddIGBb5y9f4GGOEpk=
X-Received: by 2002:a2e:9a0b:0:b0:307:2b3e:a4a9 with SMTP id
 38308e7fff4ca-3090dd33349mr28348041fa.20.1739529546052; Fri, 14 Feb 2025
 02:39:06 -0800 (PST)
MIME-Version: 1.0
References: <20250213180309.485528-1-vincenzo.frascino@arm.com> <20250213180309.485528-2-vincenzo.frascino@arm.com>
In-Reply-To: <20250213180309.485528-2-vincenzo.frascino@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 11:38:54 +0100
X-Gm-Features: AWEUYZkcoUajk8OY7YlPuAw6yk_Mx24LP1X0bHTPQEW1VEF0lTSP39l_2JHco3U
Message-ID: <CACRpkda-J_NHC7Te=Shk0A-35qWms3xeM2MggdGM0ze3Gt0KMw@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] dt-bindings: arm: Add Morello compatibility
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_023908_145442_8DB03464 
X-CRM114-Status: GOOD (  13.52  )
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

Hi Vincenzo,

thanks for your patch!

On Thu, Feb 13, 2025 at 7:03=E2=80=AFPM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:

> Add compatibility to Arm Morello System Development Platform.
>
> Note: Morello is at the same time the name of an Architecture [1], an SoC
> [2] and a Board [2].
> To distinguish in between Architecture/SoC and Board we refer to the firs=
t
> as arm,morello and to the second as arm,morello-sdp.
>
> [1] https://developer.arm.com/Architectures/Morello
> [2] https://www.morello-project.org/
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml | 4 ++++

I was thinking, that since the .dtsi and .dts files are not reusing
any of the Juno .dtsi (correct me if I'm wrong!) this should not
be in vexpress-juno.yaml, instead perhaps you should create a new
morello.yaml file?

Yours,
Linus Walleij

