Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A622C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 13:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/JV3Bh1ZMG76SNJlwEakQzpLhMGq/SyZApq5+emUOc=; b=RUULnhpxLE+r1/YgOF1GzFBph/
	mYr2Y8cn1G6ZxGEnR1Wt2WFVs4NHR6qjaql1lvz0o8N4lo8gIRwD0WPHt4akuSNy/7F4KSLi8e7At
	PjHyfJbq/suohBiMuVm3wih3ITcV2JTvAoVy0MFILiQ2Azdv8g7MWkgfaPdPRrMwVqKyhc1SJJWkA
	CtVjjj0hL2voEwJelHF9YPH+4wJJu93sdgHq2CW+0gAykQAla5FXwmiCCxvN2RanPRjGtSYhVeuPq
	PWOGTQDFVES/VK9o3MkE/4aD15Od2giLfP6hhWJBHNZQoDYIc5dc0MrXoNR0tUxuGJYQH1j2X47X7
	4b/R0u4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpxw-0000000CWzv-4AFz;
	Tue, 13 May 2025 13:46:41 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpoQ-0000000CVVH-0F4e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 13:36:53 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e7b2c28f67eso1036505276.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 06:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747143409; x=1747748209; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/JV3Bh1ZMG76SNJlwEakQzpLhMGq/SyZApq5+emUOc=;
        b=a8n+advyMbcQYO02pScg2WLSOKWTyYSms474uLkdOWfE07vrUggCKzAObZIlBjR/AC
         NgH1hWPiKQexlx3hplWime9BTJlu2m6MX+M7N+CEdQxddQrbavCHASq2adWo+4xMTyrV
         1X3rGwUJC1QsFglK92kYTaM5s/+xiYSrSrAKBZdN9DSWM08GpnahPBfWxNRoTJ76xqf9
         xsYd0Dbp4Gk9m2P1ge2F6S/4jGZcyoq5Irfsh32JflOsBl374fMJw6lHqVkGzGXOj/a3
         K4XQexHzFvnqayUUNrYqYHxpnP1aDN1CRbsbo9JBxQZ3HnybT5zrdZhge0Q4lyidKo8J
         M1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143409; x=1747748209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/JV3Bh1ZMG76SNJlwEakQzpLhMGq/SyZApq5+emUOc=;
        b=wkTM4Vwuou9oh/S6nQnZTxS2HM1aqtxnsv+8QJ50UMLQ17Wo608Oz1ffQSQirP10Xu
         /Q3MZJxkUtSuLfEy2DKKfXeB7Ogy7rO570Nec63gt7JLLjzOawb6AmjGuTEO5KtxblZM
         q3DkJZ5z1mauvA8ybWGSJr+D0qWbnhzJl2de10nPfx4qmZS7zLK0JjPQag9EVBdkEKuR
         Vge+rcMjZFzErA55JxJcKttT8Sh2lkSGadZroOtFoJBPV4OkkiCjnFsFztTAt5KmzH9v
         LT6f4xOwmjSp6+FbsFn3uE4sRvSr3MXdXpjXtiiXUtmDc2Su1YpphT899MdFLPK4ee9L
         7d7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVirPOd50aHo+XoCRq/6wDYb+ndyRXP9A5GSzY5QpXv9K9GgB0zj13L0iKd48/upg0zl1ORl9J5Czj/agB1+QjF@lists.infradead.org
X-Gm-Message-State: AOJu0YxnT84gz8Hbh8Bj6xtnpPqo/AjQN8/o8h3sHPAeMZxeqLdRiS15
	orVEFPO1ZS2ej4BCQh6bRxYt4RK84UehHdNLlnrgOfNR41Nl+llAbAbWP6otZk1T0fGNRVm+vd3
	oy/Utll1mpv78Qt5UpRAcVQ7093kQGQXSNXUbbw==
X-Gm-Gg: ASbGncuhY1VdiOPscBjSYtSXlsS9hAIZ/D+vfCnZtZi/+wiAY4LsaHAv10Wj8IsAHnW
	/ag+gQ40fNWorqJWH+iSo5oK4zFVwUjQgMpfuYB7iFkjU42suBAJIWTLI0F8vPPQOAAD91sU2Nl
	HqyVqa8Cr0PA8ptpKjJCWVKFmOYoADpxJ/
X-Google-Smtp-Source: AGHT+IGPspzzHxed6rft90BBazRRlyKn4YRNf/+L/ffhEMrgXhwvAkFISkzPmGNOJE8q+cDfmA7yJkalBx150TF+eCU=
X-Received: by 2002:a05:6902:2193:b0:e60:a068:a14b with SMTP id
 3f1490d57ef6-e78fdb83501mr22863623276.4.1747143408924; Tue, 13 May 2025
 06:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com> <60ef3803-4f8b-4d9b-bef8-6cf3708af057@lunn.ch>
In-Reply-To: <60ef3803-4f8b-4d9b-bef8-6cf3708af057@lunn.ch>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:36:36 +0200
X-Gm-Features: AX0GCFtHZ-lXYmozXKJTmAfMPph60MlOaJrCz7XDyOAs3Cz7P-VVNfFyia5m6R4
Message-ID: <CACRpkdbqPLaBheEv1=ky1gUJ-qSsPRjR0J-UXEuhXf2Oix_EzQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] pinctrl: armada-37xx: a couple of small fixes
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gabor Juhos <j4g8y7@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Imre Kaloz <kaloz@openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_063650_098739_EDB6CE14 
X-CRM114-Status: GOOD (  12.61  )
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

On Mon, May 12, 2025 at 11:33=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
> On Mon, May 12, 2025 at 04:22:36PM +0200, Gabor Juhos wrote:
> > The series contains several small patches to fix various
> > issues in the pinctrl driver for Armada 3700.
>
> I'm not sure all these should be for stable. Some are clear bugs, but
> not propagating the errors has not bothered anybody so far, a
> requirement for stable.

So we are at -rc6 so I'm not sending these as fixes to Torvalds
right now unless they are super-critical.

I will merge this for v6.16 (-rc1) and then the stable maintainers
will have to decide from the point it enters mainline.

Gabor: can you look over the tags? Once you have decided
on stable/non-stable tags I will merge the series.

Yours,
Linus Walleij

