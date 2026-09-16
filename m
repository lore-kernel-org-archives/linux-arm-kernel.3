Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0C4C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLJ3zniryXoIXYXj2kORk+UpoeKS9R6ImYDJyVbdKgw=; b=ZdCgUlfwq1cKxmNXRaVDpu4FHW
	s2D01mIDEj52v/Ca7tvjfZNQqbRoztLntDJjYimd9AA5mAlx37Gj8SVhHD44vpWjrrbP8yHofjU2C
	i/6Z6s2/8IhSMGwxnxpw/ZJLyr+VKZDTgp4jhFSVC0mJR7Ol3wh7LBPSbQ5P3nSelStyOZHwBpT1X
	SHSpafcTkH9R0FhBXyl2NfLnwufIF6kU647J1ut41iICeoOLIsHgrtEPYwQxfMxx8vmUO2vzil2NW
	q30Z9RXcN5pJw/FyQdc9VPNNSdGilBKWjOun2iSohx/Ov815olSLe6wVOR5xE/SRYoxkN7RSwo8UX
	3/IiradQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lxq-00000008q4n-3QuY;
	Wed, 16 Sep 2026 09:30:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lxn-00000008q2u-3ZpL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 09:30:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789550997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pLJ3zniryXoIXYXj2kORk+UpoeKS9R6ImYDJyVbdKgw=;
	b=YCaIdDCyoE93yZmBAfESVoajo49TPwa7hyUImgklXjgAUauE0Chzl86f50GNoG1YHkECbX
	uKOo7D/Pns4ekjXFNcSGeDA73JAlN9XoMn0nntR3B7692bbvQVsqyPCtGxslQ+DCgKEJnz
	UEYk9QAiKvMY6GLKrQa4HtfSFvVHLhs=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-K5orBxq-PoaelF7xY0e8Sw-1; Wed, 16 Sep 2026 05:29:56 -0400
X-MC-Unique: K5orBxq-PoaelF7xY0e8Sw-1
X-Mimecast-MFC-AGG-ID: K5orBxq-PoaelF7xY0e8Sw_1789550995
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db22383e8fso28716355ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 02:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550995; x=1790155795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLJ3zniryXoIXYXj2kORk+UpoeKS9R6ImYDJyVbdKgw=;
        b=bhWZVxS0jBCvtQ1A/qXN9winf9Zr5ucKymZF+ksiCCOaDq9EHpV12Ib56O7/fsukvQ
         LpiQMrsdzIGxnmbrV2BxTElxh9Nswse+/8Yqfuk8wBjoJaid1QRbjbxvoL3NJ7T/tFnH
         HSOCJsm69D1TjJiZsyUIrHkr3ENQYA9941M37pV+CugrYfKEWRbw3LJ7kSYqmPvBznLK
         QiF79X//DLMpaBwBbaTgzkzh9eiVCLrEzKEeFMWuAHbpHMRrIV+rggeQILqRkITFOHBi
         YLcNk9V2RB1M7FzP/0LM19q5Z44EtaYQthewT0RKG8S3Z8k6bCYpW3+8GheVfS+JDdnV
         PaEg==
X-Forwarded-Encrypted: i=1; AKwUvByJfs0Bo1gpwklbNs9H/t7ou7+PuwbWGiBJSSg4M/VVWHtBL08xUMaR+Di4JbMAUTz49IarYhO96azI6b0TQRNp@lists.infradead.org
X-Gm-Message-State: AFuF++kHMEbLiCaRxNJ9OSOziupoPMJuAP5yXUZCh6pj61BLb72x7nEL
	aW0swB1waChDk8bYGMK7zBy/2r3EHVIcBf4FFA019EaW9u7T2jGveDipCGnf+LcyI42eTieejBm
	wooUvUFgK63zoetE9NO2gIbzhDxdh01wT6L8esY8Co3+wOTjN669nqJRwz5/S9LxbUM/fVJd6Hh
	ffdQgWzceuYVOXkwl+IUFZGuQJmasVfkqpy7mf70zeHihYyWsHWB4=
X-Gm-Gg: AYBFou1FcCn/+HdNpCtcIc6EeqxN9Dq/uTbE9U0cck5Nw1F8rgPluKj3s0PIpXNaSgH
	gwlGDcRdJI82EScebSElxH2510ZpovlXegEORvFTnwhZZmWgMj1DfXkDc1XXuNtkTLf3XQPKM5m
	Xf+fgjvcdmh0ropxe3ytAy7wlZrKoqWYpWy+ZgmMYXApN4vEYxxwEk6Z6G
X-Received: by 2002:a17:903:3b8f:b0:2d7:4bc8:41a4 with SMTP id d9443c01a7336-2dd8ea1cd1dmr23798655ad.10.1789550995060;
        Wed, 16 Sep 2026 02:29:55 -0700 (PDT)
X-Received: by 2002:a17:903:3b8f:b0:2d7:4bc8:41a4 with SMTP id
 d9443c01a7336-2dd8ea1cd1dmr23798155ad.10.1789550994573; Wed, 16 Sep 2026
 02:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260911124540.279841-1-tzimmermann@suse.de> <20260911124540.279841-3-tzimmermann@suse.de>
In-Reply-To: <20260911124540.279841-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Wed, 16 Sep 2026 11:29:42 +0200
X-Gm-Features: AcwNN1VjQRR608PaSU5v9yXg9eP7o3aE9lu55JInhqrDujLUhvS3kxSMIUXF4N0
Message-ID: <CAFOAJEfWX09ZvnQvn1+SBeW4_MaSRO2JNLfoJRGYS4jXGr-09w@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] drm/panic: Test address from kmap op for NULL
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, airlied@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, geert@linux-m68k.org, rdunlap@infradead.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev, 
	sashiko-reviews@lists.linux.dev, stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VsueOvmKiJibTfS9nCOHcdfdDWxiStZ8Q1VqFlF3nLk_1789550995
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_022959_988753_D4131C27 
X-CRM114-Status: GOOD (  15.72  )
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

Hello Thomas,

On Fri, Sep 11, 2026 at 2:46=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Do nothing if kmap_local_page_try_from_panic() returns NULL. This is
> not likely to hapen, as the previous page from the same memory area
> has been mapped successfully.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 23437509a694 ("drm/panic: Fix 24bit pixel crossing page boundaries=
")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.18+
> ---
>  drivers/gpu/drm/drm_panic.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index ba21df4be338..d28ce8878e05 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -178,6 +178,8 @@ static void drm_panic_write_pixel24_xpage(void *vaddr=
, struct page *next_page,
>         u8 *p =3D vaddr + offset;
>
>         vaddr2 =3D kmap_local_page_try_from_panic(next_page);
> +       if (!vaddr2)
> +               return;
>
>         *p++ =3D color & 0xff;
>         color >>=3D 8;
> --
> 2.55.0
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


