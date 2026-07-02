Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFDEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 09:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zTpKuSZrhsxPxzQIZfaOOpTGT1+k7Nb+QD5Zs9kC3Q=; b=vbPo+ByOUl1dFaB+ipFJnk99dV
	1TA8oW2OtKZg3PkBsf5FEfMg1zXfD7sU1uUP1GESJMbZo4iQOgh7DP76UKCSR5wj2qIYwRO13I5I2
	bb437kHLpnpo2BwLOXLV5JaWLYqszr3uzQAHFXHrllLxPPT8otg8/put2PofqOBFF4Zwz6hvscs3z
	laRfumKIuYhMXNko6UhXa4rd6lQJ+s2PeEGHXOIQjTLOosnid4KzawTnYaH4x4RxGwyniEDUTDczz
	zhCC4Bx87xsjLuJ/1TSxcJJP/VIvpcsQ/LG7tAkeKILiO5hXMQms3pJ61WyNE1GUEMdkqh6JLrp5t
	CijD/p/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDfd-000000040er-0OQg;
	Thu, 02 Jul 2026 09:25:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDfZ-000000040df-3sss
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 09:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782984316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4zTpKuSZrhsxPxzQIZfaOOpTGT1+k7Nb+QD5Zs9kC3Q=;
	b=dq6TKe1tmJPNYt93CyYypKbmUo1wecTp37NGsCDX4tR8DgCBvKuWLBiDXvth4h+R+zzJBu
	p6agMB227/JKimXugX3coSMnqGlDBCdypN7Rk8ep/PSNCl7fUCsDjPQ9bOL+oF7k3ToHdo
	d7D4jxXwNoH9/LGK9lrxZKjYln5l+bI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-cGKI7je5PmmXH9iBPmLWjg-1; Thu, 02 Jul 2026 05:23:45 -0400
X-MC-Unique: cGKI7je5PmmXH9iBPmLWjg-1
X-Mimecast-MFC-AGG-ID: cGKI7je5PmmXH9iBPmLWjg_1782984225
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49260d6eaadso10405085e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 02:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984225; x=1783589025;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4zTpKuSZrhsxPxzQIZfaOOpTGT1+k7Nb+QD5Zs9kC3Q=;
        b=g00s+mzVJxyBCSBo2SuTXiTUYJmW0cLlhIgykuDvtXlPh3R7OeRpPybpYWPvVLGY6O
         9D/HaAbLj/au+8zdvrmUDiXcSKu3iufcqeTtvfGv+wHzfRuZDeXVzwA3CI8BhUBmpmWG
         EbJlK00tup+dCbmurLTN2sX/lVymxLs0BfeZ1fqCqX8yaq3/A44ciVCwzst6DQB6nBwo
         9sJytNWV76K4BkFR1fqK3ZKduYSYPp1Mp5Q4iduEPolYF4nbiRwQ8odZsnnjZYDI/S2Q
         BLtf5woBMdTqZaRDeZ/vHzz4wGcVv6a1e7TxTYZDL0Or00KuKuEcpYjEfIGIkxhIXlT1
         1E8w==
X-Forwarded-Encrypted: i=1; AFNElJ9QcQT8+bb1y+4JdB5b+68byKTJ4S+usOrxMnCg6imZA+5ME8oevFvoggaBvQGMTeNNj307M/WA21Cr/sAMo39U@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7n4+F+S6Aw0RpAlWnRsbmFA/+1YhyLiGsF0pIPEW9+Puwl4lc
	mGuJpjJkIHCQ+IHIfkrEIWtBPRreQXGrgLNARgecfX+b05pUBUPdi6QFdE8zVc5TWyOo51rDNzB
	mp6RBxjZIbYs2gXMaQDC2/YLKPrcGb9t0aQBM4+L4uiyt303eS81pgfdS5RrRoi6B0DRuRjZUQQ
	vz
X-Gm-Gg: AfdE7cmuuoagB06/+soMiWp7tUkjJ86+NYGWotaYdf8MPjkLPKYQlX/iK9OO7ZqPcOB
	nV9xL0FzhvmESQAf1cS6EYXyhYDFhBBA3A81lsHR0B0ZrbsoEtupu2QVzTbU6pFR6CZAjjxQhqU
	QpNAR6zPjyUfh3sd2u+AMfYPms+b5ctfCTK2B/qGuQ90tSge1vvr+OHEnLmhZh9SLTKilKO4R2o
	3v0BUi4kvqhJG45xrVjKnTy6biFlQCaSYsll2HtvvmwdO02UhhSNexrJiX5bm74fM3ypQ02Ab3z
	r/plJZ0Uyr+XvjFocNyT1E2g4e9TfxHaZOsmsOv65QgWHoIltzTwOrft2xtnHVY7kXtDhDcIcrM
	ELswM0ViANBhArUavjhTIKUBHxA2hztAntLsrYzAeMAYnGgs9L5/p2UPXiDz6ZH923NFeVA==
X-Received: by 2002:a7b:cd83:0:b0:492:3e44:214b with SMTP id 5b1f17b1804b1-493c2b4fff8mr50363685e9.13.1782984224685;
        Thu, 02 Jul 2026 02:23:44 -0700 (PDT)
X-Received: by 2002:a7b:cd83:0:b0:492:3e44:214b with SMTP id 5b1f17b1804b1-493c2b4fff8mr50363325e9.13.1782984224177;
        Thu, 02 Jul 2026 02:23:44 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6368f89sm30642055e9.8.2026.07.02.02.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:23:43 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Diogo Silva <diogompaissilva@gmail.com>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan
 <andy.yan@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Diogo
 Silva <diogompaissilva@gmail.com>
Subject: Re: [PATCH v3] drm/rockchip: Remove dependency on DRM simple helpers
In-Reply-To: <20260608124018.480365-2-diogompaissilva@gmail.com>
References: <20260608124018.480365-2-diogompaissilva@gmail.com>
Date: Thu, 02 Jul 2026 11:23:41 +0200
Message-ID: <8733y1d9sy.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eNiRlrgC_H8nOU7HdHUO9Md8ERNasXooRbynA6DZPPI_1782984225
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_022518_038699_30B16031 
X-CRM114-Status: GOOD (  12.65  )
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

Diogo Silva <diogompaissilva@gmail.com> writes:

Hello Diogo,

> Simple KMS helper are deprecated since they only add an intermediate
> layer between drivers and the atomic modesetting.
> This patch removes the dependency on drm simple helpers from rockchip
> DRM drivers.
>

I think that would be more informative to say something like following:

This patch removes the drm_simple_encoder_init() helper usage in the
rockchip drivers, by open coding it and using the encoder atomic helpers
directly. This is a step to eventually get rid of this simple KMS helper,
once all drivers that use it have been converted.

> Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
> ---

The changes look good to me:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


