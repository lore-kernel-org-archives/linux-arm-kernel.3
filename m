Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB5DC9830C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 20:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrgl77zcKnWLxzpIMhQvmyDGsnBn1orcJjdPE5SYcOM=; b=YOaNMYpN+lnfycrZIkPFWdcNxx
	C2yh2zCi0m/lK/PjtQWDxu3SLg9eqNdNEHinHumD4TgwG1vR36ebT3SUdJlvq7yBhktorloB9uONL
	CzUc9e1+pMPjaAyWrDMep5y3PmWYKPfdTQmXT11LxrROu65csyLl73LTAPbLbvvPFx5NXrbtMMAuW
	Ku9r1aJhznfWJXF3UIKOCX3rypC0f5PC7rtXhLXMVxuND/TgmzSGwER60YgSBpfOCqwlSFQjj0WJK
	OPnkZB6nXRUP4FVuJ16bhstu5AjCRL3RYA/U3BO54QP9lZgkcE37R7SLDeYfOb+svLBS1ApgVSbI7
	X1BRxSig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZnl-00000000yA3-1Ewk;
	Sun, 18 Jan 2026 20:55:13 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZnj-00000000y8l-0gig
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 20:55:12 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-45c9f47e1e8so618859b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 12:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768769710; x=1769374510; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrgl77zcKnWLxzpIMhQvmyDGsnBn1orcJjdPE5SYcOM=;
        b=Pw+4MCC9XqMJGpiUUxgMFfEedya8qbXNFQ+0wKXH2XjfZlYUhLjo1V3I8V8i+jVe0s
         b1zwz9KM54dCQOTd9C6nqmq4JG1dad+f47hcqKB8Pl+MjqoQuFvv4N21o3Wqq15rOb2d
         qoR4k3FG8IwNDxnGSrGgNO25tBOw8yUNS9+Lk6sy7Sd4TCJ8HVf/DNCd2UPwc+lGuZFY
         HMdup/5rLUrDPhbroZ/7YkGb3jVfQtyTmR4yBUP5ed5gji5ZC4khKjrw6fEA8CEiNsUC
         s6fyl1W39zFHy2vj+YbQytNOCgXgoSTzxzQmIge9wdp0V/QWX2piePq4ppMtMoryZx8C
         /dAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768769710; x=1769374510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xrgl77zcKnWLxzpIMhQvmyDGsnBn1orcJjdPE5SYcOM=;
        b=jF1a1s/nxSTx5UdWCv3QEB+Eqf9M2YX/q0P2lWkx8YyRbOdMMLqHy5uNc7W1ZjYFDL
         vuvDhjxPlSgxMWXha9UGnaw4ICdKWMSCE3cNwp3j5umLu+jdBwkVhsVTGlxKg2cVsbRT
         9xP95ghI/dMmQDlrrcLmqa4NtbXOZqaTxc2AFnV4Iv48P+0f2IO2vQCSbhg9OjJtqtZv
         va++jBJ1iZbjaj59nJMaI/ZEUejSrMsW4SrzanfNLD4RbN7AoZHj140C0+rgCLgTq6hY
         icHSMEBbeTwbeenas8s7fF2uBxn68eUhShOAqpwWoUqkbYUDKBUg4cEdeqz0V8iz7hD3
         fbDA==
X-Forwarded-Encrypted: i=1; AJvYcCV3jd1ekS2vEcDKuwe6K91t9/jxjO9Vn5IrlRpA9wow93KV4Zosa6775FNjuFZsLRwD5sZ2HFyQtDwyBtTN8l1V@lists.infradead.org
X-Gm-Message-State: AOJu0YxKAuhDIDGZlRFgFyy2QOxdlEvxXQUPJhf7rdfoUg2zlCpZzKXc
	MHn85pGA+zlqU89VZcdOLsJLev0NzzUThkuAl6Qhca3xRgwq5Zvlcz1E4YA9pSfLLToMq+wzFcN
	JFr1rzw6OgZGKx0Dh9fB47RO7wT0FYC77v/9DcNY=
