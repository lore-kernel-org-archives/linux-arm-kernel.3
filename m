Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431FAC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 06:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVhy2zBHRxUQesgFWLmDsfBmAyKMFgT84KyKy5f5YfE=; b=fHcDBN7Yw0923grrooOZYvu4d3
	Qbp8wXFECs7ryQj2NHnrDibJBRA6sKrjA5YaMKjInCPde3HcU8ArHw4BXzmWhxjVARZJVgFa3BFMP
	92lIH+ZQ0iDIR4s1gNGTYaQ+tM3o1EPmY7Ntc2NTeNaG4zxP6WxlYWHh6JZ+ZX4kJ5hdNSDwq1Oat
	+F1O0T2spv68agCYEjwZoURHmqCtPp1XywFkhceegkdzHvhxiaaGA2QawBRRh7msBLTf0Vddj89GB
	TCULjDgzCM2XwUprQe7x1SXOHl7vHhzS07M2vnYAbqxc1MWJZu+6E3bHP1n2IZ9aRTC18wP732ss2
	5PBgbLdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woF4i-000000022kM-2hA6;
	Mon, 27 Jul 2026 06:44:32 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woF4g-000000022jf-3C57
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 06:44:31 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1588983a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 23:44:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785134669; cv=none;
        d=google.com; s=arc-20260327;
        b=AMyM77aAvcCjdbFI54vfmp5t4KC6EkTD0A4xypyKEVJ16vMQNpprIKUpzTT8YxAtal
         u800NrrQZlV+dBCc8FScPSFxmpieHSZzHDK4CtawFzKqTRdCYuUx3B9W8XvnaJ4jgN5/
         YFC1HSdRIxyUdL6ZWSBshjED+dhHUas/D33TFaDMBWPZ9OxEf5F44QWf1Jkqvc6eqgq5
         ogw4vfayPFPLwT1dw+WBV+Dxd56ftsMsvrW9Mx8RZIF8iZAumTy7i6knjL2fhynEgN5v
         85fW2nng3dM7QEE/6mB9dq/oGJHrV+d3oF61gg2dMQXqgTFQMQo5rz7C4e5z709oM/9b
         cQJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VVhy2zBHRxUQesgFWLmDsfBmAyKMFgT84KyKy5f5YfE=;
        fh=9nOjuX+NSD6eyT8yoZOUXUML/NTFuagZdver/ozxqJU=;
        b=ZMGY7/ZlRV0HIz32N8d5seM3u2EBeRNPXyzRCLkDTjuYheX7IlP1x0IU/7+SHbHXU3
         T7B2A58NgyQOHuOIvopxJYKQHMI/LmCgmcvvCtbqnPdxUFToo7hrBGXqFOUj8vn8K/Nk
         uLeVdfuMqFIQJHAS1MmxaH+AT6dnNY5eh7XigmnWgY8VgPRgV9OlKjuMINf4eqngaNb3
         mTK2V+9DhTN139n70I46G4c2zTOhJyB5DL2FZN6AMI6UEZTrH+n5BkP+JAzmHncV30x2
         TmbHX3YSR+UNJQZ8N4XXajx8KsPS5Vz4KP4u4hUrx0QoXPy1GYXnqvAw6DXJ1lbMJz9H
         R5ZA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785134669; x=1785739469; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVhy2zBHRxUQesgFWLmDsfBmAyKMFgT84KyKy5f5YfE=;
        b=dA/+hzElyuldR355XqffI9nDKECmpgPknEFaSMfYTDxb9aUfBWGpfqNQgAu4zOoBgQ
         BHZLNQJYvFs+e6a2UUsYbKhBMZ7dwK+MuDc0qtDYqK6lHv9bVxtmD9+C2XVIIyzaJYPX
         b8j1r0BBUPSrPV8d6etE9sZfm6b+4YzpHHDM+xKOho6B6GODDZ3haGW7kVQLo2NMJuK7
         qHc8Gz7zitNNGN2M+DEiEvqOmpzd7mDtnVQblk7jTgOtLf7QI76ocKT0aoRq8Xn9Rq7e
         wXVzVd5ZxslqqahpnGC7D+xpz5Wm6vXHZtAuRoQPJhvlW1Y+VdI+CakgCGSQu+Z7ZI3v
         8Nig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785134669; x=1785739469;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VVhy2zBHRxUQesgFWLmDsfBmAyKMFgT84KyKy5f5YfE=;
        b=bSOLAyCuKEnAnRoJQAAJSV2s1xq9y6pRsGSVwa0NdtB3M1xZKXHwwjj3yPE/N8t2Ew
         8OT5PdtDu0fe3ggG3r6oiz4NAV08518k3I2KlcPv0sLqCL7k6zjTq+w3TPcGP8f9N38C
         ScSmIFjlyqMj/xKwvC5fOd6I1SGEI7CflpWFkBbfcPksA3qemtUWwKcf3yhT+dnaPten
         gK/0FcT9kLBwiRHpqB7X47Ho+D0AuGN1vumDP+Vm19r0dRECTL4mSbsgF2Ij5rPbgSOE
         zx4C+xx4JfhXUiPd5+n989nUzTH/Ah33nLgEaa0db5TN4izkyhVzqHUJZtxpcF74SObH
         haSQ==
