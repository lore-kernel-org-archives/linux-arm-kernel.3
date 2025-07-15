Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99819C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 14:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmXJKB2UBBWYcXoeD1QuMKUzGQy2kQwyWXbXDN9xArw=; b=mZLnq9oc6KYnm7GJ3G5lv7Fsgg
	7mRupzu9uELF1PkzZROPJqBJXr0xPBVvuVxtLGwMhDu8sUoi3yYUrZwwVmA66+t6sb2pZZHmeEfBT
	dNlohKSUwsny41+Lwe7lcasufqrszpZxoPL8ilqp2AABKfbdHMwPJgbxnNlhG9yZPanW+D1W2TT6V
	E6PV30Yd6Godj+M8zL8iW+KuDWonJ6UlN/JIz4nRfcHdEuCsqGCXdjARzcCvAGY/d5xq2DwAkf7nY
	/Nl4XS3MyaTBwLPGyG702i1DV4Svr8dIDgng/Dx3y0VnXbDlWHNEXMCeym4qyRpu4sJEE2Z/359Zf
	J/cXViBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubh7w-00000005UeW-04c3;
	Tue, 15 Jul 2025 14:59:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfiI-00000005D8L-2Jix
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 13:28:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3ACDD45CDD
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 13:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C574C4CEFB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 13:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752586134;
	bh=cjc0RDMZbltboQ1RR5x3p4nAwpio8fE7hnW+L8x5WwQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SY3/KylBUzz31er79bfw/JgAJdDa2ngkftst0JZzy928l/GgYBS73xdw7M/MN4DW5
	 Z6dbSTP4JvIOP96BayczV5VUU+43jcoyu/15zQKSWIbj0cjQ1eHhKuPwJHQmFX66Ao
	 c1JAE0zXp/BrQ2teMrDElkQoln1mQBLwl6ShQRGRFPSSIKFTeagmpdyi7/xYT3Hkg7
	 bi+LNkWJoOrhdN7+s1WZ6cFgXYFnoXTuzlvnUYC28IJkt31IxnxPD0LlORY2dJE4y2
	 CFzk1DuBG+y3ktemrkz/2iMka1VwssdRacpiFf2Vad9euP/bH1P/shMIDlNwrtHfsj
	 q3mx5Fy+aie7w==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60c6fea6742so10648310a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 06:28:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXz0euLwGcnu9xnCRh7fqSpXm2OwULOtkAcwtnys4uoCue9b6SbPIQNP5+Q4XP9CZwVBsaQjahBW14oScFv6W7F@lists.infradead.org
X-Gm-Message-State: AOJu0YxOOCi6O/yDkz8w1ytJXiobES+ZYZ7ITh4rwGP00ubuk5JsSfbZ
	0pp1kEaCwGEYHbaEo3iF1E/HMeidbvm0RRNrLVexBAkrQotX6ULc2qBELSg5dqaSxEUV1BB1gjn
	rfsuz+gg4m9kmdwZBGchJ5xNLt6hcpw==
X-Google-Smtp-Source: AGHT+IFs4W+Mc6KDmPR+BhSyiX4vw23rKBtHp3go5SamoCNjOmpMqCPQF8aMkbamXqomTl4rbMZSJDZEUQ5/54iNNzQ=
X-Received: by 2002:a17:906:730b:b0:ad5:4a43:5ae8 with SMTP id
 a640c23a62f3a-ae6fbc63f70mr1723987166b.12.1752586132534; Tue, 15 Jul 2025
 06:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250715122643.137027-1-tzimmermann@suse.de> <20250715122643.137027-5-tzimmermann@suse.de>
In-Reply-To: <20250715122643.137027-5-tzimmermann@suse.de>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Jul 2025 08:28:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ-o05oO1TGexj7s68=9peSQURxF3siw5hDK2fU7AgMxQ@mail.gmail.com>
X-Gm-Features: Ac12FXxI8wW_XXiQYlbiT9UidRz349kSHXmlUTD2OUpFDmpZ1t1a8EguF44xgCA
Message-ID: <CAL_JsqJ-o05oO1TGexj7s68=9peSQURxF3siw5hDK2fU7AgMxQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] drm/panel: panel-summit: Include <linux/of.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, 
	neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, deller@gmx.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com, 
	ilpo.jarvinen@linux.intel.com, sven@kernel.org, alyssa@rosenzweig.io, 
	neal@gompa.dev, support.opensource@diasemi.com, duje.mihanovic@skole.hr, 
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_062854_611826_C1071E68 
X-CRM114-Status: GOOD (  13.14  )
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

On Tue, Jul 15, 2025 at 7:30=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Include <linux/of.h> to declare device_property_read_u32() and
> struct of_device_id. Avoids dependency on backlight header to include
> it.

Neither of those come from of.h.


> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/gpu/drm/panel/panel-summit.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-summit.c b/drivers/gpu/drm/panel=
/panel-summit.c
> index 4854437e2899..02aa1ec287d6 100644
> --- a/drivers/gpu/drm/panel/panel-summit.c
> +++ b/drivers/gpu/drm/panel/panel-summit.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>
>  #include <linux/backlight.h>
> +#include <linux/of.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_mode.h>
> --
> 2.50.0
>

