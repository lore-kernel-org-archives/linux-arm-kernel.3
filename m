Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A30CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 13:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=foZUSSCn3mw3igbjhG/ByovMp3TLwfr7Tn+8SY7PdHU=; b=4kVwhQqluwIN/md5dQpMwuG4C0
	wKFGCqajDVa/pkOFaNLeQmnzlEFwsD4b/IA2kO71AY3KIgPHIRE7MOd4iuZCrNjJ35MlfG/OZ4xxh
	PEyMp2TRqABIYrfgrU2Jz4SOLTh079inIT9qK7nbuvD0EnJR73vuQtvEZj7omyq42pDSRjEc+UkjN
	4fQiEHGcs9sqy0Mshy3/wn2JoEk559Ux4rUgRAIiVBsQ3RVfSqC3nBViMndTzQIm8EBVr7YF5XBHJ
	WqChB0Qeq5qvVqZiV5ONquInTDNaTLINF87Np+sgpZ3k1xwecOfQm7QHqAJpDX/uwQ3SBnDjHeaPg
	yAOyObpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxTa-00000007SqT-2W3W;
	Fri, 29 May 2026 13:42:14 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxTX-00000007Sq5-3UtY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 13:42:13 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-6c36543e834so97832137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 06:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780062130; cv=none;
        d=google.com; s=arc-20240605;
        b=hwII1pwf9hXR4rFC/aU2x9XU1V9LoHLKH6NhO+tK2IPDGmKZrcVDv7mX+t76ZduCKh
         dvUTs2QlIekXag9JPueSZqPqIrBdkxvRBp+POM748dcUCIqPWBrE8q7X18bfwj7vgQXf
         rduvyQbV8us2oZ1F4bFur+D4Sh/mHmvM0IWhYuI/L1SxH4U2IER0Q3KGNuJCJa219hAy
         YvB1O/iTAd8HFK2qEDDClKphK8z7VL9DnLod82830tjDNYyDtzGKylgTxLQZpLb6JG74
         zmr1cLtXon6vR6+Act0lBaay/66deQVa7liAPdeITH/IBqqTNJPLYhRy0xFbAiAMuu/T
         eeiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=foZUSSCn3mw3igbjhG/ByovMp3TLwfr7Tn+8SY7PdHU=;
        fh=BDQrkuDcrrmQ+K1xa0SYMJmsH7dt0Y2GtljWGCkmp3g=;
        b=MXCZ1adnduvpYYZKuTsrTrdlfTdoIsXVq0y9tPykkzblnDS/IKlm0foR2yQXLKx8hR
         mKI+L24bjkTKY7mhVJ9EduV3ypTc6W5drUXnYKoA/VxZUERbungx4jmwyMEUx9VnqmhN
         PhX1+aBWP+P6IfLs32xPNInSZu0DH0NYAon/wEMDwA62d55/QlfrOqqJ9fB3M6kosunc
         U+OI3HxAX0nY6VYVQv3K05gZdhu4KpcWDLronHNiWEgZQcqgkPwy4J4F9GLFUGco+hdm
         uYj29DlwvQLumvy08bKE1zf4KEOBNZW9RcbIb6Em/N4R+dAwMEpjj/vCBZIJ/sCa5WLy
         mJdg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780062130; x=1780666930; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foZUSSCn3mw3igbjhG/ByovMp3TLwfr7Tn+8SY7PdHU=;
        b=EJSGd9yMgc9kQAD9cdlCmPMNoQWwb1zXmTs8smOW1hGmvyg9qZ5/7JjSbL9RWpAa8e
         0KVxL04ILo/tueZTU44cMRJO2/kFjFKcJHjtwtHlJM9CcElJGXBUD025yitrgDtBJhLI
         8VnGq+6oCBKgRvWiQ1TxALj1UrbCIXIsvVWvExY3QLvJJpKx5ONkXD5NcqCpCpL1KXh+
         jQh4icAEOO54wOzVImrfvXzqkn7D4UP/JQFKhtyu1YDtxZDUbF9hJbDRdvxiK72mGAz1
         KWsugIGtdonYckVCU522xazNmD9JssATwcgLvojr9tO1NydS4sdYYZIBkQAK/zXEVXgN
         zaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780062130; x=1780666930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=foZUSSCn3mw3igbjhG/ByovMp3TLwfr7Tn+8SY7PdHU=;
        b=PPjeFaPzJZfh/JyFp1TawwLpNv1qATv7lTG8Wz9nagKWDx8M5XpOStyQecLG1i9F7q
         p6paGiqH+x3794VqU7A1XmVZZ5Wm9ULAnT36WkLTO3m7TQFJiWw9QsbiiJxuJiC62qqw
         PLKFmcAe+5rk7voyW3FliXahExVj9McPm2SBB+C/91CsddF8LwM4GrcfKKMc9+lQVw2P
         N+/aZJJPVmS9klqaCQ0e4ANinGPyclioqVVoUBlahK4UuBcsZMnB2KWfXq1FJNsH4cYF
         UuhG9tEHisWE+9JYiqtCEtG1kSyQ3J9VqDKBZWhF/1SmSMRON6sxq8OECtPCqT7YirxR
         iFRA==
