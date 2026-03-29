Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2904BF3D605
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 16:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ln0AFKtiiOyd1awiSLR+/ZLVgvpXDVIqEDEAuJIpGl4=; b=ED+sEMPACRiVVK2eL0RaiE/xCU
	QiaRiVj7T52ekUpne/Mdq2QsOjXrmjjNvz+w9ZM73noaB/QhdO2DtMzTWpPx9SQ1f4KcyvDlcSY6H
	ybCH5gY/DyTA4hJ7xeTwupd3Hg/yCVZse4kW+z2rA0BxcslMhYFLzdX95MkTRttFsyT4Zh+RwR2Hh
	6VjZsqpvgRBj5u59BXlDjDcJgeyq3/EfJm/RGAm4jHTXxaNbUw6F+7JYyk0sYMiZXZ0jtdmIg4uOz
	gEvGk044vD/4t6CmzKa2ndmIPaS6QLslROe6fmaSnRbgtYCiVDYadnn0XrD1ud2ibUJhp1zIT+/4v
	0KYjqsyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6sqB-0000000A6P5-2k3m;
	Sun, 29 Mar 2026 16:18:19 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6sq8-0000000A6OH-3zWa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 16:18:18 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-662efd1bdd4so2119730eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 09:18:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774801096; cv=none;
        d=google.com; s=arc-20240605;
        b=EJbCilZgoTcm1x3b51G/dNpqe3l6sL1iLwIL9+kV6D6LBrgIpGfLW3de0VMk1WsWdr
         NX/Rz199osGqETZB6Lbcb85cT6jR7Z55yABqNJzy0dpZVxAygHLdra4ae+tajI/xQnsX
         UjRl44dW73xJr27LaZbE/EvjZaEqQuO9+ZTCaKCh7gFq79OZbqiZktn6d4rHmQCjlWzt
         bA/WkRg8zq8HOnFirZ6sSRsPcwBK8P9F6MkBttJ6C+XcxakOzKcc93nXgJkbjTslT0Wu
         1IyLzJR72rpBa3U+JBuwNFEVX3LqiDquH0j/Io+SgC48sj1zeImC7mE4rr7RFvlqk//K
         rwTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ln0AFKtiiOyd1awiSLR+/ZLVgvpXDVIqEDEAuJIpGl4=;
        fh=bGsnkbinpNeR/3NFumpmd6n1XX9gQMI1vZQONeh1MYk=;
        b=Y03e5YipzhPE8EdhuVicSkHcFT2Qm+7FHT63bqvZq9TQarX6x/Cu7Su9dPD7aBj06/
         oB2ha4RUP1oWqMPbVOEJ81OrtY0+xDHiang8pe0gPbJjGQWDMzN1v1xl2kC8iRPP/SqN
         DnprgT65Tbs1s9JP9WvlZlA17WlqsQzVUz8SEFk6ASiIqmw2IsJT/KOMb6IdJ8Ip5/bB
         RNkqrYqrb18AGcmtwIAXT8ob8sIyWURx1XP32agHVDbXsLZPdzgPvyBB3QlbKoU4JxtD
         K2RclYaid5vn/t3nmciv7UXu18tp6LdKjd9Fb59P8sF7Jky19BTq5Gfc/kX/MVFp8mr+
         Rtkw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774801096; x=1775405896; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ln0AFKtiiOyd1awiSLR+/ZLVgvpXDVIqEDEAuJIpGl4=;
        b=koUn99yYkIUNeUxQ8/RyJcupeoa69pZhQjmYSS+rk4E6Qzg1/thtZGY2LP6FRMTY6L
         RJL0gFdUvGH6x0W2+jyWlMfwxFfXp+vvFA50lqG0yjy+iNPSk1uqyA1Ckck9vY2d/iLk
         ucYb3eZrqHg/2QRQ21GjOBu2kXQmNbMGJ6N5sAGZyoldWjvmBXIB+e9UYbL1g0hNtuam
         OGEhb5nLBTY6S5mmJuxNZ24ldlX45i9HCTQSEnRri2DlWHjgz8L64gmz2pG/jRFfs37O
         6/5pU8CHpArZabcOLjcDeu5aLYuX+//r1GYT5zXU38fTL+YUofNe0rhPBBrwTw4+KHpt
         KCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801096; x=1775405896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ln0AFKtiiOyd1awiSLR+/ZLVgvpXDVIqEDEAuJIpGl4=;
        b=rz27L7j1rKzsSiObAukxEToFN2Tv9dqBhlfkdS8YYOCIfF1itQi6s5Emo4i+Aa72ZX
         i582WOM0wXfw7ZcPJowzuwE6hCY0uTMfH3SPrs1HwLQ0Eb9dpXEz5eGhdK+GZxEWxZk4
         wjLArHkcTMV1MNs/x5EAFr4+TgHGO9YTjKzFFq+c4ZfA02RH8aNRyWcEivF2vQXDnt6V
         Bs9xgY1H/2rHVaYk2pXMvwZuvkBNixGGN7biLOy3PC1ejgWHCN/ZNWt3Hjy1su+60h7o
         n4UkAfCim6a8iAEwmVGgzERdLxi2VKsVIhGwX6VZMiVrlax1nbs4vq4Di/fpwQufV0ry
         ZUmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCKqIX01xNwJqSrV1YnVeBhIDE/qrIi8YdKTFFvkKgrLF1YZxQJx9856IMg7MSTIULsxgkc9DVOSbLA50Z+ODS@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzm9bZMz4vlnLvhgZ4+/FbkBO0/Cebcfc03U13wxnuXcjxsZjK
	yi1lVYr8KQpkw0e21xmMqldyHuimi8DorescofhNqjx8XjGFw6302K0ZBEWwo6Nw13vhC1NI+MU
	IhnjumhmCxSKyWs1uiuDXGxLmSzZAbwQ=
