Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF42CFCD0AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 04:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80+DeSHfpGw14VHMOKDxWgqpCc09RBagpWieMKMRPqo=; b=zZ6QN1JqS7demCGBoBdvbni8i3
	+QVSP+QlK0LMw5eomNfbg+bt5ATMZqao2TJTCFa1Krs1TEWYUun/JxgRqWsXrCZWhf0yCG1lYUkqU
	D9PAJ0DF6gnFlX6bb3W3dSLSg72/TgfZ+ttEDyz3KofLtsYwpVyU0gkHfyn+P5t0Nk0QzylVvyq7f
	GAhgwGrwr61BWxuWeXi6NfQBdAm2LXUoewtGY2zj3Hd1ECwBg/vOsZZcdGvm3WSzF8h7Xz5PMWdeg
	EQxRwCwwC/WgO+Y4RVqrPyne5kHH/i4U3dGFbeQw4WoV5n9GtCYdW8lgeR0gxrBCrE5mCh9JDvh62
	zZuQq6zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2iy9-00000007mHN-0Owu;
	Wed, 18 Mar 2026 04:57:21 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2iy5-00000007mH0-2CNs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 04:57:19 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-59dea72099eso7645583e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 21:57:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773809835; cv=none;
        d=google.com; s=arc-20240605;
        b=dzdRGzSeJ+zBIoGdAoJ9ib4xGEgj9YxjVgubct5MG4W1njA24RTaeLOml11EGK0eDs
         eRy6Vfa4fLvrIKISq97Ps78aNVu493PA0+/gDGDvh5DpSK1TeSAWk39rMqo4z62wjo3f
         h2+TXCcQsZEWj//pedt/86MQyZuTrYiKz3Dtv84MhhDjL6WeY5f5ixgJcUg0zUtG5XdK
         8sHRRqy4yBxpGdT8ikMrzliPN3leZ9qGKhu2RtJzCh1XLHHuTez25QO/r3KQA/dXiKJ7
         RVEsDcWKdpOkGaXHmvN3dWa6O5xng2FkjlODT/bBEcBz/vhqa7qRjyaVFZbSz/wfuJIc
         Gy/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=80+DeSHfpGw14VHMOKDxWgqpCc09RBagpWieMKMRPqo=;
        fh=AxV+Kdd7egUgyXue0z0u/0M3IA/ssv1B2fuepBB98AQ=;
        b=b/Wxr7By3Mm6m7lEIbrU300Q1SluCF4HrrrW6MTYgkcF9zMtGdR+07MyoMlgf/SgkR
         o6Czl9963auYorJhrrJU8iaX706BsM0l985xhpqwL9uAWpha/Z332ncvslrfh79jg9Da
         pOh2k2SDM08TpQOGoJ+LQC3V9uXo1ENPTdTtVYAJxgmQnFnNrM86HJAqnen20eqr6OzQ
         p1MOQ8Y66z8pKVIPVrALX3lhFXyUjhDdedT6nV0ZIHXCVXHJxw0R7AUyF7r91TjLPN/t
         exQpu/qrS2dvt9GQwQplt6j1+g2V/mZhB09biVlXCKPHkjyBequl4iM4ISC8WAVu/9rl
         X7JQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773809835; x=1774414635; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80+DeSHfpGw14VHMOKDxWgqpCc09RBagpWieMKMRPqo=;
        b=cjh17tWfvJMmWDbry/GYhR8Lgj1OEIJx0AYrEU4UrE2FWu4H6x+sj8vTnggC0UGUFi
         SijXionL2ovF2ruLKAqHPFKuNl40d0bHaE6Nco+vfhAZcnZKx50PWtUWR3fdleJO9AnR
         jzu9f+ZL6gBzZvsbFZCWjWdfOwWOVs3fLTwWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773809835; x=1774414635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=80+DeSHfpGw14VHMOKDxWgqpCc09RBagpWieMKMRPqo=;
        b=scQ91spLN+JLOQQzojc0TEqwCaue95nZWckcdv6mRctaK6bvfGZ7RWqFZYZ2mVDzx5
         XU0s8uqZMA5dRw7nXfSQZEocRD3YdSMK59vCEX2rxGxZFwIHrqXV7ll9BoagLpaoNMDl
         bxEI6PMZP421lpgob9HEjvCGnKXMboE/sRGuBnvSMkAtMSgn1BTCm+AvN5A9EwpIVvz8
         fI6GOD8HsjXKwOnMrBV0KVoq3wZ2b0J8tJtP+H4CQeNSAGvvgxD0DGZDQXm43gT8Rgsc
         6QLZ+3EiD1PXDYEKLTvtlapK6XLxj2OSKGtx0ano2H1xQvsJ/+7k8fFw0XD8UlVcGiXw
         DhoA==
X-Forwarded-Encrypted: i=1; AJvYcCUEJsZ439RdhoUkvMb+tHplwBHCxH1ttcDBXJlWYdRDuOxsOA7vJ8oHFmLc0H8iISkcdhcmIHcING+GK/vp9ojL@lists.infradead.org
X-Gm-Message-State: AOJu0YyDPA3VC6O5ktfrT2HiXxPaAWK4h1+n4cyAzdEx4WP4qehqmGoN
	WhsKZNjz4mcv/H1Jfuj3IyhKMKCQ013VK7kbyDjZPLUe+lswY6tZXNEUM7dPjQzu9B22Re/CoK9
	BkEkfXREO5+Atvyx7TPoas/iMO4eFDVHp8LtGLXqo