X-Forwarded-Encrypted: i=1; AHgh+RpbDLkf4/2g9VTwTcNvjfk6zWcTQ+UIzOJFkgtdASRWBmhlFe5C8m4pEZtq+GNH9hhX5MyEIYqeR0b6Tz3QBMV1@lists.infradead.org
X-Gm-Message-State: AOJu0Yzal7Js4Y/QVpx69VUD9bW3PAhgsrK2V9iAb26xnUbwP5ygrruk
	DF9iI3NZAtx2DTTOBlaBEia6wTD8IEBcNN0QAW6IuCRAvR5+hjaWhKeEsHgWtaRo+313zVXEx19
	ZmbLMDk3nR9IyrmNWerWb/OIy7Uo+1UgV8xg=
X-Gm-Gg: AR+sD11Gfcwjq8g2jkPyCLFlSO4S8w4OzJhjOUdCb09Hsgm14VMkU+iw6l1Eq2szbkf
	/XoG53rooAptZlAYMMrknLpeau2C3ZQ88B7bIwFUb8kunby7JBzXKUIRdTC9tCMfAAXFIqN96RC
	AzLr+4s0pbjYS524Ol66TPKeHYnGZU8EyrOE2jErFtg8JV4yJrP3lRtdFa14qFnVIVmBwMre/Wr
	AvTVn4GTr5R9BVCl+1+DaKkn/3UsyedAUx7cG4jVY4nwJrKWy1H9IZFKIIiB70pz6jIQwBkdQH8
	ggngsNlbmxd+19t1y7XI3mCXeL5/
X-Received: by 2002:a17:90b:3e47:b0:38e:4011:465f with SMTP id
 98e67ed59e1d1-38f2960cd53mr6833918a91.23.1785134669331; Sun, 26 Jul 2026
 23:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
In-Reply-To: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
From: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Date: Mon, 27 Jul 2026 08:44:17 +0200
X-Gm-Features: AUfX_mwqcqnNQMcZqt04xa55VFBtNE5LGKsPbm1cl7GlNjH5cXHOSWUWokyx1_s
Message-ID: <CAMhzubo-NJMro7+XbxD=MhSXiRp14chatDcn-=1Hsiak786uQw@mail.gmail.com>
Subject: Re: [PATCH 0/4] media: rkvdec: Add VP9 support for VDPU381 variant
To: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_234430_810099_9E9D80B6 
X-CRM114-Status: GOOD (  20.41  )
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

Rock 5B+ leg of the three-board run in the cover letter, as a tag you can
pick up. 7.1 base carrying this code, not a build of the series as posted.

