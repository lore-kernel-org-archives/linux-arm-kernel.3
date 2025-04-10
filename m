Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CE0C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 13:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3Tv77bW0aU9RBMscUYQTaZLK3cWTZ2jDWR8IUulQ9A=; b=y/GJR8AbsV1YY0zIfujzfgUkzp
	WlpA1NvvORy7Tm5fIngnvGfIOyDXifC2p7NhMsdn7JhtomYQLBdO9mHTwQ8ukbYBb71MkLqaUroo7
	GakaJU6Lq77PNfAX2I/6unsDubT4+hfAMHCR8GIf4GlYkY1PuRYoA9ZHgLGlOxwD8yqmQnC1Qhwii
	6lOYQD8w6WWrSJay0lEyhZb6A8J/oyL+U6L69orc8rCOeiT+cPfJrAyXQ3mrcX24kid8fN/l9Q6Ia
	yl0/Tt4kiq/+VcyS9kqNfR4os/+0/Mk9jpFqdtKWiCMCeXETnVMOPt8Wjf20bf4pcxR98MtgEg8wD
	PY3BAsBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sIt-0000000Ak2U-29n4;
	Thu, 10 Apr 2025 13:50:51 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sEl-0000000Aj5X-27oH;
	Thu, 10 Apr 2025 13:46:37 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb1eso1561167a12.0;
        Thu, 10 Apr 2025 06:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744292793; x=1744897593; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s3Tv77bW0aU9RBMscUYQTaZLK3cWTZ2jDWR8IUulQ9A=;
        b=QZGoP0XRLOGUvSkPutb2vbXyb+mfs5SKV0o1M4E2MRSs31xEsTfJkWeuUgJBN7UFDy
         q+9dGKwdnpXApifwzuLJ96JVmVnz9qsUlShnKOTkPspuaFt9CDEMxnfLfk3HVTMiBUZE
         kVFvN/vnJUadrtVvUjItf/8sBt7elRaYOKNNhy9IQde8ni+QGkAd/krb64GhLXoxfGn2
         b5p5ADIdmg8RkzWJPj8z0KjOVtOOt2DfKnJ23tvdS+K42DUMbikAnpqEU8Cft7d0VwEn
         RQ7xBhLYk8CbGWBQVYWEih4fxWcFoJbP8gSupq6fTdQddjYv0c5Ly1+LQe6z+iIIAezI
         1g8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292793; x=1744897593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3Tv77bW0aU9RBMscUYQTaZLK3cWTZ2jDWR8IUulQ9A=;
        b=P2BCOIggu+EsmVbW49korTEi9xgE16HM+7gSDeOIgcXIdp2l9S1k4Ccwe7YD1YX2s2
         +o8EJuoNsZq0HIQUIVyMrqbEETcLhbOtdfPL4wHcTgi+5XsPlTKXaTHQzeWw2JD6P3ta
         KVjxTAp2c/SjOrAuuY2R0zZ2O8+XqJauRc8iecPrXD6eMJrqZzGTcVGPJja2Z3IZhCu9
         h1AG+peWL3p0ilvW1TY1iX6pB+I1Nd+KvH1PJQ1ioRuFmQuUw0aseborZAhU2y/1Ouvj
         ZlHuL3C7vocEIo+XtlhK2rQVp2q7MWtA7x8Hl5e+5GaBmw2EbMytzjfp5yMD68Zqvjri
         LwIA==
X-Forwarded-Encrypted: i=1; AJvYcCWm3M90BBSz1RIjc8UAsCVRzm57Ak4RrvjjXfY1zlPz+NVNr9lvLB8PP5MH1Zj48qy1CKwDsK8CtK/LkViUreYo@lists.infradead.org
X-Gm-Message-State: AOJu0YzGLXnM9CMy0/PjuexFj5OP2LKojE1PtK15DedQ+UeaHdY5P0t9
	67VbT8glgtfkfbrrCtEPd3l8B0HqNjui/e+L/ZiEZia2sdLVd7rBHpycmBw5swGhClZndHqEiA4
	+1n6349knC56f0c9QoWxVwGqFQnc=
X-Gm-Gg: ASbGnctY7cVzzjMsnJMdrTAorjGTBUMz3lfRp1P7psqOl3U/pn8ov8hExbfuHOtRwuw
	fQh0AJISd16NnEFA5S50KEiOFgT8Bu4vUM1iKbamJr1yqikLFueMaddozCK0YDheKxg/lI+3Z4M
	GBVxcgReSjhyYkyG/hRx17cA==
