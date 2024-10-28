Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B080BD13596
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 11:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48Mqgz0yoPcTn42M0JioJyjAgLLTyWy+bgFbYFVMpQY=; b=juV35dd/per/jdr+rXs3JiWzkz
	UAjtAwNgW6nxKwUO1JtITfuzIYTH7GkxpwT29LKQizyRjod4HUV33eHKSma/yIwLa1D/lJsu3SXY+
	QyzEMRid1WRzjao1avuzR5Nw8lRqyy6KdsJASM1/STGzkp2NfKJmJjZ9NWR281BqRx1bwu8zwLy7b
	00SzX0OZ87l3OMBYTszHr5+JOnFid9pa7JhjdNA8bPV7q5SrgFRgPYkRNahl/0VQfYPf51dMle2qh
	OokUru0y8IDIla1X2TqhP3UFFVe/DuA3qPeL6tqG3S/hwTnSb1GqgxblTJ0Znof33g+OQhqm1ZvlY
	JGTK2pmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NUp-0000000AUrW-3InT;
	Mon, 28 Oct 2024 11:01:15 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NQz-0000000AUJW-02Vv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 10:59:16 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-6e9f8dec3daso6896227b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 03:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730113035; x=1730717835; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=48Mqgz0yoPcTn42M0JioJyjAgLLTyWy+bgFbYFVMpQY=;
        b=CD0+epFgGHAoXED6Ve0Pod1CJMcYj9hT8Db3u+xRR4rpwm8tfExcjIaC51Xf8yezJ7
         xxip/1VMjm1ujYuzcz/STywzK4Btn6cGl3sWNpMBC9TKmZPykJm3c8gn8X7YGKs3rdN5
         +lriOoMGM1wdVuUPeClyP5ibyUVLij4eXcgBfMaYxl/pwI8zuTD1AlBE4IfGkPv7KK30
         95TncP3jfe27iViqT5+e6ssZXf/V3Gw81JuLqSVCtTDJNy7kLhF8vC6G6oPT7bW2+ORB
         Vj87hYLcj9ELEQHe4ubRcF/PrMCTXomQXBLUe4RdUS+3hTY2ZSVl3priqQHVM3D+mPhi
         Vt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730113035; x=1730717835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=48Mqgz0yoPcTn42M0JioJyjAgLLTyWy+bgFbYFVMpQY=;
        b=dKy+Vz6aCsWDV6xZQS1OXGa5pfTVRfvQx0xTrTLQIyn6DHllRk0p3ZDSBIiE8rkddo
         SNik9ihkF9Qg9qlXvKV2UUATl+zd/012RhuEA9mslBawtz0y/4PVRDsfXzw1ihbL42/C
         WaeMziRN7xMgwUl2mIgfodC3NnnSErZ9DV+/dTNQ4fl1BEf4Vh3otp6XG+BFxko2uaT1
         Mx1VhXDW31aRAnx7QKfNt1NQlxFs8iGKR5RtcDDCcJbCd91iaHBOcixozQ1ORrOUhN9U
         EqehpgcJSIFJ6okqoyQu/MsFaSG5EMwIXi4mHsFOfxcJ2zqOO6MA+jEIYmg+CPnryLPU
         qYHA==
X-Forwarded-Encrypted: i=1; AJvYcCXfhgVdeaTl8CL7SeKU5Lwm08GZaklqgy1vo/gBoXQ2xfkE++DVicDVVL1YQJUhWniiy0FSc+SG/GAwcZPEviu2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0HTiMss3kOMeN8r/rm+m2KqK1N+/3f7fYK8BBaVFWIpenPAQh
	S+0e1R1/duime7J0GvxmXECLZCjpiRL/dhTWTzWTcjDgCbQsbj2gjx/3yE/pi2sqkcc8lwRYmSh
	HM/BbrtnQ+QGcfuaQpVygOk0avDNSIe7SrD3a2Q==
X-Google-Smtp-Source: AGHT+IHA0r4lmbXa1zcBrKWmUfLUZyXRw9N6lNM3hTgpKMnZRgAzGlVS4oP7yDvcJkxKm4/yuGEHcyAWNjCtADPWGf0=
X-Received: by 2002:a05:690c:3809:b0:6e3:1063:91ca with SMTP id
 00721157ae682-6e9d8ad3e88mr72127657b3.40.1730113035192; Mon, 28 Oct 2024
 03:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <20241025103621.4780-1-wahrenst@gmx.net> <20241025103621.4780-6-wahrenst@gmx.net>
In-Reply-To: <20241025103621.4780-6-wahrenst@gmx.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Oct 2024 11:56:38 +0100
Message-ID: <CAPDyKFoKuZD596mVNeV5VszU8ncQ8cPda1fbktb3UQQiv+67GQ@mail.gmail.com>
Subject: Re: [PATCH V5 5/9] mmc: bcm2835: add suspend/resume pm support
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Vinod Koul <vkoul@kernel.org>, 
	Minas Harutyunyan <hminas@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Lukas Wunner <lukas@wunner.de>, Peter Robinson <pbrobinson@gmail.com>, 
	"Ivan T . Ivanov" <iivanov@suse.de>, linux-arm-kernel@lists.infradead.org, 
	kernel-list@raspberrypi.com, bcm-kernel-feedback-list@broadcom.com, 
	dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_035717_078538_1C843D6B 
X-CRM114-Status: GOOD (  22.28  )
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

On Fri, 25 Oct 2024 at 12:36, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Add a minimalistic suspend/resume PM support.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/mmc/host/bcm2835.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
> index 107666b7c1c8..17c327b7b5cc 100644
> --- a/drivers/mmc/host/bcm2835.c
> +++ b/drivers/mmc/host/bcm2835.c
> @@ -1343,6 +1343,30 @@ static int bcm2835_add_host(struct bcm2835_host *host)
>         return 0;
>  }
>
> +static int bcm2835_suspend(struct device *dev)
> +{
> +       struct bcm2835_host *host = dev_get_drvdata(dev);
> +
> +       if (!host->data_complete) {
> +               dev_warn(dev, "Suspend is prevented\n");
> +               return -EBUSY;
> +       }

This should not be needed.

The mmc core makes sure all outstanding requests have been flushed,
before the host controller becomes suspended.

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
> @@ -1471,6 +1495,7 @@ static struct platform_driver bcm2835_driver = {
>                 .name           = "sdhost-bcm2835",
>                 .probe_type     = PROBE_PREFER_ASYNCHRONOUS,
>                 .of_match_table = bcm2835_match,
> +               .pm = pm_ptr(&bcm2835_pm_ops),
>         },
>  };
>  module_platform_driver(bcm2835_driver);

Kind regards
Uffe