X-Gm-Gg: ATEYQzyMqO8wcTe105skEF5YA8Tqpi2wQbV3Th5TyzX/zpC+Oe93Q6jNbhyMXLZVyrs
	X+0rLwpXnSOMjKofKEzpUu39Wb50p6X5Bg21UysmoLc2xnIsjTZsrdaTdgW4GyDhBnIs8N2p1zv
	xtkaOxjSnds6kGTAK90tx4bdCqQmphxOwjlolqsaGlqm3+BfM7xkuOTHdaqI7URniLbziNraqNT
	yCLENisd1EeXtYUwpw31mEb1wHhD2Bnkb8nZdMDm54YbHG2j1bKM/im8YA/AO3MEoqlLQN06EyM
	8f+9YKp6KyABfalJMtbJb073cExTqWGb5SBWOg==
X-Received: by 2002:a05:6512:a8b:b0:5a2:7b89:4c74 with SMTP id
 2adb3069b0e04-5a27b894d35mr123751e87.44.1773809834836; Tue, 17 Mar 2026
 21:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260317064049.696795-1-wenst@chromium.org> <20260317064049.696795-3-wenst@chromium.org>
 <607daaca-79ed-45b2-941e-1680a17618e8@suse.de> <CAGb2v66D3=s9c8oJyYEAK90A4SekW6FjLUpWBGRHnJwtfMvUeg@mail.gmail.com>
 <ada8ca6f-a2f2-4f8c-b916-f6dc24db6db5@suse.de>
In-Reply-To: <ada8ca6f-a2f2-4f8c-b916-f6dc24db6db5@suse.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 18 Mar 2026 12:57:03 +0800
X-Gm-Features: AaiRm51ndr8wIN1dFRJ0R2AdD-JeDrk9Q9pyem8o1kiOTDGC041zyMgTjZn4ekE
Message-ID: <CAGXv+5GUmCEDM9XcOgHL5EKNhZMNc5RTdeheqLAT0CFp=qJavQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm: Introduce DRM_MODE_DUMB_KERNEL_MAP flag
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: wens@kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_215717_899307_56D2A9F8 
X-CRM114-Status: GOOD (  29.97  )
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

On Tue, Mar 17, 2026 at 8:24=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 17.03.26 um 11:58 schrieb Chen-Yu Tsai:
> > On Tue, Mar 17, 2026 at 4:12=E2=80=AFPM Thomas Zimmermann <tzimmermann@=
suse.de> wrote:
> >> Hi
> >>
> >> Am 17.03.26 um 07:40 schrieb Chen-Yu Tsai:
> >>> From: Rob Herring <robh@kernel.org>
> >>>
> >>> Introduce a new flag, DRM_MODE_DUMB_KERNEL_MAP, for struct
> >>> drm_mode_create_dumb. This flag is for internal kernel use to indicat=
e
> >>> if dumb buffer allocation needs a kernel mapping. This is needed only=
 for
> >>> CMA where creating a kernel mapping or not has to be decided at alloc=
ation
> >>> time because creating a mapping on demand (with vmap()) is not guaran=
teed
> >>> to work. Several drivers are using CMA, but not the CMA helpers becau=
se
> >>> they distinguish between kernel and userspace allocations to create a
> >>> kernel mapping or not.
> >> Any dumb allocation might require vmap. This is not limited to interna=
l
> >> buffers.  Because if the dumb buffer is shared with another driver, th=
at
> >> driver might require the vmap for displaying the buffer content. There
> >> are enough of such drivers.
> > By sharing, do you mean exported via PRIME then imported by another dev=
ice?
> > Or just passing around GEM objects within the kernel?
>
> I mean PRIME/dma-buf sharing.
>
> >
> > And could you provide an example?
>
> Create a dumb GEM buffer on one of those CMA devices and mirror it to a
> display or udl device.  These devices have no means of scanning out the
> provided buffer directly, so their drivers vmap the buffer and copy the
> pixel data into their internal memory (via a peripheral bus). The vmap
> call happens via the kernel's internal dma-buf interfaces. Hence any
> driver needs support for vmap if it wants to support this use case.

I see.

In that case would it make sense to limit not setting this new flag to
drivers that already specify DMA_ATTR_NO_KERNEL_MAPPING? Or rather
inverting it so the default without the flag is to have the kernel
mapping. It would be opt-in rather than opt-out.

This includes just exynos, rockchip, and previously mediatek. Having
this would allow moving them closer to fully utilizing the GEM DMA
helpers without changing their existing behavior.

The flag was removed from the mediatek driver during a previous
refactoring to move it to the GEM DMA helpers, but I think it was
a limitation of the helpers, not an intended change. Angelo might
be able to provide some context around that.

Or maybe I just keep the dma_*_attr() conversion patch to satisfy
the needs of the aforementioned drivers? What do you think?


Thanks
ChenYu