X-Google-Smtp-Source: AGHT+IHiZFDgujiOG3UnHGeTx0KUPl+GHBXPb9fdrtmfKTuXg91n647EErsdZP3zN0Q/Y37TV62Z4t7VfBh5GpvARCI=
X-Received: by 2002:a05:6402:268b:b0:5e5:334e:86d9 with SMTP id
 4fb4d7f45d1cf-5f32a138efdmr2440544a12.13.1744292793246; Thu, 10 Apr 2025
 06:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 10 Apr 2025 19:16:16 +0530
X-Gm-Features: ATxdqUEdXHiyPPzlQQzx8sGDVrj8q4dzBzZE7dD5ZZvqIMWxRPwWGuOzBSchz3Y
Message-ID: <CANAwSgTp26r-xeiSDkdX21Sp3RQtfh42JV4fCgirLkHZYuGD-Q@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: fix resource cleanup in meson_drv_bind_master()
 on error
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	jbrunet@baylibre.com, neil.armstrong@linaro.org, 
	Furkan Kardame <f.kardame@manjaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_064635_544535_82CB8B3C 
X-CRM114-Status: GOOD (  16.54  )
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

Hi Martin,

On Thu, 10 Apr 2025 at 03:30, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> meson_drv_bind_master() does not free resources in the order they are
> allocated. This can lead to crashes such as:
>     Unable to handle kernel NULL pointer dereference at virtual address 00000000000000c8
>     [...]
>     Hardware name: Beelink GT-King Pro (DT)
>     pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>     pc : meson_dw_hdmi_unbind+0x10/0x24 [meson_dw_hdmi]
>     lr : component_unbind+0x38/0x60
>     [...]
>     Call trace:
>      meson_dw_hdmi_unbind+0x10/0x24 [meson_dw_hdmi]
>      component_unbind+0x38/0x60
>      component_unbind_all+0xb8/0xc4
>      meson_drv_bind_master+0x1ec/0x514 [meson_drm]
>      meson_drv_bind+0x14/0x20 [meson_drm]
>      try_to_bring_up_aggregate_device+0xa8/0x160
>      __component_add+0xb8/0x1a8
>      component_add+0x14/0x20
>      meson_dw_hdmi_probe+0x1c/0x28 [meson_dw_hdmi]
>      platform_probe+0x68/0xdc
>      really_probe+0xc0/0x39c
>      __driver_probe_device+0x7c/0x14c
>      driver_probe_device+0x3c/0x120
>      __driver_attach+0xc4/0x200
>      bus_for_each_dev+0x78/0xd8
>      driver_attach+0x24/0x30
>      bus_add_driver+0x110/0x240
>      driver_register+0x68/0x124
>      __platform_driver_register+0x24/0x30
>      meson_dw_hdmi_platform_driver_init+0x20/0x1000 [meson_dw_hdmi]
>      do_one_initcall+0x50/0x1bc
>      do_init_module+0x54/0x1fc
>      load_module+0x788/0x884
>      init_module_from_file+0x88/0xd4
>      __arm64_sys_finit_module+0x248/0x340
>      invoke_syscall+0x48/0x104
>      el0_svc_common.constprop.0+0x40/0xe0
>      do_el0_svc+0x1c/0x28
>      el0_svc+0x30/0xcc
>      el0t_64_sync_handler+0x120/0x12c
>      el0t_64_sync+0x190/0x194
>
> Clean up resources in the error path in the same order and under the
> same conditions as they were allocated to fix this.
>
> Reported-by: Furkan Kardame <f.kardame@manjaro.org>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> This issue was reported off-list so I'm unable to provide a link to the
> report.
>
> I'm not sure which Fixes tag fits best. My preference so far is
> Fixes: 6a044642988b ("drm/meson: fix unbind path if HDMI fails to bind")
> but I'll happily take other suggestions as well.
>
Thanks for this Fix.

Reviewed-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>

I have tested with the following script on AML-S905X-CC
---------
#! /bin/bash
set +x

cd /sys/bus/platform/drivers/meson-drm/
for i in $(seq 1 10); do
        echo "========================" $i
        echo d0100000.vpu > unbind
        /usr/bin/sleep 1
        echo d0100000.vpu > bind
        /usr/bin/sleep 1
done

Thanks
-Anand

