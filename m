Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2367CC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 22:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OF3Y7OxM3P8Aw80IWQnBi8AWbTqWJX1OjgpSqEvS6a8=; b=eRd7yQo8yAyPvKHfd43L/FKYqX
	DlqYqhrM42WcSX5xcMdiocNZ3fx2ngLXCafIXdH3bycjz4fQfHvHA3EADs6JhuFVXsAolBPJDV0zM
	p45TsVpaVGup4LNvOlzSUnV3o+I1KEZT/nTYBC6Sq8w96a+lS6wZ0HszKTern9ph7WzieKjB9wDH2
	QQcopffE9zfPpTfVkZh2Sjlff9eC1yLuzqb2BKw2SHflZk5octd331dxte8c7rK3fsSuUAKbvaMjK
	u2HOJLRHBbryW+cWs/c+o7Wb8yZjDSq+jERwfwx+CAkcyp5g5dMPdbI5HTE5mjjTGgWtMJcPpPJDf
	oG2itqfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExxr-0000000DeYc-0UEP;
	Tue, 13 May 2025 22:19:07 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExi3-0000000DcrV-38Om
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 22:02:49 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so8247760e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 15:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747173766; x=1747778566; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OF3Y7OxM3P8Aw80IWQnBi8AWbTqWJX1OjgpSqEvS6a8=;
        b=i//Baq35uhQWZIL+ssvZRiGth/eFZGBuGSE+FzG9eCUIlmNooWM7XxIdw3aC2+I4ri
         GejCn8AtNUXE/IUZNvHbPxlxqtjUMAcitI/mDJQvQRovezCbr6AidXVIiA/6dEC2dKvJ
         k6xzBH+HlpNNYO+Tnq3PmQYsaJtZVC6hbU419Mx499lhbArz0RFuN9U23JFdTW25KDAW
         T7muQU9gODzF/n+A9ZUoEnTpT8BE2eMns3hxhpkH5qOKFxP5G5VP5DtoSbHfs6cTwWe4
         cQHjGJy/1uyyc8HgeQYnsN/jxqyjwySf6tYWiE01xBB9ZQn6fgiNaC/N0VvCozDFpqaa
         VqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173766; x=1747778566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OF3Y7OxM3P8Aw80IWQnBi8AWbTqWJX1OjgpSqEvS6a8=;
        b=pZbT+9W48GYsiinohWVsPCc28BsfKD2r9UyCiZq5EGpkRKE63OCC/5tV/zULrDm/Id
         QWUYWhgrNPQZgGcBEXrFQc+9YlacYlVcO1ekZJlrvmjPv+h2Vk0IN++Dxa6rQn1lz7Ip
         PnvF9p1ljTdNQwv6grI0IWy1cKbKcRaD/ktAsPI+BO1C4KPmDgeM06GIE0/TolxKMkP7
         SXaB0lDCJn3x8etyYjoDv61PfAYq04DqJyCtIL8PO/fAq8JSw1uY6Z15T+0JQvgdXg5A
         NnAi14200TMg5ElriRUEoe1TDCTfOd2UxaXT1SlYaH+zkBm5jmWndLMq2lh1C5IgC3WB
         RGZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtUwPEQctn2brNFoTD1LvpAja8vgGTCMtvpwDkkjri8F6AgQShCQcFh1D3wXBdjlwuls1t+HQi767eFv0TuekE@lists.infradead.org
X-Gm-Message-State: AOJu0YzsUeW6lozjOYso1H/0I4hLJ+j+Th0NX5WH5tlIOskSTklYQnnv
	QrwLMMD4jyy7Lh11CUWF1GLH4caDksuu5k09t0TiyKPcsw166V2Dv5fgvCjWHogMc5K0vPMU+1h
	FPQqkYrWnG4o+DMkPcEl0A9Y4FzQnmmgSe+oEFA==
X-Gm-Gg: ASbGnctoJ8mdkbyZsgaPgyS4c3lvTEM1wDtES5XaTC5H6hllmJzV7NIT35aC0lRqlPT
	VGL3cRevNBbNbO3dJBH29HvFxqosut3BcRtjyR7I6blHFBkFCn+K3UoHKPRuV7KzknkoXbZlJOp
	Rfupx1Ji8DLxagn+yB5FyHgk/7R8Wtdat+D0hoPA+6p2g=
X-Google-Smtp-Source: AGHT+IFV6oM1huMeF+j8D3av0zRQp+sO6a3WETyY9TcoM8z4D0gAPRxDZ6Iruo7oYj1D+k2aLqn2jGcIPx0XlTck+IM=
X-Received: by 2002:a05:651c:30d3:b0:30d:e104:b67b with SMTP id
 38308e7fff4ca-327ed22688dmr3408491fa.38.1747173765836; Tue, 13 May 2025
 15:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250513105941.28448-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250513105941.28448-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 May 2025 00:02:34 +0200
X-Gm-Features: AX0GCFvrX_aqXbESUgpoRHsXNXvkw7MLENgWNexCpBHmO_EVXfh1y4WvP_Nh-o4
Message-ID: <CACRpkda6zzroe3XbPpnrRMqbHcCsiczEQM9JW7c-hwhiV3vtNg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.16
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_150247_787615_6A950A07 
X-CRM114-Status: UNSURE (   9.88  )
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

On Tue, May 13, 2025 at 12:59=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.16
>
> for you to fetch changes up to a30692b4f81ba864cf880d57e9cc6cf6278a2943:
>
>   pinctrl: samsung: Add filter selection support for alive bank on gs101 =
(2025-04-08 20:57:51 +0200)

Pulled in!

Thanks Krzysztof!
Linus Walleij

