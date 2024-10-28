Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0EBD13596
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 11:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w67vg9M/PUfllFizpdXiSM7HQlThvR5jg0fvSeOpX5U=; b=lg6h+hnbqZDGmnhkOcM47sJInU
	n9qLb7SexLkopLfLWDQ7Pj14IWmDgcikfdBzlHpviD2B9RvvLEiqBAXPZWn1UljWhe8nlc/DGBOuO
	YFWbCg6eG2RHWg50WqHOFPtWY+2gDfwWNw3ttJOHzAKSznoxNDYEIRrZ39IIfw29qLmyUtbVH1VAQ
	tm7lA7Bnit+PyXOInn3xtAOsKPPT4C6XZhMySNdbACFpUkV9iIuT4Aj5+jhBRXvguO669XMGHWm82
	kkufm3BYkoikjOPv9h5xZxxm6h8t07dVppKBQWr12u2mKp1XyFDOM6Hs4C/ZmMdnLenU8Rx3Ew5Fq
	RDoNA9+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5OCW-0000000AcIk-3C7w;
	Mon, 28 Oct 2024 11:46:24 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5OAh-0000000AbtR-1Ald
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 11:44:34 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-6e5ef7527deso43402847b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 04:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730115870; x=1730720670; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w67vg9M/PUfllFizpdXiSM7HQlThvR5jg0fvSeOpX5U=;
        b=YL2gvN6Vuw1RrMn5AgHIjoHSxZJmTc1uhOl8EPjKP5RvrghtOYDBexMyWJBG91pYMd
         +tUucZnEkuASX2nN2idarCxzohaa6OwqtZIEbKSvp3VkFEz2WuqFeC2T3vhFJx2HoGgv
         Qd9oerYIcaqViCPG8ERaMsgjJBCkdCoZrfGhrGpO58Et8Zxxm4Hj/zRDViwd/MeG0HGa
         9fTDh2NNfKjY5ldVOpughaIv4RdrElepBdaCil3SW/5RALvT5pM3LpTfLp3S7tXEmNG5
         ivsCnxjpByi6KkuCsGyJ99NHo2/OLQXVMHesGkbAeL2lSBSiX6foeTR4DFijIDC4nCy2
         5xSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730115870; x=1730720670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w67vg9M/PUfllFizpdXiSM7HQlThvR5jg0fvSeOpX5U=;
        b=JnqCskg5oiwVW+kb+kndjRCQd5hAaHuO6t13VkiX6XayUVQJUcc1mO6xxwQ6mQyzDO
         yzMQzJmROVv1v9B6X6RCLlET0PPcqcEnN/xaa4lGXu1AlnYXpnnvYKz+qVM3YfwStV7F
         295mPCzdYEoRzKNXV6CmpDgW7UAW9WFOQ4IMjUy5MEo3s1DgQxHnYDzsdsRpenb815n2
         RRpk4CeduHVmZmpL9lc8goLCEWUHB6nFN4XlaAP5LhMeBrfbKBYoABcPpT4qCk4o1RTc
         XGGCgDPjpGhRfGCEaB9KB5Wdky2HmbjboPrdDXVF4wthNva6qOTBq4Provx+H1LowCbm
         APCg==
X-Forwarded-Encrypted: i=1; AJvYcCVvM0YnykYbMlH9SodsYV8TXljzuYpoWVriY9U2VZSoEcFTEjStJhtTIXUo98GMu8P5+sZEbtl8VRwQ0UP9PFlA@lists.infradead.org
X-Gm-Message-State: AOJu0YxtZEXEL0mG5fp45fwMBgS5xpfcg9uLNKzHLED6amuGd5jVBSI+
	pdnkYLICYdOBPu6NMWA+0QJFN3GZZ+I8DeC44hP8cg+VmdS73ax44kDIlAzr0A+gwW+OpVsd27o
	ilthCepf2arASWPaioqflYNNIBExH2CjSuYjwhw==
X-Google-Smtp-Source: AGHT+IF26G/KW53BnVmsufrZN4oEUN/Y3tFfc1+XSv54Nwo/CrFvFba9ljoAEAfzBRZISL4FpyAIkN8L5k8Ymwv2dPg=
X-Received: by 2002:a05:690c:46c6:b0:6e5:a431:af41 with SMTP id
 00721157ae682-6e9d8ad6cf4mr74632897b3.38.1730115869914; Mon, 28 Oct 2024
 04:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241025103621.4780-1-wahrenst@gmx.net> <20241025103621.4780-4-wahrenst@gmx.net>
In-Reply-To: <20241025103621.4780-4-wahrenst@gmx.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Oct 2024 12:43:54 +0100
Message-ID: <CAPDyKFr7mJPWPkTrtB9ORdQw0TtBDKM=B9g6QsKvUHRx1zDNxQ@mail.gmail.com>
Subject: Re: [PATCH V5 3/9] mmc: bcm2835: Fix type of current clock speed
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
X-CRM114-CacheID: sfid-20241028_044431_386209_D82D7898 
X-CRM114-Status: GOOD (  19.36  )
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
> The type of mmc_ios.clock is unsigned int, so the cached value
> should be of the same type.
>
> Fixes: 660fc733bd74 ("mmc: bcm2835: Add new driver for the sdhost controller.")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/bcm2835.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
> index 35d8fdea668b..3d3eda5a337c 100644
> --- a/drivers/mmc/host/bcm2835.c
> +++ b/drivers/mmc/host/bcm2835.c
> @@ -150,7 +150,7 @@ struct bcm2835_host {
>
>         struct platform_device  *pdev;
>
> -       int                     clock;          /* Current clock speed */
> +       unsigned int            clock;          /* Current clock speed */
>         unsigned int            max_clk;        /* Max possible freq */
>         struct work_struct      dma_work;
>         struct delayed_work     timeout_work;   /* Timer for timeouts */
> --
> 2.34.1
>