X-Gm-Gg: AY/fxX4QhQO9zzIwLL1Q4qnziPxHGeREh7qJC67PQFZ46eqJMc2cqZGqetTR0jLxOHG
	OjEbKkEDaOWt/yAHrS6UYhM4Hk3VYEx7BUjHk6yq0ybq0fGziyza0XcnRmmlGnxtAzCmbfXyizl
	47up3oCQgzJmPn02Lqvy3leiY4R8ltvE7DR2XAayJQzS2sPGqMFE90c6jz5KpkZS8wci+j3tI3n
	2Um9OC056U8vfj4pKRZje1l0hro6gu4c1gynk3+X6Vacwq7SI4Z/CUC4Jq9/zkGp8Ktq+2b
X-Received: by 2002:a05:6808:1796:b0:44f:ff2c:f65 with SMTP id
 5614622812f47-45c9c14fd09mr3833538b6e.38.1768769710061; Sun, 18 Jan 2026
 12:55:10 -0800 (PST)
MIME-Version: 1.0
References: <20260105-mailbox-acpm-pclk-ptr-v1-1-8474de8c4584@linaro.org>
In-Reply-To: <20260105-mailbox-acpm-pclk-ptr-v1-1-8474de8c4584@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Jan 2026 14:54:58 -0600
X-Gm-Features: AZwV_QjtmoWR7zpXN6PxwxPWVnylbaevwQAzHArvG4i3Nw7LDMwRySbg8e6wc08
Message-ID: <CABb+yY0YVfWi5sUOn=LWndy9Xpo8ws+cSJ5LYXagJ2uOA0B=LA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: exynos: drop unneeded runtime pointer (pclk)
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_125511_208793_7B9A2759 
X-CRM114-Status: GOOD (  19.09  )
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

On Mon, Jan 5, 2026 at 6:34=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@li=
naro.org> wrote:
>
> pclk is not needed past probe(), just drop it. This saves a little bit
> of runtime memory.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  drivers/mailbox/exynos-mailbox.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-ma=
ilbox.c
> index 2320649bf60c86980c0e8554f2d5fd32af218a6d..5f2d3b81c1dbec8d1a1535376=
9b4b3a1d6ebdf21 100644
> --- a/drivers/mailbox/exynos-mailbox.c
> +++ b/drivers/mailbox/exynos-mailbox.c
> @@ -35,12 +35,10 @@
>   * struct exynos_mbox - driver's private data.
>   * @regs:      mailbox registers base address.
>   * @mbox:      pointer to the mailbox controller.
> - * @pclk:      pointer to the mailbox peripheral clock.
>   */
>  struct exynos_mbox {
>         void __iomem *regs;
>         struct mbox_controller *mbox;
> -       struct clk *pclk;
>  };
>
>  static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
> @@ -100,6 +98,7 @@ static int exynos_mbox_probe(struct platform_device *p=
dev)
>         struct exynos_mbox *exynos_mbox;
>         struct mbox_controller *mbox;
>         struct mbox_chan *chans;
> +       struct clk *pclk;
>         int i;
>
>         exynos_mbox =3D devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNE=
L);
> @@ -119,9 +118,9 @@ static int exynos_mbox_probe(struct platform_device *=
pdev)
>         if (IS_ERR(exynos_mbox->regs))
>                 return PTR_ERR(exynos_mbox->regs);
>
> -       exynos_mbox->pclk =3D devm_clk_get_enabled(dev, "pclk");
> -       if (IS_ERR(exynos_mbox->pclk))
> -               return dev_err_probe(dev, PTR_ERR(exynos_mbox->pclk),
> +       pclk =3D devm_clk_get_enabled(dev, "pclk");
> +       if (IS_ERR(pclk))
> +               return dev_err_probe(dev, PTR_ERR(pclk),
>                                      "Failed to enable clock.\n");
>
>         mbox->num_chans =3D EXYNOS_MBOX_CHAN_COUNT;
>
> ---
> base-commit: f8f97927abf7c12382dddc93a144fc9df7919b77
> change-id: 20260105-mailbox-acpm-pclk-ptr-c25c99dacb34
>
> Best regards,
> --
> Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
Applied to mailbox/for-next.
Thanks.

