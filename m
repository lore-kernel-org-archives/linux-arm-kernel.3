Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BC8C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 13:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKJfbdSDFe4F+/reoZSBEur/cDIBDtFpYRqgYL7IyLY=; b=eI7eEOlKWl7SyodPHUGjYwCsbn
	BK/vhRgaDt716eP2wsBgUKA5zL2vdlsydrm/GMdoS5KFAlq0/+xrhHgrZyWXzFoE5XXuL5/BhljJh
	eF7omMgvObohKvuNTuSHiKuocDz6WyZzSenP3DvTVsDzEET+BXwP+U0BYa73oWCljtL99yxruCQud
	64oiAnWsNljBGJrtyvv+k8NwpB5dfDtcYImsKUKNSQmyyDXLo5C2ytwOw1y8xRzuGsE8fznhl0F5x
	4N8h7vy4zCXhOEwFuzrzm/WuJtp01Xcpzjbe9f5EiFdfLSOIs8f7ycFZpyVFvI7v8Q2xesThsh1Km
	HjuLZawA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqtF-0000000BrL9-3z6s;
	Thu, 10 Jul 2025 13:00:41 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZplw-0000000Bfrj-0pka
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 11:49:05 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e8986a25cbfso629111276.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 04:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752148142; x=1752752942; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yKJfbdSDFe4F+/reoZSBEur/cDIBDtFpYRqgYL7IyLY=;
        b=aHluOSVD4mQx7oIPeHUS1Jqr52V4P39EVclPiJU96R0oD6F7bjLCpYjnxfsmkBRifw
         hal9EqFheAbpIZANCiJdz5HuVffsKdfKu2aa8y4ebXllmU2uKKhSR8TvW+5gHcX44sgb
         YMAZ4XARpP1LAXqsjzk1qA9Otgn5pzzII1XQfSKCU4DdOyaFTmJpvYPBmyRpuz+3KiLa
         XvyMQS7OOKOr9VD/jM/SpHk9BvUp/yFPI3EPl/oERZBzRqESFsqoTVxq8cV+8FvPwYjl
         NMc96FJ3IzKy5eLmyHkGC8Fvx+CogtStHnrx39wOlHquRTC1yiidUsrdl9iLdqZzU2RA
         P3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752148142; x=1752752942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKJfbdSDFe4F+/reoZSBEur/cDIBDtFpYRqgYL7IyLY=;
        b=hm1+LxWKJw8iK6y2xERLSYu0me0vEyM8DvuSAtToB3Es00z3WPKmR/71ysx7GKojXT
         D1gSFGhWuv4LsqgocevmMeLv1fdJyK2gn8Rp5+sP0xLS1Tc0XNmLHqu88MK8lfoWsaxj
         lZ4quYYyGWI3TEUzJOH48b94FHX8rsNHWzY/nrH6Lc/7Fgyvd+WbZ74/6vGE9XehjZ0X
         drhCitt3qYPEJyWyN1OUckpqYs648uOu3Co416EAa+DlVtv1wOs+P6GINynK+IbjkMip
         bQdyhmoMB16O5wM0OQqLbRxK6zwDjd34KRbUzmOXxeUXuxyZtlC5HQftkAdqf5oeY3UY
         c/og==
X-Forwarded-Encrypted: i=1; AJvYcCVp4awMNW3gHRZPGNOAfBwnfL6ngUEKcRndnQ0FY6JOJJ3+5TNvg8a+Qoh0t+EiSx/bmWSEKQAKOGmcfU1Yjy3V@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3q+HP0miBiSGilLXtrgTbOgOJdohvzzj4cvg1UwRrijV+3yQy
	O6DleymY+Y5fh4NFYjrasDF+kS8ddNvLm8MD7Ls9y9tWxwb4pPHh6tkgJsRAxPHyCUNVQHqwX3o
	noXkm4IEF5Yns2fN5OSZm3loSPebQjwIr/QHDnKOd6BwBXA7j08pM
