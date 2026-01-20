Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982A9D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 11:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1WFMJIykjeDUwTLAnV/91H11zpuB8UJJKa8bgoRktHs=; b=N1PjuCuWyiGJiLpRPd5CzcJQOt
	7rzpyaqRzxS53diyOvOHh8fRE8JgGHPlHyB/Y0S2Kx/NT5PhJDTrViFXHv8histv0cH+CiD7AygBF
	1E0PWY6j2ijBxTVOuhf31GWkSLN/hqsRQNk4Ao+erhDOEK7agiPnERyN76Gg3WA5Xcr4c6HJFlMjy
	AG3WA9R5hFvHyqW/4NBqCCpZGqIrynZikkBdj5xyyItuMULY1HWV+1egVpxV2IeD0xNw8kER3/1b4
	fqMS46k2Y8uYkJwB+1NCqePzmw19AEQokDGNtdcDVDou73w6NsLOCF7S+F4yv+hwR3BQrTlRTg0Ju
	wmxbzhJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9Ww-00000003fgk-0fV3;
	Tue, 20 Jan 2026 11:04:14 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9Ws-00000003ffx-2lR7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 11:04:12 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-894676e6863so3488126d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 03:04:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768907049; cv=none;
        d=google.com; s=arc-20240605;
        b=Lsti76HuK2gakLJJeeGQ7tyB6yV5Vu47/uSAH9BuPEubniQNJ3/sJe/a5Iht+75aOT
         8bhovkhAOeYgjxNFCPIg3uWBexnNus4cSTKerTOqJXV/rgA1ujftttnAsjdleduZpdXH
         umu1QHriW7r6FXwx9otWt+CohIgeDqAbLd9yCD+8KHO09lxwM+ryjzD2rhSVq1nmHzuN
         2cf/w59R5sBnQ5f5skbMf7VDIX1Jh+9tDKtmdM7SzdPR0DXW5Ym5s3f/brVlO8eFNFj1
         wwsu1gSFW1baYqG93R1BftWdWGp05ilmC+fSdSNp3gb59TmlDnT1ySoZDCfzLrHKKKnn
         NWzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1WFMJIykjeDUwTLAnV/91H11zpuB8UJJKa8bgoRktHs=;
        fh=ProPxvHsBxVU6qoZad3Yv5rHK6H951EH7uL00IReqro=;
        b=e8CDUJXAgWvZcCVg1c5yr3ef5WaVfKq9YSpEdeEPec2hcXONKkRs9ulrgDsa4Qzm+U
         WZxvo4t606e3v2SAWUOnm00Fzv8H/r9nQjnXw6gkbzEwIs8l16UAOcxgd3Y1Zn30I5gj
         9FKvqeYlQQRTsSJy61TamMVoypQfJoPQgBKQc1s3HNd7l+kcMt38b4B3ckLBVmh7nwX8
         X0oz/4qQtUPFnzZF3groeDrWdHjXD8aIwRBkgX93AviYpfxmrLdq57rFWRWSbWmTbA/K
         c/iSf8IllV8y8ZssPYtkpUsm1VYBb2LRaa9B8J91/kiBrEV10JOZN1q+G3uXBnnmA6Gk
         F0Jg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1768907049; x=1769511849; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1WFMJIykjeDUwTLAnV/91H11zpuB8UJJKa8bgoRktHs=;
        b=Sx29TOpVWgl02lkR9Ekuz1G4yyl1VGJjM3Hs3UVMwkQyYd++QtYuHvW688w6TLIMw+
         vClxpLyetEJSYRc40xL1OI2fSet4NMpsYwFQqQq43Hg7PzLLSufDqAt/7ebLOsvCj7Rn
         yXrE5p7lXklkB0ID1s71wh4B39OM0x7QVWegqMdFrlQGc27XRcbc7aFYUM+c5KTHymxB
         5g448rJm4UONTjSAZU9b3fBWbFPguEfDuk5WA58tz6Xx0cbYukMscWowgTbyJvmwChPW
         P6SWE0XbIUHkkSFmScTldedNpcx1a8RCplXRz/e7eSPCT9xXy8u02JAM1sCmuhvvHAB6
         hITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907049; x=1769511849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WFMJIykjeDUwTLAnV/91H11zpuB8UJJKa8bgoRktHs=;
        b=oEBc08KvFh7ILkaJJgn1ii+oJjOn00ZB1rRQCcNZG76uqWk+6e8gT9TPBCVAo62aeF
         VZyRwdosXt87JflfHYOpuxPC8oOrakpo2pgIu2jz1D/EP9Vvf86mTH84kCPx/kP0TI7i
         Xyrr1gTsXm4Lit7fBgV2V0C/AltJCm+5OW78LfigdK/Gs42iF02iAeZa7y2o3glnxUBq
         wiNCs6YJGXkz8aHZsCkPdSKZdx9taJGykYCoyCXYsBgiOpjoxY2DW82fJv0Dz736M2XH
         CG6yw/TL/zlvroFEm7P93mCuFExx224HD5cNvsCMfcyeJoOZYDUnAy8hxVgDqBzrv88i
         Lhmw==
