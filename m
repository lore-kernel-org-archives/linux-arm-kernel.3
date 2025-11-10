Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436C3CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 20:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mh/JsKiFmpvDenrO2RV6pyacRnngWdajIKt4QMpWgfw=; b=fVcmvpCX80YFbsPtJRU5doEWEW
	ibyo4EHucH0/eI2bwH6RijBuqnUxZptMlVi3rqDlENqKzD9cDnAllqMZDAj8H5ngcK6Q2J7lj2ma2
	hgm/tTyKj42rEe7xrvarm1RgPZ3QMP1omiWqhT3IYOPShZ8lgqyKS36qN6qYwrI8NABMkQeglOxcy
	cw9BEpuSzBceQq57y2YrmgGoWNcGo97ZMGtZ+gGXHQH18pQyf6LtoLlSpMgf8GSgJslxbS0A0oGM5
	3iGFYB+WNLzNAzFWYcDB5V6SCu010FKl6xdIJUQDliRGjDQ5kcmT3gQlcc4iRjelBURt/syjzdI17
	8EA0IATw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIYxQ-000000068kU-2MKd;
	Mon, 10 Nov 2025 20:57:48 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIYxN-000000068jw-2np8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 20:57:47 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-592f7e50da2so255229e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 12:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762808263; x=1763413063; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mh/JsKiFmpvDenrO2RV6pyacRnngWdajIKt4QMpWgfw=;
        b=p1ml4qVjUBUTmBrq/Inj5WCpmEb7aiub8k+sr3ba4kfkNcfCsITrkEHHEGAI3vo22U
         ALcqqaq4/lhcJmDB/n0bsR7xiRIiAqQ4v2ItyGa5JvISJDZUnzflJbgP8KRxtWUuTBsW
         R0yMiZpPNhD9s2C7sf0CqrsZGjFq6Mgda+PyQbL+MQc2ke/03ZiznvtC8+1v6lXzhdDY
         Yur6XqBV50BZGClRrXNiE4RM/HWyTTZooXBVxsliLOdlbVCIvYtrQA2GRxj7xn3Y/6NR
         Q8paJsE7VhB8CQadcb/kHLn4xyBguRVhrLL+XRJqBkaUAIjplfWwPPP3H8xnU6atdQrQ
         U5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762808263; x=1763413063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mh/JsKiFmpvDenrO2RV6pyacRnngWdajIKt4QMpWgfw=;
        b=rpJPW8qK0Z6lH/h23NGr9P7xYUZYvQ0Ba5rx/JCKRzKfE6aFSZSN2YnRKNM1n/YWUF
         Pp+TS/rHvhfQ88KBUvrGxQPdI0BQNS8qGPCwJAI6lYGQEAmhlf2wJevUa9vmXVyi+29G
         FrjmkoYAfvVMU6PEu3KSkMsxcBhjMRMBk5gB3Ay6AtynkP87g8DMDYbxvQ60PRQkfnZ3
         u8TiCfJYGy/MQwCYWYSkdj5cPoUwjwFSMu6Pv6KLfb+msCfwp9ToWr2fDCSaeJc6u2bG
         bZs8t7q/y3IPiogAWbrfWhBq7wYDrPAvhyC0Nxhyv02B/5h9gg2WjAFlZi3o49mde6/Y
         mlwA==
X-Forwarded-Encrypted: i=1; AJvYcCX60L58hKT+MVMbrjNks3omwEcDVeg97FfE0x5ycwzYHe9JH/TZEq6pSfwdeQNEqm2x/PYHoHWXebjBKqb+WvEJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx3hjlfo4SDvMMmmFEfI9KmFbk3l0RfGTYuLkvnO6GDCfFu3OP
	ojSFcsmHXUAuWuCbqsXWCdO3Sra3agYr1z/ZFC4BiQOYshtARqKj5moOOhK+VmyRg1wFWdJOP+K
	/5/sFNIeKNAKRFrkRvajVb78Wgh7kIp/+jnSMH4gsdEjKr5XVVbGf
X-Gm-Gg: ASbGncthA5NNwbNU4ihtt1IGjkQBaPcS+IaRwLteDqPX/R9vzi5YR4KBWk9B0RCtTsc
	NdtjmOsH9OrKRPhMuVMuzGK4r+8PMhpEgTFlc50U3oY0YcAt0S9rBuGgNJ5bLUB0223MwloQ2b4
	UEUfNg3mteq630yjqi1u53iPZgmaXJ9EtX3oJ/oCqPHlXd8c+0mHq3NZ9NXG14UUjPHezI8vspw
	R2OgjiAxju5Rk+CklKzp6f+N0G/ITn3UTEWctdk/zj3PdVGE4UCwW4YTTzSKD191WZHIDY=
X-Google-Smtp-Source: AGHT+IFHiFVtHs99mXmuYb2B2m+2rnv0hdsnrgmUGdiZxDbZObBH5hPXt0Fy2L1RfDUF3gekviGcSla2Cs8MXuCvEww=
X-Received: by 2002:a05:6512:31d1:b0:594:5d87:af7f with SMTP id
 2adb3069b0e04-5947459355bmr191945e87.4.1762808263115; Mon, 10 Nov 2025
 12:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20251110202748.10090-2-krzk@kernel.org>
In-Reply-To: <20251110202748.10090-2-krzk@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Nov 2025 21:57:28 +0100
X-Gm-Features: AWmQ_bmB5CQero0WghGpIbdSZsMKfEtwVkS8ALsJg7LOxphzKT9kTeNJBD-rCAM
Message-ID: <CACRpkdYvPS=WDLuUiEovtSsY=3JDqjb+8kKDZK2=FTj4n+qs-g@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.19
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_125745_769864_73DFE09B 
X-CRM114-Status: UNSURE (   9.61  )
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

On Mon, Nov 10, 2025 at 9:27=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.19
>
> for you to fetch changes up to 3cfc60e09bdc95483875f0b63cfdc23aea67135b:
>
>   pinctrl: samsung: Add ARTPEC-9 SoC specific configuration (2025-10-13 0=
3:02:21 +0200)

Pulled in, nice to see some conclusion of the ARTPEC work.
Thanks for handling the Exynos pin control!

Yours,
Linus Walleij

