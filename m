Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B80CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tO2FkW94sB9AYPaQQFnYI79pge/7kyoIm3imhrG5Wd8=; b=KfDIFuma+vnXCVjIaf2S/f6LQB
	sT30oBDFZUF4RXOVftzaVoRYxoKNZT/dEoynCnVAySlMmg8howMmATYkM8SUg+Us+WTGbEo1V3GX+
	t+0dH02rkRK/OW/jjWt3KGyC/m0KBqHOTmkF/Po0hVykW2w6u1XZ9IwfhfFHEcWTsr0OsN+jYWQzg
	BkqiX+H8l3Gp1nhNxy6LAfH1ENpTUz31oiuYbuN1L8G2XsUhKp2+awRiqhg7HrX3PNeqXodnde0q5
	wpqhUHXUC+eKkRWCnNfHOXhRXrMWmJDieUq0xGKTHgU2oYExCbK1FGTaWpWhOvUYxt3fHAu8vThLI
	r9DLzQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITbp-00000005fPT-245S;
	Mon, 10 Nov 2025 15:15:09 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITbm-00000005fP0-0mY0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 15:15:08 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b729f239b39so674439366b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 07:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762787704; x=1763392504; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tO2FkW94sB9AYPaQQFnYI79pge/7kyoIm3imhrG5Wd8=;
        b=TWFX8vK/CSjMT+dRYc4h9/0cqfOlYV8WY9l6GUV95KvFnbEff5k1k73YrFTa6N609j
         S1nwvpqbN2i6Jui7UO0FXWASYXzckBYSeG7XUEf7IXwfY0znHIY52szYr16EMVHlf3sQ
         QgdBsrk8Z9fzkQdq9/bThRiTCJEA0LXCuxYAqe977+XQltNQ85kzmAj6in1y7lQJitKH
         VoBdw/W3H6HdOAD1E9fFlqJCLSAJlBOPK+Z5vHS/BIfbTNc3nOiJISE9vYvegpCqkS/e
         Y3gNu3RYqLxdjnTlxNgNNsKrjTNJkuTSjvS1ma2DskYqVa4ZEdhF+73w5SMFwEQ/Z+zn
         pP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762787704; x=1763392504;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tO2FkW94sB9AYPaQQFnYI79pge/7kyoIm3imhrG5Wd8=;
        b=nEzACG1uclLgxS11/KGiAhc93+skdtJPPXPTb0sdwNSi5ie4TRYiS4lQSRQ0fbdRCg
         Nxt/Z8NAiNdWXrpODZHYK/cAgLbBSMVqJ5GIpcurbvo2ERvyId/ScOEzMWdhEkO/Q1K6
         KsGLFnepSWcVDKK9065+D4a5834gPYoRuw0kptWKSo5yNxB235ABKGuJ2cdx6suEhWOd
         TAw/8yqWSwgREDDDDiXNhzTkIjIoS4zvj70YWoxi0xU1UOXWJi00kvOZxZSuZXYgfOyz
         1raa/j3ruXfuMqh42BRXp3OHEsNj6ETVi4CToeuE1CNnYzNwTfOberlAxEGHS2kRxMYq
         MN6w==
X-Forwarded-Encrypted: i=1; AJvYcCURHT7OpJkYVXUGQ1QIiEw7Ajn/u1rX2PDeqbIB0z1trISpBGzMoYaiJIvWOsH67Ihxj68KrhRsutSfavuZw09X@lists.infradead.org
X-Gm-Message-State: AOJu0YzTSDrMfWTh7ImJws6BrAoxtAJ4y59o3qwiM5uTET29DeglqL6H
	4tuXm1IR+hKbEM1aZfv+4YZcyV/Ezagp1fGOtJSVvF/R0OJPh3qhvw3MwDx/tcm9wlIFdnZyLfZ
	AiI31QikQvCuBF0DReSggmsjlsV0NTqEciq80oICeDA==
X-Gm-Gg: ASbGncthoxxDu+eouOofbrPtQ+u/n2Qw6OQHAyXZBLnor3l0h8pNeqYU8A1B2hhih+y
	EsGvyaDPZa4Z9Iyx695DRwljC7jtsHY8vzkl4QNBY7/ZCu5qIqtaDOG9pGeh6ltdRoAXMTiZ/rJ
	oRM567VsBr/yUGwkinT4UbpZpwJzHCpB1HlY06MN1pp74HF9S9MzjgIBzt37ExGXlAgUL7WaMdB
	obynUeP3aQGyHUfgE84vla4HbNtnq+dQysz+lPJl0Wx2txVe23HFnyi9KRP6oTuXJUpL2pvb6fG
	WM9XUbKhEgNs7zMLmemB4nNt2wbi43afRLND9w==