X-Forwarded-Encrypted: i=1; AJvYcCVGKEZ5Tfer08/6iPpUobVQUXXwsyavCg164OpxwJr3Dpk1s9/YHZxS+d493cwWAo7pyS8vZfFcz8EHm19CQon+@lists.infradead.org
X-Gm-Message-State: AOJu0YydScA2Ne9dyCuofo7ZhTprMl6YRC83XDYh15Ld8AwQB0DEIv+N
	tMGFs2SUdPIyXM3Q5HgKq23p4QbZuEEjFZ04BPiV7qSJZzYt/JasREdWsFX7kcggufw6zLpvVvw
	5L8Y8RI3Ey24wCI2Z2ZZHvU0aKMqq19shllCEIomMBg==
X-Gm-Gg: AZuq6aKPAZbscb2Ded6dY/DDBjEt9Mb8Ypn1nYMF3zRMNULIb6i1bsMG0xPf+CfsJTf
	aF+COXtFMEg3Rp4PiKpHm2etfTZW88VffEG00lW3jIR/+WY8hy5MWnSKPLhs5AyWTaGeDiYGcT/
	3FAIKFaZgpEZay0BWsD2dv0y9DrRyjul4kxk67nc3iNtiUMbU6gbtMcFv+L7W48b+OZgOmNaPWi
	+zg4iGfyBVx6Ke1z8HwtR5RGzu+TLoOXKM/CfKwHgLP+8L7N81MbGsWmyCjUlSTN1Gn
X-Received: by 2002:ad4:4eef:0:b0:88a:4694:5921 with SMTP id
 6a1803df08f44-8942ddad70fmr192050966d6.37.1768907049157; Tue, 20 Jan 2026
 03:04:09 -0800 (PST)
MIME-Version: 1.0
References: <20260109005821.225235-1-andyshrk@163.com>
In-Reply-To: <20260109005821.225235-1-andyshrk@163.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Jan 2026 11:03:57 +0000
X-Gm-Features: AZwV_Qj6ykO3irdHAAivo3zJ7fPUY3sXls4LuuJI-exbLYOzFgw_HME4X3eA2Z4
Message-ID: <CAPj87rPYsD9bp7Ep=fBb2ViOzSnWCgWNJ7Hj=WZuDR+OTNpnSQ@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: vop2: Add mode valid callback for crtc
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, airlied@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch, 
	Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_030410_692346_9E2B30C3 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

Hi Andy,

On Fri, 9 Jan 2026 at 00:59, Andy Yan <andyshrk@163.com> wrote:
> Filter the mode that can't output by the crtc.
>
> [...]
>
> +static enum drm_mode_status vop2_crtc_mode_valid(struct drm_crtc *crtc,
> +                                                const struct drm_display_mode *mode)
> +{
> +       struct vop2_video_port *vp = to_vop2_video_port(crtc);
> +
> +       if (mode->hdisplay > vp->data->max_output.width)
> +               return MODE_BAD_HVALUE;

Why not test height as well?

Cheers,
Daniel

