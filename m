Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA52CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 14:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HG5KODUu0GjbUdNiiv9Xwk+9exlrDUpck0LIesxLbE4=; b=nEv/Rm8tfUiiT8rVfQGNtuaYLi
	D09jCFZNwEiWj4ad0j+b9FZQtyPb5gAY6CrdC+Ehku/TEdpXcTDe2573Gf5igExwY11Kcmg6KV+pz
	ruUivDcWYn5XQ4kfVzyuYttYW5mweyamXCTq1UsTFrrmk+63I8OaL7XdBvFIsQfES1K5sPOHcOz67
	z7OeucdOAsKoJoZqmmc/uR1VJmqheGYSTD/qHjiPqInraLZT5+NerShEoHqnIukUFnjdrJ/21TyIw
	SfFWE12yeYdlbUjgVYGHF2jCw9kez0CSdoex/WCmDJiLuWe78BdrtGVLfQZYP6B/5isJXD5ZlcdWC
	AuI7EDmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwiYt-00000003eJz-0sAb;
	Thu, 11 Sep 2025 14:46:11 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwiYr-00000003eJN-0BGq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 14:46:10 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e951dfcbc5bso684771276.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 07:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757601968; x=1758206768; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HG5KODUu0GjbUdNiiv9Xwk+9exlrDUpck0LIesxLbE4=;
        b=JTPTkgaxABm13zcgI4SIrhQKdGR/NKbiHKm0WXoQ/rTew19b/ozVJi3AuUsuzp99k9
         0jM241xvlfP32TBULDTqNrj/kwITiUHimgSl/YNfhIDD85aR8Dki87gz7YOMML4L6CE1
         nRu7kMiAtT+qIxMiwDLqhYweaZ2p/XoWi+3efYnOWFeTfF69/qEja+zo5+Yc0FgAVs9t
         GOHa4+NuoOs6eXFvxGuUqayxZku1vuDvmk5YJImuoOkhgxaRaqK/YF+LLwKWV7ZXSH5r
         nJASyrQTl4VYhjoyMriokspEqeHKLcbWQkfGIY5K3wJ3lkdbhXZ6yBTYq1FJNS72dfdZ
         oJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757601968; x=1758206768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HG5KODUu0GjbUdNiiv9Xwk+9exlrDUpck0LIesxLbE4=;
        b=CuplC44CnE2mGo2lchrITvniH8QdGY2Ztkj6XB7ev4amNkfltVluH0iv145nodTEeE
         HXrPBMRANj0gvWXMaCN5JC/+w1seHjK4UX7/QA5vge+ujtf0hDHBvQiPcc+3pc0ipCj+
         /U+hQHWb5ampFHfl6G9Wn+ji4maUcaRaPzkk8PriCTz1ZRYa7PtrVf8xsvfJgqysy3iq
         4oi4vVL1yfZBGWzh87jW8OfhZhnu+erefNZOB+fyRMPI9JLDpZRmPSB5EKhvpcZKzTrt
         xRprdqqr/BgjTk7gviAtx3GgA44XAe/BIRsirDH6LjPCTSiySybGkK7AUySxbrmygHQw
         xYww==
X-Forwarded-Encrypted: i=1; AJvYcCUU5wInrlfs1sW/lLZmYb4GqWlBRJ4iANUfZMFOsrT997wxyPdOhcB4JswICgdzBtbzBgq/suQxNWnNAzYyHCXR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv9m7Fm9DQqa/VAZPCd/eK11eu5wNasGmddGVd3ZNqcrkWAdA0
	0cGrSsCZo/JxMTjbZBZOp1CAYmFpHvJHfYzfzxyKM6RbKjfxEliVEuZLXUC/KxTc59rBUxS5zbw
	FutPsQpAl81RSgt2b9rNuru5YrflmGPifaDtix/+pOg==
X-Gm-Gg: ASbGncsDm6oIDK1sVC9KX4afjFuuWVJ4BjXZ0gA2i11bwtNvvwU2XK0XsV46JKWl9em
	0kL8tk2+s38R15JFWLqfY9YaoIhqZ6MJDYaJ0uvU4mY5NnXjWE34KtzW84fSPsG+oYDShtlchax
	8ewDMJDhlzFT5gcgsPrGSjt1YlWHOJqjT8AOdf0bqLkk7hDOl9u3IvrHiTmVd1rglb0KTyB/qK6
	NcMBqQrWRCnGw3+9Cg75vHcy6X2JA==
