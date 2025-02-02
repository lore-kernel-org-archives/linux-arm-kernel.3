Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C4CC02190
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 04:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ce0FET0IfkIOlTle7eps0vS3nFf1UCmQKqVcb2oIVfE=; b=fHaosWmUWYzrp+kJ996yubm2at
	b7HnH63+jz6rxAJOemYzpdUeQhMm1iUSohb/pcQyM7EScVAkJ8+pBc2m/z2D+LP7o0GXJ7s0LD70T
	zIRwCbPE7xmkZW1WdRA4dOi3ClKr6R2aUOCJ3NVCOcW6cmqCYXh4HuS3vWQzcv2NuRCf+YiKkGKPG
	4/X3wau1yYMncJYnnb7e7hQlAnkQpgYj1jiB1tL3tMM3wAShL+qZAutWobB1/pveQMQnA28HxhHI4
	7cJ+K6OXtr5hkeh3jQLbj+pefpXyBK3ok//yTQS3LtKm83H4+R3F6mHTH7MX2+bm8hEZyDf9XvGHg
	4KQ8suNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teRE1-0000000DLiX-3GmA;
	Sun, 02 Feb 2025 04:04:49 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teRCh-0000000DLd0-20Rf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 04:03:28 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-4afe99e5229so921063137.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 20:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738469006; x=1739073806; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ce0FET0IfkIOlTle7eps0vS3nFf1UCmQKqVcb2oIVfE=;
        b=WQRXHaDjF6Ag+tZvn+S/Ey5xETrTZLfM/d2NOQgur1LdL4NeX4hlW6viYXH5FTVHAa
         Favyjc8smEvF6uNkV3maw5CzbNNmQDbUeU/it1Qm7xyQtM3gsEGUZGeH6G1vVN9uiTLr
         EMIur21hvJC/t2DmTIGStBXS22n4rQfKNH++oXz+ktrw2Tey8kn0g2IdTgSpO1Bscm1Q
         HXNKnXFZhyvBnCvz/yjF3D+adVTuADeOLXMwkrOwfrkYtKLlMBF5qLY/S+z9vSTMyiGR
         KO2mjKuMqj2SuqqgBXIikLLlbHoiXKAPN/vkJuoDO789Jl+Ee0JWSDCq710eYN/IS0f8
         nOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738469006; x=1739073806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ce0FET0IfkIOlTle7eps0vS3nFf1UCmQKqVcb2oIVfE=;
        b=mHS5oT6udTuJA1g8+NmMsJ6FGABy2GQD1dh9D969DSrOrB7QkMAWO8ncnPxeKVA2bh
         0mPZLOCzGiP5Qcm9jRB3bRFRZf8MxevMKFQ4w3EkJr70fwlDfjFL4Q+Tn0SJ7Mnml3hm
         v1EbuuehNkot8fm3VZdts8nv9+cUFo+YDzcPXpee8l05srafr10IMtMI7Qlx62mdbzhh
         A9RJYogm6uX0KNuYn8XaK1/1azOApanWXXshL5FWx+RYYIuMdF7QZRoJ4fdYHllowTss
         2XDdl+zp+VZmNHV7Zl9jBBzf0xoRPmOXGwfckyaiBv1K10JdNojgBAPGuxplN+RYawAf
         8ZFw==
X-Forwarded-Encrypted: i=1; AJvYcCXxH6+1cQejoiJUJNYrnjBX8fi03ijYXcygBufL5A0YuNqSccgbsT4r6b2FPU6zoOT0Y/+F8b4yfH+iviweafJN@lists.infradead.org
X-Gm-Message-State: AOJu0YywA5DhNi/CjA5pOkVpjgFH49oS3EUotv5MAlGr139Dyp7skUQx
	cxj+ojgshwLBMpppDU9evwT8j8QvPWALBFjq0dYvaeTkfaVrDCGMDrBxtR3aHsyjX6/D46grcqv
	yF8IUrOD3bpgM/9fXSLHqKNH4rwk=
X-Gm-Gg: ASbGncvBlr6HKNxItaSWWe1oESOXYvsQz3V47TwUc77h4+c5t2fiNcFPRj5h7tT3h+E
	lUkFU5X+w+fui/vx5hD+nvJKknO0kNfEuSEuDOo63+bgWI/KIuyCKKTb6cDlxtpZktPBAK50=
X-Google-Smtp-Source: AGHT+IEl2hwFbFW7YBYOu+GLWt5eM+n+AOb40sBzZ1Uqgh3CYrzMGQfoNdzZenlrAl/ISiDC0/BrrxYhxOBYcrRDv1o=
X-Received: by 2002:a05:6102:3ed0:b0:4b4:6988:b12b with SMTP id
 ada2fe7eead31-4b9a523c972mr13337687137.23.1738469005670; Sat, 01 Feb 2025
 20:03:25 -0800 (PST)
MIME-Version: 1.0
References: <20250131165549.GA684322@bhelgaas>
In-Reply-To: <20250131165549.GA684322@bhelgaas>
From: Inki Dae <daeinki@gmail.com>
Date: Sun, 2 Feb 2025 13:02:47 +0900
X-Gm-Features: AWEUYZmqMRW6IjLJ2-1W_gEn2kSwXk8I9ORt1L9SvKNpwZDk2Y6UeiwO2M7pvFE
Message-ID: <CAAQKjZNqFt=SYxCzpQ5JwOADRUwsWsq5KzLRoPG++27SXGubnQ@mail.gmail.com>
Subject: Re: wait_event_timeout() usage in decon_wait_for_vblank()
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_200327_536170_C66EA276 
X-CRM114-Status: GOOD (  15.83  )
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

Hi,

2025=EB=85=84 2=EC=9B=94 1=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 1:56, Bj=
orn Helgaas <helgaas@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> I don't know this code at all, so this is likely just noise, but the
> wait_event_timeout() usage in decon_wait_for_vblank() looks funny to
> me.
>
> decon_wait_for_vblank() waits on wait_vsync_queue for wait_vsync_event
> to be cleared.
>
> But decon_irq_handler() only clears wait_vsync_event and wakes up
> wait_vsync_queue when !ctx->i80_if.
>
> I don't see any i80_if connection in decon_wait_for_vblank().  Does
> the wait always time out if i80_if is set?  Is there some reason we
> don't use decon_wait_for_vblank() at all if i80_if is set?
>

For the decon series, the implementation for the i80 interface has not
yet been completed. If you would like to see how the i80 interface is
handled in Exynos, please refer to the code for the legacy display
controller module, exynos_drm_fimd.c, available at the following link:
https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/tree=
/drivers/gpu/drm/exynos/exynos_drm_fimd.c?h=3Dexynos-drm-fixes#n1053

Furthermore, please note that within the decon driver, prior to
creating the CRTC, it is necessary to implement the TE handler for the
i80 interface in the te_handler of exynos_drm_crtc_ops and register it
as a callback.

Thanks,
Inki Dae

> Bjorn
>