X-Google-Smtp-Source: AGHT+IF0JiR17k2tNdQIY29GGeZp6tuwfTPaU+/ksYYCINL8GaZCSCzoJNug8wrqVngyVxyRmshkBrZF3f3+WWM6Cjg=
X-Received: by 2002:a17:907:9408:b0:afa:1d2c:bbd1 with SMTP id
 a640c23a62f3a-b72dff5f6b2mr1002486166b.30.1762787704214; Mon, 10 Nov 2025
 07:15:04 -0800 (PST)
MIME-Version: 1.0
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-5-46e085bca4cc@oss.qualcomm.com>
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-5-46e085bca4cc@oss.qualcomm.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 10 Nov 2025 16:14:53 +0100
X-Gm-Features: AWmQ_bnHJgzy3SDXUbMU9BaI_OynoJofd0BXy7gUevgAAiWJJ2om5cI31VC5pf4
Message-ID: <CACMJSesMK37D7Qy+rVq7w6bUt6bYGXykUid6bUKXvh7M9mntZA@mail.gmail.com>
Subject: Re: [PATCH v17 05/12] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Vinod Koul <vkoul@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Moritz Fischer <moritz.fischer@ettus.com>, John Stultz <john.stultz@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Stephen Boyd <swboyd@chromium.org>, 
	Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Elliot Berman <quic_eberman@quicinc.com>, Xin Liu <xin.liu@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_071507_008632_CB6D2D17 
X-CRM114-Status: GOOD (  30.30  )
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

On Sun, 9 Nov 2025 at 15:38, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> Currently, there is no standardized mechanism for userspace to
> discover which reboot-modes are supported on a given platform.
> This limitation forces tools and scripts to rely on hardcoded
> assumptions about the supported reboot-modes.
>
> Create a class 'reboot-mode' and a device under it to expose a
> sysfs interface to show the available reboot mode arguments to
> userspace. Use the driver_name field of the struct
> reboot_mode_driver to create the device. For device-based
> drivers, configure the device driver name as driver_name.
>
> This results in the creation of:
>   /sys/class/reboot-mode/<driver>/reboot_modes
>
> This read-only sysfs file will exposes the list of supported
> reboot modes arguments provided by the driver, enabling userspace
> to query the list of arguments.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/reboot-mode.c | 62 ++++++++++++++++++++++++++++++++++++++-
>  include/linux/reboot-mode.h       |  2 ++
>  2 files changed, 63 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> index 873ac45cd7659b214b7c21958f580ca381e0a63d..582aa7f8ed7fa485c5a67877558c9b15d3600ef4 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -6,6 +6,7 @@
>  #define pr_fmt(fmt)    "reboot-mode: " fmt
>
>  #include <linux/device.h>
> +#include <linux/err.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
> @@ -23,6 +24,8 @@ struct mode_info {
>         struct list_head list;
>  };
>
> +static struct class *rb_class;
> +

I know C is a spartan language but the rb_ prefix makes me think of
the red-black tree. Please call it reboot_mode_class.

>  static u64 get_reboot_mode_magic(struct reboot_mode_driver *reboot, const char *cmd)
>  {
>         const char *normal = "normal";
> @@ -65,6 +68,51 @@ static int reboot_mode_notify(struct notifier_block *this,
>         return NOTIFY_DONE;
>  }
>
> +static ssize_t reboot_modes_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +       struct reboot_mode_driver *reboot;
> +       struct mode_info *info;
> +       ssize_t size = 0;
> +
> +       reboot = (struct reboot_mode_driver *)dev_get_drvdata(dev);

No need for the cast.

> +       if (!reboot)
> +               return -ENODATA;
> +
> +       list_for_each_entry(info, &reboot->head, list)
> +               size += sysfs_emit_at(buf, size, "%s ", info->mode);
> +
> +       if (size) {
> +               size += sysfs_emit_at(buf, size - 1, "\n");
> +               return size;
> +       }

This is a weird logic inversion. Just do:

if (!size)
    return -ENODATA;

return size + sysfs_emit_at(buf, size - 1, "\n");

> +
> +       return -ENODATA;
> +}
> +static DEVICE_ATTR_RO(reboot_modes);
> +
> +static int create_reboot_mode_device(struct reboot_mode_driver *reboot)
> +{
> +       int ret = 0;
> +
> +       if (!rb_class) {
> +               rb_class = class_create("reboot-mode");
> +               if (IS_ERR(rb_class))
> +                       return PTR_ERR(rb_class);
> +       }

Why the lazy initialization here? Is there any reason you can't
statically define the class? Don't you need synchronization here if
multiple drivers try to do this?

Bart