X-Google-Smtp-Source: AGHT+IGA14KLSVMCK2zV6p8As0+Jn95rbWVq+KPV+CqkNJxyiiFOFLcSxRvo/0exdQaaGDHMXMlIe6ixp4mKa1e9IQY=
X-Received: by 2002:a05:6902:1892:b0:ea3:d40a:2563 with SMTP id
 3f1490d57ef6-ea3d40a2737mr1177746276.41.1757601967783; Thu, 11 Sep 2025
 07:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pm-v3-0-ffadbb454cdc@nxp.com>
In-Reply-To: <20250902-pm-v3-0-ffadbb454cdc@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 11 Sep 2025 16:45:31 +0200
X-Gm-Features: Ac12FXy4zlU7KeT4OFE-vyI1bqh6ZB1528BpXJl_SwXQzUbCOw7DO0NcEvUZLJA
Message-ID: <CAPDyKFqBJQ92HH1tSq1rfbXV1OwbyvgChyHfv7ykJqf2A6qYpw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] pmdomain: core: Introduce device_set/get_out_band_wakeup
 and use it in usb
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Xu Yang <xu.yang_2@nxp.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_074609_086055_E247F213 
X-CRM114-Status: GOOD (  24.86  )
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

On Tue, 2 Sept 2025 at 05:33, Peng Fan <peng.fan@nxp.com> wrote:
>
> This is pick up of [1] which does not have response in about 5 months.

Sorry, I have planned to have a look at this, but just never got to it.

> This V2 patchset
> - includes usb driver changes(patch 2,3) to give people a full picture on how it is used.
> - Rebased next-20250729 to resolve conflicts
>
> To i.MX95, USB2 and USB3 are in HSIOMIX, but there is always on logic
> to make USB2 and USB3 has wakeup capability when HSIOMIX power domain
> is in off state. Otherwise the HSIOMIX will be kept on when
> USB2 and USB3 are configured to be wakeup source and Linux suspended.
> With this patchset, HSIOMIX could be powered off and Linux could still
> be woke up by USB hotplug event.
>
> Patch 1 introduces device_set/get_out_band_wakeup
> Patch 2 and 3 are drivers changes to use device_set_out_band_wakeup
>
> [1]https://lore.kernel.org/linux-pm/20250311083239.3336439-1-peng.fan@oss.nxp.com/
>
> More old discussions:
> https://lore.kernel.org/linux-pm/20250311083239.3336439-1-peng.fan@oss.nxp.com/
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Overall I think the series looks nice, but I will make some more
thinking of this in the next few days and come back with some proper
comments, at latest in the middle of next week.

Kind regards
Uffe

> ---
> Changes in v3:
> - Add a new patch from Xu Yang to detach power domain for ci hdrc
> - Add A-b for patch 4
> - Link to v2: https://lore.kernel.org/r/20250801-pm-v2-0-97c8fb2a433c@nxp.com
>
> ---
> Peng Fan (3):
>       pmdomain: core: Introduce device_set/get_out_band_wakeup()
>       usb: chipidea: ci_hdrc_imx: Set out of band wakeup for i.MX95
>       usb: dwc3: imx8mp: Set out of band wakeup for i.MX95
>
> Xu Yang (1):
>       usb: chipidea: core: detach power domain for ci_hdrc platform device
>
>  drivers/pmdomain/core.c            |  6 ++++--
>  drivers/usb/chipidea/ci_hdrc_imx.c |  8 ++++++++
>  drivers/usb/chipidea/core.c        |  3 +++
>  drivers/usb/dwc3/dwc3-imx8mp.c     |  4 ++++
>  include/linux/pm.h                 |  1 +
>  include/linux/pm_wakeup.h          | 17 +++++++++++++++++
>  include/linux/usb/chipidea.h       |  1 +
>  7 files changed, 38 insertions(+), 2 deletions(-)
> ---
> base-commit: 1b09efec32046a9c78cfecc46a26b1b139a3e8a8
> change-id: 20250729-pm-243ff7097e44
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>