X-Gm-Gg: ASbGncuDwhJq9ypNdV5DZcTURdztnxXfjt5hiv9LqF3u1OyQXd+ixFxF4oOon9MO0jl
	ohymhZcHosYBGE4zJaZH4V46ZezMOEwn+evkgnsyrPpeFj0mY5VjNiMa4t/2hTHHH37JkagGHvR
	86R/26YDhTMgwPC25Fixll0SbdADVYKcyWmdqf+sbOxdY=
X-Google-Smtp-Source: AGHT+IGojfjYSOURWlT9qTivvtfMoWhd8EvRMaTwv4VSn3V2NOCpZS4Pq5H6mAkfSTzN2UR8Joi/8xx9zrgl+n0WjtY=
X-Received: by 2002:a05:690c:c9e:b0:716:33dc:7ca8 with SMTP id
 00721157ae682-717c17728aamr46943927b3.18.1752148142380; Thu, 10 Jul 2025
 04:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250709205332.2235072-1-k-willis@ti.com>
In-Reply-To: <20250709205332.2235072-1-k-willis@ti.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 10 Jul 2025 13:48:26 +0200
X-Gm-Features: Ac12FXzxFDPRY07ei6vBiy4jZBOAM5cE6ro6_L5OCtHHZgQWHrFPa5nFr0up2fM
Message-ID: <CAPDyKFpk639BP+xa5Hy1Ji8JsVOsmx3bomQWZ1+hG3jAy2juVA@mail.gmail.com>
Subject: Re: [PATCH v2] firmware: ti_sci: Enable abort handling of entry to LPM
To: Kendall Willis <k-willis@ti.com>
Cc: nm@ti.com, kristo@kernel.org, ssantosh@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	d-gole@ti.com, vishalm@ti.com, sebin.francis@ti.com, msp@baylibre.com, 
	khilman@baylibre.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_044904_252838_179B9F25 
X-CRM114-Status: GOOD (  38.29  )
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

