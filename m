Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F563D78321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwrhmBccWW8HQon2HiXiBLIuwsxbffUhpKyBJpHJ5sQ=; b=eMRao7wkCCcrvKe738/sYhY085
	JVh5VYuC8lzHvrMZpnIpZsdCQvd84mW3+dr7zOyN3/qIqwF4Iwq6f4HI0ARKKbYbhZZHzmVvxpbuy
	PZdAKDqqh0hj4veDXLLqzVsNxhzQf0fW44mcQU8+dg/pPV9eHv5obAjE32ivqKbEschDc9rvSeqe7
	ImnG7vsw0ZDjoaiwg6F8sbpD8j4c/esebr1X6OHQOxmV14Q2Ev5TeXc2GRTq4et7dsIMrsaa0MCN7
	6xgHqUySUKT+so4sK0+/KlNjzTbPcd95WNoZewkgKFLvyB8XANRfvwV/9J+i62S/Aac8hUz97XWvC
	I7hJ8xEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8NJ-00000006f0m-3Ofe;
	Mon, 02 Dec 2024 15:30:13 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8ID-00000006dvW-0Xov
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:24:58 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6ef4084df4cso38205737b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 07:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733153096; x=1733757896; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MwrhmBccWW8HQon2HiXiBLIuwsxbffUhpKyBJpHJ5sQ=;
        b=e6HqVIBMOdlYxvTYpuf/EDShfMVS2ahJWqjo7RRe7pEseVRuEg0utiZ3WD64nYs2V8
         kr9Ak8tswK4LeNddDr6fjKHnGX8my45ON4RUX0v4Ic3/pnC4O8g0OeQrlLAjMehDAEli
         avnlLZk/asdpoWoSujwZo2K+DyxxkaGR1Gex0lWotD2nxtfpbGhVREtJC4OkrOfHmUsk
         yQ2wy4zw2FB53Z13Lt1uKhmmVyZrgv9K6bLwWOhq5bGeY8yHIPSG6sqCa4P3euUAVrmf
         E62M0F0EKObYZzJHS8a1wGVNtx6QJvuV3XjYj0bWFf4rLt3uVBXbNC+rWjIV6OGRp2H2
         zWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733153096; x=1733757896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwrhmBccWW8HQon2HiXiBLIuwsxbffUhpKyBJpHJ5sQ=;
        b=ABU6F8qj3uldtik+miupTIH/60dy+IG0+RChN2pfiuY9R1MQnbhOpo3dtQwGZoRkeV
         NOJpTvpeT4DaotzxBB1tZqKmabS1WUHOCUq2re2fME98x/SQMnn5QxhddNDOWrJVvsuw
         ZF1onei/VNOyMcRN41NZYcZZMscpAozy8ozNMn2qHcXwY8VO+FYwJyO5ENY7mqHLDTib
         E0tl2HqTBCgIMEQtXpeLcRY4xNwYKU4phYmgTKQYt3HeOBohF41w/FnSJ00JyZ1u/HhD
         oZ3vaytdzY0VO3/9gYfUljLZJhxaNY5jG4NrOCYPDX9IvwCXcgUPTorcRt+FWcNRe8Zt
         YBnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA+701c0oWHCBnEzSHLgrpIB5lGzUW4Cz1jRpuoTrK3R0hkUmqAjQ95g0otjaUkaiPbYOTcbhvMBrLvhB/KWIB@lists.infradead.org
X-Gm-Message-State: AOJu0YwD7BYCxUtvJofQtq6ojvM9CuLOCdSTebpIN4VhmMoK7xxFmwiT
	KJRHe+iY/nSQWPg7HxNJ4IQiFucRk3mDMHBJlJ1guGMet84BOAT+oEf4U+/5rv4thZ2jJVAc/1k
	0n+l2pC2y8onArmfVNkaxNeS+nCKZBbok1Q3/5w==
X-Gm-Gg: ASbGnctOxzHaqljSMAxAnEuDyO6Dapy3CbLm/qEy7WBTtzSNOH1qgN80m+GB1iGXOuX
	V+zuw2oj9MeJSMBEYa9+B0d4t22I4qGta
X-Google-Smtp-Source: AGHT+IEcO6Su/9/8KHLlrWOggxXpEUQdnHMKRQYTMnTaorultWTg9WKUXkjBrKviPAwOh+21GGIBZJNGibWrb8sKNA4=
X-Received: by 2002:a05:6902:248a:b0:e39:8b24:65ee with SMTP id
 3f1490d57ef6-e398b24682bmr12197418276.40.1733153095668; Mon, 02 Dec 2024
 07:24:55 -0800 (PST)
MIME-Version: 1.0
References: <20241202115140.33492-1-wahrenst@gmx.net>
In-Reply-To: <20241202115140.33492-1-wahrenst@gmx.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Dec 2024 16:24:20 +0100
Message-ID: <CAPDyKFpX2dcimEVQ8EpOFvbJ6fPybazNLT-j1yf8Uoo79UD=dg@mail.gmail.com>
Subject: Re: [PATCH V6] mmc: bcm2835: add suspend/resume pm support
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Lukas Wunner <lukas@wunner.de>, 
	Peter Robinson <pbrobinson@gmail.com>, "Ivan T . Ivanov" <iivanov@suse.de>, 
	linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_072457_165611_BA2A8A59 
X-CRM114-Status: GOOD (  21.51  )
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

On Mon, 2 Dec 2024 at 12:51, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Add a minimalistic suspend/resume PM support.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/bcm2835.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> Changes in V6:
> - split out of series because there is no dependency
> - remove unnecessary complete check
>
> diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
> index 7847f0c8b465..e5f151d092cd 100644
> --- a/drivers/mmc/host/bcm2835.c
> +++ b/drivers/mmc/host/bcm2835.c
> @@ -1343,6 +1343,25 @@ static int bcm2835_add_host(struct bcm2835_host *host)
>         return 0;
>  }
>
> +static int bcm2835_suspend(struct device *dev)
> +{
> +       struct bcm2835_host *host = dev_get_drvdata(dev);
> +
> +       clk_disable_unprepare(host->clk);
> +
> +       return 0;
> +}
> +
> +static int bcm2835_resume(struct device *dev)
> +{
> +       struct bcm2835_host *host = dev_get_drvdata(dev);
> +
> +       return clk_prepare_enable(host->clk);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(bcm2835_pm_ops, bcm2835_suspend,
> +                               bcm2835_resume);
> +
>  static int bcm2835_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> @@ -1471,6 +1490,7 @@ static struct platform_driver bcm2835_driver = {
>                 .name           = "sdhost-bcm2835",
>                 .probe_type     = PROBE_PREFER_ASYNCHRONOUS,
>                 .of_match_table = bcm2835_match,
> +               .pm = pm_ptr(&bcm2835_pm_ops),
>         },
>  };
>  module_platform_driver(bcm2835_driver);
> --
> 2.34.1
>

