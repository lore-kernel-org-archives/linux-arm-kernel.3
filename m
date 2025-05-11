Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968BDC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 17:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htpdGgGE0WJqHpqKCEDMnW5Vc8YelVzDOmwa66AXTRc=; b=Ph8hEfLbRkHHBXzfGfnFIzFMqh
	b471Y/8ccCyGEY4ccqUdCYC796SPg+XPd9oqfY4Z71ZgB4ki6qtopG9mCAJAlvB33GOEO1Rfu/Xg6
	cxHAIHGz3b4EgJhiyw1jic9T5zQDEij41ean49gb3mdsIBNOIPlR/45eBJDgeKFu1K7p70Bmpm/5d
	kPr4YYdS5RbdJgqEh5Mg6RgpxeFJEgVRoul94K0PeCPzdFM44G4oDbp6l4q/kZw/BiyFYdJxyXTJz
	8rFEMtbwcdRWJZTeO29b9i+EWZbbV+YHO29NQ+KJFaVF2/1MEd8PSYI+vsv8z9nDb8O7HKmeYy93r
	sfIDg83w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEAfL-00000007cag-0H1s;
	Sun, 11 May 2025 17:40:43 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEAdG-00000007cKi-36hY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 17:38:36 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b20d46fcc86so3409204a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 May 2025 10:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1746985113; x=1747589913; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htpdGgGE0WJqHpqKCEDMnW5Vc8YelVzDOmwa66AXTRc=;
        b=ZcLZlmk0MyTcoE3r++J9d1myPyhqyjOPSYMNw0Hl22QubXgXbihK5imena2saI25os
         oButsZIU6hy8lZ3a+RZj82RyWG/Kq0cCQSc0dYYhxtBCw5zpPdwlYdNn/jDpsnEU7umQ
         MiVVxqiiFaqFmpcssyiGDGJd12wnVrlc7HhuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746985113; x=1747589913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htpdGgGE0WJqHpqKCEDMnW5Vc8YelVzDOmwa66AXTRc=;
        b=Zhq4Yh739qso3kEH+xIXZPGR+sjJ8ZTS8JnJh5MQJptdzSyBewRLwdd2GKuV+/ht6w
         PzCQBVbfeyrXwca3XsXWZ1gNJtKXX2IjJxm3pBSlZQ25g31TolWjrJOPOcjMfpWZ4XtB
         53lGDqaCBPhPjAIZiQUqX88obfDPagSjcmwtfC/uzBjUeT+Y+Pz8cjPt5bCqhtYuuezl
         h6bwwiPXzmkJcXU9yl5uCtIIBG+nXPomRxtCLWfEgfh3DGH0M3GLe3TV6m3Trsjm5KgQ
         tE6b1fcBUO36Y4BXaozyw5GK+EsKwQ2N+6QDfnQmwHJab25GwnANwzzZSQrWsaKKp8J2
         1qZw==
X-Forwarded-Encrypted: i=1; AJvYcCXBqeoXrd+A/yuV+uMMSGvk34jK1znPl367yg3QA3xXeYJnXzKpdLyoO28YrHLkfW2Aexr8iytYDO5RaFIB+U6m@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/MXFKkow97h+lqPMUzvaWs5XXeyI04jLDBZekEywCJN8zwhvt
	mw3+J1KWpR3z9Yns3XRXKHi7kvMc429NmhoEI+0dBBES8/72N6tN2F52QigqsSiFJuvvpZDN38C
	vj0X92w/qYGTP1yxYkxCIW90Dh9ExWwTeWkP8hg==
X-Gm-Gg: ASbGncsOuzcmj41MiRnI6+HYihaBJ2oI+HjN0iOOiQEiDDN5xaDarqpyIqcxDDGepsF
	q8bxCaZzG9t/5vydD9jPUDh9U1W75xGmh50BJxFz3MZ0ckCLIiOT8N2JgXEG1SqtQoQ5kP7bPKz
	30VxCFoGM3V2Vque/cUnxwaiYDG0G7NT+2vNPiovCwqupiQ6eaq4Kih73v96TD9ZtAxOapPNAFI
	SV5
X-Google-Smtp-Source: AGHT+IGlWFjDOSR6LptznPfsrBGcmLqTeFU1+S1/2WDCbsxyxoLwah/czQtlkvxYzoeR/HfJw2W1NJ3/is38sxpCk0Y=
X-Received: by 2002:a17:902:e94d:b0:224:24d5:f20a with SMTP id
 d9443c01a7336-22fc91c2cdcmr176733505ad.48.1746985113315; Sun, 11 May 2025
 10:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250511172732.1467671-1-da@libre.computer>
In-Reply-To: <20250511172732.1467671-1-da@libre.computer>
From: Da Xue <da@lessconfused.com>
Date: Sun, 11 May 2025 13:38:22 -0400
X-Gm-Features: AX0GCFtg3EgdoWRuH-CkzemoXtkQsOI76TednUqqH8u_ZIuzhBzf52QSqYFsAO0
Message-ID: <CACdvmAiqQj4NjazMvdwQtB5zX+SQs7bwXEchT5thNM83=bQBhA@mail.gmail.com>
Subject: Re: [PATCH] clk: meson-g12a: fix missing spicc clks to clk_sel
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, stable@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_103834_858031_B54992C7 
X-CRM114-Status: GOOD (  18.35  )
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

Sorry, this is an older version of the patch without Fixes tag from a
mv error. I'm sending a v2, ignore this one.

On Sun, May 11, 2025 at 1:28=E2=80=AFPM Da Xue <da@libre.computer> wrote:
>
> HHI_SPICC_CLK_CNTL bits 25:23 controls spicc clk_sel.
>
> It is missing fclk_div 2 and gp0_pll which causes the spicc module to
> output the incorrect clocks for spicc sclk at 2.5x the expected rate.
>
> Add the missing clocks resolves this.
>
> Cc: <stable@vger.kernel.org> # 6.1.x: a18c8e0: clk: meson: g12a: add
> Signed-off-by: Da Xue <da@libre.computer>
> ---
>  drivers/clk/meson/g12a.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 4f92b83965d5a..892862bf39996 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -4099,8 +4099,10 @@ static const struct clk_parent_data spicc_sclk_par=
ent_data[] =3D {
>         { .hw =3D &g12a_clk81.hw },
>         { .hw =3D &g12a_fclk_div4.hw },
>         { .hw =3D &g12a_fclk_div3.hw },
> +       { .hw =3D &g12a_fclk_div2.hw },
>         { .hw =3D &g12a_fclk_div5.hw },
>         { .hw =3D &g12a_fclk_div7.hw },
> +       { .hw =3D &g12a_gp0_pll.hw, },
>  };
>
>  static struct clk_regmap g12a_spicc0_sclk_sel =3D {
> --
> 2.39.5
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