On Wed, 9 Jul 2025 at 22:54, Kendall Willis <k-willis@ti.com> wrote:
>
> The PM co-processor (device manager or DM) adds the ability to abort
> entry to a low power mode by clearing the mode selection in the
> latest version of its firmware (11.x). The following power management
> operation defined in the TISCI Low Power Mode API [1] is implemented to
> enable aborting entry to LPM:
>
> TISCI_MSG_LPM_ABORT
> Abort the current low power mode entry by clearing the current mode
> selection.
>
> Introduce LPM abort call that enables the ti_sci driver to support abort
> by clearing the low power mode selection of the DM. This fixes behavior
> from the DM where if system suspend failed, the next time system suspend
> is entered, it will fail because DM did not have the low power mode
> selection cleared. Instead of this behavior, the low power mode selection
> will be cleared after Linux resume which will allow subsequent system
> suspends to work correctly.
>
> When Linux suspends, the TI SCI ->suspend() call will send a prepare_sleep
> message to the DM. The DM will choose what low power mode to enter once
> Linux is suspended based on constraints given by devices in the TI SCI PM
> domain. After system suspend completes, regardless of if system suspend
> succeeds or fails, the ->complete() hook in TI SCI will be called. In the
> ->complete() hook, a message will be sent to the DM to clear the current
> low power mode selection. This is necessary because if suspend fails, the
> low power mode selection in the DM is not cleared and the next system
> suspend will fail due to the low power mode not having been cleared from
> the previous failed system suspend.
>
> Clearing the mode selection unconditionally acts as a cleanup from sending
> the prepare_sleep message in ->suspend(). The DM already clears the low
> power selection automatically when resuming from system suspend. If
> suspend/resume executed without failure, clearing the low power mode
> selection will not cause an error in the DM.
>
> The flow for the abort sequence is the following:
>    1. User sends a command to enter sleep
>    2. Linux starts to suspend drivers
>    3. TI SCI suspends and sends prepare_sleep message to DM
>    4. A driver fails to suspend
>    5. Linux resumes the drivers that have already suspended
>    6. Linux sends DM to clear the current low power mode selection from
>       TI SCI ->complete() hook
>    7. DM aborts LPM entry by clearing the current mode selection
>    8. Linux works as normal
>
> [1] https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html
>
> Signed-off-by: Kendall Willis <k-willis@ti.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
> Series has been tested on an SK-AM62B-P1 board. Normal suspend/resume
> has been verified. Abort was tested by adding an error into the TI SCI
> suspend hook.
> ---
>  drivers/firmware/ti_sci.c | 61 +++++++++++++++++++++++++++++++++++++++
>  drivers/firmware/ti_sci.h |  3 +-
>  2 files changed, 63 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index ae5fd1936ad32..63c405f7037f0 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -2015,6 +2015,58 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
>         return ret;
>  }
>
> +/**
> + * ti_sci_cmd_lpm_abort() - Abort entry to LPM by clearing selection of LPM to enter
> + * @handle:     pointer to TI SCI handle
> + *
> + * Return: 0 if all went well, else returns appropriate error value.
> + */
> +static int ti_sci_cmd_lpm_abort(const struct ti_sci_handle *handle)
> +{
> +       struct ti_sci_info *info;
> +       struct ti_sci_msg_hdr *req;
> +       struct ti_sci_msg_hdr *resp;
> +       struct ti_sci_xfer *xfer;
> +       struct device *dev;
> +       int ret = 0;
> +
> +       if (IS_ERR(handle))
> +               return PTR_ERR(handle);
> +       if (!handle)
> +               return -EINVAL;
> +
> +       info = handle_to_ti_sci_info(handle);
> +       dev = info->dev;
> +
> +       xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_ABORT,
> +                                  TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
> +                                  sizeof(*req), sizeof(*resp));
> +       if (IS_ERR(xfer)) {
> +               ret = PTR_ERR(xfer);
> +               dev_err(dev, "Message alloc failed(%d)\n", ret);
> +               return ret;
> +       }
> +       req = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
> +
> +       ret = ti_sci_do_xfer(info, xfer);
> +       if (ret) {
> +               dev_err(dev, "Mbox send fail %d\n", ret);
> +               goto fail;
> +       }
> +
> +       resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
> +
> +       if (!ti_sci_is_response_ack(resp))
> +               ret = -ENODEV;
> +       else
> +               ret = 0;
> +
> +fail:
> +       ti_sci_put_one_xfer(&info->minfo, xfer);
> +
> +       return ret;
> +}
> +
>  static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
>  {
>         struct ti_sci_info *info;
> @@ -3739,11 +3791,20 @@ static int __maybe_unused ti_sci_resume_noirq(struct device *dev)
>         return 0;
>  }
>
> +static void __maybe_unused ti_sci_complete(struct device *dev)
> +{
> +       struct ti_sci_info *info = dev_get_drvdata(dev);
> +
> +       if (ti_sci_cmd_lpm_abort(&info->handle))
> +               dev_err(dev, "LPM clear selection failed.\n");
> +}
> +
>  static const struct dev_pm_ops ti_sci_pm_ops = {
>  #ifdef CONFIG_PM_SLEEP
>         .suspend = ti_sci_suspend,
>         .suspend_noirq = ti_sci_suspend_noirq,
>         .resume_noirq = ti_sci_resume_noirq,
> +       .complete = ti_sci_complete,
>  #endif
>  };
>
> diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
> index 053387d7baa06..51d77f90a32cc 100644
> --- a/drivers/firmware/ti_sci.h
> +++ b/drivers/firmware/ti_sci.h
> @@ -6,7 +6,7 @@
>   * The system works in a message response protocol
>   * See: https://software-dl.ti.com/tisci/esd/latest/index.html for details
>   *
> - * Copyright (C)  2015-2024 Texas Instruments Incorporated - https://www.ti.com/
> + * Copyright (C)  2015-2025 Texas Instruments Incorporated - https://www.ti.com/
>   */
>
>  #ifndef __TI_SCI_H
> @@ -42,6 +42,7 @@
>  #define TI_SCI_MSG_SET_IO_ISOLATION    0x0307
>  #define TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT   0x0309
>  #define TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT  0x030A
> +#define TI_SCI_MSG_LPM_ABORT   0x0311
>
>  /* Resource Management Requests */
>  #define TI_SCI_MSG_GET_RESOURCE_RANGE  0x1500
> --
> 2.34.1
>

