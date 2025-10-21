Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A30CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 11:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fubOwqEF5m4iTEgESAo4RAy9nm9IW5bMGuJtgWmpc2A=; b=jroADYCU41V77peNBgIpKrUMM/
	amOuce/3tIAk7murac3cPg5ztOge7WqSJvsiRUGKKTMUavj+gTY2ScueF/hZyJt/h+EkAFOyIlcWA
	dDGdV9aZZFyvDQr9HX9vIQjlZQidv5TkEL3ZNdFY1kXR226jviECcFxvQ77MVX2sU+tbI7bTGKs/s
	cW0jeLiZ546a+CFBbPatpZ4bnwSFA6XJPcOVGPi0DERaJo0FmmwIh04KSDmUoOcubxDASw0FFqbMS
	WclB5f8BsUyfqJweTO7AtgwHBtcJ/E9DRKcB9TcilayRQ0NspV4ceYWcQMjRN2RtySVaXKZKXjLS5
	jhEfxL1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBArs-0000000GpDh-3tDR;
	Tue, 21 Oct 2025 11:49:32 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBArq-0000000GpCc-1NNg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 11:49:31 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-6360397e8c7so5578498d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 04:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761047369; x=1761652169; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fubOwqEF5m4iTEgESAo4RAy9nm9IW5bMGuJtgWmpc2A=;
        b=WrsYKFYBctFXmnTmjOlnJR5xCLeHUrvrsQKvdJx23N/1UTg1rSHSYf04bLPSa5adTb
         TytWeUSFGK5HC1vqqztAglPkb2QmNKQZVGlPtxzbY6Pjgt2hMKpjTsOmgdx5/cvTwYao
         xtCV9WC7k+BgL+8A6TRv1es65+a7XL4HZS78TF07J5RB+/HDHU6g6P4LnSjdZCtrbah1
         nJUOwFmHbZ1VyyGXiGnEWlqwlt0dNdYg4IvVFiGJ8YlKsdpHgfSVKep4HDSkMzYRpJ9u
         k1OWWS61wWgN6KX5APwvGFWVb1Eqjfo/kobQjhN0KrxjkHtjdfk8RNr5YkatM7G9bmWF
         ZMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761047369; x=1761652169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fubOwqEF5m4iTEgESAo4RAy9nm9IW5bMGuJtgWmpc2A=;
        b=CaM6DalNaHbFjzY+vp6gl4LrgeIO9azx8VJaWnc2sSdLC39Tmn7OBmRt5OzEBZcTOI
         6mSDKcXMwhz0lje74cyhCXV9I1Lw/LBK1gq+UQGZAUVj7FoEql/HU+mFcQ+UrNaH38sX
         poRe/zIS9jl8znOVFhHsefNlaR3MF7dOaVtUeUwD3VSTrZMwGaxr/FZroV/ZfZbH8gkG
         LmV/iBzooVXIKH9Mmc3rhrIwESvxTca/GOvMzUVf8A1L+TCon1jdZYsrDCObqM7vzhn+
         iUCmK/UbQqDueFmHQyBztLqhULZYteX7ylwB3Je/ED05C25jzxVNfCF0BUiKiQ7Zu3Dp
         ZQXg==
X-Forwarded-Encrypted: i=1; AJvYcCW0XQVSB2eoucrVwPNFYR8Z1PAHX7+I4bFXoqBB8Xs6YZNi0rwLx9d69rdmC9OoDOoyzu2x9puS04VHeThODkSA@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6h3kMF4BkDLyae9Uyjy6oK/kjvEywsTebarljrPEWJOWLbBku
	wqPA7CoUbTGSmi28gLjWXV6ahxkkxPO3vGFu1uSQ2Gj8Dh8OIRcGVAIZHtBiWWNlCSFhcUZwHXS
	068W1EsrIDRj8yBRXFTnn0N6598KHLLu3quqiDZr2hQ==
X-Gm-Gg: ASbGncsHd03OC9OR67QkzKJUVmd6K+w86/W3GyRB3x9pFLem8i0SMoiOGk9h0tl95Tl
	Fij2uLkc+ZwzYZ+HJQ6d0V3Tn/XOkCg8aKTSkGqHwGF9UlTMzUO0VYa5lY5+nVn8AxOKuj6Ifrn
	Z9jJPUesyGagE9+q2HgESCZ68HDfL7aNBlZBZbfO/QEroQg2MxagV3hHOsDtNs92pK3T3uqqmrZ
	kMTSfGCoxlnLWri+mnYA0kQyXKX2xqR2umYeHpLbKMop4+nZ50bQmLnZwhmjxjbqdntWZJi
X-Google-Smtp-Source: AGHT+IEX5EIQW00Uhs2bIpyFF0ijaBeRJMzLKujj9MqrtO2tueAMtW7djGBXmY2z8UScupISr1c9QvatdHv47ULSwbw=
X-Received: by 2002:a05:690e:429a:20b0:63c:f5a6:f30d with SMTP id
 956f58d0204a3-63e1625d3a2mr11019453d50.55.1761047369000; Tue, 21 Oct 2025
 04:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <5fc18699-74ae-4f31-8794-bcbdc5ae6008@web.de>
In-Reply-To: <5fc18699-74ae-4f31-8794-bcbdc5ae6008@web.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Oct 2025 13:48:52 +0200
X-Gm-Features: AS18NWDTVlWL2LNpyLMYdbOrlY3koMXJk_7WrqzsLLVdbjx3f9u6XYsg7juwU3E
Message-ID: <CAPDyKForizdooge04ez+cDhLW6XFHwhDPSE9fR-2ueXej=J3pQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-of-arasan: Omit a variable reassignment in sdhci_arasan_probe()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Adrian Hunter <adrian.hunter@intel.com>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Michal Simek <michal.simek@amd.com>, 
	Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>, LKML <linux-kernel@vger.kernel.org>, 
	Anand Moon <linux.amoon@gmail.com>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_044930_399840_0E94ED09 
X-CRM114-Status: GOOD (  21.33  )
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

On Mon, 20 Oct 2025 at 15:22, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 20 Oct 2025 15:15:07 +0200
>
> An error code was assigned to a variable and checked accordingly.
> This value was passed to a dev_err_probe() call in an if branch.
> This function is documented in the way that the same value is returned.
> Thus delete a redundant variable reassignment.
>
> The source code was transformed by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-of-arasan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
> index c6f09b53325d..b97d042897ad 100644
> --- a/drivers/mmc/host/sdhci-of-arasan.c
> +++ b/drivers/mmc/host/sdhci-of-arasan.c
> @@ -1991,7 +1991,7 @@ static int sdhci_arasan_probe(struct platform_device *pdev)
>
>         ret = mmc_of_parse(host->mmc);
>         if (ret) {
> -               ret = dev_err_probe(dev, ret, "parsing dt failed.\n");
> +               dev_err_probe(dev, ret, "parsing dt failed.\n");
>                 goto unreg_clk;
>         }
>
> --
> 2.51.1
>
>

