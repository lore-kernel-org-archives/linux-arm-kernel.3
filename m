Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C0ECD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 10:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5uo6wkwn+JKE+tD6L/Er2v5SeX7iezWGUT0Vd+Sn2s=; b=Hrwm9yZF6+riUllKFZsZbWBKsj
	W9NCFddzgRIkmCxGkGOAou+PwQ6LoeMXpymYgZdTt/2pmnsjq6MCnFN6ZRImFRMBaqFOPFyjznxze
	W2SCK3a7gLOk5g93fr1M+9EZ5YejywssumDVxIldnpittyCcnJJHuh6pO3ZcddJB772LcdmWWy6TY
	Cl+Bfm+BiJ3JcK8aRhoWoJm1VlMHgueiVQBxIQt7c22VjpjifSPv8QR0r9MMGv9cfG4ADomn/QEQg
	/HXu2kkZMuV7cCgHoXzAXCmFvCiQc1EdnYeYmRDT87tPAFduD9dW15foW+80ejvuU3/YS9PTPSQQe
	VXuX08eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSYOv-00000005cLN-3ldM;
	Thu, 28 May 2026 10:55:45 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSYOt-00000005cKt-24kc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 10:55:44 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so9348214a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 03:55:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779965741; cv=none;
        d=google.com; s=arc-20240605;
        b=dsLm+gqGUg6pMV5F9sLBiSAbMDBAPSHvdgflQFo86OJ9vYM/J5TaZFTrAzYwFREv8g
         lOZrD3NmYdvimzk4XDVdzPJAhssPS7WTudSsw5r4GD3f1GnLb87F4oUGWJ5/TI21efXY
         JCkEWRKP2BVcbcoGO1QiXZjco2t3eTqToZ2EmEGZp1XTiRVyqZBWASIMUiHZpMg18rnT
         JWABoV9EZC4rR5/oIWD6aTdTnxf7umRtM2E0eR/HkZ444YL9/D3uUKPFoyONJFbzYI8N
         WiyJegI36mO3WWGGQWikBKJ2LjvhTlqvEATy19ThDjlfUfnfLMn5LY/0e+45G8wBHJqg
         5DLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d5uo6wkwn+JKE+tD6L/Er2v5SeX7iezWGUT0Vd+Sn2s=;
        fh=RMuyZ8Yr48RMJBS07XLU1OTlPd9PofZoikLQC4443oc=;
        b=cE+5T34IteqzEdHGe789Ll+UxelJDa/0FC9GyXfDChehJkXPeZp3bjo6KlubzBy+FS
         O0BzLX2rVQLIZ/mE6EKgXqHEudWkTCEOf05JCFDhiYaONlsrbfagsZVsUQDEh7DT/igB
         g7QSJkx5OxThMG0I0/szNbOZwRkN17e+n1e9K7Fyvs69BKtqm5Q8T3nXTVy/1DGlqFZQ
         Jo43F+2VuWZ1n4MwuglxtdoOLdlOpM8TzpXUf0AjVN5F0GvJl8CUl3BnW2d51uU5REox
         kPm0LF43qMaIiYW9O1J/imzcf3eiAtyqlOG227aB2C8i2YctlGfQNK0zgVaeJga2SHDw
         S5pA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779965741; x=1780570541; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d5uo6wkwn+JKE+tD6L/Er2v5SeX7iezWGUT0Vd+Sn2s=;
        b=tgKHr/NLwqByMby8CKDw8KIjj8inei1dS0fJJFdrMDbOzsbITCCcbbZu+xI5R+YXHf
         AbZRl7qsBgIV3yA+uMuAvnbAy4c64scn4HMvQTmm6xx7ZVKljBKR523KUq4jFj7XUdzZ
         HL5vhseMpjIGkvPnJTeCg7E/6rAlJnqZsL96O/tqOjuhMIrpDJiuWDbUIhV1ck7BO8hd
         qD5EFEcPG877i0tKKVS4mEXR2IBdY8e14iqD9naRM2t9h95ZoXjwf7aqWnhw4wxj0InB
         H2lfuQuiXKS5lVd0hBePzKB0+McE0khPZICBrfX01JlRjQ9Gzv9UELqdPEVz5zvum5+A
         TASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779965741; x=1780570541;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5uo6wkwn+JKE+tD6L/Er2v5SeX7iezWGUT0Vd+Sn2s=;
        b=Q1VN11vLPZ6dU3MP25m78VQZPqSkd3wrlunIXotC4OMVd7GeB6kXfMp5kBuo5PKEKj
         PGWk2wUnPHFZ+VYH8+n1v4KU1YR3XG7PWGqcIKuvSGJyAzq0RDX1Gc3CxOqenR09sEVy
         lTRJ4vjQ2IbUtlubGXCtTI+kgY1DpfCluWiXhUMipOVVShPn7h9fWjS9Iv6wHNbA8edb
         pmzRTUN2Usn2sBDyVQsFA+VTxlXLj7zdYKn9wSF9WAK4z7AvWpnNZGk/bBdjRnC1EUx5
         KCg/jJCZdcJeAKpagSyzmlDkFyd+vT4OmvrlwIKvMC9+1MgmYaGYArrJCMlyxfIzGpLN
         9sBg==