X-Forwarded-Encrypted: i=1; AFNElJ9dDVbqg2vp4Fjk5Osu340/TTqu6POVXwQB8Lm/BKOUd8kKoQrhGqeryQ4W+6xSZuJ5ZHWr7T/yaqaOO5QTEhUh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7yfdQbV2gZTM8KBgf66JW9mvVQnzPbX6Mc0+LsAZCVl4r5OGB
	oTTXn+O9z9rYShbndJ0rVVM5I97QRbf0/EZuShpuTtLdNoZO60PO6kU0fcFvaXeUo6jZoF0fsLp
	IkiAoPTErzuaOIhfpZr9fIYVNqKbTG7Y=
X-Gm-Gg: Acq92OFDTzOEdgs/AevcA6XOsb39dlZcq2l6GsX2CNJSA8lEInHOnzJQVXU+zMqL/dR
	MtJxo+Zr82m34gle9rd/+99vy/10dOo8V2DTHELZc1he4d6XV8UsdyzvptVhk4rgXUxk6uyWzfK
	3s9guZesL8ffbjZkI0GudkaJRIHhbZezhTuNq1JMH4oN6oANyf9CIw0S9OLMHWuzQLVqYmheuMA
	HWQUV7AEkyeVYpa39xt7FYzJe/3zdvxRox2j+Ax3W00kkHWJszYz2hjmYntLT3IwS780Lhn5FtE
	g/ueOWkprcVYR0ZwKgvvqcW0BUWjL3TVUpWlhJyRrSn7pn/e
X-Received: by 2002:a05:6102:3746:b0:636:c0c:4d91 with SMTP id
 ada2fe7eead31-6bf41448d48mr1182976137.28.1780062129815; Fri, 29 May 2026
 06:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260527194525.45762-1-arnd@kernel.org> <CAGXv+5HvJiTkLJMZ13w0OHwgp+nPBftGAC-15nhJ3R=vOPWpUg@mail.gmail.com>
In-Reply-To: <CAGXv+5HvJiTkLJMZ13w0OHwgp+nPBftGAC-15nhJ3R=vOPWpUg@mail.gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 29 May 2026 22:41:34 +0900
X-Gm-Features: AVHnY4JvF7WCaYgOFVyNLTbyQStc4V3bgFlseC90wq5uN90mEmMwAwiliM8N3JY
Message-ID: <CAAQKjZNoGC_9ratL7+FjNiQk+MkOE7p=yg5ECQA+ih1trGw8cA@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fix size_t format string
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_064211_884198_BACCA816 
X-CRM114-Status: GOOD (  25.35  )
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

2026=EB=85=84 5=EC=9B=94 28=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 6:05, C=
hen-Yu Tsai <wenst@chromium.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, May 27, 2026 at 9:45=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> w=
rote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The exynos_gem->base.size argument is a size_t rather than an
> > unsigned long, so adapt the printk() format string accordingly:
> >
> > In file included from drivers/gpu/drm/exynos/exynos_drm_gem.c:16:
> > drivers/gpu/drm/exynos/exynos_drm_gem.c: In function 'exynos_drm_alloc_=
buf':
> > drivers/gpu/drm/exynos/exynos_drm_gem.c:69:49: error: format '%lx' expe=
cts argument of type 'long unsigned int', but argument 6 has type 'size_t' =
{aka 'unsigned int'} [-Werror=3Dformat=3D]
> >    69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx=
), size(0x%lx)\n",
> >       |                                                 ^~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
> >    70 |                         (unsigned long)exynos_gem->dma_addr, ex=
ynos_gem->base.size);
> >       |                                                              ~~=
~~~~~~~~~~~~~~~~~~~
> >       |                                                                =
              |
> >       |                                                                =
              size_t {aka unsigned int}
> >
> > The dma_addr in the same line is already printed using a cast
> > to unsigned long, so change that similarly to use the correct
> > %pad format.
> >
> > Fixes: 11e898373fba ("drm/exynos: Drop exynos_drm_gem.size field")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> I posted the same patch [1] one and a half months ago when the culprit
> patch was queued up and I got a report about this from the bots.
>
> Inki hasn't picked up my fix yet.

Really sorry for this. I missed your patch.

Thanks,
inki Dae

>
> And it seems the exynos-drm-next stuff was only merged into drm-next
> yesterday, now causing the warnings to pop up all over.
>
> ChenYu
>
> [1] https://lore.kernel.org/all/20260408064936.1342321-1-wenst@chromium.o=
rg/
>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/=
exynos/exynos_drm_gem.c
> > index 297a93b087cd..8e357f2beb9e 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> > @@ -66,8 +66,8 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem=
 *exynos_gem, bool kvmap)
> >         if (kvmap)
> >                 exynos_gem->kvaddr =3D exynos_gem->cookie;
> >
> > -       DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(=
0x%lx)\n",
> > -                       (unsigned long)exynos_gem->dma_addr, exynos_gem=
->base.size);
> > +       DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(%pad), size(0=
x%zx)\n",
> > +                         &exynos_gem->dma_addr, exynos_gem->base.size)=
;
> >         return 0;
> >  }
> >
> > @@ -80,8 +80,8 @@ static void exynos_drm_free_buf(struct exynos_drm_gem=
 *exynos_gem)
> >                 return;
> >         }
> >
> > -       DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
> > -                       (unsigned long)exynos_gem->dma_addr, exynos_gem=
->base.size);
> > +       DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%pad), size(0x%zx)\n",
> > +                         &exynos_gem->dma_addr, exynos_gem->base.size)=
;
> >
> >         dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exy=
nos_gem->cookie,
> >                         (dma_addr_t)exynos_gem->dma_addr,
> > --
> > 2.39.5
> >
>