X-Gm-Gg: ATEYQzzeRTe5g/N41/QfPR+cZYCWP49XQGpNfLiCAeAELjBADmc6T9gcgno9M+paWqX
	UmczGJ/GlGtd2zn6AcF/jDuz/4avN0qTfFB1v2UYgFEmD7kBA/0XhNp+A51LHpuQy+R5xYDXWVH
	4bwovf89sak4Dvj0xKRkbQTrdYuZCgv6g4psd5z+USotbQxyW/4TUwbpxVF8qE2KK7wHRzMWF/x
	OtvRJhERQ5fR7EOCG4ZryhdmNeh3eQALQntaGHqRwl8SR/TCosWsss5PIKCIKPS82HNlJhW46t9
	RHd0FISz
X-Received: by 2002:a05:6820:992:b0:67b:a85e:6ca5 with SMTP id
 006d021491bc7-67e195bd41fmr4231270eaf.18.1774801095746; Sun, 29 Mar 2026
 09:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260327151332.5425-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260327151332.5425-2-wsa+renesas@sang-engineering.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 11:18:04 -0500
X-Gm-Features: AQROBzCYhRSHffyuIz40Wf6kh2CMkJkh3NmTLvlG_EffDBSm87x8_smNNQuGVlo
Message-ID: <CABb+yY0KOk4ASTwomuiJC_XBGvpoAXEV3GhHYpWAbgQiOXZTLQ@mail.gmail.com>
Subject: Re: [PATCH v2] mailbox: exynos: drop superfluous mbox setting per channel
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_091816_998779_4E016E93 
X-CRM114-Status: GOOD (  19.15  )
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

On Fri, Mar 27, 2026 at 10:13=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> The core initializes the 'mbox' field exactly like this, so don't
> duplicate it in the driver.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> Changes since v1:
> * rebased to 7.0-rc5
> * add tags (Thanks, Tudor!) and dropped RFT
>
>  drivers/mailbox/exynos-mailbox.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-ma=
ilbox.c
> index 5f2d3b81c1db..d2355b128ba4 100644
> --- a/drivers/mailbox/exynos-mailbox.c
> +++ b/drivers/mailbox/exynos-mailbox.c
> @@ -99,7 +99,6 @@ static int exynos_mbox_probe(struct platform_device *pd=
ev)
>         struct mbox_controller *mbox;
>         struct mbox_chan *chans;
>         struct clk *pclk;
> -       int i;
>
>         exynos_mbox =3D devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNE=
L);
>         if (!exynos_mbox)
> @@ -129,9 +128,6 @@ static int exynos_mbox_probe(struct platform_device *=
pdev)
>         mbox->ops =3D &exynos_mbox_chan_ops;
>         mbox->of_xlate =3D exynos_mbox_of_xlate;
>
> -       for (i =3D 0; i < EXYNOS_MBOX_CHAN_COUNT; i++)
> -               chans[i].mbox =3D mbox;
> -
>         exynos_mbox->mbox =3D mbox;
>
>         platform_set_drvdata(pdev, exynos_mbox);
> --
> 2.51.0
>
Applied to mailbox/for-next
Thanks
Jassi

