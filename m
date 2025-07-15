Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC33C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 15:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMq+z0lTQ5uqzjIe7ORBXN+DvvALIfquyp6XwhodWKg=; b=tAI5LkTwgEOhmJtgyf41PwDFwm
	dr1TLMFco/PJzGtuL6CwiCTh0+1Ej29fXPiSmaF/HQAgY/bPCA8Pn3bRrqiDZKDz0L7tdo+TRGVc1
	Cr7UNBpVNTrV4xJAbkq2KWP1eAc13q3ks5fHReq5z4T3FQrh4WVG1942WhuAcqs7xXOCkCazkOYEv
	9MAYVoeWEJxlHzyX0LmtU8zxyZEVgmonrEaWuqdpmdyiGwbm1PO+I7qpZbWRerDxcLmU6CeHFwNqA
	c3LPkFZtYIlaoADHCwK7Nl7g2+TyzYue0fvbYhoS4suZlVpa4+x6ybd6bR+uGLx7opXAGn+gU2khu
	K/2M6Fag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhe7-00000005bSV-3bEX;
	Tue, 15 Jul 2025 15:32:43 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgDu-00000005If8-3Htq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 14:01:36 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55511c3e203so5164008e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 07:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752588092; x=1753192892; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMq+z0lTQ5uqzjIe7ORBXN+DvvALIfquyp6XwhodWKg=;
        b=JizyjbK1ETc7DJJnxDWYQHDIyl9IEe2ESUOfyjDWzS02UppUVn60TlcgJOf4OfPpgE
         +6rNoldLJzGQLL2nrmaHbTjfpHODr1V9A0yrQPDwFvT2ObLcH33UzZB5G5zs19VGRwzb
         F97IOvemdfN9ABgqGQnnrP7bHuzATCciv1IJRRTGkcBgB1YIytUm381LAVhtJyn8Rlta
         8lyYxhITU7acGFa7ZO7avnfuXNHUW4RDzXEXFjXrkHUq0wh53gC00+ApkHB3VIZa9BA3
         D0mFhD5RY0a7f/Mg26ZXg6xsrrLJgoRxDRKRFZm1Xmf/kSGJA00iOHbb+Kk2nCf5gOuC
         D2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752588092; x=1753192892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMq+z0lTQ5uqzjIe7ORBXN+DvvALIfquyp6XwhodWKg=;
        b=KXYXame1gurfuNlTS90rdzMgaidWTm4niZyE7oU5npGpZ827rG1UzPEXjqaJNQLdsr
         Enn0v99mHk1qhvu4+GkGdztSCi0BIZijNEaQPo1ELlgS81aZL90uwPRWYjnawf0V4mv7
         uQd3ciu61CWDNjfjsWWUmDV+CsftyILMc/mmKyO7iCBS8I0L4ADmrLS56GTy5TU9MR3B
         NgUxag+0ZoIkcE5It1juJIMfo8SXTBDuJncFhQIXw+JD8/cg0RGEYjVnnelXZhpXjN27
         25cG1SWirPsBjuvB6u2bvJggPrd+K0eKm2VkntciuOEgGuIx8RkEK2oSX0Qj73xXt6sI
         gpMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8TgrgBHAoLV99a8X/RgzNoQqO8M94fzMLi7U/QWd4C3sKR//kCN9kKt1Eiprwq/pgRNd8Ciu+cAwl8GDTqT8e@lists.infradead.org
X-Gm-Message-State: AOJu0YwW+GagCyolllCpTzZjRBd3KqB5c3GnWA71tgggzLVXjDG5rGRh
	2j4hcIP/L7fRGcPZFW907kuYkXwDaEmTJcCfyeQg1Um1JOdiJ/KrwDnHp7KCorSysk/vgjxWDr5
	lk/xGaq7kX55tcWdgFU6wNXsBH6CjdyvKheWVQ+xPaw==
X-Gm-Gg: ASbGncv/LMvP9vOq7nc1Y3RQ2jRo5s6gdeDtoVBp8PEotkSht7aj9DvEkJupV0Ehv2P
	lsQdVsFFbeNqsgDwQvPBkKCACxFay3N6BDlkO63h7TrztE4MQcCl+EcwnrRABtsMMHkrGOOhcny
	RmE9F85oNc0e+72sh3W9UCm1ayYuuqyE26fGEFbnlyatw6UaXT6h8OUILQU6yPIz1MqGY8Inkx1
	1IbJWGsGX7yjppiIQ==
X-Google-Smtp-Source: AGHT+IF13ylGotB5yILT4bHb/RqmaS522PnGXIijvb1MELLLon8vaTv/g4ADQmp0eDqrLOLp5d2POnBSPsqQfLVeuyg=
X-Received: by 2002:a05:6512:3d0f:b0:553:2f47:ed21 with SMTP id
 2adb3069b0e04-55a0460950fmr5418782e87.41.1752588090141; Tue, 15 Jul 2025
 07:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250715100415.60487-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250715100415.60487-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Jul 2025 16:01:18 +0200
X-Gm-Features: Ac12FXxwgG17tM0pR7Wbn7eqRk8ggfOlZMUUBSReGExBS5bLfNdm4fWxeml3fXM
Message-ID: <CACRpkdZn9ePtwBnxNoy+nijc-oqu5zWoKc2O9QDe=MsgZpRdKg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.17
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_070134_821951_B1E54DFD 
X-CRM114-Status: UNSURE (   9.02  )
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

On Tue, Jul 15, 2025 at 12:04=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.17
>
> for you to fetch changes up to 683d532dfc9657ab8aae25204f378352ed144646:
>
>   pinctrl: samsung: Fix gs101 irq chip (2025-07-05 09:35:22 +0200)

Pulled in!

Thanks Krzysztof, excellent work as always.

Yours,
Linus Walleij

