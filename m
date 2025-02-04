Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4782AC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 14:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGRkyDL8K72mesTVBS1vSQICOMIKizD7o9itaR6TuIw=; b=Z4D5DdXxQUobAqBlw8lsUz5A3k
	tfWLz7IVyUz3mOerGn1BzAnvwM62JjMMoWWJ2P7ks5iwM8tFn/gH5TTZqvyqDzBaEj8om8QB/5+ix
	lmAkkuwKsfPoPhYeksBuIwdy1IABzWneoYnc17sBZ9jmCkwSGfqZe8pgwX3qBiyAt0wsStMuI5Xai
	G/JjslFRWtYsw9YOvCWgUu6M1bLDhkG2wAgn56cQKOZo7qqMjYzNNssP4Tc2Fmt+CreVaKWtRWfcY
	pjWze31n332AaAhiREdXCTAYPWsAXdpDgCzvnGtQlWZtNovGgKB7hdTBYJdX+JX/Sr9gB8UgUBR17
	mDTrGYMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKAF-00000000hMw-3jUX;
	Tue, 04 Feb 2025 14:44:35 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfK78-00000000gpH-0Zo3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 14:41:23 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-6f768e9be1aso39544837b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 06:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738680081; x=1739284881; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OGRkyDL8K72mesTVBS1vSQICOMIKizD7o9itaR6TuIw=;
        b=FfcxxhqQM93K3e6UL8y0P9R+f9/RytwlW8quc+YLNouFbgNGrlOJc3t6X5kLjMsoki
         e1sJWsf4sX29UOwG5oTE9Bq8ifL2jLq7P8xuuvPdm9USYMoyKMBrFh0IUKUMMPaUP2Qz
         /w9TOLgzRmifFznPZLnKat79SeNCvdEMC864HvJdPMiAlU08KEhRDgyjg3o3K92exihe
         tIT7LSpR3xl/ls1I7etX//sxGNpc1q2Bc8fN0/WrLFq4ng0LaQ6kZGOlyJipBzoC7fjl
         0J5jI9b9xEzhTPIBhh7+6vMk8jDKgXjfWNB/Hn1IyWIGV4EFy/RD4hURATEmlP5j0Bkl
         s/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680081; x=1739284881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OGRkyDL8K72mesTVBS1vSQICOMIKizD7o9itaR6TuIw=;
        b=M4B5hSU6TVx6z0GpKc4hKlVf5dvNsHGfxR1WW31fua0Z+vP8k8oJ3HqvlWjVDxepjq
         rnM9z5EcfC5HetCspmt3avUt6eKfahIGBPeUc6DMMlvEQVVdWqnG3yK1g3WdEsQQIYJr
         KiJrIIroChAHSRbHYfIn7dlu/WDJPaDdLtZDITvcDt/ywEOASw095OmRBFM/oTZ0XQ7R
         psryf+SOuNM5gty7RBP6F4yzix2DyPFxF4f2cGjlohs+9EOTyEezeTCBtObfhNVpj2pr
         DQ4tFYyk7b8f/na8265dpVZiVdnCUs+2dajlnDnHAEUl9sKYi4EB0ccrCmQRY6fm4nRO
         VpoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA84+QBRtKx88NnrBHoTDGteJq7S+8zqc9GJCPhHEeZEWv9ZKcLpcGowZyRn2PtoAjZgP+wibd/qZxuvknHM3w@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb2vXg2uXf7+pmbvIyyynAQ7Cwvwn6gbVxj2Mq99Lt0cr84JW/
	1iaSYMRXR7xzblmI7JFnjc4RltwL+1lkL9A+JWWt5mJtljGP5yXcAgyaTa4aTk76RaFkmV0uTBa
	/NVtAohwDBtm8osSxBh+Z/Xf9uO9YElb5YuSiZQ==
X-Gm-Gg: ASbGncvcaJv755DDMxYnBAYBzqzL+Cxb2nCoPqieJTIwVC5VdX2aEnj9zjBhWG/8g5f
	qhpT3cKIQdHllqOxyWKAYmeatl2LRgo6g0TJl2nZi2BKcdUPGTfqVX/0g9NquCbQ+teqn3z1LgQ
	==
X-Google-Smtp-Source: AGHT+IHEJHlC85HQWuM8lzCRPkCYTm26DmKxbsrdNmEcZl5QzCLwHRfJAPEcrlu9g8m1xdXmVFXRg09aHtNqBmMw1dc=
X-Received: by 2002:a05:6902:2748:b0:e58:fd2:2cdb with SMTP id
 3f1490d57ef6-e5b135b71f1mr3313017276.7.1738680080564; Tue, 04 Feb 2025
 06:41:20 -0800 (PST)
MIME-Version: 1.0
References: <20250201111926.31278-1-wahrenst@gmx.net>
In-Reply-To: <20250201111926.31278-1-wahrenst@gmx.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Feb 2025 15:40:44 +0100
X-Gm-Features: AWEUYZk20DnMMJ7T5J2UmZk0KreMLJqzyGpladqXRRAACEg9YOoR9C2hEGMA9Ow
Message-ID: <CAPDyKFojVOnjb2gGx3PS=rqRvysRTqeiUAHx+XJOtXzXBSRzYg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: bcm2835-power: set flag GENPD_FLAG_ACTIVE_WAKEUP
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Peter Robinson <pbrobinson@gmail.com>, 
	"Ivan T . Ivanov" <iivanov@suse.de>, linux-arm-kernel@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_064122_175462_EBC1C6AD 
X-CRM114-Status: GOOD (  14.83  )
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

On Sat, 1 Feb 2025 at 12:19, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Set flag GENPD_FLAG_ACTIVE_WAKEUP to bcm2835_power genpd, then when a
> device is set as wakeup source using device_set_wakeup_enable, the power
> domain could be kept on to make sure the device could wakeup the system.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/bcm/bcm2835-power.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/bcm/bcm2835-power.c
> index d2f0233cb620..d3cd816979ac 100644
> --- a/drivers/pmdomain/bcm/bcm2835-power.c
> +++ b/drivers/pmdomain/bcm/bcm2835-power.c
> @@ -520,6 +520,7 @@ bcm2835_init_power_domain(struct bcm2835_power *power,
>         }
>
>         dom->base.name = name;
> +       dom->base.flags = GENPD_FLAG_ACTIVE_WAKEUP;
>         dom->base.power_on = bcm2835_power_pd_power_on;
>         dom->base.power_off = bcm2835_power_pd_power_off;
>
> --
> 2.34.1
>