Francesco Saverio Pavone <pavone.lawyer@gmail.com>


Il giorno dom 26 lug 2026 alle ore 22:28 Venkata Atchuta Bheemeswara
Sarma Darbha <vdarbha0473@gmail.com> ha scritto:
>
> Hi All,
> This patch series adds the initial VP9 support for VDPU381 present in rk3588.
>
> VDPU381 supports VP9 Profile 0 and Profile 2 up to 7680x4320@30fps.
>
> Tested with fluster (suite : VP9-TEST-VECTORS, decoder: GStreamer-VP9-V4L2SL-Gst1.0).
> The 224/305 score has been reproduced independently on three RK3588 boards
> across three kernel bases: Orange Pi 5 Pro (RK3588S, 7.2.0-rc3),
> Orange Pi 5 Plus (RK3588, 7.0) and Radxa Rock 5B+ (RK3588, 7.1).
>
> Most of the remaining failures fall into a few known categories:
>
> - All vp90-2-02-size-*.webm variants where either dimension is
>   smaller than 64 pixels fail because the hardware does not support
>   frames smaller than 64x64:
>   vp90-2-02-size-08x08.webm, vp90-2-02-size-08x10.webm,
>   vp90-2-02-size-08x16.webm, vp90-2-02-size-08x18.webm,
>   vp90-2-02-size-08x32.webm, vp90-2-02-size-08x34.webm,
>   vp90-2-02-size-08x64.webm, vp90-2-02-size-08x66.webm,
>   vp90-2-02-size-10x08.webm, vp90-2-02-size-10x10.webm,
>   vp90-2-02-size-10x16.webm, vp90-2-02-size-10x18.webm,
>   vp90-2-02-size-10x32.webm, vp90-2-02-size-10x34.webm,
>   vp90-2-02-size-10x64.webm, vp90-2-02-size-10x66.webm,
>   vp90-2-02-size-16x08.webm, vp90-2-02-size-16x10.webm,
>   vp90-2-02-size-16x16.webm, vp90-2-02-size-16x18.webm,
>   vp90-2-02-size-16x32.webm, vp90-2-02-size-16x34.webm,
>   vp90-2-02-size-16x64.webm, vp90-2-02-size-16x66.webm,
>   vp90-2-02-size-18x08.webm, vp90-2-02-size-18x10.webm,
>   vp90-2-02-size-18x18.webm, vp90-2-02-size-18x32.webm,
>   vp90-2-02-size-18x34.webm, vp90-2-02-size-18x64.webm,
>   vp90-2-02-size-18x66.webm, vp90-2-02-size-32x08.webm,
>   vp90-2-02-size-32x10.webm, vp90-2-02-size-32x18.webm,
>   vp90-2-02-size-32x34.webm, vp90-2-02-size-32x66.webm,
>   vp90-2-02-size-34x08.webm, vp90-2-02-size-34x10.webm,
>   vp90-2-02-size-34x16.webm, vp90-2-02-size-34x34.webm,
>   vp90-2-02-size-34x64.webm, vp90-2-02-size-34x66.webm,
>   vp90-2-02-size-64x08.webm, vp90-2-02-size-64x10.webm,
>   vp90-2-02-size-66x08.webm, vp90-2-02-size-66x10.webm.
>
> - vp90-2-05-resize.ivf, vp90-2-18-resize.ivf and all
>   vp90-2-21-resize_inter_*.webm variants fail. These streams change
>   resolution mid-stream on a non-keyframe, and a reference frame
>   from before the resize ends up unavailable by the time it's
>   needed again. This is being actively looked into:
>   vp90-2-05-resize.ivf, vp90-2-18-resize.ivf,
>   vp90-2-21-resize_inter_1280x720_5_1-2.webm,
>   vp90-2-21-resize_inter_1280x720_5_3-4.webm,
>   vp90-2-21-resize_inter_1280x720_7_1-2.webm,
>   vp90-2-21-resize_inter_1280x720_7_3-4.webm,
>   vp90-2-21-resize_inter_1920x1080_5_1-2.webm,
>   vp90-2-21-resize_inter_1920x1080_5_3-4.webm,
>   vp90-2-21-resize_inter_1920x1080_7_1-2.webm,
>   vp90-2-21-resize_inter_1920x1080_7_3-4.webm,
>   vp90-2-21-resize_inter_320x180_5_1-2.webm,
>   vp90-2-21-resize_inter_320x180_5_3-4.webm,
>   vp90-2-21-resize_inter_320x180_7_1-2.webm,
>   vp90-2-21-resize_inter_320x180_7_3-4.webm,
>   vp90-2-21-resize_inter_320x240_5_1-2.webm,
>   vp90-2-21-resize_inter_320x240_5_3-4.webm,
>   vp90-2-21-resize_inter_320x240_7_1-2.webm,
>   vp90-2-21-resize_inter_320x240_7_3-4.webm,
>   vp90-2-21-resize_inter_640x360_5_1-2.webm,
>   vp90-2-21-resize_inter_640x360_5_3-4.webm,
>   vp90-2-21-resize_inter_640x360_7_1-2.webm,
>   vp90-2-21-resize_inter_640x360_7_3-4.webm,
>   vp90-2-21-resize_inter_640x480_5_1-2.webm,
>   vp90-2-21-resize_inter_640x480_5_3-4.webm,
>   vp90-2-21-resize_inter_640x480_7_1-2.webm,
>   vp90-2-21-resize_inter_640x480_7_3-4.webm.
>
> - vp90-2-09-aq2.webm,
>   vp90-2-09-lf_deltas.webm,
>   vp90-2-15-segkey_adpq.webm,
>   vp90-2-19-skip-01.webm,
>   vp90-2-19-skip-02.webm,
>   vp90-2-19-skip.webm,  vp90-2-22-svc_1280x720_3.ivf,
>   are still failing and not yet root-caused.
>
> - vp91-2-04-yuv422.webm
>   vp91-2-04-yuv444.webm
>   fail because the hardware does not support the format these
>   streams use (4:2:2/4:4:4), only 4:2:0.
>
> The base vdpu381 VP9 driver support was introduced by me. Profile 2 support
> was added by Igor Paunovic. Francesco Saverio Pavone fixed bugs in
> the segmentation map size calculation and in the altref vertical
> scale factor. Igor Paunovic also fixed a decoded-frame stride bug, aligning
> bytesperline to 64 bytes in rkvdec_fill_decoded_pixfmt().
>
> ---
> Igor Paunovic (1):
>       media: rkvdec: align bytesperline to 64 bytes in rkvdec_fill_decoded_pixfmt()
>
> Venkata Atchuta Bheemeswara Sarma Darbha (3):
>       media: rkvdec: vp9: Changing get_ref_buf function name to get_ref_buf_vp9
>       media: rkvdec: Move vp9 functions to common file
>       media: rkvdec: Add VP9 support for VDPU381 variant
>
>  drivers/media/platform/rockchip/rkvdec/Makefile    |    2 +
>  .../platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h |  234 +++++
>  .../platform/rockchip/rkvdec/rkvdec-vdpu381-vp9.c  | 1067 ++++++++++++++++++++
>  .../platform/rockchip/rkvdec/rkvdec-vp9-common.c   |   65 ++
>  .../platform/rockchip/rkvdec/rkvdec-vp9-common.h   |   92 ++
>  .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    |  121 +--
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c    |   73 +-
>  drivers/media/platform/rockchip/rkvdec/rkvdec.h    |    1 +
>  8 files changed, 1537 insertions(+), 118 deletions(-)
> ---
> base-commit: 1229e2e57a5c2980ccd457b9b53ea0eed5a22ab3
> change-id: 20260726-b4-add-rkvdec2-vp9-vdpu381-3d1bd8fca4f5
>
> Best regards,
> --
> Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
>

