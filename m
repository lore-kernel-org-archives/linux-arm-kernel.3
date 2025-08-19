Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17DECA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 13:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykjYNDzNtgnJKupD3/EWV+NrnYl1HExXSP5IMAiM4Cc=; b=yQOTlxOsbliCpvsIWmD3TIa5R8
	1dtYt0wjWkVX1fyhElgBCSGyBIOsfTU9UweJEmf5zpaJEk2CcQ7+K2rEdEyva5Y7HIGkwYXQYyj0w
	u2+WCgAEPv71UdBoZOL7dCY8FUd2xUL8JWzFsaNm4K6jZw0anv2zhe6Q/2kVenXbmKL+IdYXpVaX2
	/DseCDVAIhTrdUgR+dL011cfA4SDxsDkOFT2/9sfAJoN2Sfl4Gt8haPk9XflP3dkvXhszuKjdYqX9
	vrlMJBMahjrh3YwbYEWSBE5haUodUThK5txJyDN61a4QS6MVej9qHywkezuMsTcKh6VKD3kvLPQN7
	DCLzinuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMqs-0000000AgDK-2RSL;
	Tue, 19 Aug 2025 13:58:14 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKP7-0000000AG7c-0CHr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:21:26 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-55ce522c7a3so4284884e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 04:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755602483; x=1756207283; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykjYNDzNtgnJKupD3/EWV+NrnYl1HExXSP5IMAiM4Cc=;
        b=F/ItXKD2T6PToW6DjEY1GsS9XVwMeF4SO0OQuANP1BO0d15GgXj26DECt0Bg4gCcY3
         6hmNgIcveXOF9rPZwOSbWJbR/SRxjTITgYx436eX8wec4aYs6+7lWim4ZnWhyccfdapt
         Mk23o0Spdc4/HlRUNFW+Q1qnbDIZQUYJx3BnW6sNbsDn8Eilp14GvMBALiG9fCbjrG+q
         mvrDnhE3yhWca0tmq31zFTs5bzB+omphI0lWe/B9sVZYGkRw5KClBYxHGMxb3KUrI+K/
         BR2ah/UDg9l2LMQ+aWPGUhRRHA6pjG+YLZKYCUOi/ibbEJw4Zq++nBAYRTBqdKerwPC/
         fvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755602483; x=1756207283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykjYNDzNtgnJKupD3/EWV+NrnYl1HExXSP5IMAiM4Cc=;
        b=rbcwkIIUhrnWsX9fZwv79spDCM5eLY8wiiV9CampOTGuoL7/NlDHiyow2vXMEPsOxo
         10uF9c5C8YpByHHDG9A+ycfmQjIIWpZ1IkDTm7aGxNDgxfIOcQoffpYV1MNNV8IEgNKf
         96khEkZxCqOycsNPnEYK+AONAqJNtf8GYXbswSqRrV34UovKpxrtm7sqz/LIcU6kgfKA
         OU6J/4g7OUHeUIWnLDgxsAR/kR2cQ5nzKzfsqIgP4u4ZszVAj5J3SWc2Dse8gvigwnrn
         ETi8tDI2cmC7rbPZb9e+SU4LLcW7DuV1WOhcse+/6qx7VUma2Sh5VJyYuIQ0cK3U3bYT
         lYvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGjSIYaW4kLRUda3ybzun8wAPdkjvB2uDWZSi0oh9l78ciYHgGbWDzcl0Ple3XKNeF6ileQVVI/FqgSQJBskX9@lists.infradead.org
X-Gm-Message-State: AOJu0YyDqjD3nEsBLk+NYkC8XiJQgqcAtx4QCqM3f5CDwDlLZA7V6P/h
	yAs3NkMbiAjG7HBkPlt6xrSTUcRp78xFqbKeR1Ghf+8wqaxDMMvbkfKr2YNya3wKbzVw6Unvnqz
	RDnNlpcCDX/SxTMGFa0PKIfXJu9T3IaXDBkKu3AgurQ==
X-Gm-Gg: ASbGncvCpYVFtpCgj2eJ8FfaZDI9CDOfyjLPMKXA+xl4wC4DqOpeQPRtBbsiAqxCB8n
	27lUs7ydAWgi1KIMxPnaQsp4qdoYw8enxPyqaTRv/RBpjUe5677MhuoPTvxkyFyHDQbrMlXtO04
	bFXTLJdr42xj9nMSyKcVcSDXhRs3ncmfOtRBCbm/NBRgBvzs1ZGfcWZc+7+1YfRf8rJBXs8+uOM
	YfORKBGC/QavQ3JPqnhsWg=
X-Google-Smtp-Source: AGHT+IExSkHu5Fq2TPJj7mig+2UITCL5Nuo8n3oMZX7n14jJ1Ur8U/ZDpryXYMDT0yEbKr7vKt4NOQD/r2E+HVIENcA=
X-Received: by 2002:a05:6512:33cf:b0:55c:c9d5:d347 with SMTP id
 2adb3069b0e04-55e0083157fmr656989e87.35.1755602482535; Tue, 19 Aug 2025
 04:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250812203337.731648-1-robh@kernel.org>
In-Reply-To: <20250812203337.731648-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 13:21:11 +0200
X-Gm-Features: Ac12FXy0UOxQIJg9zQs_ZT_Mh0mUXIMqwTPHMZ2w4ECrF-44gBtOF9LLtv4UU10
Message-ID: <CACRpkdZGD6p_QDRHXQSHWPk0E4N37RQ6HQXzBAGHo393ee08-A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert brcm,bcm2835-gpio to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_042125_091568_8ADCEEB1 
X-CRM114-Status: GOOD (  11.36  )
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

On Tue, Aug 12, 2025 at 10:33=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> Convert the Broadcom BCM2835 GPIO (and pinmux) controller binding to DT
> schema format.
>
> The structure of the child nodes wasn't well defined. The schema is
> based on the .dts users. The legacy binding is a single level of child
> nodes while the standard binding is 2 levels of child nodes.
>
> The "all banks" interrupt is treated as optional following actual users.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

