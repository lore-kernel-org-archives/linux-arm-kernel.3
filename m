Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5A8FC72C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 13:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgyMy2hQLKznZrbyYfmh+EZtwjOUXGpz7osuSEWQEio=; b=08pvWq3KWcWgixCeeCvMgjnDEj
	kplf5LS1bgLbWOIDDzlpfqaOS5U1B6xn+ZsamJQ1pd2bhNGqwdjuNeoxS3ZyK4Rt78xxQULM79Izk
	mevjuWun5fAt285JIWVi6erwQxDFgxI/5jvEDgvWibrycU6U3FMqbe4tyWZHPAvGMPunCUx7gSQQW
	jeK9Qhl7IZV2o8bnBvvpcm4+xczxKOnU9ZK7J21AwzDYmjRrf9+vrg7KXf9MA1SLhyaGZIb463IKB
	2YofIYuWBhmWNQbsA07d+6mTato6n1ElF23jlZpgxIYXFybBDckQtMpxWd6L9ryvOSXQ1968uM8FV
	nn2N7fGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4JJg-0000000FO0l-1kyB;
	Sun, 22 Mar 2026 13:58:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4JJd-0000000FO05-41Xa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 13:58:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B49943B7E
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 13:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDB4C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 13:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774187884;
	bh=mgyMy2hQLKznZrbyYfmh+EZtwjOUXGpz7osuSEWQEio=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MgbKv9hnma+0JZzsiTL4AO286J2d5nqkpL+tHeJSjyMSMw8UAytk2eRmKcjG7ObyF
	 m7d/ZJPR1MxCzf7AHXDCGfkS3xQS8m7HzGJWG0VU3Xd85Mwta2RsYwq+nGRBE6LDBR
	 qLdjcQf0Qbn5AVkKllm0dSJNIR5Jac84ZZ440arl4kTfxk/pYNBcoxr+zUEsu/7wsm
	 0a/IoUKgDL5MRz5ZJE1HOlF7GCAjNrJKfEROVfNZGd+BuFnraFpm7Qxk6a1CsNRRGy
	 0uo/sEaj7Z9HvvC6He72vCAusvTfTH4g2OJrcIQS/vZALZ7q+X8g1VjdTGQ4Ld0lSq
	 s2FsluD9ZJcsQ==
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b6b0500e06so3806419eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 06:58:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUAARhd0xu/6U6AMdYCDoFhDzxK5FmT+bQ78zhGsoWtYx7xvqSsRqCY/3+PIeb4jEpcDqRJeWx0OHeO8ihheBf@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo9/yUD/0w8EcUeieZFoS4MvlBawBAjrWPagleJviyIYgzyW7d
	1VFY9SHjgNTO2qpynrxqvMzGrbssj9qQtL3KzRofrqZ/uTFKgdhV9lW1cc+utXAKaC2PcHQpMML
	OpwMwX+h7nRQsYXZfWDt8oPvWDUIVSA==
X-Received: by 2002:a05:7022:31a:b0:128:d24a:a5ba with SMTP id
 a92af1059eb24-12a726cafe2mr3483365c88.20.1774187884248; Sun, 22 Mar 2026
 06:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260311094929.3393338-1-wenst@chromium.org> <20260311094929.3393338-4-wenst@chromium.org>
In-Reply-To: <20260311094929.3393338-4-wenst@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Mar 2026 13:57:52 +0000
X-Gmail-Original-Message-ID: <CAAOTY_86VxSUmNisk5aiapTNUGFGUu0gHr76E0RKKT0pd1mr-Q@mail.gmail.com>
X-Gm-Features: AaiRm51YKpNxHHSZ_HLZmjHIKksalh8pxeIcHKSYGkrLrVcQdpuypJr4oUdO1Tc
Message-ID: <CAAOTY_86VxSUmNisk5aiapTNUGFGUu0gHr76E0RKKT0pd1mr-Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/mediatek: Set dedicated DMA device and drop
 custom GEM callbacks
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-sunxi@lists.linux.dev, 
	Paul Kocialkowski <paulk@sys-base.io>, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_065806_068333_1396C724 
X-CRM114-Status: GOOD (  16.92  )
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

Chen-Yu Tsai <wenst@chromium.org> =E6=96=BC 2026=E5=B9=B43=E6=9C=8811=E6=97=
=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=889:50=E5=AF=AB=E9=81=93=EF=BC=9A
>
> In commit 9b54a32c7c6a ("drm/mediatek: mtk_gem: Partial refactor and
> use drm_gem_dma_object") the MediaTek DRM driver was refactored to use
> drm_gem_dma_object, but custom callbacks were still needed to deal with
> using the first device of the pipeline as the DMA device, instead of
> the MMSYS device that the DRM driver binds to.
>
> Turns out there is already partial support for dedicated DMA devices in
> the DRM subsystem for PRIME imports. The preceding patches add support
> for dedicated DMA devices to the GEM DMA helpers.
>
> This allows us to just set the dedicated DMA device for the DRM device,
> and drop all the custom GEM callbacks. Also drop the .dma_dev field
> from the driver private data as it is no longer needed.
>
> There are slight differences in the mmap helper: the VM_DONTDUMP and
> VM_IO flags are no longer set. Both were lifted from drm_gem_mmap_obj().
> VM_IO probably doesn't make sense since the buffer is allocated using
> dma_alloc_attrs().

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Also remove reference to mtk_gem.c from the Makefile
> ---
>