X-Forwarded-Encrypted: i=1; AFNElJ8jjsE0WaQa0HipoFJpVRod+02GnFTkAQBKVWCbtqN8dUdu+aaGa5S7wms3491sajgnDvcW64tNtuxbe+s0QSGq@lists.infradead.org
X-Gm-Message-State: AOJu0YxvftRdvcm1ZYjJbGh1VaHSpnZTFIfypvHTXbKQKFM9z6XY7C7A
	p72W+tN61kfT4RwluiRR2gbrjdP5HMSS/k++WkhmUpZag8jZKyHR+/OFG8wPmvJ2ZYbeGiWtPep
	c5Yx4TJJAg3kljqPXfr2JGO9WAvlBlqJGBfwh1CIGPQ==
X-Gm-Gg: Acq92OFposAIST+5vEwYnHZweUoPG0FrRcEM2HWGriGju1xbOg5ua/osHaGLQ7lGBlJ
	MKKaZC6HL4Cg60JpTA+oxYOeVdYwvLpZrkkz0axQ2pluC0iPNALylAXDyCeRYsMC/6sHc5qFGNj
	pSBp6yQhekD9xq3BZjBSbw0FHGcNV5saPKDI7nJxLULmgKMClMzdiz18DhDcZLxFKXFrQWp0DFp
	Qjp35jlz/3jJrwq4XRh7gaU2ihyvZP+uujRkofIsN/7wcq3NV+NluIiLIGtGkTJgIVpAs0CXDSg
	mNDPTwC6047kOXdzzeUrVjtOqwdJ6yVGfowL5/79PZ++WonRBEIy
X-Received: by 2002:a05:6402:354c:b0:681:5b59:648a with SMTP id
 4fb4d7f45d1cf-6889c4412dcmr16690059a12.11.1779965741591; Thu, 28 May 2026
 03:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260527194525.45762-1-arnd@kernel.org>
In-Reply-To: <20260527194525.45762-1-arnd@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 28 May 2026 11:55:30 +0100
X-Gm-Features: AVHnY4Ix0Hmm_eG6_V7iRj-xJ3NfAcKZMBspXlN6j33nPsnkEIVRn4_MuHlGmIA
Message-ID: <CADrjBPp55hZmkJMa3Lz3h=K0ZOBS-k4BY1=EmgtSYfqeCbJg0g@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fix size_t format string
To: Arnd Bergmann <arnd@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_035543_561769_DB2070DD 
X-CRM114-Status: GOOD (  13.70  )
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

On Wed, 27 May 2026 at 20:45, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The exynos_gem->base.size argument is a size_t rather than an
> unsigned long, so adapt the printk() format string accordingly:
>
> In file included from drivers/gpu/drm/exynos/exynos_drm_gem.c:16:
> drivers/gpu/drm/exynos/exynos_drm_gem.c: In function 'exynos_drm_alloc_buf':
> drivers/gpu/drm/exynos/exynos_drm_gem.c:69:49: error: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
>    69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
>       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    70 |                         (unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
>       |                                                              ~~~~~~~~~~~~~~~~~~~~~
>       |                                                                              |
>       |                                                                              size_t {aka unsigned int}
>
> The dma_addr in the same line is already printed using a cast
> to unsigned long, so change that similarly to use the correct
> %pad format.
>
> Fixes: 11e898373fba ("drm/exynos: Drop exynos_drm_gem.size field")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

