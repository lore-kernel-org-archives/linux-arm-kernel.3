Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF6EC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 14:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcKm5/tXdE/0WU8n3kR6lQGyuHWkdDdazDILzFNqfS0=; b=D6fKfroveBE98/4SvsswVmMkxk
	xoVWX5F/w2OlRr0Tl6DQIb0JPyvf+IlPMaZxYgdfW9e/NGmE/uxyvylqK9YMcHWeq9E5DsbrkqbKJ
	PSyUaf8yYGJR3Krm4iIry7/4o01GbrUDB4i9dnwZxA3qQOSImzIxjpsBDb9v1ws2pzoc08MLmdr9e
	cYHWEG799imI/O+MOz7uA/XMqOXhau0LMthtZQOAqcGm0csYtf9kUnFoxdZVYjl0Sxe7HbE6o/43+
	Xk9XkSIKFZ0Zqe9MI+siKR9oJPPlCgflKQ6ChgpssxjbreiX4TxwZ2dA34bLMwIKkDQJ2J41BCsyJ
	SRxl0FEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRPo-00000008dzc-31HH;
	Wed, 26 Mar 2025 14:07:32 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRBG-00000008btJ-08tw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 13:52:31 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-51eb1a714bfso7206841e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 06:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742997147; x=1743601947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcKm5/tXdE/0WU8n3kR6lQGyuHWkdDdazDILzFNqfS0=;
        b=fw+wHj2oP4rg1a68wT+h0l32ldNQGNalGT/9HkG04a98byA7piLmCL8G4IIjnGiS26
         5ACwJZaQbaxmCbmUdqXJ4lENKsBf9syzL9AznNeRVXRYV238h3zRnARgQCIA8EKTlM6a
         QA9A/ozaI3MMCgC8S95SOr6+jEIaCjDIA0XHeOdVHmJ7twNNYkq4mXnrhExXh8ZqcLLK
         XYsFhta+3lIv4/fecU0bRxN5kfqIV0jyNbB76LHKTMr2T7cHO8azoFdyiJgc4LBd8eKV
         g5ws/fe5x3g24cwzU7y2dKT/GeHdiwR4wMS9icLyRkdQblnk7jNOr1Or9Uwky5lQPLeo
         3mzw==
X-Forwarded-Encrypted: i=1; AJvYcCXer2eA7V/aZt6nMRXJkve5eP8cQpueb8YVqMweD7+As+7WH5tn6vsYKYDvQZjCUb0ed6jm03IlhUWryjSDh1WX@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk8jBA9KJLpJhRo1LJkHbufuVrM2PtRgEd9r8t3W/GVl036Xkv
	8E2DwrLztQPbizw9Bkaqh+g313OPpfNtYVp6KIWbZGbRU61xYF0Sb+fiSTMxBkE=
X-Gm-Gg: ASbGncsXTe0ifh//BQknSmiPu90LUaTblDS1YhXbmCcv6hWSrM9vLhL06B5IPoHyXiX
	PzkQ91aMqdzahfSVPi3slCzv2s/BnYrFxB5/xdH0ELgrmHvPFrNMXk31GS6n1nVvaARuEit887u
	lropi7/VD1bu8MRlryChGG3PeEmTCvmVzKws2pfQKKawQRFAaC9IySTj9v619DjTJ9vzvj2I6RC
	IlCgDXhI/Rdacry0qSViiLbaAJd/8o/XByBHO4IzqSxKVgJZ0KZZNEJBJDHm1Q3Uh/Rxz/s3nCi
	ve825FK3S2JanMz6spAkZactqkCcb0aUiTlCBjSC5P7RVtAkgBCddeavHeHAG0NpG1o2NJ9z2ld
	ajSv6S+8=
X-Google-Smtp-Source: AGHT+IGxGBNW+7SWugRPom3W1AxpIXK6r4aFRIsCsd93kz7hoP+PcQFZH/cE44ffGQ9Bx6pbXIVMFg==
X-Received: by 2002:a05:6122:d18:b0:520:62ce:98ed with SMTP id 71dfb90a1353d-525a84c4815mr17570619e0c.6.1742997146369;
        Wed, 26 Mar 2025 06:52:26 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-525a76452f7sm2181098e0c.30.2025.03.26.06.52.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 06:52:25 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86d2fba8647so6503641241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 06:52:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLJdENBlcosAIaUv4+EaCBDbNUR4UeZ+BlLWr3usmwEnKdsDcLrGEUi1TiCadlxLcP+cm6zjFJDZQEJh2zTWdL@lists.infradead.org
X-Received: by 2002:a05:6102:3590:b0:4c3:2803:61c1 with SMTP id
 ada2fe7eead31-4c50d5e36edmr14466273137.18.1742997144422; Wed, 26 Mar 2025
 06:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com> <20250326-xilinx-formats-v4-3-322a300c6d72@ideasonboard.com>
In-Reply-To: <20250326-xilinx-formats-v4-3-322a300c6d72@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Mar 2025 14:52:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXM1B1c=62EpcuUdpdpaBRZSJLXb1GBB0egzp7Fyeo5-w@mail.gmail.com>
X-Gm-Features: AQ5f1JovrLSxq6Q_jny8lkH2G_0PglV4cgpMVVF5cOjinLTQjx6uJi6K2dpIvwc
Message-ID: <CAMuHMdXM1B1c=62EpcuUdpdpaBRZSJLXb1GBB0egzp7Fyeo5-w@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_065230_074179_C04A3FA3 
X-CRM114-Status: GOOD (  19.47  )
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

Hi Tomi,

On Wed, 26 Mar 2025 at 14:23, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> Add greyscale Y8 format.
>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thanks for your patch!

> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -405,6 +405,9 @@ extern "C" {
>  #define DRM_FORMAT_YUV444      fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
>  #define DRM_FORMAT_YVU444      fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
>
> +/* Greyscale formats */
> +
> +#define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */

This format differs from e.g. DRM_FORMAT_R8, which encodes
the number of bits in the FOURCC format. What do you envision
for e.g. DRM_FORMAT_Y16? fourcc_code('G', 'R', '1', '6')?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

