Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE086C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 21:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30oeBRC9xhWE/gLU7A7qEMlCfCO9Q3lAAEFktP0zyns=; b=Eka7qLo33/ZGgC4R+sRCTLEO0n
	02q1+v8fuix0ZgMwCOlVUWj7NA1QFLq45gMqS/H4WV5jNN9r6uOItURZuOMJ4qdIH9eLgKZUfb/qQ
	bBxNRL6n1VTyZ7Yxd5BQwbGeyIFbmf9jX5Zsv6i6aK7iAmutX6q5J4fJFTS459ixpiy01uxANhFMg
	9zA7esudYsYRorkYucTdQzqzOjNEHoOMzHqHtXx8vQbtK0Kzh1p7ifJ1C/xZL9uTRTZDl+xFehkGm
	9PbJix/vCE9TJttBsoDTKfPGoDrt8dEIa448TN5LWiELTcFzKksqhevxYjFvrmqjlONNJaq1hVH0G
	h9hlZEnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBZi-00000006unt-1UBb;
	Tue, 24 Jun 2025 21:53:06 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9a6-00000006e7N-0gr2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 19:45:23 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-3105ef2a071so69028011fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 12:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794320; x=1751399120; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30oeBRC9xhWE/gLU7A7qEMlCfCO9Q3lAAEFktP0zyns=;
        b=UavIsO7X8PVvhYpm17ne7NN1fyXOKn/I5up4FpdJ8cuo1uTrpCvUmY0D/NHCoY3hIm
         QAgArK6HDcMrkVc0EnLET+khw8oj1aF4g3LGqbfEJJQdKgZCPW+rKmhMc3bcZE8JRq2H
         sigZpghFWPTiWQ4gpvO1c2XLImw8XCeUZ6MxE9qco4L0GxBlKAxWK56TgvtwaPi5xJJG
         KdVTP50AtKGJoKBfvQ+ECmZRAdLtB5eCcaC6ZxNVcgFBkv1v3zT6EbMCe7bje5EC+2Cq
         Yow1AGac1jXMkSMZdMzr8LK6t6Vdbl8s8Qxgpilbu2Rm+uv3Ol38SZK/y7w4aKVARkcW
         bzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794320; x=1751399120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30oeBRC9xhWE/gLU7A7qEMlCfCO9Q3lAAEFktP0zyns=;
        b=WWpG7Y7y2guyZz7F7LbOvIjilhvGPAEQVnt4+TCAh8CNuEiM6JeqOIJPcmBT/v9zRk
         8qZzSUJHmKF7XgAQHBb0WsNm2M7ianIwa8UXbSw8Suh2Yy83LytLSEzhQ9SFuORw23YK
         JcDKX9Csdk9TtoDxveKCNgPMKBpMZ1VMzQhzLNvYv1Zgaqaqg5sZ8AyMjkrMHmFZ/f4Z
         An4LRhBYFq374kpbCu82ii77+0eHgCzjnSrXviRo2sL/GsavVLVwZlXKsyohN5pb6oH1
         NVpdRgjgAKwyjq0n8s1x3TIuvbZRfwuqhAzuxN1Yk3gmrSDYs/c8sI6t70QMoE/OIJYJ
         /TNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpOmfyjI2GYCgdyAydYH3ytGa4UCebZMUaw9PoCrRJDd1TL/Lszd0VlsG0sKeNo+9ouI1VmcVf8jEqKL08L8Ha@lists.infradead.org
X-Gm-Message-State: AOJu0YzpHKoFcemaROssR37fQS3HYpYNVThfywYpF2a+dA2ryELZlP/z
	V1He7cxgdtM+TGWH1Wlqwa9fyWJ5jV1RWX/W5xuLsulp/UEdVICxBjRXeGaTSY5wY9clOtnKI9Y
	vDjE+59Nqeaged8jJRXqdstwdNzl78cQqOh5NZ3ICgw==
X-Gm-Gg: ASbGnctQMdQ0KmW1RmmtaYXe+UnlK5nX2bZSop1cxW3vWrq1Rxb2UUE/H3F5QvspUOY
	JypNIilClBbVzYJA+NQ9prP4uiH0CL8ozcIBTU7D5YpYk1kFIGAHPyhWB4KgcFip8+09j1dhmNe
	X0y6MZfEZW68I8zWvTxq+j1PuX0hPs8nozqdtHnPY4DLw=
X-Google-Smtp-Source: AGHT+IGHrdlGkQUWphFDOu9KYoSs8Q372bw5fsoYgco33pNU9fbGTgKUqdcWmtZRyS8Ikc4JU9SHkbRiDX4irW201y0=
X-Received: by 2002:a05:6512:1396:b0:553:2bf7:77be with SMTP id
 2adb3069b0e04-554fdd0ba1dmr50743e87.22.1750794320312; Tue, 24 Jun 2025
 12:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:45:09 +0200
X-Gm-Features: AX0GCFu6Td3LW-_JOyLEYO7GYkA80dSGig80su6HVwjgXpS6hbnfvwIR-aklY7E
Message-ID: <CACRpkdahd=5cdjL4Je4_PqFmV8dkSuuuRLxdPB0n0-gyFKin4w@mail.gmail.com>
Subject: Re: [PATCH RFT 3/6] mfd: vexpress-sysreg: set-up software nodes for gpio-mmio
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_124522_208937_484BD2EF 
X-CRM114-Status: UNSURE (   9.75  )
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

On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Replace struct bgpio_pdata - that we plan to remove - with software
> nodes containing properties encoding the same values thatr can now be
> parsed by gpio-mmio.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Neat!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

