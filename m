Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628E5CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 14:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZYpUpOAXpJ+IKkb04BaHmWYt/5ffG0uR0XEO4qo4hU=; b=W/H7Lq09NL7a90Wo55WmFV9msC
	BcBUS3JZaftG0F8hKqZMUl8NCoMiBwg1KIbEtO4Ch3SbSXerBVHRPNpaXm2AVF8PNlkrYbtT9yLbW
	Vk79hpxXFItUi6OvYOxdsG8aGeQjyU/ZrbhdGFWXpFFcnwGNX38UL6MiG2uresDxRLx7UyEAEcKWD
	SsjI0xF8+VxYzCMIyQp37HkWJo0SPHPR4TXBmg0ztf242eTpXIGx9s387RtxPXiYvSv7d5XfAUPHB
	QK75jYZ4IVN9moDZq++vLIyEi/EzMR6b/ssWg41qI1Ym87YCm1HHb+e/bimJpS8H+kERQCSKe/Li/
	ssb5u0lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFCa5-00000007q3n-4267;
	Sat, 01 Nov 2025 14:27:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFCa4-00000007q3Y-47si
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 14:27:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ECA42601F8
	for <linux-arm-kernel@lists.infradead.org>; Sat,  1 Nov 2025 14:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BC7C19424
	for <linux-arm-kernel@lists.infradead.org>; Sat,  1 Nov 2025 14:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762007265;
	bh=lV3WbcP4L63VVdKmRFHTW2IFkZA0MqVRd2TKiW7+rwE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=L5Yny+RqR6ejBT6dWjFU5SPnufclvSK/b4ZmkHgMH6VFD/mWp5pBe6NBwWJvKh9WQ
	 dsgceBxVUt+AO2fGJ7F7f4vOLZIkAgGFHdATQcvg9q0kcr9iabq4uwwJWy9kUzAwa/
	 DoFWq7t+6T2yv6Ptrc+1xMFw9+2PuFR79bBKtT5OVGW5QUlQ4CXg6r4756IW3Qb5v7
	 7J0q4ufSMc/E670BHmPOvjV+CV0F5R1Wsu0m4YJP2ZnJbv3BDCkn6uHoqDdpjcqTGE
	 GNEOyFEnh+Zc8PEnjyMQkOUWtgLc+S/vNujsiam8gFVG3pcxFUM8cBPBRvB7oe3FfY
	 5Cs7n7Dvgpnyw==
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2953ad5517dso13721505ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Nov 2025 07:27:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOkTkCRV84Icb712JkDzVM2YL54GsrJlCyrRCFhBODoBfkhWNLzZb9yhKVjTkRV2l3dwbxDJtEyn2TE1sBNAMw@lists.infradead.org
X-Gm-Message-State: AOJu0YwNEJt1IMCsxJ+wLuDGU33d64KTlaVE/c8b5QItXtQLEd2yEH0X
	3fAo3DqMslbXgMVQqH9glKYcYXQr5k+hvPn2EMiif89o9B9mSJAIGY3eYJO7Oya2p1ArOGk0K21
	sPbJeboNyclmuneWF+CZ58wqonBJ5Ag==
X-Google-Smtp-Source: AGHT+IGnOFjLL6wAsT9pv5cIhcF/90Mw/1kp/7g3CvXtV1RTTu/pF5hz4dyECsPv9IpJsPMLjLxpTdmcXg7a1NiMbbo=
X-Received: by 2002:a17:903:24f:b0:295:24ab:fb06 with SMTP id
 d9443c01a7336-29524abfc57mr60471485ad.22.1762007265054; Sat, 01 Nov 2025
 07:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251024202756.811425-1-ariel.dalessandro@collabora.com>
In-Reply-To: <20251024202756.811425-1-ariel.dalessandro@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 1 Nov 2025 14:27:32 +0000
X-Gmail-Original-Message-ID: <CAAOTY__Ac8S3gnbx6RbVZrNzMcqSkE70xuq5ErbzAWPUh9moAA@mail.gmail.com>
X-Gm-Features: AWmQ_bn-FuEPLjCksrS_ODh-bQvHMz1N_UARyqPo_gbgBDuh1txOjH8bx8rhYo0
Message-ID: <CAAOTY__Ac8S3gnbx6RbVZrNzMcqSkE70xuq5ErbzAWPUh9moAA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Disable AFBC support on Mediatek DRM driver
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, greenjustin@chromium.org, 
	sjoerd@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Ariel D'Alessandro <ariel.dalessandro@collabora.com> =E6=96=BC 2025=E5=B9=
=B410=E6=9C=8824=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:28=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
> Commit c410fa9b07c32 ("drm/mediatek: Add AFBC support to Mediatek DRM
> driver") added AFBC support to Mediatek DRM and enabled the
> 32x8/split/sparse modifier.
>
> However, this is currently broken on Mediatek MT8188 (Genio 700 EVK
> platform); tested using upstream Kernel and Mesa (v25.2.1), AFBC is used =
by
> default since Mesa v25.0.
>
> Kernel trace reports vblank timeouts constantly, and the render is garble=
d:
>
> ```
> [CRTC:62:crtc-0] vblank wait timed out
> WARNING: CPU: 7 PID: 70 at drivers/gpu/drm/drm_atomic_helper.c:1835 drm_a=
tomic_helper_wait_for_vblanks.part.0+0x24c/0x27c
> [...]
> Hardware name: MediaTek Genio-700 EVK (DT)
> Workqueue: events_unbound commit_work
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> pc : drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c
> lr : drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c
> sp : ffff80008337bca0
> x29: ffff80008337bcd0 x28: 0000000000000061 x27: 0000000000000000
> x26: 0000000000000001 x25: 0000000000000000 x24: ffff0000c9dcc000
> x23: 0000000000000001 x22: 0000000000000000 x21: ffff0000c66f2f80
> x20: ffff0000c0d7d880 x19: 0000000000000000 x18: 000000000000000a
> x17: 000000040044ffff x16: 005000f2b5503510 x15: 0000000000000000
> x14: 0000000000000000 x13: 74756f2064656d69 x12: 742074696177206b
> x11: 0000000000000058 x10: 0000000000000018 x9 : ffff800082396a70
> x8 : 0000000000057fa8 x7 : 0000000000000cce x6 : ffff8000823eea70
> x5 : ffff0001fef5f408 x4 : ffff80017ccee000 x3 : ffff0000c12cb480
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c12cb480
> Call trace:
>  drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c (P)
>  drm_atomic_helper_commit_tail_rpm+0x64/0x80
>  commit_tail+0xa4/0x1a4
>  commit_work+0x14/0x20
>  process_one_work+0x150/0x290
>  worker_thread+0x2d0/0x3ec
>  kthread+0x12c/0x210
>  ret_from_fork+0x10/0x20
> ---[ end trace 0000000000000000 ]---
> ```
>
> Until this gets fixed upstream, disable AFBC support on this platform, as
> it's currently broken with upstream Mesa.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---

