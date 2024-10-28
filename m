Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AF1D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 07:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cmwyegq7pd+RNDhv4uH4MzNeE4hWCQOLImM4aqdf6HM=; b=1dFZh76T4JtioXRwJFuMi+CLf5
	U/OkXZex4pB7yCqgkRv+qzuMfdLjqbqD2tQSIXxJH7WlTwgL5eCptnSWfSna00thzmgSZ8WKVDsQT
	sAE5C6kCmSFJWE2YOzJlLLXgAiXL7MuOfHhkCjuBpANE3Rgze7H/EH/3H7pceF4vL1o14i8hm7uTz
	ITgcyrxkcljPKoTYs0lJf6HdsC9xpBT+JSWaEJ+3uKPWChb3hKiMmh6Nv378kjtr4L5EbNA4V+5Tm
	TnBfLjTO/B5JgqudNDpnvqvW0wwAsJlrsh0VQgL1v/Vs2hVjeClIAayl47Ty0b1IzFMPU5hzTQQdX
	ZU0Y9ftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5JnB-00000009nal-2Ume;
	Mon, 28 Oct 2024 07:03:57 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5JkG-00000009nI7-1zEn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 07:00:57 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539e59dadebso4581005e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 00:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730098854; x=1730703654; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cmwyegq7pd+RNDhv4uH4MzNeE4hWCQOLImM4aqdf6HM=;
        b=KHlRqjYMDcnlcnCv0o2u4InCEWIFpIULku7zr69hLr6+hO9rF62NJy/vEBk9q+UxAm
         5k+CMV36AcwZwLTrsrCjcf/10ENuqQIL7IlE1eU71YuoGhgTuj5roys7TAVGN9G8Pcao
         wY1PXV/VPz+VaSiVZLElHcol3O+3y4P4beF5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730098854; x=1730703654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cmwyegq7pd+RNDhv4uH4MzNeE4hWCQOLImM4aqdf6HM=;
        b=hPrBRhNIL8jiDY3lPJ4UyB6Y9g/HMgQ7qZtMcWKsS3wy6cp5P0JZZ27O6ytqJiXNke
         Cr9CbqiEAfQqqnIDxFAGNjsx+bIB9rbshbHOjlmA27R3lPEblg3oX/tDUpQESWO6J30c
         1vym/Y2N7HC4VquWcURQyM+CCRXUDwAyP+dIgRZqCV2tfVTyyj/sGXRkISqmeuQolw7t
         v6LozNrde82bdkIJOzlVMvibktDXCGBJJnRMNJEPWlkMuIs9hcZHIiBU9eC6z5Dj9GW2
         SVtwCArMinkwwWtSEwwhPZH0XlK0Ut77KImmYB2pJe/FBBYmC/bICAJj6A9mAH4fV0AJ
         vSqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWB3DTeg+XJB5sFkUXshwB6k+7WaLhrwnHG3ykdGQTKrumElwfQ6qt2/2t4ZkNsEX2iE07rwOSVdJ9kfdIL0aPT@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwef1T6NX0a6j7IOoMTmYTeksGw9wIb9wlCdhSjCxyqTpC8/4P
	gaJvmisF2bkfG6HXDWbX5rPWmnK+LNsLAm+AUfc13NhuwSTyxVeMLdoigUNltU+L3twouOwC6g5
	GtiQEp/PHvJNhn1oBggSmJAD3+0NNwHhdOsZs
X-Google-Smtp-Source: AGHT+IFCTK/9t8GApx2c313ElibGHVQt1aCzEHXMhwQB7y5ngpH9maQprAhY8bEpEJF/nzrqaJAxSEh5HOrX6QHHt28=
X-Received: by 2002:a05:6512:3ca7:b0:539:e873:6e2 with SMTP id
 2adb3069b0e04-53b348ec22cmr2169421e87.8.1730098854425; Mon, 28 Oct 2024
 00:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com> <20241011-mtk_drm_drv_memleak-v1-2-2b40c74c8d75@gmail.com>
In-Reply-To: <20241011-mtk_drm_drv_memleak-v1-2-2b40c74c8d75@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 28 Oct 2024 15:00:43 +0800
Message-ID: <CAGXv+5HAXuqxZM+CwfseXbAr2bsPgP__wc34mfmiJfui_fLOOw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/mediatek: Switch to for_each_child_of_node_scoped()
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
	"Jason-JH.Lin" <jason-jh.lin@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_000056_558367_1E951F61 
X-CRM114-Status: UNSURE (   9.75  )
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

On Sat, Oct 12, 2024 at 3:22=E2=80=AFAM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> Introduce the scoped variant of the loop to automatically release the
> child node when it goes out of scope, which is more robust than the
> non-scoped variant, and accounts for new early exits that could be added
> in the future.
>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

