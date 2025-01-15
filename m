Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C5EC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 11:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvqSWtzGtHPP8eGp+zVA1xgjOnLlbFcSarz6cYFQfDM=; b=Nr496t18GGlxMWgNMUOpa4gw9k
	VoGXElX53XAjv4kRUIQob2wDrBc4C43MMEuiu8Uhbo6L+AbHj0sHJ8isWB3nC/uqS3glwPmxphPHO
	2Izbuu4AmhP0j5pSO79Bq8JR8rMvDZa8vFQWvRxr7gl+GrfkI1qGA4/wb+a64MphuSOb3QZyezpU/
	kSHEBfimJx1SpROElbGOuwkiRUyCbe+Al3H23DOCpbHCZOQnBZLx8M2+NdqEuySdkXh/3t638cnlm
	u72PhvZFvOkOSP+18lq2lsRO3+s95XvsfQnD4Eq8sPXdzVN916x/VTVL8kpLT3AJLYTns7Y5Ort53
	wKWDaFAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1yt-0000000Bldo-3cyC;
	Wed, 15 Jan 2025 11:54:43 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1xM-0000000BkkU-4Blp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 11:53:10 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so6520589e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 03:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736941987; x=1737546787; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvqSWtzGtHPP8eGp+zVA1xgjOnLlbFcSarz6cYFQfDM=;
        b=vh4/kkpfiJgyPI4Sse5eid5/GKA6QtDlhdj6ffagNnZeito2/5M3rROqHBP79+TIKp
         HM7I3ptjw8sZtfA9i+49RQyD2byQ/LYelI4VbB9PZ3CKbMscZWzv9j/oq6MtNbq0UCLa
         C0U0dpYk1OmLtUkxmEcnu4fjDLxEkHyDqF1DVN7mXF+cHdZ6lg3DsFIYMuBATFxhrOSn
         mLWeoSHj54xSiSbXpk3nZJMSCm+q4g/PuIXwLu9/vtMPtxwzUkeH17kH7kjQuHC10pFv
         6k4eNp8tyuRs9cp1toVW8emRgmZgvSLbQnDe7UP4iBm0KGutlSBMOLQYcg8VjUOBQyjJ
         PPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736941987; x=1737546787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvqSWtzGtHPP8eGp+zVA1xgjOnLlbFcSarz6cYFQfDM=;
        b=bKA7qBBDjJ6a+lRdvlZ/wfCj9j4YHmIp01rr8CQ++yrOq4Z11oau6UyzSbh/vvajYF
         O4sjqy8LrVfGX2rmYHXovOjZx7oPz7NSlbYx6kg7jfP5dSyJ7y/cJ0y73YCm4IiqX22T
         MK/GTBrwJvhRPhuA/2e2SbX1r4qN9YptiSEpzsQCnCYhyujGHkauXdZN4iJHUTv2u/kC
         oDcRejiQzR5Xoqwp4tVJpnjY9+xk7OofTWPO8biiPTPN8s9l8gIPYJx67i/259pu5ly3
         LhRp5JO8i8F7YkrvLvD7tln4NDQAW7C2abwjzHlI1o0tne2ztJ2VyIEKdYuXgQty7Vx2
         0+HA==
X-Forwarded-Encrypted: i=1; AJvYcCWc6ozhOO5dG1g6MDWCWoFvWROZo7yc7dExrj7CWatS1Rbt59ffEHUY7n8XjDzg3bcp/duUEB9AWyviNRsDjqFs@lists.infradead.org
X-Gm-Message-State: AOJu0YxhtWq4m7be7OiDpRYplSgiAkf3y0OtCQnwN/BbgT7nqFnJPqM8
	QqPEg0yOFWW2/k2sngzy0wXwtNPNixoOKgwkRLe9ovvxPAV98xUSi/IfVhC+5HezEyiBfP+95Jv
	nM4boqUPhlBAuTaYMMaGFicH0GiAISIXUSeR2FA==
X-Gm-Gg: ASbGncvwMx8aTvds0rok29CisHFNRNmxGHQrNuhzuqRF10IpasiNazq7ZMcqKrs3J9h
	WS5D5/qTKsxBrDOdWN81X/8vHG7ksJh7BgVWXMg==
X-Google-Smtp-Source: AGHT+IGBlXrCMYgYKLgZmDqCoCkzk9zXGTEbjg0n3d9TmJW2cjKGPCuhqJcY6YuLhBfY419BlW8MYE5VzPIfrs+M4Z4=
X-Received: by 2002:a05:6512:ba5:b0:542:a73d:a39c with SMTP id
 2adb3069b0e04-542a73da516mr2355986e87.49.1736941987038; Wed, 15 Jan 2025
 03:53:07 -0800 (PST)
MIME-Version: 1.0
References: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jan 2025 12:52:55 +0100
X-Gm-Features: AbW1kvZ-ZJDljU7xDZeyhECu0xIb2cb416ZbrOmY5XJEA2ldhLke2kjbohdh8UU
Message-ID: <CACRpkdYPSprYwCz-Qk8a0CqEeec=HVV1AwgVbRDyv=Vk323wcg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use str_enable_disable-like helpers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_035309_057401_66609513 
X-CRM114-Status: GOOD (  10.08  )
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

On Tue, Jan 14, 2025 at 9:36=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij

